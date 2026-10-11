#version 460
#extension GL_GOOGLE_include_directive : require
// PostFX.Debug.Texture2D.uint / DebugBlit / fragment forward pipeline.
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

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_samplerless_texture_functions : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/PostFX.Debug.Texture2D.uint/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    bool sampledTextureValue2 = uint(textureQueryLevels(intermediateValue)) > 0u;
    uvec2 sampledTextureValue3 = uvec2(textureSize(intermediateValue, int(0u)));
    uint scalarValue3 = sampledTextureValue3.x;
    precise float comparisonValue = rdEvaluateFloatExpression(sampledTextureValue2 ? scalarValue3 : 0u) * varyingTexCoord0.x;
    precise float comparisonValue1 = rdEvaluateFloatExpression(sampledTextureValue2 ? sampledTextureValue3.y : 0u) * varyingTexCoord0.y;
    uvec4 sampledTextureValue4 = texelFetch(intermediateValue, ivec2(uvec2(uint(int(comparisonValue)), uint(int(comparisonValue1)))), int(0u));
    uint scalarValue4 = sampledTextureValue4.x;
    uint scalarValue5 = sampledTextureValue4.y;
    uint scalarValue6 = sampledTextureValue4.z;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    switch (uint(fragmentScalarConstants1.packedValues[0u]))
#elif RD_PLATFORM == RD_PLATFORM_SM50
    bool sampledTextureValue2 = uint(textureQueryLevels(intermediateValue)) > 0u;
    uvec2 sampledTextureValue3 = uvec2(textureSize(intermediateValue, int(0u)));
    uint scalarValue3 = sampledTextureValue3.x;
    uvec4 sampledTextureValue5 = texelFetch(intermediateValue, ivec2(uvec2(uint(int(rdEvaluateFloatExpression(sampledTextureValue2 ? scalarValue3 : 0u) * varyingTexCoord0.x)), uint(int(rdEvaluateFloatExpression(sampledTextureValue2 ? sampledTextureValue3.y : 0u) * varyingTexCoord0.y)))), int(0u));
    uint scalarValue7 = sampledTextureValue5.x;
    uint scalarValue8 = sampledTextureValue5.y;
    uint scalarValue9 = sampledTextureValue5.z;
    float intermediateValue7;
    float productValue1;
    float intermediateValue8;
    switch (uint(fragmentScalarConstants1.packedValues[0u]))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uvec2 sampledTextureValue = uvec2(textureSize(rasterColorTexture, int(0u)));
    uvec4 sampledTextureValue1 = texelFetch(rasterColorTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(sampledTextureValue.y)))))) * varyingTexCoord0.y)))), int(0u));
    uint scalarValue = sampledTextureValue1.x;
    float intermediateValue1;
    float productValue;
    float intermediateValue2;
    switch (uint(fragmentVectorConstants1.packedValues[0u].x))
