// Native resource and stage-interface layouts for EditorHighlight / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_HIGHLIGHT_COLOR fragmentConstants[0]
#define RD_UNIFORM_HIGHLIGHT_ALPHA fragmentConstants[1]
#define RD_UNIFORM_HIDDEN_BLOCKS_ALPHA fragmentConstants[2]
#define RD_UNIFORM_BLOCK_EDGE_COLOR fragmentConstants[3]
#define RD_UNIFORM_BLOCK_EDGE_THICKNESS fragmentConstants[4]
#define RD_UNIFORM_OUTLINE_COLOR fragmentConstants[5]
#define RD_UNIFORM_OUTLINE_WIDTH fragmentConstants[6]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[7]
#define RD_UNIFORM_SCREEN_SIZE fragmentConstants[8]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_HIGHLIGHT_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_HIGHLIGHT_ALPHA fragmentVectorConstants1[1]
#define RD_UNIFORM_HIDDEN_BLOCKS_ALPHA fragmentVectorConstants1[2]
#define RD_UNIFORM_BLOCK_EDGE_COLOR fragmentVectorConstants1[3]
#define RD_UNIFORM_BLOCK_EDGE_THICKNESS fragmentVectorConstants1[4]
#define RD_UNIFORM_OUTLINE_COLOR fragmentVectorConstants1[5]
#define RD_UNIFORM_OUTLINE_WIDTH fragmentVectorConstants1[6]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[7]
#define RD_UNIFORM_SCREEN_SIZE fragmentVectorConstants1[8]
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_HIGHLIGHT_COLOR fragmentConstants[0]
#define RD_UNIFORM_HIGHLIGHT_ALPHA fragmentConstants[1]
#define RD_UNIFORM_HIDDEN_BLOCKS_ALPHA fragmentConstants[2]
#define RD_UNIFORM_CAMERA_POSITION fragmentConstants[3]
#define RD_UNIFORM_BLOCK_EDGE_COLOR fragmentConstants[4]
#define RD_UNIFORM_BLOCK_EDGE_THICKNESS fragmentConstants[5]
#define RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0 fragmentConstants[6]
#define RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1 fragmentConstants[7]
#define RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2 fragmentConstants[8]
#define RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3 fragmentConstants[9]
#define RD_UNIFORM_OUTLINE_COLOR fragmentConstants[10]
#define RD_UNIFORM_OUTLINE_WIDTH fragmentConstants[11]
#define RD_UNIFORM_OVERLAY_TEXTURE_STRETCH fragmentConstants[12]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[13]
#define RD_UNIFORM_SCREEN_SIZE fragmentConstants[14]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_HIGHLIGHT_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_HIGHLIGHT_ALPHA fragmentVectorConstants1[1]
#define RD_UNIFORM_HIDDEN_BLOCKS_ALPHA fragmentVectorConstants1[2]
#define RD_UNIFORM_CAMERA_POSITION fragmentVectorConstants1[3]
#define RD_UNIFORM_BLOCK_EDGE_COLOR fragmentVectorConstants1[4]
#define RD_UNIFORM_BLOCK_EDGE_THICKNESS fragmentVectorConstants1[5]
#define RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0 fragmentVectorConstants1[6]
#define RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1 fragmentVectorConstants1[7]
#define RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2 fragmentVectorConstants1[8]
#define RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3 fragmentVectorConstants1[9]
#define RD_UNIFORM_OUTLINE_COLOR fragmentVectorConstants1[10]
#define RD_UNIFORM_OUTLINE_WIDTH fragmentVectorConstants1[11]
#define RD_UNIFORM_OVERLAY_TEXTURE_STRETCH fragmentVectorConstants1[12]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[13]
#define RD_UNIFORM_SCREEN_SIZE fragmentVectorConstants1[14]
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[9] : packoffset(c0);
};
Texture2D<float4> highlightTextureColorTexture : register(t0, space0);
Texture2D<float4> highlightTextureDepthTexture : register(t1, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t2, space0);
Texture2D<float4> sceneTextureColorTexture : register(t3, space0);
Texture2D<float4> sceneTextureDepthTexture : register(t4, space0);
SamplerState highlightTextureColorSampler : register(s0, space0);
SamplerState highlightTextureDepthSampler : register(s1, space0);
SamplerState sceneTextureColorSampler : register(s3, space0);
SamplerState sceneTextureDepthSampler : register(s4, space0);
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
  float4 fragmentVectorConstants1[9];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[15] : packoffset(c0);
};
Texture2D<float4> highlightTextureColorTexture : register(t0, space0);
Texture2D<float4> highlightTextureDepthTexture : register(t1, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t2, space0);
Texture2D<float4> sceneTextureColorTexture : register(t3, space0);
Texture2D<float4> sceneTextureDepthTexture : register(t4, space0);
Texture2D<float4> selectedBlocksOverlayTextureTexture : register(t5, space0);
SamplerState highlightTextureColorSampler : register(s0, space0);
SamplerState highlightTextureDepthSampler : register(s1, space0);
SamplerState sceneTextureColorSampler : register(s3, space0);
SamplerState sceneTextureDepthSampler : register(s4, space0);
SamplerState selectedBlocksOverlayTextureSampler : register(s5, space0);
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
  float4 fragmentVectorConstants1[15];
}
#define RD_COMPARISON_MASK -
#endif
