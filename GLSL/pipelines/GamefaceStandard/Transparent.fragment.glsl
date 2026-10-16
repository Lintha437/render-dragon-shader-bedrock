#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceStandard / Transparent / fragment forward pipeline.
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
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/GamefaceStandard/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint scalarValue15 = uint(varyingTexCoord3.w);
    uint bitwiseValue4 = (uint(varyingTexCoord3.z) << 4u) + ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue18 = bitwiseValue4 + 1u;
    uint productValue17 = uint(int(fragmentScalarConstants1.packedValues[bitwiseValue4 * 4u]));
    uint sumValue19 = uint(max(int(productValue17 - 1u), int(0u)));
    uint scalarValue40 = uint(int(fragmentVectorConstants1.packedValues[sumValue19].y));
    uint scalarValue41 = uint(int(fragmentVectorConstants1.packedValues[sumValue19].z));
    float intermediateValue16;
    float intermediateValue18;
    float intermediateValue20;
    float intermediateValue22;
    float intermediateValue24;
    float intermediateValue26;
    bool intermediateValue27;
    if (scalarValue15 == 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue15 = uint(varyingTexCoord3.w);
    uint scalarValue16 = bitfieldInsert(bitfieldExtract(uint(varyingTexCoord3.y), int(4u), int(4u)), uint(varyingTexCoord3.z), int(4u), int(28u));
    uint sumValue11 = scalarValue16 + 1u;
    uint productValue15 = uint(int(fragmentScalarConstants1.packedValues[scalarValue16 * 4u]));
    uint sumValue12 = uint(max(int(productValue15 - 1u), int(0u)));
    uint scalarValue17 = uint(int(fragmentVectorConstants1.packedValues[sumValue12].y));
    uint scalarValue18 = uint(int(fragmentVectorConstants1.packedValues[sumValue12].z));
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue19;
    float intermediateValue21;
    float intermediateValue23;
    float intermediateValue25;
    bool intermediateValue26;
    if (scalarValue15 == 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float dotProductValue;
    float intermediateValue33;
    float intermediateValue34;
    float intermediateValue36;
    float intermediateValue38;
    float intermediateValue;
    float intermediateValue1;
    float intermediateValue2;
    float intermediateValue3;
    uint intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    uint intermediateValue10;
    uint intermediateValue11;
    uint intermediateValue12;
    bool comparisonValue;
    for (;;)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float scalarValue42 = varyingTexCoord1.w * varyingTexCoord1.z;
        intermediateValue16 = spvNMin(scalarValue42, 1.0);
        intermediateValue18 = 1.0;
        intermediateValue20 = fragmentVectorConstants1.packedValues[sumValue18].z;
        intermediateValue22 = fragmentVectorConstants1.packedValues[sumValue18].y;
        intermediateValue24 = fragmentVectorConstants1.packedValues[sumValue18].x;
        intermediateValue26 = fragmentVectorConstants1.packedValues[sumValue18].w;
        intermediateValue27 = true;
    }
    else
    {
        float intermediateValue17;
        float intermediateValue19;
        float intermediateValue21;
        float intermediateValue23;
        float intermediateValue25;
        float multiplyAddValue;
        bool intermediateValue28;
        if (scalarValue15 == 3u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue16 = spvNMin(varyingTexCoord1.w * varyingTexCoord1.z, 1.0);
        intermediateValue17 = 1.0;
        intermediateValue19 = fragmentVectorConstants1.packedValues[sumValue11].z;
        intermediateValue21 = fragmentVectorConstants1.packedValues[sumValue11].y;
        intermediateValue23 = fragmentVectorConstants1.packedValues[sumValue11].x;
        intermediateValue25 = fragmentVectorConstants1.packedValues[sumValue11].w;
        intermediateValue26 = true;
    }
    else
    {
        float bitwiseValue;
        float intermediateValue18;
        float intermediateValue20;
        float intermediateValue22;
        float intermediateValue24;
        float multiplyAddValue;
        bool intermediateValue27;
        if (scalarValue15 == 3u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue = varyingTexCoord1.x;
        intermediateValue1 = varyingTexCoord1.y;
        intermediateValue2 = varyingTexCoord1.z;
        intermediateValue3 = varyingTexCoord1.w;
        intermediateValue4 = uint(varyingTexCoord3.w);
        uint bitwiseValue1 = (uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u);
        intermediateValue5 = fragmentVectorConstants1.packedValues[bitwiseValue1].y;
        uint sumValue = bitwiseValue1 + 1u;
        intermediateValue6 = fragmentVectorConstants1.packedValues[sumValue].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[sumValue].y;
        intermediateValue8 = fragmentVectorConstants1.packedValues[sumValue].z;
        intermediateValue9 = fragmentVectorConstants1.packedValues[sumValue].w;
        intermediateValue10 = uint(int(fragmentVectorConstants1.packedValues[bitwiseValue1].x));
        uint sumValue1 = uint(max(int(0u), int(intermediateValue10 + 4294967295u)));
        intermediateValue11 = uint(int(fragmentVectorConstants1.packedValues[sumValue1].y));
        intermediateValue12 = uint(int(fragmentVectorConstants1.packedValues[sumValue1].z));
        comparisonValue = intermediateValue4 == 0u;
        float intermediateValue13;
        float productValue;
        float intermediateValue14;
        float intermediateValue17;
        float intermediateValue20;
        float intermediateValue23;
        if (comparisonValue)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            bool conditionValue2 = (fragmentVectorConstants1.packedValues[productValue17].w != (-1.0)) || (fragmentVectorConstants1.packedValues[productValue17].z != (-1.0));
            precise float sumValue20 = fragmentVectorConstants1.packedValues[productValue17].z + fragmentVectorConstants1.packedValues[productValue17].x;
            precise float sumValue21 = fragmentVectorConstants1.packedValues[productValue17].w + fragmentVectorConstants1.packedValues[productValue17].y;
            vec4 sampledTextureValue7 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(conditionValue2 ? spvNMin(sumValue20, spvNMax(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[productValue17].x)) : varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(conditionValue2 ? spvNMin(sumValue21, spvNMax(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[productValue17].y)) : varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
            float scalarValue43 = sampledTextureValue7.x;
            float scalarValue44 = sampledTextureValue7.y;
            float scalarValue45 = sampledTextureValue7.z;
            float scalarValue46 = sampledTextureValue7.w;
            float exponentialValue;
            float exponentialValue1;
            float exponentialValue2;
            if ((scalarValue40 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
            bool conditionValue = (fragmentVectorConstants1.packedValues[productValue15].w != (-1.0)) || (fragmentVectorConstants1.packedValues[productValue15].z != (-1.0));
            vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(conditionValue ? spvNMin(fragmentVectorConstants1.packedValues[productValue15].z + fragmentVectorConstants1.packedValues[productValue15].x, spvNMax(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[productValue15].x)) : varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(conditionValue ? spvNMin(fragmentVectorConstants1.packedValues[productValue15].w + fragmentVectorConstants1.packedValues[productValue15].y, spvNMax(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[productValue15].y)) : varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
            float scalarValue19 = sampledTextureValue1.x;
            float scalarValue20 = sampledTextureValue1.y;
            float scalarValue21 = sampledTextureValue1.z;
            float scalarValue22 = sampledTextureValue1.w;
            float exponentialValue;
            float exponentialValue1;
            float exponentialValue2;
            if ((scalarValue17 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue13 = 1.0;
            productValue = spvNMin(1.0, intermediateValue3 * intermediateValue2);
            intermediateValue14 = intermediateValue6;
            intermediateValue17 = intermediateValue7;
            intermediateValue20 = intermediateValue8;
            intermediateValue23 = intermediateValue9;
        }
        else
        {
            float branchMergedValue;
            float branchMergedValue6;
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            float branchMergedValue10;
            if (intermediateValue4 == 3u)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                precise float productValue18 = scalarValue43 * 0.077399380505084991455078125;
                precise float productValue19 = scalarValue44 * 0.077399380505084991455078125;
                precise float productValue20 = scalarValue45 * 0.077399380505084991455078125;
                precise float sumValue22 = scalarValue43 + 0.054999999701976776123046875;
                precise float sumValue23 = scalarValue44 + 0.054999999701976776123046875;
                precise float sumValue24 = scalarValue45 + 0.054999999701976776123046875;
                precise float productValue21 = sumValue22 * 0.947867333889007568359375;
                precise float productValue22 = sumValue23 * 0.947867333889007568359375;
                precise float productValue23 = sumValue24 * 0.947867333889007568359375;
                precise float nonlinearValue = log2(productValue21) * 2.400000095367431640625;
                precise float nonlinearValue1 = log2(productValue22) * 2.400000095367431640625;
                precise float nonlinearValue2 = log2(productValue23) * 2.400000095367431640625;
                exponentialValue = (scalarValue45 > 0.040449999272823333740234375) ? exp2(nonlinearValue2) : productValue20;
                exponentialValue1 = (scalarValue44 > 0.040449999272823333740234375) ? exp2(nonlinearValue1) : productValue19;
                exponentialValue2 = (scalarValue43 > 0.040449999272823333740234375) ? exp2(nonlinearValue) : productValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                exponentialValue = (scalarValue21 > 0.040449999272823333740234375) ? exp2(log2((scalarValue21 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue21 * 0.077399380505084991455078125);
                exponentialValue1 = (scalarValue20 > 0.040449999272823333740234375) ? exp2(log2((scalarValue20 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue20 * 0.077399380505084991455078125);
                exponentialValue2 = (scalarValue19 > 0.040449999272823333740234375) ? exp2(log2((scalarValue19 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue19 * 0.077399380505084991455078125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float sumValue2;
                float sumValue3;
                if ((fragmentVectorConstants1.packedValues[intermediateValue10].z != (-1.0)) || (fragmentVectorConstants1.packedValues[intermediateValue10].w != (-1.0)))
                {
                    sumValue2 = spvNMin(spvNMax(intermediateValue, fragmentVectorConstants1.packedValues[intermediateValue10].x), fragmentVectorConstants1.packedValues[intermediateValue10].x + fragmentVectorConstants1.packedValues[intermediateValue10].z);
                    sumValue3 = spvNMin(spvNMax(intermediateValue1, fragmentVectorConstants1.packedValues[intermediateValue10].y), fragmentVectorConstants1.packedValues[intermediateValue10].y + fragmentVectorConstants1.packedValues[intermediateValue10].w);
                }
                else
                {
                    sumValue2 = intermediateValue;
                    sumValue3 = intermediateValue1;
                }
                vec4 sampledTextureValue = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * sumValue2) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * sumValue3) + fragmentVectorConstants1.packedValues[128u].y));
                float scalarValue = sampledTextureValue.x;
                float scalarValue1 = sampledTextureValue.y;
                float scalarValue2 = sampledTextureValue.z;
                float scalarValue3 = sampledTextureValue.w;
                float intermediateValue15;
                float intermediateValue18;
                float intermediateValue21;
                if ((intermediateValue11 & 2u) == 0u)
                {
                    float branchMergedValue1;
                    float branchMergedValue13;
                    float branchMergedValue14;
                    if ((intermediateValue11 & 16u) == 0u)
                    {
                        branchMergedValue1 = scalarValue2;
                        branchMergedValue13 = scalarValue;
                        branchMergedValue14 = scalarValue1;
                    }
                    else
                    {
                        float exponentialValue1;
                        if (!(scalarValue <= 0.003130800090730190277099609375))
                        {
                            exponentialValue1 = (exp2(log2(scalarValue) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                        }
                        else
                        {
                            exponentialValue1 = scalarValue * 12.9200000762939453125;
                        }
                        float exponentialValue3;
                        if (!(scalarValue1 <= 0.003130800090730190277099609375))
                        {
                            exponentialValue3 = (exp2(log2(scalarValue1) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                        }
                        else
                        {
                            exponentialValue3 = scalarValue1 * 12.9200000762939453125;
                        }
                        float branchMergedValue27;
                        float branchMergedValue29;
                        float branchMergedValue30;
                        if (!(scalarValue2 <= 0.003130800090730190277099609375))
                        {
                            branchMergedValue27 = (exp2(log2(scalarValue2) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                            branchMergedValue29 = exponentialValue1;
                            branchMergedValue30 = exponentialValue3;
                        }
                        else
                        {
                            branchMergedValue27 = scalarValue2 * 12.9200000762939453125;
                            branchMergedValue29 = exponentialValue1;
                            branchMergedValue30 = exponentialValue3;
                        }
                        branchMergedValue1 = branchMergedValue27;
                        branchMergedValue13 = branchMergedValue29;
                        branchMergedValue14 = branchMergedValue30;
                    }
                    intermediateValue15 = branchMergedValue13;
                    intermediateValue18 = branchMergedValue14;
                    intermediateValue21 = branchMergedValue1;
                }
                else
                {
                    float exponentialValue;
                    if (!(scalarValue <= 0.040449999272823333740234375))
                    {
                        exponentialValue = exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                    }
                    else
                    {
                        exponentialValue = scalarValue * 0.077399380505084991455078125;
                    }
                    float exponentialValue2;
                    if (!(scalarValue1 <= 0.040449999272823333740234375))
                    {
                        exponentialValue2 = exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                    }
                    else
                    {
                        exponentialValue2 = scalarValue1 * 0.077399380505084991455078125;
                    }
                    float branchMergedValue2;
                    float branchMergedValue15;
                    float branchMergedValue16;
                    if (!(scalarValue2 <= 0.040449999272823333740234375))
                    {
                        branchMergedValue2 = exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                        branchMergedValue15 = exponentialValue;
                        branchMergedValue16 = exponentialValue2;
                    }
                    else
                    {
                        branchMergedValue2 = scalarValue2 * 0.077399380505084991455078125;
                        branchMergedValue15 = exponentialValue;
                        branchMergedValue16 = exponentialValue2;
                    }
                    intermediateValue15 = branchMergedValue15;
                    intermediateValue18 = branchMergedValue16;
                    intermediateValue21 = branchMergedValue2;
                }
                float sumValue4 = 1.0 - scalarValue3;
                float productValue1 = ((intermediateValue18 * 0.715200006961822509765625) + (intermediateValue15 * 0.2125999927520751953125)) + (intermediateValue21 * 0.072200000286102294921875);
                branchMergedValue = intermediateValue18;
                branchMergedValue6 = intermediateValue15;
                branchMergedValue7 = spvNClamp(intermediateValue2, 0.0, 1.0) * intermediateValue9;
                branchMergedValue8 = intermediateValue8;
                branchMergedValue9 = (((((scalarValue3 - sumValue4) * intermediateValue6) + sumValue4) - productValue1) * intermediateValue8) + productValue1;
                branchMergedValue10 = intermediateValue21;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float multiplyAddValue2;
                float multiplyAddValue3;
                float multiplyAddValue4;
                if ((scalarValue40 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float multiplyAddValue2;
                float multiplyAddValue3;
                float multiplyAddValue4;
                if ((scalarValue17 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float branchMergedValue21;
                float branchMergedValue22;
                float branchMergedValue23;
                float branchMergedValue24;
                float branchMergedValue25;
                float branchMergedValue26;
                if (intermediateValue4 == 17u)
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                    precise float productValue24 = scalarValue43 * 12.9200000762939453125;
                    precise float productValue25 = scalarValue44 * 12.9200000762939453125;
                    precise float productValue26 = scalarValue45 * 12.9200000762939453125;
                    precise float nonlinearValue3 = log2(scalarValue43) * 0.4166666567325592041015625;
                    precise float nonlinearValue4 = log2(scalarValue44) * 0.4166666567325592041015625;
                    precise float nonlinearValue5 = log2(scalarValue45) * 0.4166666567325592041015625;
                    multiplyAddValue4 = (scalarValue43 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue3), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue24;
                    multiplyAddValue3 = (scalarValue44 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue4), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue25;
                    multiplyAddValue2 = (scalarValue45 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue5), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue26;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    multiplyAddValue4 = (scalarValue19 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue19) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue19 * 12.9200000762939453125);
                    multiplyAddValue3 = (scalarValue20 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue20) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue20 * 12.9200000762939453125);
                    multiplyAddValue2 = (scalarValue21 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue21) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue21 * 12.9200000762939453125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    vec4 vectorValue = texture(sampler2D(txBuffer1Texture, txBuffer1Sampler), vec2((fragmentVectorConstants1.packedValues[129u].z * intermediateValue) + fragmentVectorConstants1.packedValues[129u].x, (fragmentVectorConstants1.packedValues[129u].w * intermediateValue1) + fragmentVectorConstants1.packedValues[129u].y));
                    float scalarValue4 = vectorValue.x;
                    if (!((intermediateValue11 & 8u) == 0u))
                    {
                        float scalarValue5 = vectorValue.y;
                        float scalarValue6 = vectorValue.z;
                        float scalarValue7 = vectorValue.w;
                        if (intermediateValue12 == 4294967295u)
                        {
                            dotProductValue = intermediateValue9;
                            intermediateValue33 = scalarValue4;
                            intermediateValue34 = scalarValue5;
                            intermediateValue36 = scalarValue6;
                            intermediateValue38 = scalarValue7;
                            break;
                        }
                        float scalarValue8 = spvNMax(scalarValue7, 9.9999997473787516355514526367188e-06);
                        float quotientValue = scalarValue4 / scalarValue8;
                        float quotientValue1 = scalarValue5 / scalarValue8;
                        float quotientValue2 = scalarValue6 / scalarValue8;
                        uint sumValue5 = intermediateValue12 + 4u;
                        dotProductValue = (dot(vec4(quotientValue, quotientValue1, quotientValue2, scalarValue8), vec4(fragmentVectorConstants1.packedValues[intermediateValue12 + 3u])) + fragmentVectorConstants1.packedValues[sumValue5].w) * intermediateValue9;
                        intermediateValue33 = dot(vec4(quotientValue, quotientValue1, quotientValue2, scalarValue8), vec4(fragmentVectorConstants1.packedValues[intermediateValue12])) + fragmentVectorConstants1.packedValues[sumValue5].x;
                        intermediateValue34 = dot(vec4(quotientValue, quotientValue1, quotientValue2, scalarValue8), vec4(fragmentVectorConstants1.packedValues[intermediateValue12 + 1u])) + fragmentVectorConstants1.packedValues[sumValue5].y;
                        intermediateValue36 = dot(vec4(quotientValue, quotientValue1, quotientValue2, scalarValue8), vec4(fragmentVectorConstants1.packedValues[intermediateValue12 + 2u])) + fragmentVectorConstants1.packedValues[sumValue5].z;
                        intermediateValue38 = 1.0;
                        break;
                    }
                    float productValue2 = ((intermediateValue7 * 0.715200006961822509765625) + (intermediateValue6 * 0.2125999927520751953125)) + (intermediateValue8 * 0.072200000286102294921875);
                    float intermediateValue42;
                    if ((intermediateValue11 & 1u) == 0u)
                    {
                        intermediateValue42 = productValue2;
                    }
                    else
                    {
                        float branchMergedValue3;
                        if (!(productValue2 <= 0.003130800090730190277099609375))
                        {
                            branchMergedValue3 = (exp2(log2(productValue2) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                        }
                        else
                        {
                            branchMergedValue3 = productValue2 * 12.9200000762939453125;
                        }
                        intermediateValue42 = branchMergedValue3;
                    }
                    float exponentialValue11 = exp2(log2(abs(scalarValue4)) * spvNMax(abs(1.4500000476837158203125 - intermediateValue42), 9.9999997473787516355514526367188e-05));
                    branchMergedValue21 = exponentialValue11 * intermediateValue7;
                    branchMergedValue22 = exponentialValue11 * intermediateValue6;
                    branchMergedValue23 = 1.0;
                    branchMergedValue24 = 1.0;
                    branchMergedValue25 = exponentialValue11 * intermediateValue9;
                    branchMergedValue26 = exponentialValue11 * intermediateValue8;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                    multiplyAddValue4 = scalarValue43;
                    multiplyAddValue3 = scalarValue44;
                    multiplyAddValue2 = scalarValue45;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    multiplyAddValue4 = scalarValue19;
                    multiplyAddValue3 = scalarValue20;
                    multiplyAddValue2 = scalarValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float branchMergedValue33;
                    float branchMergedValue34;
                    float branchMergedValue35;
                    float branchMergedValue36;
                    float branchMergedValue37;
                    float branchMergedValue38;
                    if (intermediateValue4 == 18u)
                    {
                        vec4 vectorValue1 = texture(sampler2D(txBuffer2Texture, txBuffer2Sampler), vec2((fragmentVectorConstants1.packedValues[130u].z * intermediateValue) + fragmentVectorConstants1.packedValues[130u].x, (fragmentVectorConstants1.packedValues[130u].w * intermediateValue1) + fragmentVectorConstants1.packedValues[130u].y));
                        float quotientValue3 = spvNClamp((intermediateValue2 * 0.996093690395355224609375) * (((0.501960813999176025390625 / intermediateValue2) + (-3.984375)) + (vectorValue1.x * 7.96875)), 0.0, 1.0);
                        float productValue12 = ((intermediateValue7 * 0.715200006961822509765625) + (intermediateValue6 * 0.2125999927520751953125)) + (intermediateValue8 * 0.072200000286102294921875);
                        float intermediateValue44;
                        if ((intermediateValue11 & 1u) == 0u)
                        {
                            intermediateValue44 = productValue12;
                        }
                        else
                        {
                            float branchMergedValue4;
                            if (!(productValue12 <= 0.003130800090730190277099609375))
                            {
                                branchMergedValue4 = (exp2(log2(productValue12) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                            }
                            else
                            {
                                branchMergedValue4 = productValue12 * 12.9200000762939453125;
                            }
                            intermediateValue44 = branchMergedValue4;
                        }
                        float exponentialValue12 = exp2(log2(abs((quotientValue3 * quotientValue3) * (3.0 - (quotientValue3 * 2.0)))) * spvNMax(abs(1.4500000476837158203125 - intermediateValue44), 9.9999997473787516355514526367188e-05));
                        branchMergedValue33 = exponentialValue12 * intermediateValue7;
                        branchMergedValue34 = exponentialValue12 * intermediateValue6;
                        branchMergedValue35 = 1.0;
                        branchMergedValue36 = 1.0;
                        branchMergedValue37 = exponentialValue12 * intermediateValue9;
                        branchMergedValue38 = exponentialValue12 * intermediateValue8;
                    }
                    else
                    {
                        float branchMergedValue39;
                        float branchMergedValue40;
                        float branchMergedValue41;
                        float branchMergedValue42;
                        float branchMergedValue43;
                        float branchMergedValue44;
                        if (intermediateValue4 == 22u)
                        {
                            vec4 vectorValue2 = texture(sampler2D(txBuffer2Texture, txBuffer2Sampler), vec2((fragmentVectorConstants1.packedValues[130u].z * intermediateValue) + fragmentVectorConstants1.packedValues[130u].x, (fragmentVectorConstants1.packedValues[130u].w * intermediateValue1) + fragmentVectorConstants1.packedValues[130u].y));
                            float sumValue6 = 0.5 - intermediateValue2;
                            float quotientValue4 = spvNClamp((vectorValue2.x - sumValue6) / ((intermediateValue2 + 0.5) - sumValue6), 0.0, 1.0);
                            float productValue13 = ((intermediateValue7 * 0.715200006961822509765625) + (intermediateValue6 * 0.2125999927520751953125)) + (intermediateValue8 * 0.072200000286102294921875);
                            float intermediateValue46;
                            if ((intermediateValue11 & 1u) == 0u)
                            {
                                intermediateValue46 = productValue13;
                            }
                            else
                            {
                                float branchMergedValue5;
                                if (!(productValue13 <= 0.003130800090730190277099609375))
                                {
                                    branchMergedValue5 = (exp2(log2(productValue13) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                }
                                else
                                {
                                    branchMergedValue5 = productValue13 * 12.9200000762939453125;
                                }
                                intermediateValue46 = branchMergedValue5;
                            }
                            float exponentialValue13 = exp2(log2(abs((quotientValue4 * quotientValue4) * (3.0 - (quotientValue4 * 2.0)))) * spvNMax(abs(1.4500000476837158203125 - intermediateValue46), 9.9999997473787516355514526367188e-05));
                            branchMergedValue39 = exponentialValue13 * intermediateValue7;
                            branchMergedValue40 = exponentialValue13 * intermediateValue6;
                            branchMergedValue41 = 1.0;
                            branchMergedValue42 = 1.0;
                            branchMergedValue43 = exponentialValue13 * intermediateValue9;
                            branchMergedValue44 = exponentialValue13 * intermediateValue8;
                        }
                        else
                        {
                            float branchMergedValue45;
                            float branchMergedValue46;
                            float branchMergedValue47;
                            float branchMergedValue48;
                            float branchMergedValue49;
                            float branchMergedValue50;
                            if (intermediateValue4 == 30u)
                            {
                                branchMergedValue45 = intermediateValue7;
                                branchMergedValue46 = intermediateValue6;
                                branchMergedValue47 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * intermediateValue) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * intermediateValue1) + fragmentVectorConstants1.packedValues[128u].y)).x;
                                branchMergedValue48 = 1.0;
                                branchMergedValue49 = intermediateValue9;
                                branchMergedValue50 = intermediateValue8;
                            }
                            else
                            {
                                float branchMergedValue51;
                                float branchMergedValue52;
                                float branchMergedValue53;
                                float branchMergedValue54;
                                float branchMergedValue55;
                                float branchMergedValue56;
                                if (intermediateValue4 == 34u)
                                {
                                    vec4 vectorValue3 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * ((fract(intermediateValue) * intermediateValue8) + intermediateValue6)) + fragmentVectorConstants1.packedValues[128u].x, (((fract(intermediateValue1) * intermediateValue9) + intermediateValue7) * fragmentVectorConstants1.packedValues[128u].w) + fragmentVectorConstants1.packedValues[128u].y));
                                    float scalarValue9 = vectorValue3.x;
                                    float scalarValue10 = vectorValue3.y;
                                    float scalarValue11 = vectorValue3.z;
                                    float scalarValue12 = vectorValue3.w;
                                    float intermediateValue16;
                                    float intermediateValue19;
                                    float intermediateValue22;
                                    if ((intermediateValue11 & 2u) == 0u)
                                    {
                                        float branchMergedValue11;
                                        float branchMergedValue17;
                                        float branchMergedValue18;
                                        if ((intermediateValue11 & 16u) == 0u)
                                        {
                                            branchMergedValue11 = scalarValue11;
                                            branchMergedValue17 = scalarValue10;
                                            branchMergedValue18 = scalarValue9;
                                        }
                                        else
                                        {
                                            float exponentialValue8;
                                            if (!(scalarValue9 <= 0.003130800090730190277099609375))
                                            {
                                                exponentialValue8 = (exp2(log2(scalarValue9) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                            }
                                            else
                                            {
                                                exponentialValue8 = scalarValue9 * 12.9200000762939453125;
                                            }
                                            float exponentialValue10;
                                            if (!(scalarValue10 <= 0.003130800090730190277099609375))
                                            {
                                                exponentialValue10 = (exp2(log2(scalarValue10) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                            }
                                            else
                                            {
                                                exponentialValue10 = scalarValue10 * 12.9200000762939453125;
                                            }
                                            float branchMergedValue28;
                                            float branchMergedValue31;
                                            float branchMergedValue32;
                                            if (!(scalarValue11 <= 0.003130800090730190277099609375))
                                            {
                                                branchMergedValue28 = (exp2(log2(scalarValue11) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                branchMergedValue31 = exponentialValue10;
                                                branchMergedValue32 = exponentialValue8;
                                            }
                                            else
                                            {
                                                branchMergedValue28 = scalarValue11 * 12.9200000762939453125;
                                                branchMergedValue31 = exponentialValue10;
                                                branchMergedValue32 = exponentialValue8;
                                            }
                                            branchMergedValue11 = branchMergedValue28;
                                            branchMergedValue17 = branchMergedValue31;
                                            branchMergedValue18 = branchMergedValue32;
                                        }
                                        intermediateValue16 = branchMergedValue18;
                                        intermediateValue19 = branchMergedValue17;
                                        intermediateValue22 = branchMergedValue11;
                                    }
                                    else
                                    {
                                        float exponentialValue7;
                                        if (!(scalarValue9 <= 0.040449999272823333740234375))
                                        {
                                            exponentialValue7 = exp2(log2((scalarValue9 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                        }
                                        else
                                        {
                                            exponentialValue7 = scalarValue9 * 0.077399380505084991455078125;
                                        }
                                        float exponentialValue9;
                                        if (!(scalarValue10 <= 0.040449999272823333740234375))
                                        {
                                            exponentialValue9 = exp2(log2((scalarValue10 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                        }
                                        else
                                        {
                                            exponentialValue9 = scalarValue10 * 0.077399380505084991455078125;
                                        }
                                        float branchMergedValue12;
                                        float branchMergedValue19;
                                        float branchMergedValue20;
                                        if (!(scalarValue11 <= 0.040449999272823333740234375))
                                        {
                                            branchMergedValue12 = exp2(log2((scalarValue11 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                            branchMergedValue19 = exponentialValue9;
                                            branchMergedValue20 = exponentialValue7;
                                        }
                                        else
                                        {
                                            branchMergedValue12 = scalarValue11 * 0.077399380505084991455078125;
                                            branchMergedValue19 = exponentialValue9;
                                            branchMergedValue20 = exponentialValue7;
                                        }
                                        intermediateValue16 = branchMergedValue20;
                                        intermediateValue19 = branchMergedValue19;
                                        intermediateValue22 = branchMergedValue12;
                                    }
                                    uint scalarValue13 = uint(int(intermediateValue5));
                                    bool comparisonValue1 = (scalarValue13 & 4u) != 0u;
                                    branchMergedValue51 = intermediateValue19;
                                    branchMergedValue52 = intermediateValue16;
                                    branchMergedValue53 = spvNClamp(intermediateValue2, 0.0, 1.0) * intermediateValue3;
                                    branchMergedValue54 = comparisonValue1 ? 0.0 : 1.0;
                                    branchMergedValue55 = ((scalarValue13 & 2u) != 0u) ? 1.0 : (comparisonValue1 ? spvNClamp(((intermediateValue19 * 0.715200006961822509765625) + (intermediateValue16 * 0.2125999927520751953125)) + (intermediateValue22 * 0.072200000286102294921875), 0.0, 1.0) : (((scalarValue13 & 1u) != 0u) ? (1.0 - scalarValue12) : scalarValue12));
                                    branchMergedValue56 = intermediateValue22;
                                }
                                else
                                {
                                    branchMergedValue51 = intermediateValue7;
                                    branchMergedValue52 = intermediateValue6;
                                    branchMergedValue53 = 1.0;
                                    branchMergedValue54 = 1.0;
                                    branchMergedValue55 = intermediateValue9;
                                    branchMergedValue56 = intermediateValue8;
                                }
                                branchMergedValue45 = branchMergedValue51;
                                branchMergedValue46 = branchMergedValue52;
                                branchMergedValue47 = branchMergedValue53;
                                branchMergedValue48 = branchMergedValue54;
                                branchMergedValue49 = branchMergedValue55;
                                branchMergedValue50 = branchMergedValue56;
                            }
                            branchMergedValue39 = branchMergedValue45;
                            branchMergedValue40 = branchMergedValue46;
                            branchMergedValue41 = branchMergedValue47;
                            branchMergedValue42 = branchMergedValue48;
                            branchMergedValue43 = branchMergedValue49;
                            branchMergedValue44 = branchMergedValue50;
                        }
                        branchMergedValue33 = branchMergedValue39;
                        branchMergedValue34 = branchMergedValue40;
                        branchMergedValue35 = branchMergedValue41;
                        branchMergedValue36 = branchMergedValue42;
                        branchMergedValue37 = branchMergedValue43;
                        branchMergedValue38 = branchMergedValue44;
                    }
                    branchMergedValue21 = branchMergedValue33;
                    branchMergedValue22 = branchMergedValue34;
                    branchMergedValue23 = branchMergedValue35;
                    branchMergedValue24 = branchMergedValue36;
                    branchMergedValue25 = branchMergedValue37;
                    branchMergedValue26 = branchMergedValue38;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
                exponentialValue = multiplyAddValue2;
                exponentialValue1 = multiplyAddValue3;
                exponentialValue2 = multiplyAddValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue = branchMergedValue21;
                branchMergedValue6 = branchMergedValue22;
                branchMergedValue7 = branchMergedValue23;
                branchMergedValue8 = branchMergedValue24;
                branchMergedValue9 = branchMergedValue25;
                branchMergedValue10 = branchMergedValue26;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue25 = 1.0 - scalarValue46;
            precise float sumValue26 = scalarValue46 - sumValue25;
            float scalarValue23 = rdDot3Precise2(vec3(exponentialValue2, exponentialValue1, exponentialValue), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            precise float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue4) + 16u) + 0u) >> 2u], sumValue26, sumValue25) - scalarValue23;
            uint bitwiseValue5 = (((16u * bitwiseValue4) + 16u) + 8u) >> 2u;
            precise float bitwiseValue6 = spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue4) + 16u) + 12u) >> 2u];
            intermediateValue28 = true;
            multiplyAddValue = fma(fragmentScalarConstants1.packedValues[bitwiseValue5], multiplyAddValue10, scalarValue23);
            intermediateValue25 = exponentialValue2;
            intermediateValue23 = exponentialValue1;
            intermediateValue21 = exponentialValue;
            intermediateValue19 = fragmentScalarConstants1.packedValues[bitwiseValue5];
            intermediateValue17 = bitwiseValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float scalarValue23 = rdDot3Precise2(vec3(exponentialValue2, exponentialValue1, exponentialValue), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            uint bitwiseValue3 = (((16u * scalarValue16) + 16u) + 8u) >> 2u;
            intermediateValue27 = true;
            multiplyAddValue = fma(fragmentScalarConstants1.packedValues[bitwiseValue3], fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue16) + 16u) + 0u) >> 2u], (scalarValue22 - 1.0) + scalarValue22, 1.0 - scalarValue22) - scalarValue23, scalarValue23);
            intermediateValue24 = exponentialValue2;
            intermediateValue22 = exponentialValue1;
            intermediateValue20 = exponentialValue;
            intermediateValue18 = fragmentScalarConstants1.packedValues[bitwiseValue3];
            bitwiseValue = spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * scalarValue16) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue13 = branchMergedValue8;
            productValue = branchMergedValue7;
            intermediateValue14 = branchMergedValue6;
            intermediateValue17 = branchMergedValue;
            intermediateValue20 = branchMergedValue10;
            intermediateValue23 = branchMergedValue9;
        }
        float intermediateValue24;
        float intermediateValue25;
        float intermediateValue26;
        if ((intermediateValue11 & 64u) == 0u)
        {
            intermediateValue24 = intermediateValue14;
            intermediateValue25 = intermediateValue17;
            intermediateValue26 = intermediateValue20;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float intermediateValue57;
            float intermediateValue58;
            float intermediateValue59;
            float intermediateValue60;
            float intermediateValue61;
            bool intermediateValue89;
            bool intermediateValue90;
            if (scalarValue15 == 17u)
            {
                bool conditionValue3 = (scalarValue40 & 8u) != 0u;
                float intermediateValue64;
                float intermediateValue66;
                float intermediateValue68;
                float intermediateValue70;
                float intermediateValue72;
                if (conditionValue3)
                {
                    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[129u].z, fragmentVectorConstants1.packedValues[129u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[129u].w, fragmentVectorConstants1.packedValues[129u].y)));
                    float scalarValue24 = sampledTextureValue2.x;
                    float scalarValue25 = sampledTextureValue2.y;
                    float scalarValue26 = sampledTextureValue2.z;
                    float scalarValue27 = sampledTextureValue2.w;
                    float intermediateValue65;
                    float intermediateValue67;
                    float intermediateValue69;
                    float intermediateValue71;
                    float intermediateValue73;
                    if (scalarValue41 != 4294967295u)
                    {
                        float scalarValue28 = spvNMax(scalarValue27, 9.9999997473787516355514526367188e-06);
                        precise float quotientValue10 = scalarValue24 / scalarValue28;
                        precise float quotientValue11 = scalarValue25 / scalarValue28;
                        precise float quotientValue12 = scalarValue26 / scalarValue28;
                        uint sumValue27 = scalarValue41 + 4u;
                        vec4 vectorValue5 = vec4(quotientValue10, quotientValue11, quotientValue12, scalarValue28);
                        precise float sumValue28 = rdDot4Precise(vectorValue5, fragmentVectorConstants1.packedValues[scalarValue41]) + fragmentVectorConstants1.packedValues[sumValue27].x;
                        precise float sumValue29 = rdDot4Precise(vectorValue5, fragmentVectorConstants1.packedValues[scalarValue41 + 1u]) + fragmentVectorConstants1.packedValues[sumValue27].y;
                        precise float sumValue30 = rdDot4Precise(vectorValue5, fragmentVectorConstants1.packedValues[scalarValue41 + 2u]) + fragmentVectorConstants1.packedValues[sumValue27].z;
                        precise float sumValue31 = rdDot4Precise(vectorValue5, fragmentVectorConstants1.packedValues[scalarValue41 + 3u]) + fragmentVectorConstants1.packedValues[sumValue27].w;
                        precise float bitwiseValue7 = sumValue31 * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue4) + 16u) + 12u) >> 2u];
                        intermediateValue65 = 1.0;
                        intermediateValue67 = sumValue28;
                        intermediateValue69 = sumValue29;
                        intermediateValue71 = sumValue30;
                        intermediateValue73 = bitwiseValue7;
                    }
                    else
                    {
                        intermediateValue65 = scalarValue27;
                        intermediateValue67 = scalarValue24;
                        intermediateValue69 = scalarValue25;
                        intermediateValue71 = scalarValue26;
                        intermediateValue73 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue4) + 16u) + 12u) >> 2u];
                    }
                    intermediateValue64 = intermediateValue65;
                    intermediateValue66 = intermediateValue67;
                    intermediateValue68 = intermediateValue69;
                    intermediateValue70 = intermediateValue71;
                    intermediateValue72 = intermediateValue73;
                }
                else
                {
                    float scalarValue47 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[sumValue18].xyz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                    precise float productValue27 = scalarValue47 * 12.9200000762939453125;
                    precise float nonlinearValue6 = log2(scalarValue47) * 0.4166666567325592041015625;
                    precise float multiplyAddValue14 = 1.4500000476837158203125 - (((scalarValue40 & 1u) != 0u) ? ((scalarValue47 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue6), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue27) : scalarValue47);
                    precise float sampledTextureValue8 = spvNMax(abs(multiplyAddValue14), 9.9999997473787516355514526367188e-05) * log2(abs(texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[129u].z, fragmentVectorConstants1.packedValues[129u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[129u].w, fragmentVectorConstants1.packedValues[129u].y))).x));
                    float exponentialValue14 = exp2(sampledTextureValue8);
                    precise float productValue28 = exponentialValue14 * fragmentVectorConstants1.packedValues[sumValue18].x;
                    precise float productValue29 = exponentialValue14 * fragmentVectorConstants1.packedValues[sumValue18].y;
                    precise float productValue30 = exponentialValue14 * fragmentVectorConstants1.packedValues[sumValue18].z;
                    precise float productValue31 = exponentialValue14 * fragmentVectorConstants1.packedValues[sumValue18].w;
                    intermediateValue64 = productValue31;
                    intermediateValue66 = productValue28;
                    intermediateValue68 = productValue29;
                    intermediateValue70 = productValue30;
                    intermediateValue72 = 1.0;
                }
                intermediateValue89 = conditionValue3;
                intermediateValue57 = intermediateValue64;
                intermediateValue58 = intermediateValue66;
                intermediateValue59 = intermediateValue68;
                intermediateValue60 = intermediateValue70;
                intermediateValue90 = true;
                intermediateValue61 = intermediateValue72;
            }
            else
            {
                float intermediateValue74;
                float intermediateValue76;
                float intermediateValue78;
                float intermediateValue80;
                bool intermediateValue82;
                float intermediateValue84;
                if (scalarValue15 == 18u)
                {
                    precise float scalarValue48 = (-0.501960813999176025390625) / varyingTexCoord1.z;
                    precise float quotientValue13 = 0.501960813999176025390625 / varyingTexCoord1.z;
                    precise float sumValue32 = quotientValue13 - scalarValue48;
                    precise float sampledTextureValue9 = fma(texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[130u].z, fragmentVectorConstants1.packedValues[130u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[130u].w, fragmentVectorConstants1.packedValues[130u].y))).x, 7.96875, -3.984375) - scalarValue48;
                    precise float quotientValue14 = 1.0 / sumValue32;
                    precise float productValue32 = sampledTextureValue9 * quotientValue14;
                    float scalarValue49 = spvNClamp(productValue32, 0.0, 1.0);
                    precise float productValue33 = scalarValue49 * scalarValue49;
                    precise float multiplyAddValue15 = productValue33 * fma(scalarValue49, -2.0, 3.0);
                    float scalarValue50 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[sumValue18].xyz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                    precise float productValue34 = scalarValue50 * 12.9200000762939453125;
                    precise float nonlinearValue7 = log2(scalarValue50) * 0.4166666567325592041015625;
                    precise float multiplyAddValue16 = 1.4500000476837158203125 - (((scalarValue40 & 1u) != 0u) ? ((scalarValue50 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue7), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue34) : scalarValue50);
                    precise float nonlinearValue8 = log2(multiplyAddValue15) * spvNMax(abs(multiplyAddValue16), 9.9999997473787516355514526367188e-05);
                    float exponentialValue15 = exp2(nonlinearValue8);
                    precise float productValue35 = exponentialValue15 * fragmentVectorConstants1.packedValues[sumValue18].x;
                    precise float productValue36 = exponentialValue15 * fragmentVectorConstants1.packedValues[sumValue18].y;
                    precise float productValue37 = exponentialValue15 * fragmentVectorConstants1.packedValues[sumValue18].z;
                    precise float productValue38 = exponentialValue15 * fragmentVectorConstants1.packedValues[sumValue18].w;
                    intermediateValue74 = productValue38;
                    intermediateValue76 = productValue35;
                    intermediateValue78 = productValue36;
                    intermediateValue80 = productValue37;
                    intermediateValue82 = true;
                    intermediateValue84 = 1.0;
                }
                else
                {
                    float intermediateValue75;
                    float intermediateValue77;
                    float intermediateValue79;
                    float intermediateValue81;
                    bool intermediateValue83;
                    float intermediateValue85;
                    if (scalarValue15 == 22u)
                    {
                        precise float scalarValue51 = 0.5 - varyingTexCoord1.z;
                        precise float sumValue33 = varyingTexCoord1.z + 0.5;
                        precise float sumValue34 = sumValue33 - scalarValue51;
                        precise float sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[130u].z, fragmentVectorConstants1.packedValues[130u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[130u].w, fragmentVectorConstants1.packedValues[130u].y))).x - scalarValue51;
                        precise float quotientValue15 = 1.0 / sumValue34;
                        precise float productValue39 = sampledTextureValue10 * quotientValue15;
                        float scalarValue52 = spvNClamp(productValue39, 0.0, 1.0);
                        precise float productValue40 = scalarValue52 * scalarValue52;
                        precise float multiplyAddValue17 = productValue40 * fma(scalarValue52, -2.0, 3.0);
                        float scalarValue53 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[sumValue18].xyz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                        precise float productValue41 = scalarValue53 * 12.9200000762939453125;
                        precise float nonlinearValue9 = log2(scalarValue53) * 0.4166666567325592041015625;
                        precise float multiplyAddValue18 = 1.4500000476837158203125 - (((scalarValue40 & 1u) != 0u) ? ((scalarValue53 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue9), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue41) : scalarValue53);
                        precise float nonlinearValue10 = log2(multiplyAddValue17) * spvNMax(abs(multiplyAddValue18), 9.9999997473787516355514526367188e-05);
                        float exponentialValue16 = exp2(nonlinearValue10);
                        precise float productValue42 = exponentialValue16 * fragmentVectorConstants1.packedValues[sumValue18].x;
                        precise float productValue43 = exponentialValue16 * fragmentVectorConstants1.packedValues[sumValue18].y;
                        precise float productValue44 = exponentialValue16 * fragmentVectorConstants1.packedValues[sumValue18].z;
                        precise float productValue45 = exponentialValue16 * fragmentVectorConstants1.packedValues[sumValue18].w;
                        intermediateValue75 = productValue45;
                        intermediateValue77 = productValue42;
                        intermediateValue79 = productValue43;
                        intermediateValue81 = productValue44;
                        intermediateValue83 = true;
                        intermediateValue85 = 1.0;
                    }
                    else
                    {
                        float intermediateValue91;
                        float intermediateValue92;
                        float intermediateValue93;
                        float intermediateValue94;
                        bool intermediateValue95;
                        float sampledTextureValue5;
                        if (scalarValue15 == 30u)
                        {
                            intermediateValue91 = fragmentVectorConstants1.packedValues[sumValue18].w;
                            intermediateValue92 = fragmentVectorConstants1.packedValues[sumValue18].x;
                            intermediateValue93 = fragmentVectorConstants1.packedValues[sumValue18].y;
                            intermediateValue94 = fragmentVectorConstants1.packedValues[sumValue18].z;
                            intermediateValue95 = true;
                            sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).x;
                        }
                        else
                        {
                            float comparisonValue4;
                            float intermediateValue96;
                            float intermediateValue97;
                            float intermediateValue98;
                            float intermediateValue99;
                            bool intermediateValue105;
                            if (scalarValue15 == 34u)
                            {
                                vec4 vectorValue6 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[sumValue18].z, fract(varyingTexCoord1.x), fragmentVectorConstants1.packedValues[sumValue18].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[sumValue18].w, fract(varyingTexCoord1.y), fragmentVectorConstants1.packedValues[sumValue18].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                float scalarValue54 = vectorValue6.x;
                                float scalarValue55 = vectorValue6.y;
                                float scalarValue56 = vectorValue6.z;
                                float scalarValue57 = vectorValue6.w;
                                float exponentialValue6;
                                float exponentialValue7;
                                float exponentialValue8;
                                if ((scalarValue40 & 2u) != 0u)
                                {
                                    precise float productValue46 = scalarValue54 * 0.077399380505084991455078125;
                                    precise float productValue47 = scalarValue55 * 0.077399380505084991455078125;
                                    precise float productValue48 = scalarValue56 * 0.077399380505084991455078125;
                                    precise float sumValue35 = scalarValue54 + 0.054999999701976776123046875;
                                    precise float sumValue36 = scalarValue55 + 0.054999999701976776123046875;
                                    precise float sumValue37 = scalarValue56 + 0.054999999701976776123046875;
                                    precise float productValue49 = sumValue35 * 0.947867333889007568359375;
                                    precise float productValue50 = sumValue36 * 0.947867333889007568359375;
                                    precise float productValue51 = sumValue37 * 0.947867333889007568359375;
                                    precise float nonlinearValue11 = log2(productValue49) * 2.400000095367431640625;
                                    precise float nonlinearValue12 = log2(productValue50) * 2.400000095367431640625;
                                    precise float nonlinearValue13 = log2(productValue51) * 2.400000095367431640625;
                                    exponentialValue8 = (scalarValue56 > 0.040449999272823333740234375) ? exp2(nonlinearValue13) : productValue48;
                                    exponentialValue7 = (scalarValue55 > 0.040449999272823333740234375) ? exp2(nonlinearValue12) : productValue47;
                                    exponentialValue6 = (scalarValue54 > 0.040449999272823333740234375) ? exp2(nonlinearValue11) : productValue46;
                                }
                                else
                                {
                                    float multiplyAddValue11;
                                    float multiplyAddValue12;
                                    float multiplyAddValue13;
                                    if ((scalarValue40 & 16u) != 0u)
                                    {
                                        precise float productValue52 = scalarValue54 * 12.9200000762939453125;
                                        precise float productValue53 = scalarValue55 * 12.9200000762939453125;
                                        precise float productValue54 = scalarValue56 * 12.9200000762939453125;
                                        precise float nonlinearValue14 = log2(scalarValue54) * 0.4166666567325592041015625;
                                        precise float nonlinearValue15 = log2(scalarValue55) * 0.4166666567325592041015625;
                                        precise float nonlinearValue16 = log2(scalarValue56) * 0.4166666567325592041015625;
                                        multiplyAddValue13 = (scalarValue54 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue14), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue52;
                                        multiplyAddValue12 = (scalarValue55 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue15), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue53;
                                        multiplyAddValue11 = (scalarValue56 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue16), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue54;
                                    }
                                    else
                                    {
                                        multiplyAddValue13 = scalarValue54;
                                        multiplyAddValue12 = scalarValue55;
                                        multiplyAddValue11 = scalarValue56;
                                    }
                                    exponentialValue8 = multiplyAddValue11;
                                    exponentialValue7 = multiplyAddValue12;
                                    exponentialValue6 = multiplyAddValue13;
                                }
                                uint productValue55 = uint(int(fragmentScalarConstants1.packedValues[(bitwiseValue4 * 4u) + 1u]));
                                precise float sumValue38 = 1.0 - scalarValue57;
                                bool comparisonValue8 = (productValue55 & 4u) != 0u;
                                precise float productValue56 = spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * varyingTexCoord1.w;
                                comparisonValue4 = ((productValue55 & 2u) != 0u) ? 1.0 : (comparisonValue8 ? spvNClamp(rdDot3Precise2(vec3(exponentialValue6, exponentialValue7, exponentialValue8), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0) : (((productValue55 & 1u) != 0u) ? sumValue38 : scalarValue57));
                                intermediateValue96 = exponentialValue6;
                                intermediateValue97 = exponentialValue7;
                                intermediateValue98 = exponentialValue8;
                                intermediateValue105 = comparisonValue8;
                                intermediateValue99 = productValue56;
                            }
                            else
                            {
                                comparisonValue4 = fragmentVectorConstants1.packedValues[sumValue18].w;
                                intermediateValue96 = fragmentVectorConstants1.packedValues[sumValue18].x;
                                intermediateValue97 = fragmentVectorConstants1.packedValues[sumValue18].y;
                                intermediateValue98 = fragmentVectorConstants1.packedValues[sumValue18].z;
                                intermediateValue105 = false;
                                intermediateValue99 = 1.0;
                            }
                            intermediateValue91 = comparisonValue4;
                            intermediateValue92 = intermediateValue96;
                            intermediateValue93 = intermediateValue97;
                            intermediateValue94 = intermediateValue98;
                            intermediateValue95 = !intermediateValue105;
                            sampledTextureValue5 = intermediateValue99;
                        }
                        intermediateValue75 = intermediateValue91;
                        intermediateValue77 = intermediateValue92;
                        intermediateValue79 = intermediateValue93;
                        intermediateValue81 = intermediateValue94;
                        intermediateValue83 = intermediateValue95;
                        intermediateValue85 = sampledTextureValue5;
                    }
                    intermediateValue74 = intermediateValue75;
                    intermediateValue76 = intermediateValue77;
                    intermediateValue78 = intermediateValue79;
                    intermediateValue80 = intermediateValue81;
                    intermediateValue82 = intermediateValue83;
                    intermediateValue84 = intermediateValue85;
                }
                intermediateValue89 = false;
                intermediateValue57 = intermediateValue74;
                intermediateValue58 = intermediateValue76;
                intermediateValue59 = intermediateValue78;
                intermediateValue60 = intermediateValue80;
                intermediateValue90 = intermediateValue82;
                intermediateValue61 = intermediateValue84;
            }
            intermediateValue28 = !intermediateValue89;
            multiplyAddValue = intermediateValue57;
            intermediateValue25 = intermediateValue58;
            intermediateValue23 = intermediateValue59;
            intermediateValue21 = intermediateValue60;
            intermediateValue19 = float(intermediateValue90);
            intermediateValue17 = intermediateValue61;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float intermediateValue53;
            float intermediateValue54;
            float intermediateValue55;
            float intermediateValue56;
            float intermediateValue57;
            bool intermediateValue71;
            bool intermediateValue72;
            if (scalarValue15 == 17u)
            {
                bool conditionValue1 = (scalarValue17 & 8u) != 0u;
                float intermediateValue59;
                float intermediateValue61;
                float intermediateValue62;
                float intermediateValue63;
                float intermediateValue64;
                if (conditionValue1)
                {
                    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[129u].z, fragmentVectorConstants1.packedValues[129u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[129u].w, fragmentVectorConstants1.packedValues[129u].y)));
                    float scalarValue24 = sampledTextureValue2.x;
                    float scalarValue25 = sampledTextureValue2.y;
                    float scalarValue26 = sampledTextureValue2.z;
                    float scalarValue27 = sampledTextureValue2.w;
                    float intermediateValue60;
                    float sumValue7;
                    float sumValue8;
                    float sumValue9;
                    float bitwiseValue2;
                    if (scalarValue18 != 4294967295u)
                    {
                        float scalarValue28 = spvNMax(scalarValue27, 9.9999997473787516355514526367188e-06);
                        uint sumValue13 = scalarValue18 + 4u;
                        vec4 quotientValue8 = vec4(scalarValue24 / scalarValue28, scalarValue25 / scalarValue28, scalarValue26 / scalarValue28, scalarValue28);
                        intermediateValue60 = 1.0;
                        sumValue7 = rdDot4Precise(quotientValue8, fragmentVectorConstants1.packedValues[scalarValue18]) + fragmentVectorConstants1.packedValues[sumValue13].x;
                        sumValue8 = rdDot4Precise(quotientValue8, fragmentVectorConstants1.packedValues[scalarValue18 + 1u]) + fragmentVectorConstants1.packedValues[sumValue13].y;
                        sumValue9 = rdDot4Precise(quotientValue8, fragmentVectorConstants1.packedValues[scalarValue18 + 2u]) + fragmentVectorConstants1.packedValues[sumValue13].z;
                        bitwiseValue2 = (rdDot4Precise(quotientValue8, fragmentVectorConstants1.packedValues[scalarValue18 + 3u]) + fragmentVectorConstants1.packedValues[sumValue13].w) * fragmentScalarConstants1.packedValues[(((16u * scalarValue16) + 16u) + 12u) >> 2u];
                    }
                    else
                    {
                        intermediateValue60 = scalarValue27;
                        sumValue7 = scalarValue24;
                        sumValue8 = scalarValue25;
                        sumValue9 = scalarValue26;
                        bitwiseValue2 = fragmentScalarConstants1.packedValues[(((16u * scalarValue16) + 16u) + 12u) >> 2u];
                    }
                    intermediateValue59 = intermediateValue60;
                    intermediateValue61 = sumValue7;
                    intermediateValue62 = sumValue8;
                    intermediateValue63 = sumValue9;
                    intermediateValue64 = bitwiseValue2;
                }
                else
                {
                    float scalarValue29 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[sumValue11].xyz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                    float sampledTextureValue3 = exp2(log2(abs(texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[129u].z, fragmentVectorConstants1.packedValues[129u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[129u].w, fragmentVectorConstants1.packedValues[129u].y))).x)) * spvNMax(abs(1.4500000476837158203125 - (((scalarValue17 & 1u) != 0u) ? ((scalarValue29 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue29) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue29 * 12.9200000762939453125)) : scalarValue29)), 9.9999997473787516355514526367188e-05));
                    intermediateValue59 = sampledTextureValue3 * fragmentVectorConstants1.packedValues[sumValue11].w;
                    intermediateValue61 = sampledTextureValue3 * fragmentVectorConstants1.packedValues[sumValue11].x;
                    intermediateValue62 = sampledTextureValue3 * fragmentVectorConstants1.packedValues[sumValue11].y;
                    intermediateValue63 = sampledTextureValue3 * fragmentVectorConstants1.packedValues[sumValue11].z;
                    intermediateValue64 = 1.0;
                }
                intermediateValue71 = conditionValue1;
                intermediateValue53 = intermediateValue59;
                intermediateValue54 = intermediateValue61;
                intermediateValue55 = intermediateValue62;
                intermediateValue56 = intermediateValue63;
                intermediateValue72 = true;
                intermediateValue57 = intermediateValue64;
            }
            else
            {
                float productValue3;
                float productValue5;
                float productValue7;
                float productValue9;
                bool intermediateValue65;
                float intermediateValue67;
                if (scalarValue15 == 18u)
                {
                    float scalarValue30 = (-0.501960813999176025390625) / varyingTexCoord1.z;
                    float sampledTextureValue4 = spvNClamp((fma(texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[130u].z, fragmentVectorConstants1.packedValues[130u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[130u].w, fragmentVectorConstants1.packedValues[130u].y))).x, 7.96875, -3.984375) - scalarValue30) * (1.0 / ((0.501960813999176025390625 / varyingTexCoord1.z) - scalarValue30)), 0.0, 1.0);
                    float scalarValue31 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[sumValue11].xyz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                    float multiplyAddValue5 = exp2(log2((sampledTextureValue4 * sampledTextureValue4) * fma(sampledTextureValue4, -2.0, 3.0)) * spvNMax(abs(1.4500000476837158203125 - (((scalarValue17 & 1u) != 0u) ? ((scalarValue31 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue31) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue31 * 12.9200000762939453125)) : scalarValue31)), 9.9999997473787516355514526367188e-05));
                    productValue3 = multiplyAddValue5 * fragmentVectorConstants1.packedValues[sumValue11].w;
                    productValue5 = multiplyAddValue5 * fragmentVectorConstants1.packedValues[sumValue11].x;
                    productValue7 = multiplyAddValue5 * fragmentVectorConstants1.packedValues[sumValue11].y;
                    productValue9 = multiplyAddValue5 * fragmentVectorConstants1.packedValues[sumValue11].z;
                    intermediateValue65 = true;
                    intermediateValue67 = 1.0;
                }
                else
                {
                    float productValue4;
                    float productValue6;
                    float productValue8;
                    float productValue10;
                    bool intermediateValue66;
                    float intermediateValue68;
                    if (scalarValue15 == 22u)
                    {
                        float scalarValue32 = varyingTexCoord1.z - 0.5;
                        float sampledTextureValue6 = spvNClamp((texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[130u].z, fragmentVectorConstants1.packedValues[130u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[130u].w, fragmentVectorConstants1.packedValues[130u].y))).x + scalarValue32) * (1.0 / (scalarValue32 + (varyingTexCoord1.z + 0.5))), 0.0, 1.0);
                        float scalarValue33 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[sumValue11].xyz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                        float multiplyAddValue6 = exp2(log2((sampledTextureValue6 * sampledTextureValue6) * fma(sampledTextureValue6, -2.0, 3.0)) * spvNMax(abs(1.4500000476837158203125 - (((scalarValue17 & 1u) != 0u) ? ((scalarValue33 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue33) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue33 * 12.9200000762939453125)) : scalarValue33)), 9.9999997473787516355514526367188e-05));
                        productValue4 = multiplyAddValue6 * fragmentVectorConstants1.packedValues[sumValue11].w;
                        productValue6 = multiplyAddValue6 * fragmentVectorConstants1.packedValues[sumValue11].x;
                        productValue8 = multiplyAddValue6 * fragmentVectorConstants1.packedValues[sumValue11].y;
                        productValue10 = multiplyAddValue6 * fragmentVectorConstants1.packedValues[sumValue11].z;
                        intermediateValue66 = true;
                        intermediateValue68 = 1.0;
                    }
                    else
                    {
                        float intermediateValue73;
                        float intermediateValue74;
                        float intermediateValue75;
                        float intermediateValue76;
                        bool intermediateValue77;
                        float sampledTextureValue5;
                        if (scalarValue15 == 30u)
                        {
                            intermediateValue73 = fragmentVectorConstants1.packedValues[sumValue11].w;
                            intermediateValue74 = fragmentVectorConstants1.packedValues[sumValue11].x;
                            intermediateValue75 = fragmentVectorConstants1.packedValues[sumValue11].y;
                            intermediateValue76 = fragmentVectorConstants1.packedValues[sumValue11].z;
                            intermediateValue77 = true;
                            sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).x;
                        }
                        else
                        {
                            float comparisonValue4;
                            float intermediateValue78;
                            float intermediateValue79;
                            float intermediateValue80;
                            float productValue11;
                            bool intermediateValue86;
                            if (scalarValue15 == 34u)
                            {
                                vec4 vectorValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[sumValue11].z, fract(varyingTexCoord1.x), fragmentVectorConstants1.packedValues[sumValue11].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[sumValue11].w, fract(varyingTexCoord1.y), fragmentVectorConstants1.packedValues[sumValue11].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                float scalarValue34 = vectorValue4.x;
                                float scalarValue35 = vectorValue4.y;
                                float scalarValue36 = vectorValue4.z;
                                float scalarValue37 = vectorValue4.w;
                                float exponentialValue3;
                                float exponentialValue4;
                                float exponentialValue5;
                                if ((scalarValue17 & 2u) != 0u)
                                {
                                    exponentialValue5 = (scalarValue36 > 0.040449999272823333740234375) ? exp2(log2((scalarValue36 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue36 * 0.077399380505084991455078125);
                                    exponentialValue4 = (scalarValue35 > 0.040449999272823333740234375) ? exp2(log2((scalarValue35 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue35 * 0.077399380505084991455078125);
                                    exponentialValue3 = (scalarValue34 > 0.040449999272823333740234375) ? exp2(log2((scalarValue34 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue34 * 0.077399380505084991455078125);
                                }
                                else
                                {
                                    float multiplyAddValue7;
                                    float multiplyAddValue8;
                                    float multiplyAddValue9;
                                    if ((scalarValue17 & 16u) != 0u)
                                    {
                                        multiplyAddValue9 = (scalarValue34 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue34) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue34 * 12.9200000762939453125);
                                        multiplyAddValue8 = (scalarValue35 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue35) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue35 * 12.9200000762939453125);
                                        multiplyAddValue7 = (scalarValue36 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue36) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue36 * 12.9200000762939453125);
                                    }
                                    else
                                    {
                                        multiplyAddValue9 = scalarValue34;
                                        multiplyAddValue8 = scalarValue35;
                                        multiplyAddValue7 = scalarValue36;
                                    }
                                    exponentialValue5 = multiplyAddValue7;
                                    exponentialValue4 = multiplyAddValue8;
                                    exponentialValue3 = multiplyAddValue9;
                                }
                                uint productValue16 = uint(int(fragmentScalarConstants1.packedValues[(scalarValue16 * 4u) + 1u]));
                                bool comparisonValue2 = (productValue16 & 4u) != 0u;
                                comparisonValue4 = ((productValue16 & 2u) != 0u) ? 1.0 : (comparisonValue2 ? spvNClamp(rdDot3Precise2(vec3(exponentialValue3, exponentialValue4, exponentialValue5), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0) : (((productValue16 & 1u) != 0u) ? (1.0 - scalarValue37) : scalarValue37));
                                intermediateValue78 = exponentialValue3;
                                intermediateValue79 = exponentialValue4;
                                intermediateValue80 = exponentialValue5;
                                intermediateValue86 = comparisonValue2;
                                productValue11 = spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * varyingTexCoord1.w;
                            }
                            else
                            {
                                comparisonValue4 = fragmentVectorConstants1.packedValues[sumValue11].w;
                                intermediateValue78 = fragmentVectorConstants1.packedValues[sumValue11].x;
                                intermediateValue79 = fragmentVectorConstants1.packedValues[sumValue11].y;
                                intermediateValue80 = fragmentVectorConstants1.packedValues[sumValue11].z;
                                intermediateValue86 = false;
                                productValue11 = 1.0;
                            }
                            intermediateValue73 = comparisonValue4;
                            intermediateValue74 = intermediateValue78;
                            intermediateValue75 = intermediateValue79;
                            intermediateValue76 = intermediateValue80;
                            intermediateValue77 = !intermediateValue86;
                            sampledTextureValue5 = productValue11;
                        }
                        productValue4 = intermediateValue73;
                        productValue6 = intermediateValue74;
                        productValue8 = intermediateValue75;
                        productValue10 = intermediateValue76;
                        intermediateValue66 = intermediateValue77;
                        intermediateValue68 = sampledTextureValue5;
                    }
                    productValue3 = productValue4;
                    productValue5 = productValue6;
                    productValue7 = productValue8;
                    productValue9 = productValue10;
                    intermediateValue65 = intermediateValue66;
                    intermediateValue67 = intermediateValue68;
                }
                intermediateValue71 = false;
                intermediateValue53 = productValue3;
                intermediateValue54 = productValue5;
                intermediateValue55 = productValue7;
                intermediateValue56 = productValue9;
                intermediateValue72 = intermediateValue65;
                intermediateValue57 = intermediateValue67;
            }
            intermediateValue27 = !intermediateValue71;
            multiplyAddValue = intermediateValue53;
            intermediateValue24 = intermediateValue54;
            intermediateValue22 = intermediateValue55;
            intermediateValue20 = intermediateValue56;
            intermediateValue18 = float(intermediateValue72);
            bitwiseValue = intermediateValue57;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue24 = intermediateValue23 * intermediateValue14;
            intermediateValue25 = intermediateValue23 * intermediateValue17;
            intermediateValue26 = intermediateValue23 * intermediateValue20;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue16 = intermediateValue17;
        intermediateValue18 = intermediateValue19;
        intermediateValue20 = intermediateValue21;
        intermediateValue22 = intermediateValue23;
        intermediateValue24 = intermediateValue25;
        intermediateValue26 = multiplyAddValue;
        intermediateValue27 = intermediateValue28;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue16 = bitwiseValue;
        intermediateValue17 = intermediateValue18;
        intermediateValue19 = intermediateValue20;
        intermediateValue21 = intermediateValue22;
        intermediateValue23 = intermediateValue24;
        intermediateValue25 = multiplyAddValue;
        intermediateValue26 = intermediateValue27;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        if (intermediateValue12 == 4294967295u)
        {
            dotProductValue = productValue;
            intermediateValue33 = intermediateValue24;
            intermediateValue34 = intermediateValue25;
            intermediateValue36 = intermediateValue26;
            intermediateValue38 = intermediateValue23;
            break;
        }
        float scalarValue14 = spvNMax(intermediateValue23, 9.9999997473787516355514526367188e-06);
        float quotientValue5 = intermediateValue24 / scalarValue14;
        float quotientValue6 = intermediateValue25 / scalarValue14;
        float quotientValue7 = intermediateValue26 / scalarValue14;
        uint sumValue10 = intermediateValue12 + 4u;
        float dotProductValue1 = dot(vec4(quotientValue5, quotientValue6, quotientValue7, scalarValue14), vec4(fragmentVectorConstants1.packedValues[intermediateValue12])) + fragmentVectorConstants1.packedValues[sumValue10].x;
        float dotProductValue2 = dot(vec4(quotientValue5, quotientValue6, quotientValue7, scalarValue14), vec4(fragmentVectorConstants1.packedValues[intermediateValue12 + 1u])) + fragmentVectorConstants1.packedValues[sumValue10].y;
        float dotProductValue3 = dot(vec4(quotientValue5, quotientValue6, quotientValue7, scalarValue14), vec4(fragmentVectorConstants1.packedValues[intermediateValue12 + 2u])) + fragmentVectorConstants1.packedValues[sumValue10].z;
        float productValue14 = spvNClamp(((dotProductValue2 * 0.715200006961822509765625) + (dotProductValue1 * 0.2125999927520751953125)) + (dotProductValue3 * 0.072200000286102294921875), 0.0, 1.0);
        dotProductValue = ((((dot(vec4(quotientValue5, quotientValue6, quotientValue7, scalarValue14), vec4(fragmentVectorConstants1.packedValues[intermediateValue12 + 3u])) + fragmentVectorConstants1.packedValues[sumValue10].w) - productValue14) * intermediateValue13) + productValue14) * productValue;
        intermediateValue33 = dotProductValue1;
        intermediateValue34 = dotProductValue2;
        intermediateValue36 = dotProductValue3;
        intermediateValue38 = 1.0;
        break;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    float intermediateValue34;
    float intermediateValue36;
    float intermediateValue38;
    float intermediateValue40;
    float intermediateValue42;
    if (intermediateValue27)
    {
        precise float productValue57 = intermediateValue26 * intermediateValue24;
        precise float productValue58 = intermediateValue26 * intermediateValue22;
        precise float productValue59 = intermediateValue26 * intermediateValue20;
        bool comparisonValue9 = (scalarValue40 & 64u) != 0u;
        float comparisonValue10 = comparisonValue9 ? productValue57 : intermediateValue24;
        float comparisonValue11 = comparisonValue9 ? productValue58 : intermediateValue22;
        float comparisonValue12 = comparisonValue9 ? productValue59 : intermediateValue20;
        float intermediateValue35;
        float intermediateValue37;
        float intermediateValue39;
        float intermediateValue41;
        float intermediateValue43;
        if (scalarValue41 != 4294967295u)
        {
            float scalarValue58 = spvNMax(intermediateValue26, 9.9999997473787516355514526367188e-06);
            precise float quotientValue16 = comparisonValue10 / scalarValue58;
            precise float quotientValue17 = comparisonValue11 / scalarValue58;
            precise float quotientValue18 = comparisonValue12 / scalarValue58;
            uint sumValue39 = scalarValue41 + 4u;
            vec4 vectorValue7 = vec4(quotientValue16, quotientValue17, quotientValue18, scalarValue58);
            precise float sumValue40 = rdDot4Precise(vectorValue7, fragmentVectorConstants1.packedValues[scalarValue41]) + fragmentVectorConstants1.packedValues[sumValue39].x;
            precise float sumValue41 = rdDot4Precise(vectorValue7, fragmentVectorConstants1.packedValues[scalarValue41 + 1u]) + fragmentVectorConstants1.packedValues[sumValue39].y;
            precise float sumValue42 = rdDot4Precise(vectorValue7, fragmentVectorConstants1.packedValues[scalarValue41 + 2u]) + fragmentVectorConstants1.packedValues[sumValue39].z;
            precise float sumValue43 = rdDot4Precise(vectorValue7, fragmentVectorConstants1.packedValues[scalarValue41 + 3u]) + fragmentVectorConstants1.packedValues[sumValue39].w;
            float scalarValue59 = spvNClamp(rdDot3Precise2(vec3(sumValue40, sumValue41, sumValue42), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
            precise float sumValue44 = sumValue43 - scalarValue59;
            precise float multiplyAddValue19 = fma(intermediateValue18, sumValue44, scalarValue59) * intermediateValue16;
            intermediateValue43 = multiplyAddValue19;
            intermediateValue41 = sumValue40;
            intermediateValue39 = sumValue41;
            intermediateValue37 = sumValue42;
            intermediateValue35 = 1.0;
        }
        else
        {
            intermediateValue43 = intermediateValue16;
            intermediateValue41 = comparisonValue10;
            intermediateValue39 = comparisonValue11;
            intermediateValue37 = comparisonValue12;
            intermediateValue35 = intermediateValue26;
        }
        intermediateValue34 = intermediateValue35;
        intermediateValue36 = intermediateValue37;
        intermediateValue38 = intermediateValue39;
        intermediateValue40 = intermediateValue41;
        intermediateValue42 = intermediateValue43;
    }
    else
    {
        intermediateValue34 = intermediateValue26;
        intermediateValue36 = intermediateValue20;
        intermediateValue38 = intermediateValue22;
        intermediateValue40 = intermediateValue24;
        intermediateValue42 = intermediateValue16;
    }
    precise float productValue60 = intermediateValue42 * intermediateValue40;
    precise float productValue61 = intermediateValue42 * intermediateValue38;
    precise float productValue62 = intermediateValue42 * intermediateValue36;
    precise float productValue63 = intermediateValue42 * intermediateValue34;
    fragmentColor0.x = productValue60;
    fragmentColor0.y = productValue61;
    fragmentColor0.z = productValue62;
    fragmentColor0.w = productValue63;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue33;
    float intermediateValue35;
    float intermediateValue37;
    float intermediateValue39;
    float intermediateValue41;
    if (intermediateValue26)
    {
        bool comparisonValue3 = (scalarValue17 & 64u) != 0u;
        float comparisonValue5 = comparisonValue3 ? (intermediateValue25 * intermediateValue23) : intermediateValue23;
        float comparisonValue6 = comparisonValue3 ? (intermediateValue25 * intermediateValue21) : intermediateValue21;
        float comparisonValue7 = comparisonValue3 ? (intermediateValue25 * intermediateValue19) : intermediateValue19;
        float intermediateValue34;
        float intermediateValue36;
        float intermediateValue38;
        float intermediateValue40;
        float multiplyAddValue1;
        if (scalarValue18 != 4294967295u)
        {
            float scalarValue38 = spvNMax(intermediateValue25, 9.9999997473787516355514526367188e-06);
            uint sumValue14 = scalarValue18 + 4u;
            vec4 quotientValue9 = vec4(comparisonValue5 / scalarValue38, comparisonValue6 / scalarValue38, comparisonValue7 / scalarValue38, scalarValue38);
            float sumValue15 = rdDot4Precise(quotientValue9, fragmentVectorConstants1.packedValues[scalarValue18]) + fragmentVectorConstants1.packedValues[sumValue14].x;
            float sumValue16 = rdDot4Precise(quotientValue9, fragmentVectorConstants1.packedValues[scalarValue18 + 1u]) + fragmentVectorConstants1.packedValues[sumValue14].y;
            float sumValue17 = rdDot4Precise(quotientValue9, fragmentVectorConstants1.packedValues[scalarValue18 + 2u]) + fragmentVectorConstants1.packedValues[sumValue14].z;
            float scalarValue39 = spvNClamp(rdDot3Precise2(vec3(sumValue15, sumValue16, sumValue17), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
            multiplyAddValue1 = fma(intermediateValue17, (rdDot4Precise(quotientValue9, fragmentVectorConstants1.packedValues[scalarValue18 + 3u]) + fragmentVectorConstants1.packedValues[sumValue14].w) - scalarValue39, scalarValue39) * intermediateValue16;
            intermediateValue40 = sumValue15;
            intermediateValue38 = sumValue16;
            intermediateValue36 = sumValue17;
            intermediateValue34 = 1.0;
        }
        else
        {
            multiplyAddValue1 = intermediateValue16;
            intermediateValue40 = comparisonValue5;
            intermediateValue38 = comparisonValue6;
            intermediateValue36 = comparisonValue7;
            intermediateValue34 = intermediateValue25;
        }
        intermediateValue33 = intermediateValue34;
        intermediateValue35 = intermediateValue36;
        intermediateValue37 = intermediateValue38;
        intermediateValue39 = intermediateValue40;
        intermediateValue41 = multiplyAddValue1;
    }
    else
    {
        intermediateValue33 = intermediateValue25;
        intermediateValue35 = intermediateValue19;
        intermediateValue37 = intermediateValue21;
        intermediateValue39 = intermediateValue23;
        intermediateValue41 = intermediateValue16;
    }
    fragmentColor0.x = intermediateValue41 * intermediateValue39;
    fragmentColor0.y = intermediateValue41 * intermediateValue37;
    fragmentColor0.z = intermediateValue41 * intermediateValue35;
    fragmentColor0.w = intermediateValue41 * intermediateValue33;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = intermediateValue33 * dotProductValue;
    fragmentColor0.y = intermediateValue34 * dotProductValue;
    fragmentColor0.z = intermediateValue36 * dotProductValue;
    fragmentColor0.w = intermediateValue38 * dotProductValue;
#endif
}
