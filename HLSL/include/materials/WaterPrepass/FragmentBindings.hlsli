// Native resource and stage-interface layouts for WaterPrepass / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float3 varyingTexCoord5;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[12]
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[13];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[12]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[13] : packoffset(c0);
};
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float3 varyingTexCoord5;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[9]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS fragmentConstants[10]
#define RD_UNIFORM_WATER_SURFACE_PARAMETERS fragmentConstants[11]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[12]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[13]
#define RD_UNIFORM_WATER_SURFACE_ENABLED_AND_EXTINCTION_DIST_SHIFT fragmentConstants[14]
#define RD_UNIFORM_WATER_SURFACE_OCTAVE_PARAMETERS fragmentConstants[15]
#define RD_UNIFORM_WATER_SURFACE_WAVE_PARAMETERS fragmentConstants[16]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[17] : packoffset(c0);
};
Texture2D<float4> biomeBlendingMapTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t3, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T12_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T12_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t12, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T12_WORDS].words[(index) % RD_NATIVE_T12_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t12, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zBiomeInfoBuffer { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zBiomeInfoBuffer> zBiomeInfoBuffer : register(t14, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zBiomeInfoBuffer(uint wordIndex) { return uint4(rdAccess_zBiomeInfoBuffer(wordIndex), rdAccess_zBiomeInfoBuffer(wordIndex + 1u), rdAccess_zBiomeInfoBuffer(wordIndex + 2u), rdAccess_zBiomeInfoBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> zBiomeInfoBuffer : register(t14, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[index]
#define rdLoad_zBiomeInfoBuffer(index) zBiomeInfoBuffer.Load(index)
#endif
SamplerState matTextureSampler : register(s3, space0);
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
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[9]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS fragmentVectorConstants1[10]
#define RD_UNIFORM_WATER_SURFACE_PARAMETERS fragmentVectorConstants1[11]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentVectorConstants1[12]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[13]
#define RD_UNIFORM_WATER_SURFACE_ENABLED_AND_EXTINCTION_DIST_SHIFT fragmentVectorConstants1[14]
#define RD_UNIFORM_WATER_SURFACE_OCTAVE_PARAMETERS fragmentVectorConstants1[15]
#define RD_UNIFORM_WATER_SURFACE_WAVE_PARAMETERS fragmentVectorConstants1[16]
struct t14_t {
  float val[20];
};
StructuredBuffer<t14_t> sampledResource14 : register(t14);
struct t12_t {
  float val[16];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler3 : register(s3);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[17];
}
#define RD_COMPARISON_MASK -
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_pbrData
#define rdAccess_pbrData(index) pbrData[index]
#endif
#ifndef rdAccess_zBiomeInfoBuffer
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[index]
#endif
