#version 460
#extension GL_GOOGLE_include_directive : require
// CubemapTransfer / CubemapToOffscreen / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/CubemapTransfer/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue;
    float multiplyAddValue1;
    float intermediateValue3;
    switch (uint(int(fragmentScalarConstants1.packedValues[0u])))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (varyingTexCoord0.x * 2.0) + (-1.0);
    float productValue1 = (varyingTexCoord0.y * 2.0) + (-1.0);
    float intermediateValue;
    float sumValue;
    float sumValue1;
    switch (uint(int(fragmentVectorConstants1.packedValues[0u].x)))
#endif
    {
        case 0u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = fma(varyingTexCoord0.x, -2.0, 1.0);
            multiplyAddValue1 = fma(varyingTexCoord0.y, -2.0, 1.0);
            intermediateValue3 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = 1.0;
            sumValue = (-0.0) - productValue1;
            sumValue1 = (-0.0) - productValue;
#endif
            break;
        }
        case 1u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = fma(varyingTexCoord0.x, 2.0, -1.0);
            multiplyAddValue1 = fma(varyingTexCoord0.y, -2.0, 1.0);
            intermediateValue3 = -1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = -1.0;
            sumValue = (-0.0) - productValue1;
            sumValue1 = productValue;
#endif
            break;
        }
        case 2u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = fma(varyingTexCoord0.y, 2.0, -1.0);
            multiplyAddValue1 = 1.0;
            intermediateValue3 = fma(varyingTexCoord0.x, 2.0, -1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = productValue;
            sumValue = 1.0;
            sumValue1 = productValue1;
#endif
            break;
        }
        case 3u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = fma(varyingTexCoord0.y, -2.0, 1.0);
            multiplyAddValue1 = -1.0;
            intermediateValue3 = fma(varyingTexCoord0.x, 2.0, -1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = productValue;
            sumValue = -1.0;
            sumValue1 = (-0.0) - productValue1;
#endif
            break;
        }
        case 4u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = 1.0;
            multiplyAddValue1 = fma(varyingTexCoord0.y, -2.0, 1.0);
            intermediateValue3 = fma(varyingTexCoord0.x, 2.0, -1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = productValue;
            sumValue = (-0.0) - productValue1;
            sumValue1 = 1.0;
#endif
            break;
        }
        case 5u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = -1.0;
            multiplyAddValue1 = fma(varyingTexCoord0.y, -2.0, 1.0);
            intermediateValue3 = fma(varyingTexCoord0.x, -2.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = (-0.0) - productValue;
            sumValue = (-0.0) - productValue1;
            sumValue1 = -1.0;
#endif
            break;
        }
        default:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = 0.0;
            multiplyAddValue1 = 0.0;
            intermediateValue3 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = 0.0;
            sumValue = 0.0;
            sumValue1 = 0.0;
#endif
            break;
        }
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = textureLod(samplerCube(materialTexture0, textureSampler0), vec3(intermediateValue3, multiplyAddValue1, multiplyAddValue), fragmentScalarConstants1.packedValues[4u] - 1.0);
    fragmentColor0.x = sampledTextureValue1.x;
    fragmentColor0.y = sampledTextureValue1.y;
    fragmentColor0.z = sampledTextureValue1.z;
    fragmentColor0.w = sampledTextureValue1.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = textureLod(samplerCube(srcTextureCubeTexture, srcTextureCubeSampler), vec3(intermediateValue, sumValue, sumValue1), fragmentVectorConstants1.packedValues[1u].x + (-1.0));
    fragmentColor0.x = sampledTextureValue.x;
    fragmentColor0.y = sampledTextureValue.y;
    fragmentColor0.z = sampledTextureValue.z;
    fragmentColor0.w = sampledTextureValue.w;
#endif
}
