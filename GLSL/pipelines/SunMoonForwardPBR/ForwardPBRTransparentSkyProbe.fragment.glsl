#version 460
#extension GL_GOOGLE_include_directive : require
// SunMoonForwardPBR / ForwardPBRTransparentSkyProbe / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 1
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
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue4.x;
    float scalarValue7 = sampledTextureValue4.y;
    float scalarValue8 = sampledTextureValue4.z;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[24u])) != 0.0;
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u]));
    float exponentialValue3 = ((reinterpretedBits ? exp2(log2(spvNMax(scalarValue6, 0.0)) * 2.2000000476837158203125) : ((scalarValue6 <= 0.040449999272823333740234375) ? (scalarValue6 * 0.077399380505084991455078125) : exp2(log2((scalarValue6 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))) * uintBitsToFloat(reinterpretedBits1.x)) * reinterpretedBits2;
    float exponentialValue4 = ((reinterpretedBits ? exp2(log2(spvNMax(scalarValue7, 0.0)) * 2.2000000476837158203125) : ((scalarValue7 <= 0.040449999272823333740234375) ? (scalarValue7 * 0.077399380505084991455078125) : exp2(log2((scalarValue7 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))) * uintBitsToFloat(reinterpretedBits1.y)) * reinterpretedBits2;
    float exponentialValue5 = ((reinterpretedBits ? exp2(log2(spvNMax(scalarValue8, 0.0)) * 2.2000000476837158203125) : ((scalarValue8 <= 0.040449999272823333740234375) ? (scalarValue8 * 0.077399380505084991455078125) : exp2(log2((scalarValue8 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))) * uintBitsToFloat(reinterpretedBits1.z)) * reinterpretedBits2;
    float productValue;
    float productValue1;
    float productValue2;
    float productValue3;
    float intermediateValue14;
    float productValue4;
    if (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(sunMoonTextureTexture, sunMoonTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[6u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[1u]);
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[0u]);
        uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[2u]);
        uvec4 reinterpretedBits6 = floatBitsToUint(fragmentVectorConstants1.packedValues[3u]);
        float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
        float multiplyAddValue1 = log2(fma((((-(fma(uintBitsToFloat(reinterpretedBits5.z), varyingColor1.z, fma(uintBitsToFloat(reinterpretedBits4.z), varyingColor1.x, varyingColor1.y * uintBitsToFloat(reinterpretedBits3.z))) + uintBitsToFloat(reinterpretedBits6.z))) / (fma(uintBitsToFloat(reinterpretedBits5.w), varyingColor1.z, fma(uintBitsToFloat(reinterpretedBits4.w), varyingColor1.x, varyingColor1.y * uintBitsToFloat(reinterpretedBits3.w))) + uintBitsToFloat(reinterpretedBits6.w))) - reinterpretedBits7) / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[41u])) - reinterpretedBits7), 53.598148345947265625, 1.0)) * 0.17328679561614990234375;
        float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[22u]));
        float multiplyAddValue2 = fma(multiplyAddValue1, trunc(reinterpretedBits8), -0.5);
        uint sumValue1 = uint(min(int(uint(int(reinterpretedBits8)) - 2u), int(uint(max(int(uint(int(multiplyAddValue2))), int(0u))))));
        float scalarValue9 = rdSignedBitsToFloat(sumValue1);
        float multiplyAddValue3 = fma(varyingColor1.x, 0.5, 0.5);
        float multiplyAddValue4 = fma(varyingColor1.y, 0.5, 0.5);
        vec4 sampledTextureValue5 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(multiplyAddValue3, multiplyAddValue4, scalarValue9), 0.0);
        float scalarValue10 = sampledTextureValue5.w;
        float sampledTextureValue6 = fma(spvNClamp(multiplyAddValue2 - scalarValue9, 0.0, 1.0), textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(multiplyAddValue3, multiplyAddValue4, rdSignedBitsToFloat(sumValue1 + 1u)), 0.0).w - scalarValue10, scalarValue10);
        productValue = exponentialValue3 * sampledTextureValue6;
        productValue1 = exponentialValue4 * sampledTextureValue6;
        productValue2 = exponentialValue5 * sampledTextureValue6;
        productValue3 = (varyingColor1.x + 1.0) * 0.5;
        intermediateValue14 = multiplyAddValue1;
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
        intermediateValue14 = 0.0;
        productValue4 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue = (scalarValue <= 0.040449999272823333740234375) ? (scalarValue * 0.077399380505084991455078125) : exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint intermediateValue15;
    bool sampledTextureValue3;
    if (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u])) > 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue5 = (fragmentVectorConstants1.packedValues[4u].x * exponentialValue) * fragmentVectorConstants1.packedValues[4u].w;
    float productValue9 = (fragmentVectorConstants1.packedValues[4u].y * exponentialValue1) * fragmentVectorConstants1.packedValues[4u].w;
    float productValue10 = (fragmentVectorConstants1.packedValues[4u].z * exponentialValue2) * fragmentVectorConstants1.packedValues[4u].w;
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
        intermediateValue15 = 0u;
        sampledTextureValue3 = textureLod(sampler3D(materialTexture5, textureSampler5), vec3(productValue3, 1.0 - productValue4, (exp2((intermediateValue14 - uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[38u]))) * 5.770780086517333984375) - 1.0) * 0.0186573602259159088134765625), 0.0).y < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue11 = (varyingColor1.x + 1.0) * 0.5;
        float productValue12 = (varyingColor1.y + 1.0) * 0.5;
        float multiplyAddValue = log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[3u].z + fma(fragmentVectorConstants1.packedValues[2u].z, varyingColor1.z, fma(fragmentVectorConstants1.packedValues[1u].z, varyingColor1.y, fragmentVectorConstants1.packedValues[0u].z * varyingColor1.x)))) / (fma(fragmentVectorConstants1.packedValues[2u].w, varyingColor1.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingColor1.y, fragmentVectorConstants1.packedValues[0u].w * varyingColor1.x)) + fragmentVectorConstants1.packedValues[3u].w)) - fragmentVectorConstants1.packedValues[10u].x) / (fragmentVectorConstants1.packedValues[10u].y - fragmentVectorConstants1.packedValues[10u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375;
        uint scalarValue3 = uint(int(fragmentVectorConstants1.packedValues[5u].z));
        float productValue13 = (float(int(scalarValue3)) * multiplyAddValue) + (-0.5);
        uint sumValue = uint(min(int(uint(max(int(uint(int(productValue13))), int(0u)))), int(scalarValue3 + 4294967294u)));
        float scalarValue4 = float(int(sumValue));
        vec4 sampledTextureValue1 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue11, productValue12, scalarValue4), 0.0);
        float scalarValue5 = sampledTextureValue1.w;
        float sampledTextureValue2 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue11, productValue12, float(int(sumValue + 1u))), 0.0).w - scalarValue5) * spvNMin(spvNMax(productValue13 - scalarValue4, 0.0), 1.0)) + scalarValue5;
        productValue6 = sampledTextureValue2 * productValue5;
        productValue7 = sampledTextureValue2 * productValue9;
        productValue8 = sampledTextureValue2 * productValue10;
        intermediateValue6 = productValue11;
        intermediateValue7 = productValue12;
        intermediateValue8 = multiplyAddValue;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue15 = floatBitsToUint(productValue3);
        sampledTextureValue3 = false;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue6 = productValue5;
        productValue7 = productValue9;
        productValue8 = productValue10;
        intermediateValue6 = 0.0;
        intermediateValue7 = 0.0;
        intermediateValue8 = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint comparisonValue = sampledTextureValue3 ? intermediateValue15 : 4294967295u;
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u]));
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    bool reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[28u])) > 0.0;
    fragmentColor0.x = uintBitsToFloat(comparisonValue & (reinterpretedBits11 ? floatBitsToUint(productValue * 0.0033142860047519207000732421875) : floatBitsToUint(productValue)));
    fragmentColor0.y = uintBitsToFloat(comparisonValue & (reinterpretedBits11 ? floatBitsToUint(productValue1 * 0.0033142860047519207000732421875) : floatBitsToUint(productValue1)));
    fragmentColor0.z = uintBitsToFloat(comparisonValue & (reinterpretedBits11 ? floatBitsToUint(productValue2 * 0.0033142860047519207000732421875) : floatBitsToUint(productValue2)));
    fragmentColor0.w = uintBitsToFloat(comparisonValue & floatBitsToUint((spvNMin(spvNMax((varyingColor1.y + 1.0) * 0.5, reinterpretedBits9), reinterpretedBits10) - reinterpretedBits9) / ((reinterpretedBits10 - reinterpretedBits9) + 9.9999997473787516355514526367188e-06)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool intermediateValue9;
    if (fragmentVectorConstants1.packedValues[9u].x > 0.5)
    {
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
    }
    else
    {
        intermediateValue9 = true;
    }
    bool conditionValue = fragmentVectorConstants1.packedValues[7u].x > 0.0;
    fragmentColor0.x = intermediateValue9 ? (conditionValue ? (productValue6 * 0.0033142860047519207000732421875) : productValue6) : 0.0;
    fragmentColor0.y = intermediateValue9 ? (conditionValue ? (productValue7 * 0.0033142860047519207000732421875) : productValue7) : 0.0;
    fragmentColor0.z = intermediateValue9 ? (conditionValue ? (productValue8 * 0.0033142860047519207000732421875) : productValue8) : 0.0;
    fragmentColor0.w = intermediateValue9 ? ((spvNMin(spvNMax((varyingColor1.y + 1.0) * 0.5, fragmentVectorConstants1.packedValues[8u].y), fragmentVectorConstants1.packedValues[8u].x) - fragmentVectorConstants1.packedValues[8u].y) / ((fragmentVectorConstants1.packedValues[8u].x + 9.9999997473787516355514526367188e-06) - fragmentVectorConstants1.packedValues[8u].y)) : 0.0;
#endif
}
