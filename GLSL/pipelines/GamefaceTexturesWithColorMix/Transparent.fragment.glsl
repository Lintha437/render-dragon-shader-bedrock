#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceTexturesWithColorMix / Transparent / fragment forward pipeline.
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
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/GamefaceTexturesWithColorMix/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint bitwiseValue6 = (uint(varyingTexCoord3.z) << 4u) + ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint productValue37 = uint(int(fragmentScalarConstants1.packedValues[bitwiseValue6 * 4u]));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord4.z, fragmentVectorConstants1.packedValues[129u].z, fragmentVectorConstants1.packedValues[129u].x), fma(varyingTexCoord4.w, fragmentVectorConstants1.packedValues[129u].w, fragmentVectorConstants1.packedValues[129u].y)));
    float scalarValue18 = sampledTextureValue2.x;
    float scalarValue19 = sampledTextureValue2.y;
    float scalarValue20 = sampledTextureValue2.z;
    float scalarValue21 = sampledTextureValue2.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
    float scalarValue22 = sampledTextureValue3.w;
    uint bitwiseValue7 = (((16u * bitwiseValue6) + 16u) + 12u) >> 2u;
    precise float productValue38 = sampledTextureValue3.x * fragmentScalarConstants1.packedValues[bitwiseValue7];
    precise float productValue39 = sampledTextureValue3.y * fragmentScalarConstants1.packedValues[bitwiseValue7];
    precise float productValue40 = sampledTextureValue3.z * fragmentScalarConstants1.packedValues[bitwiseValue7];
    precise float productValue41 = scalarValue22 * fragmentScalarConstants1.packedValues[bitwiseValue7];
    float scalarValue23 = spvNMax(scalarValue21, 9.9999997473787516355514526367188e-05);
    precise float quotientValue24 = scalarValue18 / scalarValue23;
    precise float quotientValue25 = scalarValue19 / scalarValue23;
    precise float quotientValue26 = scalarValue20 / scalarValue23;
    float scalarValue37 = spvNMax(productValue41, 9.9999997473787516355514526367188e-05);
    precise float quotientValue27 = productValue38 / scalarValue37;
    precise float quotientValue28 = productValue39 / scalarValue37;
    precise float quotientValue29 = productValue40 / scalarValue37;
    precise float sumValue71 = 1.0 - scalarValue21;
    precise float productValue42 = scalarValue21 * productValue41;
    vec3 vectorValue2 = vec3(quotientValue24, quotientValue25, quotientValue26);
    vec3 vectorValue3 = vec3(quotientValue27, quotientValue28, quotientValue29);
    float intermediateValue31;
    float intermediateValue32;
    float intermediateValue33;
    switch (uint(int(fragmentScalarConstants1.packedValues[productValue37 * 4u])))
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue17 = bitfieldInsert(bitfieldExtract(uint(varyingTexCoord3.y), int(4u), int(4u)), uint(varyingTexCoord3.z), int(4u), int(28u));
    uint productValue31 = uint(int(fragmentScalarConstants1.packedValues[scalarValue17 * 4u]));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord4.z, fragmentVectorConstants1.packedValues[129u].z, fragmentVectorConstants1.packedValues[129u].x), fma(varyingTexCoord4.w, fragmentVectorConstants1.packedValues[129u].w, fragmentVectorConstants1.packedValues[129u].y)));
    float scalarValue18 = sampledTextureValue2.x;
    float scalarValue19 = sampledTextureValue2.y;
    float scalarValue20 = sampledTextureValue2.z;
    float scalarValue21 = sampledTextureValue2.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
    float scalarValue22 = sampledTextureValue3.w;
    uint bitwiseValue1 = (((16u * scalarValue17) + 16u) + 12u) >> 2u;
    float productValue32 = sampledTextureValue3.x * fragmentScalarConstants1.packedValues[bitwiseValue1];
    float productValue33 = sampledTextureValue3.y * fragmentScalarConstants1.packedValues[bitwiseValue1];
    float productValue34 = sampledTextureValue3.z * fragmentScalarConstants1.packedValues[bitwiseValue1];
    float productValue35 = scalarValue22 * fragmentScalarConstants1.packedValues[bitwiseValue1];
    float scalarValue23 = spvNMax(scalarValue21, 9.9999997473787516355514526367188e-05);
    float quotientValue18 = scalarValue18 / scalarValue23;
    float quotientValue19 = scalarValue19 / scalarValue23;
    float quotientValue20 = scalarValue20 / scalarValue23;
    float scalarValue24 = spvNMax(productValue35, 9.9999997473787516355514526367188e-05);
    float quotientValue21 = productValue32 / scalarValue24;
    float quotientValue22 = productValue33 / scalarValue24;
    float quotientValue23 = productValue34 / scalarValue24;
    float sumValue32 = 1.0 - scalarValue21;
    float productValue36 = scalarValue21 * productValue35;
    vec3 vectorValue = vec3(quotientValue18, quotientValue19, quotientValue20);
    vec3 vectorValue1 = vec3(quotientValue21, quotientValue22, quotientValue23);
    float intermediateValue28;
    float intermediateValue29;
    float intermediateValue30;
    switch (uint(int(fragmentScalarConstants1.packedValues[productValue31 * 4u])))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint bitwiseValue = (uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue = bitwiseValue + 1u;
    vec4 sampledTextureValue = texture(sampler2D(txBuffer1Texture, txBuffer1Sampler), vec2((fragmentVectorConstants1.packedValues[129u].z * varyingTexCoord4.z) + fragmentVectorConstants1.packedValues[129u].x, (fragmentVectorConstants1.packedValues[129u].w * varyingTexCoord4.w) + fragmentVectorConstants1.packedValues[129u].y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    vec4 sampledTextureValue1 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float productValue = scalarValue4 * fragmentVectorConstants1.packedValues[sumValue].w;
    float productValue1 = scalarValue5 * fragmentVectorConstants1.packedValues[sumValue].w;
    float productValue2 = scalarValue6 * fragmentVectorConstants1.packedValues[sumValue].w;
    float productValue3 = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[sumValue].w;
    float scalarValue7 = spvNMax(scalarValue3, 9.9999997473787516355514526367188e-05);
    float quotientValue = scalarValue / scalarValue7;
    float quotientValue1 = scalarValue1 / scalarValue7;
    float quotientValue2 = scalarValue2 / scalarValue7;
    float scalarValue8 = spvNMax(productValue3, 9.9999997473787516355514526367188e-05);
    float quotientValue3 = productValue / scalarValue8;
    float quotientValue4 = productValue1 / scalarValue8;
    float quotientValue5 = productValue2 / scalarValue8;
    float sumValue1 = 1.0 - scalarValue3;
    float productValue4 = productValue3 * scalarValue3;
    float productValue5;
    float productValue6;
    float productValue7;
    switch (uint(int(fragmentVectorConstants1.packedValues[uint(int(fragmentVectorConstants1.packedValues[bitwiseValue].x))].x)))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        case 1u:
        {
            productValue5 = quotientValue3 * quotientValue;
            productValue6 = quotientValue4 * quotientValue1;
            productValue7 = quotientValue5 * quotientValue2;
            break;
        }
        case 2u:
        {
            productValue5 = (quotientValue3 + quotientValue) - (quotientValue3 * quotientValue);
            productValue6 = (quotientValue4 + quotientValue1) - (quotientValue4 * quotientValue1);
            productValue7 = (quotientValue5 + quotientValue2) - (quotientValue5 * quotientValue2);
            break;
        }
        case 3u:
        {
            float productValue8 = (quotientValue * 2.0) + (-1.0);
            float productValue9 = (quotientValue1 * 2.0) + (-1.0);
            float productValue10 = (quotientValue2 * 2.0) + (-1.0);
            float productValue11 = (quotientValue3 + productValue8) - (quotientValue3 * productValue8);
            float productValue12 = (quotientValue4 + productValue9) - (quotientValue4 * productValue9);
            float productValue13 = (quotientValue5 + productValue10) - (quotientValue5 * productValue10);
            productValue5 = ((((quotientValue3 * quotientValue) * 2.0) - productValue11) * ((quotientValue > 0.5) ? 0.0 : 1.0)) + productValue11;
            productValue6 = ((((quotientValue4 * quotientValue1) * 2.0) - productValue12) * ((quotientValue1 > 0.5) ? 0.0 : 1.0)) + productValue12;
            productValue7 = ((((quotientValue5 * quotientValue2) * 2.0) - productValue13) * ((quotientValue2 > 0.5) ? 0.0 : 1.0)) + productValue13;
            break;
        }
        case 4u:
        {
            productValue5 = spvNMin(quotientValue3, quotientValue);
            productValue6 = spvNMin(quotientValue4, quotientValue1);
            productValue7 = spvNMin(quotientValue5, quotientValue2);
            break;
        }
        case 5u:
        {
            productValue5 = spvNMax(quotientValue3, quotientValue);
            productValue6 = spvNMax(quotientValue4, quotientValue1);
            productValue7 = spvNMax(quotientValue5, quotientValue2);
            break;
        }
        case 6u:
        {
            productValue5 = spvNMin(quotientValue / spvNMax(1.0 - quotientValue3, 9.9999997473787516355514526367188e-05), 1.0);
            productValue6 = spvNMin(quotientValue1 / spvNMax(1.0 - quotientValue4, 9.9999997473787516355514526367188e-05), 1.0);
            productValue7 = spvNMin(quotientValue2 / spvNMax(1.0 - quotientValue5, 9.9999997473787516355514526367188e-05), 1.0);
            break;
        }
        case 7u:
        {
            productValue5 = 1.0 - spvNMin((1.0 - quotientValue) / spvNMax(quotientValue3, 9.9999997473787516355514526367188e-05), 1.0);
            productValue6 = 1.0 - spvNMin((1.0 - quotientValue1) / spvNMax(quotientValue4, 9.9999997473787516355514526367188e-05), 1.0);
            productValue7 = 1.0 - spvNMin((1.0 - quotientValue2) / spvNMax(quotientValue5, 9.9999997473787516355514526367188e-05), 1.0);
            break;
        }
        case 8u:
        {
            float productValue14 = quotientValue3 * 2.0;
            float productValue15 = quotientValue4 * 2.0;
            float productValue16 = quotientValue5 * 2.0;
            float sumValue2 = productValue14 + (-1.0);
            float sumValue3 = productValue15 + (-1.0);
            float sumValue4 = productValue16 + (-1.0);
            float productValue17 = (sumValue2 + quotientValue) - (sumValue2 * quotientValue);
            float productValue18 = (sumValue3 + quotientValue1) - (sumValue3 * quotientValue1);
            float productValue19 = (sumValue4 + quotientValue2) - (sumValue4 * quotientValue2);
            productValue5 = (((productValue14 * quotientValue) - productValue17) * ((quotientValue3 > 0.5) ? 0.0 : 1.0)) + productValue17;
            productValue6 = (((productValue15 * quotientValue1) - productValue18) * ((quotientValue4 > 0.5) ? 0.0 : 1.0)) + productValue18;
            productValue7 = (((productValue16 * quotientValue2) - productValue19) * ((quotientValue5 > 0.5) ? 0.0 : 1.0)) + productValue19;
            break;
        }
        case 9u:
        {
            float nonlinearValue = sqrt(quotientValue);
            float nonlinearValue1 = sqrt(quotientValue1);
            float nonlinearValue2 = sqrt(quotientValue2);
            float productValue20 = quotientValue3 * 2.0;
            float productValue21 = quotientValue4 * 2.0;
            float productValue22 = quotientValue5 * 2.0;
            float comparisonValue = (((nonlinearValue - quotientValue) + (((((((quotientValue * 16.0) + (-12.0)) * quotientValue) + 4.0) * quotientValue) - nonlinearValue) * ((quotientValue > 0.25) ? 0.0 : 1.0))) * (productValue20 + (-1.0))) + quotientValue;
            float comparisonValue1 = (((nonlinearValue1 - quotientValue1) + (((((((quotientValue1 * 16.0) + (-12.0)) * quotientValue1) + 4.0) * quotientValue1) - nonlinearValue1) * ((quotientValue1 > 0.25) ? 0.0 : 1.0))) * (productValue21 + (-1.0))) + quotientValue1;
            float comparisonValue2 = (((nonlinearValue2 - quotientValue2) + (((((((quotientValue2 * 16.0) + (-12.0)) * quotientValue2) + 4.0) * quotientValue2) - nonlinearValue2) * ((quotientValue2 > 0.25) ? 0.0 : 1.0))) * (productValue22 + (-1.0))) + quotientValue2;
            productValue5 = (((quotientValue - (((1.0 - quotientValue) * quotientValue) * (1.0 - productValue20))) - comparisonValue) * ((quotientValue3 > 0.5) ? 0.0 : 1.0)) + comparisonValue;
            productValue6 = (((quotientValue1 - (((1.0 - quotientValue1) * quotientValue1) * (1.0 - productValue21))) - comparisonValue1) * ((quotientValue4 > 0.5) ? 0.0 : 1.0)) + comparisonValue1;
            productValue7 = (((quotientValue2 - (((1.0 - quotientValue2) * quotientValue2) * (1.0 - productValue22))) - comparisonValue2) * ((quotientValue5 > 0.5) ? 0.0 : 1.0)) + comparisonValue2;
            break;
        }
        case 10u:
        {
            productValue5 = abs(quotientValue - quotientValue3);
            productValue6 = abs(quotientValue1 - quotientValue4);
            productValue7 = abs(quotientValue2 - quotientValue5);
            break;
        }
        case 11u:
        {
            productValue5 = (quotientValue3 + quotientValue) - ((quotientValue3 * quotientValue) * 2.0);
            productValue6 = (quotientValue4 + quotientValue1) - ((quotientValue4 * quotientValue1) * 2.0);
            productValue7 = (quotientValue5 + quotientValue2) - ((quotientValue5 * quotientValue2) * 2.0);
            break;
        }
        case 12u:
        {
            float sumValue5 = spvNMax(spvNMax(quotientValue, quotientValue1), quotientValue2) - spvNMin(spvNMin(quotientValue, quotientValue1), quotientValue2);
            float intermediateValue13;
            float intermediateValue14;
            float intermediateValue15;
            if (!(quotientValue3 <= quotientValue4))
            {
                float branchMergedValue;
                float branchMergedValue4;
                float branchMergedValue5;
                if (!(quotientValue3 <= quotientValue5))
                {
                    float branchMergedValue12;
                    float branchMergedValue20;
                    float branchMergedValue21;
                    if (!(quotientValue4 <= quotientValue5))
                    {
                        float branchMergedValue36;
                        float branchMergedValue44;
                        float branchMergedValue45;
                        if (quotientValue3 > quotientValue5)
                        {
                            branchMergedValue36 = sumValue5;
                            branchMergedValue44 = ((((scalarValue5 - scalarValue6) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8) * sumValue5) / spvNMax(((scalarValue4 - scalarValue6) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05);
                            branchMergedValue45 = 0.0;
                        }
                        else
                        {
                            branchMergedValue36 = 0.0;
                            branchMergedValue44 = 0.0;
                            branchMergedValue45 = 0.0;
                        }
                        branchMergedValue12 = branchMergedValue36;
                        branchMergedValue20 = branchMergedValue44;
                        branchMergedValue21 = branchMergedValue45;
                    }
                    else
                    {
                        float branchMergedValue37;
                        float branchMergedValue46;
                        float branchMergedValue47;
                        if (quotientValue3 > quotientValue4)
                        {
                            branchMergedValue37 = sumValue5;
                            branchMergedValue46 = 0.0;
                            branchMergedValue47 = ((((scalarValue6 - scalarValue5) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8) * sumValue5) / spvNMax(((scalarValue4 - scalarValue5) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05);
                        }
                        else
                        {
                            branchMergedValue37 = 0.0;
                            branchMergedValue46 = 0.0;
                            branchMergedValue47 = 0.0;
                        }
                        branchMergedValue12 = branchMergedValue37;
                        branchMergedValue20 = branchMergedValue46;
                        branchMergedValue21 = branchMergedValue47;
                    }
                    branchMergedValue = branchMergedValue12;
                    branchMergedValue4 = branchMergedValue20;
                    branchMergedValue5 = branchMergedValue21;
                }
                else
                {
                    float branchMergedValue13;
                    float branchMergedValue22;
                    float branchMergedValue23;
                    if (quotientValue5 > quotientValue4)
                    {
                        branchMergedValue13 = ((((scalarValue4 - scalarValue5) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8) * sumValue5) / spvNMax(((scalarValue6 - scalarValue5) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05);
                        branchMergedValue22 = 0.0;
                        branchMergedValue23 = sumValue5;
                    }
                    else
                    {
                        branchMergedValue13 = 0.0;
                        branchMergedValue22 = 0.0;
                        branchMergedValue23 = 0.0;
                    }
                    branchMergedValue = branchMergedValue13;
                    branchMergedValue4 = branchMergedValue22;
                    branchMergedValue5 = branchMergedValue23;
                }
                intermediateValue13 = branchMergedValue;
                intermediateValue14 = branchMergedValue4;
                intermediateValue15 = branchMergedValue5;
            }
            else
            {
                float branchMergedValue1;
                float branchMergedValue6;
                float branchMergedValue7;
                if (!(quotientValue4 <= quotientValue5))
                {
                    float branchMergedValue14;
                    float branchMergedValue24;
                    float branchMergedValue25;
                    if (!(quotientValue3 <= quotientValue5))
                    {
                        float branchMergedValue38;
                        float branchMergedValue48;
                        float branchMergedValue49;
                        if (quotientValue4 > quotientValue5)
                        {
                            branchMergedValue38 = ((((scalarValue4 - scalarValue6) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8) * sumValue5) / spvNMax(((scalarValue5 - scalarValue6) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05);
                            branchMergedValue48 = sumValue5;
                            branchMergedValue49 = 0.0;
                        }
                        else
                        {
                            branchMergedValue38 = 0.0;
                            branchMergedValue48 = 0.0;
                            branchMergedValue49 = 0.0;
                        }
                        branchMergedValue14 = branchMergedValue38;
                        branchMergedValue24 = branchMergedValue48;
                        branchMergedValue25 = branchMergedValue49;
                    }
                    else
                    {
                        float branchMergedValue39;
                        float branchMergedValue50;
                        float branchMergedValue51;
                        if (quotientValue4 > quotientValue3)
                        {
                            branchMergedValue39 = 0.0;
                            branchMergedValue50 = sumValue5;
                            branchMergedValue51 = ((((scalarValue6 - scalarValue4) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8) * sumValue5) / spvNMax(((scalarValue5 - scalarValue4) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05);
                        }
                        else
                        {
                            branchMergedValue39 = 0.0;
                            branchMergedValue50 = 0.0;
                            branchMergedValue51 = 0.0;
                        }
                        branchMergedValue14 = branchMergedValue39;
                        branchMergedValue24 = branchMergedValue50;
                        branchMergedValue25 = branchMergedValue51;
                    }
                    branchMergedValue1 = branchMergedValue14;
                    branchMergedValue6 = branchMergedValue24;
                    branchMergedValue7 = branchMergedValue25;
                }
                else
                {
                    float branchMergedValue15;
                    float branchMergedValue26;
                    float branchMergedValue27;
                    if (quotientValue5 > quotientValue3)
                    {
                        branchMergedValue15 = 0.0;
                        branchMergedValue26 = ((((scalarValue5 - scalarValue4) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8) * sumValue5) / spvNMax(((scalarValue6 - scalarValue4) * fragmentVectorConstants1.packedValues[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05);
                        branchMergedValue27 = sumValue5;
                    }
                    else
                    {
                        branchMergedValue15 = 0.0;
                        branchMergedValue26 = 0.0;
                        branchMergedValue27 = 0.0;
                    }
                    branchMergedValue1 = branchMergedValue15;
                    branchMergedValue6 = branchMergedValue26;
                    branchMergedValue7 = branchMergedValue27;
                }
                intermediateValue13 = branchMergedValue1;
                intermediateValue14 = branchMergedValue6;
                intermediateValue15 = branchMergedValue7;
            }
            float productValue23 = (((((quotientValue1 * 0.715200006961822509765625) + (quotientValue * 0.2125999927520751953125)) + (quotientValue2 * 0.072200000286102294921875)) - (intermediateValue13 * 0.2125999927520751953125)) - (intermediateValue14 * 0.715200006961822509765625)) - (intermediateValue15 * 0.072200000286102294921875);
            float sumValue6 = productValue23 + intermediateValue13;
            float sumValue7 = productValue23 + intermediateValue14;
            float sumValue8 = productValue23 + intermediateValue15;
            float productValue24 = ((sumValue6 * 0.2125999927520751953125) + (sumValue7 * 0.715200006961822509765625)) + (sumValue8 * 0.072200000286102294921875);
            float scalarValue9 = spvNMin(spvNMin(sumValue6, sumValue7), sumValue8);
            float scalarValue10 = spvNMax(spvNMax(sumValue6, sumValue7), sumValue8);
            float quotientValue6;
            float quotientValue10;
            float quotientValue14;
            if (scalarValue9 < 0.0)
            {
                float sumValue9 = spvNMax(productValue24 - scalarValue9, 9.9999997473787516355514526367188e-05);
                quotientValue6 = (((sumValue6 - productValue24) * productValue24) / sumValue9) + productValue24;
                quotientValue10 = (((sumValue7 - productValue24) * productValue24) / sumValue9) + productValue24;
                quotientValue14 = (((sumValue8 - productValue24) * productValue24) / sumValue9) + productValue24;
            }
            else
            {
                quotientValue6 = sumValue6;
                quotientValue10 = sumValue7;
                quotientValue14 = sumValue8;
            }
            if (!(scalarValue10 > 1.0))
            {
                productValue5 = quotientValue6;
                productValue6 = quotientValue10;
                productValue7 = quotientValue14;
                break;
            }
            float sumValue10 = 1.0 - productValue24;
            float sumValue11 = spvNMax(scalarValue10 - productValue24, 9.9999997473787516355514526367188e-05);
            productValue5 = (((quotientValue6 - productValue24) * sumValue10) / sumValue11) + productValue24;
            productValue6 = (((quotientValue10 - productValue24) * sumValue10) / sumValue11) + productValue24;
            productValue7 = (((quotientValue14 - productValue24) * sumValue10) / sumValue11) + productValue24;
            break;
        }
        case 13u:
        {
            float sumValue12 = spvNMax(spvNMax(quotientValue3, quotientValue4), quotientValue5) - spvNMin(spvNMin(quotientValue3, quotientValue4), quotientValue5);
            float intermediateValue18;
            float intermediateValue19;
            float intermediateValue20;
            if (!(quotientValue <= quotientValue1))
            {
                float branchMergedValue2;
                float branchMergedValue8;
                float branchMergedValue9;
                if (!(quotientValue <= quotientValue2))
                {
                    float branchMergedValue16;
                    float branchMergedValue28;
                    float branchMergedValue29;
                    if (!(quotientValue1 <= quotientValue2))
                    {
                        float branchMergedValue40;
                        float branchMergedValue52;
                        float branchMergedValue53;
                        if (quotientValue > quotientValue2)
                        {
                            branchMergedValue40 = sumValue12;
                            branchMergedValue52 = (((scalarValue1 - scalarValue2) / scalarValue7) * sumValue12) / spvNMax((scalarValue - scalarValue2) / scalarValue7, 9.9999997473787516355514526367188e-05);
                            branchMergedValue53 = 0.0;
                        }
                        else
                        {
                            branchMergedValue40 = 0.0;
                            branchMergedValue52 = 0.0;
                            branchMergedValue53 = 0.0;
                        }
                        branchMergedValue16 = branchMergedValue40;
                        branchMergedValue28 = branchMergedValue52;
                        branchMergedValue29 = branchMergedValue53;
                    }
                    else
                    {
                        float branchMergedValue41;
                        float branchMergedValue54;
                        float branchMergedValue55;
                        if (quotientValue > quotientValue1)
                        {
                            branchMergedValue41 = sumValue12;
                            branchMergedValue54 = 0.0;
                            branchMergedValue55 = (((scalarValue2 - scalarValue1) / scalarValue7) * sumValue12) / spvNMax((scalarValue - scalarValue1) / scalarValue7, 9.9999997473787516355514526367188e-05);
                        }
                        else
                        {
                            branchMergedValue41 = 0.0;
                            branchMergedValue54 = 0.0;
                            branchMergedValue55 = 0.0;
                        }
                        branchMergedValue16 = branchMergedValue41;
                        branchMergedValue28 = branchMergedValue54;
                        branchMergedValue29 = branchMergedValue55;
                    }
                    branchMergedValue2 = branchMergedValue16;
                    branchMergedValue8 = branchMergedValue28;
                    branchMergedValue9 = branchMergedValue29;
                }
                else
                {
                    float branchMergedValue17;
                    float branchMergedValue30;
                    float branchMergedValue31;
                    if (quotientValue2 > quotientValue1)
                    {
                        branchMergedValue17 = (((scalarValue - scalarValue1) / scalarValue7) * sumValue12) / spvNMax((scalarValue2 - scalarValue1) / scalarValue7, 9.9999997473787516355514526367188e-05);
                        branchMergedValue30 = 0.0;
                        branchMergedValue31 = sumValue12;
                    }
                    else
                    {
                        branchMergedValue17 = 0.0;
                        branchMergedValue30 = 0.0;
                        branchMergedValue31 = 0.0;
                    }
                    branchMergedValue2 = branchMergedValue17;
                    branchMergedValue8 = branchMergedValue30;
                    branchMergedValue9 = branchMergedValue31;
                }
                intermediateValue18 = branchMergedValue2;
                intermediateValue19 = branchMergedValue8;
                intermediateValue20 = branchMergedValue9;
            }
            else
            {
                float branchMergedValue3;
                float branchMergedValue10;
                float branchMergedValue11;
                if (!(quotientValue1 <= quotientValue2))
                {
                    float branchMergedValue18;
                    float branchMergedValue32;
                    float branchMergedValue33;
                    if (!(quotientValue <= quotientValue2))
                    {
                        float branchMergedValue42;
                        float branchMergedValue56;
                        float branchMergedValue57;
                        if (quotientValue1 > quotientValue2)
                        {
                            branchMergedValue42 = (((scalarValue - scalarValue2) / scalarValue7) * sumValue12) / spvNMax((scalarValue1 - scalarValue2) / scalarValue7, 9.9999997473787516355514526367188e-05);
                            branchMergedValue56 = sumValue12;
                            branchMergedValue57 = 0.0;
                        }
                        else
                        {
                            branchMergedValue42 = 0.0;
                            branchMergedValue56 = 0.0;
                            branchMergedValue57 = 0.0;
                        }
                        branchMergedValue18 = branchMergedValue42;
                        branchMergedValue32 = branchMergedValue56;
                        branchMergedValue33 = branchMergedValue57;
                    }
                    else
                    {
                        float branchMergedValue43;
                        float branchMergedValue58;
                        float branchMergedValue59;
                        if (quotientValue1 > quotientValue)
                        {
                            branchMergedValue43 = 0.0;
                            branchMergedValue58 = sumValue12;
                            branchMergedValue59 = (((scalarValue2 - scalarValue) / scalarValue7) * sumValue12) / spvNMax((scalarValue1 - scalarValue) / scalarValue7, 9.9999997473787516355514526367188e-05);
                        }
                        else
                        {
                            branchMergedValue43 = 0.0;
                            branchMergedValue58 = 0.0;
                            branchMergedValue59 = 0.0;
                        }
                        branchMergedValue18 = branchMergedValue43;
                        branchMergedValue32 = branchMergedValue58;
                        branchMergedValue33 = branchMergedValue59;
                    }
                    branchMergedValue3 = branchMergedValue18;
                    branchMergedValue10 = branchMergedValue32;
                    branchMergedValue11 = branchMergedValue33;
                }
                else
                {
                    float branchMergedValue19;
                    float branchMergedValue34;
                    float branchMergedValue35;
                    if (quotientValue2 > quotientValue)
                    {
                        branchMergedValue19 = 0.0;
                        branchMergedValue34 = (((scalarValue1 - scalarValue) / scalarValue7) * sumValue12) / spvNMax((scalarValue2 - scalarValue) / scalarValue7, 9.9999997473787516355514526367188e-05);
                        branchMergedValue35 = sumValue12;
                    }
                    else
                    {
                        branchMergedValue19 = 0.0;
                        branchMergedValue34 = 0.0;
                        branchMergedValue35 = 0.0;
                    }
                    branchMergedValue3 = branchMergedValue19;
                    branchMergedValue10 = branchMergedValue34;
                    branchMergedValue11 = branchMergedValue35;
                }
                intermediateValue18 = branchMergedValue3;
                intermediateValue19 = branchMergedValue10;
                intermediateValue20 = branchMergedValue11;
            }
            float productValue25 = (((((quotientValue1 * 0.715200006961822509765625) + (quotientValue * 0.2125999927520751953125)) + (quotientValue2 * 0.072200000286102294921875)) - (intermediateValue18 * 0.2125999927520751953125)) - (intermediateValue19 * 0.715200006961822509765625)) - (intermediateValue20 * 0.072200000286102294921875);
            float sumValue13 = productValue25 + intermediateValue18;
            float sumValue14 = productValue25 + intermediateValue19;
            float sumValue15 = productValue25 + intermediateValue20;
            float productValue26 = ((sumValue13 * 0.2125999927520751953125) + (sumValue14 * 0.715200006961822509765625)) + (sumValue15 * 0.072200000286102294921875);
            float scalarValue11 = spvNMin(spvNMin(sumValue13, sumValue14), sumValue15);
            float scalarValue12 = spvNMax(spvNMax(sumValue13, sumValue14), sumValue15);
            float quotientValue7;
            float quotientValue11;
            float quotientValue15;
            if (scalarValue11 < 0.0)
            {
                float sumValue16 = spvNMax(productValue26 - scalarValue11, 9.9999997473787516355514526367188e-05);
                quotientValue7 = (((sumValue13 - productValue26) * productValue26) / sumValue16) + productValue26;
                quotientValue11 = (((sumValue14 - productValue26) * productValue26) / sumValue16) + productValue26;
                quotientValue15 = (((sumValue15 - productValue26) * productValue26) / sumValue16) + productValue26;
            }
            else
            {
                quotientValue7 = sumValue13;
                quotientValue11 = sumValue14;
                quotientValue15 = sumValue15;
            }
            if (!(scalarValue12 > 1.0))
            {
                productValue5 = quotientValue7;
                productValue6 = quotientValue11;
                productValue7 = quotientValue15;
                break;
            }
            float sumValue17 = 1.0 - productValue26;
            float sumValue18 = spvNMax(scalarValue12 - productValue26, 9.9999997473787516355514526367188e-05);
            productValue5 = (((quotientValue7 - productValue26) * sumValue17) / sumValue18) + productValue26;
            productValue6 = (((quotientValue11 - productValue26) * sumValue17) / sumValue18) + productValue26;
            productValue7 = (((quotientValue15 - productValue26) * sumValue17) / sumValue18) + productValue26;
            break;
        }
        case 14u:
        {
            float productValue27 = (((((quotientValue1 * 0.715200006961822509765625) + (quotientValue * 0.2125999927520751953125)) + (quotientValue2 * 0.072200000286102294921875)) - (quotientValue3 * 0.2125999927520751953125)) - (quotientValue4 * 0.715200006961822509765625)) - (quotientValue5 * 0.072200000286102294921875);
            float sumValue19 = productValue27 + quotientValue3;
            float sumValue20 = productValue27 + quotientValue4;
            float sumValue21 = productValue27 + quotientValue5;
            float productValue28 = ((sumValue19 * 0.2125999927520751953125) + (sumValue20 * 0.715200006961822509765625)) + (sumValue21 * 0.072200000286102294921875);
            float scalarValue13 = spvNMin(spvNMin(sumValue19, sumValue20), sumValue21);
            float scalarValue14 = spvNMax(spvNMax(sumValue19, sumValue20), sumValue21);
            float quotientValue8;
            float quotientValue12;
            float quotientValue16;
            if (scalarValue13 < 0.0)
            {
                float sumValue22 = spvNMax(productValue28 - scalarValue13, 9.9999997473787516355514526367188e-05);
                quotientValue8 = (((sumValue19 - productValue28) * productValue28) / sumValue22) + productValue28;
                quotientValue12 = (((sumValue20 - productValue28) * productValue28) / sumValue22) + productValue28;
                quotientValue16 = (((sumValue21 - productValue28) * productValue28) / sumValue22) + productValue28;
            }
            else
            {
                quotientValue8 = sumValue19;
                quotientValue12 = sumValue20;
                quotientValue16 = sumValue21;
            }
            if (!(scalarValue14 > 1.0))
            {
                productValue5 = quotientValue8;
                productValue6 = quotientValue12;
                productValue7 = quotientValue16;
                break;
            }
            float sumValue23 = 1.0 - productValue28;
            float sumValue24 = spvNMax(scalarValue14 - productValue28, 9.9999997473787516355514526367188e-05);
            productValue5 = (((quotientValue8 - productValue28) * sumValue23) / sumValue24) + productValue28;
            productValue6 = (((quotientValue12 - productValue28) * sumValue23) / sumValue24) + productValue28;
            productValue7 = (((quotientValue16 - productValue28) * sumValue23) / sumValue24) + productValue28;
            break;
        }
        case 15u:
        {
            float productValue29 = ((((quotientValue * (-0.2125999927520751953125)) - (quotientValue2 * 0.072200000286102294921875)) + (quotientValue3 * 0.2125999927520751953125)) + (quotientValue5 * 0.072200000286102294921875)) + ((quotientValue4 - quotientValue1) * 0.715200006961822509765625);
            float sumValue25 = productValue29 + quotientValue;
            float sumValue26 = productValue29 + quotientValue1;
            float sumValue27 = productValue29 + quotientValue2;
            float productValue30 = ((sumValue25 * 0.2125999927520751953125) + (sumValue26 * 0.715200006961822509765625)) + (sumValue27 * 0.072200000286102294921875);
            float scalarValue15 = spvNMin(spvNMin(sumValue25, sumValue26), sumValue27);
            float scalarValue16 = spvNMax(spvNMax(sumValue25, sumValue26), sumValue27);
            float quotientValue9;
            float quotientValue13;
            float quotientValue17;
            if (scalarValue15 < 0.0)
            {
                float sumValue28 = spvNMax(productValue30 - scalarValue15, 9.9999997473787516355514526367188e-05);
                quotientValue9 = (((sumValue25 - productValue30) * productValue30) / sumValue28) + productValue30;
                quotientValue13 = (((sumValue26 - productValue30) * productValue30) / sumValue28) + productValue30;
                quotientValue17 = (((sumValue27 - productValue30) * productValue30) / sumValue28) + productValue30;
            }
            else
            {
                quotientValue9 = sumValue25;
                quotientValue13 = sumValue26;
                quotientValue17 = sumValue27;
            }
            if (!(scalarValue16 > 1.0))
            {
                productValue5 = quotientValue9;
                productValue6 = quotientValue13;
                productValue7 = quotientValue17;
                break;
            }
            float sumValue29 = 1.0 - productValue30;
            float sumValue30 = spvNMax(scalarValue16 - productValue30, 9.9999997473787516355514526367188e-05);
            productValue5 = (((quotientValue9 - productValue30) * sumValue29) / sumValue30) + productValue30;
            productValue6 = (((quotientValue13 - productValue30) * sumValue29) / sumValue30) + productValue30;
            productValue7 = (((quotientValue17 - productValue30) * sumValue29) / sumValue30) + productValue30;
            break;
        }
        case 16u:
        {
            productValue5 = spvNMin(quotientValue3 + quotientValue, 1.0);
            productValue6 = spvNMin(quotientValue4 + quotientValue1, 1.0);
            productValue7 = spvNMin(quotientValue5 + quotientValue2, 1.0);
            break;
        }
        default:
        {
            productValue5 = 0.0;
            productValue6 = 0.0;
            productValue7 = 0.0;
            break;
        }
#endif
        case 0u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue31 = quotientValue29;
            intermediateValue32 = quotientValue28;
            intermediateValue33 = quotientValue27;
            break;
        }
        case 1u:
        {
            precise float productValue43 = quotientValue24 * quotientValue27;
            precise float productValue44 = quotientValue25 * quotientValue28;
            precise float productValue45 = quotientValue26 * quotientValue29;
            intermediateValue31 = productValue45;
            intermediateValue32 = productValue44;
            intermediateValue33 = productValue43;
            break;
        }
        case 2u:
        {
            precise float sumValue72 = quotientValue24 + quotientValue27;
            precise float sumValue73 = quotientValue25 + quotientValue28;
            precise float sumValue74 = quotientValue26 + quotientValue29;
            intermediateValue31 = fma(-quotientValue26, quotientValue29, sumValue74);
            intermediateValue32 = fma(-quotientValue25, quotientValue28, sumValue73);
            intermediateValue33 = fma(-quotientValue24, quotientValue27, sumValue72);
            break;
        }
        case 3u:
        {
            precise float sumValue75 = quotientValue24 + quotientValue24;
            precise float sumValue76 = quotientValue25 + quotientValue25;
            precise float sumValue77 = quotientValue26 + quotientValue26;
            float multiplyAddValue16 = fma(quotientValue24, 2.0, -1.0);
            float multiplyAddValue17 = fma(quotientValue25, 2.0, -1.0);
            float multiplyAddValue18 = fma(quotientValue26, 2.0, -1.0);
            precise float sumValue78 = quotientValue27 + multiplyAddValue16;
            precise float sumValue79 = quotientValue28 + multiplyAddValue17;
            precise float sumValue80 = quotientValue29 + multiplyAddValue18;
            float multiplyAddValue19 = fma(-quotientValue27, multiplyAddValue16, sumValue78);
            float multiplyAddValue20 = fma(-quotientValue28, multiplyAddValue17, sumValue79);
            float multiplyAddValue21 = fma(-quotientValue29, multiplyAddValue18, sumValue80);
            intermediateValue31 = fma(float(quotientValue26 <= 0.5), fma(quotientValue29, sumValue77, -multiplyAddValue21), multiplyAddValue21);
            intermediateValue32 = fma(float(quotientValue25 <= 0.5), fma(quotientValue28, sumValue76, -multiplyAddValue20), multiplyAddValue20);
            intermediateValue33 = fma(float(quotientValue24 <= 0.5), fma(quotientValue27, sumValue75, -multiplyAddValue19), multiplyAddValue19);
            break;
        }
        case 4u:
        {
            intermediateValue31 = spvNMin(quotientValue26, quotientValue29);
            intermediateValue32 = spvNMin(quotientValue25, quotientValue28);
            intermediateValue33 = spvNMin(quotientValue24, quotientValue27);
            break;
        }
        case 5u:
        {
            intermediateValue31 = spvNMax(quotientValue26, quotientValue29);
            intermediateValue32 = spvNMax(quotientValue25, quotientValue28);
            intermediateValue33 = spvNMax(quotientValue24, quotientValue27);
            break;
        }
        case 6u:
        {
            precise float sumValue81 = 1.0 - quotientValue27;
            precise float sumValue82 = 1.0 - quotientValue28;
            precise float sumValue83 = 1.0 - quotientValue29;
            precise float quotientValue30 = quotientValue24 / spvNMax(sumValue81, 9.9999997473787516355514526367188e-05);
            precise float quotientValue31 = quotientValue25 / spvNMax(sumValue82, 9.9999997473787516355514526367188e-05);
            precise float quotientValue32 = quotientValue26 / spvNMax(sumValue83, 9.9999997473787516355514526367188e-05);
            intermediateValue31 = spvNMin(quotientValue32, 1.0);
            intermediateValue32 = spvNMin(quotientValue31, 1.0);
            intermediateValue33 = spvNMin(quotientValue30, 1.0);
            break;
        }
        case 7u:
        {
            precise float sumValue84 = 1.0 - quotientValue24;
            precise float sumValue85 = 1.0 - quotientValue25;
            precise float sumValue86 = 1.0 - quotientValue26;
            precise float quotientValue33 = sumValue84 / spvNMax(quotientValue27, 9.9999997473787516355514526367188e-05);
            precise float quotientValue34 = sumValue85 / spvNMax(quotientValue28, 9.9999997473787516355514526367188e-05);
            precise float quotientValue35 = sumValue86 / spvNMax(quotientValue29, 9.9999997473787516355514526367188e-05);
            precise float sumValue87 = 1.0 - spvNMin(quotientValue33, 1.0);
            precise float sumValue88 = 1.0 - spvNMin(quotientValue34, 1.0);
            precise float sumValue89 = 1.0 - spvNMin(quotientValue35, 1.0);
            intermediateValue31 = sumValue89;
            intermediateValue32 = sumValue88;
            intermediateValue33 = sumValue87;
            break;
        }
        case 8u:
        {
            precise float sumValue90 = quotientValue27 + quotientValue27;
            precise float sumValue91 = quotientValue28 + quotientValue28;
            precise float sumValue92 = quotientValue29 + quotientValue29;
            float multiplyAddValue22 = fma(quotientValue27, 2.0, -1.0);
            float multiplyAddValue23 = fma(quotientValue28, 2.0, -1.0);
            float multiplyAddValue24 = fma(quotientValue29, 2.0, -1.0);
            precise float sumValue93 = quotientValue24 + multiplyAddValue22;
            precise float sumValue94 = quotientValue25 + multiplyAddValue23;
            precise float sumValue95 = quotientValue26 + multiplyAddValue24;
            float multiplyAddValue25 = fma(-quotientValue24, multiplyAddValue22, sumValue93);
            float multiplyAddValue26 = fma(-quotientValue25, multiplyAddValue23, sumValue94);
            float multiplyAddValue27 = fma(-quotientValue26, multiplyAddValue24, sumValue95);
            intermediateValue31 = fma(float(quotientValue29 <= 0.5), fma(quotientValue26, sumValue92, -multiplyAddValue27), multiplyAddValue27);
            intermediateValue32 = fma(float(quotientValue28 <= 0.5), fma(quotientValue25, sumValue91, -multiplyAddValue26), multiplyAddValue26);
            intermediateValue33 = fma(float(quotientValue27 <= 0.5), fma(quotientValue24, sumValue90, -multiplyAddValue25), multiplyAddValue25);
            break;
        }
        case 9u:
        {
            float nonlinearValue6 = sqrt(quotientValue24);
            float nonlinearValue7 = sqrt(quotientValue25);
            float nonlinearValue8 = sqrt(quotientValue26);
            precise float multiplyAddValue28 = fma(float(quotientValue24 <= 0.25), fma(fma(fma(quotientValue24, 16.0, -12.0), quotientValue24, 4.0), quotientValue24, -nonlinearValue6), nonlinearValue6) - quotientValue24;
            precise float multiplyAddValue29 = fma(float(quotientValue25 <= 0.25), fma(fma(fma(quotientValue25, 16.0, -12.0), quotientValue25, 4.0), quotientValue25, -nonlinearValue7), nonlinearValue7) - quotientValue25;
            precise float multiplyAddValue30 = fma(float(quotientValue26 <= 0.25), fma(fma(fma(quotientValue26, 16.0, -12.0), quotientValue26, 4.0), quotientValue26, -nonlinearValue8), nonlinearValue8) - quotientValue26;
            float multiplyAddValue31 = fma(fma(quotientValue27, 2.0, -1.0), multiplyAddValue28, quotientValue24);
            float multiplyAddValue32 = fma(fma(quotientValue28, 2.0, -1.0), multiplyAddValue29, quotientValue25);
            float multiplyAddValue33 = fma(fma(quotientValue29, 2.0, -1.0), multiplyAddValue30, quotientValue26);
            precise float multiplyAddValue34 = quotientValue24 * fma(-quotientValue27, 2.0, 1.0);
            precise float multiplyAddValue35 = quotientValue25 * fma(-quotientValue28, 2.0, 1.0);
            precise float multiplyAddValue36 = quotientValue26 * fma(-quotientValue29, 2.0, 1.0);
            precise float sumValue96 = 1.0 - quotientValue24;
            precise float sumValue97 = 1.0 - quotientValue25;
            precise float sumValue98 = 1.0 - quotientValue26;
            precise float multiplyAddValue37 = fma(-multiplyAddValue34, sumValue96, quotientValue24) - multiplyAddValue31;
            precise float multiplyAddValue38 = fma(-multiplyAddValue35, sumValue97, quotientValue25) - multiplyAddValue32;
            precise float multiplyAddValue39 = fma(-multiplyAddValue36, sumValue98, quotientValue26) - multiplyAddValue33;
            intermediateValue31 = fma(float(quotientValue29 <= 0.5), multiplyAddValue39, multiplyAddValue33);
            intermediateValue32 = fma(float(quotientValue28 <= 0.5), multiplyAddValue38, multiplyAddValue32);
            intermediateValue33 = fma(float(quotientValue27 <= 0.5), multiplyAddValue37, multiplyAddValue31);
            break;
        }
        case 10u:
        {
            precise float sumValue99 = quotientValue24 - quotientValue27;
            precise float sumValue100 = quotientValue25 - quotientValue28;
            precise float sumValue101 = quotientValue26 - quotientValue29;
            intermediateValue31 = abs(sumValue101);
            intermediateValue32 = abs(sumValue100);
            intermediateValue33 = abs(sumValue99);
            break;
        }
        case 11u:
        {
            precise float sumValue102 = quotientValue24 + quotientValue27;
            precise float sumValue103 = quotientValue25 + quotientValue28;
            precise float sumValue104 = quotientValue26 + quotientValue29;
            precise float productValue46 = quotientValue24 * quotientValue27;
            precise float productValue47 = quotientValue25 * quotientValue28;
            precise float productValue48 = quotientValue26 * quotientValue29;
            intermediateValue31 = fma(-productValue48, 2.0, sumValue104);
            intermediateValue32 = fma(-productValue47, 2.0, sumValue103);
            intermediateValue33 = fma(-productValue46, 2.0, sumValue102);
            break;
        }
        case 12u:
        {
            precise float sumValue105 = spvNMax(quotientValue26, spvNMax(quotientValue25, quotientValue24)) - spvNMin(quotientValue26, spvNMin(quotientValue25, quotientValue24));
            float comparisonValue14;
            float comparisonValue15;
            float comparisonValue16;
            if (quotientValue28 >= quotientValue27)
            {
                bool conditionValue16 = quotientValue27 < quotientValue29;
                bool conditionValue17 = quotientValue29 < quotientValue28;
                precise float sumValue106 = quotientValue28 - quotientValue27;
                precise float sumValue107 = quotientValue29 - quotientValue27;
                precise float sumValue108 = quotientValue27 - quotientValue29;
                precise float sumValue109 = quotientValue28 - quotientValue29;
                precise float productValue49 = sumValue105 * sumValue106;
                precise float productValue50 = sumValue105 * sumValue107;
                precise float productValue51 = sumValue105 * sumValue108;
                precise float quotientValue36 = productValue49 / spvNMax(sumValue107, 9.9999997473787516355514526367188e-05);
                precise float quotientValue37 = productValue50 / spvNMax(sumValue106, 9.9999997473787516355514526367188e-05);
                precise float quotientValue38 = productValue51 / spvNMax(sumValue109, 9.9999997473787516355514526367188e-05);
                bool comparisonValue29 = quotientValue29 >= quotientValue28;
                bool comparisonValue30 = quotientValue29 >= quotientValue27;
                bool bitwiseValue8 = comparisonValue30 && (quotientValue27 < quotientValue28);
                comparisonValue14 = comparisonValue29 ? (conditionValue16 ? sumValue105 : 0.0) : (bitwiseValue8 ? quotientValue37 : 0.0);
                comparisonValue15 = comparisonValue29 ? (conditionValue16 ? quotientValue36 : 0.0) : ((bitwiseValue8 || ((!comparisonValue30) && conditionValue17)) ? sumValue105 : 0.0);
                comparisonValue16 = (comparisonValue29 || ((!conditionValue17) || comparisonValue30)) ? 0.0 : quotientValue38;
            }
            else
            {
                bool conditionValue18 = quotientValue28 < quotientValue29;
                bool conditionValue19 = quotientValue29 < quotientValue27;
                precise float sumValue110 = quotientValue27 - quotientValue28;
                precise float sumValue111 = quotientValue29 - quotientValue28;
                precise float sumValue112 = quotientValue28 - quotientValue29;
                precise float sumValue113 = quotientValue27 - quotientValue29;
                precise float productValue52 = sumValue105 * sumValue110;
                precise float productValue53 = sumValue105 * sumValue111;
                precise float productValue54 = sumValue105 * sumValue112;
                precise float quotientValue39 = productValue52 / spvNMax(sumValue111, 9.9999997473787516355514526367188e-05);
                precise float quotientValue40 = productValue53 / spvNMax(sumValue110, 9.9999997473787516355514526367188e-05);
                precise float quotientValue41 = productValue54 / spvNMax(sumValue113, 9.9999997473787516355514526367188e-05);
                bool comparisonValue31 = quotientValue29 >= quotientValue27;
                bool comparisonValue32 = quotientValue29 >= quotientValue28;
                bool bitwiseValue9 = comparisonValue32 && (quotientValue28 < quotientValue27);
                comparisonValue14 = comparisonValue31 ? (conditionValue18 ? sumValue105 : 0.0) : (bitwiseValue9 ? quotientValue40 : 0.0);
                comparisonValue15 = ((comparisonValue32 || (!conditionValue19)) || comparisonValue31) ? 0.0 : quotientValue41;
                comparisonValue16 = comparisonValue31 ? (conditionValue18 ? quotientValue39 : 0.0) : ((bitwiseValue9 || ((!comparisonValue32) && conditionValue19)) ? sumValue105 : 0.0);
            }
            precise float sumValue114 = rdDot3Precise2(vectorValue2, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) - rdDot3Precise2(vec3(comparisonValue16, comparisonValue15, comparisonValue14), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            precise float sumValue115 = sumValue114 + comparisonValue16;
            precise float sumValue116 = sumValue114 + comparisonValue15;
            precise float sumValue117 = sumValue114 + comparisonValue14;
            float scalarValue38 = rdDot3Precise2(vec3(sumValue115, sumValue116, sumValue117), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue39 = spvNMin(sumValue117, spvNMin(sumValue116, sumValue115));
            float scalarValue40 = spvNMax(sumValue117, spvNMax(sumValue116, sumValue115));
            bool conditionValue20 = scalarValue39 < 0.0;
            precise float sumValue118 = sumValue115 - scalarValue38;
            precise float sumValue119 = sumValue116 - scalarValue38;
            precise float sumValue120 = sumValue117 - scalarValue38;
            precise float productValue55 = scalarValue38 * sumValue118;
            precise float productValue56 = scalarValue38 * sumValue119;
            precise float productValue57 = scalarValue38 * sumValue120;
            precise float sumValue121 = scalarValue38 - scalarValue39;
            float scalarValue41 = spvNMax(sumValue121, 9.9999997473787516355514526367188e-05);
            precise float quotientValue42 = productValue55 / scalarValue41;
            precise float quotientValue43 = productValue56 / scalarValue41;
            precise float quotientValue44 = productValue57 / scalarValue41;
            precise float sumValue122 = scalarValue38 + quotientValue42;
            precise float sumValue123 = scalarValue38 + quotientValue43;
            precise float sumValue124 = scalarValue38 + quotientValue44;
            float comparisonValue33 = conditionValue20 ? sumValue122 : sumValue115;
            float comparisonValue34 = conditionValue20 ? sumValue123 : sumValue116;
            float comparisonValue35 = conditionValue20 ? sumValue124 : sumValue117;
            bool conditionValue21 = scalarValue40 > 1.0;
            precise float sumValue125 = comparisonValue33 - scalarValue38;
            precise float sumValue126 = comparisonValue34 - scalarValue38;
            precise float sumValue127 = comparisonValue35 - scalarValue38;
            precise float sumValue128 = 1.0 - scalarValue38;
            precise float productValue58 = sumValue125 * sumValue128;
            precise float productValue59 = sumValue126 * sumValue128;
            precise float productValue60 = sumValue127 * sumValue128;
            precise float sumValue129 = scalarValue40 - scalarValue38;
            float scalarValue42 = spvNMax(sumValue129, 9.9999997473787516355514526367188e-05);
            precise float quotientValue45 = productValue58 / scalarValue42;
            precise float quotientValue46 = productValue59 / scalarValue42;
            precise float quotientValue47 = productValue60 / scalarValue42;
            precise float sumValue130 = scalarValue38 + quotientValue45;
            precise float sumValue131 = scalarValue38 + quotientValue46;
            precise float sumValue132 = scalarValue38 + quotientValue47;
            intermediateValue31 = conditionValue21 ? sumValue132 : comparisonValue35;
            intermediateValue32 = conditionValue21 ? sumValue131 : comparisonValue34;
            intermediateValue33 = conditionValue21 ? sumValue130 : comparisonValue33;
            break;
        }
        case 13u:
        {
            precise float sumValue133 = spvNMax(quotientValue29, spvNMax(quotientValue28, quotientValue27)) - spvNMin(quotientValue29, spvNMin(quotientValue28, quotientValue27));
            float comparisonValue20;
            float comparisonValue21;
            float comparisonValue22;
            if (quotientValue25 >= quotientValue24)
            {
                bool conditionValue22 = quotientValue24 < quotientValue26;
                bool conditionValue23 = quotientValue26 < quotientValue25;
                precise float sumValue134 = quotientValue25 - quotientValue24;
                precise float sumValue135 = quotientValue26 - quotientValue24;
                precise float sumValue136 = quotientValue24 - quotientValue26;
                precise float sumValue137 = quotientValue25 - quotientValue26;
                precise float productValue61 = sumValue133 * sumValue134;
                precise float productValue62 = sumValue133 * sumValue135;
                precise float productValue63 = sumValue133 * sumValue136;
                precise float quotientValue48 = productValue61 / spvNMax(sumValue135, 9.9999997473787516355514526367188e-05);
                precise float quotientValue49 = productValue62 / spvNMax(sumValue134, 9.9999997473787516355514526367188e-05);
                precise float quotientValue50 = productValue63 / spvNMax(sumValue137, 9.9999997473787516355514526367188e-05);
                bool comparisonValue36 = quotientValue26 >= quotientValue25;
                bool comparisonValue37 = quotientValue26 >= quotientValue24;
                bool bitwiseValue10 = comparisonValue37 && (quotientValue24 < quotientValue25);
                comparisonValue20 = comparisonValue36 ? (conditionValue22 ? sumValue133 : 0.0) : (bitwiseValue10 ? quotientValue49 : 0.0);
                comparisonValue21 = comparisonValue36 ? (conditionValue22 ? quotientValue48 : 0.0) : ((bitwiseValue10 || ((!comparisonValue37) && conditionValue23)) ? sumValue133 : 0.0);
                comparisonValue22 = (comparisonValue36 || ((!conditionValue23) || comparisonValue37)) ? 0.0 : quotientValue50;
            }
            else
            {
                bool conditionValue24 = quotientValue25 < quotientValue26;
                bool conditionValue25 = quotientValue26 < quotientValue24;
                precise float sumValue138 = quotientValue24 - quotientValue25;
                precise float sumValue139 = quotientValue26 - quotientValue25;
                precise float sumValue140 = quotientValue25 - quotientValue26;
                precise float sumValue141 = quotientValue24 - quotientValue26;
                precise float productValue64 = sumValue133 * sumValue138;
                precise float productValue65 = sumValue133 * sumValue139;
                precise float productValue66 = sumValue133 * sumValue140;
                precise float quotientValue51 = productValue64 / spvNMax(sumValue139, 9.9999997473787516355514526367188e-05);
                precise float quotientValue52 = productValue65 / spvNMax(sumValue138, 9.9999997473787516355514526367188e-05);
                precise float quotientValue53 = productValue66 / spvNMax(sumValue141, 9.9999997473787516355514526367188e-05);
                bool comparisonValue38 = quotientValue26 >= quotientValue24;
                bool comparisonValue39 = quotientValue26 >= quotientValue25;
                bool bitwiseValue11 = comparisonValue39 && (quotientValue25 < quotientValue24);
                comparisonValue20 = comparisonValue38 ? (conditionValue24 ? sumValue133 : 0.0) : (bitwiseValue11 ? quotientValue52 : 0.0);
                comparisonValue21 = ((comparisonValue39 || (!conditionValue25)) || comparisonValue38) ? 0.0 : quotientValue53;
                comparisonValue22 = comparisonValue38 ? (conditionValue24 ? quotientValue51 : 0.0) : ((bitwiseValue11 || ((!comparisonValue39) && conditionValue25)) ? sumValue133 : 0.0);
            }
            precise float sumValue142 = rdDot3Precise2(vectorValue2, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) - rdDot3Precise2(vec3(comparisonValue22, comparisonValue21, comparisonValue20), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            precise float sumValue143 = sumValue142 + comparisonValue22;
            precise float sumValue144 = sumValue142 + comparisonValue21;
            precise float sumValue145 = sumValue142 + comparisonValue20;
            float scalarValue43 = rdDot3Precise2(vec3(sumValue143, sumValue144, sumValue145), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue44 = spvNMin(sumValue145, spvNMin(sumValue144, sumValue143));
            float scalarValue45 = spvNMax(sumValue145, spvNMax(sumValue144, sumValue143));
            bool conditionValue26 = scalarValue44 < 0.0;
            precise float sumValue146 = sumValue143 - scalarValue43;
            precise float sumValue147 = sumValue144 - scalarValue43;
            precise float sumValue148 = sumValue145 - scalarValue43;
            precise float productValue67 = scalarValue43 * sumValue146;
            precise float productValue68 = scalarValue43 * sumValue147;
            precise float productValue69 = scalarValue43 * sumValue148;
            precise float sumValue149 = scalarValue43 - scalarValue44;
            float scalarValue46 = spvNMax(sumValue149, 9.9999997473787516355514526367188e-05);
            precise float quotientValue54 = productValue67 / scalarValue46;
            precise float quotientValue55 = productValue68 / scalarValue46;
            precise float quotientValue56 = productValue69 / scalarValue46;
            precise float sumValue150 = scalarValue43 + quotientValue54;
            precise float sumValue151 = scalarValue43 + quotientValue55;
            precise float sumValue152 = scalarValue43 + quotientValue56;
            float comparisonValue40 = conditionValue26 ? sumValue150 : sumValue143;
            float comparisonValue41 = conditionValue26 ? sumValue151 : sumValue144;
            float comparisonValue42 = conditionValue26 ? sumValue152 : sumValue145;
            bool conditionValue27 = scalarValue45 > 1.0;
            precise float sumValue153 = comparisonValue40 - scalarValue43;
            precise float sumValue154 = comparisonValue41 - scalarValue43;
            precise float sumValue155 = comparisonValue42 - scalarValue43;
            precise float sumValue156 = 1.0 - scalarValue43;
            precise float productValue70 = sumValue153 * sumValue156;
            precise float productValue71 = sumValue154 * sumValue156;
            precise float productValue72 = sumValue155 * sumValue156;
            precise float sumValue157 = scalarValue45 - scalarValue43;
            float scalarValue47 = spvNMax(sumValue157, 9.9999997473787516355514526367188e-05);
            precise float quotientValue57 = productValue70 / scalarValue47;
            precise float quotientValue58 = productValue71 / scalarValue47;
            precise float quotientValue59 = productValue72 / scalarValue47;
            precise float sumValue158 = scalarValue43 + quotientValue57;
            precise float sumValue159 = scalarValue43 + quotientValue58;
            precise float sumValue160 = scalarValue43 + quotientValue59;
            intermediateValue31 = conditionValue27 ? sumValue160 : comparisonValue42;
            intermediateValue32 = conditionValue27 ? sumValue159 : comparisonValue41;
            intermediateValue33 = conditionValue27 ? sumValue158 : comparisonValue40;
            break;
        }
        case 14u:
        {
            precise float sumValue161 = rdDot3Precise2(vectorValue2, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) - rdDot3Precise2(vectorValue3, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            precise float sumValue162 = sumValue161 + quotientValue27;
            precise float sumValue163 = sumValue161 + quotientValue28;
            precise float sumValue164 = sumValue161 + quotientValue29;
            float scalarValue48 = rdDot3Precise2(vec3(sumValue162, sumValue163, sumValue164), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue49 = spvNMin(sumValue164, spvNMin(sumValue163, sumValue162));
            float scalarValue50 = spvNMax(sumValue164, spvNMax(sumValue163, sumValue162));
            bool conditionValue28 = scalarValue49 < 0.0;
            precise float sumValue165 = sumValue162 - scalarValue48;
            precise float sumValue166 = sumValue163 - scalarValue48;
            precise float sumValue167 = sumValue164 - scalarValue48;
            precise float productValue73 = scalarValue48 * sumValue165;
            precise float productValue74 = scalarValue48 * sumValue166;
            precise float productValue75 = scalarValue48 * sumValue167;
            precise float sumValue168 = scalarValue48 - scalarValue49;
            float scalarValue51 = spvNMax(sumValue168, 9.9999997473787516355514526367188e-05);
            precise float quotientValue60 = productValue73 / scalarValue51;
            precise float quotientValue61 = productValue74 / scalarValue51;
            precise float quotientValue62 = productValue75 / scalarValue51;
            precise float sumValue169 = scalarValue48 + quotientValue60;
            precise float sumValue170 = scalarValue48 + quotientValue61;
            precise float sumValue171 = scalarValue48 + quotientValue62;
            float comparisonValue43 = conditionValue28 ? sumValue169 : sumValue162;
            float comparisonValue44 = conditionValue28 ? sumValue170 : sumValue163;
            float comparisonValue45 = conditionValue28 ? sumValue171 : sumValue164;
            bool conditionValue29 = scalarValue50 > 1.0;
            precise float sumValue172 = comparisonValue43 - scalarValue48;
            precise float sumValue173 = comparisonValue44 - scalarValue48;
            precise float sumValue174 = comparisonValue45 - scalarValue48;
            precise float sumValue175 = 1.0 - scalarValue48;
            precise float productValue76 = sumValue172 * sumValue175;
            precise float productValue77 = sumValue173 * sumValue175;
            precise float productValue78 = sumValue174 * sumValue175;
            precise float sumValue176 = scalarValue50 - scalarValue48;
            float scalarValue52 = spvNMax(sumValue176, 9.9999997473787516355514526367188e-05);
            precise float quotientValue63 = productValue76 / scalarValue52;
            precise float quotientValue64 = productValue77 / scalarValue52;
            precise float quotientValue65 = productValue78 / scalarValue52;
            precise float sumValue177 = scalarValue48 + quotientValue63;
            precise float sumValue178 = scalarValue48 + quotientValue64;
            precise float sumValue179 = scalarValue48 + quotientValue65;
            intermediateValue31 = conditionValue29 ? sumValue179 : comparisonValue45;
            intermediateValue32 = conditionValue29 ? sumValue178 : comparisonValue44;
            intermediateValue33 = conditionValue29 ? sumValue177 : comparisonValue43;
            break;
        }
        case 15u:
        {
            precise float sumValue180 = rdDot3Precise2(vectorValue3, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) - rdDot3Precise2(vectorValue2, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            precise float sumValue181 = sumValue180 + quotientValue24;
            precise float sumValue182 = sumValue180 + quotientValue25;
            precise float sumValue183 = sumValue180 + quotientValue26;
            float scalarValue53 = rdDot3Precise2(vec3(sumValue181, sumValue182, sumValue183), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue54 = spvNMin(sumValue183, spvNMin(sumValue182, sumValue181));
            float scalarValue55 = spvNMax(sumValue183, spvNMax(sumValue182, sumValue181));
            bool conditionValue30 = scalarValue54 < 0.0;
            precise float sumValue184 = sumValue181 - scalarValue53;
            precise float sumValue185 = sumValue182 - scalarValue53;
            precise float sumValue186 = sumValue183 - scalarValue53;
            precise float productValue79 = scalarValue53 * sumValue184;
            precise float productValue80 = scalarValue53 * sumValue185;
            precise float productValue81 = scalarValue53 * sumValue186;
            precise float sumValue187 = scalarValue53 - scalarValue54;
            float scalarValue56 = spvNMax(sumValue187, 9.9999997473787516355514526367188e-05);
            precise float quotientValue66 = productValue79 / scalarValue56;
            precise float quotientValue67 = productValue80 / scalarValue56;
            precise float quotientValue68 = productValue81 / scalarValue56;
            precise float sumValue188 = scalarValue53 + quotientValue66;
            precise float sumValue189 = scalarValue53 + quotientValue67;
            precise float sumValue190 = scalarValue53 + quotientValue68;
            float comparisonValue46 = conditionValue30 ? sumValue188 : sumValue181;
            float comparisonValue47 = conditionValue30 ? sumValue189 : sumValue182;
            float comparisonValue48 = conditionValue30 ? sumValue190 : sumValue183;
            bool conditionValue31 = scalarValue55 > 1.0;
            precise float sumValue191 = comparisonValue46 - scalarValue53;
            precise float sumValue192 = comparisonValue47 - scalarValue53;
            precise float sumValue193 = comparisonValue48 - scalarValue53;
            precise float sumValue194 = 1.0 - scalarValue53;
            precise float productValue82 = sumValue191 * sumValue194;
            precise float productValue83 = sumValue192 * sumValue194;
            precise float productValue84 = sumValue193 * sumValue194;
            precise float sumValue195 = scalarValue55 - scalarValue53;
            float scalarValue57 = spvNMax(sumValue195, 9.9999997473787516355514526367188e-05);
            precise float quotientValue69 = productValue82 / scalarValue57;
            precise float quotientValue70 = productValue83 / scalarValue57;
            precise float quotientValue71 = productValue84 / scalarValue57;
            precise float sumValue196 = scalarValue53 + quotientValue69;
            precise float sumValue197 = scalarValue53 + quotientValue70;
            precise float sumValue198 = scalarValue53 + quotientValue71;
            intermediateValue31 = conditionValue31 ? sumValue198 : comparisonValue48;
            intermediateValue32 = conditionValue31 ? sumValue197 : comparisonValue47;
            intermediateValue33 = conditionValue31 ? sumValue196 : comparisonValue46;
            break;
        }
        case 16u:
        {
            precise float sumValue199 = quotientValue24 + quotientValue27;
            precise float sumValue200 = quotientValue25 + quotientValue28;
            precise float sumValue201 = quotientValue26 + quotientValue29;
            intermediateValue31 = spvNMin(sumValue201, 1.0);
            intermediateValue32 = spvNMin(sumValue200, 1.0);
            intermediateValue33 = spvNMin(sumValue199, 1.0);
            break;
        }
        default:
        {
            intermediateValue31 = 0.0;
            intermediateValue32 = 0.0;
            intermediateValue33 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue28 = quotientValue23;
            intermediateValue29 = quotientValue22;
            intermediateValue30 = quotientValue21;
            break;
        }
        case 1u:
        {
            intermediateValue28 = quotientValue20 * quotientValue23;
            intermediateValue29 = quotientValue19 * quotientValue22;
            intermediateValue30 = quotientValue18 * quotientValue21;
            break;
        }
        case 2u:
        {
            intermediateValue28 = fma(-quotientValue20, quotientValue23, quotientValue20 + quotientValue23);
            intermediateValue29 = fma(-quotientValue19, quotientValue22, quotientValue19 + quotientValue22);
            intermediateValue30 = fma(-quotientValue18, quotientValue21, quotientValue18 + quotientValue21);
            break;
        }
        case 3u:
        {
            float multiplyAddValue = fma(quotientValue18, 2.0, -1.0);
            float multiplyAddValue1 = fma(quotientValue19, 2.0, -1.0);
            float multiplyAddValue2 = fma(quotientValue20, 2.0, -1.0);
            float multiplyAddValue3 = fma(-quotientValue21, multiplyAddValue, quotientValue21 + multiplyAddValue);
            float multiplyAddValue4 = fma(-quotientValue22, multiplyAddValue1, quotientValue22 + multiplyAddValue1);
            float multiplyAddValue5 = fma(-quotientValue23, multiplyAddValue2, quotientValue23 + multiplyAddValue2);
            intermediateValue28 = (quotientValue20 <= 0.5) ? (fma(quotientValue23, quotientValue20 + quotientValue20, -multiplyAddValue5) + multiplyAddValue5) : multiplyAddValue5;
            intermediateValue29 = (quotientValue19 <= 0.5) ? (fma(quotientValue22, quotientValue19 + quotientValue19, -multiplyAddValue4) + multiplyAddValue4) : multiplyAddValue4;
            intermediateValue30 = (quotientValue18 <= 0.5) ? (fma(quotientValue21, quotientValue18 + quotientValue18, -multiplyAddValue3) + multiplyAddValue3) : multiplyAddValue3;
            break;
        }
        case 4u:
        {
            intermediateValue28 = spvNMin(quotientValue20, quotientValue23);
            intermediateValue29 = spvNMin(quotientValue19, quotientValue22);
            intermediateValue30 = spvNMin(quotientValue18, quotientValue21);
            break;
        }
        case 5u:
        {
            intermediateValue28 = spvNMax(quotientValue20, quotientValue23);
            intermediateValue29 = spvNMax(quotientValue19, quotientValue22);
            intermediateValue30 = spvNMax(quotientValue18, quotientValue21);
            break;
        }
        case 6u:
        {
            intermediateValue28 = spvNMin(quotientValue20 / spvNMax(1.0 - quotientValue23, 9.9999997473787516355514526367188e-05), 1.0);
            intermediateValue29 = spvNMin(quotientValue19 / spvNMax(1.0 - quotientValue22, 9.9999997473787516355514526367188e-05), 1.0);
            intermediateValue30 = spvNMin(quotientValue18 / spvNMax(1.0 - quotientValue21, 9.9999997473787516355514526367188e-05), 1.0);
            break;
        }
        case 7u:
        {
            intermediateValue28 = 1.0 - spvNMin((1.0 - quotientValue20) / spvNMax(quotientValue23, 9.9999997473787516355514526367188e-05), 1.0);
            intermediateValue29 = 1.0 - spvNMin((1.0 - quotientValue19) / spvNMax(quotientValue22, 9.9999997473787516355514526367188e-05), 1.0);
            intermediateValue30 = 1.0 - spvNMin((1.0 - quotientValue18) / spvNMax(quotientValue21, 9.9999997473787516355514526367188e-05), 1.0);
            break;
        }
        case 8u:
        {
            float multiplyAddValue6 = fma(quotientValue21, 2.0, -1.0);
            float multiplyAddValue7 = fma(quotientValue22, 2.0, -1.0);
            float multiplyAddValue8 = fma(quotientValue23, 2.0, -1.0);
            float multiplyAddValue9 = fma(-quotientValue18, multiplyAddValue6, quotientValue18 + multiplyAddValue6);
            float multiplyAddValue10 = fma(-quotientValue19, multiplyAddValue7, quotientValue19 + multiplyAddValue7);
            float multiplyAddValue11 = fma(-quotientValue20, multiplyAddValue8, quotientValue20 + multiplyAddValue8);
            intermediateValue28 = (quotientValue23 <= 0.5) ? (fma(quotientValue20, quotientValue23 + quotientValue23, -multiplyAddValue11) + multiplyAddValue11) : multiplyAddValue11;
            intermediateValue29 = (quotientValue22 <= 0.5) ? (fma(quotientValue19, quotientValue22 + quotientValue22, -multiplyAddValue10) + multiplyAddValue10) : multiplyAddValue10;
            intermediateValue30 = (quotientValue21 <= 0.5) ? (fma(quotientValue18, quotientValue21 + quotientValue21, -multiplyAddValue9) + multiplyAddValue9) : multiplyAddValue9;
            break;
        }
        case 9u:
        {
            float nonlinearValue3 = sqrt(quotientValue18);
            float nonlinearValue4 = sqrt(quotientValue19);
            float nonlinearValue5 = sqrt(quotientValue20);
            float multiplyAddValue12 = fma(fma(quotientValue21, 2.0, -1.0), ((quotientValue18 <= 0.25) ? (fma(fma(fma(quotientValue18, 16.0, -12.0), quotientValue18, 4.0), quotientValue18, -nonlinearValue3) + nonlinearValue3) : nonlinearValue3) - quotientValue18, quotientValue18);
            float multiplyAddValue13 = fma(fma(quotientValue22, 2.0, -1.0), ((quotientValue19 <= 0.25) ? (fma(fma(fma(quotientValue19, 16.0, -12.0), quotientValue19, 4.0), quotientValue19, -nonlinearValue4) + nonlinearValue4) : nonlinearValue4) - quotientValue19, quotientValue19);
            float multiplyAddValue14 = fma(fma(quotientValue23, 2.0, -1.0), ((quotientValue20 <= 0.25) ? (fma(fma(fma(quotientValue20, 16.0, -12.0), quotientValue20, 4.0), quotientValue20, -nonlinearValue5) + nonlinearValue5) : nonlinearValue5) - quotientValue20, quotientValue20);
            intermediateValue28 = (quotientValue23 <= 0.5) ? ((fma(-(quotientValue20 * fma(-quotientValue23, 2.0, 1.0)), 1.0 - quotientValue20, quotientValue20) - multiplyAddValue14) + multiplyAddValue14) : multiplyAddValue14;
            intermediateValue29 = (quotientValue22 <= 0.5) ? ((fma(-(quotientValue19 * fma(-quotientValue22, 2.0, 1.0)), 1.0 - quotientValue19, quotientValue19) - multiplyAddValue13) + multiplyAddValue13) : multiplyAddValue13;
            intermediateValue30 = (quotientValue21 <= 0.5) ? ((fma(-(quotientValue18 * fma(-quotientValue21, 2.0, 1.0)), 1.0 - quotientValue18, quotientValue18) - multiplyAddValue12) + multiplyAddValue12) : multiplyAddValue12;
            break;
        }
        case 10u:
        {
            intermediateValue28 = abs(quotientValue20 - quotientValue23);
            intermediateValue29 = abs(quotientValue19 - quotientValue22);
            intermediateValue30 = abs(quotientValue18 - quotientValue21);
            break;
        }
        case 11u:
        {
            intermediateValue28 = fma(-(quotientValue20 * quotientValue23), 2.0, quotientValue20 + quotientValue23);
            intermediateValue29 = fma(-(quotientValue19 * quotientValue22), 2.0, quotientValue19 + quotientValue22);
            intermediateValue30 = fma(-(quotientValue18 * quotientValue21), 2.0, quotientValue18 + quotientValue21);
            break;
        }
        case 12u:
        {
            float sumValue33 = spvNMax(quotientValue20, spvNMax(quotientValue19, quotientValue18)) - spvNMin(quotientValue20, spvNMin(quotientValue19, quotientValue18));
            float comparisonValue14;
            float comparisonValue15;
            float comparisonValue16;
            if (quotientValue22 >= quotientValue21)
            {
                bool conditionValue = quotientValue21 < quotientValue23;
                bool conditionValue1 = quotientValue23 < quotientValue22;
                float sumValue34 = quotientValue22 - quotientValue21;
                float sumValue35 = quotientValue23 - quotientValue21;
                bool comparisonValue3 = quotientValue23 >= quotientValue22;
                bool comparisonValue4 = quotientValue23 >= quotientValue21;
                bool bitwiseValue2 = comparisonValue4 && (quotientValue21 < quotientValue22);
                comparisonValue14 = comparisonValue3 ? (conditionValue ? sumValue33 : 0.0) : (bitwiseValue2 ? ((sumValue33 * sumValue35) / spvNMax(sumValue34, 9.9999997473787516355514526367188e-05)) : 0.0);
                comparisonValue15 = comparisonValue3 ? (conditionValue ? ((sumValue33 * sumValue34) / spvNMax(sumValue35, 9.9999997473787516355514526367188e-05)) : 0.0) : ((bitwiseValue2 || ((!comparisonValue4) && conditionValue1)) ? sumValue33 : 0.0);
                comparisonValue16 = (comparisonValue3 || ((!conditionValue1) || comparisonValue4)) ? 0.0 : ((sumValue33 * (quotientValue21 - quotientValue23)) / spvNMax(quotientValue22 - quotientValue23, 9.9999997473787516355514526367188e-05));
            }
            else
            {
                bool conditionValue2 = quotientValue22 < quotientValue23;
                bool conditionValue3 = quotientValue23 < quotientValue21;
                float sumValue36 = quotientValue21 - quotientValue22;
                float sumValue37 = quotientValue23 - quotientValue22;
                bool comparisonValue5 = quotientValue23 >= quotientValue21;
                bool comparisonValue6 = quotientValue23 >= quotientValue22;
                bool bitwiseValue3 = comparisonValue6 && (quotientValue22 < quotientValue21);
                comparisonValue14 = comparisonValue5 ? (conditionValue2 ? sumValue33 : 0.0) : (bitwiseValue3 ? ((sumValue33 * sumValue37) / spvNMax(sumValue36, 9.9999997473787516355514526367188e-05)) : 0.0);
                comparisonValue15 = ((comparisonValue6 || (!conditionValue3)) || comparisonValue5) ? 0.0 : ((sumValue33 * (quotientValue22 - quotientValue23)) / spvNMax(quotientValue21 - quotientValue23, 9.9999997473787516355514526367188e-05));
                comparisonValue16 = comparisonValue5 ? (conditionValue2 ? ((sumValue33 * sumValue36) / spvNMax(sumValue37, 9.9999997473787516355514526367188e-05)) : 0.0) : ((bitwiseValue3 || ((!comparisonValue6) && conditionValue3)) ? sumValue33 : 0.0);
            }
            float sumValue38 = rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) - rdDot3Precise2(vec3(comparisonValue16, comparisonValue15, comparisonValue14), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float sumValue39 = sumValue38 + comparisonValue16;
            float sumValue40 = sumValue38 + comparisonValue15;
            float sumValue41 = sumValue38 + comparisonValue14;
            float scalarValue25 = rdDot3Precise2(vec3(sumValue39, sumValue40, sumValue41), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue26 = spvNMin(sumValue41, spvNMin(sumValue40, sumValue39));
            float scalarValue27 = spvNMax(sumValue41, spvNMax(sumValue40, sumValue39));
            bool conditionValue4 = scalarValue26 < 0.0;
            float sumValue42 = spvNMax(scalarValue25 - scalarValue26, 9.9999997473787516355514526367188e-05);
            float comparisonValue7 = conditionValue4 ? (scalarValue25 + ((scalarValue25 * (sumValue39 - scalarValue25)) / sumValue42)) : sumValue39;
            float comparisonValue8 = conditionValue4 ? (scalarValue25 + ((scalarValue25 * (sumValue40 - scalarValue25)) / sumValue42)) : sumValue40;
            float comparisonValue9 = conditionValue4 ? (scalarValue25 + ((scalarValue25 * (sumValue41 - scalarValue25)) / sumValue42)) : sumValue41;
            bool conditionValue5 = scalarValue27 > 1.0;
            float sumValue43 = 1.0 - scalarValue25;
            float sumValue44 = spvNMax(scalarValue27 - scalarValue25, 9.9999997473787516355514526367188e-05);
            intermediateValue28 = conditionValue5 ? (scalarValue25 + (((comparisonValue9 - scalarValue25) * sumValue43) / sumValue44)) : comparisonValue9;
            intermediateValue29 = conditionValue5 ? (scalarValue25 + (((comparisonValue8 - scalarValue25) * sumValue43) / sumValue44)) : comparisonValue8;
            intermediateValue30 = conditionValue5 ? (scalarValue25 + (((comparisonValue7 - scalarValue25) * sumValue43) / sumValue44)) : comparisonValue7;
            break;
        }
        case 13u:
        {
            float sumValue45 = spvNMax(quotientValue23, spvNMax(quotientValue22, quotientValue21)) - spvNMin(quotientValue23, spvNMin(quotientValue22, quotientValue21));
            float comparisonValue20;
            float comparisonValue21;
            float comparisonValue22;
            if (quotientValue19 >= quotientValue18)
            {
                bool conditionValue6 = quotientValue18 < quotientValue20;
                bool conditionValue7 = quotientValue20 < quotientValue19;
                float sumValue46 = quotientValue19 - quotientValue18;
                float sumValue47 = quotientValue20 - quotientValue18;
                bool comparisonValue10 = quotientValue20 >= quotientValue19;
                bool comparisonValue11 = quotientValue20 >= quotientValue18;
                bool bitwiseValue4 = comparisonValue11 && (quotientValue18 < quotientValue19);
                comparisonValue20 = comparisonValue10 ? (conditionValue6 ? sumValue45 : 0.0) : (bitwiseValue4 ? ((sumValue45 * sumValue47) / spvNMax(sumValue46, 9.9999997473787516355514526367188e-05)) : 0.0);
                comparisonValue21 = comparisonValue10 ? (conditionValue6 ? ((sumValue45 * sumValue46) / spvNMax(sumValue47, 9.9999997473787516355514526367188e-05)) : 0.0) : ((bitwiseValue4 || ((!comparisonValue11) && conditionValue7)) ? sumValue45 : 0.0);
                comparisonValue22 = (comparisonValue10 || ((!conditionValue7) || comparisonValue11)) ? 0.0 : ((sumValue45 * (quotientValue18 - quotientValue20)) / spvNMax(quotientValue19 - quotientValue20, 9.9999997473787516355514526367188e-05));
            }
            else
            {
                bool conditionValue8 = quotientValue19 < quotientValue20;
                bool conditionValue9 = quotientValue20 < quotientValue18;
                float sumValue48 = quotientValue18 - quotientValue19;
                float sumValue49 = quotientValue20 - quotientValue19;
                bool comparisonValue12 = quotientValue20 >= quotientValue18;
                bool comparisonValue13 = quotientValue20 >= quotientValue19;
                bool bitwiseValue5 = comparisonValue13 && (quotientValue19 < quotientValue18);
                comparisonValue20 = comparisonValue12 ? (conditionValue8 ? sumValue45 : 0.0) : (bitwiseValue5 ? ((sumValue45 * sumValue49) / spvNMax(sumValue48, 9.9999997473787516355514526367188e-05)) : 0.0);
                comparisonValue21 = ((comparisonValue13 || (!conditionValue9)) || comparisonValue12) ? 0.0 : ((sumValue45 * (quotientValue19 - quotientValue20)) / spvNMax(quotientValue18 - quotientValue20, 9.9999997473787516355514526367188e-05));
                comparisonValue22 = comparisonValue12 ? (conditionValue8 ? ((sumValue45 * sumValue48) / spvNMax(sumValue49, 9.9999997473787516355514526367188e-05)) : 0.0) : ((bitwiseValue5 || ((!comparisonValue13) && conditionValue9)) ? sumValue45 : 0.0);
            }
            float sumValue50 = rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) - rdDot3Precise2(vec3(comparisonValue22, comparisonValue21, comparisonValue20), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float sumValue51 = sumValue50 + comparisonValue22;
            float sumValue52 = sumValue50 + comparisonValue21;
            float sumValue53 = sumValue50 + comparisonValue20;
            float scalarValue28 = rdDot3Precise2(vec3(sumValue51, sumValue52, sumValue53), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue29 = spvNMin(sumValue53, spvNMin(sumValue52, sumValue51));
            float scalarValue30 = spvNMax(sumValue53, spvNMax(sumValue52, sumValue51));
            bool conditionValue10 = scalarValue29 < 0.0;
            float sumValue54 = spvNMax(scalarValue28 - scalarValue29, 9.9999997473787516355514526367188e-05);
            float comparisonValue17 = conditionValue10 ? (scalarValue28 + ((scalarValue28 * (sumValue51 - scalarValue28)) / sumValue54)) : sumValue51;
            float comparisonValue18 = conditionValue10 ? (scalarValue28 + ((scalarValue28 * (sumValue52 - scalarValue28)) / sumValue54)) : sumValue52;
            float comparisonValue19 = conditionValue10 ? (scalarValue28 + ((scalarValue28 * (sumValue53 - scalarValue28)) / sumValue54)) : sumValue53;
            bool conditionValue11 = scalarValue30 > 1.0;
            float sumValue55 = 1.0 - scalarValue28;
            float sumValue56 = spvNMax(scalarValue30 - scalarValue28, 9.9999997473787516355514526367188e-05);
            intermediateValue28 = conditionValue11 ? (scalarValue28 + (((comparisonValue19 - scalarValue28) * sumValue55) / sumValue56)) : comparisonValue19;
            intermediateValue29 = conditionValue11 ? (scalarValue28 + (((comparisonValue18 - scalarValue28) * sumValue55) / sumValue56)) : comparisonValue18;
            intermediateValue30 = conditionValue11 ? (scalarValue28 + (((comparisonValue17 - scalarValue28) * sumValue55) / sumValue56)) : comparisonValue17;
            break;
        }
        case 14u:
        {
            float sumValue57 = rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) - rdDot3Precise2(vectorValue1, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float sumValue58 = sumValue57 + quotientValue21;
            float sumValue59 = sumValue57 + quotientValue22;
            float sumValue60 = sumValue57 + quotientValue23;
            float scalarValue31 = rdDot3Precise2(vec3(sumValue58, sumValue59, sumValue60), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue32 = spvNMin(sumValue60, spvNMin(sumValue59, sumValue58));
            float scalarValue33 = spvNMax(sumValue60, spvNMax(sumValue59, sumValue58));
            bool conditionValue12 = scalarValue32 < 0.0;
            float sumValue61 = spvNMax(scalarValue31 - scalarValue32, 9.9999997473787516355514526367188e-05);
            float comparisonValue23 = conditionValue12 ? (scalarValue31 + ((scalarValue31 * (sumValue58 - scalarValue31)) / sumValue61)) : sumValue58;
            float comparisonValue24 = conditionValue12 ? (scalarValue31 + ((scalarValue31 * (sumValue59 - scalarValue31)) / sumValue61)) : sumValue59;
            float comparisonValue25 = conditionValue12 ? (scalarValue31 + ((scalarValue31 * (sumValue60 - scalarValue31)) / sumValue61)) : sumValue60;
            bool conditionValue13 = scalarValue33 > 1.0;
            float sumValue62 = 1.0 - scalarValue31;
            float sumValue63 = spvNMax(scalarValue33 - scalarValue31, 9.9999997473787516355514526367188e-05);
            intermediateValue28 = conditionValue13 ? (scalarValue31 + (((comparisonValue25 - scalarValue31) * sumValue62) / sumValue63)) : comparisonValue25;
            intermediateValue29 = conditionValue13 ? (scalarValue31 + (((comparisonValue24 - scalarValue31) * sumValue62) / sumValue63)) : comparisonValue24;
            intermediateValue30 = conditionValue13 ? (scalarValue31 + (((comparisonValue23 - scalarValue31) * sumValue62) / sumValue63)) : comparisonValue23;
            break;
        }
        case 15u:
        {
            float sumValue64 = rdDot3Precise2(vectorValue1, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) - rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float sumValue65 = sumValue64 + quotientValue18;
            float sumValue66 = sumValue64 + quotientValue19;
            float sumValue67 = sumValue64 + quotientValue20;
            float scalarValue34 = rdDot3Precise2(vec3(sumValue65, sumValue66, sumValue67), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue35 = spvNMin(sumValue67, spvNMin(sumValue66, sumValue65));
            float scalarValue36 = spvNMax(sumValue67, spvNMax(sumValue66, sumValue65));
            bool conditionValue14 = scalarValue35 < 0.0;
            float sumValue68 = spvNMax(scalarValue34 - scalarValue35, 9.9999997473787516355514526367188e-05);
            float comparisonValue26 = conditionValue14 ? (scalarValue34 + ((scalarValue34 * (sumValue65 - scalarValue34)) / sumValue68)) : sumValue65;
            float comparisonValue27 = conditionValue14 ? (scalarValue34 + ((scalarValue34 * (sumValue66 - scalarValue34)) / sumValue68)) : sumValue66;
            float comparisonValue28 = conditionValue14 ? (scalarValue34 + ((scalarValue34 * (sumValue67 - scalarValue34)) / sumValue68)) : sumValue67;
            bool conditionValue15 = scalarValue36 > 1.0;
            float sumValue69 = 1.0 - scalarValue34;
            float sumValue70 = spvNMax(scalarValue36 - scalarValue34, 9.9999997473787516355514526367188e-05);
            intermediateValue28 = conditionValue15 ? (scalarValue34 + (((comparisonValue28 - scalarValue34) * sumValue69) / sumValue70)) : comparisonValue28;
            intermediateValue29 = conditionValue15 ? (scalarValue34 + (((comparisonValue27 - scalarValue34) * sumValue69) / sumValue70)) : comparisonValue27;
            intermediateValue30 = conditionValue15 ? (scalarValue34 + (((comparisonValue26 - scalarValue34) * sumValue69) / sumValue70)) : comparisonValue26;
            break;
        }
        case 16u:
        {
            intermediateValue28 = spvNMin(quotientValue20 + quotientValue23, 1.0);
            intermediateValue29 = spvNMin(quotientValue19 + quotientValue22, 1.0);
            intermediateValue30 = spvNMin(quotientValue18 + quotientValue21, 1.0);
            break;
        }
        default:
        {
            intermediateValue28 = 0.0;
            intermediateValue29 = 0.0;
            intermediateValue30 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue5 = quotientValue3;
            productValue6 = quotientValue4;
            productValue7 = quotientValue5;
#endif
            break;
        }
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue85 = productValue42 * spvNClamp(intermediateValue33, 0.0, 1.0);
    precise float productValue86 = productValue42 * spvNClamp(intermediateValue32, 0.0, 1.0);
    precise float productValue87 = productValue42 * spvNClamp(intermediateValue31, 0.0, 1.0);
    precise float productValue88 = productValue42 * 1.0;
    float multiplyAddValue40 = fma(-scalarValue22, fragmentScalarConstants1.packedValues[bitwiseValue7], 1.0);
    fragmentColor0.x = fma(multiplyAddValue40, scalarValue18, fma(sumValue71, productValue38, productValue85));
    fragmentColor0.y = fma(multiplyAddValue40, scalarValue19, fma(sumValue71, productValue39, productValue86));
    fragmentColor0.z = fma(multiplyAddValue40, scalarValue20, fma(sumValue71, productValue40, productValue87));
    fragmentColor0.w = fma(multiplyAddValue40, scalarValue21, fma(sumValue71, productValue41, productValue88));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue15 = fma(-scalarValue22, fragmentScalarConstants1.packedValues[bitwiseValue1], 1.0);
    fragmentColor0.x = fma(multiplyAddValue15, scalarValue18, fma(sumValue32, productValue32, productValue36 * spvNClamp(intermediateValue30, 0.0, 1.0)));
    fragmentColor0.y = fma(multiplyAddValue15, scalarValue19, fma(sumValue32, productValue33, productValue36 * spvNClamp(intermediateValue29, 0.0, 1.0)));
    fragmentColor0.z = fma(multiplyAddValue15, scalarValue20, fma(sumValue32, productValue34, productValue36 * spvNClamp(intermediateValue28, 0.0, 1.0)));
    fragmentColor0.w = fma(multiplyAddValue15, scalarValue21, fma(sumValue32, productValue35, productValue36));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue31 = 1.0 - productValue3;
    fragmentColor0.x = ((sumValue31 * scalarValue) + (productValue * sumValue1)) + (spvNClamp(productValue5, 0.0, 1.0) * productValue4);
    fragmentColor0.y = ((sumValue31 * scalarValue1) + (productValue1 * sumValue1)) + (spvNClamp(productValue6, 0.0, 1.0) * productValue4);
    fragmentColor0.z = ((sumValue31 * scalarValue2) + (productValue2 * sumValue1)) + (spvNClamp(productValue7, 0.0, 1.0) * productValue4);
    fragmentColor0.w = (sumValue31 * scalarValue3) + productValue3;
#endif
}
