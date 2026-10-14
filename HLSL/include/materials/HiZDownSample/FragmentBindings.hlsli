// Native resource and stage-interface layouts for HiZDownSample / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_MIP_LEVEL fragmentConstants[0]
#define RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_THICKNESS fragmentConstants[8]
#define RD_UNIFORM_MIP_RESOLUTION_AND_RECIP_RESOLUTION fragmentConstants[9]
#define RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION fragmentConstants[10]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_MIP_LEVEL fragmentVectorConstants1[0]
#define RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION fragmentVectorConstants1[1]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_THICKNESS fragmentVectorConstants1[8]
#define RD_UNIFORM_MIP_RESOLUTION_AND_RECIP_RESOLUTION fragmentVectorConstants1[9]
#define RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION fragmentVectorConstants1[10]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> previousMipTexture : register(t0, space0);
SamplerState previousMipSampler : register(s0, space0);
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[11] : packoffset(c0);
};
Texture2D<float4> previousMipTexture : register(t0, space0);
SamplerState previousMipSampler : register(s0, space0);
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
  float4 fragmentVectorConstants1[2];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[11];
}
#define RD_COMPARISON_MASK -
#endif
