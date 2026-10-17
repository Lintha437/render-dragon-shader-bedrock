#version 460
#extension GL_GOOGLE_include_directive : require
// SunMoonForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/SunMoonForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue5.x;
    float scalarValue7 = sampledTextureValue5.y;
    float scalarValue8 = sampledTextureValue5.z;
    bool comparisonValue3 = fragmentScalarConstants1.packedValues[28u] != 0.0;
    float exponentialValue3 = ((comparisonValue3 ? exp2(log2(spvNMax(scalarValue6, 0.0)) * 2.2000000476837158203125) : ((scalarValue6 <= 0.040449999272823333740234375) ? (scalarValue6 * 0.077399380505084991455078125) : exp2(log2((scalarValue6 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))) * fragmentVectorConstants1.packedValues[5u].x) * fragmentScalarConstants1.packedValues[23u];
    float exponentialValue4 = ((comparisonValue3 ? exp2(log2(spvNMax(scalarValue7, 0.0)) * 2.2000000476837158203125) : ((scalarValue7 <= 0.040449999272823333740234375) ? (scalarValue7 * 0.077399380505084991455078125) : exp2(log2((scalarValue7 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))) * fragmentVectorConstants1.packedValues[5u].y) * fragmentScalarConstants1.packedValues[23u];
    float exponentialValue5 = ((comparisonValue3 ? exp2(log2(spvNMax(scalarValue8, 0.0)) * 2.2000000476837158203125) : ((scalarValue8 <= 0.040449999272823333740234375) ? (scalarValue8 * 0.077399380505084991455078125) : exp2(log2((scalarValue8 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))) * fragmentVectorConstants1.packedValues[5u].z) * fragmentScalarConstants1.packedValues[23u];
    float productValue;
    float productValue1;
    float productValue2;
    float productValue3;
    float intermediateValue16;
    float productValue4;
    if (fragmentScalarConstants1.packedValues[44u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(sunMoonTextureTexture, sunMoonTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[7u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue1 = log2(fma((((-(fma(fragmentVectorConstants1.packedValues[3u].z, varyingColor1.z, fma(fragmentVectorConstants1.packedValues[1u].z, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[2u].z)) + fragmentVectorConstants1.packedValues[4u].z)) / (fma(fragmentVectorConstants1.packedValues[3u].w, varyingColor1.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[2u].w)) + fragmentVectorConstants1.packedValues[4u].w)) - fragmentScalarConstants1.packedValues[40u]) / (fragmentScalarConstants1.packedValues[41u] - fragmentScalarConstants1.packedValues[40u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375;
        float multiplyAddValue2 = fma(multiplyAddValue1, trunc(fragmentScalarConstants1.packedValues[26u]), -0.5);
        uint sumValue1 = uint(min(int(uint(max(int(uint(int(multiplyAddValue2))), int(0u)))), int(uint(int(fragmentScalarConstants1.packedValues[26u])) - 2u)));
        float scalarValue9 = rdSignedBitsToFloat(sumValue1);
        float multiplyAddValue3 = fma(varyingColor1.x, 0.5, 0.5);
        float multiplyAddValue4 = fma(varyingColor1.y, 0.5, 0.5);
        vec4 sampledTextureValue6 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(multiplyAddValue3, multiplyAddValue4, scalarValue9), 0.0);
        float scalarValue10 = sampledTextureValue6.w;
        float sampledTextureValue7 = fma(spvNClamp(multiplyAddValue2 - scalarValue9, 0.0, 1.0), textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(multiplyAddValue3, multiplyAddValue4, rdSignedBitsToFloat(sumValue1 + 1u)), 0.0).w - scalarValue10, scalarValue10);
        productValue = exponentialValue3 * sampledTextureValue7;
        productValue1 = exponentialValue4 * sampledTextureValue7;
        productValue2 = exponentialValue5 * sampledTextureValue7;
        productValue3 = (varyingColor1.x + 1.0) * 0.5;
        intermediateValue16 = multiplyAddValue1;
        productValue4 = (varyingColor1.y + 1.0) * 0.5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue = exp2(log2(spvNMax(scalarValue, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125);
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        productValue = exponentialValue3;
        productValue1 = exponentialValue4;
        productValue2 = exponentialValue5;
        productValue3 = 0.0;
        intermediateValue16 = 0.0;
        productValue4 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue = (scalarValue <= 0.040449999272823333740234375) ? (scalarValue * 0.077399380505084991455078125) : exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint intermediateValue17;
    bool sampledTextureValue3;
    if (fragmentScalarConstants1.packedValues[36u] > 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue5 = (fragmentVectorConstants1.packedValues[5u].x * exponentialValue) * fragmentVectorConstants1.packedValues[5u].w;
    float productValue12 = (fragmentVectorConstants1.packedValues[5u].y * exponentialValue1) * fragmentVectorConstants1.packedValues[5u].w;
    float productValue13 = (fragmentVectorConstants1.packedValues[5u].z * exponentialValue2) * fragmentVectorConstants1.packedValues[5u].w;
    float productValue6;
    float productValue7;
    float productValue8;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if (fragmentVectorConstants1.packedValues[11u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue17 = 0u;
        sampledTextureValue3 = textureLod(sampler3D(materialTexture5, textureSampler5), vec3(productValue3, 1.0 - productValue4, (exp2((intermediateValue16 - fragmentScalarConstants1.packedValues[38u]) * 5.770780086517333984375) - 1.0) * 0.0186573602259159088134765625), 0.0).y < fragmentScalarConstants1.packedValues[39u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue14 = (varyingColor1.x + 1.0) * 0.5;
        float productValue15 = (varyingColor1.y + 1.0) * 0.5;
        float multiplyAddValue = log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[4u].z + fma(fragmentVectorConstants1.packedValues[3u].z, varyingColor1.z, fma(fragmentVectorConstants1.packedValues[2u].z, varyingColor1.y, fragmentVectorConstants1.packedValues[1u].z * varyingColor1.x)))) / (fma(fragmentVectorConstants1.packedValues[3u].w, varyingColor1.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingColor1.y, fragmentVectorConstants1.packedValues[1u].w * varyingColor1.x)) + fragmentVectorConstants1.packedValues[4u].w)) - fragmentVectorConstants1.packedValues[10u].x) / (fragmentVectorConstants1.packedValues[10u].y - fragmentVectorConstants1.packedValues[10u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375;
        uint scalarValue3 = uint(int(fragmentVectorConstants1.packedValues[6u].z));
        float productValue16 = (float(int(scalarValue3)) * multiplyAddValue) + (-0.5);
        uint sumValue = uint(min(int(uint(max(int(uint(int(productValue16))), int(0u)))), int(scalarValue3 + 4294967294u)));
        float scalarValue4 = float(int(sumValue));
        vec4 sampledTextureValue1 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue14, productValue15, scalarValue4), 0.0);
        float scalarValue5 = sampledTextureValue1.w;
        float sampledTextureValue2 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue14, productValue15, float(int(sumValue + 1u))), 0.0).w - scalarValue5) * spvNMin(spvNMax(productValue16 - scalarValue4, 0.0), 1.0)) + scalarValue5;
        productValue6 = sampledTextureValue2 * productValue5;
        productValue7 = sampledTextureValue2 * productValue12;
        productValue8 = sampledTextureValue2 * productValue13;
        intermediateValue6 = productValue14;
        intermediateValue7 = productValue15;
        intermediateValue8 = multiplyAddValue;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue17 = floatBitsToUint(productValue4);
        sampledTextureValue3 = false;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue6 = productValue5;
        productValue7 = productValue12;
        productValue8 = productValue13;
        intermediateValue6 = 0.0;
        intermediateValue7 = 0.0;
        intermediateValue8 = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint comparisonValue4 = sampledTextureValue3 ? intermediateValue17 : 4294967295u;
    uint reinterpretedBits;
    uint reinterpretedBits1;
    uint reinterpretedBits2;
    if (fragmentScalarConstants1.packedValues[32u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool intermediateValue9;
    if (fragmentVectorConstants1.packedValues[9u].x > 0.5)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue8 = (0.180000007152557373046875 / texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        reinterpretedBits = floatBitsToUint(productValue2 * sampledTextureValue8);
        reinterpretedBits1 = floatBitsToUint(productValue1 * sampledTextureValue8);
        reinterpretedBits2 = floatBitsToUint(productValue * sampledTextureValue8);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        bool branchMergedValue;
        if (textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(intermediateValue6, 1.0 - intermediateValue7, (exp2((intermediateValue8 - fragmentVectorConstants1.packedValues[9u].z) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625), 0.0).y < fragmentVectorConstants1.packedValues[9u].w)
        {
            branchMergedValue = false;
        }
        else
        {
            branchMergedValue = true;
        }
        intermediateValue9 = branchMergedValue;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        reinterpretedBits = floatBitsToUint(productValue2);
        reinterpretedBits1 = floatBitsToUint(productValue1);
        reinterpretedBits2 = floatBitsToUint(productValue);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue9 = true;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float reinterpretedBits3 = uintBitsToFloat(comparisonValue4 & reinterpretedBits2);
    float reinterpretedBits4 = uintBitsToFloat(comparisonValue4 & reinterpretedBits1);
    float reinterpretedBits5 = uintBitsToFloat(comparisonValue4 & reinterpretedBits);
    fragmentColor0.x = fma(reinterpretedBits3, fragmentScalarConstants1.packedValues[0u], reinterpretedBits3);
    fragmentColor0.y = fma(reinterpretedBits4, fragmentScalarConstants1.packedValues[0u], reinterpretedBits4);
    fragmentColor0.z = fma(reinterpretedBits5, fragmentScalarConstants1.packedValues[0u], reinterpretedBits5);
    fragmentColor0.w = uintBitsToFloat(comparisonValue4 & 1065353216u);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue9;
    float productValue10;
    float productValue11;
    if (fragmentVectorConstants1.packedValues[8u].x > 0.0)
    {
        float sampledTextureValue4 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue9 = sampledTextureValue4 * productValue6;
        productValue10 = sampledTextureValue4 * productValue7;
        productValue11 = sampledTextureValue4 * productValue8;
    }
    else
    {
        productValue9 = productValue6;
        productValue10 = productValue7;
        productValue11 = productValue8;
    }
    float comparisonValue = intermediateValue9 ? productValue9 : 0.0;
    float comparisonValue1 = intermediateValue9 ? productValue10 : 0.0;
    float comparisonValue2 = intermediateValue9 ? productValue11 : 0.0;
    fragmentColor0.x = (fragmentVectorConstants1.packedValues[0u].x * comparisonValue) + comparisonValue;
    fragmentColor0.y = (fragmentVectorConstants1.packedValues[0u].x * comparisonValue1) + comparisonValue1;
    fragmentColor0.z = (fragmentVectorConstants1.packedValues[0u].x * comparisonValue2) + comparisonValue2;
    fragmentColor0.w = float(intermediateValue9);
#endif
}
