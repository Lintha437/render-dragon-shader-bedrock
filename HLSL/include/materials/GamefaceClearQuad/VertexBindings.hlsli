// Native resource and stage-interface layouts for GamefaceClearQuad / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
static float4 clipSpacePosition;
static float3 vertexPosition0;
static float4 vertexTexCoord1;
static uint4 vertexTexCoord4;
static float4 varyingTexCoord1;
static float4 varyingTexCoord0;
static float4 varyingTexCoord4;
static float3 varyingTexCoord2;
static float4 varyingTexCoord3;
static float4 varyingTexCoord5;
struct VertexStageInput
{
    float3 vertexPosition0 : POSITION0;
    float4 vertexTexCoord1 : TEXCOORD1;
    uint4 vertexTexCoord4 : TEXCOORD4;
};
struct VertexStageOutput
{
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingTexCoord0 : TEXCOORD0;
    float4 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord2 : TEXCOORD2;
    nointerpolation float4 varyingTexCoord3 : TEXCOORD3;
    float4 varyingTexCoord5 : TEXCOORD5;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 1
#define RD_COMPARISON_MASK -
#endif
