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

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT2_16 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT3_17 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT4_18 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT_15 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT2_12 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT3_13 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT4_14 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT_11 1
#endif
#define RD_USE_TEXTURE_SIZE_UINT2_10 1
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/PostFX.Debug.Texture2D.uint/FragmentBindings.hlsli"

#include "../../include/Math.hlsli"
void executeFragmentStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint intermediateValue2;
    rdTextureSize(materialTexture0, 0u, intermediateValue2);
    bool conditionValue = intermediateValue2 > 0u;
    uint unusedTextureMipCount34;
    uint2 vectorValue1 = rdTextureSize(materialTexture0, 0u, unusedTextureMipCount34);
    uint scalarValue3 = vectorValue1.x;
    precise float comparisonValue = rdUnsignedToFloat(conditionValue ? scalarValue3 : 0u) * varyingTexCoord0.x;
    precise float comparisonValue1 = rdUnsignedToFloat(conditionValue ? vectorValue1.y : 0u) * varyingTexCoord0.y;
    uint4 loadedBufferValue1 = materialTexture0.Load(int3(uint2(uint(int(comparisonValue)), uint(int(comparisonValue1))), 0u));
    uint scalarValue4 = loadedBufferValue1.x;
    uint scalarValue5 = loadedBufferValue1.y;
    uint scalarValue6 = loadedBufferValue1.z;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint intermediateValue2;
    rdTextureSize(materialTexture0, 0u, intermediateValue2);
    bool conditionValue = intermediateValue2 > 0u;
    uint unusedTextureMipCount34;
    uint2 vectorValue1 = rdTextureSize(materialTexture0, 0u, unusedTextureMipCount34);
    uint scalarValue3 = vectorValue1.x;
    uint4 loadedBufferValue2 = materialTexture0.Load(int3(uint2(uint(int(rdUnsignedToFloat(conditionValue ? scalarValue3 : 0u) * varyingTexCoord0.x)), uint(int(rdUnsignedToFloat(conditionValue ? vectorValue1.y : 0u) * varyingTexCoord0.y))), 0u));
    uint scalarValue7 = loadedBufferValue2.x;
    uint scalarValue8 = loadedBufferValue2.y;
    uint scalarValue9 = loadedBufferValue2.z;
    float intermediateValue9;
    float productValue1;
    float intermediateValue10;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint unusedTextureMipCount31;
    uint2 vectorValue = rdTextureSize(rasterColorTexture, 0u, unusedTextureMipCount31);
    uint4 loadedBufferValue = rasterColorTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y))), 0u));
    uint scalarValue = loadedBufferValue.x;
    float intermediateValue2;
    float productValue;
    float intermediateValue3;
