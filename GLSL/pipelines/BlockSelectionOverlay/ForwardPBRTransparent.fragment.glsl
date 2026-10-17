#version 460
#extension GL_GOOGLE_include_directive : require
// BlockSelectionOverlay / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/BlockSelectionOverlay/FragmentBindings.glsli"

void main()
{
#if (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    if (texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5)
    {
        isFragmentDiscarded = true;
    }
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    if (texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5)
    {
        isFragmentDiscarded = true;
    }
#endif
    fragmentColor0.x = fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[0u].z;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[0u].w;
#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON
    discardIfRequested();
#endif
}
