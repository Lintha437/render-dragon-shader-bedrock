#version 460
#extension GL_GOOGLE_include_directive : require
// StarsForwardPBR / ForwardPBRTransparentSkyProbe / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/StarsForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[6u]);
    float reinterpretedBits1 = (varyingColor0.w * uintBitsToFloat(reinterpretedBits.x)) * varyingColor0.x;
    float reinterpretedBits2 = (varyingColor0.w * uintBitsToFloat(reinterpretedBits.y)) * varyingColor0.y;
    float reinterpretedBits3 = (varyingColor0.w * uintBitsToFloat(reinterpretedBits.z)) * varyingColor0.z;
    float productValue;
    float productValue1;
    float productValue2;
    float productValue3;
    float intermediateValue9;
    float productValue4;
    if (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue5 = (varyingColor0.w * varyingColor0.x) * fragmentVectorConstants1.packedValues[6u].x;
    float productValue9 = (varyingColor0.w * varyingColor0.y) * fragmentVectorConstants1.packedValues[6u].y;
    float productValue10 = (varyingColor0.w * varyingColor0.z) * fragmentVectorConstants1.packedValues[6u].z;
    float productValue6;
    float productValue7;
    float productValue8;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[1u]);
        uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[0u]);
        uvec4 reinterpretedBits6 = floatBitsToUint(fragmentVectorConstants1.packedValues[2u]);
        uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[3u]);
        float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
        float multiplyAddValue1 = log2(fma((((-(fma(uintBitsToFloat(reinterpretedBits6.z), varyingColor1.z, fma(uintBitsToFloat(reinterpretedBits5.z), varyingColor1.x, varyingColor1.y * uintBitsToFloat(reinterpretedBits4.z))) + uintBitsToFloat(reinterpretedBits7.z))) / (fma(uintBitsToFloat(reinterpretedBits6.w), varyingColor1.z, fma(uintBitsToFloat(reinterpretedBits5.w), varyingColor1.x, varyingColor1.y * uintBitsToFloat(reinterpretedBits4.w))) + uintBitsToFloat(reinterpretedBits7.w))) - reinterpretedBits8) / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[37u])) - reinterpretedBits8), 53.598148345947265625, 1.0)) * 0.17328679561614990234375;
        float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[18u]));
        float multiplyAddValue2 = fma(multiplyAddValue1, trunc(reinterpretedBits9), -0.5);
        uint sumValue1 = uint(min(int(uint(int(reinterpretedBits9)) - 2u), int(uint(max(int(uint(int(multiplyAddValue2))), int(0u))))));
        float scalarValue3 = rdSignedBitsToFloat(sumValue1);
        float multiplyAddValue3 = fma(varyingColor1.x, 0.5, 0.5);
        float multiplyAddValue4 = fma(varyingColor1.y, 0.5, 0.5);
        vec4 sampledTextureValue3 = textureLod(sampler2DArray(materialTexture2, textureSampler2), vec3(multiplyAddValue3, multiplyAddValue4, scalarValue3), 0.0);
        float scalarValue4 = sampledTextureValue3.w;
        float sampledTextureValue4 = fma(spvNClamp(multiplyAddValue2 - scalarValue3, 0.0, 1.0), textureLod(sampler2DArray(materialTexture2, textureSampler2), vec3(multiplyAddValue3, multiplyAddValue4, rdSignedBitsToFloat(sumValue1 + 1u)), 0.0).w - scalarValue4, scalarValue4);
        productValue = reinterpretedBits1 * sampledTextureValue4;
        productValue1 = reinterpretedBits2 * sampledTextureValue4;
        productValue2 = reinterpretedBits3 * sampledTextureValue4;
        productValue3 = (varyingColor1.x + 1.0) * 0.5;
        intermediateValue9 = multiplyAddValue1;
        productValue4 = (varyingColor1.y + 1.0) * 0.5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue11 = (varyingColor1.x + 1.0) * 0.5;
        float productValue15 = (varyingColor1.y + 1.0) * 0.5;
        float multiplyAddValue = log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[3u].z + fma(fragmentVectorConstants1.packedValues[2u].z, varyingColor1.z, fma(fragmentVectorConstants1.packedValues[1u].z, varyingColor1.y, fragmentVectorConstants1.packedValues[0u].z * varyingColor1.x)))) / (fma(fragmentVectorConstants1.packedValues[2u].w, varyingColor1.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingColor1.y, fragmentVectorConstants1.packedValues[0u].w * varyingColor1.x)) + fragmentVectorConstants1.packedValues[3u].w)) - fragmentVectorConstants1.packedValues[9u].x) / (fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[9u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375;
        uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[4u].z));
        float productValue16 = (float(int(scalarValue)) * multiplyAddValue) + (-0.5);
        uint sumValue = uint(min(int(uint(max(int(uint(int(productValue16))), int(0u)))), int(scalarValue + 4294967294u)));
        float scalarValue1 = float(int(sumValue));
        vec4 sampledTextureValue = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue11, productValue15, scalarValue1), 0.0);
        float scalarValue2 = sampledTextureValue.w;
        float sampledTextureValue1 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue11, productValue15, float(int(sumValue + 1u))), 0.0).w - scalarValue2) * spvNMin(spvNMax(productValue16 - scalarValue1, 0.0), 1.0)) + scalarValue2;
        productValue6 = sampledTextureValue1 * productValue5;
        productValue7 = sampledTextureValue1 * productValue9;
        productValue8 = sampledTextureValue1 * productValue10;
        intermediateValue3 = productValue11;
        intermediateValue4 = productValue15;
        intermediateValue5 = multiplyAddValue;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        productValue = reinterpretedBits1;
        productValue1 = reinterpretedBits2;
        productValue2 = reinterpretedBits3;
        productValue3 = 0.0;
        intermediateValue9 = 0.0;
        productValue4 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue6 = productValue5;
        productValue7 = productValue9;
        productValue8 = productValue10;
        intermediateValue3 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint intermediateValue10;
    bool sampledTextureValue2;
    if (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u])) > 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool intermediateValue6;
    if (fragmentVectorConstants1.packedValues[8u].x > 0.5)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue10 = 0u;
        sampledTextureValue2 = textureLod(sampler3D(materialTexture4, textureSampler4), vec3(productValue3, 1.0 - productValue4, (exp2((intermediateValue9 - uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]))) * 5.770780086517333984375) - 1.0) * 0.0186573602259159088134765625), 0.0).y < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        bool branchMergedValue;
        if (textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(intermediateValue3, 1.0 - intermediateValue4, (exp2((intermediateValue5 - fragmentVectorConstants1.packedValues[8u].z) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625), 0.0).y < fragmentVectorConstants1.packedValues[8u].w)
        {
            branchMergedValue = false;
        }
        else
        {
            branchMergedValue = true;
        }
        intermediateValue6 = branchMergedValue;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue10 = floatBitsToUint(productValue3);
        sampledTextureValue2 = false;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue6 = true;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint comparisonValue = sampledTextureValue2 ? intermediateValue10 : 4294967295u;
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[29u]));
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[28u]));
    float quotientValue1 = (spvNMin(spvNMax((varyingColor1.y + 1.0) * 0.5, reinterpretedBits10), reinterpretedBits11) - reinterpretedBits10) / ((reinterpretedBits11 - reinterpretedBits10) + 9.9999997473787516355514526367188e-06);
    float productValue20 = productValue * quotientValue1;
    float productValue21 = productValue1 * quotientValue1;
    float productValue22 = productValue2 * quotientValue1;
    bool reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u])) > 0.0;
    fragmentColor0.x = uintBitsToFloat(comparisonValue & floatBitsToUint(reinterpretedBits12 ? (productValue20 * 0.0033142860047519207000732421875) : productValue20));
    fragmentColor0.y = uintBitsToFloat(comparisonValue & floatBitsToUint(reinterpretedBits12 ? (productValue21 * 0.0033142860047519207000732421875) : productValue21));
    fragmentColor0.z = uintBitsToFloat(comparisonValue & floatBitsToUint(reinterpretedBits12 ? (productValue22 * 0.0033142860047519207000732421875) : productValue22));
    fragmentColor0.w = uintBitsToFloat(comparisonValue & floatBitsToUint(varyingColor0.w));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float quotientValue = (spvNMin(spvNMax((varyingColor1.y + 1.0) * 0.5, fragmentVectorConstants1.packedValues[7u].y), fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[7u].y) / ((fragmentVectorConstants1.packedValues[7u].x + 9.9999997473787516355514526367188e-06) - fragmentVectorConstants1.packedValues[7u].y);
    float productValue17 = quotientValue * productValue6;
    float productValue18 = quotientValue * productValue7;
    float productValue19 = quotientValue * productValue8;
    float productValue12;
    float productValue13;
    float productValue14;
    if (fragmentVectorConstants1.packedValues[5u].x > 0.0)
    {
        productValue12 = productValue17 * 0.0033142860047519207000732421875;
        productValue13 = productValue18 * 0.0033142860047519207000732421875;
        productValue14 = productValue19 * 0.0033142860047519207000732421875;
    }
    else
    {
        productValue12 = productValue17;
        productValue13 = productValue18;
        productValue14 = productValue19;
    }
    fragmentColor0.x = intermediateValue6 ? productValue12 : 0.0;
    fragmentColor0.y = intermediateValue6 ? productValue13 : 0.0;
    fragmentColor0.z = intermediateValue6 ? productValue14 : 0.0;
    fragmentColor0.w = intermediateValue6 ? varyingColor0.w : 0.0;
#endif
}