#endif
    {
        case 14u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue2 = rdEvaluateFloatExpression(sampledTextureValue4.w) * 0.0039215688593685626983642578125;
            intermediateValue7 = 0.0;
            intermediateValue8 = productValue2;
            intermediateValue9 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue7 = 0.0;
            productValue1 = rdEvaluateFloatExpression(sampledTextureValue5.w) * 0.0039215688593685626983642578125;
            intermediateValue8 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue1 = 0.0;
            productValue = float(sampledTextureValue1.w) * 0.0039215688593685626983642578125;
            intermediateValue2 = 0.0;
#endif
            break;
        }
        case 18u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float bitwiseValue3 = rdEvaluateFloatExpression((scalarValue5 >> 8u) & 255u) * 0.0039215688593685626983642578125;
            precise float bitwiseValue4 = rdEvaluateFloatExpression(scalarValue5 & 255u) * 0.0039215688593685626983642578125;
            precise float bitwiseValue5 = rdEvaluateFloatExpression((scalarValue6 >> 8u) & 255u) * 0.0039215688593685626983642578125;
            precise float bitwiseValue6 = rdEvaluateFloatExpression(scalarValue6 & 255u) * 0.0039215688593685626983642578125;
            precise float productValue3 = bitwiseValue6 * bitwiseValue3;
            precise float productValue4 = bitwiseValue6 * bitwiseValue4;
            precise float productValue5 = bitwiseValue6 * bitwiseValue5;
            precise float productValue6 = productValue3 * 1.0;
            precise float productValue7 = productValue4 * 1.0;
            precise float productValue8 = productValue5 * 1.0;
            intermediateValue7 = productValue8;
            intermediateValue8 = productValue7;
            intermediateValue9 = productValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float bitwiseValue9 = rdEvaluateFloatExpression(scalarValue9 & 255u) * 0.0039215688593685626983642578125;
            intermediateValue7 = bitwiseValue9 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue9, int(8u), int(8u))) * 0.0039215688593685626983642578125);
            productValue1 = bitwiseValue9 * (rdEvaluateFloatExpression(scalarValue8 & 255u) * 0.0039215688593685626983642578125);
            intermediateValue8 = bitwiseValue9 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue8, int(8u), int(8u))) * 0.0039215688593685626983642578125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint scalarValue1 = sampledTextureValue1.z;
            uint scalarValue2 = sampledTextureValue1.y;
            float bitwiseValue = float(scalarValue1 & 255u) * 1.5378702300949953496456146240234e-05;
            intermediateValue1 = bitwiseValue * float((scalarValue2 >> 8u) & 255u);
            productValue = bitwiseValue * float(scalarValue2 & 255u);
            intermediateValue2 = bitwiseValue * float((scalarValue1 >> 8u) & 255u);
#endif
            break;
        }
        case 19u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float bitwiseValue7 = rdEvaluateFloatExpression((scalarValue4 >> 8u) & 255u) * 0.0039215688593685626983642578125;
            intermediateValue7 = bitwiseValue7;
            intermediateValue8 = bitwiseValue7;
            intermediateValue9 = bitwiseValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue9 = rdEvaluateFloatExpression(bitfieldExtract(scalarValue7, int(8u), int(8u))) * 0.0039215688593685626983642578125;
            intermediateValue7 = productValue9;
            productValue1 = productValue9;
            intermediateValue8 = productValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float bitwiseValue1 = float((scalarValue >> 8u) & 255u) * 0.0039215688593685626983642578125;
            intermediateValue1 = bitwiseValue1;
            productValue = bitwiseValue1;
            intermediateValue2 = bitwiseValue1;
#endif
            break;
        }
        case 20u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float bitwiseValue8 = rdEvaluateFloatExpression(scalarValue4 & 255u) * 0.0039215688593685626983642578125;
            intermediateValue7 = bitwiseValue8;
            intermediateValue8 = bitwiseValue8;
            intermediateValue9 = bitwiseValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float bitwiseValue10 = rdEvaluateFloatExpression(scalarValue7 & 255u) * 0.0039215688593685626983642578125;
            intermediateValue7 = bitwiseValue10;
            productValue1 = bitwiseValue10;
            intermediateValue8 = bitwiseValue10;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float bitwiseValue2 = float(scalarValue & 255u) * 0.0039215688593685626983642578125;
            intermediateValue1 = bitwiseValue2;
            productValue = bitwiseValue2;
            intermediateValue2 = bitwiseValue2;
#endif
            break;
        }
        default:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue7 = 0.0;
            intermediateValue8 = 0.0;
            intermediateValue9 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue7 = 0.0;
            productValue1 = 0.0;
            intermediateValue8 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue1 = 0.0;
            productValue = 0.0;
            intermediateValue2 = 0.0;
#endif
            break;
        }
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    fragmentColor0.x = intermediateValue9;
    fragmentColor0.y = intermediateValue8;
    fragmentColor0.z = intermediateValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = intermediateValue8;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = intermediateValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = intermediateValue1;
    fragmentColor0.y = productValue;
    fragmentColor0.z = intermediateValue2;
#endif
    fragmentColor0.w = 1.0;
}
