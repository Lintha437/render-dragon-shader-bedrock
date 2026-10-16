// Native resource and stage-interface layouts for EndPortal / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> colorTextureTexture : register(t0, space0);
Texture2D<float4> parallaxTextureTexture : register(t1, space0);
SamplerState colorTextureSampler : register(s0, space0);
SamplerState parallaxTextureSampler : register(s1, space0);
static float2 varyingTexCoord0;
static float varyingTexCoord2;
static float4 varyingColor0;
static float2 varyingTexCoord1;
static float4 fragmentColor0;
struct FragmentStageInput
{
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float2 varyingTexCoord1 : TEXCOORD1;
    float varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor0 : COLOR0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
