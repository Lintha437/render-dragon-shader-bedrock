#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceStandardRare / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE2_FLOAT_8 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE2_FLOAT_2 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT2_FLOAT_9 1
#endif

#include "../../include/materials/GamefaceStandardRare/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
    uint scalarValue = uint(varyingTexCoord3.w);
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint bitwiseValue2 = (uint(varyingTexCoord3.z) << 4u) + ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue = bitwiseValue2 + 1u;
    uint productValue4 = uint(int(fragmentScalarConstants1.packedValues[bitwiseValue2 * 4u]));
    uint sumValue1 = uint(max(int(productValue4 - 1u), int(0u)));
    uint productValue6 = uint(int(fragmentScalarConstants1.packedValues[(sumValue1 * 4u) + 1u]));
    float intermediateValue21;
    float intermediateValue23;
    float intermediateValue25;
    float intermediateValue27;
    float intermediateValue29;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue70 = bitfieldInsert(bitfieldExtract(uint(varyingTexCoord3.y), int(4u), int(4u)), uint(varyingTexCoord3.z), int(4u), int(28u));
    uint sumValue137 = scalarValue70 + 1u;
    uint productValue138 = uint(int(fragmentScalarConstants1.packedValues[scalarValue70 * 4u]));
    uint sumValue138 = uint(max(int(productValue138 - 1u), int(0u)));
    uint productValue139 = uint(int(fragmentScalarConstants1.packedValues[(sumValue138 * 4u) + 1u]));
    float nonlinearValue;
    float intermediateValue21;
    float intermediateValue23;
    float intermediateValue25;
    float intermediateValue27;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint bitwiseValue12 = (uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue177 = bitwiseValue12 + 1u;
    uint scalarValue112 = uint(int(fragmentVectorConstants1.packedValues[bitwiseValue12].x));
    uint sumValue178 = uint(int(fragmentVectorConstants1.packedValues[uint(max(int(0u), int(scalarValue112 + 4294967295u)))].y));
    float nonlinearValue;
    float intermediateValue3;
    float intermediateValue8;
    float intermediateValue13;
    float intermediateValue18;
#endif
    if (scalarValue == 1u)
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float scalarValue1 = varyingTexCoord2.x - varyingTexCoord1.x;
        precise float sumValue2 = varyingTexCoord2.y - varyingTexCoord1.y;
        vec2 vectorValue = vec2(scalarValue1, sumValue2);
        float scalarValue2 = rdDot2Precise2(vectorValue, vectorValue);
        precise float nonlinearValue1 = sqrt(scalarValue2) - varyingTexCoord1.z;
        precise float sumValue3 = 0.5 - nonlinearValue1;
        intermediateValue21 = spvNClamp(sumValue3, 0.0, 1.0);
        intermediateValue23 = fragmentVectorConstants1.packedValues[sumValue].z;
        intermediateValue25 = fragmentVectorConstants1.packedValues[sumValue].y;
        intermediateValue27 = fragmentVectorConstants1.packedValues[sumValue].x;
        intermediateValue29 = fragmentVectorConstants1.packedValues[sumValue].w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        vec2 vectorValue18 = vec2(varyingTexCoord2.x - varyingTexCoord1.x, varyingTexCoord2.y - varyingTexCoord1.y);
        float scalarValue71 = rdDot2Precise2(vectorValue18, vectorValue18);
        nonlinearValue = spvNClamp((varyingTexCoord1.z - sqrt(scalarValue71)) + 0.5, 0.0, 1.0);
        intermediateValue21 = fragmentVectorConstants1.packedValues[sumValue137].z;
        intermediateValue23 = fragmentVectorConstants1.packedValues[sumValue137].y;
        intermediateValue25 = fragmentVectorConstants1.packedValues[sumValue137].x;
        intermediateValue27 = fragmentVectorConstants1.packedValues[sumValue137].w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float scalarValue76 = varyingTexCoord2.x - varyingTexCoord1.x;
        float sumValue141 = varyingTexCoord2.y - varyingTexCoord1.y;
        nonlinearValue = spvNMin(spvNMax((varyingTexCoord1.z + 0.5) - sqrt((sumValue141 * sumValue141) + (scalarValue76 * scalarValue76)), 0.0), 1.0);
        intermediateValue3 = fragmentVectorConstants1.packedValues[sumValue177].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[sumValue177].y;
        intermediateValue13 = fragmentVectorConstants1.packedValues[sumValue177].z;
        intermediateValue18 = fragmentVectorConstants1.packedValues[sumValue177].w;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        float intermediateValue22;
        float intermediateValue24;
        float intermediateValue26;
        float intermediateValue28;
        float intermediateValue30;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float productValue5;
        float intermediateValue22;
        float intermediateValue24;
        float intermediateValue26;
        float intermediateValue28;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue6;
        float branchMergedValue11;
        float branchMergedValue12;
        float branchMergedValue13;
        float branchMergedValue14;
#endif
        if (scalarValue == 2u)
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float scalarValue3 = varyingTexCoord2.x - varyingTexCoord1.x;
            precise float sumValue4 = varyingTexCoord2.y - varyingTexCoord1.y;
            vec2 vectorValue1 = vec2(scalarValue3, sumValue4);
            float scalarValue4 = rdDot2Precise2(vectorValue1, vectorValue1);
            float nonlinearValue2 = sqrt(scalarValue4);
            precise float sumValue5 = nonlinearValue2 - varyingTexCoord1.z;
            precise float sumValue6 = varyingTexCoord1.z - varyingTexCoord1.w;
            precise float sumValue7 = nonlinearValue2 - sumValue6;
            precise float sumValue10 = 0.5 - sumValue7;
            precise float sumValue11 = 0.5 - sumValue5;
            precise float sumValue12 = 1.0 - spvNClamp(sumValue10, 0.0, 1.0);
            precise float productValue7 = sumValue12 * spvNClamp(sumValue11, 0.0, 1.0);
            intermediateValue30 = fragmentVectorConstants1.packedValues[sumValue].w;
            intermediateValue28 = fragmentVectorConstants1.packedValues[sumValue].x;
            intermediateValue26 = fragmentVectorConstants1.packedValues[sumValue].y;
            intermediateValue24 = fragmentVectorConstants1.packedValues[sumValue].z;
            intermediateValue22 = productValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            vec2 vectorValue19 = vec2(varyingTexCoord2.x - varyingTexCoord1.x, varyingTexCoord2.y - varyingTexCoord1.y);
            float scalarValue72 = rdDot2Precise2(vectorValue19, vectorValue19);
            float nonlinearValue48 = sqrt(scalarValue72);
            intermediateValue28 = fragmentVectorConstants1.packedValues[sumValue137].w;
            intermediateValue26 = fragmentVectorConstants1.packedValues[sumValue137].x;
            intermediateValue24 = fragmentVectorConstants1.packedValues[sumValue137].y;
            intermediateValue22 = fragmentVectorConstants1.packedValues[sumValue137].z;
            productValue5 = (1.0 - spvNClamp(0.5 - (nonlinearValue48 + (varyingTexCoord1.w - varyingTexCoord1.z)), 0.0, 1.0)) * spvNClamp((varyingTexCoord1.z - nonlinearValue48) + 0.5, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float scalarValue113 = varyingTexCoord2.x - varyingTexCoord1.x;
            float sumValue179 = varyingTexCoord2.y - varyingTexCoord1.y;
            float nonlinearValue50 = sqrt((sumValue179 * sumValue179) + (scalarValue113 * scalarValue113));
            float sumValue180 = varyingTexCoord1.z + 0.5;
            branchMergedValue6 = fragmentVectorConstants1.packedValues[sumValue177].w;
            branchMergedValue11 = fragmentVectorConstants1.packedValues[sumValue177].z;
            branchMergedValue12 = fragmentVectorConstants1.packedValues[sumValue177].y;
            branchMergedValue13 = fragmentVectorConstants1.packedValues[sumValue177].x;
            branchMergedValue14 = (1.0 - spvNMin(spvNMax((sumValue180 - varyingTexCoord1.w) - nonlinearValue50, 0.0), 1.0)) * spvNMin(spvNMax(sumValue180 - nonlinearValue50, 0.0), 1.0);
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float intermediateValue34;
            float intermediateValue35;
            float intermediateValue36;
            float intermediateValue37;
            float multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float intermediateValue31;
            float intermediateValue32;
            float intermediateValue33;
            float intermediateValue34;
            float multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue43;
            float branchMergedValue54;
            float branchMergedValue55;
            float branchMergedValue56;
            float branchMergedValue57;
#endif
            if (scalarValue == 4u)
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                precise float scalarValue5 = varyingTexCoord2.x - varyingTexCoord1.x;
                precise float sumValue13 = varyingTexCoord2.y - varyingTexCoord1.y;
                precise float quotientValue = scalarValue5 / varyingTexCoord1.z;
                precise float quotientValue1 = sumValue13 / varyingTexCoord1.w;
                vec2 vectorValue2 = vec2(quotientValue, quotientValue1);
                float scalarValue6 = rdDot2Precise2(vectorValue2, vectorValue2);
                precise float sumValue14 = scalarValue6 - 1.0;
                precise float sumValue15 = quotientValue + quotientValue;
                precise float sumValue16 = quotientValue1 + quotientValue1;
                precise float productValue8 = dFdx(quotientValue) * sumValue15;
                precise float productValue10 = dFdx(quotientValue1) * sumValue16;
                precise float sumValue17 = productValue10 + productValue8;
                precise float productValue13 = dFdy(-quotientValue) * sumValue15;
                precise float productValue19 = dFdy(-quotientValue1) * sumValue16;
                precise float sumValue18 = productValue19 + productValue13;
                vec2 vectorValue3 = vec2(sumValue17, sumValue18);
                float scalarValue7 = rdDot2Precise2(vectorValue3, vectorValue3);
                intermediateValue34 = fragmentVectorConstants1.packedValues[sumValue].w;
                intermediateValue35 = fragmentVectorConstants1.packedValues[sumValue].x;
                intermediateValue36 = fragmentVectorConstants1.packedValues[sumValue].y;
                intermediateValue37 = fragmentVectorConstants1.packedValues[sumValue].z;
                multiplyAddValue = spvNClamp(fma(-sumValue14, inversesqrt(spvNMax(scalarValue7, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue73 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord1.z;
                float quotientValue21 = (varyingTexCoord2.y - varyingTexCoord1.y) / varyingTexCoord1.w;
                vec2 vectorValue20 = vec2(scalarValue73, quotientValue21);
                float scalarValue74 = rdDot2Precise2(vectorValue20, vectorValue20);
                float sumValue139 = scalarValue73 + scalarValue73;
                float sumValue140 = quotientValue21 + quotientValue21;
                vec2 multiplyAddValue104 = vec2(fma(dFdxCoarse(quotientValue21), sumValue140, dFdxCoarse(scalarValue73) * sumValue139), fma(dFdyCoarse(-quotientValue21), sumValue140, dFdyCoarse(-scalarValue73) * sumValue139));
                float scalarValue75 = rdDot2Precise2(multiplyAddValue104, multiplyAddValue104);
                intermediateValue31 = fragmentVectorConstants1.packedValues[sumValue137].w;
                intermediateValue32 = fragmentVectorConstants1.packedValues[sumValue137].x;
                intermediateValue33 = fragmentVectorConstants1.packedValues[sumValue137].y;
                intermediateValue34 = fragmentVectorConstants1.packedValues[sumValue137].z;
                multiplyAddValue = spvNClamp(fma(1.0 - scalarValue74, inversesqrt(spvNMax(scalarValue75, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float scalarValue73 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord1.z;
                float quotientValue21 = (varyingTexCoord2.y - varyingTexCoord1.y) / varyingTexCoord1.w;
                float productValue148 = ((dFdxCoarse(quotientValue21) * quotientValue21) + (dFdxCoarse(scalarValue73) * scalarValue73)) * 2.0;
                float productValue149 = ((dFdyCoarse((-0.0) - quotientValue21) * quotientValue21) + (dFdyCoarse((-0.0) - scalarValue73) * scalarValue73)) * 2.0;
                branchMergedValue43 = fragmentVectorConstants1.packedValues[sumValue177].w;
                branchMergedValue54 = fragmentVectorConstants1.packedValues[sumValue177].z;
                branchMergedValue55 = fragmentVectorConstants1.packedValues[sumValue177].y;
                branchMergedValue56 = fragmentVectorConstants1.packedValues[sumValue177].x;
                branchMergedValue57 = spvNClamp(0.5 - (inversesqrt(spvNMax(dot(vec2(productValue148, productValue149), vec2(productValue148, productValue149)), 9.9999997473787516355514526367188e-05)) * (dot(vec2(scalarValue73, quotientValue21), vec2(scalarValue73, quotientValue21)) + (-1.0))), 0.0, 1.0);
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float intermediateValue43;
                float intermediateValue44;
                float intermediateValue45;
                float intermediateValue46;
                float intermediateValue47;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float intermediateValue39;
                float intermediateValue40;
                float intermediateValue41;
                float intermediateValue42;
                float multiplyAddValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float branchMergedValue73;
                float branchMergedValue75;
                float branchMergedValue76;
                float branchMergedValue77;
                float branchMergedValue78;
#endif
                if (scalarValue == 5u)
                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                    precise float scalarValue8 = varyingTexCoord2.x - varyingTexCoord1.x;
                    precise float sumValue19 = varyingTexCoord2.y - varyingTexCoord1.y;
                    uint productValue20 = (bitwiseValue2 * 4u) + 1u;
                    precise float multiplyAddValue1 = scalarValue8 / fma(fragmentScalarConstants1.packedValues[productValue20], 0.5, varyingTexCoord1.z);
                    precise float multiplyAddValue3 = sumValue19 / fma(fragmentScalarConstants1.packedValues[productValue20], 0.5, varyingTexCoord1.w);
                    vec2 vectorValue4 = vec2(multiplyAddValue1, multiplyAddValue3);
                    float scalarValue9 = rdDot2Precise2(vectorValue4, vectorValue4);
                    precise float sumValue20 = scalarValue9 - 1.0;
                    precise float sumValue21 = multiplyAddValue1 + multiplyAddValue1;
                    precise float sumValue22 = multiplyAddValue3 + multiplyAddValue3;
                    precise float productValue21 = dFdx(multiplyAddValue1) * sumValue21;
                    precise float productValue22 = dFdx(multiplyAddValue3) * sumValue22;
                    precise float sumValue24 = productValue22 + productValue21;
                    precise float productValue23 = dFdy(-multiplyAddValue1) * sumValue21;
                    precise float productValue24 = dFdy(-multiplyAddValue3) * sumValue22;
                    precise float sumValue25 = productValue24 + productValue23;
                    vec2 vectorValue5 = vec2(sumValue24, sumValue25);
                    float scalarValue10 = rdDot2Precise2(vectorValue5, vectorValue5);
                    float scalarValue11 = -fragmentScalarConstants1.packedValues[productValue20];
                    precise float multiplyAddValue4 = scalarValue8 / fma(scalarValue11, 0.5, varyingTexCoord1.z);
                    precise float multiplyAddValue5 = sumValue19 / fma(scalarValue11, 0.5, varyingTexCoord1.w);
                    vec2 vectorValue6 = vec2(multiplyAddValue4, multiplyAddValue5);
                    float scalarValue12 = rdDot2Precise2(vectorValue6, vectorValue6);
                    precise float sumValue26 = scalarValue12 - 1.0;
                    precise float sumValue27 = multiplyAddValue4 + multiplyAddValue4;
                    precise float sumValue30 = multiplyAddValue5 + multiplyAddValue5;
                    precise float productValue25 = dFdx(multiplyAddValue4) * sumValue27;
                    precise float productValue26 = dFdx(multiplyAddValue5) * sumValue30;
                    precise float sumValue31 = productValue26 + productValue25;
                    precise float productValue27 = dFdy(-multiplyAddValue4) * sumValue27;
                    precise float productValue28 = dFdy(-multiplyAddValue5) * sumValue30;
                    precise float sumValue32 = productValue28 + productValue27;
                    vec2 vectorValue7 = vec2(sumValue31, sumValue32);
                    float scalarValue13 = rdDot2Precise2(vectorValue7, vectorValue7);
                    precise float multiplyAddValue6 = spvNClamp(fma(sumValue26, inversesqrt(spvNMax(scalarValue13, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0) * spvNClamp(fma(-sumValue20, inversesqrt(spvNMax(scalarValue10, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0);
                    intermediateValue43 = fragmentVectorConstants1.packedValues[sumValue].w;
                    intermediateValue44 = fragmentVectorConstants1.packedValues[sumValue].x;
                    intermediateValue45 = fragmentVectorConstants1.packedValues[sumValue].y;
                    intermediateValue46 = fragmentVectorConstants1.packedValues[sumValue].z;
                    intermediateValue47 = multiplyAddValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    float scalarValue76 = varyingTexCoord2.x - varyingTexCoord1.x;
                    float sumValue141 = varyingTexCoord2.y - varyingTexCoord1.y;
                    uint productValue140 = (scalarValue70 * 4u) + 1u;
                    float multiplyAddValue105 = scalarValue76 / fma(fragmentScalarConstants1.packedValues[productValue140], 0.5, varyingTexCoord1.z);
                    float multiplyAddValue106 = sumValue141 / fma(fragmentScalarConstants1.packedValues[productValue140], 0.5, varyingTexCoord1.w);
                    vec2 vectorValue21 = vec2(multiplyAddValue105, multiplyAddValue106);
                    float scalarValue77 = rdDot2Precise2(vectorValue21, vectorValue21);
                    float sumValue142 = multiplyAddValue105 + multiplyAddValue105;
                    float sumValue143 = multiplyAddValue106 + multiplyAddValue106;
                    vec2 multiplyAddValue107 = vec2(fma(dFdxCoarse(multiplyAddValue106), sumValue143, dFdxCoarse(multiplyAddValue105) * sumValue142), fma(dFdyCoarse(-multiplyAddValue106), sumValue143, dFdyCoarse(-multiplyAddValue105) * sumValue142));
                    float scalarValue78 = rdDot2Precise2(multiplyAddValue107, multiplyAddValue107);
                    float scalarValue79 = -fragmentScalarConstants1.packedValues[productValue140];
                    float multiplyAddValue108 = scalarValue76 / fma(scalarValue79, 0.5, varyingTexCoord1.z);
                    float multiplyAddValue109 = sumValue141 / fma(scalarValue79, 0.5, varyingTexCoord1.w);
                    vec2 vectorValue22 = vec2(multiplyAddValue108, multiplyAddValue109);
                    float scalarValue80 = rdDot2Precise2(vectorValue22, vectorValue22);
                    float sumValue144 = multiplyAddValue108 + multiplyAddValue108;
                    float sumValue145 = multiplyAddValue109 + multiplyAddValue109;
                    vec2 multiplyAddValue110 = vec2(fma(dFdxCoarse(multiplyAddValue109), sumValue145, dFdxCoarse(multiplyAddValue108) * sumValue144), fma(dFdyCoarse(-multiplyAddValue109), sumValue145, dFdyCoarse(-multiplyAddValue108) * sumValue144));
                    float scalarValue81 = rdDot2Precise2(multiplyAddValue110, multiplyAddValue110);
                    intermediateValue39 = fragmentVectorConstants1.packedValues[sumValue137].w;
                    intermediateValue40 = fragmentVectorConstants1.packedValues[sumValue137].x;
                    intermediateValue41 = fragmentVectorConstants1.packedValues[sumValue137].y;
                    intermediateValue42 = fragmentVectorConstants1.packedValues[sumValue137].z;
                    multiplyAddValue2 = spvNClamp(fma(scalarValue80 - 1.0, inversesqrt(spvNMax(scalarValue81, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0) * spvNClamp(fma(1.0 - scalarValue77, inversesqrt(spvNMax(scalarValue78, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float scalarValue114 = varyingTexCoord2.x - varyingTexCoord1.x;
                    float sumValue181 = varyingTexCoord2.y - varyingTexCoord1.y;
                    float productValue150 = fragmentVectorConstants1.packedValues[bitwiseValue12].y * 0.5;
                    float quotientValue36 = scalarValue114 / (productValue150 + varyingTexCoord1.z);
                    float quotientValue37 = sumValue181 / (productValue150 + varyingTexCoord1.w);
                    float productValue151 = ((dFdxCoarse(quotientValue37) * quotientValue37) + (dFdxCoarse(quotientValue36) * quotientValue36)) * 2.0;
                    float productValue152 = ((dFdyCoarse((-0.0) - quotientValue37) * quotientValue37) + (dFdyCoarse((-0.0) - quotientValue36) * quotientValue36)) * 2.0;
                    float quotientValue38 = scalarValue114 / (varyingTexCoord1.z - productValue150);
                    float quotientValue39 = sumValue181 / (varyingTexCoord1.w - productValue150);
                    float productValue153 = ((dFdxCoarse(quotientValue39) * quotientValue39) + (dFdxCoarse(quotientValue38) * quotientValue38)) * 2.0;
                    float productValue154 = ((dFdyCoarse((-0.0) - quotientValue39) * quotientValue39) + (dFdyCoarse((-0.0) - quotientValue38) * quotientValue38)) * 2.0;
                    branchMergedValue73 = fragmentVectorConstants1.packedValues[sumValue177].w;
                    branchMergedValue75 = fragmentVectorConstants1.packedValues[sumValue177].z;
                    branchMergedValue76 = fragmentVectorConstants1.packedValues[sumValue177].y;
                    branchMergedValue77 = fragmentVectorConstants1.packedValues[sumValue177].x;
                    branchMergedValue78 = spvNClamp((inversesqrt(spvNMax(dot(vec2(productValue153, productValue154), vec2(productValue153, productValue154)), 9.9999997473787516355514526367188e-05)) * (dot(vec2(quotientValue38, quotientValue39), vec2(quotientValue38, quotientValue39)) + (-1.0))) + 0.5, 0.0, 1.0) * spvNClamp(0.5 - (inversesqrt(spvNMax(dot(vec2(productValue151, productValue152), vec2(productValue151, productValue152)), 9.9999997473787516355514526367188e-05)) * (dot(vec2(quotientValue36, quotientValue37), vec2(quotientValue36, quotientValue37)) + (-1.0))), 0.0, 1.0);
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                    float intermediateValue58;
                    float intermediateValue59;
                    float intermediateValue60;
                    float intermediateValue61;
                    float bitwiseValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    float intermediateValue51;
                    float intermediateValue52;
                    float intermediateValue53;
                    float intermediateValue54;
                    float bitwiseValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float branchMergedValue84;
                    float branchMergedValue85;
                    float branchMergedValue86;
                    float branchMergedValue87;
                    float branchMergedValue88;
#endif
                    if (scalarValue == 6u)
                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                        uint scalarValue14 = productValue4 + 1u;
                        uint productValue29 = productValue4 * 4u;
                        precise float productValue30 = fragmentScalarConstants1.packedValues[productValue29] * 0.307196319103240966796875;
                        float multiplyAddValue37 = (fragmentScalarConstants1.packedValues[productValue29] > 3.0) ? productValue30 : fma(fragmentScalarConstants1.packedValues[productValue29], 0.100000001490116119384765625, 0.60000002384185791015625);
                        uint bitwiseValue3 = (uint(int(fragmentScalarConstants1.packedValues[productValue29])) << 1u) + 1u;
                        uint bitwiseValue4 = uint(abs(int(bitwiseValue3))) >> 1u;
                        uint comparisonValue = (((bitwiseValue3 ^ 2u) & 2147483648u) != 0u) ? (-bitwiseValue4) : bitwiseValue4;
                        precise float productValue31 = multiplyAddValue37 * 2.5066282749176025390625;
                        float intermediateValue63;
                        intermediateValue63 = 0.0;
                        precise float sumValue28;
                        uint sumValue29;
                        uint scalarValue15 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                        uint scalarValue82 = productValue138 + 1u;
                        uint productValue141 = productValue138 * 4u;
                        float multiplyAddValue111 = (fragmentScalarConstants1.packedValues[productValue141] > 3.0) ? (fragmentScalarConstants1.packedValues[productValue141] * 0.307196319103240966796875) : fma(fragmentScalarConstants1.packedValues[productValue141], 0.100000001490116119384765625, 0.60000002384185791015625);
                        uint scalarValue83 = bitfieldInsert(1u, uint(int(fragmentScalarConstants1.packedValues[productValue141])), int(1u), int(31u));
                        uint bitwiseValue9 = uint(abs(int(scalarValue83))) >> 1u;
                        uint comparisonValue13 = (((scalarValue83 ^ 2u) & 2147483648u) != 0u) ? (-bitwiseValue9) : bitwiseValue9;
                        float productValue142 = multiplyAddValue111 * 2.5066282749176025390625;
                        float intermediateValue57;
                        intermediateValue57 = 0.0;
                        float exponentialValue;
                        uint sumValue9;
                        uint scalarValue15 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        uint scalarValue115 = scalarValue112 + 1u;
                        float comparisonValue17 = (fragmentVectorConstants1.packedValues[scalarValue112].x > 3.0) ? (fragmentVectorConstants1.packedValues[scalarValue112].x * 0.307196319103240966796875) : ((fragmentVectorConstants1.packedValues[scalarValue112].x * 0.100000001490116119384765625) + 0.60000002384185791015625);
                        uint bitwiseValue13 = uint(int(fragmentVectorConstants1.packedValues[scalarValue112].x)) << 1u;
                        uint bitwiseValue14 = bitwiseValue13 | 1u;
                        uint quotientValue40 = uint(int(bitwiseValue14) / int(2u));
                        float intermediateValue26;
                        if (int(bitwiseValue14) > int(0u))
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                            if (int(bitwiseValue3) <= int(scalarValue15))
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            if (int(scalarValue83) <= int(scalarValue15))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            uint bitwiseValue15 = bitwiseValue13 | 1u;
                            float intermediateValue27;
                            uint intermediateValue28;
                            intermediateValue27 = 0.0;
                            intermediateValue28 = 0u;
                            float exponentialValue;
                            for (;;)
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
                                break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float quotientValue41 = float(int(intermediateValue28 - quotientValue40)) / comparisonValue17;
                                exponentialValue = (exp2((quotientValue41 * quotientValue41) * (-0.721347510814666748046875)) / (comparisonValue17 * 2.5066282749176025390625)) + intermediateValue27;
                                uint sumValue182 = intermediateValue28 + 1u;
                                if (sumValue182 == bitwiseValue15)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue27 = exponentialValue;
                                    intermediateValue28 = sumValue182;
                                }
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                            float sumValue33 = rdSignedBitsToFloat2(scalarValue15 - comparisonValue);
                            precise float quotientValue2 = sumValue33 / multiplyAddValue37;
                            precise float productValue32 = quotientValue2 * quotientValue2;
                            precise float productValue33 = productValue32 * (-0.721347510814666748046875);
                            precise float exponentialValue33 = exp2(productValue33) / productValue31;
                            sumValue28 = exponentialValue33 + intermediateValue63;
                            sumValue29 = scalarValue15 + 1u;
                            intermediateValue63 = sumValue28;
                            scalarValue15 = sumValue29;
                            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            float sumValue146 = rdSignedBitsToFloat2(scalarValue15 - comparisonValue13);
                            float quotientValue22 = sumValue146 / multiplyAddValue111;
                            exponentialValue = (exp2((quotientValue22 * quotientValue22) * (-0.721347510814666748046875)) / productValue142) + intermediateValue57;
                            sumValue9 = scalarValue15 + 1u;
                            intermediateValue57 = exponentialValue;
                            scalarValue15 = sumValue9;
                            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            intermediateValue26 = exponentialValue;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM40
                        precise float sumValue34 = fragmentScalarConstants1.packedValues[productValue29] + 1.0;
                        precise float productValue34 = sumValue34 * 0.5;
                        precise float quotientValue3 = 1.0 / productValue31;
                        precise float quotientValue4 = quotientValue3 / intermediateValue63;
                        precise float productValue35 = quotientValue4 * 0.5;
                        uint multiplyAddValue38 = uint(int(fma(-floor(productValue34), 2.0, sumValue34)));
                        uint multiplyAddValue39 = uint(int(fma(fragmentScalarConstants1.packedValues[productValue29], 0.5, 1.0)));
                        bool comparisonValue1 = multiplyAddValue38 != 1u;
                        bool comparisonValue3 = (fragmentVectorConstants1.packedValues[scalarValue14].z != (-1.0)) || (fragmentVectorConstants1.packedValues[scalarValue14].w != (-1.0));
                        precise float sumValue35 = fragmentVectorConstants1.packedValues[scalarValue14].z + fragmentVectorConstants1.packedValues[scalarValue14].x;
                        precise float sumValue36 = fragmentVectorConstants1.packedValues[scalarValue14].w + fragmentVectorConstants1.packedValues[scalarValue14].y;
                        uint bitwiseValue5 = productValue6 & 2u;
                        uint bitwiseValue6 = productValue6 & 16u;
                        float intermediateValue104;
                        float intermediateValue105;
                        float intermediateValue106;
                        float intermediateValue107;
                        intermediateValue104 = 0.0;
                        intermediateValue105 = 0.0;
                        intermediateValue106 = 0.0;
                        intermediateValue107 = 0.0;
                        float multiplyAddValue23;
                        float multiplyAddValue24;
                        float multiplyAddValue25;
                        float multiplyAddValue26;
                        uint sumValue58;
                        float intermediateValue101;
                        float intermediateValue103;
                        float intermediateValue109;
                        float scalarValue16 = 0.0;
                        float scalarValue17 = 0.0;
                        float scalarValue18 = productValue35;
                        uint scalarValue19 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                        float sumValue147 = fragmentScalarConstants1.packedValues[productValue141] + 1.0;
                        float quotientValue23 = ((1.0 / productValue142) / intermediateValue57) * 0.5;
                        uint multiplyAddValue112 = uint(int(fma(-floor(sumValue147 * 0.5), 2.0, sumValue147)));
                        uint multiplyAddValue113 = uint(int(fma(fragmentScalarConstants1.packedValues[productValue141], 0.5, 1.0)));
                        bool comparisonValue14 = multiplyAddValue112 != 1u;
                        bool comparisonValue15 = (fragmentVectorConstants1.packedValues[scalarValue82].z != (-1.0)) || (fragmentVectorConstants1.packedValues[scalarValue82].w != (-1.0));
                        float sumValue148 = fragmentVectorConstants1.packedValues[scalarValue82].z + fragmentVectorConstants1.packedValues[scalarValue82].x;
                        float sumValue149 = fragmentVectorConstants1.packedValues[scalarValue82].w + fragmentVectorConstants1.packedValues[scalarValue82].y;
                        uint bitwiseValue10 = productValue139 & 2u;
                        uint bitwiseValue11 = productValue139 & 16u;
                        float intermediateValue89;
                        float intermediateValue90;
                        float intermediateValue91;
                        float intermediateValue92;
                        intermediateValue89 = 0.0;
                        intermediateValue90 = 0.0;
                        intermediateValue91 = 0.0;
                        intermediateValue92 = 0.0;
                        float multiplyAddValue26;
                        float multiplyAddValue27;
                        float multiplyAddValue28;
                        float multiplyAddValue29;
                        uint sumValue23;
                        float productValue11;
                        float productValue12;
                        float intermediateValue94;
                        float scalarValue16 = 0.0;
                        float scalarValue17 = 0.0;
                        float scalarValue84 = quotientValue23;
                        uint scalarValue19 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        else
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                            if (int(scalarValue19) >= int(multiplyAddValue39))
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            if (int(scalarValue19) >= int(multiplyAddValue113))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            intermediateValue26 = 0.0;
                        }
                        float sumValue183 = fragmentVectorConstants1.packedValues[scalarValue112].x + 1.0;
                        uint productValue155 = uint(int(sumValue183 - (floor(sumValue183 * 0.5) * 2.0)));
                        uint productValue156 = uint(int((fragmentVectorConstants1.packedValues[scalarValue112].x * 0.5) + 1.0));
                        float branchMergedValue90;
                        float branchMergedValue95;
                        float branchMergedValue96;
                        float branchMergedValue97;
                        float branchMergedValue98;
                        if (int(productValue156) > int(0u))
                        {
                            float quotientValue42 = 0.1994711458683013916015625 / (intermediateValue26 * comparisonValue17);
                            float productValue;
                            float productValue1;
                            float productValue2;
                            float productValue3;
                            float intermediateValue54;
                            float intermediateValue58;
                            float intermediateValue65;
                            float intermediateValue66;
                            float intermediateValue67;
                            float intermediateValue68;
                            float intermediateValue69;
                            float intermediateValue70;
                            float intermediateValue34;
                            float productValue14;
                            float productValue15;
                            float scalarValue116 = quotientValue42;
                            float scalarValue16 = 0.0;
                            float scalarValue17 = 0.0;
                            uint scalarValue15 = 0u;
                            float scalarValue117 = 0.0;
                            float scalarValue118 = 0.0;
                            float scalarValue119 = 0.0;
                            float scalarValue120 = 0.0;
                            bool comparisonValue2;
                            for (;;)
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
                                break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                comparisonValue2 = (productValue155 != 1u) || (scalarValue15 != 0u);
                                if (comparisonValue2)
                                {
                                    uint bitwiseValue16 = scalarValue15 << 1u;
                                    float quotientValue43 = float(int(productValue155 - bitwiseValue16)) / comparisonValue17;
                                    float productValue157 = (comparisonValue17 * 2.5066282749176025390625) * intermediateValue26;
                                    float bitwiseValue17 = float(int(productValue155 - (bitwiseValue16 | 1u))) / comparisonValue17;
                                    float exponentialValue38 = exp2((bitwiseValue17 * bitwiseValue17) * (-0.721347510814666748046875)) / productValue157;
                                    float exponentialValue39 = exponentialValue38 + ((scalarValue15 == 0u) ? scalarValue116 : (exp2((quotientValue43 * quotientValue43) * (-0.721347510814666748046875)) / productValue157));
                                    float quotientValue44 = (exponentialValue38 / exponentialValue39) + float(int(bitwiseValue16 - productValue155));
                                    intermediateValue34 = exponentialValue39;
                                    productValue14 = quotientValue44 * fragmentVectorConstants1.packedValues[scalarValue112].y;
                                    productValue15 = quotientValue44 * fragmentVectorConstants1.packedValues[scalarValue112].z;
                                }
                                else
                                {
                                    intermediateValue34 = scalarValue116;
                                    productValue14 = scalarValue16;
                                    productValue15 = scalarValue17;
                                }
                                float sumValue184 = productValue14 + varyingTexCoord1.x;
                                float sumValue185 = productValue15 + varyingTexCoord1.y;
                                float sumValue186 = varyingTexCoord1.x - productValue14;
                                float sumValue187 = varyingTexCoord1.y - productValue15;
                                float intermediateValue47;
                                float intermediateValue48;
                                float intermediateValue49;
                                float intermediateValue50;
                                if ((fragmentVectorConstants1.packedValues[scalarValue115].z != (-1.0)) || (fragmentVectorConstants1.packedValues[scalarValue115].w != (-1.0)))
                                {
                                    float sumValue188 = fragmentVectorConstants1.packedValues[scalarValue115].x + fragmentVectorConstants1.packedValues[scalarValue115].z;
                                    float sumValue189 = fragmentVectorConstants1.packedValues[scalarValue115].y + fragmentVectorConstants1.packedValues[scalarValue115].w;
                                    intermediateValue47 = spvNMin(spvNMax(sumValue184, fragmentVectorConstants1.packedValues[scalarValue115].x), sumValue188);
                                    intermediateValue48 = spvNMin(spvNMax(sumValue185, fragmentVectorConstants1.packedValues[scalarValue115].y), sumValue189);
                                    intermediateValue49 = spvNMin(spvNMax(sumValue186, fragmentVectorConstants1.packedValues[scalarValue115].x), sumValue188);
                                    intermediateValue50 = spvNMin(spvNMax(sumValue187, fragmentVectorConstants1.packedValues[scalarValue115].y), sumValue189);
                                }
                                else
                                {
                                    intermediateValue47 = sumValue184;
                                    intermediateValue48 = sumValue185;
                                    intermediateValue49 = sumValue186;
                                    intermediateValue50 = sumValue187;
                                }
                                vec4 sampledTextureValue17 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * intermediateValue47) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * intermediateValue48) + fragmentVectorConstants1.packedValues[128u].y));
                                float scalarValue121 = sampledTextureValue17.x;
                                float scalarValue122 = sampledTextureValue17.y;
                                float scalarValue123 = sampledTextureValue17.z;
                                intermediateValue54 = sampledTextureValue17.w;
                                vec4 sampledTextureValue18 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * intermediateValue49) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * intermediateValue50) + fragmentVectorConstants1.packedValues[128u].y));
                                float scalarValue124 = sampledTextureValue18.x;
                                float scalarValue125 = sampledTextureValue18.y;
                                float scalarValue126 = sampledTextureValue18.z;
                                intermediateValue58 = sampledTextureValue18.w;
                                float branchMergedValue;
                                float branchMergedValue1;
                                float branchMergedValue2;
                                float branchMergedValue3;
                                float branchMergedValue4;
                                float branchMergedValue5;
                                if ((sumValue178 & 2u) == 0u)
                                {
                                    float branchMergedValue41;
                                    float branchMergedValue44;
                                    float branchMergedValue45;
                                    float branchMergedValue46;
                                    float branchMergedValue47;
                                    float branchMergedValue48;
                                    if ((sumValue178 & 16u) == 0u)
                                    {
                                        branchMergedValue41 = scalarValue126;
                                        branchMergedValue44 = scalarValue125;
                                        branchMergedValue45 = scalarValue124;
                                        branchMergedValue46 = scalarValue122;
                                        branchMergedValue47 = scalarValue123;
                                        branchMergedValue48 = scalarValue121;
                                    }
                                    else
                                    {
                                        float exponentialValue12;
                                        if (!(scalarValue121 <= 0.003130800090730190277099609375))
                                        {
                                            exponentialValue12 = (exp2(log2(scalarValue121) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                        }
                                        else
                                        {
                                            exponentialValue12 = scalarValue121 * 12.9200000762939453125;
                                        }
                                        float exponentialValue14;
                                        if (!(scalarValue122 <= 0.003130800090730190277099609375))
                                        {
                                            exponentialValue14 = (exp2(log2(scalarValue122) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                        }
                                        else
                                        {
                                            exponentialValue14 = scalarValue122 * 12.9200000762939453125;
                                        }
                                        float exponentialValue16;
                                        if (!(scalarValue123 <= 0.003130800090730190277099609375))
                                        {
                                            exponentialValue16 = (exp2(log2(scalarValue123) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                        }
                                        else
                                        {
                                            exponentialValue16 = scalarValue123 * 12.9200000762939453125;
                                        }
                                        float exponentialValue18;
                                        if (!(scalarValue124 <= 0.003130800090730190277099609375))
                                        {
                                            exponentialValue18 = (exp2(log2(scalarValue124) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                        }
                                        else
                                        {
                                            exponentialValue18 = scalarValue124 * 12.9200000762939453125;
                                        }
                                        float exponentialValue20;
                                        if (!(scalarValue125 <= 0.003130800090730190277099609375))
                                        {
                                            exponentialValue20 = (exp2(log2(scalarValue125) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                        }
                                        else
                                        {
                                            exponentialValue20 = scalarValue125 * 12.9200000762939453125;
                                        }
                                        float branchMergedValue74;
                                        float branchMergedValue79;
                                        float branchMergedValue80;
                                        float branchMergedValue81;
                                        float branchMergedValue82;
                                        float branchMergedValue83;
                                        if (!(scalarValue126 <= 0.003130800090730190277099609375))
                                        {
                                            branchMergedValue74 = (exp2(log2(scalarValue126) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                            branchMergedValue79 = exponentialValue20;
                                            branchMergedValue80 = exponentialValue18;
                                            branchMergedValue81 = exponentialValue14;
                                            branchMergedValue82 = exponentialValue16;
                                            branchMergedValue83 = exponentialValue12;
                                        }
                                        else
                                        {
                                            branchMergedValue74 = scalarValue126 * 12.9200000762939453125;
                                            branchMergedValue79 = exponentialValue20;
                                            branchMergedValue80 = exponentialValue18;
                                            branchMergedValue81 = exponentialValue14;
                                            branchMergedValue82 = exponentialValue16;
                                            branchMergedValue83 = exponentialValue12;
                                        }
                                        branchMergedValue41 = branchMergedValue74;
                                        branchMergedValue44 = branchMergedValue79;
                                        branchMergedValue45 = branchMergedValue80;
                                        branchMergedValue46 = branchMergedValue81;
                                        branchMergedValue47 = branchMergedValue82;
                                        branchMergedValue48 = branchMergedValue83;
                                    }
                                    branchMergedValue = branchMergedValue41;
                                    branchMergedValue1 = branchMergedValue44;
                                    branchMergedValue2 = branchMergedValue45;
                                    branchMergedValue3 = branchMergedValue46;
                                    branchMergedValue4 = branchMergedValue47;
                                    branchMergedValue5 = branchMergedValue48;
                                }
                                else
                                {
                                    float exponentialValue11;
                                    if (!(scalarValue121 <= 0.040449999272823333740234375))
                                    {
                                        exponentialValue11 = exp2(log2((scalarValue121 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                    }
                                    else
                                    {
                                        exponentialValue11 = scalarValue121 * 0.077399380505084991455078125;
                                    }
                                    float exponentialValue13;
                                    if (!(scalarValue122 <= 0.040449999272823333740234375))
                                    {
                                        exponentialValue13 = exp2(log2((scalarValue122 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                    }
                                    else
                                    {
                                        exponentialValue13 = scalarValue122 * 0.077399380505084991455078125;
                                    }
                                    float exponentialValue15;
                                    if (!(scalarValue123 <= 0.040449999272823333740234375))
                                    {
                                        exponentialValue15 = exp2(log2((scalarValue123 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                    }
                                    else
                                    {
                                        exponentialValue15 = scalarValue123 * 0.077399380505084991455078125;
                                    }
                                    float exponentialValue17;
                                    if (!(scalarValue124 <= 0.040449999272823333740234375))
                                    {
                                        exponentialValue17 = exp2(log2((scalarValue124 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                    }
                                    else
                                    {
                                        exponentialValue17 = scalarValue124 * 0.077399380505084991455078125;
                                    }
                                    float exponentialValue19;
                                    if (!(scalarValue125 <= 0.040449999272823333740234375))
                                    {
                                        exponentialValue19 = exp2(log2((scalarValue125 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                    }
                                    else
                                    {
                                        exponentialValue19 = scalarValue125 * 0.077399380505084991455078125;
                                    }
                                    float branchMergedValue42;
                                    float branchMergedValue49;
                                    float branchMergedValue50;
                                    float branchMergedValue51;
                                    float branchMergedValue52;
                                    float branchMergedValue53;
                                    if (!(scalarValue126 <= 0.040449999272823333740234375))
                                    {
                                        branchMergedValue42 = exp2(log2((scalarValue126 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                        branchMergedValue49 = exponentialValue19;
                                        branchMergedValue50 = exponentialValue17;
                                        branchMergedValue51 = exponentialValue13;
                                        branchMergedValue52 = exponentialValue15;
                                        branchMergedValue53 = exponentialValue11;
                                    }
                                    else
                                    {
                                        branchMergedValue42 = scalarValue126 * 0.077399380505084991455078125;
                                        branchMergedValue49 = exponentialValue19;
                                        branchMergedValue50 = exponentialValue17;
                                        branchMergedValue51 = exponentialValue13;
                                        branchMergedValue52 = exponentialValue15;
                                        branchMergedValue53 = exponentialValue11;
                                    }
                                    branchMergedValue = branchMergedValue42;
                                    branchMergedValue1 = branchMergedValue49;
                                    branchMergedValue2 = branchMergedValue50;
                                    branchMergedValue3 = branchMergedValue51;
                                    branchMergedValue4 = branchMergedValue52;
                                    branchMergedValue5 = branchMergedValue53;
                                }
                                intermediateValue70 = branchMergedValue;
                                intermediateValue69 = branchMergedValue1;
                                intermediateValue68 = branchMergedValue2;
                                intermediateValue66 = branchMergedValue3;
                                intermediateValue67 = branchMergedValue4;
                                intermediateValue65 = branchMergedValue5;
                                productValue = ((intermediateValue68 + intermediateValue65) * intermediateValue34) + scalarValue117;
                                productValue1 = ((intermediateValue69 + intermediateValue66) * intermediateValue34) + scalarValue118;
                                productValue2 = ((intermediateValue70 + intermediateValue67) * intermediateValue34) + scalarValue119;
                                productValue3 = ((intermediateValue58 + intermediateValue54) * intermediateValue34) + scalarValue120;
                                uint sumValue190 = scalarValue15 + 1u;
                                if (sumValue190 == productValue156)
                                {
                                    break;
                                }
                                else
                                {
                                    scalarValue116 = intermediateValue34;
                                    scalarValue16 = productValue14;
                                    scalarValue17 = productValue15;
                                    scalarValue15 = sumValue190;
                                    scalarValue117 = productValue;
                                    scalarValue118 = productValue1;
                                    scalarValue119 = productValue2;
                                    scalarValue120 = productValue3;
                                    continue;
                                }
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                            bool comparisonValue4 = scalarValue19 != 0u;
                            if (comparisonValue1 || comparisonValue4)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            bool comparisonValue4 = scalarValue19 != 0u;
                            if (comparisonValue14 || comparisonValue4)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            branchMergedValue90 = productValue3;
                            branchMergedValue95 = productValue2;
                            branchMergedValue96 = productValue1;
                            branchMergedValue97 = productValue;
                            branchMergedValue98 = fragmentVectorConstants1.packedValues[sumValue177].w;
                        }
                        else
                        {
                            branchMergedValue90 = 0.0;
                            branchMergedValue95 = 0.0;
                            branchMergedValue96 = 0.0;
                            branchMergedValue97 = 0.0;
                            branchMergedValue98 = fragmentVectorConstants1.packedValues[sumValue177].w;
                        }
                        branchMergedValue84 = branchMergedValue90;
                        branchMergedValue85 = branchMergedValue95;
                        branchMergedValue86 = branchMergedValue96;
                        branchMergedValue87 = branchMergedValue97;
                        branchMergedValue88 = branchMergedValue98;
                    }
                    else
                    {
                        float branchMergedValue89;
                        float branchMergedValue91;
                        float branchMergedValue92;
                        float branchMergedValue93;
                        float branchMergedValue94;
                        if (scalarValue == 7u)
                        {
                            float sumValue8;
                            float sumValue9;
                            if ((fragmentVectorConstants1.packedValues[scalarValue112].z != (-1.0)) || (fragmentVectorConstants1.packedValues[scalarValue112].w != (-1.0)))
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                uint bitwiseValue7 = scalarValue19 << 1u;
                                uint sumValue37 = multiplyAddValue38 - bitwiseValue7;
                                float scalarValue20 = rdSignedBitsToFloat2(sumValue37);
                                precise float quotientValue5 = scalarValue20 / multiplyAddValue37;
                                precise float productValue36 = quotientValue5 * quotientValue5;
                                precise float productValue37 = productValue36 * (-0.721347510814666748046875);
                                precise float exponentialValue34 = exp2(productValue37) / productValue31;
                                precise float quotientValue6 = exponentialValue34 / intermediateValue63;
                                float sumValue38 = rdSignedBitsToFloat2(sumValue37 - 1u);
                                precise float quotientValue7 = sumValue38 / multiplyAddValue37;
                                precise float productValue38 = quotientValue7 * quotientValue7;
                                precise float productValue39 = productValue38 * (-0.721347510814666748046875);
                                precise float exponentialValue35 = exp2(productValue39) / productValue31;
                                precise float quotientValue8 = exponentialValue35 / intermediateValue63;
                                precise float comparisonValue5 = quotientValue8 + (comparisonValue4 ? quotientValue6 : scalarValue18);
                                float sumValue39 = rdSignedBitsToFloat2(bitwiseValue7 - multiplyAddValue38);
                                precise float quotientValue9 = quotientValue8 / comparisonValue5;
                                precise float sumValue40 = sumValue39 + quotientValue9;
                                precise float productValue40 = sumValue40 * fragmentVectorConstants1.packedValues[productValue4].y;
                                precise float productValue41 = sumValue40 * fragmentVectorConstants1.packedValues[productValue4].z;
                                intermediateValue109 = comparisonValue5;
                                intermediateValue103 = productValue41;
                                intermediateValue101 = productValue40;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                uint bitwiseValue7 = scalarValue19 << 1u;
                                uint sumValue150 = multiplyAddValue112 - bitwiseValue7;
                                float scalarValue85 = rdSignedBitsToFloat2(sumValue150);
                                float quotientValue24 = scalarValue85 / multiplyAddValue111;
                                float sumValue151 = rdSignedBitsToFloat2(sumValue150 - 1u);
                                float quotientValue25 = sumValue151 / multiplyAddValue111;
                                float exponentialValue36 = (exp2((quotientValue25 * quotientValue25) * (-0.721347510814666748046875)) / productValue142) / intermediateValue57;
                                float exponentialValue37 = exponentialValue36 + (comparisonValue4 ? ((exp2((quotientValue24 * quotientValue24) * (-0.721347510814666748046875)) / productValue142) / intermediateValue57) : scalarValue84);
                                float sumValue152 = rdSignedBitsToFloat2(bitwiseValue7 - multiplyAddValue112);
                                float quotientValue26 = sumValue152 + (exponentialValue36 / exponentialValue37);
                                intermediateValue94 = exponentialValue37;
                                productValue12 = quotientValue26 * fragmentVectorConstants1.packedValues[productValue138].z;
                                productValue11 = quotientValue26 * fragmentVectorConstants1.packedValues[productValue138].y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                sumValue8 = spvNMin(spvNMax(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[scalarValue112].x), fragmentVectorConstants1.packedValues[scalarValue112].x + fragmentVectorConstants1.packedValues[scalarValue112].z);
                                sumValue9 = spvNMin(spvNMax(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[scalarValue112].y), fragmentVectorConstants1.packedValues[scalarValue112].y + fragmentVectorConstants1.packedValues[scalarValue112].w);
#endif
                            }
                            else
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                intermediateValue109 = scalarValue18;
                                intermediateValue103 = scalarValue17;
                                intermediateValue101 = scalarValue16;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                intermediateValue94 = scalarValue84;
                                productValue12 = scalarValue17;
                                productValue11 = scalarValue16;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                sumValue8 = varyingTexCoord1.x;
                                sumValue9 = varyingTexCoord1.y;
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                            precise float sumValue41 = intermediateValue101 + varyingTexCoord1.x;
                            precise float sumValue42 = intermediateValue103 + varyingTexCoord1.y;
                            precise float sumValue43 = varyingTexCoord1.x - intermediateValue101;
                            precise float sumValue44 = varyingTexCoord1.y - intermediateValue103;
                            vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(comparisonValue3 ? spvNMin(sumValue35, spvNMax(sumValue41, fragmentVectorConstants1.packedValues[scalarValue14].x)) : sumValue41, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(comparisonValue3 ? spvNMin(sumValue36, spvNMax(sumValue42, fragmentVectorConstants1.packedValues[scalarValue14].y)) : sumValue42, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                            float scalarValue21 = sampledTextureValue.x;
                            float scalarValue22 = sampledTextureValue.y;
                            float scalarValue23 = sampledTextureValue.z;
                            vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(comparisonValue3 ? spvNMin(sumValue35, spvNMax(sumValue43, fragmentVectorConstants1.packedValues[scalarValue14].x)) : sumValue43, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(comparisonValue3 ? spvNMin(sumValue36, spvNMax(sumValue44, fragmentVectorConstants1.packedValues[scalarValue14].y)) : sumValue44, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                            float scalarValue24 = sampledTextureValue1.x;
                            float scalarValue25 = sampledTextureValue1.y;
                            float scalarValue26 = sampledTextureValue1.z;
                            float exponentialValue15;
                            float exponentialValue16;
                            float exponentialValue17;
                            float exponentialValue18;
                            float exponentialValue19;
                            float exponentialValue20;
                            if (bitwiseValue5 != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            float sumValue153 = productValue11 + varyingTexCoord1.x;
                            float sumValue154 = productValue12 + varyingTexCoord1.y;
                            float sumValue155 = varyingTexCoord1.x - productValue11;
                            float sumValue156 = varyingTexCoord1.y - productValue12;
                            vec4 sampledTextureValue10 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(comparisonValue15 ? spvNMin(sumValue148, spvNMax(sumValue153, fragmentVectorConstants1.packedValues[scalarValue82].x)) : sumValue153, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(comparisonValue15 ? spvNMin(sumValue149, spvNMax(sumValue154, fragmentVectorConstants1.packedValues[scalarValue82].y)) : sumValue154, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                            float scalarValue86 = sampledTextureValue10.x;
                            float scalarValue87 = sampledTextureValue10.y;
                            float scalarValue88 = sampledTextureValue10.z;
                            vec4 sampledTextureValue11 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(comparisonValue15 ? spvNMin(sumValue148, spvNMax(sumValue155, fragmentVectorConstants1.packedValues[scalarValue82].x)) : sumValue155, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(comparisonValue15 ? spvNMin(sumValue149, spvNMax(sumValue156, fragmentVectorConstants1.packedValues[scalarValue82].y)) : sumValue156, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                            float scalarValue89 = sampledTextureValue11.x;
                            float scalarValue90 = sampledTextureValue11.y;
                            float scalarValue91 = sampledTextureValue11.z;
                            float exponentialValue15;
                            float exponentialValue16;
                            float exponentialValue17;
                            float exponentialValue18;
                            float exponentialValue19;
                            float exponentialValue20;
                            if (bitwiseValue10 != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            vec4 sampledTextureValue19 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * sumValue8) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * sumValue9) + fragmentVectorConstants1.packedValues[128u].y));
                            float scalarValue127 = sampledTextureValue19.x;
                            float scalarValue128 = sampledTextureValue19.y;
                            float scalarValue129 = sampledTextureValue19.z;
                            float intermediateValue42;
                            float intermediateValue43;
                            float intermediateValue44;
                            if ((sumValue178 & 2u) == 0u)
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                precise float productValue42 = scalarValue21 * 0.077399380505084991455078125;
                                precise float productValue43 = scalarValue22 * 0.077399380505084991455078125;
                                precise float productValue44 = scalarValue23 * 0.077399380505084991455078125;
                                precise float sumValue45 = scalarValue21 + 0.054999999701976776123046875;
                                precise float sumValue46 = scalarValue22 + 0.054999999701976776123046875;
                                precise float sumValue47 = scalarValue23 + 0.054999999701976776123046875;
                                precise float productValue45 = sumValue45 * 0.947867333889007568359375;
                                precise float productValue46 = sumValue46 * 0.947867333889007568359375;
                                precise float productValue47 = sumValue47 * 0.947867333889007568359375;
                                precise float nonlinearValue3 = log2(productValue45) * 2.400000095367431640625;
                                precise float nonlinearValue4 = log2(productValue46) * 2.400000095367431640625;
                                precise float nonlinearValue5 = log2(productValue47) * 2.400000095367431640625;
                                precise float productValue48 = scalarValue24 * 0.077399380505084991455078125;
                                precise float productValue49 = scalarValue25 * 0.077399380505084991455078125;
                                precise float productValue50 = scalarValue26 * 0.077399380505084991455078125;
                                precise float sumValue48 = scalarValue24 + 0.054999999701976776123046875;
                                precise float sumValue49 = scalarValue25 + 0.054999999701976776123046875;
                                precise float sumValue50 = scalarValue26 + 0.054999999701976776123046875;
                                precise float productValue51 = sumValue48 * 0.947867333889007568359375;
                                precise float productValue52 = sumValue49 * 0.947867333889007568359375;
                                precise float productValue53 = sumValue50 * 0.947867333889007568359375;
                                precise float nonlinearValue6 = log2(productValue51) * 2.400000095367431640625;
                                precise float nonlinearValue7 = log2(productValue52) * 2.400000095367431640625;
                                precise float nonlinearValue8 = log2(productValue53) * 2.400000095367431640625;
                                exponentialValue15 = (scalarValue23 > 0.040449999272823333740234375) ? exp2(nonlinearValue5) : productValue44;
                                exponentialValue16 = (scalarValue22 > 0.040449999272823333740234375) ? exp2(nonlinearValue4) : productValue43;
                                exponentialValue17 = (scalarValue21 > 0.040449999272823333740234375) ? exp2(nonlinearValue3) : productValue42;
                                exponentialValue18 = (scalarValue26 > 0.040449999272823333740234375) ? exp2(nonlinearValue8) : productValue50;
                                exponentialValue19 = (scalarValue25 > 0.040449999272823333740234375) ? exp2(nonlinearValue7) : productValue49;
                                exponentialValue20 = (scalarValue24 > 0.040449999272823333740234375) ? exp2(nonlinearValue6) : productValue48;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                exponentialValue15 = (scalarValue88 > 0.040449999272823333740234375) ? exp2(log2((scalarValue88 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue88 * 0.077399380505084991455078125);
                                exponentialValue16 = (scalarValue87 > 0.040449999272823333740234375) ? exp2(log2((scalarValue87 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue87 * 0.077399380505084991455078125);
                                exponentialValue17 = (scalarValue86 > 0.040449999272823333740234375) ? exp2(log2((scalarValue86 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue86 * 0.077399380505084991455078125);
                                exponentialValue18 = (scalarValue91 > 0.040449999272823333740234375) ? exp2(log2((scalarValue91 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue91 * 0.077399380505084991455078125);
                                exponentialValue19 = (scalarValue90 > 0.040449999272823333740234375) ? exp2(log2((scalarValue90 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue90 * 0.077399380505084991455078125);
                                exponentialValue20 = (scalarValue89 > 0.040449999272823333740234375) ? exp2(log2((scalarValue89 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue89 * 0.077399380505084991455078125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float branchMergedValue7;
                                float branchMergedValue21;
                                float branchMergedValue22;
                                if ((sumValue178 & 16u) == 0u)
                                {
                                    branchMergedValue7 = scalarValue129;
                                    branchMergedValue21 = scalarValue128;
                                    branchMergedValue22 = scalarValue127;
                                }
                                else
                                {
                                    float exponentialValue4;
                                    if (!(scalarValue127 <= 0.003130800090730190277099609375))
                                    {
                                        exponentialValue4 = (exp2(log2(scalarValue127) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                    }
                                    else
                                    {
                                        exponentialValue4 = scalarValue127 * 12.9200000762939453125;
                                    }
                                    float exponentialValue6;
                                    if (!(scalarValue128 <= 0.003130800090730190277099609375))
                                    {
                                        exponentialValue6 = (exp2(log2(scalarValue128) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                    }
                                    else
                                    {
                                        exponentialValue6 = scalarValue128 * 12.9200000762939453125;
                                    }
                                    float branchMergedValue58;
                                    float branchMergedValue62;
                                    float branchMergedValue63;
                                    if (!(scalarValue129 <= 0.003130800090730190277099609375))
                                    {
                                        branchMergedValue58 = (exp2(log2(scalarValue129) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                        branchMergedValue62 = exponentialValue6;
                                        branchMergedValue63 = exponentialValue4;
                                    }
                                    else
                                    {
                                        branchMergedValue58 = scalarValue129 * 12.9200000762939453125;
                                        branchMergedValue62 = exponentialValue6;
                                        branchMergedValue63 = exponentialValue4;
                                    }
                                    branchMergedValue7 = branchMergedValue58;
                                    branchMergedValue21 = branchMergedValue62;
                                    branchMergedValue22 = branchMergedValue63;
                                }
                                intermediateValue42 = branchMergedValue22;
                                intermediateValue43 = branchMergedValue21;
                                intermediateValue44 = branchMergedValue7;
#endif
                            }
                            else
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                float multiplyAddValue53;
                                float multiplyAddValue54;
                                float multiplyAddValue55;
                                float multiplyAddValue56;
                                float multiplyAddValue57;
                                float multiplyAddValue58;
                                if (bitwiseValue6 != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                float multiplyAddValue58;
                                float multiplyAddValue59;
                                float multiplyAddValue60;
                                float multiplyAddValue61;
                                float multiplyAddValue62;
                                float multiplyAddValue63;
                                if (bitwiseValue11 != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float exponentialValue3;
                                if (!(scalarValue127 <= 0.040449999272823333740234375))
#endif
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    precise float productValue54 = scalarValue21 * 12.9200000762939453125;
                                    precise float productValue55 = scalarValue22 * 12.9200000762939453125;
                                    precise float productValue56 = scalarValue23 * 12.9200000762939453125;
                                    precise float nonlinearValue9 = log2(scalarValue21) * 0.4166666567325592041015625;
                                    precise float nonlinearValue10 = log2(scalarValue22) * 0.4166666567325592041015625;
                                    precise float nonlinearValue11 = log2(scalarValue23) * 0.4166666567325592041015625;
                                    precise float productValue57 = scalarValue24 * 12.9200000762939453125;
                                    precise float productValue58 = scalarValue25 * 12.9200000762939453125;
                                    precise float productValue59 = scalarValue26 * 12.9200000762939453125;
                                    precise float nonlinearValue12 = log2(scalarValue24) * 0.4166666567325592041015625;
                                    precise float nonlinearValue13 = log2(scalarValue25) * 0.4166666567325592041015625;
                                    precise float nonlinearValue14 = log2(scalarValue26) * 0.4166666567325592041015625;
                                    multiplyAddValue58 = (scalarValue24 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue12), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue57;
                                    multiplyAddValue57 = (scalarValue25 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue13), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue58;
                                    multiplyAddValue56 = (scalarValue26 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue14), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue59;
                                    multiplyAddValue55 = (scalarValue21 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue9), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue54;
                                    multiplyAddValue54 = (scalarValue22 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue10), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue55;
                                    multiplyAddValue53 = (scalarValue23 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue11), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue56;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    multiplyAddValue63 = (scalarValue89 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue89) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue89 * 12.9200000762939453125);
                                    multiplyAddValue62 = (scalarValue90 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue90) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue90 * 12.9200000762939453125);
                                    multiplyAddValue61 = (scalarValue91 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue91) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue91 * 12.9200000762939453125);
                                    multiplyAddValue60 = (scalarValue86 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue86) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue86 * 12.9200000762939453125);
                                    multiplyAddValue59 = (scalarValue87 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue87) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue87 * 12.9200000762939453125);
                                    multiplyAddValue58 = (scalarValue88 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue88) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue88 * 12.9200000762939453125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    exponentialValue3 = exp2(log2((scalarValue127 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
                                }
                                else
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    multiplyAddValue58 = scalarValue24;
                                    multiplyAddValue57 = scalarValue25;
                                    multiplyAddValue56 = scalarValue26;
                                    multiplyAddValue55 = scalarValue21;
                                    multiplyAddValue54 = scalarValue22;
                                    multiplyAddValue53 = scalarValue23;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    multiplyAddValue63 = scalarValue89;
                                    multiplyAddValue62 = scalarValue90;
                                    multiplyAddValue61 = scalarValue91;
                                    multiplyAddValue60 = scalarValue86;
                                    multiplyAddValue59 = scalarValue87;
                                    multiplyAddValue58 = scalarValue88;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    exponentialValue3 = scalarValue127 * 0.077399380505084991455078125;
#endif
                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                exponentialValue15 = multiplyAddValue53;
                                exponentialValue16 = multiplyAddValue54;
                                exponentialValue17 = multiplyAddValue55;
                                exponentialValue18 = multiplyAddValue56;
                                exponentialValue19 = multiplyAddValue57;
                                exponentialValue20 = multiplyAddValue58;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                exponentialValue15 = multiplyAddValue58;
                                exponentialValue16 = multiplyAddValue59;
                                exponentialValue17 = multiplyAddValue60;
                                exponentialValue18 = multiplyAddValue61;
                                exponentialValue19 = multiplyAddValue62;
                                exponentialValue20 = multiplyAddValue63;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float exponentialValue5;
                                if (!(scalarValue128 <= 0.040449999272823333740234375))
                                {
                                    exponentialValue5 = exp2(log2((scalarValue128 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                }
                                else
                                {
                                    exponentialValue5 = scalarValue128 * 0.077399380505084991455078125;
                                }
                                float branchMergedValue8;
                                float branchMergedValue23;
                                float branchMergedValue24;
                                if (!(scalarValue129 <= 0.040449999272823333740234375))
                                {
                                    branchMergedValue8 = exp2(log2((scalarValue129 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                    branchMergedValue23 = exponentialValue5;
                                    branchMergedValue24 = exponentialValue3;
                                }
                                else
                                {
                                    branchMergedValue8 = scalarValue129 * 0.077399380505084991455078125;
                                    branchMergedValue23 = exponentialValue5;
                                    branchMergedValue24 = exponentialValue3;
                                }
                                intermediateValue42 = branchMergedValue24;
                                intermediateValue43 = branchMergedValue23;
                                intermediateValue44 = branchMergedValue8;
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                            precise float sumValue51 = exponentialValue20 + exponentialValue17;
                            precise float sumValue52 = exponentialValue19 + exponentialValue16;
                            precise float sumValue53 = exponentialValue18 + exponentialValue15;
                            precise float sumValue54 = sampledTextureValue1.w + sampledTextureValue.w;
                            multiplyAddValue24 = fma(intermediateValue109, sumValue51, intermediateValue105);
                            multiplyAddValue25 = fma(intermediateValue109, sumValue52, intermediateValue106);
                            multiplyAddValue26 = fma(intermediateValue109, sumValue53, intermediateValue107);
                            multiplyAddValue23 = fma(intermediateValue109, sumValue54, intermediateValue104);
                            sumValue58 = scalarValue19 + 1u;
                            scalarValue16 = intermediateValue101;
                            scalarValue17 = intermediateValue103;
                            intermediateValue104 = multiplyAddValue23;
                            intermediateValue105 = multiplyAddValue24;
                            intermediateValue106 = multiplyAddValue25;
                            intermediateValue107 = multiplyAddValue26;
                            scalarValue18 = intermediateValue109;
                            scalarValue19 = sumValue58;
                            continue;
                        }
                        intermediateValue58 = intermediateValue104;
                        intermediateValue59 = intermediateValue105;
                        intermediateValue60 = intermediateValue106;
                        intermediateValue61 = intermediateValue107;
                        bitwiseValue1 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 12u) >> 2u];
                    }
                    else
                    {
                        float intermediateValue78;
                        float intermediateValue80;
                        float intermediateValue82;
                        float intermediateValue84;
                        float intermediateValue86;
                        if (scalarValue == 7u)
                        {
                            bool conditionValue = (fragmentVectorConstants1.packedValues[productValue4].z != (-1.0)) || (fragmentVectorConstants1.packedValues[productValue4].w != (-1.0));
                            precise float sumValue55 = fragmentVectorConstants1.packedValues[productValue4].z + fragmentVectorConstants1.packedValues[productValue4].x;
                            precise float sumValue56 = fragmentVectorConstants1.packedValues[productValue4].w + fragmentVectorConstants1.packedValues[productValue4].y;
                            vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(conditionValue ? spvNMin(sumValue55, spvNMax(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[productValue4].x)) : varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(conditionValue ? spvNMin(sumValue56, spvNMax(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[productValue4].y)) : varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                            float scalarValue27 = sampledTextureValue2.x;
                            float scalarValue28 = sampledTextureValue2.y;
                            float scalarValue29 = sampledTextureValue2.z;
                            float exponentialValue1;
                            float exponentialValue2;
                            float exponentialValue3;
                            if ((productValue6 & 2u) != 0u)
                            {
                                precise float productValue60 = scalarValue27 * 0.077399380505084991455078125;
                                precise float productValue61 = scalarValue28 * 0.077399380505084991455078125;
                                precise float productValue62 = scalarValue29 * 0.077399380505084991455078125;
                                precise float sumValue57 = scalarValue27 + 0.054999999701976776123046875;
                                precise float sumValue59 = scalarValue28 + 0.054999999701976776123046875;
                                precise float sumValue60 = scalarValue29 + 0.054999999701976776123046875;
                                precise float productValue63 = sumValue57 * 0.947867333889007568359375;
                                precise float productValue64 = sumValue59 * 0.947867333889007568359375;
                                precise float productValue65 = sumValue60 * 0.947867333889007568359375;
                                precise float nonlinearValue15 = log2(productValue63) * 2.400000095367431640625;
                                precise float nonlinearValue16 = log2(productValue64) * 2.400000095367431640625;
                                precise float nonlinearValue17 = log2(productValue65) * 2.400000095367431640625;
                                exponentialValue1 = (scalarValue29 > 0.040449999272823333740234375) ? exp2(nonlinearValue17) : productValue62;
                                exponentialValue2 = (scalarValue28 > 0.040449999272823333740234375) ? exp2(nonlinearValue16) : productValue61;
                                exponentialValue3 = (scalarValue27 > 0.040449999272823333740234375) ? exp2(nonlinearValue15) : productValue60;
                            }
                            else
                            {
                                float multiplyAddValue7;
                                float multiplyAddValue8;
                                float multiplyAddValue9;
                                if ((productValue6 & 16u) != 0u)
                                {
                                    precise float productValue66 = scalarValue27 * 12.9200000762939453125;
                                    precise float productValue67 = scalarValue28 * 12.9200000762939453125;
                                    precise float productValue68 = scalarValue29 * 12.9200000762939453125;
                                    precise float nonlinearValue18 = log2(scalarValue27) * 0.4166666567325592041015625;
                                    precise float nonlinearValue19 = log2(scalarValue28) * 0.4166666567325592041015625;
                                    precise float nonlinearValue20 = log2(scalarValue29) * 0.4166666567325592041015625;
                                    multiplyAddValue9 = (scalarValue27 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue18), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue66;
                                    multiplyAddValue8 = (scalarValue28 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue19), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue67;
                                    multiplyAddValue7 = (scalarValue29 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue20), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue68;
                                }
                                else
                                {
                                    multiplyAddValue9 = scalarValue27;
                                    multiplyAddValue8 = scalarValue28;
                                    multiplyAddValue7 = scalarValue29;
                                }
                                exponentialValue1 = multiplyAddValue7;
                                exponentialValue2 = multiplyAddValue8;
                                exponentialValue3 = multiplyAddValue9;
                            }
                            float scalarValue30 = spvNMax(sampledTextureValue2.w, 9.9999997473787516355514526367188e-06);
                            precise float quotientValue10 = exponentialValue3 / scalarValue30;
                            precise float quotientValue11 = exponentialValue2 / scalarValue30;
                            precise float quotientValue12 = exponentialValue1 / scalarValue30;
                            uint sumValue61 = productValue4 + 5u;
                            vec4 vectorValue8 = vec4(quotientValue10, quotientValue11, quotientValue12, scalarValue30);
                            float sumValue62 = rdDot4Precise2(vectorValue8, fragmentVectorConstants1.packedValues[productValue4 + 1u]);
                            float sumValue63 = rdDot4Precise2(vectorValue8, fragmentVectorConstants1.packedValues[productValue4 + 2u]);
                            float sumValue64 = rdDot4Precise2(vectorValue8, fragmentVectorConstants1.packedValues[productValue4 + 3u]);
                            float sumValue65 = rdDot4Precise2(vectorValue8, fragmentVectorConstants1.packedValues[productValue4 + 4u]);
                            precise float sumValue66 = sumValue62 + fragmentVectorConstants1.packedValues[sumValue61].x;
                            precise float sumValue67 = sumValue63 + fragmentVectorConstants1.packedValues[sumValue61].y;
                            precise float sumValue68 = sumValue64 + fragmentVectorConstants1.packedValues[sumValue61].z;
                            precise float sumValue69 = sumValue65 + fragmentVectorConstants1.packedValues[sumValue61].w;
                            float scalarValue31 = rdDot3Precise(vec3(sumValue66, sumValue67, sumValue68), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                            float scalarValue32 = spvNClamp(scalarValue31, 0.0, 1.0);
                            precise float sumValue70 = sumValue69 - scalarValue32;
                            precise float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 8u) >> 2u], sumValue70, scalarValue32) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 12u) >> 2u];
                            precise float productValue69 = spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * multiplyAddValue70;
                            intermediateValue78 = 1.0;
                            intermediateValue80 = sumValue66;
                            intermediateValue82 = sumValue67;
                            intermediateValue84 = sumValue68;
                            intermediateValue86 = productValue69;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            multiplyAddValue27 = fma(intermediateValue94, exponentialValue20 + exponentialValue17, intermediateValue90);
                            multiplyAddValue28 = fma(intermediateValue94, exponentialValue19 + exponentialValue16, intermediateValue91);
                            multiplyAddValue29 = fma(intermediateValue94, exponentialValue18 + exponentialValue15, intermediateValue92);
                            multiplyAddValue26 = fma(intermediateValue94, sampledTextureValue11.w + sampledTextureValue10.w, intermediateValue89);
                            sumValue23 = scalarValue19 + 1u;
                            scalarValue16 = productValue11;
                            scalarValue17 = productValue12;
                            intermediateValue89 = multiplyAddValue26;
                            intermediateValue90 = multiplyAddValue27;
                            intermediateValue91 = multiplyAddValue28;
                            intermediateValue92 = multiplyAddValue29;
                            scalarValue84 = intermediateValue94;
                            scalarValue19 = sumValue23;
                            continue;
                        }
                        intermediateValue51 = intermediateValue89;
                        intermediateValue52 = intermediateValue90;
                        intermediateValue53 = intermediateValue91;
                        intermediateValue54 = intermediateValue92;
                        bitwiseValue = fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 12u) >> 2u];
                    }
                    else
                    {
                        float intermediateValue71;
                        float intermediateValue73;
                        float intermediateValue75;
                        float intermediateValue77;
                        float multiplyAddValue15;
                        if (scalarValue == 7u)
                        {
                            bool conditionValue1 = (fragmentVectorConstants1.packedValues[productValue138].z != (-1.0)) || (fragmentVectorConstants1.packedValues[productValue138].w != (-1.0));
                            vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(conditionValue1 ? spvNMin(fragmentVectorConstants1.packedValues[productValue138].z + fragmentVectorConstants1.packedValues[productValue138].x, spvNMax(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[productValue138].x)) : varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(conditionValue1 ? spvNMin(fragmentVectorConstants1.packedValues[productValue138].w + fragmentVectorConstants1.packedValues[productValue138].y, spvNMax(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[productValue138].y)) : varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                            float scalarValue92 = sampledTextureValue12.x;
                            float scalarValue93 = sampledTextureValue12.y;
                            float scalarValue94 = sampledTextureValue12.z;
                            float exponentialValue1;
                            float exponentialValue2;
                            float exponentialValue3;
                            if ((productValue139 & 2u) != 0u)
                            {
                                exponentialValue1 = (scalarValue94 > 0.040449999272823333740234375) ? exp2(log2((scalarValue94 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue94 * 0.077399380505084991455078125);
                                exponentialValue2 = (scalarValue93 > 0.040449999272823333740234375) ? exp2(log2((scalarValue93 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue93 * 0.077399380505084991455078125);
                                exponentialValue3 = (scalarValue92 > 0.040449999272823333740234375) ? exp2(log2((scalarValue92 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue92 * 0.077399380505084991455078125);
                            }
                            else
                            {
                                float multiplyAddValue10;
                                float multiplyAddValue11;
                                float multiplyAddValue12;
                                if ((productValue139 & 16u) != 0u)
                                {
                                    multiplyAddValue12 = (scalarValue92 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue92) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue92 * 12.9200000762939453125);
                                    multiplyAddValue11 = (scalarValue93 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue93) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue93 * 12.9200000762939453125);
                                    multiplyAddValue10 = (scalarValue94 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue94) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue94 * 12.9200000762939453125);
                                }
                                else
                                {
                                    multiplyAddValue12 = scalarValue92;
                                    multiplyAddValue11 = scalarValue93;
                                    multiplyAddValue10 = scalarValue94;
                                }
                                exponentialValue1 = multiplyAddValue10;
                                exponentialValue2 = multiplyAddValue11;
                                exponentialValue3 = multiplyAddValue12;
                            }
                            float scalarValue95 = spvNMax(sampledTextureValue12.w, 9.9999997473787516355514526367188e-06);
                            uint sumValue157 = productValue138 + 5u;
                            vec4 quotientValue27 = vec4(exponentialValue3 / scalarValue95, exponentialValue2 / scalarValue95, exponentialValue1 / scalarValue95, scalarValue95);
                            float sumValue158 = rdDot4Precise2(quotientValue27, fragmentVectorConstants1.packedValues[productValue138 + 1u]);
                            float sumValue159 = rdDot4Precise2(quotientValue27, fragmentVectorConstants1.packedValues[productValue138 + 2u]);
                            float sumValue160 = rdDot4Precise2(quotientValue27, fragmentVectorConstants1.packedValues[productValue138 + 3u]);
                            float sumValue161 = rdDot4Precise2(quotientValue27, fragmentVectorConstants1.packedValues[productValue138 + 4u]);
                            float sumValue162 = sumValue158 + fragmentVectorConstants1.packedValues[sumValue157].x;
                            float sumValue163 = sumValue159 + fragmentVectorConstants1.packedValues[sumValue157].y;
                            float sumValue164 = sumValue160 + fragmentVectorConstants1.packedValues[sumValue157].z;
                            float scalarValue96 = rdDot3Precise(vec3(sumValue162, sumValue163, sumValue164), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                            float scalarValue97 = spvNClamp(scalarValue96, 0.0, 1.0);
                            intermediateValue71 = 1.0;
                            intermediateValue73 = sumValue162;
                            intermediateValue75 = sumValue163;
                            intermediateValue77 = sumValue164;
                            multiplyAddValue15 = spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * (fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 8u) >> 2u], (sumValue161 + fragmentVectorConstants1.packedValues[sumValue157].w) - scalarValue97, scalarValue97) * fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 12u) >> 2u]);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            float scalarValue130 = spvNMax(sampledTextureValue19.w, 9.9999997473787516355514526367188e-06);
                            float quotientValue45 = intermediateValue42 / scalarValue130;
                            float quotientValue46 = intermediateValue43 / scalarValue130;
                            float quotientValue47 = intermediateValue44 / scalarValue130;
                            uint sumValue191 = scalarValue112 + 5u;
                            float dotProductValue = dot(vec4(quotientValue45, quotientValue46, quotientValue47, scalarValue130), vec4(fragmentVectorConstants1.packedValues[scalarValue112 + 1u])) + fragmentVectorConstants1.packedValues[sumValue191].x;
                            float dotProductValue1 = dot(vec4(quotientValue45, quotientValue46, quotientValue47, scalarValue130), vec4(fragmentVectorConstants1.packedValues[scalarValue112 + 2u])) + fragmentVectorConstants1.packedValues[sumValue191].y;
                            float dotProductValue2 = dot(vec4(quotientValue45, quotientValue46, quotientValue47, scalarValue130), vec4(fragmentVectorConstants1.packedValues[scalarValue112 + 3u])) + fragmentVectorConstants1.packedValues[sumValue191].z;
                            float productValue158 = spvNClamp(((dotProductValue1 * 0.715200006961822509765625) + (dotProductValue * 0.2125999927520751953125)) + (dotProductValue2 * 0.072200000286102294921875), 0.0, 1.0);
                            branchMergedValue89 = 1.0;
                            branchMergedValue91 = dotProductValue2;
                            branchMergedValue92 = dotProductValue1;
                            branchMergedValue93 = dotProductValue;
                            branchMergedValue94 = (spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentVectorConstants1.packedValues[sumValue177].w) * ((((dot(vec4(quotientValue45, quotientValue46, quotientValue47, scalarValue130), vec4(fragmentVectorConstants1.packedValues[scalarValue112 + 4u])) + fragmentVectorConstants1.packedValues[sumValue191].w) - productValue158) * fragmentVectorConstants1.packedValues[sumValue177].z) + productValue158);
#endif
                        }
                        else
                        {
                            bool comparisonValue7 = scalarValue == 12u;
#if RD_PLATFORM == RD_PLATFORM_SM40
                            float intermediateValue79;
                            float intermediateValue81;
                            float intermediateValue83;
                            float intermediateValue85;
                            float intermediateValue87;
                            if (comparisonValue7 || (scalarValue == 9u))
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            float intermediateValue72;
                            float intermediateValue74;
                            float intermediateValue76;
                            float intermediateValue78;
                            float intermediateValue79;
                            if (comparisonValue7 || (scalarValue == 9u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            float branchMergedValue99;
                            float branchMergedValue100;
                            float branchMergedValue101;
                            float branchMergedValue102;
                            float branchMergedValue103;
                            if ((scalarValue == 9u) || comparisonValue7)
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                precise float scalarValue33 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).x - 0.0625;
                                precise float sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[129u].z, fragmentVectorConstants1.packedValues[129u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[129u].w, fragmentVectorConstants1.packedValues[129u].y))).x - 0.5;
                                precise float sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[130u].z, fragmentVectorConstants1.packedValues[130u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[130u].w, fragmentVectorConstants1.packedValues[130u].y))).x - 0.5;
                                float scalarValue34 = rdDot2Precise2(vec2(scalarValue33, sampledTextureValue5), vec2(1.164000034332275390625, 1.5959999561309814453125));
                                float scalarValue35 = rdDot3Precise(vec3(scalarValue33, sampledTextureValue4, sampledTextureValue5), vec3(1.164000034332275390625, -0.3910000026226043701171875, -0.813000023365020751953125));
                                float scalarValue36 = rdDot2Precise2(vec2(scalarValue33, sampledTextureValue4), vec2(1.164000034332275390625, 2.0179998874664306640625));
                                float exponentialValue4;
                                float exponentialValue5;
                                float exponentialValue6;
                                if ((productValue6 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                float scalarValue98 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).x - 0.0625;
                                float sampledTextureValue13 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[129u].z, fragmentVectorConstants1.packedValues[129u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[129u].w, fragmentVectorConstants1.packedValues[129u].y))).x - 0.5;
                                float sampledTextureValue14 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[130u].z, fragmentVectorConstants1.packedValues[130u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[130u].w, fragmentVectorConstants1.packedValues[130u].y))).x - 0.5;
                                float scalarValue99 = rdDot2Precise2(vec2(scalarValue98, sampledTextureValue14), vec2(1.164000034332275390625, 1.5959999561309814453125));
                                float scalarValue100 = rdDot3Precise(vec3(scalarValue98, sampledTextureValue13, sampledTextureValue14), vec3(1.164000034332275390625, -0.3910000026226043701171875, -0.813000023365020751953125));
                                float scalarValue101 = rdDot2Precise2(vec2(scalarValue98, sampledTextureValue13), vec2(1.164000034332275390625, 2.0179998874664306640625));
                                float exponentialValue4;
                                float exponentialValue5;
                                float exponentialValue6;
                                if ((productValue139 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                vec4 vectorValue24 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y));
                                vec4 sampledTextureValue20 = texture(sampler2D(txBuffer1Texture, txBuffer1Sampler), vec2((fragmentVectorConstants1.packedValues[129u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[129u].x, (fragmentVectorConstants1.packedValues[129u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[129u].y));
                                vec4 sampledTextureValue21 = texture(sampler2D(txBuffer2Texture, txBuffer2Sampler), vec2((fragmentVectorConstants1.packedValues[130u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[130u].x, (fragmentVectorConstants1.packedValues[130u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[130u].y));
                                float sumValue192 = sampledTextureValue20.x + (-0.5);
                                float sumValue193 = sampledTextureValue21.x + (-0.5);
                                float productValue159 = (vectorValue24.x + (-0.0625)) * 1.164000034332275390625;
                                float multiplyAddValue130 = fma(1.5959999561309814453125, sumValue193, productValue159);
                                float multiplyAddValue131 = fma(-0.813000023365020751953125, sumValue193, fma(-0.3910000026226043701171875, sumValue192, productValue159));
                                float multiplyAddValue132 = fma(2.0179998874664306640625, sumValue192, productValue159);
                                float intermediateValue4;
                                float intermediateValue9;
                                float intermediateValue14;
                                if ((sumValue178 & 2u) == 0u)
#endif
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    precise float productValue70 = scalarValue34 * 0.077399380505084991455078125;
                                    precise float productValue71 = scalarValue35 * 0.077399380505084991455078125;
                                    precise float productValue72 = scalarValue36 * 0.077399380505084991455078125;
                                    precise float sumValue71 = scalarValue34 + 0.054999999701976776123046875;
                                    precise float sumValue72 = scalarValue35 + 0.054999999701976776123046875;
                                    precise float sumValue73 = scalarValue36 + 0.054999999701976776123046875;
                                    precise float productValue73 = sumValue71 * 0.947867333889007568359375;
                                    precise float productValue74 = sumValue72 * 0.947867333889007568359375;
                                    precise float productValue75 = sumValue73 * 0.947867333889007568359375;
                                    precise float nonlinearValue21 = log2(productValue73) * 2.400000095367431640625;
                                    precise float nonlinearValue22 = log2(productValue74) * 2.400000095367431640625;
                                    precise float nonlinearValue23 = log2(productValue75) * 2.400000095367431640625;
                                    exponentialValue4 = (scalarValue34 > 0.040449999272823333740234375) ? exp2(nonlinearValue21) : productValue70;
                                    exponentialValue5 = (scalarValue35 > 0.040449999272823333740234375) ? exp2(nonlinearValue22) : productValue71;
                                    exponentialValue6 = (scalarValue36 > 0.040449999272823333740234375) ? exp2(nonlinearValue23) : productValue72;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    exponentialValue4 = (scalarValue99 > 0.040449999272823333740234375) ? exp2(log2((scalarValue99 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue99 * 0.077399380505084991455078125);
                                    exponentialValue5 = (scalarValue100 > 0.040449999272823333740234375) ? exp2(log2((scalarValue100 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue100 * 0.077399380505084991455078125);
                                    exponentialValue6 = (scalarValue101 > 0.040449999272823333740234375) ? exp2(log2((scalarValue101 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue101 * 0.077399380505084991455078125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    float branchMergedValue9;
                                    float branchMergedValue25;
                                    float branchMergedValue26;
                                    if ((sumValue178 & 16u) == 0u)
                                    {
                                        branchMergedValue9 = multiplyAddValue132;
                                        branchMergedValue25 = multiplyAddValue131;
                                        branchMergedValue26 = multiplyAddValue130;
                                    }
                                    else
                                    {
                                        float exponentialValue8;
                                        if (!(multiplyAddValue130 <= 0.003130800090730190277099609375))
                                        {
                                            exponentialValue8 = (exp2(log2(multiplyAddValue130) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                        }
                                        else
                                        {
                                            exponentialValue8 = multiplyAddValue130 * 12.9200000762939453125;
                                        }
                                        float exponentialValue10;
                                        if (!(multiplyAddValue131 <= 0.003130800090730190277099609375))
                                        {
                                            exponentialValue10 = (exp2(log2(multiplyAddValue131) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                        }
                                        else
                                        {
                                            exponentialValue10 = multiplyAddValue131 * 12.9200000762939453125;
                                        }
                                        float branchMergedValue59;
                                        float branchMergedValue64;
                                        float branchMergedValue65;
                                        if (!(multiplyAddValue132 <= 0.003130800090730190277099609375))
                                        {
                                            branchMergedValue59 = (exp2(log2(multiplyAddValue132) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                            branchMergedValue64 = exponentialValue10;
                                            branchMergedValue65 = exponentialValue8;
                                        }
                                        else
                                        {
                                            branchMergedValue59 = multiplyAddValue132 * 12.9200000762939453125;
                                            branchMergedValue64 = exponentialValue10;
                                            branchMergedValue65 = exponentialValue8;
                                        }
                                        branchMergedValue9 = branchMergedValue59;
                                        branchMergedValue25 = branchMergedValue64;
                                        branchMergedValue26 = branchMergedValue65;
                                    }
                                    intermediateValue4 = branchMergedValue26;
                                    intermediateValue9 = branchMergedValue25;
                                    intermediateValue14 = branchMergedValue9;
#endif
                                }
                                else
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    float multiplyAddValue13;
                                    float multiplyAddValue14;
                                    float multiplyAddValue15;
                                    if ((productValue6 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    float multiplyAddValue16;
                                    float multiplyAddValue17;
                                    float multiplyAddValue18;
                                    if ((productValue139 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    float exponentialValue7;
                                    if (!(multiplyAddValue130 <= 0.040449999272823333740234375))
#endif
                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                        precise float productValue76 = scalarValue34 * 12.9200000762939453125;
                                        precise float productValue77 = scalarValue35 * 12.9200000762939453125;
                                        precise float productValue78 = scalarValue36 * 12.9200000762939453125;
                                        precise float nonlinearValue24 = log2(scalarValue34) * 0.4166666567325592041015625;
                                        precise float nonlinearValue25 = log2(scalarValue35) * 0.4166666567325592041015625;
                                        precise float nonlinearValue26 = log2(scalarValue36) * 0.4166666567325592041015625;
                                        multiplyAddValue13 = (scalarValue34 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue24), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue76;
                                        multiplyAddValue14 = (scalarValue35 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue25), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue77;
                                        multiplyAddValue15 = (scalarValue36 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue26), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue78;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                        multiplyAddValue16 = (scalarValue99 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue99) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue99 * 12.9200000762939453125);
                                        multiplyAddValue17 = (scalarValue100 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue100) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue100 * 12.9200000762939453125);
                                        multiplyAddValue18 = (scalarValue101 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue101) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue101 * 12.9200000762939453125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                        exponentialValue7 = exp2(log2((multiplyAddValue130 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
                                    }
                                    else
                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                        multiplyAddValue13 = scalarValue34;
                                        multiplyAddValue14 = scalarValue35;
                                        multiplyAddValue15 = scalarValue36;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                        multiplyAddValue16 = scalarValue99;
                                        multiplyAddValue17 = scalarValue100;
                                        multiplyAddValue18 = scalarValue101;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                        exponentialValue7 = multiplyAddValue130 * 0.077399380505084991455078125;
#endif
                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    exponentialValue4 = multiplyAddValue13;
                                    exponentialValue5 = multiplyAddValue14;
                                    exponentialValue6 = multiplyAddValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    exponentialValue4 = multiplyAddValue16;
                                    exponentialValue5 = multiplyAddValue17;
                                    exponentialValue6 = multiplyAddValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    float exponentialValue9;
                                    if (!(multiplyAddValue131 <= 0.040449999272823333740234375))
                                    {
                                        exponentialValue9 = exp2(log2((multiplyAddValue131 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                    }
                                    else
                                    {
                                        exponentialValue9 = multiplyAddValue131 * 0.077399380505084991455078125;
                                    }
                                    float branchMergedValue10;
                                    float branchMergedValue27;
                                    float branchMergedValue28;
                                    if (!(multiplyAddValue132 <= 0.040449999272823333740234375))
                                    {
                                        branchMergedValue10 = exp2(log2((multiplyAddValue132 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                        branchMergedValue27 = exponentialValue9;
                                        branchMergedValue28 = exponentialValue7;
                                    }
                                    else
                                    {
                                        branchMergedValue10 = multiplyAddValue132 * 0.077399380505084991455078125;
                                        branchMergedValue27 = exponentialValue9;
                                        branchMergedValue28 = exponentialValue7;
                                    }
                                    intermediateValue4 = branchMergedValue28;
                                    intermediateValue9 = branchMergedValue27;
                                    intermediateValue14 = branchMergedValue10;
#endif
                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                float intermediateValue111;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                float sampledTextureValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float branchMergedValue105;
                                float branchMergedValue110;
                                float branchMergedValue111;
                                float branchMergedValue112;
                                float branchMergedValue113;
#endif
                                if (comparisonValue7)
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    precise float bitwiseValue8 = spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 12u) >> 2u];
                                    precise float sampledTextureValue6 = bitwiseValue8 * texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[131u].z, fragmentVectorConstants1.packedValues[131u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[131u].w, fragmentVectorConstants1.packedValues[131u].y))).x;
                                    intermediateValue111 = sampledTextureValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    sampledTextureValue3 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[131u].z, fragmentVectorConstants1.packedValues[131u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[131u].w, fragmentVectorConstants1.packedValues[131u].y))).x * (spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 12u) >> 2u]);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    branchMergedValue105 = 1.0;
                                    branchMergedValue110 = intermediateValue14;
                                    branchMergedValue111 = intermediateValue9;
                                    branchMergedValue112 = intermediateValue4;
                                    branchMergedValue113 = (spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentVectorConstants1.packedValues[sumValue177].w) * texture(sampler2D(txBuffer3Texture, txBuffer3Sampler), vec2((fragmentVectorConstants1.packedValues[131u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[131u].x, (fragmentVectorConstants1.packedValues[131u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[131u].y)).x;
#endif
                                }
                                else
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    intermediateValue111 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    sampledTextureValue3 = fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    branchMergedValue105 = 1.0;
                                    branchMergedValue110 = intermediateValue14;
                                    branchMergedValue111 = intermediateValue9;
                                    branchMergedValue112 = intermediateValue4;
                                    branchMergedValue113 = fragmentVectorConstants1.packedValues[sumValue177].w;
#endif
                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                intermediateValue79 = 1.0;
                                intermediateValue81 = exponentialValue4;
                                intermediateValue83 = exponentialValue5;
                                intermediateValue85 = exponentialValue6;
                                intermediateValue87 = intermediateValue111;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                intermediateValue72 = 1.0;
                                intermediateValue74 = exponentialValue4;
                                intermediateValue76 = exponentialValue5;
                                intermediateValue78 = exponentialValue6;
                                intermediateValue79 = sampledTextureValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                branchMergedValue99 = branchMergedValue105;
                                branchMergedValue100 = branchMergedValue110;
                                branchMergedValue101 = branchMergedValue111;
                                branchMergedValue102 = branchMergedValue112;
                                branchMergedValue103 = branchMergedValue113;
#endif
                            }
                            else
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                float intermediateValue88;
                                float intermediateValue90;
                                float intermediateValue92;
                                float intermediateValue94;
                                float intermediateValue96;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                float intermediateValue80;
                                float intermediateValue81;
                                float intermediateValue82;
                                float intermediateValue83;
                                float productValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float branchMergedValue104;
                                float branchMergedValue106;
                                float branchMergedValue107;
                                float branchMergedValue108;
                                float branchMergedValue109;
#endif
                                if (scalarValue == 11u)
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    float scalarValue37 = rdDot3Precise(vec3(varyingTexCoord1.x, varyingTexCoord1.y, varyingTexCoord1.z), vec3(varyingTexCoord2.x, varyingTexCoord2.y, 1.0));
                                    precise float sumValue74 = 1.0 - spvNMin(abs(scalarValue37), 1.0);
                                    precise float productValue79 = sumValue74 * varyingTexCoord1.w;
                                    intermediateValue88 = fragmentVectorConstants1.packedValues[sumValue].w;
                                    intermediateValue90 = fragmentVectorConstants1.packedValues[sumValue].x;
                                    intermediateValue92 = fragmentVectorConstants1.packedValues[sumValue].y;
                                    intermediateValue94 = fragmentVectorConstants1.packedValues[sumValue].z;
                                    intermediateValue96 = spvNClamp(productValue79, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    float scalarValue37 = rdDot3Precise(vec3(varyingTexCoord1.x, varyingTexCoord1.y, varyingTexCoord1.z), vec3(varyingTexCoord2.x, varyingTexCoord2.y, 1.0));
                                    intermediateValue80 = fragmentVectorConstants1.packedValues[sumValue137].w;
                                    intermediateValue81 = fragmentVectorConstants1.packedValues[sumValue137].x;
                                    intermediateValue82 = fragmentVectorConstants1.packedValues[sumValue137].y;
                                    intermediateValue83 = fragmentVectorConstants1.packedValues[sumValue137].z;
                                    productValue9 = spvNClamp((1.0 - spvNMin(abs(scalarValue37), 1.0)) * varyingTexCoord1.w, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    branchMergedValue104 = fragmentVectorConstants1.packedValues[sumValue177].w;
                                    branchMergedValue106 = fragmentVectorConstants1.packedValues[sumValue177].z;
                                    branchMergedValue107 = fragmentVectorConstants1.packedValues[sumValue177].y;
                                    branchMergedValue108 = fragmentVectorConstants1.packedValues[sumValue177].x;
                                    branchMergedValue109 = spvNClamp((1.0 - spvNClamp(abs(dot(vec3(varyingTexCoord1.x, varyingTexCoord1.y, varyingTexCoord1.z), vec3(varyingTexCoord2.x, varyingTexCoord2.y, 1.0))), 0.0, 1.0)) * varyingTexCoord1.w, 0.0, 1.0);
#endif
                                }
                                else
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    float intermediateValue89;
                                    float intermediateValue91;
                                    float intermediateValue93;
                                    float intermediateValue95;
                                    float intermediateValue97;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    float multiplyAddValue19;
                                    float multiplyAddValue20;
                                    float multiplyAddValue21;
                                    float multiplyAddValue22;
                                    float intermediateValue84;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    float branchMergedValue114;
                                    float branchMergedValue115;
                                    float branchMergedValue116;
                                    float branchMergedValue117;
                                    float branchMergedValue118;
#endif
                                    if (scalarValue == 19u)
                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                        vec4 vectorValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                        float scalarValue38 = vectorValue9.x;
                                        uint sumValue75 = productValue4 + 1u;
                                        uint productValue80 = (productValue4 * 4u) + 1u;
                                        precise float productValue81 = fragmentScalarConstants1.packedValues[productValue80] * 0.5;
                                        float nonlinearValue27 = sqrt(productValue81);
                                        float multiplyAddValue71 = fma(nonlinearValue27, 0.5, -0.89999997615814208984375);
                                        precise float quotientValue13 = fragmentScalarConstants1.packedValues[(productValue4 * 4u) + 2u] / fragmentScalarConstants1.packedValues[productValue80];
                                        precise float productValue82 = nonlinearValue27 * quotientValue13;
                                        float multiplyAddValue72 = spvNClamp(fma(scalarValue38, nonlinearValue27, -fma(productValue82, 0.5, multiplyAddValue71)), 0.0, 1.0);
                                        precise float sumValue76 = fragmentVectorConstants1.packedValues[sumValue].x - fragmentVectorConstants1.packedValues[sumValue75].x;
                                        precise float sumValue77 = fragmentVectorConstants1.packedValues[sumValue].y - fragmentVectorConstants1.packedValues[sumValue75].y;
                                        precise float sumValue78 = fragmentVectorConstants1.packedValues[sumValue].z - fragmentVectorConstants1.packedValues[sumValue75].z;
                                        precise float sumValue79 = fragmentVectorConstants1.packedValues[sumValue].w - fragmentVectorConstants1.packedValues[sumValue75].w;
                                        float multiplyAddValue73 = spvNClamp(fma(scalarValue38, nonlinearValue27, -spvNMax(fma(-productValue82, 0.5, multiplyAddValue71), 0.0)), 0.0, 1.0);
                                        precise float multiplyAddValue74 = multiplyAddValue73 * fma(multiplyAddValue72, sumValue76, fragmentVectorConstants1.packedValues[sumValue75].x);
                                        precise float multiplyAddValue75 = multiplyAddValue73 * fma(multiplyAddValue72, sumValue77, fragmentVectorConstants1.packedValues[sumValue75].y);
                                        precise float multiplyAddValue76 = multiplyAddValue73 * fma(multiplyAddValue72, sumValue78, fragmentVectorConstants1.packedValues[sumValue75].z);
                                        precise float multiplyAddValue77 = multiplyAddValue73 * fma(multiplyAddValue72, sumValue79, fragmentVectorConstants1.packedValues[sumValue75].w);
                                        intermediateValue89 = multiplyAddValue77;
                                        intermediateValue91 = multiplyAddValue74;
                                        intermediateValue93 = multiplyAddValue75;
                                        intermediateValue95 = multiplyAddValue76;
                                        intermediateValue97 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                        vec4 vectorValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                        float scalarValue38 = vectorValue9.x;
                                        uint sumValue165 = productValue138 + 1u;
                                        uint productValue143 = (productValue138 * 4u) + 1u;
                                        float nonlinearValue49 = sqrt(fragmentScalarConstants1.packedValues[productValue143] * 0.5);
                                        float multiplyAddValue114 = fma(nonlinearValue49, 0.5, -0.89999997615814208984375);
                                        float quotientValue28 = nonlinearValue49 * (fragmentScalarConstants1.packedValues[(productValue138 * 4u) + 2u] / fragmentScalarConstants1.packedValues[productValue143]);
                                        float multiplyAddValue115 = spvNClamp(fma(scalarValue38, nonlinearValue49, -fma(quotientValue28, 0.5, multiplyAddValue114)), 0.0, 1.0);
                                        float multiplyAddValue116 = spvNClamp(fma(scalarValue38, nonlinearValue49, -spvNMax(fma(-quotientValue28, 0.5, multiplyAddValue114), 0.0)), 0.0, 1.0);
                                        multiplyAddValue19 = multiplyAddValue116 * fma(multiplyAddValue115, fragmentVectorConstants1.packedValues[sumValue137].w - fragmentVectorConstants1.packedValues[sumValue165].w, fragmentVectorConstants1.packedValues[sumValue165].w);
                                        multiplyAddValue20 = multiplyAddValue116 * fma(multiplyAddValue115, fragmentVectorConstants1.packedValues[sumValue137].x - fragmentVectorConstants1.packedValues[sumValue165].x, fragmentVectorConstants1.packedValues[sumValue165].x);
                                        multiplyAddValue21 = multiplyAddValue116 * fma(multiplyAddValue115, fragmentVectorConstants1.packedValues[sumValue137].y - fragmentVectorConstants1.packedValues[sumValue165].y, fragmentVectorConstants1.packedValues[sumValue165].y);
                                        multiplyAddValue22 = multiplyAddValue116 * fma(multiplyAddValue115, fragmentVectorConstants1.packedValues[sumValue137].z - fragmentVectorConstants1.packedValues[sumValue165].z, fragmentVectorConstants1.packedValues[sumValue165].z);
                                        intermediateValue84 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                        uint scalarValue131 = scalarValue112 + 1u;
                                        float nonlinearValue51 = sqrt(fragmentVectorConstants1.packedValues[scalarValue112].y * 0.5);
                                        float productValue160 = nonlinearValue51 * 0.5;
                                        float sumValue194 = productValue160 + (-0.89999997615814208984375);
                                        float quotientValue48 = productValue160 * (fragmentVectorConstants1.packedValues[scalarValue112].z / fragmentVectorConstants1.packedValues[scalarValue112].y);
                                        float sampledTextureValue22 = nonlinearValue51 * texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y)).x;
                                        float sumValue195 = spvNClamp((sampledTextureValue22 - sumValue194) - quotientValue48, 0.0, 1.0);
                                        float sumValue196 = spvNClamp(sampledTextureValue22 - spvNMax(0.0, sumValue194 - quotientValue48), 0.0, 1.0);
                                        branchMergedValue114 = ((sumValue195 * (fragmentVectorConstants1.packedValues[sumValue177].w - fragmentVectorConstants1.packedValues[scalarValue131].w)) + fragmentVectorConstants1.packedValues[scalarValue131].w) * sumValue196;
                                        branchMergedValue115 = ((sumValue195 * (fragmentVectorConstants1.packedValues[sumValue177].z - fragmentVectorConstants1.packedValues[scalarValue131].z)) + fragmentVectorConstants1.packedValues[scalarValue131].z) * sumValue196;
                                        branchMergedValue116 = ((sumValue195 * (fragmentVectorConstants1.packedValues[sumValue177].y - fragmentVectorConstants1.packedValues[scalarValue131].y)) + fragmentVectorConstants1.packedValues[scalarValue131].y) * sumValue196;
                                        branchMergedValue117 = ((sumValue195 * (fragmentVectorConstants1.packedValues[sumValue177].x - fragmentVectorConstants1.packedValues[scalarValue131].x)) + fragmentVectorConstants1.packedValues[scalarValue131].x) * sumValue196;
                                        branchMergedValue118 = 1.0;
#endif
                                    }
                                    else
                                    {
                                        bool comparisonValue8 = scalarValue == 35u;
#if RD_PLATFORM == RD_PLATFORM_SM40
                                        float multiplyAddValue27;
                                        float intermediateValue112;
                                        float intermediateValue113;
                                        float intermediateValue114;
                                        float intermediateValue115;
                                        if (comparisonValue8 || (scalarValue == 32u))
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                        float comparisonValue6;
                                        float intermediateValue96;
                                        float intermediateValue97;
                                        float intermediateValue98;
                                        float multiplyAddValue30;
                                        if ((scalarValue == 32u) || comparisonValue8)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                        float branchMergedValue119;
                                        float branchMergedValue120;
                                        float branchMergedValue121;
                                        float branchMergedValue122;
                                        float branchMergedValue123;
                                        if ((scalarValue == 32u) || comparisonValue8)
#endif
                                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                            uint scalarValue39 = uint(int(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 0u) >> 2u]));
                                            float intermediateValue122;
                                            float intermediateValue123;
                                            float intermediateValue124;
                                            float intermediateValue125;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                            uint scalarValue102 = uint(int(fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 0u) >> 2u]));
                                            float intermediateValue105;
                                            float intermediateValue106;
                                            float intermediateValue107;
                                            float intermediateValue108;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                            uint scalarValue132 = uint(int(fragmentVectorConstants1.packedValues[sumValue177].x));
                                            float intermediateValue71;
                                            float intermediateValue72;
                                            float intermediateValue73;
                                            float intermediateValue74;
#endif
                                            if (comparisonValue8)
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                vec4 sampledTextureValue7 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[productValue4].z, fract(varyingTexCoord1.z), fragmentVectorConstants1.packedValues[productValue4].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[productValue4].w, fract(varyingTexCoord1.w), fragmentVectorConstants1.packedValues[productValue4].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                intermediateValue122 = sampledTextureValue7.w;
                                                intermediateValue123 = sampledTextureValue7.z;
                                                intermediateValue124 = sampledTextureValue7.y;
                                                intermediateValue125 = sampledTextureValue7.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                vec4 sampledTextureValue15 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[productValue138].z, fract(varyingTexCoord1.z), fragmentVectorConstants1.packedValues[productValue138].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[productValue138].w, fract(varyingTexCoord1.w), fragmentVectorConstants1.packedValues[productValue138].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                intermediateValue105 = sampledTextureValue15.w;
                                                intermediateValue106 = sampledTextureValue15.z;
                                                intermediateValue107 = sampledTextureValue15.y;
                                                intermediateValue108 = sampledTextureValue15.x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                vec4 sampledTextureValue23 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((((fragmentVectorConstants1.packedValues[scalarValue112].z * fract(varyingTexCoord1.z)) + fragmentVectorConstants1.packedValues[scalarValue112].x) * fragmentVectorConstants1.packedValues[128u].z) + fragmentVectorConstants1.packedValues[128u].x, (((fract(varyingTexCoord1.w) * fragmentVectorConstants1.packedValues[scalarValue112].w) + fragmentVectorConstants1.packedValues[scalarValue112].y) * fragmentVectorConstants1.packedValues[128u].w) + fragmentVectorConstants1.packedValues[128u].y));
                                                intermediateValue71 = sampledTextureValue23.x;
                                                intermediateValue72 = sampledTextureValue23.y;
                                                intermediateValue73 = sampledTextureValue23.z;
                                                intermediateValue74 = sampledTextureValue23.w;
#endif
                                            }
                                            else
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.z, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.w, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                intermediateValue122 = sampledTextureValue8.w;
                                                intermediateValue123 = sampledTextureValue8.z;
                                                intermediateValue124 = sampledTextureValue8.y;
                                                intermediateValue125 = sampledTextureValue8.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.z, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.w, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                intermediateValue105 = sampledTextureValue8.w;
                                                intermediateValue106 = sampledTextureValue8.z;
                                                intermediateValue107 = sampledTextureValue8.y;
                                                intermediateValue108 = sampledTextureValue8.x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                vec4 sampledTextureValue24 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.z) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.w) + fragmentVectorConstants1.packedValues[128u].y));
                                                intermediateValue71 = sampledTextureValue24.x;
                                                intermediateValue72 = sampledTextureValue24.y;
                                                intermediateValue73 = sampledTextureValue24.z;
                                                intermediateValue74 = sampledTextureValue24.w;
#endif
                                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                            float exponentialValue12;
                                            float exponentialValue13;
                                            float exponentialValue14;
                                            if ((productValue6 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                            float exponentialValue12;
                                            float exponentialValue13;
                                            float exponentialValue14;
                                            if ((productValue139 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                            float intermediateValue5;
                                            float intermediateValue10;
                                            float intermediateValue15;
                                            if ((sumValue178 & 2u) == 0u)
#endif
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                precise float productValue83 = intermediateValue125 * 0.077399380505084991455078125;
                                                precise float productValue84 = intermediateValue124 * 0.077399380505084991455078125;
                                                precise float productValue85 = intermediateValue123 * 0.077399380505084991455078125;
                                                precise float sumValue80 = intermediateValue125 + 0.054999999701976776123046875;
                                                precise float sumValue81 = intermediateValue124 + 0.054999999701976776123046875;
                                                precise float sumValue82 = intermediateValue123 + 0.054999999701976776123046875;
                                                precise float productValue86 = sumValue80 * 0.947867333889007568359375;
                                                precise float productValue87 = sumValue81 * 0.947867333889007568359375;
                                                precise float productValue88 = sumValue82 * 0.947867333889007568359375;
                                                precise float nonlinearValue28 = log2(productValue86) * 2.400000095367431640625;
                                                precise float nonlinearValue29 = log2(productValue87) * 2.400000095367431640625;
                                                precise float nonlinearValue30 = log2(productValue88) * 2.400000095367431640625;
                                                exponentialValue12 = (intermediateValue123 > 0.040449999272823333740234375) ? exp2(nonlinearValue30) : productValue85;
                                                exponentialValue13 = (intermediateValue124 > 0.040449999272823333740234375) ? exp2(nonlinearValue29) : productValue84;
                                                exponentialValue14 = (intermediateValue125 > 0.040449999272823333740234375) ? exp2(nonlinearValue28) : productValue83;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                exponentialValue12 = (intermediateValue106 > 0.040449999272823333740234375) ? exp2(log2((intermediateValue106 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (intermediateValue106 * 0.077399380505084991455078125);
                                                exponentialValue13 = (intermediateValue107 > 0.040449999272823333740234375) ? exp2(log2((intermediateValue107 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (intermediateValue107 * 0.077399380505084991455078125);
                                                exponentialValue14 = (intermediateValue108 > 0.040449999272823333740234375) ? exp2(log2((intermediateValue108 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (intermediateValue108 * 0.077399380505084991455078125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                float branchMergedValue16;
                                                float branchMergedValue31;
                                                float branchMergedValue32;
                                                if ((sumValue178 & 16u) == 0u)
                                                {
                                                    branchMergedValue16 = intermediateValue73;
                                                    branchMergedValue31 = intermediateValue72;
                                                    branchMergedValue32 = intermediateValue71;
                                                }
                                                else
                                                {
                                                    float exponentialValue26;
                                                    if (!(intermediateValue71 <= 0.003130800090730190277099609375))
                                                    {
                                                        exponentialValue26 = (exp2(log2(intermediateValue71) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue26 = intermediateValue71 * 12.9200000762939453125;
                                                    }
                                                    float exponentialValue28;
                                                    if (!(intermediateValue72 <= 0.003130800090730190277099609375))
                                                    {
                                                        exponentialValue28 = (exp2(log2(intermediateValue72) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue28 = intermediateValue72 * 12.9200000762939453125;
                                                    }
                                                    float branchMergedValue61;
                                                    float branchMergedValue69;
                                                    float branchMergedValue70;
                                                    if (!(intermediateValue73 <= 0.003130800090730190277099609375))
                                                    {
                                                        branchMergedValue61 = (exp2(log2(intermediateValue73) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                        branchMergedValue69 = exponentialValue28;
                                                        branchMergedValue70 = exponentialValue26;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue61 = intermediateValue73 * 12.9200000762939453125;
                                                        branchMergedValue69 = exponentialValue28;
                                                        branchMergedValue70 = exponentialValue26;
                                                    }
                                                    branchMergedValue16 = branchMergedValue61;
                                                    branchMergedValue31 = branchMergedValue69;
                                                    branchMergedValue32 = branchMergedValue70;
                                                }
                                                intermediateValue5 = branchMergedValue32;
                                                intermediateValue10 = branchMergedValue31;
                                                intermediateValue15 = branchMergedValue16;
#endif
                                            }
                                            else
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                float multiplyAddValue43;
                                                float multiplyAddValue44;
                                                float multiplyAddValue45;
                                                if ((productValue6 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                float multiplyAddValue40;
                                                float multiplyAddValue41;
                                                float multiplyAddValue42;
                                                if ((productValue139 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                float exponentialValue25;
                                                if (!(intermediateValue71 <= 0.040449999272823333740234375))
#endif
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    precise float productValue89 = intermediateValue125 * 12.9200000762939453125;
                                                    precise float productValue90 = intermediateValue124 * 12.9200000762939453125;
                                                    precise float productValue91 = intermediateValue123 * 12.9200000762939453125;
                                                    precise float nonlinearValue31 = log2(intermediateValue125) * 0.4166666567325592041015625;
                                                    precise float nonlinearValue32 = log2(intermediateValue124) * 0.4166666567325592041015625;
                                                    precise float nonlinearValue33 = log2(intermediateValue123) * 0.4166666567325592041015625;
                                                    multiplyAddValue45 = (intermediateValue125 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue31), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue89;
                                                    multiplyAddValue44 = (intermediateValue124 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue32), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue90;
                                                    multiplyAddValue43 = (intermediateValue123 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue33), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue91;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    multiplyAddValue42 = (intermediateValue108 > 0.003130800090730190277099609375) ? fma(exp2(log2(intermediateValue108) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (intermediateValue108 * 12.9200000762939453125);
                                                    multiplyAddValue41 = (intermediateValue107 > 0.003130800090730190277099609375) ? fma(exp2(log2(intermediateValue107) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (intermediateValue107 * 12.9200000762939453125);
                                                    multiplyAddValue40 = (intermediateValue106 > 0.003130800090730190277099609375) ? fma(exp2(log2(intermediateValue106) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (intermediateValue106 * 12.9200000762939453125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    exponentialValue25 = exp2(log2((intermediateValue71 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
                                                }
                                                else
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    multiplyAddValue45 = intermediateValue125;
                                                    multiplyAddValue44 = intermediateValue124;
                                                    multiplyAddValue43 = intermediateValue123;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    multiplyAddValue42 = intermediateValue108;
                                                    multiplyAddValue41 = intermediateValue107;
                                                    multiplyAddValue40 = intermediateValue106;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    exponentialValue25 = intermediateValue71 * 0.077399380505084991455078125;
#endif
                                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                exponentialValue12 = multiplyAddValue43;
                                                exponentialValue13 = multiplyAddValue44;
                                                exponentialValue14 = multiplyAddValue45;
                                            }
                                            float scalarValue40 = rdDot3Precise(vec3(exponentialValue14, exponentialValue13, exponentialValue12), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                            float scalarValue41 = spvNClamp(scalarValue40, 0.0, 1.0);
                                            precise float multiplyAddValue78 = fma(float((scalarValue39 & 1u) != 0u), fma(intermediateValue122, -2.0, 1.0), intermediateValue122) - scalarValue41;
                                            float multiplyAddValue79 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 8u) >> 2u], multiplyAddValue78, scalarValue41);
                                            precise float sumValue83 = 1.0 - multiplyAddValue79;
                                            precise float sumValue84 = varyingTexCoord2.x - varyingTexCoord1.x;
                                            precise float sumValue85 = varyingTexCoord2.y - varyingTexCoord1.y;
                                            precise float quotientValue14 = sumValue84 / varyingTexCoord2.z;
                                            precise float quotientValue15 = sumValue85 / fragmentScalarConstants1.packedValues[(bitwiseValue2 * 4u) + 1u];
                                            vec2 vectorValue10 = vec2(quotientValue14, quotientValue15);
                                            float scalarValue42 = rdDot2Precise2(vectorValue10, vectorValue10);
                                            precise float sumValue86 = scalarValue42 - 1.0;
                                            precise float sumValue87 = quotientValue14 + quotientValue14;
                                            precise float sumValue88 = quotientValue15 + quotientValue15;
                                            precise float productValue92 = dFdx(quotientValue14) * sumValue87;
                                            precise float productValue93 = dFdx(quotientValue15) * sumValue88;
                                            precise float sumValue89 = productValue93 + productValue92;
                                            precise float productValue94 = dFdy(-quotientValue14) * sumValue87;
                                            precise float productValue95 = dFdy(-quotientValue15) * sumValue88;
                                            precise float sumValue90 = productValue95 + productValue94;
                                            vec2 vectorValue11 = vec2(sumValue89, sumValue90);
                                            float scalarValue43 = rdDot2Precise2(vectorValue11, vectorValue11);
                                            precise float multiplyAddValue80 = spvNClamp(fma(-sumValue86, inversesqrt(spvNMax(scalarValue43, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 12u) >> 2u];
                                            multiplyAddValue27 = fma(float((scalarValue39 & 2u) != 0u), sumValue83, multiplyAddValue79);
                                            intermediateValue112 = exponentialValue14;
                                            intermediateValue113 = exponentialValue13;
                                            intermediateValue114 = exponentialValue12;
                                            intermediateValue115 = multiplyAddValue80;
                                        }
                                        else
                                        {
                                            float multiplyAddValue49;
                                            float intermediateValue152;
                                            float intermediateValue154;
                                            float intermediateValue156;
                                            float intermediateValue158;
                                            if (scalarValue == 33u)
                                            {
                                                uint scalarValue44 = productValue4 + 1u;
                                                vec4 sampledTextureValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[scalarValue44].z, fract(varyingTexCoord1.z), fragmentVectorConstants1.packedValues[scalarValue44].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[scalarValue44].w, fract(varyingTexCoord1.w), fragmentVectorConstants1.packedValues[scalarValue44].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                float scalarValue45 = sampledTextureValue9.x;
                                                float scalarValue46 = sampledTextureValue9.y;
                                                float scalarValue47 = sampledTextureValue9.z;
                                                float scalarValue48 = sampledTextureValue9.w;
                                                float exponentialValue9;
                                                float exponentialValue10;
                                                float exponentialValue11;
                                                if ((productValue6 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                exponentialValue12 = multiplyAddValue40;
                                                exponentialValue13 = multiplyAddValue41;
                                                exponentialValue14 = multiplyAddValue42;
                                            }
                                            float scalarValue40 = rdDot3Precise(vec3(exponentialValue14, exponentialValue13, exponentialValue12), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                            float scalarValue41 = spvNClamp(scalarValue40, 0.0, 1.0);
                                            float multiplyAddValue117 = fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 8u) >> 2u], (((scalarValue102 & 1u) != 0u) ? (fma(intermediateValue105, -2.0, 1.0) + intermediateValue105) : intermediateValue105) - scalarValue41, scalarValue41);
                                            float quotientValue29 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord2.z;
                                            float quotientValue30 = (varyingTexCoord2.y - varyingTexCoord1.y) / fragmentScalarConstants1.packedValues[(scalarValue70 * 4u) + 1u];
                                            vec2 vectorValue23 = vec2(quotientValue29, quotientValue30);
                                            float scalarValue103 = rdDot2Precise2(vectorValue23, vectorValue23);
                                            float sumValue166 = quotientValue29 + quotientValue29;
                                            float sumValue167 = quotientValue30 + quotientValue30;
                                            vec2 multiplyAddValue118 = vec2(fma(dFdxCoarse(quotientValue30), sumValue167, dFdxCoarse(quotientValue29) * sumValue166), fma(dFdyCoarse(-quotientValue30), sumValue167, dFdyCoarse(-quotientValue29) * sumValue166));
                                            float scalarValue104 = rdDot2Precise2(multiplyAddValue118, multiplyAddValue118);
                                            comparisonValue6 = ((scalarValue102 & 2u) != 0u) ? ((1.0 - multiplyAddValue117) + multiplyAddValue117) : multiplyAddValue117;
                                            intermediateValue96 = exponentialValue14;
                                            intermediateValue97 = exponentialValue13;
                                            intermediateValue98 = exponentialValue12;
                                            multiplyAddValue30 = spvNClamp(fma(1.0 - scalarValue103, inversesqrt(spvNMax(scalarValue104, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 12u) >> 2u];
                                        }
                                        else
                                        {
                                            float multiplyAddValue45;
                                            float intermediateValue129;
                                            float intermediateValue130;
                                            float intermediateValue131;
                                            float multiplyAddValue50;
                                            if (scalarValue == 33u)
                                            {
                                                uint scalarValue105 = productValue138 + 1u;
                                                vec4 sampledTextureValue16 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[scalarValue105].z, fract(varyingTexCoord1.z), fragmentVectorConstants1.packedValues[scalarValue105].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[scalarValue105].w, fract(varyingTexCoord1.w), fragmentVectorConstants1.packedValues[scalarValue105].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                float scalarValue106 = sampledTextureValue16.x;
                                                float scalarValue107 = sampledTextureValue16.y;
                                                float scalarValue108 = sampledTextureValue16.z;
                                                float scalarValue109 = sampledTextureValue16.w;
                                                float exponentialValue9;
                                                float exponentialValue10;
                                                float exponentialValue11;
                                                if ((productValue139 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                float exponentialValue27;
                                                if (!(intermediateValue72 <= 0.040449999272823333740234375))
#endif
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    precise float productValue96 = scalarValue45 * 0.077399380505084991455078125;
                                                    precise float productValue97 = scalarValue46 * 0.077399380505084991455078125;
                                                    precise float productValue98 = scalarValue47 * 0.077399380505084991455078125;
                                                    precise float sumValue91 = scalarValue45 + 0.054999999701976776123046875;
                                                    precise float sumValue92 = scalarValue46 + 0.054999999701976776123046875;
                                                    precise float sumValue93 = scalarValue47 + 0.054999999701976776123046875;
                                                    precise float productValue99 = sumValue91 * 0.947867333889007568359375;
                                                    precise float productValue100 = sumValue92 * 0.947867333889007568359375;
                                                    precise float productValue101 = sumValue93 * 0.947867333889007568359375;
                                                    precise float nonlinearValue34 = log2(productValue99) * 2.400000095367431640625;
                                                    precise float nonlinearValue35 = log2(productValue100) * 2.400000095367431640625;
                                                    precise float nonlinearValue36 = log2(productValue101) * 2.400000095367431640625;
                                                    exponentialValue9 = (scalarValue47 > 0.040449999272823333740234375) ? exp2(nonlinearValue36) : productValue98;
                                                    exponentialValue10 = (scalarValue46 > 0.040449999272823333740234375) ? exp2(nonlinearValue35) : productValue97;
                                                    exponentialValue11 = (scalarValue45 > 0.040449999272823333740234375) ? exp2(nonlinearValue34) : productValue96;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    exponentialValue9 = (scalarValue108 > 0.040449999272823333740234375) ? exp2(log2((scalarValue108 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue108 * 0.077399380505084991455078125);
                                                    exponentialValue10 = (scalarValue107 > 0.040449999272823333740234375) ? exp2(log2((scalarValue107 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue107 * 0.077399380505084991455078125);
                                                    exponentialValue11 = (scalarValue106 > 0.040449999272823333740234375) ? exp2(log2((scalarValue106 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue106 * 0.077399380505084991455078125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    exponentialValue27 = exp2(log2((intermediateValue72 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
                                                }
                                                else
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    float multiplyAddValue31;
                                                    float multiplyAddValue32;
                                                    float multiplyAddValue33;
                                                    if ((productValue6 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    float multiplyAddValue34;
                                                    float multiplyAddValue35;
                                                    float multiplyAddValue36;
                                                    if ((productValue139 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    exponentialValue27 = intermediateValue72 * 0.077399380505084991455078125;
                                                }
                                                float branchMergedValue18;
                                                float branchMergedValue35;
                                                float branchMergedValue36;
                                                if (!(intermediateValue73 <= 0.040449999272823333740234375))
                                                {
                                                    branchMergedValue18 = exp2(log2((intermediateValue73 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                    branchMergedValue35 = exponentialValue27;
                                                    branchMergedValue36 = exponentialValue25;
                                                }
                                                else
                                                {
                                                    branchMergedValue18 = intermediateValue73 * 0.077399380505084991455078125;
                                                    branchMergedValue35 = exponentialValue27;
                                                    branchMergedValue36 = exponentialValue25;
                                                }
                                                intermediateValue5 = branchMergedValue36;
                                                intermediateValue10 = branchMergedValue35;
                                                intermediateValue15 = branchMergedValue18;
                                            }
                                            float productValue161 = spvNClamp(((intermediateValue10 * 0.715200006961822509765625) + (intermediateValue5 * 0.2125999927520751953125)) + (intermediateValue15 * 0.072200000286102294921875), 0.0, 1.0);
                                            float comparisonValue18 = (((((1.0 - (intermediateValue74 * 2.0)) * float((scalarValue132 & 1u) != 0u)) + intermediateValue74) - productValue161) * fragmentVectorConstants1.packedValues[sumValue177].z) + productValue161;
                                            float quotientValue29 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord2.z;
                                            float quotientValue49 = (varyingTexCoord2.y - varyingTexCoord1.y) / fragmentVectorConstants1.packedValues[bitwiseValue12].y;
                                            float productValue162 = ((dFdxCoarse(quotientValue49) * quotientValue49) + (dFdxCoarse(quotientValue29) * quotientValue29)) * 2.0;
                                            float productValue163 = ((dFdyCoarse((-0.0) - quotientValue49) * quotientValue49) + (dFdyCoarse((-0.0) - quotientValue29) * quotientValue29)) * 2.0;
                                            branchMergedValue119 = ((1.0 - comparisonValue18) * float((scalarValue132 & 2u) != 0u)) + comparisonValue18;
                                            branchMergedValue120 = intermediateValue15;
                                            branchMergedValue121 = intermediateValue10;
                                            branchMergedValue122 = intermediateValue5;
                                            branchMergedValue123 = spvNClamp(0.5 - (inversesqrt(spvNMax(dot(vec2(productValue162, productValue163), vec2(productValue162, productValue163)), 9.9999997473787516355514526367188e-05)) * (dot(vec2(quotientValue29, quotientValue49), vec2(quotientValue29, quotientValue49)) + (-1.0))), 0.0, 1.0) * fragmentVectorConstants1.packedValues[sumValue177].w;
                                        }
                                        else
                                        {
                                            float branchMergedValue124;
                                            float branchMergedValue125;
                                            float branchMergedValue126;
                                            float branchMergedValue127;
                                            float branchMergedValue128;
                                            if (scalarValue == 33u)
                                            {
                                                uint scalarValue133 = scalarValue112 + 1u;
                                                vec4 sampledTextureValue25 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * ((fragmentVectorConstants1.packedValues[scalarValue133].z * fract(varyingTexCoord1.z)) + fragmentVectorConstants1.packedValues[scalarValue133].x)) + fragmentVectorConstants1.packedValues[128u].x, (((fract(varyingTexCoord1.w) * fragmentVectorConstants1.packedValues[scalarValue133].w) + fragmentVectorConstants1.packedValues[scalarValue133].y) * fragmentVectorConstants1.packedValues[128u].w) + fragmentVectorConstants1.packedValues[128u].y));
                                                float scalarValue134 = sampledTextureValue25.x;
                                                float scalarValue135 = sampledTextureValue25.y;
                                                float scalarValue136 = sampledTextureValue25.z;
                                                float scalarValue137 = sampledTextureValue25.w;
                                                float intermediateValue6;
                                                float intermediateValue11;
                                                float intermediateValue16;
                                                if ((sumValue178 & 2u) == 0u)
                                                {
                                                    float branchMergedValue15;
                                                    float branchMergedValue29;
                                                    float branchMergedValue30;
                                                    if ((sumValue178 & 16u) == 0u)
#endif
                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                        precise float productValue102 = scalarValue45 * 12.9200000762939453125;
                                                        precise float productValue103 = scalarValue46 * 12.9200000762939453125;
                                                        precise float productValue104 = scalarValue47 * 12.9200000762939453125;
                                                        precise float nonlinearValue37 = log2(scalarValue45) * 0.4166666567325592041015625;
                                                        precise float nonlinearValue38 = log2(scalarValue46) * 0.4166666567325592041015625;
                                                        precise float nonlinearValue39 = log2(scalarValue47) * 0.4166666567325592041015625;
                                                        multiplyAddValue33 = (scalarValue45 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue37), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue102;
                                                        multiplyAddValue32 = (scalarValue46 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue38), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue103;
                                                        multiplyAddValue31 = (scalarValue47 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue39), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue104;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                        multiplyAddValue36 = (scalarValue106 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue106) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue106 * 12.9200000762939453125);
                                                        multiplyAddValue35 = (scalarValue107 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue107) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue107 * 12.9200000762939453125);
                                                        multiplyAddValue34 = (scalarValue108 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue108) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue108 * 12.9200000762939453125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                        branchMergedValue15 = scalarValue136;
                                                        branchMergedValue29 = scalarValue135;
                                                        branchMergedValue30 = scalarValue134;
#endif
                                                    }
                                                    else
                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                        multiplyAddValue33 = scalarValue45;
                                                        multiplyAddValue32 = scalarValue46;
                                                        multiplyAddValue31 = scalarValue47;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                        multiplyAddValue36 = scalarValue106;
                                                        multiplyAddValue35 = scalarValue107;
                                                        multiplyAddValue34 = scalarValue108;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                        float exponentialValue22;
                                                        if (!(scalarValue134 <= 0.003130800090730190277099609375))
                                                        {
                                                            exponentialValue22 = (exp2(log2(scalarValue134) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                        }
                                                        else
                                                        {
                                                            exponentialValue22 = scalarValue134 * 12.9200000762939453125;
                                                        }
                                                        float exponentialValue24;
                                                        if (!(scalarValue135 <= 0.003130800090730190277099609375))
                                                        {
                                                            exponentialValue24 = (exp2(log2(scalarValue135) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                        }
                                                        else
                                                        {
                                                            exponentialValue24 = scalarValue135 * 12.9200000762939453125;
                                                        }
                                                        float branchMergedValue60;
                                                        float branchMergedValue67;
                                                        float branchMergedValue68;
                                                        if (!(scalarValue136 <= 0.003130800090730190277099609375))
                                                        {
                                                            branchMergedValue60 = (exp2(log2(scalarValue136) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                            branchMergedValue67 = exponentialValue24;
                                                            branchMergedValue68 = exponentialValue22;
                                                        }
                                                        else
                                                        {
                                                            branchMergedValue60 = scalarValue136 * 12.9200000762939453125;
                                                            branchMergedValue67 = exponentialValue24;
                                                            branchMergedValue68 = exponentialValue22;
                                                        }
                                                        branchMergedValue15 = branchMergedValue60;
                                                        branchMergedValue29 = branchMergedValue67;
                                                        branchMergedValue30 = branchMergedValue68;
#endif
                                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    exponentialValue9 = multiplyAddValue31;
                                                    exponentialValue10 = multiplyAddValue32;
                                                    exponentialValue11 = multiplyAddValue33;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    exponentialValue9 = multiplyAddValue34;
                                                    exponentialValue10 = multiplyAddValue35;
                                                    exponentialValue11 = multiplyAddValue36;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    intermediateValue6 = branchMergedValue30;
                                                    intermediateValue11 = branchMergedValue29;
                                                    intermediateValue16 = branchMergedValue15;
#endif
                                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                precise float sumValue94 = 1.0 - scalarValue48;
                                                precise float sumValue95 = scalarValue48 - sumValue94;
                                                float scalarValue49 = rdDot3Precise(vec3(exponentialValue11, exponentialValue10, exponentialValue9), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                                float scalarValue50 = spvNClamp(scalarValue49, 0.0, 1.0);
                                                precise float multiplyAddValue81 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 0u) >> 2u], sumValue95, sumValue94) - scalarValue50;
                                                float multiplyAddValue82 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 8u) >> 2u], multiplyAddValue81, scalarValue50);
                                                precise float sumValue96 = 1.0 - multiplyAddValue82;
                                                precise float sumValue97 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                precise float sumValue98 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                vec2 vectorValue12 = vec2(sumValue97, sumValue98);
                                                float scalarValue51 = rdDot2Precise2(vectorValue12, vectorValue12);
                                                precise float nonlinearValue40 = sqrt(scalarValue51) - varyingTexCoord2.z;
                                                precise float multiplyAddValue83 = spvNClamp(fma(-spvNMin(fragmentScalarConstants1.packedValues[productValue4 * 4u], fragmentScalarConstants1.packedValues[(productValue4 * 4u) + 1u]), nonlinearValue40, 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 12u) >> 2u];
                                                multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[(bitwiseValue2 * 4u) + 1u], sumValue96, multiplyAddValue82);
                                                intermediateValue152 = exponentialValue11;
                                                intermediateValue154 = exponentialValue10;
                                                intermediateValue156 = exponentialValue9;
                                                intermediateValue158 = multiplyAddValue83;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                float scalarValue49 = rdDot3Precise(vec3(exponentialValue11, exponentialValue10, exponentialValue9), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                                float scalarValue50 = spvNClamp(scalarValue49, 0.0, 1.0);
                                                float multiplyAddValue119 = fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 8u) >> 2u], fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 0u) >> 2u], (scalarValue109 - 1.0) + scalarValue109, 1.0 - scalarValue109) - scalarValue50, scalarValue50);
                                                vec2 sumValue168 = vec2(varyingTexCoord2.x - varyingTexCoord1.x, varyingTexCoord2.y - varyingTexCoord1.y);
                                                float scalarValue110 = rdDot2Precise2(sumValue168, sumValue168);
                                                multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[(scalarValue70 * 4u) + 1u], 1.0 - multiplyAddValue119, multiplyAddValue119);
                                                intermediateValue129 = exponentialValue11;
                                                intermediateValue130 = exponentialValue10;
                                                intermediateValue131 = exponentialValue9;
                                                multiplyAddValue50 = spvNClamp(fma(-spvNMin(fragmentScalarConstants1.packedValues[productValue138 * 4u], fragmentScalarConstants1.packedValues[(productValue138 * 4u) + 1u]), sqrt(scalarValue110) - varyingTexCoord2.z, 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                else
                                                {
                                                    float exponentialValue21;
                                                    if (!(scalarValue134 <= 0.040449999272823333740234375))
                                                    {
                                                        exponentialValue21 = exp2(log2((scalarValue134 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue21 = scalarValue134 * 0.077399380505084991455078125;
                                                    }
                                                    float exponentialValue23;
                                                    if (!(scalarValue135 <= 0.040449999272823333740234375))
                                                    {
                                                        exponentialValue23 = exp2(log2((scalarValue135 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue23 = scalarValue135 * 0.077399380505084991455078125;
                                                    }
                                                    float branchMergedValue17;
                                                    float branchMergedValue33;
                                                    float branchMergedValue34;
                                                    if (!(scalarValue136 <= 0.040449999272823333740234375))
                                                    {
                                                        branchMergedValue17 = exp2(log2((scalarValue136 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                        branchMergedValue33 = exponentialValue23;
                                                        branchMergedValue34 = exponentialValue21;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue17 = scalarValue136 * 0.077399380505084991455078125;
                                                        branchMergedValue33 = exponentialValue23;
                                                        branchMergedValue34 = exponentialValue21;
                                                    }
                                                    intermediateValue6 = branchMergedValue34;
                                                    intermediateValue11 = branchMergedValue33;
                                                    intermediateValue16 = branchMergedValue17;
                                                }
                                                float sumValue197 = 1.0 - scalarValue137;
                                                float productValue164 = spvNClamp(((intermediateValue11 * 0.715200006961822509765625) + (intermediateValue6 * 0.2125999927520751953125)) + (intermediateValue16 * 0.072200000286102294921875), 0.0, 1.0);
                                                float productValue165 = (((((scalarValue137 - sumValue197) * fragmentVectorConstants1.packedValues[sumValue177].x) + sumValue197) - productValue164) * fragmentVectorConstants1.packedValues[sumValue177].z) + productValue164;
                                                float sumValue198 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                float sumValue199 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                branchMergedValue124 = ((1.0 - productValue165) * fragmentVectorConstants1.packedValues[bitwiseValue12].y) + productValue165;
                                                branchMergedValue125 = intermediateValue16;
                                                branchMergedValue126 = intermediateValue11;
                                                branchMergedValue127 = intermediateValue6;
                                                branchMergedValue128 = spvNClamp(0.5 - ((sqrt((sumValue199 * sumValue199) + (sumValue198 * sumValue198)) - varyingTexCoord2.z) * ((fragmentVectorConstants1.packedValues[scalarValue112].x < fragmentVectorConstants1.packedValues[scalarValue112].y) ? fragmentVectorConstants1.packedValues[scalarValue112].x : fragmentVectorConstants1.packedValues[scalarValue112].y)), 0.0, 1.0) * fragmentVectorConstants1.packedValues[sumValue177].w;
#endif
                                            }
                                            else
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                float intermediateValue151;
                                                float intermediateValue153;
                                                float intermediateValue155;
                                                float intermediateValue157;
                                                float intermediateValue159;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                float multiplyAddValue46;
                                                float multiplyAddValue47;
                                                float multiplyAddValue48;
                                                float multiplyAddValue49;
                                                float intermediateValue132;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                float branchMergedValue129;
                                                float branchMergedValue130;
                                                float branchMergedValue131;
                                                float branchMergedValue132;
                                                float branchMergedValue133;
#endif
                                                if (scalarValue == 23u)
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    vec4 vectorValue13 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                    float scalarValue52 = vectorValue13.x;
                                                    uint productValue105 = productValue4 * 4u;
                                                    uint productValue106 = (productValue4 * 4u) + 2u;
                                                    precise float productValue107 = fragmentScalarConstants1.packedValues[productValue105] * fragmentScalarConstants1.packedValues[productValue106];
                                                    float multiplyAddValue84 = fma(productValue107, 0.5, 0.5);
                                                    float multiplyAddValue85 = fma(-fragmentScalarConstants1.packedValues[productValue106], fragmentScalarConstants1.packedValues[productValue105], multiplyAddValue84);
                                                    precise float sumValue99 = multiplyAddValue85 - fragmentScalarConstants1.packedValues[productValue105];
                                                    precise float sumValue100 = multiplyAddValue85 + fragmentScalarConstants1.packedValues[productValue105];
                                                    precise float sumValue101 = sumValue100 - sumValue99;
                                                    precise float sumValue102 = scalarValue52 - sumValue99;
                                                    precise float quotientValue16 = 1.0 / sumValue101;
                                                    precise float productValue108 = quotientValue16 * sumValue102;
                                                    float scalarValue53 = spvNClamp(productValue108, 0.0, 1.0);
                                                    precise float productValue109 = scalarValue53 * scalarValue53;
                                                    precise float multiplyAddValue86 = productValue109 * fma(scalarValue53, -2.0, 3.0);
                                                    if (multiplyAddValue86 <= 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    vec4 vectorValue13 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                    float scalarValue52 = vectorValue13.x;
                                                    uint productValue144 = productValue138 * 4u;
                                                    uint productValue145 = (productValue138 * 4u) + 2u;
                                                    float multiplyAddValue120 = fma(fragmentScalarConstants1.packedValues[productValue144] * fragmentScalarConstants1.packedValues[productValue145], 0.5, 0.5);
                                                    float multiplyAddValue121 = fma(-fragmentScalarConstants1.packedValues[productValue145], fragmentScalarConstants1.packedValues[productValue144], multiplyAddValue120);
                                                    float sumValue169 = fragmentScalarConstants1.packedValues[productValue144] - multiplyAddValue121;
                                                    float quotientValue31 = spvNClamp((1.0 / (sumValue169 + (multiplyAddValue121 + fragmentScalarConstants1.packedValues[productValue144]))) * (scalarValue52 + sumValue169), 0.0, 1.0);
                                                    float multiplyAddValue122 = (quotientValue31 * quotientValue31) * fma(quotientValue31, -2.0, 3.0);
                                                    if (multiplyAddValue122 <= 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    vec4 vectorValue25 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y));
                                                    uint sumValue200 = scalarValue112 + 1u;
                                                    float productValue166 = fragmentVectorConstants1.packedValues[scalarValue112].z * fragmentVectorConstants1.packedValues[scalarValue112].x;
                                                    float productValue167 = (productValue166 * 0.5) + 0.5;
                                                    float productValue168 = fragmentVectorConstants1.packedValues[scalarValue112].x * 2.0;
                                                    float sumValue201 = fragmentVectorConstants1.packedValues[scalarValue112].x + vectorValue25.x;
                                                    float quotientValue50 = spvNClamp(((sumValue201 + productValue166) - productValue167) / productValue168, 0.0, 1.0);
                                                    float productValue169 = (quotientValue50 * quotientValue50) * (3.0 - (quotientValue50 * 2.0));
                                                    if (!(!(productValue169 <= 0.0)))
#endif
                                                    {
                                                        isFragmentDiscarded = true;
                                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    uint sumValue103 = productValue4 + 1u;
                                                    precise float sumValue104 = multiplyAddValue84 - fragmentScalarConstants1.packedValues[productValue105];
                                                    precise float sumValue105 = multiplyAddValue84 + fragmentScalarConstants1.packedValues[productValue105];
                                                    precise float sumValue106 = sumValue105 - sumValue104;
                                                    precise float sumValue107 = scalarValue52 - sumValue104;
                                                    precise float quotientValue17 = 1.0 / sumValue106;
                                                    precise float productValue110 = quotientValue17 * sumValue107;
                                                    float scalarValue54 = spvNClamp(productValue110, 0.0, 1.0);
                                                    precise float productValue111 = scalarValue54 * scalarValue54;
                                                    precise float multiplyAddValue87 = productValue111 * fma(scalarValue54, -2.0, 3.0);
                                                    precise float sumValue108 = fragmentVectorConstants1.packedValues[sumValue].x - fragmentVectorConstants1.packedValues[sumValue103].x;
                                                    precise float sumValue109 = fragmentVectorConstants1.packedValues[sumValue].y - fragmentVectorConstants1.packedValues[sumValue103].y;
                                                    precise float sumValue110 = fragmentVectorConstants1.packedValues[sumValue].z - fragmentVectorConstants1.packedValues[sumValue103].z;
                                                    precise float sumValue111 = fragmentVectorConstants1.packedValues[sumValue].w - fragmentVectorConstants1.packedValues[sumValue103].w;
                                                    precise float multiplyAddValue88 = multiplyAddValue86 * fma(multiplyAddValue87, sumValue108, fragmentVectorConstants1.packedValues[sumValue103].x);
                                                    precise float multiplyAddValue89 = multiplyAddValue86 * fma(multiplyAddValue87, sumValue109, fragmentVectorConstants1.packedValues[sumValue103].y);
                                                    precise float multiplyAddValue90 = multiplyAddValue86 * fma(multiplyAddValue87, sumValue110, fragmentVectorConstants1.packedValues[sumValue103].z);
                                                    precise float multiplyAddValue91 = multiplyAddValue86 * fma(multiplyAddValue87, sumValue111, fragmentVectorConstants1.packedValues[sumValue103].w);
                                                    intermediateValue151 = multiplyAddValue91;
                                                    intermediateValue153 = multiplyAddValue88;
                                                    intermediateValue155 = multiplyAddValue89;
                                                    intermediateValue157 = multiplyAddValue90;
                                                    intermediateValue159 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    uint sumValue170 = productValue138 + 1u;
                                                    float sumValue171 = fragmentScalarConstants1.packedValues[productValue144] - multiplyAddValue120;
                                                    float quotientValue32 = spvNClamp((1.0 / (sumValue171 + (multiplyAddValue120 + fragmentScalarConstants1.packedValues[productValue144]))) * (scalarValue52 + sumValue171), 0.0, 1.0);
                                                    float multiplyAddValue123 = (quotientValue32 * quotientValue32) * fma(quotientValue32, -2.0, 3.0);
                                                    multiplyAddValue46 = multiplyAddValue122 * fma(multiplyAddValue123, fragmentVectorConstants1.packedValues[sumValue137].w - fragmentVectorConstants1.packedValues[sumValue170].w, fragmentVectorConstants1.packedValues[sumValue170].w);
                                                    multiplyAddValue47 = multiplyAddValue122 * fma(multiplyAddValue123, fragmentVectorConstants1.packedValues[sumValue137].x - fragmentVectorConstants1.packedValues[sumValue170].x, fragmentVectorConstants1.packedValues[sumValue170].x);
                                                    multiplyAddValue48 = multiplyAddValue122 * fma(multiplyAddValue123, fragmentVectorConstants1.packedValues[sumValue137].y - fragmentVectorConstants1.packedValues[sumValue170].y, fragmentVectorConstants1.packedValues[sumValue170].y);
                                                    multiplyAddValue49 = multiplyAddValue122 * fma(multiplyAddValue123, fragmentVectorConstants1.packedValues[sumValue137].z - fragmentVectorConstants1.packedValues[sumValue170].z, fragmentVectorConstants1.packedValues[sumValue170].z);
                                                    intermediateValue132 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    float quotientValue51 = spvNClamp((sumValue201 - productValue167) / productValue168, 0.0, 1.0);
                                                    float productValue170 = (quotientValue51 * quotientValue51) * (3.0 - (quotientValue51 * 2.0));
                                                    branchMergedValue129 = ((productValue170 * (fragmentVectorConstants1.packedValues[sumValue177].w - fragmentVectorConstants1.packedValues[sumValue200].w)) + fragmentVectorConstants1.packedValues[sumValue200].w) * productValue169;
                                                    branchMergedValue130 = ((productValue170 * (fragmentVectorConstants1.packedValues[sumValue177].z - fragmentVectorConstants1.packedValues[sumValue200].z)) + fragmentVectorConstants1.packedValues[sumValue200].z) * productValue169;
                                                    branchMergedValue131 = ((productValue170 * (fragmentVectorConstants1.packedValues[sumValue177].y - fragmentVectorConstants1.packedValues[sumValue200].y)) + fragmentVectorConstants1.packedValues[sumValue200].y) * productValue169;
                                                    branchMergedValue132 = ((productValue170 * (fragmentVectorConstants1.packedValues[sumValue177].x - fragmentVectorConstants1.packedValues[sumValue200].x)) + fragmentVectorConstants1.packedValues[sumValue200].x) * productValue169;
                                                    branchMergedValue133 = 1.0;
#endif
                                                }
                                                else
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    float intermediateValue160;
                                                    float intermediateValue161;
                                                    float intermediateValue162;
                                                    float intermediateValue163;
                                                    float intermediateValue164;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    float productValue15;
                                                    float productValue16;
                                                    float productValue17;
                                                    float productValue18;
                                                    float intermediateValue133;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    float branchMergedValue134;
                                                    float branchMergedValue135;
                                                    float branchMergedValue136;
                                                    float branchMergedValue137;
                                                    float branchMergedValue138;
#endif
                                                    if (scalarValue == 24u)
                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                        vec4 vectorValue14 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[131u].z, fragmentVectorConstants1.packedValues[131u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[131u].w, fragmentVectorConstants1.packedValues[131u].y)));
                                                        float scalarValue55 = vectorValue14.x;
                                                        float scalarValue56 = vectorValue14.y;
                                                        precise float sumValue112 = 0.5 - varyingTexCoord1.z;
                                                        precise float sumValue113 = varyingTexCoord1.z + 0.5;
                                                        precise float sumValue114 = sumValue113 - sumValue112;
                                                        precise float sumValue115 = spvNMax(spvNMin(vectorValue14.z, spvNMax(scalarValue56, scalarValue55)), spvNMin(scalarValue56, scalarValue55)) - sumValue112;
                                                        precise float quotientValue18 = 1.0 / sumValue114;
                                                        precise float productValue112 = quotientValue18 * sumValue115;
                                                        float scalarValue57 = spvNClamp(productValue112, 0.0, 1.0);
                                                        precise float productValue113 = scalarValue57 * scalarValue57;
                                                        precise float multiplyAddValue92 = productValue113 * fma(scalarValue57, -2.0, 3.0);
                                                        precise float productValue114 = multiplyAddValue92 * fragmentVectorConstants1.packedValues[sumValue].x;
                                                        precise float productValue115 = multiplyAddValue92 * fragmentVectorConstants1.packedValues[sumValue].y;
                                                        precise float productValue116 = multiplyAddValue92 * fragmentVectorConstants1.packedValues[sumValue].z;
                                                        precise float productValue117 = multiplyAddValue92 * fragmentVectorConstants1.packedValues[sumValue].w;
                                                        intermediateValue160 = productValue117;
                                                        intermediateValue161 = productValue114;
                                                        intermediateValue162 = productValue115;
                                                        intermediateValue163 = productValue116;
                                                        intermediateValue164 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                        vec4 vectorValue14 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[131u].z, fragmentVectorConstants1.packedValues[131u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[131u].w, fragmentVectorConstants1.packedValues[131u].y)));
                                                        float scalarValue55 = vectorValue14.x;
                                                        float scalarValue56 = vectorValue14.y;
                                                        float sumValue172 = varyingTexCoord1.z - 0.5;
                                                        float quotientValue33 = spvNClamp((1.0 / (sumValue172 + (varyingTexCoord1.z + 0.5))) * (sumValue172 + spvNMax(spvNMin(vectorValue14.z, spvNMax(scalarValue56, scalarValue55)), spvNMin(scalarValue56, scalarValue55))), 0.0, 1.0);
                                                        float multiplyAddValue124 = (quotientValue33 * quotientValue33) * fma(quotientValue33, -2.0, 3.0);
                                                        productValue15 = multiplyAddValue124 * fragmentVectorConstants1.packedValues[sumValue137].w;
                                                        productValue16 = multiplyAddValue124 * fragmentVectorConstants1.packedValues[sumValue137].x;
                                                        productValue17 = multiplyAddValue124 * fragmentVectorConstants1.packedValues[sumValue137].y;
                                                        productValue18 = multiplyAddValue124 * fragmentVectorConstants1.packedValues[sumValue137].z;
                                                        intermediateValue133 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                        vec4 vectorValue26 = texture(sampler2D(txBuffer3Texture, txBuffer3Sampler), vec2((fragmentVectorConstants1.packedValues[131u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[131u].x, (fragmentVectorConstants1.packedValues[131u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[131u].y));
                                                        float scalarValue138 = vectorValue26.x;
                                                        float scalarValue139 = vectorValue26.y;
                                                        float sumValue202 = 0.5 - varyingTexCoord1.z;
                                                        float quotientValue52 = spvNClamp((spvNMax(spvNMin(scalarValue138, scalarValue139), spvNMin(spvNMax(scalarValue138, scalarValue139), vectorValue26.z)) - sumValue202) / ((varyingTexCoord1.z + 0.5) - sumValue202), 0.0, 1.0);
                                                        float productValue171 = (quotientValue52 * quotientValue52) * (3.0 - (quotientValue52 * 2.0));
                                                        branchMergedValue134 = productValue171 * fragmentVectorConstants1.packedValues[sumValue177].w;
                                                        branchMergedValue135 = productValue171 * fragmentVectorConstants1.packedValues[sumValue177].z;
                                                        branchMergedValue136 = productValue171 * fragmentVectorConstants1.packedValues[sumValue177].y;
                                                        branchMergedValue137 = productValue171 * fragmentVectorConstants1.packedValues[sumValue177].x;
                                                        branchMergedValue138 = 1.0;
#endif
                                                    }
                                                    else
                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                        float intermediateValue165;
                                                        float intermediateValue166;
                                                        float intermediateValue167;
                                                        float intermediateValue168;
                                                        float intermediateValue169;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                        float multiplyAddValue51;
                                                        float multiplyAddValue52;
                                                        float multiplyAddValue53;
                                                        float multiplyAddValue54;
                                                        float intermediateValue134;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                        float branchMergedValue139;
                                                        float branchMergedValue140;
                                                        float branchMergedValue141;
                                                        float branchMergedValue142;
                                                        float branchMergedValue143;
#endif
                                                        if (scalarValue == 25u)
                                                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                            vec4 vectorValue15 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                            float scalarValue58 = vectorValue15.x;
                                                            float scalarValue59 = vectorValue15.y;
                                                            uint productValue118 = productValue4 * 4u;
                                                            uint productValue119 = (productValue4 * 4u) + 2u;
                                                            precise float productValue120 = fragmentScalarConstants1.packedValues[productValue118] * fragmentScalarConstants1.packedValues[productValue119];
                                                            float multiplyAddValue93 = fma(productValue120, 0.5, 0.5);
                                                            float multiplyAddValue94 = fma(-fragmentScalarConstants1.packedValues[productValue119], fragmentScalarConstants1.packedValues[productValue118], multiplyAddValue93);
                                                            float scalarValue60 = spvNMax(spvNMin(vectorValue15.z, spvNMax(scalarValue59, scalarValue58)), spvNMin(scalarValue59, scalarValue58));
                                                            precise float sumValue116 = multiplyAddValue94 - fragmentScalarConstants1.packedValues[productValue118];
                                                            precise float sumValue117 = multiplyAddValue94 + fragmentScalarConstants1.packedValues[productValue118];
                                                            precise float sumValue118 = sumValue117 - sumValue116;
                                                            precise float sumValue119 = scalarValue60 - sumValue116;
                                                            precise float quotientValue19 = 1.0 / sumValue118;
                                                            precise float productValue121 = quotientValue19 * sumValue119;
                                                            float scalarValue61 = spvNClamp(productValue121, 0.0, 1.0);
                                                            precise float productValue122 = scalarValue61 * scalarValue61;
                                                            precise float multiplyAddValue95 = productValue122 * fma(scalarValue61, -2.0, 3.0);
                                                            if (multiplyAddValue95 <= 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                            vec4 vectorValue15 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                            float scalarValue58 = vectorValue15.x;
                                                            float scalarValue59 = vectorValue15.y;
                                                            uint productValue146 = productValue138 * 4u;
                                                            uint productValue147 = (productValue138 * 4u) + 2u;
                                                            float multiplyAddValue125 = fma(fragmentScalarConstants1.packedValues[productValue146] * fragmentScalarConstants1.packedValues[productValue147], 0.5, 0.5);
                                                            float multiplyAddValue126 = fma(-fragmentScalarConstants1.packedValues[productValue147], fragmentScalarConstants1.packedValues[productValue146], multiplyAddValue125);
                                                            float scalarValue60 = spvNMax(spvNMin(vectorValue15.z, spvNMax(scalarValue59, scalarValue58)), spvNMin(scalarValue59, scalarValue58));
                                                            float sumValue173 = fragmentScalarConstants1.packedValues[productValue146] - multiplyAddValue126;
                                                            float quotientValue34 = spvNClamp((1.0 / (sumValue173 + (multiplyAddValue126 + fragmentScalarConstants1.packedValues[productValue146]))) * (sumValue173 + scalarValue60), 0.0, 1.0);
                                                            float multiplyAddValue127 = (quotientValue34 * quotientValue34) * fma(quotientValue34, -2.0, 3.0);
                                                            if (multiplyAddValue127 <= 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                            vec4 vectorValue27 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y));
                                                            float scalarValue140 = vectorValue27.x;
                                                            float scalarValue141 = vectorValue27.y;
                                                            uint sumValue203 = scalarValue112 + 1u;
                                                            float productValue172 = fragmentVectorConstants1.packedValues[scalarValue112].z * fragmentVectorConstants1.packedValues[scalarValue112].x;
                                                            float productValue173 = (productValue172 * 0.5) + 0.5;
                                                            float scalarValue142 = spvNMax(spvNMin(scalarValue140, scalarValue141), spvNMin(spvNMax(scalarValue140, scalarValue141), vectorValue27.z));
                                                            float productValue174 = fragmentVectorConstants1.packedValues[scalarValue112].x * 2.0;
                                                            float quotientValue53 = spvNClamp((((productValue172 + fragmentVectorConstants1.packedValues[scalarValue112].x) - productValue173) + scalarValue142) / productValue174, 0.0, 1.0);
                                                            float productValue175 = (quotientValue53 * quotientValue53) * (3.0 - (quotientValue53 * 2.0));
                                                            if (!(!(productValue175 <= 0.0)))
#endif
                                                            {
                                                                isFragmentDiscarded = true;
                                                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                            uint sumValue120 = productValue4 + 1u;
                                                            precise float sumValue121 = multiplyAddValue93 - fragmentScalarConstants1.packedValues[productValue118];
                                                            precise float sumValue122 = multiplyAddValue93 + fragmentScalarConstants1.packedValues[productValue118];
                                                            precise float sumValue123 = sumValue122 - sumValue121;
                                                            precise float sumValue124 = scalarValue60 - sumValue121;
                                                            precise float quotientValue20 = 1.0 / sumValue123;
                                                            precise float productValue123 = quotientValue20 * sumValue124;
                                                            float scalarValue62 = spvNClamp(productValue123, 0.0, 1.0);
                                                            precise float productValue124 = scalarValue62 * scalarValue62;
                                                            precise float multiplyAddValue96 = productValue124 * fma(scalarValue62, -2.0, 3.0);
                                                            precise float sumValue125 = fragmentVectorConstants1.packedValues[sumValue].x - fragmentVectorConstants1.packedValues[sumValue120].x;
                                                            precise float sumValue126 = fragmentVectorConstants1.packedValues[sumValue].y - fragmentVectorConstants1.packedValues[sumValue120].y;
                                                            precise float sumValue127 = fragmentVectorConstants1.packedValues[sumValue].z - fragmentVectorConstants1.packedValues[sumValue120].z;
                                                            precise float sumValue128 = fragmentVectorConstants1.packedValues[sumValue].w - fragmentVectorConstants1.packedValues[sumValue120].w;
                                                            precise float multiplyAddValue97 = multiplyAddValue95 * fma(multiplyAddValue96, sumValue125, fragmentVectorConstants1.packedValues[sumValue120].x);
                                                            precise float multiplyAddValue98 = multiplyAddValue95 * fma(multiplyAddValue96, sumValue126, fragmentVectorConstants1.packedValues[sumValue120].y);
                                                            precise float multiplyAddValue99 = multiplyAddValue95 * fma(multiplyAddValue96, sumValue127, fragmentVectorConstants1.packedValues[sumValue120].z);
                                                            precise float multiplyAddValue100 = multiplyAddValue95 * fma(multiplyAddValue96, sumValue128, fragmentVectorConstants1.packedValues[sumValue120].w);
                                                            intermediateValue165 = multiplyAddValue100;
                                                            intermediateValue166 = multiplyAddValue97;
                                                            intermediateValue167 = multiplyAddValue98;
                                                            intermediateValue168 = multiplyAddValue99;
                                                            intermediateValue169 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                            uint sumValue174 = productValue138 + 1u;
                                                            float sumValue175 = fragmentScalarConstants1.packedValues[productValue146] - multiplyAddValue125;
                                                            float quotientValue35 = spvNClamp((1.0 / (sumValue175 + (multiplyAddValue125 + fragmentScalarConstants1.packedValues[productValue146]))) * (sumValue175 + scalarValue60), 0.0, 1.0);
                                                            float multiplyAddValue128 = (quotientValue35 * quotientValue35) * fma(quotientValue35, -2.0, 3.0);
                                                            multiplyAddValue51 = multiplyAddValue127 * fma(multiplyAddValue128, fragmentVectorConstants1.packedValues[sumValue137].w - fragmentVectorConstants1.packedValues[sumValue174].w, fragmentVectorConstants1.packedValues[sumValue174].w);
                                                            multiplyAddValue52 = multiplyAddValue127 * fma(multiplyAddValue128, fragmentVectorConstants1.packedValues[sumValue137].x - fragmentVectorConstants1.packedValues[sumValue174].x, fragmentVectorConstants1.packedValues[sumValue174].x);
                                                            multiplyAddValue53 = multiplyAddValue127 * fma(multiplyAddValue128, fragmentVectorConstants1.packedValues[sumValue137].y - fragmentVectorConstants1.packedValues[sumValue174].y, fragmentVectorConstants1.packedValues[sumValue174].y);
                                                            multiplyAddValue54 = multiplyAddValue127 * fma(multiplyAddValue128, fragmentVectorConstants1.packedValues[sumValue137].z - fragmentVectorConstants1.packedValues[sumValue174].z, fragmentVectorConstants1.packedValues[sumValue174].z);
                                                            intermediateValue134 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                            float quotientValue54 = spvNClamp(((fragmentVectorConstants1.packedValues[scalarValue112].x - productValue173) + scalarValue142) / productValue174, 0.0, 1.0);
                                                            float productValue176 = (quotientValue54 * quotientValue54) * (3.0 - (quotientValue54 * 2.0));
                                                            branchMergedValue139 = ((productValue176 * (fragmentVectorConstants1.packedValues[sumValue177].w - fragmentVectorConstants1.packedValues[sumValue203].w)) + fragmentVectorConstants1.packedValues[sumValue203].w) * productValue175;
                                                            branchMergedValue140 = ((productValue176 * (fragmentVectorConstants1.packedValues[sumValue177].z - fragmentVectorConstants1.packedValues[sumValue203].z)) + fragmentVectorConstants1.packedValues[sumValue203].z) * productValue175;
                                                            branchMergedValue141 = ((productValue176 * (fragmentVectorConstants1.packedValues[sumValue177].y - fragmentVectorConstants1.packedValues[sumValue203].y)) + fragmentVectorConstants1.packedValues[sumValue203].y) * productValue175;
                                                            branchMergedValue142 = ((productValue176 * (fragmentVectorConstants1.packedValues[sumValue177].x - fragmentVectorConstants1.packedValues[sumValue203].x)) + fragmentVectorConstants1.packedValues[sumValue203].x) * productValue175;
                                                            branchMergedValue143 = 1.0;
#endif
                                                        }
                                                        else
                                                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                            float multiplyAddValue64;
                                                            float intermediateValue181;
                                                            float intermediateValue182;
                                                            float intermediateValue183;
                                                            float intermediateValue184;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                            float multiplyAddValue65;
                                                            float intermediateValue144;
                                                            float intermediateValue145;
                                                            float intermediateValue146;
                                                            float multiplyAddValue66;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                            float branchMergedValue144;
                                                            float branchMergedValue145;
                                                            float branchMergedValue146;
                                                            float branchMergedValue147;
                                                            float branchMergedValue148;
#endif
                                                            if (scalarValue == 31u)
                                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                vec4 vectorValue16 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.z, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.w, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                                float scalarValue63 = vectorValue16.x;
                                                                float scalarValue64 = vectorValue16.y;
                                                                float scalarValue65 = vectorValue16.z;
                                                                float scalarValue66 = vectorValue16.w;
                                                                float exponentialValue21;
                                                                float exponentialValue22;
                                                                float exponentialValue23;
                                                                if ((productValue6 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                vec4 vectorValue16 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.z, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.w, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                                float scalarValue63 = vectorValue16.x;
                                                                float scalarValue64 = vectorValue16.y;
                                                                float scalarValue65 = vectorValue16.z;
                                                                float scalarValue66 = vectorValue16.w;
                                                                float exponentialValue21;
                                                                float exponentialValue22;
                                                                float exponentialValue23;
                                                                if ((productValue139 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                vec4 vectorValue28 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.z) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.w) + fragmentVectorConstants1.packedValues[128u].y));
                                                                float scalarValue143 = vectorValue28.x;
                                                                float scalarValue144 = vectorValue28.y;
                                                                float scalarValue145 = vectorValue28.z;
                                                                float scalarValue146 = vectorValue28.w;
                                                                float intermediateValue7;
                                                                float intermediateValue12;
                                                                float intermediateValue17;
                                                                if ((sumValue178 & 2u) == 0u)
#endif
                                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                    precise float productValue125 = scalarValue63 * 0.077399380505084991455078125;
                                                                    precise float productValue126 = scalarValue64 * 0.077399380505084991455078125;
                                                                    precise float productValue127 = scalarValue65 * 0.077399380505084991455078125;
                                                                    precise float sumValue129 = scalarValue63 + 0.054999999701976776123046875;
                                                                    precise float sumValue130 = scalarValue64 + 0.054999999701976776123046875;
                                                                    precise float sumValue131 = scalarValue65 + 0.054999999701976776123046875;
                                                                    precise float productValue128 = sumValue129 * 0.947867333889007568359375;
                                                                    precise float productValue129 = sumValue130 * 0.947867333889007568359375;
                                                                    precise float productValue130 = sumValue131 * 0.947867333889007568359375;
                                                                    precise float nonlinearValue41 = log2(productValue128) * 2.400000095367431640625;
                                                                    precise float nonlinearValue42 = log2(productValue129) * 2.400000095367431640625;
                                                                    precise float nonlinearValue43 = log2(productValue130) * 2.400000095367431640625;
                                                                    exponentialValue23 = (scalarValue65 > 0.040449999272823333740234375) ? exp2(nonlinearValue43) : productValue127;
                                                                    exponentialValue22 = (scalarValue64 > 0.040449999272823333740234375) ? exp2(nonlinearValue42) : productValue126;
                                                                    exponentialValue21 = (scalarValue63 > 0.040449999272823333740234375) ? exp2(nonlinearValue41) : productValue125;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                    exponentialValue23 = (scalarValue65 > 0.040449999272823333740234375) ? exp2(log2((scalarValue65 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue65 * 0.077399380505084991455078125);
                                                                    exponentialValue22 = (scalarValue64 > 0.040449999272823333740234375) ? exp2(log2((scalarValue64 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue64 * 0.077399380505084991455078125);
                                                                    exponentialValue21 = (scalarValue63 > 0.040449999272823333740234375) ? exp2(log2((scalarValue63 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue63 * 0.077399380505084991455078125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                    float branchMergedValue19;
                                                                    float branchMergedValue37;
                                                                    float branchMergedValue38;
                                                                    if ((sumValue178 & 16u) == 0u)
                                                                    {
                                                                        branchMergedValue19 = scalarValue145;
                                                                        branchMergedValue37 = scalarValue144;
                                                                        branchMergedValue38 = scalarValue143;
                                                                    }
                                                                    else
                                                                    {
                                                                        float exponentialValue30;
                                                                        if (!(scalarValue143 <= 0.003130800090730190277099609375))
                                                                        {
                                                                            exponentialValue30 = (exp2(log2(scalarValue143) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                                        }
                                                                        else
                                                                        {
                                                                            exponentialValue30 = scalarValue143 * 12.9200000762939453125;
                                                                        }
                                                                        float exponentialValue32;
                                                                        if (!(scalarValue144 <= 0.003130800090730190277099609375))
                                                                        {
                                                                            exponentialValue32 = (exp2(log2(scalarValue144) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                                        }
                                                                        else
                                                                        {
                                                                            exponentialValue32 = scalarValue144 * 12.9200000762939453125;
                                                                        }
                                                                        float branchMergedValue66;
                                                                        float branchMergedValue71;
                                                                        float branchMergedValue72;
                                                                        if (!(scalarValue145 <= 0.003130800090730190277099609375))
                                                                        {
                                                                            branchMergedValue66 = (exp2(log2(scalarValue145) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                                            branchMergedValue71 = exponentialValue32;
                                                                            branchMergedValue72 = exponentialValue30;
                                                                        }
                                                                        else
                                                                        {
                                                                            branchMergedValue66 = scalarValue145 * 12.9200000762939453125;
                                                                            branchMergedValue71 = exponentialValue32;
                                                                            branchMergedValue72 = exponentialValue30;
                                                                        }
                                                                        branchMergedValue19 = branchMergedValue66;
                                                                        branchMergedValue37 = branchMergedValue71;
                                                                        branchMergedValue38 = branchMergedValue72;
                                                                    }
                                                                    intermediateValue7 = branchMergedValue38;
                                                                    intermediateValue12 = branchMergedValue37;
                                                                    intermediateValue17 = branchMergedValue19;
#endif
                                                                }
                                                                else
                                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                    float multiplyAddValue66;
                                                                    float multiplyAddValue67;
                                                                    float multiplyAddValue68;
                                                                    if ((productValue6 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                    float multiplyAddValue67;
                                                                    float multiplyAddValue68;
                                                                    float multiplyAddValue69;
                                                                    if ((productValue139 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                    float exponentialValue29;
                                                                    if (!(scalarValue143 <= 0.040449999272823333740234375))
#endif
                                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                        precise float productValue131 = scalarValue63 * 12.9200000762939453125;
                                                                        precise float productValue132 = scalarValue64 * 12.9200000762939453125;
                                                                        precise float productValue133 = scalarValue65 * 12.9200000762939453125;
                                                                        precise float nonlinearValue44 = log2(scalarValue63) * 0.4166666567325592041015625;
                                                                        precise float nonlinearValue45 = log2(scalarValue64) * 0.4166666567325592041015625;
                                                                        precise float nonlinearValue46 = log2(scalarValue65) * 0.4166666567325592041015625;
                                                                        multiplyAddValue68 = (scalarValue63 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue44), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue131;
                                                                        multiplyAddValue67 = (scalarValue64 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue45), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue132;
                                                                        multiplyAddValue66 = (scalarValue65 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue46), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue133;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                        multiplyAddValue69 = (scalarValue63 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue63) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue63 * 12.9200000762939453125);
                                                                        multiplyAddValue68 = (scalarValue64 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue64) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue64 * 12.9200000762939453125);
                                                                        multiplyAddValue67 = (scalarValue65 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue65) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue65 * 12.9200000762939453125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                        exponentialValue29 = exp2(log2((scalarValue143 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
                                                                    }
                                                                    else
                                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                        multiplyAddValue68 = scalarValue63;
                                                                        multiplyAddValue67 = scalarValue64;
                                                                        multiplyAddValue66 = scalarValue65;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                        multiplyAddValue69 = scalarValue63;
                                                                        multiplyAddValue68 = scalarValue64;
                                                                        multiplyAddValue67 = scalarValue65;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                        exponentialValue29 = scalarValue143 * 0.077399380505084991455078125;
#endif
                                                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                    exponentialValue23 = multiplyAddValue66;
                                                                    exponentialValue22 = multiplyAddValue67;
                                                                    exponentialValue21 = multiplyAddValue68;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                    exponentialValue23 = multiplyAddValue67;
                                                                    exponentialValue22 = multiplyAddValue68;
                                                                    exponentialValue21 = multiplyAddValue69;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                    float exponentialValue31;
                                                                    if (!(scalarValue144 <= 0.040449999272823333740234375))
                                                                    {
                                                                        exponentialValue31 = exp2(log2((scalarValue144 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                                    }
                                                                    else
                                                                    {
                                                                        exponentialValue31 = scalarValue144 * 0.077399380505084991455078125;
                                                                    }
                                                                    float branchMergedValue20;
                                                                    float branchMergedValue39;
                                                                    float branchMergedValue40;
                                                                    if (!(scalarValue145 <= 0.040449999272823333740234375))
                                                                    {
                                                                        branchMergedValue20 = exp2(log2((scalarValue145 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                                        branchMergedValue39 = exponentialValue31;
                                                                        branchMergedValue40 = exponentialValue29;
                                                                    }
                                                                    else
                                                                    {
                                                                        branchMergedValue20 = scalarValue145 * 0.077399380505084991455078125;
                                                                        branchMergedValue39 = exponentialValue31;
                                                                        branchMergedValue40 = exponentialValue29;
                                                                    }
                                                                    intermediateValue7 = branchMergedValue40;
                                                                    intermediateValue12 = branchMergedValue39;
                                                                    intermediateValue17 = branchMergedValue20;
#endif
                                                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                precise float sumValue132 = 1.0 - scalarValue66;
                                                                precise float sumValue133 = scalarValue66 - sumValue132;
                                                                float scalarValue67 = rdDot3Precise(vec3(exponentialValue21, exponentialValue22, exponentialValue23), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                                                float scalarValue68 = spvNClamp(scalarValue67, 0.0, 1.0);
                                                                precise float multiplyAddValue101 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 0u) >> 2u], sumValue133, sumValue132) - scalarValue68;
                                                                float multiplyAddValue102 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 8u) >> 2u], multiplyAddValue101, scalarValue68);
                                                                precise float sumValue134 = 1.0 - multiplyAddValue102;
                                                                precise float sumValue135 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                                precise float sumValue136 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                                vec2 vectorValue17 = vec2(sumValue135, sumValue136);
                                                                float scalarValue69 = rdDot2Precise2(vectorValue17, vectorValue17);
                                                                precise float nonlinearValue47 = sqrt(scalarValue69) - varyingTexCoord2.z;
                                                                precise float multiplyAddValue103 = spvNClamp(fma(-spvNMin(fragmentScalarConstants1.packedValues[productValue4 * 4u], fragmentScalarConstants1.packedValues[(productValue4 * 4u) + 1u]), nonlinearValue47, 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue2) + 16u) + 12u) >> 2u];
                                                                multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[(bitwiseValue2 * 4u) + 1u], sumValue134, multiplyAddValue102);
                                                                intermediateValue181 = exponentialValue21;
                                                                intermediateValue182 = exponentialValue22;
                                                                intermediateValue183 = exponentialValue23;
                                                                intermediateValue184 = multiplyAddValue103;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                float scalarValue67 = rdDot3Precise(vec3(exponentialValue21, exponentialValue22, exponentialValue23), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                                                float scalarValue68 = spvNClamp(scalarValue67, 0.0, 1.0);
                                                                float multiplyAddValue129 = fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 8u) >> 2u], fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 0u) >> 2u], (scalarValue66 - 1.0) + scalarValue66, 1.0 - scalarValue66) - scalarValue68, scalarValue68);
                                                                vec2 sumValue176 = vec2(varyingTexCoord2.x - varyingTexCoord1.x, varyingTexCoord2.y - varyingTexCoord1.y);
                                                                float scalarValue111 = rdDot2Precise2(sumValue176, sumValue176);
                                                                multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[(scalarValue70 * 4u) + 1u], 1.0 - multiplyAddValue129, multiplyAddValue129);
                                                                intermediateValue144 = exponentialValue21;
                                                                intermediateValue145 = exponentialValue22;
                                                                intermediateValue146 = exponentialValue23;
                                                                multiplyAddValue66 = spvNClamp(fma(-spvNMin(fragmentScalarConstants1.packedValues[productValue138 * 4u], fragmentScalarConstants1.packedValues[(productValue138 * 4u) + 1u]), sqrt(scalarValue111) - varyingTexCoord2.z, 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * scalarValue70) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                float sumValue204 = 1.0 - scalarValue146;
                                                                float productValue177 = spvNClamp(((intermediateValue12 * 0.715200006961822509765625) + (intermediateValue7 * 0.2125999927520751953125)) + (intermediateValue17 * 0.072200000286102294921875), 0.0, 1.0);
                                                                float productValue178 = (((((scalarValue146 - sumValue204) * fragmentVectorConstants1.packedValues[sumValue177].x) + sumValue204) - productValue177) * fragmentVectorConstants1.packedValues[sumValue177].z) + productValue177;
                                                                float sumValue205 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                                float sumValue206 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                                branchMergedValue144 = ((1.0 - productValue178) * fragmentVectorConstants1.packedValues[bitwiseValue12].y) + productValue178;
                                                                branchMergedValue145 = intermediateValue17;
                                                                branchMergedValue146 = intermediateValue12;
                                                                branchMergedValue147 = intermediateValue7;
                                                                branchMergedValue148 = spvNClamp(0.5 - (((fragmentVectorConstants1.packedValues[scalarValue112].x < fragmentVectorConstants1.packedValues[scalarValue112].y) ? fragmentVectorConstants1.packedValues[scalarValue112].x : fragmentVectorConstants1.packedValues[scalarValue112].y) * (sqrt((sumValue206 * sumValue206) + (sumValue205 * sumValue205)) - varyingTexCoord2.z)), 0.0, 1.0) * fragmentVectorConstants1.packedValues[sumValue177].w;
#endif
                                                            }
                                                            else
                                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                multiplyAddValue64 = fragmentVectorConstants1.packedValues[sumValue].w;
                                                                intermediateValue181 = fragmentVectorConstants1.packedValues[sumValue].x;
                                                                intermediateValue182 = fragmentVectorConstants1.packedValues[sumValue].y;
                                                                intermediateValue183 = fragmentVectorConstants1.packedValues[sumValue].z;
                                                                intermediateValue184 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                multiplyAddValue65 = fragmentVectorConstants1.packedValues[sumValue137].w;
                                                                intermediateValue144 = fragmentVectorConstants1.packedValues[sumValue137].x;
                                                                intermediateValue145 = fragmentVectorConstants1.packedValues[sumValue137].y;
                                                                intermediateValue146 = fragmentVectorConstants1.packedValues[sumValue137].z;
                                                                multiplyAddValue66 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                branchMergedValue144 = fragmentVectorConstants1.packedValues[sumValue177].w;
                                                                branchMergedValue145 = fragmentVectorConstants1.packedValues[sumValue177].z;
                                                                branchMergedValue146 = fragmentVectorConstants1.packedValues[sumValue177].y;
                                                                branchMergedValue147 = fragmentVectorConstants1.packedValues[sumValue177].x;
                                                                branchMergedValue148 = 1.0;
#endif
                                                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                            intermediateValue165 = multiplyAddValue64;
                                                            intermediateValue166 = intermediateValue181;
                                                            intermediateValue167 = intermediateValue182;
                                                            intermediateValue168 = intermediateValue183;
                                                            intermediateValue169 = intermediateValue184;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                            multiplyAddValue51 = multiplyAddValue65;
                                                            multiplyAddValue52 = intermediateValue144;
                                                            multiplyAddValue53 = intermediateValue145;
                                                            multiplyAddValue54 = intermediateValue146;
                                                            intermediateValue134 = multiplyAddValue66;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                            branchMergedValue139 = branchMergedValue144;
                                                            branchMergedValue140 = branchMergedValue145;
                                                            branchMergedValue141 = branchMergedValue146;
                                                            branchMergedValue142 = branchMergedValue147;
                                                            branchMergedValue143 = branchMergedValue148;
#endif
                                                        }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                        intermediateValue160 = intermediateValue165;
                                                        intermediateValue161 = intermediateValue166;
                                                        intermediateValue162 = intermediateValue167;
                                                        intermediateValue163 = intermediateValue168;
                                                        intermediateValue164 = intermediateValue169;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                        productValue15 = multiplyAddValue51;
                                                        productValue16 = multiplyAddValue52;
                                                        productValue17 = multiplyAddValue53;
                                                        productValue18 = multiplyAddValue54;
                                                        intermediateValue133 = intermediateValue134;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                        branchMergedValue134 = branchMergedValue139;
                                                        branchMergedValue135 = branchMergedValue140;
                                                        branchMergedValue136 = branchMergedValue141;
                                                        branchMergedValue137 = branchMergedValue142;
                                                        branchMergedValue138 = branchMergedValue143;
#endif
                                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    intermediateValue151 = intermediateValue160;
                                                    intermediateValue153 = intermediateValue161;
                                                    intermediateValue155 = intermediateValue162;
                                                    intermediateValue157 = intermediateValue163;
                                                    intermediateValue159 = intermediateValue164;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    multiplyAddValue46 = productValue15;
                                                    multiplyAddValue47 = productValue16;
                                                    multiplyAddValue48 = productValue17;
                                                    multiplyAddValue49 = productValue18;
                                                    intermediateValue132 = intermediateValue133;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    branchMergedValue129 = branchMergedValue134;
                                                    branchMergedValue130 = branchMergedValue135;
                                                    branchMergedValue131 = branchMergedValue136;
                                                    branchMergedValue132 = branchMergedValue137;
                                                    branchMergedValue133 = branchMergedValue138;
#endif
                                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                multiplyAddValue49 = intermediateValue151;
                                                intermediateValue152 = intermediateValue153;
                                                intermediateValue154 = intermediateValue155;
                                                intermediateValue156 = intermediateValue157;
                                                intermediateValue158 = intermediateValue159;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                multiplyAddValue45 = multiplyAddValue46;
                                                intermediateValue129 = multiplyAddValue47;
                                                intermediateValue130 = multiplyAddValue48;
                                                intermediateValue131 = multiplyAddValue49;
                                                multiplyAddValue50 = intermediateValue132;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                branchMergedValue124 = branchMergedValue129;
                                                branchMergedValue125 = branchMergedValue130;
                                                branchMergedValue126 = branchMergedValue131;
                                                branchMergedValue127 = branchMergedValue132;
                                                branchMergedValue128 = branchMergedValue133;
#endif
                                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                            multiplyAddValue27 = multiplyAddValue49;
                                            intermediateValue112 = intermediateValue152;
                                            intermediateValue113 = intermediateValue154;
                                            intermediateValue114 = intermediateValue156;
                                            intermediateValue115 = intermediateValue158;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                            comparisonValue6 = multiplyAddValue45;
                                            intermediateValue96 = intermediateValue129;
                                            intermediateValue97 = intermediateValue130;
                                            intermediateValue98 = intermediateValue131;
                                            multiplyAddValue30 = multiplyAddValue50;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                            branchMergedValue119 = branchMergedValue124;
                                            branchMergedValue120 = branchMergedValue125;
                                            branchMergedValue121 = branchMergedValue126;
                                            branchMergedValue122 = branchMergedValue127;
                                            branchMergedValue123 = branchMergedValue128;
#endif
                                        }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                        intermediateValue89 = multiplyAddValue27;
                                        intermediateValue91 = intermediateValue112;
                                        intermediateValue93 = intermediateValue113;
                                        intermediateValue95 = intermediateValue114;
                                        intermediateValue97 = intermediateValue115;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                        multiplyAddValue19 = comparisonValue6;
                                        multiplyAddValue20 = intermediateValue96;
                                        multiplyAddValue21 = intermediateValue97;
                                        multiplyAddValue22 = intermediateValue98;
                                        intermediateValue84 = multiplyAddValue30;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                        branchMergedValue114 = branchMergedValue119;
                                        branchMergedValue115 = branchMergedValue120;
                                        branchMergedValue116 = branchMergedValue121;
                                        branchMergedValue117 = branchMergedValue122;
                                        branchMergedValue118 = branchMergedValue123;
#endif
                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    intermediateValue88 = intermediateValue89;
                                    intermediateValue90 = intermediateValue91;
                                    intermediateValue92 = intermediateValue93;
                                    intermediateValue94 = intermediateValue95;
                                    intermediateValue96 = intermediateValue97;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    intermediateValue80 = multiplyAddValue19;
                                    intermediateValue81 = multiplyAddValue20;
                                    intermediateValue82 = multiplyAddValue21;
                                    intermediateValue83 = multiplyAddValue22;
                                    productValue9 = intermediateValue84;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    branchMergedValue104 = branchMergedValue114;
                                    branchMergedValue106 = branchMergedValue115;
                                    branchMergedValue107 = branchMergedValue116;
                                    branchMergedValue108 = branchMergedValue117;
                                    branchMergedValue109 = branchMergedValue118;
#endif
                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                intermediateValue79 = intermediateValue88;
                                intermediateValue81 = intermediateValue90;
                                intermediateValue83 = intermediateValue92;
                                intermediateValue85 = intermediateValue94;
                                intermediateValue87 = intermediateValue96;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                intermediateValue72 = intermediateValue80;
                                intermediateValue74 = intermediateValue81;
                                intermediateValue76 = intermediateValue82;
                                intermediateValue78 = intermediateValue83;
                                intermediateValue79 = productValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                branchMergedValue99 = branchMergedValue104;
                                branchMergedValue100 = branchMergedValue106;
                                branchMergedValue101 = branchMergedValue107;
                                branchMergedValue102 = branchMergedValue108;
                                branchMergedValue103 = branchMergedValue109;
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                            intermediateValue78 = intermediateValue79;
                            intermediateValue80 = intermediateValue81;
                            intermediateValue82 = intermediateValue83;
                            intermediateValue84 = intermediateValue85;
                            intermediateValue86 = intermediateValue87;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            intermediateValue71 = intermediateValue72;
                            intermediateValue73 = intermediateValue74;
                            intermediateValue75 = intermediateValue76;
                            intermediateValue77 = intermediateValue78;
                            multiplyAddValue15 = intermediateValue79;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            branchMergedValue89 = branchMergedValue99;
                            branchMergedValue91 = branchMergedValue100;
                            branchMergedValue92 = branchMergedValue101;
                            branchMergedValue93 = branchMergedValue102;
                            branchMergedValue94 = branchMergedValue103;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM40
                        intermediateValue58 = intermediateValue78;
                        intermediateValue59 = intermediateValue80;
                        intermediateValue60 = intermediateValue82;
                        intermediateValue61 = intermediateValue84;
                        bitwiseValue1 = intermediateValue86;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                        intermediateValue51 = intermediateValue71;
                        intermediateValue52 = intermediateValue73;
                        intermediateValue53 = intermediateValue75;
                        intermediateValue54 = intermediateValue77;
                        bitwiseValue = multiplyAddValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        branchMergedValue84 = branchMergedValue89;
                        branchMergedValue85 = branchMergedValue91;
                        branchMergedValue86 = branchMergedValue92;
                        branchMergedValue87 = branchMergedValue93;
                        branchMergedValue88 = branchMergedValue94;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                    intermediateValue43 = intermediateValue58;
                    intermediateValue44 = intermediateValue59;
                    intermediateValue45 = intermediateValue60;
                    intermediateValue46 = intermediateValue61;
                    intermediateValue47 = bitwiseValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue39 = intermediateValue51;
                    intermediateValue40 = intermediateValue52;
                    intermediateValue41 = intermediateValue53;
                    intermediateValue42 = intermediateValue54;
                    multiplyAddValue2 = bitwiseValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue73 = branchMergedValue84;
                    branchMergedValue75 = branchMergedValue85;
                    branchMergedValue76 = branchMergedValue86;
                    branchMergedValue77 = branchMergedValue87;
                    branchMergedValue78 = branchMergedValue88;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                intermediateValue34 = intermediateValue43;
                intermediateValue35 = intermediateValue44;
                intermediateValue36 = intermediateValue45;
                intermediateValue37 = intermediateValue46;
                multiplyAddValue = intermediateValue47;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue31 = intermediateValue39;
                intermediateValue32 = intermediateValue40;
                intermediateValue33 = intermediateValue41;
                intermediateValue34 = intermediateValue42;
                multiplyAddValue = multiplyAddValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue43 = branchMergedValue73;
                branchMergedValue54 = branchMergedValue75;
                branchMergedValue55 = branchMergedValue76;
                branchMergedValue56 = branchMergedValue77;
                branchMergedValue57 = branchMergedValue78;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue30 = intermediateValue34;
            intermediateValue28 = intermediateValue35;
            intermediateValue26 = intermediateValue36;
            intermediateValue24 = intermediateValue37;
            intermediateValue22 = multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue28 = intermediateValue31;
            intermediateValue26 = intermediateValue32;
            intermediateValue24 = intermediateValue33;
            intermediateValue22 = intermediateValue34;
            productValue5 = multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue6 = branchMergedValue43;
            branchMergedValue11 = branchMergedValue54;
            branchMergedValue12 = branchMergedValue55;
            branchMergedValue13 = branchMergedValue56;
            branchMergedValue14 = branchMergedValue57;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue21 = intermediateValue22;
        intermediateValue23 = intermediateValue24;
        intermediateValue25 = intermediateValue26;
        intermediateValue27 = intermediateValue28;
        intermediateValue29 = intermediateValue30;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        nonlinearValue = productValue5;
        intermediateValue21 = intermediateValue22;
        intermediateValue23 = intermediateValue24;
        intermediateValue25 = intermediateValue26;
        intermediateValue27 = intermediateValue28;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        nonlinearValue = branchMergedValue14;
        intermediateValue3 = branchMergedValue13;
        intermediateValue8 = branchMergedValue12;
        intermediateValue13 = branchMergedValue11;
        intermediateValue18 = branchMergedValue6;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue134 = intermediateValue29 * intermediateValue27;
    precise float productValue135 = intermediateValue29 * intermediateValue25;
    precise float productValue136 = intermediateValue29 * intermediateValue23;
    bool comparisonValue9 = (productValue6 & 64u) != 0u;
    precise float comparisonValue10 = intermediateValue21 * (comparisonValue9 ? productValue134 : intermediateValue27);
    precise float comparisonValue11 = intermediateValue21 * (comparisonValue9 ? productValue135 : intermediateValue25);
    precise float comparisonValue12 = intermediateValue21 * (comparisonValue9 ? productValue136 : intermediateValue23);
    precise float productValue137 = intermediateValue21 * intermediateValue29;
    fragmentColor0.x = comparisonValue10;
    fragmentColor0.y = comparisonValue11;
    fragmentColor0.z = comparisonValue12;
    fragmentColor0.w = productValue137;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    bool comparisonValue16 = (productValue139 & 64u) != 0u;
    fragmentColor0.x = nonlinearValue * (comparisonValue16 ? (intermediateValue27 * intermediateValue25) : intermediateValue25);
    fragmentColor0.y = nonlinearValue * (comparisonValue16 ? (intermediateValue27 * intermediateValue23) : intermediateValue23);
    fragmentColor0.z = nonlinearValue * (comparisonValue16 ? (intermediateValue27 * intermediateValue21) : intermediateValue21);
    fragmentColor0.w = nonlinearValue * intermediateValue27;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((sumValue178 & 64u) == 0u)
    {
        intermediateValue20 = intermediateValue3;
        intermediateValue21 = intermediateValue8;
        intermediateValue22 = intermediateValue13;
    }
    else
    {
        intermediateValue20 = intermediateValue18 * intermediateValue3;
        intermediateValue21 = intermediateValue18 * intermediateValue8;
        intermediateValue22 = intermediateValue18 * intermediateValue13;
    }
    fragmentColor0.x = intermediateValue20 * nonlinearValue;
    fragmentColor0.y = intermediateValue21 * nonlinearValue;
    fragmentColor0.z = intermediateValue22 * nonlinearValue;
    fragmentColor0.w = intermediateValue18 * nonlinearValue;
#endif
    discardIfRequested();
}
