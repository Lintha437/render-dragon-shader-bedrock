// Native resource and stage-interface layouts for StandardRed / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION fragmentVectorConstants1[4]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[5];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION fragmentConstants[4]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[5] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingNormal0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingNormal0;
static float4 varyingColor1;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingNormal0 : NORMAL0;
    float4 varyingColor1 : COLOR1;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY fragmentConstants[4]
#define RD_UNIFORM_LIGHT_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[5]
#define RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION fragmentConstants[6]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[7] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingNormal0;
static float4 varyingColor1;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingNormal0 : NORMAL0;
    float4 varyingColor1 : COLOR1;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY fragmentVectorConstants1[4]
#define RD_UNIFORM_LIGHT_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[5]
#define RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION fragmentVectorConstants1[6]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[7];
}
#define RD_COMPARISON_MASK -
#endif
