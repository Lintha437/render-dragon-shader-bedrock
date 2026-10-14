#version 460
#extension GL_GOOGLE_include_directive : require
// RTXPostFX.Bloom / BloomDownscaleUniformPass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXPostFX.Bloom/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.x;
    float scalarValue4 = sampledTextureValue1.y;
    float scalarValue5 = sampledTextureValue1.z;
    bool reinterpretedBits = (((floatBitsToUint(scalarValue3) & 2139095040u) == 2139095040u) || ((floatBitsToUint(scalarValue4) & 2139095040u) == 2139095040u)) || ((floatBitsToUint(scalarValue5) & 2139095040u) == 2139095040u);
    fragmentColor0.x = reinterpretedBits ? 0.0 : spvNMax(scalarValue3, 0.0);
    fragmentColor0.y = reinterpretedBits ? 0.0 : spvNMax(scalarValue4, 0.0);
    fragmentColor0.z = reinterpretedBits ? 0.0 : spvNMax(scalarValue5, 0.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(rasterColorTexture, rasterColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (((floatBitsToUint(scalarValue2) & 2139095040u) == 2139095040u) || (((floatBitsToUint(scalarValue) & 2139095040u) == 2139095040u) || ((floatBitsToUint(scalarValue1) & 2139095040u) == 2139095040u)))
    {
        intermediateValue3 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
    }
    else
    {
        intermediateValue3 = spvNMax(scalarValue, 0.0);
        intermediateValue4 = spvNMax(scalarValue1, 0.0);
        intermediateValue5 = spvNMax(scalarValue2, 0.0);
    }
    fragmentColor0.x = intermediateValue3;
    fragmentColor0.y = intermediateValue4;
    fragmentColor0.z = intermediateValue5;
#endif
    fragmentColor0.w = 1.0;
}
