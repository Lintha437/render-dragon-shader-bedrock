// Native resource and stage-interface layouts for PostFX.Debug.Texture2D.uint / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_DEBUG_MODE fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_DEBUG_MODE fragmentVectorConstants1[0]
struct PackedDataRecord
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[1] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    uint2 packedValues;
    uint recordComponent1;
#endif
};
#if RD_BINDING_LAYOUT == 0
Texture2D<uint4> rasterColorTexture : register(t0, space0);
#elif RD_BINDING_LAYOUT == 1
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
    float4 fragmentVectorConstants1[1] : packoffset(c0);
};
Texture2D<uint4> materialTexture0 : register(t0);
#endif
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
