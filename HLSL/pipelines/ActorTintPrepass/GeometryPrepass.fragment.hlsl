// ActorTintPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ActorTintPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTangent0 : TANGENT0,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out uint4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1,
  out float4 fragmentColor2 : SV_TARGET2)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector0.w = workingVector0.x * 0.600000024 + 0.400000006;
  workingVector0.w = workingVector0.w * 0.600000024 + 0.400000006;
  workingVector0.y = workingVector0.x * workingVector0.w;
  workingVector0.w = workingVector0.x * workingVector0.x;
  workingVector0.w = workingVector0.w * 0.600000024 + 0.400000006;
  workingVector0.z = workingVector0.x * workingVector0.w;
  workingVector0.xyz = min(float3(1,1,1), workingVector0.xyz);
  workingVector0.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector0.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 9.99999975e-005);
  workingVector1.x = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector0.w = workingVector0.w ? workingVector1.x : 0;
  workingVector0.xyz = workingVector0.www ? workingVector0.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector0.xyz = float3(0.166666672,0.166666672,0.166666672) * workingVector0.xyz;
  workingVector0.w = 0.00392156886;
  workingVector1.xy = max(workingVector0.xy, workingVector0.zw);
  workingVector0.w = max(workingVector1.x, workingVector1.y);
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.w = 255 * workingVector0.w;
  workingVector0.w = ceil(workingVector0.w);
  workingVector1.w = 0.00392156886 * workingVector0.w;
  workingVector1.xyz = workingVector0.xyz / workingVector1.www;
  workingVector1.xyzw = saturate(workingVector1.xyzw);
  workingVector0.xyzw = float4(255,255,255,255) * workingVector1.xyzw;
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  fragmentColor0.yz = mad((int2)workingVector0.xz, int2(256,256), (int2)workingVector0.yw);
  workingVector0.x = saturate(RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
  workingVector0.x = 255 * workingVector0.x;
  workingVector0.y = 255 * RD_UNIFORM_BLOCK_LIGHT_COLOR.w;
  workingVector0.y = floor(workingVector0.y);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.yz = (int2)workingVector0.yy & int2(1,2);
  workingVector0.yz = workingVector0.yz ? float2(3.58732407e-043,7.17464814e-043) : float2(0,0);
  workingVector0.x = (int)workingVector0.y + (int)workingVector0.x;
  fragmentColor0.w = (int)workingVector0.z + (int)workingVector0.x;
  fragmentColor0.x = 4.55590157e-041;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector1.yzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR.xyz * workingVector1.yzw + -workingVector0.xyz;
  workingVector1.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector1.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.xy = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xy;
  workingVector0.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector0.xy;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.y = ceil(workingVector0.y);
  workingVector0.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector1.yz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xy;
  workingVector1.yz = RD_UNIFORM_MAT_COLOR.xy * workingVector1.yz + -workingVector0.xy;
  workingVector1.xy = workingVector1.xx * workingVector1.yz + workingVector0.xy;
  workingVector1.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector1.xxx;
  workingVector2.xyz = workingVector1.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xzw;
  workingVector1.y = ceil(workingVector1.y);
  workingVector1.xyz = workingVector1.yyy * workingVector2.xyz + workingVector1.xzw;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
#endif
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  fragmentColor1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  fragmentColor1.w = 0.498039216;
  workingVector0.x = dot(varyingNormal0.xyz, varyingNormal0.xyz);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xyz = varyingNormal0.xyz * workingVector0.xxx;
  workingVector0.w = abs(workingVector0.x) + abs(workingVector0.y);
  workingVector0.w = workingVector0.w + abs(workingVector0.z);
  workingVector0.w = 1 / workingVector0.w;
  workingVector0.xy = workingVector0.xy * workingVector0.ww;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0);
  workingVector1.xy = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
  workingVector1.xy = workingVector1.xy ? float2(1,1) : 0;
  workingVector1.xy = workingVector1.xy * float2(2,2) + float2(-1,-1);
  workingVector1.zw = float2(1,1) + -abs(workingVector0.yx);
  workingVector1.xy = workingVector1.zw * workingVector1.xy;
  fragmentColor2.xy = workingVector0.zz ? workingVector1.xy : workingVector0.xy;
  workingVector0.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord4.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector0.xxx + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector0.zzz + workingVector0.xyw;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector1.xyz;
  workingVector0.zw = workingVector1.xy / workingVector1.zz;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = workingVector0.zw + -workingVector0.xy;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue22 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue23 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * productValue22) + productValue;
    float productValue24 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * productValue22) + productValue1;
    float productValue25 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * productValue22) + productValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue36 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue37 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue38 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue4 = ceil(productValue1);
    float productValue39 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue36) * scalarValue4) + productValue36;
    float productValue40 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue37) * scalarValue4) + productValue37;
    float productValue41 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue38) * scalarValue4) + productValue38;
