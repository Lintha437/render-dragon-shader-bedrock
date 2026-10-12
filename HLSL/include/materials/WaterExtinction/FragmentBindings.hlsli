// Native resource and stage-interface layouts for WaterExtinction / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION fragmentConstants[0]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[1]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[3]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[4]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[5]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[6]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[7]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[9]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS fragmentConstants[10]
#define RD_UNIFORM_WATER_EXTINCTION_COEFFICIENTS fragmentConstants[11]
#define RD_UNIFORM_WATER_SURFACE_ENABLED_AND_EXTINCTION_DIST_SHIFT fragmentConstants[12]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[13] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION fragmentVectorConstants1[0]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[1]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[9]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS fragmentVectorConstants1[10]
#define RD_UNIFORM_WATER_EXTINCTION_COEFFICIENTS fragmentVectorConstants1[11]
#define RD_UNIFORM_WATER_SURFACE_ENABLED_AND_EXTINCTION_DIST_SHIFT fragmentVectorConstants1[12]
struct t11_t {
  float val[20];
#endif
};
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> biomeBlendingMapTexture : register(t0, space0);
Texture2D<float4> sceneDepthTexture : register(t3, space0);
Texture2D<float4> waterDepthTexture : register(t4, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_zBiomeInfoBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_zBiomeInfoBuffer> zBiomeInfoBuffer : register(t11, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_zBiomeInfoBuffer(uint wordIndex) { return uint4(rdAccess_zBiomeInfoBuffer(wordIndex), rdAccess_zBiomeInfoBuffer(wordIndex + 1u), rdAccess_zBiomeInfoBuffer(wordIndex + 2u), rdAccess_zBiomeInfoBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> zBiomeInfoBuffer : register(t11, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[index]
#define rdLoad_zBiomeInfoBuffer(index) zBiomeInfoBuffer.Load(index)
#endif
SamplerState sceneDepthSampler : register(s3, space0);
SamplerState waterDepthSampler : register(s4, space0);
static float3 varyingColor1;
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
#elif RD_BINDING_LAYOUT == 1
StructuredBuffer<t11_t> sampledResource11 : register(t11);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float3 varyingColor1 : COLOR1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[13];
}
#define RD_COMPARISON_MASK -
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_zBiomeInfoBuffer
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[index]
#endif
