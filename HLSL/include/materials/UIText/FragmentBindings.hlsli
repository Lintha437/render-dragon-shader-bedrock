// Native resource and stage-interface layouts for UIText / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[0]
#define RD_UNIFORM_TINT_COLOR fragmentVectorConstants1[1]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[0]
#define RD_UNIFORM_TINT_COLOR fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 2 || RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_SHADOW_SMOOTH_RADIUS fragmentConstants[0]
#define RD_UNIFORM_GLYPH_CUTOFF fragmentConstants[1]
#define RD_UNIFORM_GLYPH_SMOOTH_RADIUS fragmentConstants[2]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[3]
#define RD_UNIFORM_OUTLINE_COLOR fragmentConstants[4]
#define RD_UNIFORM_OUTLINE_CUTOFF fragmentConstants[5]
#define RD_UNIFORM_SHADOW_COLOR fragmentConstants[6]
#define RD_UNIFORM_SHADOW_OFFSET fragmentConstants[7]
#define RD_UNIFORM_TINT_COLOR fragmentConstants[8]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_SHADOW_SMOOTH_RADIUS fragmentVectorConstants1[0]
#define RD_UNIFORM_GLYPH_CUTOFF fragmentVectorConstants1[1]
#define RD_UNIFORM_GLYPH_SMOOTH_RADIUS fragmentVectorConstants1[2]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[3]
#define RD_UNIFORM_OUTLINE_COLOR fragmentVectorConstants1[4]
#define RD_UNIFORM_OUTLINE_CUTOFF fragmentVectorConstants1[5]
#define RD_UNIFORM_SHADOW_COLOR fragmentVectorConstants1[6]
#define RD_UNIFORM_SHADOW_OFFSET fragmentVectorConstants1[7]
#define RD_UNIFORM_TINT_COLOR fragmentVectorConstants1[8]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 fragmentVectorConstants1[2];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> glyphTextureTexture : register(t0, space0);
SamplerState glyphTextureSampler : register(s0, space0);
static float4 varyingColor0;
static float4 varyingTexCoord1;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[9] : packoffset(c0);
};
Texture2D<float4> glyphTextureTexture : register(t0, space0);
SamplerState glyphTextureSampler : register(s0, space0);
static float4 varyingColor0;
static float4 varyingTexCoord1;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[9];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> glyphTextureTexture : register(t0, space0);
SamplerState glyphTextureSampler : register(s0, space0);
static float4 varyingColor0;
static float4 varyingTexCoord1;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 5
    float4 fragmentConstants[9] : packoffset(c0);
};
Texture2D<float4> glyphTextureTexture : register(t0, space0);
SamplerState glyphTextureSampler : register(s0, space0);
static float4 varyingColor0;
static float4 varyingTexCoord1;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#endif
