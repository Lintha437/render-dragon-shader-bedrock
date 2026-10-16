// Native resource and stage-interface layouts for CracksBlockEntity / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
Texture2D<float4> cracksTextureTexture : register(t0, space0);
SamplerState cracksTextureSampler : register(s0, space0);
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
