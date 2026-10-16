#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceStencil / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/GamefaceStencil/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
    uint scalarValue = uint(varyingTexCoord3.w);
#if RD_PLATFORM == RD_PLATFORM_SM40
    float intermediateValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint bitwiseValue = ((uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u)) + 1u;
    float intermediateValue1;
#endif
    if (scalarValue == 0u)
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float scalarValue2 = varyingTexCoord1.w * varyingTexCoord1.z;
        intermediateValue5 = spvNMin(scalarValue2, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue4 = spvNMin(varyingTexCoord1.w * varyingTexCoord1.z, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue1 = spvNMin(1.0, varyingTexCoord1.w * varyingTexCoord1.z);
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        float intermediateValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float intermediateValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue;
#endif
        if (scalarValue == 3u)
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue6 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y)).w;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float intermediateValue7;
            if (scalarValue != 17u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float intermediateValue6;
            if (scalarValue != 17u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue1;
            if ((scalarValue + 4294967279u) < 2u)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float intermediateValue8;
                if (scalarValue != 18u)
                {
                    float sampledTextureValue;
                    if (scalarValue == 34u)
                    {
                        uint scalarValue3 = ((uint(varyingTexCoord3.z) << 4u) + ((uint(varyingTexCoord3.y) >> 4u) & 15u)) + 1u;
                        sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[scalarValue3].z, fract(varyingTexCoord1.x), fragmentVectorConstants1.packedValues[scalarValue3].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[scalarValue3].w, fract(varyingTexCoord1.y), fragmentVectorConstants1.packedValues[scalarValue3].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).w;
                    }
                    else
                    {
                        float intermediateValue10;
                        if (scalarValue == 36u)
                        {
                            intermediateValue10 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).x;
                        }
                        else
                        {
                            intermediateValue10 = 1.0;
                        }
                        sampledTextureValue = intermediateValue10;
                    }
                    intermediateValue8 = sampledTextureValue;
                }
                else
                {
                    intermediateValue8 = 1.0;
                }
                intermediateValue7 = intermediateValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float intermediateValue7;
                if (scalarValue != 18u)
                {
                    float sampledTextureValue;
                    if (scalarValue == 34u)
                    {
                        uint scalarValue1 = bitfieldInsert(bitfieldExtract(uint(varyingTexCoord3.y), int(4u), int(4u)), uint(varyingTexCoord3.z), int(4u), int(28u)) + 1u;
                        sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[scalarValue1].z, fract(varyingTexCoord1.x), fragmentVectorConstants1.packedValues[scalarValue1].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[scalarValue1].w, fract(varyingTexCoord1.y), fragmentVectorConstants1.packedValues[scalarValue1].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).w;
                    }
                    else
                    {
                        float intermediateValue9;
                        if (scalarValue == 36u)
                        {
                            intermediateValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).x;
                        }
                        else
                        {
                            intermediateValue9 = 1.0;
                        }
                        sampledTextureValue = intermediateValue9;
                    }
                    intermediateValue7 = sampledTextureValue;
                }
                else
                {
                    intermediateValue7 = 1.0;
                }
                intermediateValue6 = intermediateValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue1 = 1.0;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                intermediateValue7 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue6 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float branchMergedValue2;
                if (scalarValue == 34u)
                {
                    branchMergedValue2 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * ((fract(varyingTexCoord1.x) * fragmentVectorConstants1.packedValues[bitwiseValue].z) + fragmentVectorConstants1.packedValues[bitwiseValue].x)) + fragmentVectorConstants1.packedValues[128u].x, (((fract(varyingTexCoord1.y) * fragmentVectorConstants1.packedValues[bitwiseValue].w) + fragmentVectorConstants1.packedValues[bitwiseValue].y) * fragmentVectorConstants1.packedValues[128u].w) + fragmentVectorConstants1.packedValues[128u].y)).w;
                }
                else
                {
                    float branchMergedValue3;
                    if (scalarValue == 36u)
                    {
                        branchMergedValue3 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y)).x;
                    }
                    else
                    {
                        branchMergedValue3 = 1.0;
                    }
                    branchMergedValue2 = branchMergedValue3;
                }
                branchMergedValue1 = branchMergedValue2;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue6 = intermediateValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue5 = intermediateValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = branchMergedValue1;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue5 = intermediateValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue4 = intermediateValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue1 = branchMergedValue;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    if (intermediateValue5 < 0.0039215688593685626983642578125)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    if (intermediateValue4 < 0.0039215688593685626983642578125)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (intermediateValue1 < 0.0039215688593685626983642578125)
#endif
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = 0.0;
    fragmentColor0.y = 0.0;
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
    discardIfRequested();
}
