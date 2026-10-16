// Native resource and stage-interface layouts for TextureShiftRenderChunkPrepass / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> matTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T4_WORDS)
struct RdNativeElement_textureShiftBufferData { uint words[RD_NATIVE_T4_WORDS]; };
StructuredBuffer<RdNativeElement_textureShiftBufferData> textureShiftBufferData : register(t4, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[(index) / RD_NATIVE_T4_WORDS].words[(index) % RD_NATIVE_T4_WORDS]
uint4 rdLoad_textureShiftBufferData(uint wordIndex) { return uint4(rdAccess_textureShiftBufferData(wordIndex), rdAccess_textureShiftBufferData(wordIndex + 1u), rdAccess_textureShiftBufferData(wordIndex + 2u), rdAccess_textureShiftBufferData(wordIndex + 3u)); }
#else
Buffer<uint4> textureShiftBufferData : register(t4, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#define rdLoad_textureShiftBufferData(index) textureShiftBufferData.Load(index)
#endif
SamplerState matTextureSampler : register(s1, space0);
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord6;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    nointerpolation float2 varyingTexCoord6 : TEXCOORD6;
    float3 varyingTexCoord3 : TEXCOORD3;
#elif RD_BINDING_LAYOUT == 1
struct t4_t {
  float val[8];
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[8]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[9] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[8]
struct PackedDataRecord
{
    uint2 packedValues;
    uint recordComponent1;
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[8]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[9]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[10] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[8]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[9]
struct PackedDataRecord
{
    uint2 packedValues;
    uint recordComponent1;
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[12]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[16]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[17]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[18] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[12]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentVectorConstants1[15]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[16]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentVectorConstants1[17]
struct PackedDataRecord
{
    uint2 packedValues;
    uint recordComponent1;
#endif
};
#if RD_BINDING_LAYOUT == 0
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 1
StructuredBuffer<t4_t> sampledResource4 : register(t4);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
Texture2D<float4> matTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t3, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t3, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T4_WORDS)
struct RdNativeElement_textureShiftBufferData { uint words[RD_NATIVE_T4_WORDS]; };
StructuredBuffer<RdNativeElement_textureShiftBufferData> textureShiftBufferData : register(t4, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[(index) / RD_NATIVE_T4_WORDS].words[(index) % RD_NATIVE_T4_WORDS]
uint4 rdLoad_textureShiftBufferData(uint wordIndex) { return uint4(rdAccess_textureShiftBufferData(wordIndex), rdAccess_textureShiftBufferData(wordIndex + 1u), rdAccess_textureShiftBufferData(wordIndex + 2u), rdAccess_textureShiftBufferData(wordIndex + 3u)); }
#else
Buffer<uint4> textureShiftBufferData : register(t4, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#define rdLoad_textureShiftBufferData(index) textureShiftBufferData.Load(index)
#endif
SamplerState matTextureSampler : register(s1, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord6;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    nointerpolation float2 varyingTexCoord6 : TEXCOORD6;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 3
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
    float4 fragmentVectorConstants1[9] : packoffset(c0);
};
Texture2D<float4> materialTexture1 : register(t1);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_intermediateValue1 { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue1> intermediateValue1 : register(t3);
#define rdAccess_intermediateValue1(index) intermediateValue1[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_intermediateValue1(uint wordIndex) { return uint4(rdAccess_intermediateValue1(wordIndex), rdAccess_intermediateValue1(wordIndex + 1u), rdAccess_intermediateValue1(wordIndex + 2u), rdAccess_intermediateValue1(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue1 : register(t3);
#define rdAccess_intermediateValue1(index) intermediateValue1[index]
#define rdLoad_intermediateValue1(index) intermediateValue1.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T4_WORDS)
struct RdNativeElement_intermediateValue2 { uint words[RD_NATIVE_T4_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue2> intermediateValue2 : register(t4);
#define rdAccess_intermediateValue2(index) intermediateValue2[(index) / RD_NATIVE_T4_WORDS].words[(index) % RD_NATIVE_T4_WORDS]
uint4 rdLoad_intermediateValue2(uint wordIndex) { return uint4(rdAccess_intermediateValue2(wordIndex), rdAccess_intermediateValue2(wordIndex + 1u), rdAccess_intermediateValue2(wordIndex + 2u), rdAccess_intermediateValue2(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue2 : register(t4);
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#define rdLoad_intermediateValue2(index) intermediateValue2.Load(index)
#endif
SamplerState textureSampler1 : register(s1);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord6;
static float3 varyingTexCoord5;
static float3 varyingNormal0;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation float2 varyingTexCoord6 : TEXCOORD6;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 4 || RD_BINDING_LAYOUT == 6
Texture2D<float4> matTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t3, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t3, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T4_WORDS)
struct RdNativeElement_textureShiftBufferData { uint words[RD_NATIVE_T4_WORDS]; };
StructuredBuffer<RdNativeElement_textureShiftBufferData> textureShiftBufferData : register(t4, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[(index) / RD_NATIVE_T4_WORDS].words[(index) % RD_NATIVE_T4_WORDS]
uint4 rdLoad_textureShiftBufferData(uint wordIndex) { return uint4(rdAccess_textureShiftBufferData(wordIndex), rdAccess_textureShiftBufferData(wordIndex + 1u), rdAccess_textureShiftBufferData(wordIndex + 2u), rdAccess_textureShiftBufferData(wordIndex + 3u)); }
#else
Buffer<uint4> textureShiftBufferData : register(t4, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#define rdLoad_textureShiftBufferData(index) textureShiftBufferData.Load(index)
#endif
SamplerState matTextureSampler : register(s1, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord6;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    nointerpolation float2 varyingTexCoord6 : TEXCOORD6;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 5
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
    float4 fragmentVectorConstants1[10] : packoffset(c0);
};
Texture2D<float4> materialTexture1 : register(t1);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_intermediateValue1 { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue1> intermediateValue1 : register(t3);
#define rdAccess_intermediateValue1(index) intermediateValue1[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_intermediateValue1(uint wordIndex) { return uint4(rdAccess_intermediateValue1(wordIndex), rdAccess_intermediateValue1(wordIndex + 1u), rdAccess_intermediateValue1(wordIndex + 2u), rdAccess_intermediateValue1(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue1 : register(t3);
#define rdAccess_intermediateValue1(index) intermediateValue1[index]
#define rdLoad_intermediateValue1(index) intermediateValue1.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T4_WORDS)
struct RdNativeElement_intermediateValue2 { uint words[RD_NATIVE_T4_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue2> intermediateValue2 : register(t4);
#define rdAccess_intermediateValue2(index) intermediateValue2[(index) / RD_NATIVE_T4_WORDS].words[(index) % RD_NATIVE_T4_WORDS]
uint4 rdLoad_intermediateValue2(uint wordIndex) { return uint4(rdAccess_intermediateValue2(wordIndex), rdAccess_intermediateValue2(wordIndex + 1u), rdAccess_intermediateValue2(wordIndex + 2u), rdAccess_intermediateValue2(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue2 : register(t4);
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#define rdLoad_intermediateValue2(index) intermediateValue2.Load(index)
#endif
SamplerState textureSampler1 : register(s1);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord6;
static float3 varyingTexCoord5;
static float3 varyingNormal0;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation float2 varyingTexCoord6 : TEXCOORD6;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 7
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
    float4 fragmentVectorConstants1[18] : packoffset(c0);
};
Texture2D<float4> materialTexture1 : register(t1);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_intermediateValue1 { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue1> intermediateValue1 : register(t3);
#define rdAccess_intermediateValue1(index) intermediateValue1[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_intermediateValue1(uint wordIndex) { return uint4(rdAccess_intermediateValue1(wordIndex), rdAccess_intermediateValue1(wordIndex + 1u), rdAccess_intermediateValue1(wordIndex + 2u), rdAccess_intermediateValue1(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue1 : register(t3);
#define rdAccess_intermediateValue1(index) intermediateValue1[index]
#define rdLoad_intermediateValue1(index) intermediateValue1.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T4_WORDS)
struct RdNativeElement_intermediateValue2 { uint words[RD_NATIVE_T4_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue2> intermediateValue2 : register(t4);
#define rdAccess_intermediateValue2(index) intermediateValue2[(index) / RD_NATIVE_T4_WORDS].words[(index) % RD_NATIVE_T4_WORDS]
uint4 rdLoad_intermediateValue2(uint wordIndex) { return uint4(rdAccess_intermediateValue2(wordIndex), rdAccess_intermediateValue2(wordIndex + 1u), rdAccess_intermediateValue2(wordIndex + 2u), rdAccess_intermediateValue2(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue2 : register(t4);
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#define rdLoad_intermediateValue2(index) intermediateValue2.Load(index)
#endif
SamplerState textureSampler1 : register(s1);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord6;
static float3 varyingTexCoord5;
static float3 varyingNormal0;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation float2 varyingTexCoord6 : TEXCOORD6;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_intermediateValue1
#define rdAccess_intermediateValue1(index) intermediateValue1[index]
#endif
#ifndef rdAccess_intermediateValue2
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#endif
#ifndef rdAccess_pbrData
#define rdAccess_pbrData(index) pbrData[index]
#endif
#ifndef rdAccess_textureShiftBufferData
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#endif
