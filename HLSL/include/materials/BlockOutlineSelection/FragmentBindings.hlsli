// Native resource and stage-interface layouts for BlockOutlineSelection / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_OUTLINE_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_OUTLINE_COLOR fragmentVectorConstants1[0]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[1] : packoffset(c0);
};
static float4 fragmentColor0;
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#endif
