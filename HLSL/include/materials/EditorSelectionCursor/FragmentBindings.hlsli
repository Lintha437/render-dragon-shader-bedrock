// Native resource and stage-interface layouts for EditorSelectionCursor / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[0]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_MAT_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_FRAME_TIME fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_FRAME_TIME fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[1]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[1] : packoffset(c0);
};
static float varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[2] : packoffset(c0);
};
static float varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[2];
}
#define RD_COMPARISON_MASK -
#endif
