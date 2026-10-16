// Native resource and stage-interface layouts for FSR1 / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_FSR_CONST0 fragmentConstants[0]
#define RD_UNIFORM_FSR_CONST1 fragmentConstants[1]
#define RD_UNIFORM_FSR_CONST2 fragmentConstants[2]
#define RD_UNIFORM_FSR_CONST3 fragmentConstants[3]
#define RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION fragmentConstants[4]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_FSR_CONST0 fragmentConstants[0]
#define RD_UNIFORM_FSR_CONST1 fragmentConstants[1]
#define RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_FSR_CONST0 fragmentConstants[0]
#define RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION fragmentVectorConstants1[0]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[1] : packoffset(c0);
};
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
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[5] : packoffset(c0);
};
Texture2D<float4> inputTexTexture : register(t0, space0);
SamplerState inputTexSampler : register(s0, space0);
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
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> inputTexTexture : register(t0, space0);
SamplerState inputTexSampler : register(s0, space0);
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
#elif RD_BINDING_LAYOUT == 3
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> inputTexTexture : register(t0, space0);
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
#elif RD_BINDING_LAYOUT == 4
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#endif
