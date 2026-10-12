// Native resource and stage-interface layouts for Entity / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[2]
#define RD_UNIFORM_MAT_COLOR1 fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[3]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 2 || RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 10 || RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 11
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 102 || RD_BINDING_LAYOUT == 105 || RD_BINDING_LAYOUT == 12 || RD_BINDING_LAYOUT == 16 || RD_BINDING_LAYOUT == 32 || RD_BINDING_LAYOUT == 95
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 13
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 111 || RD_BINDING_LAYOUT == 114 || RD_BINDING_LAYOUT == 14 || RD_BINDING_LAYOUT == 17 || RD_BINDING_LAYOUT == 36 || RD_BINDING_LAYOUT == 97
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 15
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 18
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[2]
#define RD_UNIFORM_MAT_COLOR1 fragmentConstants[3]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[4]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 19
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[3]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[4]
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 20 || RD_BINDING_LAYOUT == 21 || RD_BINDING_LAYOUT == 66
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[2]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 22
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[3]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 23
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[3]
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 24
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentConstants[2]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 25
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[2]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[3]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 26 || RD_BINDING_LAYOUT == 28 || RD_BINDING_LAYOUT == 68
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[1]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 27
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 29
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 30 || RD_BINDING_LAYOUT == 94 || RD_BINDING_LAYOUT == 99
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 31
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[2]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 33
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 108 || RD_BINDING_LAYOUT == 34 || RD_BINDING_LAYOUT == 96
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR1 fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 35
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[1]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 37
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 38
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[1]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[2]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[3]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[4]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 39
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[3]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[4]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 40
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[1]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[2]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 41
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[3]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 42 || RD_BINDING_LAYOUT == 44 || RD_BINDING_LAYOUT == 98
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentConstants[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 43
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[3]
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 45
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[3]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 101 || RD_BINDING_LAYOUT == 104 || RD_BINDING_LAYOUT == 46 || RD_BINDING_LAYOUT == 48 || RD_BINDING_LAYOUT == 50 || RD_BINDING_LAYOUT == 52
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 47
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 49
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 51
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 53
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[2]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 106 || RD_BINDING_LAYOUT == 54 || RD_BINDING_LAYOUT == 55
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR1 fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 56
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 57
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 110 || RD_BINDING_LAYOUT == 113 || RD_BINDING_LAYOUT == 58 || RD_BINDING_LAYOUT == 60 || RD_BINDING_LAYOUT == 62 || RD_BINDING_LAYOUT == 63
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR2 fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 59
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[1]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 61
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[1]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 64
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[1]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 65
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[1]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 67
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[3]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 69
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[2]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 70 || RD_BINDING_LAYOUT == 72
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[2]
#define RD_UNIFORM_MAT_COLOR1 fragmentConstants[3]
#define RD_UNIFORM_MAT_COLOR2 fragmentConstants[4]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 71
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[3]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[4]
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 73
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[3]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[4]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 74 || RD_BINDING_LAYOUT == 76 || RD_BINDING_LAYOUT == 78 || RD_BINDING_LAYOUT == 79
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentConstants[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 75
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[3]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 77
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[3]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 80
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[3]
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 81
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[3]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 82 || RD_BINDING_LAYOUT == 84
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentConstants[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 83
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[3]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 85
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[3]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 86 || RD_BINDING_LAYOUT == 88 || RD_BINDING_LAYOUT == 90 || RD_BINDING_LAYOUT == 92
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 87
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 89
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 91
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 93
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR2 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 100
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 103
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 107
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR0 fragmentVectorConstants1[1]
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 109
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR1 fragmentVectorConstants1[1]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 112
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 115
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0 || RD_BINDING_LAYOUT == 44 || RD_BINDING_LAYOUT == 79
    float4 fragmentConstants[4] : packoffset(c0);
};
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 22 || RD_BINDING_LAYOUT == 23 || RD_BINDING_LAYOUT == 25 || RD_BINDING_LAYOUT == 41 || RD_BINDING_LAYOUT == 43 || RD_BINDING_LAYOUT == 45 || RD_BINDING_LAYOUT == 67 || RD_BINDING_LAYOUT == 75 || RD_BINDING_LAYOUT == 77 || RD_BINDING_LAYOUT == 80 || RD_BINDING_LAYOUT == 81 || RD_BINDING_LAYOUT == 83 || RD_BINDING_LAYOUT == 85
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2 || RD_BINDING_LAYOUT == 48
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 3 || RD_BINDING_LAYOUT == 30 || RD_BINDING_LAYOUT == 52
    float4 fragmentConstants[3] : packoffset(c0);
};
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 100 || RD_BINDING_LAYOUT == 27 || RD_BINDING_LAYOUT == 29 || RD_BINDING_LAYOUT == 31 || RD_BINDING_LAYOUT == 4 || RD_BINDING_LAYOUT == 47 || RD_BINDING_LAYOUT == 49 || RD_BINDING_LAYOUT == 5 || RD_BINDING_LAYOUT == 51 || RD_BINDING_LAYOUT == 53 || RD_BINDING_LAYOUT == 56 || RD_BINDING_LAYOUT == 57 || RD_BINDING_LAYOUT == 69 || RD_BINDING_LAYOUT == 7 || RD_BINDING_LAYOUT == 87 || RD_BINDING_LAYOUT == 89 || RD_BINDING_LAYOUT == 91 || RD_BINDING_LAYOUT == 93
  float4 fragmentVectorConstants1[3];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 55 || RD_BINDING_LAYOUT == 6 || RD_BINDING_LAYOUT == 92
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
SamplerState matTexture0Sampler : register(s0, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 60 || RD_BINDING_LAYOUT == 8
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 103 || RD_BINDING_LAYOUT == 107 || RD_BINDING_LAYOUT == 109 || RD_BINDING_LAYOUT == 11 || RD_BINDING_LAYOUT == 13 || RD_BINDING_LAYOUT == 33 || RD_BINDING_LAYOUT == 35 || RD_BINDING_LAYOUT == 59 || RD_BINDING_LAYOUT == 61 || RD_BINDING_LAYOUT == 64 || RD_BINDING_LAYOUT == 65 || RD_BINDING_LAYOUT == 9
  float4 fragmentVectorConstants1[2];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 10 || RD_BINDING_LAYOUT == 34 || RD_BINDING_LAYOUT == 63
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
SamplerState matTexture0Sampler : register(s0, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 12
    float4 fragmentConstants[2] : packoffset(c0);
};
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 14
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
SamplerState matTexture0Sampler : register(s0, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 112 || RD_BINDING_LAYOUT == 115 || RD_BINDING_LAYOUT == 15 || RD_BINDING_LAYOUT == 37
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 16
    float4 fragmentConstants[2] : packoffset(c0);
};
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 17
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
SamplerState matTexture0Sampler : register(s0, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 18 || RD_BINDING_LAYOUT == 70
    float4 fragmentConstants[5] : packoffset(c0);
};
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 19 || RD_BINDING_LAYOUT == 39 || RD_BINDING_LAYOUT == 71 || RD_BINDING_LAYOUT == 73
  float4 fragmentVectorConstants1[5];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 20 || RD_BINDING_LAYOUT == 74
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTexture1Texture : register(t1, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture1Sampler : register(s1, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 21 || RD_BINDING_LAYOUT == 42 || RD_BINDING_LAYOUT == 78
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 24 || RD_BINDING_LAYOUT == 82
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 26 || RD_BINDING_LAYOUT == 86
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 28 || RD_BINDING_LAYOUT == 54 || RD_BINDING_LAYOUT == 90
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 32
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 36
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 38
    float4 fragmentConstants[5] : packoffset(c0);
};
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 40
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 46
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture1Texture : register(t1, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture1Sampler : register(s1, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 50
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 58
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 62
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 66
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 68
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 72
    float4 fragmentConstants[5] : packoffset(c0);
};
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 76
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 84
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
SamplerState matTexture0Sampler : register(s0, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 88
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 104 || RD_BINDING_LAYOUT == 94
    float4 fragmentConstants[3] : packoffset(c0);
};
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 95
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 113 || RD_BINDING_LAYOUT == 96
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
SamplerState matTexture0Sampler : register(s0, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 97
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 98
    float4 fragmentConstants[4] : packoffset(c0);
};
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 99
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 101
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 102
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture1Texture : register(t1, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture1Sampler : register(s1, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 105
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 106
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
SamplerState matTexture0Sampler : register(s0, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 108
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 110
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 111
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 114
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> matTexture0Texture : register(t0, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTexture0Sampler : register(s0, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
