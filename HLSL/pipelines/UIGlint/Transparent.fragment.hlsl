// UIGlint / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/UIGlint/FragmentBindings.hlsli"



void executeFragmentStage()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    float4 sampledTextureValue = materialTexture1.Sample(textureSampler1, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    if (scalarValue <= 0.00390625f)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue3 = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    if (!(!(scalarValue1 <= 0.00390625f)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    float4 sampledTextureValue1 = materialTexture0.Sample(textureSampler0, float2(frac(varyingTexCoord1.x), frac(varyingTexCoord1.y)));
    float4 sampledTextureValue2 = materialTexture0.Sample(textureSampler0, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    precise float sumValue = sampledTextureValue2.x + sampledTextureValue1.x;
    precise float sumValue1 = sampledTextureValue2.y + sampledTextureValue1.y;
    precise float sumValue2 = sampledTextureValue2.z + sampledTextureValue1.z;
    precise float productValue7 = sumValue * RD_UNIFORM_GLINT_COLOR.x;
    precise float productValue8 = sumValue1 * RD_UNIFORM_GLINT_COLOR.y;
    precise float productValue9 = sumValue2 * RD_UNIFORM_GLINT_COLOR.z;
    precise float productValue10 = productValue7 * RD_UNIFORM_TINT_COLOR.x;
    precise float productValue11 = productValue8 * RD_UNIFORM_TINT_COLOR.y;
    precise float productValue12 = productValue9 * RD_UNIFORM_TINT_COLOR.z;
    precise float productValue13 = scalarValue * RD_UNIFORM_TINT_COLOR.w;
    precise float productValue14 = productValue10 * productValue10;
    precise float productValue15 = productValue11 * productValue11;
    precise float productValue16 = productValue12 * productValue12;
    precise float productValue17 = productValue14 * RD_UNIFORM_TINT_COLOR.w;
    precise float productValue18 = productValue15 * RD_UNIFORM_TINT_COLOR.w;
    precise float productValue19 = productValue16 * RD_UNIFORM_TINT_COLOR.w;
    precise float productValue20 = productValue17 * RD_UNIFORM_HUD_OPACITY.x;
    precise float productValue21 = productValue18 * RD_UNIFORM_HUD_OPACITY.x;
    precise float productValue22 = productValue19 * RD_UNIFORM_HUD_OPACITY.x;
    precise float productValue23 = productValue13 * RD_UNIFORM_HUD_OPACITY.x;
    fragmentColor0.x = productValue20;
    fragmentColor0.y = productValue21;
    fragmentColor0.z = productValue22;
    fragmentColor0.w = productValue23;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float4 sampledTextureValue1 = materialTexture0.Sample(textureSampler0, float2(frac(varyingTexCoord1.x), frac(varyingTexCoord1.y)));
    float4 sampledTextureValue2 = materialTexture0.Sample(textureSampler0, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float productValue = ((sampledTextureValue2.x + sampledTextureValue1.x) * RD_UNIFORM_GLINT_COLOR.x) * RD_UNIFORM_TINT_COLOR.x;
    float productValue1 = ((sampledTextureValue2.y + sampledTextureValue1.y) * RD_UNIFORM_GLINT_COLOR.y) * RD_UNIFORM_TINT_COLOR.y;
    float productValue2 = ((sampledTextureValue2.z + sampledTextureValue1.z) * RD_UNIFORM_GLINT_COLOR.z) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.x = ((productValue * productValue) * RD_UNIFORM_TINT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
    fragmentColor0.y = ((productValue1 * productValue1) * RD_UNIFORM_TINT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
    fragmentColor0.z = ((productValue2 * productValue2) * RD_UNIFORM_TINT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
    fragmentColor0.w = (scalarValue * RD_UNIFORM_TINT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue4 = glintTextureTexture.Sample(glintTextureSampler, float2(frac(varyingTexCoord1.x), frac(varyingTexCoord1.y)));
    float4 sampledTextureValue5 = glintTextureTexture.Sample(glintTextureSampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float productValue3 = ((sampledTextureValue5.x + sampledTextureValue4.x) * RD_UNIFORM_GLINT_COLOR.x) * RD_UNIFORM_TINT_COLOR.x;
    float productValue4 = ((sampledTextureValue5.y + sampledTextureValue4.y) * RD_UNIFORM_GLINT_COLOR.y) * RD_UNIFORM_TINT_COLOR.y;
    float productValue5 = ((sampledTextureValue5.z + sampledTextureValue4.z) * RD_UNIFORM_GLINT_COLOR.z) * RD_UNIFORM_TINT_COLOR.z;
    float productValue6 = RD_UNIFORM_HUD_OPACITY.x * RD_UNIFORM_TINT_COLOR.w;
    fragmentColor0.x = (productValue3 * productValue3) * productValue6;
    fragmentColor0.y = (productValue4 * productValue4) * productValue6;
    fragmentColor0.z = (productValue5 * productValue5) * productValue6;
    fragmentColor0.w = productValue6 * scalarValue1;
#endif
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingColor0 = stage_input.varyingColor0;
#endif
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