#endif
    switch (uint(RD_UNIFORM_DEBUG_MODE.x))
    {
        case 14u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue2 = rdUnsignedToFloat(loadedBufferValue1.w) * 0.0039215688593685626983642578125f;
            intermediateValue9 = 0.0f;
            intermediateValue10 = productValue2;
            intermediateValue11 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue9 = 0.0f;
            productValue1 = rdUnsignedToFloat(loadedBufferValue2.w) * 0.0039215688593685626983642578125f;
            intermediateValue10 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue2 = 0.0f;
            productValue = float(loadedBufferValue.w) * 0.0039215688593685626983642578125f;
            intermediateValue3 = 0.0f;
#endif
            break;
        }
        case 18u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float bitwiseValue3 = rdUnsignedToFloat((scalarValue5 >> 8u) & 255u) * 0.0039215688593685626983642578125f;
            precise float bitwiseValue4 = rdUnsignedToFloat(scalarValue5 & 255u) * 0.0039215688593685626983642578125f;
            precise float bitwiseValue5 = rdUnsignedToFloat((scalarValue6 >> 8u) & 255u) * 0.0039215688593685626983642578125f;
            precise float bitwiseValue6 = rdUnsignedToFloat(scalarValue6 & 255u) * 0.0039215688593685626983642578125f;
            precise float productValue3 = bitwiseValue6 * bitwiseValue3;
            precise float productValue4 = bitwiseValue6 * bitwiseValue4;
            precise float productValue5 = bitwiseValue6 * bitwiseValue5;
            precise float productValue6 = productValue3 * 1.0f;
            precise float productValue7 = productValue4 * 1.0f;
            precise float productValue8 = productValue5 * 1.0f;
            intermediateValue9 = productValue8;
            intermediateValue10 = productValue7;
            intermediateValue11 = productValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float bitwiseValue9 = rdUnsignedToFloat(scalarValue9 & 255u) * 0.0039215688593685626983642578125f;
            intermediateValue9 = bitwiseValue9 * (rdUnsignedToFloat(rdBitfieldUExtract(scalarValue9, 8u, 8u)) * 0.0039215688593685626983642578125f);
            productValue1 = bitwiseValue9 * (rdUnsignedToFloat(scalarValue8 & 255u) * 0.0039215688593685626983642578125f);
            intermediateValue10 = bitwiseValue9 * (rdUnsignedToFloat(rdBitfieldUExtract(scalarValue8, 8u, 8u)) * 0.0039215688593685626983642578125f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint scalarValue1 = loadedBufferValue.z;
            uint scalarValue2 = loadedBufferValue.y;
            float bitwiseValue = float(scalarValue1 & 255u) * 1.5378702300949953496456146240234e-05f;
            intermediateValue2 = bitwiseValue * float((scalarValue2 >> 8u) & 255u);
            productValue = bitwiseValue * float(scalarValue2 & 255u);
            intermediateValue3 = bitwiseValue * float((scalarValue1 >> 8u) & 255u);
#endif
            break;
        }
        case 19u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float bitwiseValue7 = rdUnsignedToFloat((scalarValue4 >> 8u) & 255u) * 0.0039215688593685626983642578125f;
            intermediateValue9 = bitwiseValue7;
            intermediateValue10 = bitwiseValue7;
            intermediateValue11 = bitwiseValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue9 = rdUnsignedToFloat(rdBitfieldUExtract(scalarValue7, 8u, 8u)) * 0.0039215688593685626983642578125f;
            intermediateValue9 = productValue9;
            productValue1 = productValue9;
            intermediateValue10 = productValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float bitwiseValue1 = float((scalarValue >> 8u) & 255u) * 0.0039215688593685626983642578125f;
            intermediateValue2 = bitwiseValue1;
            productValue = bitwiseValue1;
            intermediateValue3 = bitwiseValue1;
#endif
            break;
        }
        case 20u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float bitwiseValue8 = rdUnsignedToFloat(scalarValue4 & 255u) * 0.0039215688593685626983642578125f;
            intermediateValue9 = bitwiseValue8;
            intermediateValue10 = bitwiseValue8;
            intermediateValue11 = bitwiseValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float bitwiseValue10 = rdUnsignedToFloat(scalarValue7 & 255u) * 0.0039215688593685626983642578125f;
            intermediateValue9 = bitwiseValue10;
            productValue1 = bitwiseValue10;
            intermediateValue10 = bitwiseValue10;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float bitwiseValue2 = float(scalarValue & 255u) * 0.0039215688593685626983642578125f;
            intermediateValue2 = bitwiseValue2;
            productValue = bitwiseValue2;
            intermediateValue3 = bitwiseValue2;
#endif
            break;
        }
        default:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue9 = 0.0f;
            intermediateValue10 = 0.0f;
            intermediateValue11 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue9 = 0.0f;
            productValue1 = 0.0f;
            intermediateValue10 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue2 = 0.0f;
            productValue = 0.0f;
            intermediateValue3 = 0.0f;
#endif
            break;
        }
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    fragmentColor0.x = intermediateValue11;
    fragmentColor0.y = intermediateValue10;
    fragmentColor0.z = intermediateValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = intermediateValue10;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = intermediateValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = intermediateValue2;
    fragmentColor0.y = productValue;
    fragmentColor0.z = intermediateValue3;
#endif
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