#endif
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
#endif
    float scalarValue = sampledTextureValue1.w;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue3 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * sampledTextureValue1.x) - productValue) * scalarValue) + productValue) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue4 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * sampledTextureValue1.y) - productValue1) * scalarValue) + productValue1) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue5 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * sampledTextureValue1.z) - productValue2) * scalarValue) + productValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue15 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue)) > 0.0f);
    float productValue16 = (productValue15 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue17 = (productValue15 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue18 = (productValue15 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue3)) + scalarValue3;
    float productValue19 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue1) - productValue16) * scalarValue) + productValue16) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue20 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue2) - productValue17) * scalarValue) + productValue17) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue21 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue3) - productValue18) * scalarValue) + productValue18) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue26 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * sampledTextureValue1.x) - productValue23) * scalarValue) + productValue23) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue27 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * sampledTextureValue1.y) - productValue24) * scalarValue) + productValue24) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue28 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * sampledTextureValue1.z) - productValue25) * scalarValue) + productValue25) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue15 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue)) > 0.0f);
    float productValue16 = (productValue15 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue17 = (productValue15 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue18 = (productValue15 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue3)) + scalarValue3;
    float productValue29 = (productValue15 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue30 = (((productValue16 * RD_UNIFORM_CHANGE_COLOR.x) - productValue16) * productValue29) + productValue16;
    float productValue31 = (((productValue17 * RD_UNIFORM_CHANGE_COLOR.y) - productValue17) * productValue29) + productValue17;
    float productValue32 = (((productValue18 * RD_UNIFORM_CHANGE_COLOR.z) - productValue18) * productValue29) + productValue18;
    float productValue33 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue1) - productValue30) * scalarValue) + productValue30) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue34 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue2) - productValue31) * scalarValue) + productValue31) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue35 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue3) - productValue32) * scalarValue) + productValue32) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue42 = ((((sampledTextureValue1.x * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue39) * scalarValue) + productValue39) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue43 = ((((sampledTextureValue1.y * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue40) * scalarValue) + productValue40) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue44 = ((((sampledTextureValue1.z * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue41) * scalarValue) + productValue41) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue15 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue)) > 0.0f);
    float productValue16 = (productValue15 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue17 = (productValue15 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue45 = productValue16 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue46 = productValue16 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue47 = productValue16 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue5 = ceil(productValue17);
    float productValue48 = (((productValue17 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue45) * scalarValue5) + productValue45;
    float productValue49 = (((productValue17 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue46) * scalarValue5) + productValue46;
    float productValue50 = (((productValue17 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue47) * scalarValue5) + productValue47;
    float productValue51 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue1) - productValue48) * scalarValue) + productValue48) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue52 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue2) - productValue49) * scalarValue) + productValue49) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue53 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue3) - productValue50) * scalarValue) + productValue50) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#endif
    float sumValue = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue1 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue2 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue6 = inverseLengthValue * varyingNormal0.x;
    float productValue7 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0f / ((abs(productValue7) + abs(productValue6)) + abs(productValue8));
    float productValue9 = quotientValue * productValue6;
    float productValue10 = quotientValue * productValue7;
    bool conditionValue = productValue8 < 0.0f;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue1 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue11 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue = clamp(productValue11, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue11 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue11, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue11 * productValue11) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue11, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue12 = clampedValue * 0.16666667163372039794921875f;
    float productValue13 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue14 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue3 = ceil(clamp(max(max(productValue12, productValue14), max(productValue13, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
    fragmentColor0.x = 32512u;
    fragmentColor0.y = ((uint(clamp(productValue12 / clampedValue3, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue13 / clampedValue3, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue14 / clampedValue3, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue3, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue19) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue19;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue20) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue20;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue26) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue26;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue27) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue27;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue28) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue28;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue33) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue33;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue34) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue34;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue35) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue35;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue42) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue42;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue43) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue43;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue44) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue44;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue51) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue51;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue52) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue52;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue53) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue53;
#endif
    fragmentColor1.w = 0.4980392158031463623046875f;
    fragmentColor2.x = conditionValue ? (((productValue9 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue10))) : productValue9;
    fragmentColor2.y = conditionValue ? ((1.0f - abs(productValue9)) * ((productValue10 < 0.0f) ? (-1.0f) : 1.0f)) : productValue10;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue1)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue1)) * 0.5f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
}
#endif
