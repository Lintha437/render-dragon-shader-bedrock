#version 460
#extension GL_GOOGLE_include_directive : require
// LegacyCubemapForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
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
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/LegacyCubemapForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue5.x;
    float scalarValue10 = sampledTextureValue5.y;
    float scalarValue11 = sampledTextureValue5.z;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0;
    float exponentialValue5 = reinterpretedBits ? exp2(log2(spvNMax(scalarValue9, 0.0)) * 2.2000000476837158203125) : ((scalarValue9 <= 0.040449999272823333740234375) ? (scalarValue9 * 0.077399380505084991455078125) : exp2(log2((scalarValue9 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue6 = reinterpretedBits ? exp2(log2(spvNMax(scalarValue10, 0.0)) * 2.2000000476837158203125) : ((scalarValue10 <= 0.040449999272823333740234375) ? (scalarValue10 * 0.077399380505084991455078125) : exp2(log2((scalarValue10 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue7 = reinterpretedBits ? exp2(log2(spvNMax(scalarValue11, 0.0)) * 2.2000000476837158203125) : ((scalarValue11 <= 0.040449999272823333740234375) ? (scalarValue11 * 0.077399380505084991455078125) : exp2(log2((scalarValue11 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[99u]));
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[24u]);
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[100u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u]));
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[105u]));
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue1 = fma(exponentialValue5 * ((reinterpretedBits7 * uintBitsToFloat(reinterpretedBits8.x)) * reinterpretedBits9), reinterpretedBits10, fma(exponentialValue5 * uintBitsToFloat(reinterpretedBits1.x), reinterpretedBits6, ((exponentialValue5 * (reinterpretedBits2 * uintBitsToFloat(reinterpretedBits3.x))) * reinterpretedBits4) * reinterpretedBits5));
    float multiplyAddValue2 = fma(exponentialValue6 * ((reinterpretedBits7 * uintBitsToFloat(reinterpretedBits8.y)) * reinterpretedBits9), reinterpretedBits10, fma(exponentialValue6 * uintBitsToFloat(reinterpretedBits1.y), reinterpretedBits6, ((exponentialValue6 * (reinterpretedBits2 * uintBitsToFloat(reinterpretedBits3.y))) * reinterpretedBits4) * reinterpretedBits5));
    float multiplyAddValue6 = fma(exponentialValue7 * ((reinterpretedBits7 * uintBitsToFloat(reinterpretedBits8.z)) * reinterpretedBits9), reinterpretedBits10, fma(exponentialValue7 * uintBitsToFloat(reinterpretedBits1.z), reinterpretedBits6, ((exponentialValue7 * (reinterpretedBits2 * uintBitsToFloat(reinterpretedBits3.z))) * reinterpretedBits4) * reinterpretedBits5));
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if ((uintBitsToFloat(reinterpretedBits11.z) != 0.0) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float reinterpretedBits12 = (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u]))) / (varyingTexCoord3.y + 9.9999997473787516355514526367188e-05);
        vec3 productValue30 = vec3(reinterpretedBits12 * varyingTexCoord3.x, reinterpretedBits12 * varyingTexCoord3.y, reinterpretedBits12 * varyingTexCoord3.z);
        float nonlinearValue3 = spvNClamp((sqrt(rdDot3Precise2(productValue30, productValue30)) / uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]))) - 0.89999997615814208984375, 0.0, 1.0);
        float multiplyAddValue3;
        float multiplyAddValue4;
        float multiplyAddValue5;
        if (nonlinearValue3 > 0.0)
        {
            uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[3u]);
            float multiplyAddValue7 = fma(varyingTexCoord3.x, reinterpretedBits12, -uintBitsToFloat(reinterpretedBits13.x));
            float multiplyAddValue8 = fma(varyingTexCoord3.y, reinterpretedBits12, -uintBitsToFloat(reinterpretedBits13.y));
            float multiplyAddValue9 = fma(varyingTexCoord3.z, reinterpretedBits12, -uintBitsToFloat(reinterpretedBits13.z));
            vec3 vectorValue = vec3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9);
            float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
            float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[87u]));
            uvec4 reinterpretedBits15 = floatBitsToUint(fragmentVectorConstants1.packedValues[27u]);
            float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[111u]));
            uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[23u]);
            float reinterpretedBits18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[95u]));
            float reinterpretedBits19 = reinterpretedBits14 - uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
            float multiplyAddValue10 = fma(multiplyAddValue8, inverseLengthValue1, reinterpretedBits19);
            float reinterpretedBits20 = spvNClamp((1.0 / (reinterpretedBits19 + (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[86u])) - reinterpretedBits14))) * multiplyAddValue10, 0.0, 1.0);
            float multiplyAddValue11 = fma(-fma(reinterpretedBits20, -2.0, 3.0), reinterpretedBits20 * reinterpretedBits20, 1.0);
            float productValue31 = multiplyAddValue11 * (multiplyAddValue11 * multiplyAddValue11);
            vec3 productValue32 = vec3(inverseLengthValue1 * multiplyAddValue7, inverseLengthValue1 * multiplyAddValue8, inverseLengthValue1 * multiplyAddValue9);
            uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
            float reinterpretedBits22 = rdDot3Precise2(productValue32, vec3(uintBitsToFloat(reinterpretedBits21.x), uintBitsToFloat(reinterpretedBits21.y), uintBitsToFloat(reinterpretedBits21.z)));
            uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
            float reinterpretedBits24 = rdDot3Precise2(productValue32, vec3(uintBitsToFloat(reinterpretedBits23.x), uintBitsToFloat(reinterpretedBits23.y), uintBitsToFloat(reinterpretedBits23.z)));
            float reinterpretedBits25 = spvNClamp(multiplyAddValue10 * (1.0 / (reinterpretedBits19 + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[85u])))), 0.0, 1.0);
            float multiplyAddValue12 = fma(-fma(reinterpretedBits25, -2.0, 3.0), reinterpretedBits25 * reinterpretedBits25, 1.0);
            float productValue33 = multiplyAddValue12 * (multiplyAddValue12 * multiplyAddValue12);
            uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
            float reinterpretedBits27 = uintBitsToFloat(reinterpretedBits26.x);
            float reinterpretedBits28 = uintBitsToFloat(reinterpretedBits26.y);
            float reinterpretedBits29 = uintBitsToFloat(reinterpretedBits26.z);
            uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
            float reinterpretedBits31 = uintBitsToFloat(reinterpretedBits30.x);
            float reinterpretedBits32 = uintBitsToFloat(reinterpretedBits30.y);
            float reinterpretedBits33 = uintBitsToFloat(reinterpretedBits30.z);
            float reinterpretedBits34 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
            float multiplyAddValue13 = fma(fma(reinterpretedBits22, reinterpretedBits22, 1.0) * reinterpretedBits16, 0.75, (fma(reinterpretedBits24, reinterpretedBits24, 1.0) * reinterpretedBits18) * 0.75);
            float reinterpretedBits35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u]));
            float exponentialValue8 = spvNMin(exp2(log2(spvNMax(reinterpretedBits24, 0.0)) * reinterpretedBits35), 1.0);
            float exponentialValue9 = spvNMin(exp2(log2(spvNMax(reinterpretedBits22, 0.0)) * reinterpretedBits35), 1.0);
            float multiplyAddValue14 = fma(-exponentialValue9, 1.7999999523162841796875, 1.809999942779541015625);
            float multiplyAddValue15 = fma(-exponentialValue8, 1.7999999523162841796875, 1.809999942779541015625);
            float nonlinearValue4 = 0.0361000001430511474609375 / (sqrt(multiplyAddValue14) * multiplyAddValue14);
            float nonlinearValue5 = 0.0361000001430511474609375 / (multiplyAddValue15 * sqrt(multiplyAddValue15));
            float reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[41u]));
            float reinterpretedBits37 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[42u]));
            multiplyAddValue5 = fma(nonlinearValue3, fma((fma(productValue33, reinterpretedBits31 - reinterpretedBits27, reinterpretedBits27) * reinterpretedBits34) * 0.079577468335628509521484375, multiplyAddValue13, fma(exponentialValue9 * ((uintBitsToFloat(reinterpretedBits15.x) * reinterpretedBits16) * reinterpretedBits36), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((uintBitsToFloat(reinterpretedBits17.x) * reinterpretedBits18) * reinterpretedBits37))) * ((productValue31 * reinterpretedBits31) * 0.079577468335628509521484375)) - multiplyAddValue1, multiplyAddValue1);
            multiplyAddValue4 = fma(nonlinearValue3, fma((fma(productValue33, reinterpretedBits32 - reinterpretedBits28, reinterpretedBits28) * reinterpretedBits34) * 0.079577468335628509521484375, multiplyAddValue13, fma(exponentialValue9 * ((uintBitsToFloat(reinterpretedBits15.y) * reinterpretedBits16) * reinterpretedBits36), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((uintBitsToFloat(reinterpretedBits17.y) * reinterpretedBits18) * reinterpretedBits37))) * ((productValue31 * reinterpretedBits32) * 0.079577468335628509521484375)) - multiplyAddValue2, multiplyAddValue2);
            multiplyAddValue3 = fma(nonlinearValue3, fma((fma(productValue33, reinterpretedBits33 - reinterpretedBits29, reinterpretedBits29) * reinterpretedBits34) * 0.079577468335628509521484375, multiplyAddValue13, fma(exponentialValue9 * ((uintBitsToFloat(reinterpretedBits15.z) * reinterpretedBits16) * reinterpretedBits36), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((uintBitsToFloat(reinterpretedBits17.z) * reinterpretedBits18) * reinterpretedBits37))) * ((productValue31 * reinterpretedBits33) * 0.079577468335628509521484375)) - multiplyAddValue6, multiplyAddValue6);
        }
        else
        {
            multiplyAddValue5 = multiplyAddValue1;
            multiplyAddValue4 = multiplyAddValue2;
            multiplyAddValue3 = multiplyAddValue6;
        }
        intermediateValue16 = multiplyAddValue3;
        intermediateValue17 = multiplyAddValue4;
        intermediateValue18 = multiplyAddValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue = exp2(log2(spvNMax(scalarValue, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125);
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue16 = multiplyAddValue6;
        intermediateValue17 = multiplyAddValue2;
        intermediateValue18 = multiplyAddValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue = (scalarValue <= 0.040449999272823333740234375) ? (scalarValue * 0.077399380505084991455078125) : exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue18;
    float multiplyAddValue19;
    float multiplyAddValue20;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u])) != 0.0) && (uintBitsToFloat(reinterpretedBits11.w) != 0.0))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = fragmentVectorConstants1.packedValues[19u].w * (fragmentVectorConstants1.packedValues[26u].x * fragmentVectorConstants1.packedValues[24u].w);
    float productValue1 = fragmentVectorConstants1.packedValues[20u].x * (fragmentVectorConstants1.packedValues[15u].w * fragmentVectorConstants1.packedValues[26u].y);
    float productValue2 = (((productValue * fragmentVectorConstants1.packedValues[24u].x) + (fragmentVectorConstants1.packedValues[25u].x * fragmentVectorConstants1.packedValues[9u].x)) + (productValue1 * fragmentVectorConstants1.packedValues[15u].x)) * exponentialValue;
    float productValue3 = (((productValue * fragmentVectorConstants1.packedValues[24u].y) + (fragmentVectorConstants1.packedValues[25u].x * fragmentVectorConstants1.packedValues[9u].y)) + (productValue1 * fragmentVectorConstants1.packedValues[15u].y)) * exponentialValue1;
    float productValue4 = (((productValue * fragmentVectorConstants1.packedValues[24u].z) + (fragmentVectorConstants1.packedValues[25u].x * fragmentVectorConstants1.packedValues[9u].z)) + (productValue1 * fragmentVectorConstants1.packedValues[15u].z)) * exponentialValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if ((fragmentVectorConstants1.packedValues[26u].z != 0.0) && (fragmentVectorConstants1.packedValues[12u].x != 0.0))
    {
        float quotientValue = (fragmentVectorConstants1.packedValues[14u].y + fragmentVectorConstants1.packedValues[8u].y) / (varyingTexCoord3.y + 9.9999997473787516355514526367188e-05);
        float productValue5 = quotientValue * varyingTexCoord3.x;
        float productValue6 = quotientValue * varyingTexCoord3.y;
        float productValue7 = quotientValue * varyingTexCoord3.z;
        float nonlinearValue = spvNClamp(spvNMax((sqrt(((productValue5 * productValue5) + (productValue6 * productValue6)) + (productValue7 * productValue7)) / fragmentVectorConstants1.packedValues[8u].x) + (-0.89999997615814208984375), 0.0), 0.0, 1.0);
        float branchMergedValue;
        float branchMergedValue2;
        float branchMergedValue3;
        if (nonlinearValue > 0.0)
        {
            float sumValue = productValue5 - fragmentVectorConstants1.packedValues[3u].x;
            float sumValue1 = productValue6 - fragmentVectorConstants1.packedValues[3u].y;
            float sumValue2 = productValue7 - fragmentVectorConstants1.packedValues[3u].z;
            float inverseLengthValue = inversesqrt(dot(vec3(sumValue, sumValue1, sumValue2), vec3(sumValue, sumValue1, sumValue2)));
            float productValue8 = inverseLengthValue * sumValue;
            float productValue9 = inverseLengthValue * sumValue1;
            float productValue10 = inverseLengthValue * sumValue2;
            float quotientValue1 = spvNClamp(((fragmentVectorConstants1.packedValues[21u].w - fragmentVectorConstants1.packedValues[21u].x) + productValue9) / (fragmentVectorConstants1.packedValues[21u].z - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
            float productValue11 = 1.0 - ((quotientValue1 * quotientValue1) * (3.0 - (quotientValue1 * 2.0)));
            float productValue12 = (productValue11 * productValue11) * productValue11;
            float dotProductValue = dot(vec3(productValue8, productValue9, productValue10), vec3(fragmentVectorConstants1.packedValues[28u].xyz));
            float dotProductValue1 = dot(vec3(productValue8, productValue9, productValue10), vec3(fragmentVectorConstants1.packedValues[13u].xyz));
            float sumValue3 = fragmentVectorConstants1.packedValues[21u].x - fragmentVectorConstants1.packedValues[21u].w;
            float quotientValue2 = spvNClamp((productValue9 - sumValue3) / (fragmentVectorConstants1.packedValues[21u].y - sumValue3), 0.0, 1.0);
            float productValue13 = 1.0 - ((quotientValue2 * quotientValue2) * (3.0 - (quotientValue2 * 2.0)));
            float productValue14 = (productValue13 * productValue13) * productValue13;
            float productValue15 = (fragmentVectorConstants1.packedValues[10u].x * 0.75) * ((((dotProductValue1 * dotProductValue1) + 1.0) * fragmentVectorConstants1.packedValues[23u].w) + (((dotProductValue * dotProductValue) + 1.0) * fragmentVectorConstants1.packedValues[27u].w));
            float exponentialValue3 = spvNClamp(exp2(log2(spvNMax(dotProductValue, 0.0)) * fragmentVectorConstants1.packedValues[10u].w), 0.0, 1.0);
            float exponentialValue4 = spvNClamp(exp2(log2(spvNMax(dotProductValue1, 0.0)) * fragmentVectorConstants1.packedValues[10u].w), 0.0, 1.0);
            float productValue16 = 1.809999942779541015625 - (exponentialValue3 * 1.7999999523162841796875);
            float nonlinearValue1 = 0.036100022494792938232421875 / (sqrt(productValue16) * productValue16);
            float productValue17 = 1.809999942779541015625 - (exponentialValue4 * 1.7999999523162841796875);
            float nonlinearValue2 = 0.036100022494792938232421875 / (sqrt(productValue17) * productValue17);
            float productValue18 = exponentialValue3 * (fragmentVectorConstants1.packedValues[10u].y * fragmentVectorConstants1.packedValues[27u].w);
            float productValue19 = exponentialValue4 * (fragmentVectorConstants1.packedValues[10u].z * fragmentVectorConstants1.packedValues[23u].w);
            branchMergedValue = ((((((productValue12 * fragmentVectorConstants1.packedValues[17u].x) * (((productValue19 * fragmentVectorConstants1.packedValues[23u].x) * nonlinearValue2) + ((productValue18 * fragmentVectorConstants1.packedValues[27u].x) * nonlinearValue1))) + (((productValue14 * (fragmentVectorConstants1.packedValues[17u].x - fragmentVectorConstants1.packedValues[11u].x)) + fragmentVectorConstants1.packedValues[11u].x) * productValue15)) * 0.079577468335628509521484375) - productValue2) * nonlinearValue) + productValue2;
            branchMergedValue2 = ((((((productValue12 * fragmentVectorConstants1.packedValues[17u].y) * (((productValue19 * fragmentVectorConstants1.packedValues[23u].y) * nonlinearValue2) + ((productValue18 * fragmentVectorConstants1.packedValues[27u].y) * nonlinearValue1))) + (((productValue14 * (fragmentVectorConstants1.packedValues[17u].y - fragmentVectorConstants1.packedValues[11u].y)) + fragmentVectorConstants1.packedValues[11u].y) * productValue15)) * 0.079577468335628509521484375) - productValue3) * nonlinearValue) + productValue3;
            branchMergedValue3 = ((((((productValue12 * fragmentVectorConstants1.packedValues[17u].z) * (((productValue19 * fragmentVectorConstants1.packedValues[23u].z) * nonlinearValue2) + ((productValue18 * fragmentVectorConstants1.packedValues[27u].z) * nonlinearValue1))) + (((productValue14 * (fragmentVectorConstants1.packedValues[17u].z - fragmentVectorConstants1.packedValues[11u].z)) + fragmentVectorConstants1.packedValues[11u].z) * productValue15)) * 0.079577468335628509521484375) - productValue4) * nonlinearValue) + productValue4;
        }
        else
        {
            branchMergedValue = productValue2;
            branchMergedValue2 = productValue3;
            branchMergedValue3 = productValue4;
        }
        intermediateValue3 = branchMergedValue;
        intermediateValue4 = branchMergedValue2;
        intermediateValue5 = branchMergedValue3;
    }
    else
    {
        intermediateValue3 = productValue2;
        intermediateValue4 = productValue3;
        intermediateValue5 = productValue4;
    }
    float productValue24;
    float productValue25;
    float productValue26;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((fragmentVectorConstants1.packedValues[26u].w != 0.0) && (fragmentVectorConstants1.packedValues[31u].x != 0.0))
#endif
    {
        float quotientValue3 = varyingTexCoord1.x / varyingTexCoord1.w;
        float quotientValue4 = varyingTexCoord1.y / varyingTexCoord1.w;
        float quotientValue5 = varyingTexCoord1.z / varyingTexCoord1.w;
        float productValue20 = (quotientValue3 + 1.0) * 0.5;
        float productValue21 = (quotientValue4 + 1.0) * 0.5;
#if RD_PLATFORM == RD_PLATFORM_SM50
        uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[5u]);
        uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[6u]);
        uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        float reinterpretedBits42 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        float multiplyAddValue16 = log2(fma((((-(fma(uintBitsToFloat(reinterpretedBits40.z), quotientValue5, fma(uintBitsToFloat(reinterpretedBits39.z), quotientValue3, quotientValue4 * uintBitsToFloat(reinterpretedBits38.z))) + uintBitsToFloat(reinterpretedBits41.z))) / (fma(uintBitsToFloat(reinterpretedBits40.w), quotientValue5, fma(uintBitsToFloat(reinterpretedBits39.w), quotientValue3, quotientValue4 * uintBitsToFloat(reinterpretedBits38.w))) + uintBitsToFloat(reinterpretedBits41.w))) - reinterpretedBits42) / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[121u])) - reinterpretedBits42), 53.598148345947265625, 1.0)) * 0.17328679561614990234375;
        float reinterpretedBits43 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[118u]));
        float multiplyAddValue17 = fma(multiplyAddValue16, trunc(reinterpretedBits43), -0.5);
        uint sumValue6 = uint(min(int(uint(int(reinterpretedBits43)) - 2u), int(uint(max(int(uint(int(multiplyAddValue17))), int(0u))))));
        float scalarValue12 = rdSignedBitsToFloat(sumValue6);
        float sumValue7 = spvNClamp(multiplyAddValue17 - scalarValue12, 0.0, 1.0);
        vec4 sampledTextureValue6 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(productValue20, productValue21, scalarValue12), 0.0);
        float scalarValue13 = sampledTextureValue6.x;
        float scalarValue14 = sampledTextureValue6.y;
        float scalarValue15 = sampledTextureValue6.z;
        float scalarValue16 = sampledTextureValue6.w;
        vec4 sampledTextureValue7 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(productValue20, productValue21, rdSignedBitsToFloat(sumValue6 + 1u)), 0.0);
        float multiplyAddValue21 = fma(sumValue7, sampledTextureValue7.w - scalarValue16, scalarValue16);
        multiplyAddValue18 = fma(multiplyAddValue21, intermediateValue18, fma(sumValue7, sampledTextureValue7.x - scalarValue13, scalarValue13));
        multiplyAddValue19 = fma(multiplyAddValue21, intermediateValue17, fma(sumValue7, sampledTextureValue7.y - scalarValue14, scalarValue14));
        multiplyAddValue20 = fma(multiplyAddValue21, intermediateValue16, fma(sumValue7, sampledTextureValue7.z - scalarValue15, scalarValue15));
        intermediateValue25 = productValue20;
        intermediateValue26 = multiplyAddValue16;
        intermediateValue27 = productValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float multiplyAddValue = log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[7u].z + fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue5, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue4, quotientValue3 * fragmentVectorConstants1.packedValues[4u].z)))) / (fma(fragmentVectorConstants1.packedValues[6u].w, quotientValue5, fma(fragmentVectorConstants1.packedValues[5u].w, quotientValue4, quotientValue3 * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w)) - fragmentVectorConstants1.packedValues[30u].x) / (fragmentVectorConstants1.packedValues[30u].y - fragmentVectorConstants1.packedValues[30u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375;
        uint scalarValue3 = uint(int(fragmentVectorConstants1.packedValues[29u].z));
        float productValue22 = (float(int(scalarValue3)) * multiplyAddValue) + (-0.5);
        uint sumValue4 = uint(min(int(uint(max(int(uint(int(productValue22))), int(0u)))), int(scalarValue3 + 4294967294u)));
        float scalarValue4 = float(int(sumValue4));
        float sumValue5 = spvNMin(spvNMax(productValue22 - scalarValue4, 0.0), 1.0);
        vec4 sampledTextureValue1 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue20, productValue21, scalarValue4), 0.0);
        float scalarValue5 = sampledTextureValue1.x;
        float scalarValue6 = sampledTextureValue1.y;
        float scalarValue7 = sampledTextureValue1.z;
        float scalarValue8 = sampledTextureValue1.w;
        vec4 sampledTextureValue2 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue20, productValue21, float(int(sumValue4 + 1u))), 0.0);
        float productValue23 = ((sampledTextureValue2.w - scalarValue8) * sumValue5) + scalarValue8;
        productValue24 = (((sampledTextureValue2.x - scalarValue5) * sumValue5) + scalarValue5) + (productValue23 * intermediateValue3);
        productValue25 = (((sampledTextureValue2.y - scalarValue6) * sumValue5) + scalarValue6) + (productValue23 * intermediateValue4);
        productValue26 = (((sampledTextureValue2.z - scalarValue7) * sumValue5) + scalarValue7) + (productValue23 * intermediateValue5);
        intermediateValue12 = productValue20;
        intermediateValue13 = productValue21;
        intermediateValue14 = multiplyAddValue;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue18 = intermediateValue18;
        multiplyAddValue19 = intermediateValue17;
        multiplyAddValue20 = intermediateValue16;
        intermediateValue25 = 0.0;
        intermediateValue26 = 0.0;
        intermediateValue27 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue24 = intermediateValue3;
        productValue25 = intermediateValue4;
        productValue26 = intermediateValue5;
        intermediateValue12 = 0.0;
        intermediateValue13 = 0.0;
        intermediateValue14 = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u])) > 0.5;
    bool intermediateValue28;
    bool sampledTextureValue3;
    if (reinterpretedBits44)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool intermediateValue15;
    if (fragmentVectorConstants1.packedValues[22u].x > 0.5)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue28 = true;
        sampledTextureValue3 = textureLod(sampler3D(materialTexture5, textureSampler5), vec3(intermediateValue25, 1.0 - intermediateValue27, (exp2((intermediateValue26 - uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]))) * 5.770780086517333984375) - 1.0) * 0.0186573602259159088134765625), 0.0).y < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[91u]));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        bool branchMergedValue1;
        if (textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(intermediateValue12, 1.0 - intermediateValue13, (exp2((intermediateValue14 - fragmentVectorConstants1.packedValues[22u].z) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625), 0.0).y < fragmentVectorConstants1.packedValues[22u].w)
        {
            branchMergedValue1 = false;
        }
        else
        {
            branchMergedValue1 = true;
        }
        intermediateValue15 = branchMergedValue1;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue28 = !reinterpretedBits44;
        sampledTextureValue3 = false;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue15 = true;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool bitwiseValue = intermediateValue28 && sampledTextureValue3;
    float comparisonValue;
    float comparisonValue1;
    float comparisonValue2;
    if (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u])) > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float comparisonValue3 = intermediateValue15 ? productValue24 : 0.0;
    float comparisonValue4 = intermediateValue15 ? productValue25 : 0.0;
    float comparisonValue5 = intermediateValue15 ? productValue26 : 0.0;
    float productValue27;
    float productValue28;
    float productValue29;
    if (fragmentVectorConstants1.packedValues[18u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue8 = (0.180000007152557373046875 / texture(sampler2D(materialTexture1, textureSampler1), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        comparisonValue = bitwiseValue ? 0.0 : (sampledTextureValue8 * multiplyAddValue20);
        comparisonValue1 = bitwiseValue ? 0.0 : (sampledTextureValue8 * multiplyAddValue19);
        comparisonValue2 = bitwiseValue ? 0.0 : (sampledTextureValue8 * multiplyAddValue18);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue4 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue27 = sampledTextureValue4 * comparisonValue3;
        productValue28 = sampledTextureValue4 * comparisonValue4;
        productValue29 = sampledTextureValue4 * comparisonValue5;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        comparisonValue = bitwiseValue ? 0.0 : multiplyAddValue20;
        comparisonValue1 = bitwiseValue ? 0.0 : multiplyAddValue19;
        comparisonValue2 = bitwiseValue ? 0.0 : multiplyAddValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue27 = comparisonValue3;
        productValue28 = comparisonValue4;
        productValue29 = comparisonValue5;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = comparisonValue2;
    fragmentColor0.y = comparisonValue1;
    fragmentColor0.z = comparisonValue;
    fragmentColor0.w = bitwiseValue ? 0.0 : sampledTextureValue5.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue27;
    fragmentColor0.y = productValue28;
    fragmentColor0.z = productValue29;
    fragmentColor0.w = intermediateValue15 ? sampledTextureValue.w : 0.0;
#endif
}
