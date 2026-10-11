#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / Reproject / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 34
#endif

#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_samplerless_texture_functions : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    if ((gl_LocalInvocationID.x < 5u) && (gl_LocalInvocationID.y < 5u))
    {
        uint bitwiseValue = uint(spvNMin(spvNMax(float(uint(float(((gl_WorkGroupID.x << 2u) & 1073741820u) + gl_LocalInvocationID.x) * ViewCB.packedValues[88u].x)), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x));
        uint bitwiseValue1 = uint(spvNMin(spvNMax(float(uint(float(((gl_WorkGroupID.y << 2u) & 1073741820u) + gl_LocalInvocationID.y) * ViewCB.packedValues[88u].x)), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x));
        intermediateValue[gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 5u)] = uvec4(texelFetch(inputAdaptiveDenoiserPlaneIdentifier, ivec2(uvec2(bitwiseValue, bitwiseValue1)), int(0u))).x;
        vec4 sampledTextureValue = texelFetch(inputAdaptiveDenoiserGradients[0u], ivec2(uvec2(bitwiseValue, bitwiseValue1)), int(0u));
        float scalarValue = sampledTextureValue.y;
        float nonlinearValue = spvNMin(abs(sqrt(spvNMax(scalarValue + sampledTextureValue.x, 9.9999997473787516355514526367188e-05)) - sqrt(scalarValue)) * 10.0, 1.0);
        intermediateValue1[gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 5u)] = spvNMax(1.0 / ((nonlinearValue * nonlinearValue) + 9.9999997473787516355514526367188e-05), 1.0);
    }
    barrier();
    vec4 sampledTextureValue1 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
    float scalarValue1 = sampledTextureValue1.x;
    uint reinterpretedBits = ((floatBitsToUint(RootConstants.packedValues[0u]).x >> 16u) & 255u) + 0u;
    if (scalarValue1 == 65504.0)
    {
        imageStore(outputBufferHistoryLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0039215688593685626983642578125));
        imageStore(outputBufferDiffuseMoments, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(outputBufferSpecularMoments, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(outputBufferReflectionDistance, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
    }
    else
    {
        uvec4 reinterpretedBits1 = floatBitsToUint(ViewCB.packedValues[91u]);
        uint scalarValue2 = reinterpretedBits1.y;
        bool comparisonValue = scalarValue2 == 2u;
        uint intermediateValue6;
        if (comparisonValue)
        {
            intermediateValue6 = gl_GlobalInvocationID.x;
        }
        else
        {
            uint productValue = uint(ViewCB.packedValues[78u].x * 0.5);
            uint reinterpretedBits2 = (((scalarValue2 == 0u) ? floatBitsToUint(ViewCB.packedValues[84u]).z : 0u) + gl_GlobalInvocationID.y) & 1u;
            uint branchMergedValue20;
            if (gl_GlobalInvocationID.x < productValue)
            {
                branchMergedValue20 = ((gl_GlobalInvocationID.x << 1u) | 1u) - reinterpretedBits2;
            }
            else
            {
                branchMergedValue20 = reinterpretedBits2 | ((gl_GlobalInvocationID.x - productValue) << 1u);
            }
            intermediateValue6 = branchMergedValue20;
        }
        float sumValue = float(intermediateValue6) + 0.5;
        float sumValue1 = float(gl_GlobalInvocationID.y) + 0.5;
        float productValue1 = sumValue1 * 2.0;
        uint intermediateValue7;
        if (comparisonValue)
        {
            intermediateValue7 = 0u;
        }
        else
        {
            intermediateValue7 = uint(texelFetch(inputPrimaryThroughput, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).w == 0.0);
        }
        bool comparisonValue1 = intermediateValue7 == 0u;
        uint intermediateValue10;
        uint intermediateValue11;
        uint intermediateValue12;
        uint intermediateValue13;
        if (comparisonValue1)
        {
            uint branchMergedValue21;
            uint branchMergedValue27;
            uint branchMergedValue28;
            uint branchMergedValue29;
            if (comparisonValue)
            {
                branchMergedValue21 = gl_GlobalInvocationID.x;
                branchMergedValue27 = uint(int(ViewCB.packedValues[78u].y));
                branchMergedValue28 = uint(int(ViewCB.packedValues[78u].x));
                branchMergedValue29 = 0u;
            }
            else
            {
                uint scalarValue3 = uint(ViewCB.packedValues[80u].x);
                uint scalarValue4 = uint(ViewCB.packedValues[78u].y);
                uint branchMergedValue54;
                uint branchMergedValue56;
                uint branchMergedValue57;
                uint branchMergedValue58;
                if (gl_GlobalInvocationID.x < scalarValue3)
                {
                    branchMergedValue54 = gl_GlobalInvocationID.x;
                    branchMergedValue56 = scalarValue4;
                    branchMergedValue57 = scalarValue3;
                    branchMergedValue58 = 0u;
                }
                else
                {
                    branchMergedValue54 = gl_GlobalInvocationID.x;
                    branchMergedValue56 = scalarValue4;
                    branchMergedValue57 = uint(ViewCB.packedValues[78u].x);
                    branchMergedValue58 = scalarValue3;
                }
                branchMergedValue21 = branchMergedValue54;
                branchMergedValue27 = branchMergedValue56;
                branchMergedValue28 = branchMergedValue57;
                branchMergedValue29 = branchMergedValue58;
            }
            intermediateValue10 = branchMergedValue21;
            intermediateValue11 = branchMergedValue29;
            intermediateValue12 = branchMergedValue28;
            intermediateValue13 = branchMergedValue27;
        }
        else
        {
            intermediateValue10 = intermediateValue6;
            intermediateValue11 = 0u;
            intermediateValue12 = uint(int(ViewCB.packedValues[78u].x));
            intermediateValue13 = uint(int(ViewCB.packedValues[78u].y));
        }
        float sumValue2 = float(intermediateValue10) + 0.5;
        float sumValue3 = float(int(intermediateValue12 - intermediateValue11));
        float scalarValue5 = float(int(intermediateValue13));
        vec4 sampledTextureValue2 = texelFetch(inputBufferMotionVectors, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue6 = sampledTextureValue2.x;
        float scalarValue7 = sampledTextureValue2.y;
        float productValue2 = scalarValue6 * sumValue3;
        float productValue3 = scalarValue7 * scalarValue5;
        float sumValue4 = (ViewCB.packedValues[81u].z - ViewCB.packedValues[82u].x) + sumValue2;
        float sumValue5 = sumValue4 + productValue2;
        float sumValue6 = (ViewCB.packedValues[81u].w - ViewCB.packedValues[82u].y) + sumValue1;
        float sumValue7 = sumValue6 + productValue3;
        vec4 sampledTextureValue3 = texelFetch(inputBufferReprojectedPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue8 = sampledTextureValue3.x;
        vec4 sampledTextureValue4 = texelFetch(inputGeometryNormal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue9 = sampledTextureValue4.x;
        float scalarValue10 = sampledTextureValue4.y;
        float sumValue8 = 1.0 - abs(scalarValue9);
        float scalarValue11 = abs(scalarValue10);
        float sumValue9 = sumValue8 - scalarValue11;
        bool conditionValue = sumValue9 < 0.0;
        float comparisonValue2 = conditionValue ? ((1.0 - scalarValue11) * ((scalarValue9 >= 0.0) ? 1.0 : (-1.0))) : scalarValue9;
        float comparisonValue3 = conditionValue ? (((scalarValue10 >= 0.0) ? 1.0 : (-1.0)) * sumValue8) : scalarValue10;
        float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue2, comparisonValue3, sumValue9), vec3(comparisonValue2, comparisonValue3, sumValue9)));
        float productValue4 = comparisonValue2 * inverseLengthValue;
        float productValue5 = comparisonValue3 * inverseLengthValue;
        float productValue6 = inverseLengthValue * sumValue9;
        vec4 sampledTextureValue5 = texelFetch(inputBufferNormal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue12 = sampledTextureValue5.x;
        float scalarValue13 = sampledTextureValue5.y;
        float sumValue10 = 1.0 - abs(scalarValue12);
        float scalarValue14 = abs(scalarValue13);
        float sumValue11 = sumValue10 - scalarValue14;
        bool conditionValue1 = sumValue11 < 0.0;
        float comparisonValue4 = conditionValue1 ? ((1.0 - scalarValue14) * ((scalarValue12 >= 0.0) ? 1.0 : (-1.0))) : scalarValue12;
        float comparisonValue5 = conditionValue1 ? (((scalarValue13 >= 0.0) ? 1.0 : (-1.0)) * sumValue10) : scalarValue13;
        float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue4, comparisonValue5, sumValue11), vec3(comparisonValue4, comparisonValue5, sumValue11)));
        float productValue7 = comparisonValue4 * inverseLengthValue1;
        float productValue8 = comparisonValue5 * inverseLengthValue1;
        float productValue9 = inverseLengthValue1 * sumValue11;
        float productValue10 = ((scalarValue6 + (sumValue * ViewCB.packedValues[78u].z)) * 2.0) + (-1.0);
        float productValue11 = (1.0 - (ViewCB.packedValues[78u].w * productValue1)) - (scalarValue7 * 2.0);
        float multiplyAddValue = fma(0.5, ViewCB.packedValues[34u].w, fma(productValue11, ViewCB.packedValues[33u].w, ViewCB.packedValues[32u].w * productValue10)) + ViewCB.packedValues[35u].w;
        float multiplyAddValue1 = ((fma(0.5, ViewCB.packedValues[34u].x, fma(productValue11, ViewCB.packedValues[33u].x, ViewCB.packedValues[32u].x * productValue10)) + ViewCB.packedValues[35u].x) / multiplyAddValue) - ViewCB.packedValues[73u].x;
        float multiplyAddValue2 = ((fma(0.5, ViewCB.packedValues[34u].y, fma(productValue11, ViewCB.packedValues[33u].y, ViewCB.packedValues[32u].y * productValue10)) + ViewCB.packedValues[35u].y) / multiplyAddValue) - ViewCB.packedValues[73u].y;
        float multiplyAddValue3 = ((fma(0.5, ViewCB.packedValues[34u].z, fma(productValue11, ViewCB.packedValues[33u].z, ViewCB.packedValues[32u].z * productValue10)) + ViewCB.packedValues[35u].z) / multiplyAddValue) - ViewCB.packedValues[73u].z;
        float inverseLengthValue2 = inversesqrt(dot(vec3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3), vec3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3)));
        float multiplyAddValue4 = dot(vec3(fma(multiplyAddValue1 * inverseLengthValue2, scalarValue8, ViewCB.packedValues[73u].x), fma(multiplyAddValue2 * inverseLengthValue2, scalarValue8, ViewCB.packedValues[73u].y), fma(multiplyAddValue3 * inverseLengthValue2, scalarValue8, ViewCB.packedValues[73u].z)), vec3(productValue4, productValue5, productValue6));
        float multiplyAddValue5 = fma(scalarValue8, 0.004999999888241291046142578125, 0.02500000037252902984619140625);
        uvec4 reinterpretedBits3 = floatBitsToUint(RootConstants.packedValues[0u]);
        uint scalarValue15 = reinterpretedBits3.x;
        float sumValue12 = sumValue5 + (-0.5);
        float sumValue13 = sumValue7 + (-0.5);
        uint scalarValue16 = uint(int(floor(sumValue12)));
        uint scalarValue17 = uint(int(floor(sumValue13)));
        float scalarValue18 = fract(sumValue12);
        float scalarValue19 = fract(sumValue13);
        float sumValue14;
        uint intermediateValue33;
        uint intermediateValue34;
        float intermediateValue2[4];
        float scalarValue20 = 0.0;
        uint scalarValue21 = 0u;
        uint bitwiseValue3;
        uint sumValue16;
        uint sumValue17;
        float comparisonValue6;
        uint reinterpretedBits4;
        bool comparisonValue7;
        for (;;)
        {
            uint bitwiseValue2 = scalarValue21 & 1u;
            bitwiseValue3 = scalarValue21 >> 1u;
            uint bitwiseValue4 = bitwiseValue3 & 1u;
            sumValue16 = bitwiseValue2 + scalarValue16;
            sumValue17 = bitwiseValue4 + scalarValue17;
            float sumValue15 = 1.0 - scalarValue18;
            float sumValue18 = 1.0 - scalarValue19;
            comparisonValue6 = (((int(sumValue16) < int(intermediateValue11)) || (int(sumValue17) < int(0u))) || ((int(sumValue16) >= int(intermediateValue12)) || (int(sumValue17) >= int(intermediateValue13)))) ? 0.0 : (((float(int(bitwiseValue4)) * (scalarValue19 - sumValue18)) + sumValue18) * ((float(int(bitwiseValue2)) * (scalarValue18 - sumValue15)) + sumValue15));
            reinterpretedBits4 = floatBitsToUint(ViewCB.packedValues[91u]).y;
            comparisonValue7 = reinterpretedBits4 == 2u;
            uint branchMergedValue;
            uint branchMergedValue3;
            if (comparisonValue1)
            {
                uint branchMergedValue50;
                uint branchMergedValue52;
                if (comparisonValue7)
                {
                    branchMergedValue50 = sumValue16;
                    branchMergedValue52 = sumValue16;
                }
                else
                {
                    uint productValue12 = uint(ViewCB.packedValues[78u].x * 0.5);
                    uint reinterpretedBits5 = (((reinterpretedBits4 == 0u) ? (floatBitsToUint(ViewCB.packedValues[84u]).z + 1u) : 0u) + sumValue17) & 1u;
                    uint branchMergedValue60;
                    uint branchMergedValue61;
                    if (sumValue16 < productValue12)
                    {
                        branchMergedValue60 = ((sumValue16 << 1u) | 1u) - reinterpretedBits5;
                        branchMergedValue61 = sumValue16;
                    }
                    else
                    {
                        branchMergedValue60 = reinterpretedBits5 | ((sumValue16 - productValue12) << 1u);
                        branchMergedValue61 = sumValue16;
                    }
                    branchMergedValue50 = branchMergedValue60;
                    branchMergedValue52 = branchMergedValue61;
                }
                branchMergedValue = branchMergedValue50;
                branchMergedValue3 = branchMergedValue52;
            }
            else
            {
                uint branchMergedValue51;
                uint branchMergedValue53;
                if (comparisonValue7)
                {
                    branchMergedValue51 = sumValue16;
                    branchMergedValue53 = sumValue16;
                }
                else
                {
                    branchMergedValue51 = sumValue16;
                    branchMergedValue53 = ((((((bitwiseValue3 + scalarValue17) ^ (scalarValue21 + scalarValue16)) & 1u) != 0u) != (((floatBitsToUint(ViewCB.packedValues[84u]).z & 1u) | reinterpretedBits4) != 0u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue16 >> 1u);
                }
                branchMergedValue = branchMergedValue51;
                branchMergedValue3 = branchMergedValue53;
            }
            intermediateValue34 = branchMergedValue;
            intermediateValue33 = branchMergedValue3;
            float scalarValue22 = float(sumValue17);
            uint productValue13 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(intermediateValue33))), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x));
            uint productValue14 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * scalarValue22)), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x));
            vec4 sampledTextureValue6 = texelFetch(previousPrimaryNormalBuffer, ivec2(uvec2(productValue13, productValue14)), int(0u));
            float scalarValue23 = sampledTextureValue6.x;
            float scalarValue24 = sampledTextureValue6.y;
            float sumValue19 = 1.0 - abs(scalarValue23);
            float scalarValue25 = abs(scalarValue24);
            float sumValue20 = sumValue19 - scalarValue25;
            bool conditionValue2 = sumValue20 < 0.0;
            float comparisonValue8 = conditionValue2 ? ((1.0 - scalarValue25) * ((scalarValue23 >= 0.0) ? 1.0 : (-1.0))) : scalarValue23;
            float comparisonValue9 = conditionValue2 ? (((scalarValue24 >= 0.0) ? 1.0 : (-1.0)) * sumValue19) : scalarValue24;
            float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue8, comparisonValue9, sumValue20), vec3(comparisonValue8, comparisonValue9, sumValue20)));
            vec4 sampledTextureValue7 = texelFetch(previousPrimaryPathLengthBuffer, ivec2(uvec2(productValue13, productValue14)), int(0u));
            float scalarValue26 = sampledTextureValue7.x;
            float productValue15 = (((float(intermediateValue34) + 0.5) * 2.0) * ViewCB.packedValues[78u].z) + (-1.0);
            float productValue16 = 1.0 - (((scalarValue22 + 0.5) * 2.0) * ViewCB.packedValues[78u].w);
            float multiplyAddValue6 = fma(0.5, ViewCB.packedValues[34u].w, fma(productValue16, ViewCB.packedValues[33u].w, ViewCB.packedValues[32u].w * productValue15)) + ViewCB.packedValues[35u].w;
            float multiplyAddValue7 = ((fma(0.5, ViewCB.packedValues[34u].x, fma(productValue16, ViewCB.packedValues[33u].x, ViewCB.packedValues[32u].x * productValue15)) + ViewCB.packedValues[35u].x) / multiplyAddValue6) - ViewCB.packedValues[73u].x;
            float multiplyAddValue8 = ((fma(0.5, ViewCB.packedValues[34u].y, fma(productValue16, ViewCB.packedValues[33u].y, ViewCB.packedValues[32u].y * productValue15)) + ViewCB.packedValues[35u].y) / multiplyAddValue6) - ViewCB.packedValues[73u].y;
            float multiplyAddValue9 = ((fma(0.5, ViewCB.packedValues[34u].z, fma(productValue16, ViewCB.packedValues[33u].z, ViewCB.packedValues[32u].z * productValue15)) + ViewCB.packedValues[35u].z) / multiplyAddValue6) - ViewCB.packedValues[73u].z;
            float inverseLengthValue4 = inversesqrt(dot(vec3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9), vec3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9)));
            float multiplyAddValue10 = (abs(multiplyAddValue4 - dot(vec3(fma(multiplyAddValue7 * inverseLengthValue4, scalarValue26, ViewCB.packedValues[73u].x), fma(multiplyAddValue8 * inverseLengthValue4, scalarValue26, ViewCB.packedValues[73u].y), fma(multiplyAddValue9 * inverseLengthValue4, scalarValue26, ViewCB.packedValues[73u].z)), vec3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0 : (spvNClamp(fma(dot(vec3(comparisonValue8 * inverseLengthValue3, comparisonValue9 * inverseLengthValue3, inverseLengthValue3 * sumValue20), vec3(productValue7, productValue8, productValue9)), 3.759398937225341796875, -2.2556393146514892578125), 0.0, 1.0) * comparisonValue6);
            intermediateValue2[scalarValue21] = multiplyAddValue10;
            sumValue14 = multiplyAddValue10 + scalarValue20;
            uint sumValue21 = scalarValue21 + 1u;
            if (sumValue21 == 4u)
            {
                break;
            }
            else
            {
                scalarValue20 = sumValue14;
                scalarValue21 = sumValue21;
                continue;
            }
        }
        bool comparisonValue10 = (scalarValue15 & 1u) != 0u;
        bool comparisonValue11 = (scalarValue15 & 2u) != 0u;
        float quotientValue = 1.0 / sumValue14;
        float intermediateValue41;
        float intermediateValue42;
        float intermediateValue43;
        float intermediateValue44;
        float intermediateValue45;
        float intermediateValue46;
        float intermediateValue47;
        float intermediateValue48;
        float intermediateValue49;
        float intermediateValue50;
        float intermediateValue51;
        float intermediateValue52;
        uint intermediateValue53;
        if (sumValue14 > 0.0)
        {
            float intermediateValue56;
            float intermediateValue58;
            float intermediateValue60;
            float intermediateValue62;
            float intermediateValue64;
            float intermediateValue66;
            float intermediateValue68;
            float intermediateValue70;
            float intermediateValue72;
            float intermediateValue74;
            float intermediateValue76;
            float intermediateValue78;
            float scalarValue27 = 0.0;
            float scalarValue28 = 0.0;
            float scalarValue29 = 0.0;
            float scalarValue30 = 0.0;
            float scalarValue31 = 0.0;
            float scalarValue32 = 0.0;
            float scalarValue33 = 0.0;
            float scalarValue34 = 0.0;
            float scalarValue35 = 0.0;
            float scalarValue36 = 0.0;
            float scalarValue37 = 0.0;
            float scalarValue38 = 0.0;
            uint scalarValue39 = 0u;
            float intermediateValue80;
            bool comparisonValue15;
            for (;;)
            {
                intermediateValue80 = intermediateValue2[scalarValue39];
                comparisonValue15 = intermediateValue80 != 0.0;
                float branchMergedValue1;
                float branchMergedValue4;
                float branchMergedValue5;
                float branchMergedValue6;
                float branchMergedValue7;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                float branchMergedValue12;
                float branchMergedValue18;
                float branchMergedValue19;
                if (comparisonValue15)
                {
                    uint bitwiseValue5 = scalarValue39 >> 1u;
                    uint bitwiseValue6 = (scalarValue39 & 1u) + scalarValue16;
                    uint intermediateValue87;
                    if (comparisonValue1)
                    {
                        intermediateValue87 = bitwiseValue6;
                    }
                    else
                    {
                        uvec4 reinterpretedBits6 = floatBitsToUint(ViewCB.packedValues[91u]);
                        uint scalarValue40 = reinterpretedBits6.y;
                        uint branchMergedValue23;
                        if (scalarValue40 == 2u)
                        {
                            branchMergedValue23 = bitwiseValue6;
                        }
                        else
                        {
                            branchMergedValue23 = ((((((bitwiseValue5 + scalarValue17) ^ (scalarValue39 + scalarValue16)) & 1u) != 0u) != (((floatBitsToUint(ViewCB.packedValues[84u]).z & 1u) | scalarValue40) != 0u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (bitwiseValue6 >> 1u);
                        }
                        intermediateValue87 = branchMergedValue23;
                    }
                    uint productValue17 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(intermediateValue87))), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x));
                    uint bitwiseValue7 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float((bitwiseValue5 & 1u) + scalarValue17))), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x));
                    vec4 sampledTextureValue8 = texelFetch(previousDiffuseBuffer, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                    vec4 sampledTextureValue9 = texelFetch(previousSpecularBuffer, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                    float productValue34;
                    float productValue35;
                    if (comparisonValue10)
                    {
                        vec4 sampledTextureValue10 = texelFetch(inputFinalDiffuseMoments, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                        productValue34 = (sampledTextureValue10.x * intermediateValue80) + scalarValue33;
                        productValue35 = (sampledTextureValue10.y * intermediateValue80) + scalarValue34;
                    }
                    else
                    {
                        productValue34 = scalarValue33;
                        productValue35 = scalarValue34;
                    }
                    float productValue36;
                    float productValue37;
                    if (comparisonValue11)
                    {
                        vec4 sampledTextureValue11 = texelFetch(inputFinalSpecularMoments, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                        productValue36 = (sampledTextureValue11.x * intermediateValue80) + scalarValue35;
                        productValue37 = (sampledTextureValue11.y * intermediateValue80) + scalarValue36;
                    }
                    else
                    {
                        productValue36 = scalarValue35;
                        productValue37 = scalarValue36;
                    }
                    vec4 sampledTextureValue12 = texelFetch(previousHistoryLengthBuffer, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                    float productValue18 = intermediateValue80 * 255.0;
                    branchMergedValue1 = (sampledTextureValue12.y * productValue18) + scalarValue38;
                    branchMergedValue4 = (sampledTextureValue12.x * productValue18) + scalarValue37;
                    branchMergedValue5 = productValue37;
                    branchMergedValue6 = productValue36;
                    branchMergedValue7 = productValue35;
                    branchMergedValue8 = productValue34;
                    branchMergedValue9 = (sampledTextureValue9.z * intermediateValue80) + scalarValue32;
                    branchMergedValue10 = (sampledTextureValue9.y * intermediateValue80) + scalarValue31;
                    branchMergedValue11 = (sampledTextureValue9.x * intermediateValue80) + scalarValue30;
                    branchMergedValue12 = (sampledTextureValue8.z * intermediateValue80) + scalarValue29;
                    branchMergedValue18 = (sampledTextureValue8.y * intermediateValue80) + scalarValue28;
                    branchMergedValue19 = (sampledTextureValue8.x * intermediateValue80) + scalarValue27;
                }
                else
                {
                    branchMergedValue1 = scalarValue38;
                    branchMergedValue4 = scalarValue37;
                    branchMergedValue5 = scalarValue36;
                    branchMergedValue6 = scalarValue35;
                    branchMergedValue7 = scalarValue34;
                    branchMergedValue8 = scalarValue33;
                    branchMergedValue9 = scalarValue32;
                    branchMergedValue10 = scalarValue31;
                    branchMergedValue11 = scalarValue30;
                    branchMergedValue12 = scalarValue29;
                    branchMergedValue18 = scalarValue28;
                    branchMergedValue19 = scalarValue27;
                }
                intermediateValue78 = branchMergedValue1;
                intermediateValue76 = branchMergedValue4;
                intermediateValue74 = branchMergedValue5;
                intermediateValue72 = branchMergedValue6;
                intermediateValue70 = branchMergedValue7;
                intermediateValue68 = branchMergedValue8;
                intermediateValue66 = branchMergedValue9;
                intermediateValue64 = branchMergedValue10;
                intermediateValue62 = branchMergedValue11;
                intermediateValue60 = branchMergedValue12;
                intermediateValue58 = branchMergedValue18;
                intermediateValue56 = branchMergedValue19;
                uint sumValue22 = scalarValue39 + 1u;
                if (sumValue22 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue27 = intermediateValue56;
                    scalarValue28 = intermediateValue58;
                    scalarValue29 = intermediateValue60;
                    scalarValue30 = intermediateValue62;
                    scalarValue31 = intermediateValue64;
                    scalarValue32 = intermediateValue66;
                    scalarValue33 = intermediateValue68;
                    scalarValue34 = intermediateValue70;
                    scalarValue35 = intermediateValue72;
                    scalarValue36 = intermediateValue74;
                    scalarValue37 = intermediateValue76;
                    scalarValue38 = intermediateValue78;
                    scalarValue39 = sumValue22;
                    continue;
                }
            }
            float productValue19 = intermediateValue56 * quotientValue;
            float productValue20 = intermediateValue58 * quotientValue;
            float productValue21 = intermediateValue60 * quotientValue;
            float productValue22 = intermediateValue68 * quotientValue;
            float productValue23 = intermediateValue70 * quotientValue;
            float productValue24 = intermediateValue62 * quotientValue;
            float productValue25 = intermediateValue64 * quotientValue;
            float productValue26 = intermediateValue66 * quotientValue;
            float productValue27 = intermediateValue72 * quotientValue;
            float productValue28 = intermediateValue74 * quotientValue;
            float productValue29 = intermediateValue76 * quotientValue;
            float productValue30 = intermediateValue78 * quotientValue;
            bool reinterpretedBits7 = floatBitsToUint(ViewCB.packedValues[53u]).w != 0u;
            float comparisonValue12 = reinterpretedBits7 ? (productValue29 + 1.0) : productValue29;
            float comparisonValue13 = reinterpretedBits7 ? (productValue30 + 1.0) : productValue30;
            uint branchMergedValue22;
            float branchMergedValue30;
            float branchMergedValue31;
            float branchMergedValue32;
            float branchMergedValue33;
            float branchMergedValue34;
            float branchMergedValue35;
            float branchMergedValue36;
            float branchMergedValue37;
            float branchMergedValue38;
            float branchMergedValue47;
            float branchMergedValue48;
            float branchMergedValue49;
            if (floatBitsToUint(ViewCB.packedValues[87u]).w == 0u)
            {
                branchMergedValue22 = 0u;
                branchMergedValue30 = comparisonValue13;
                branchMergedValue31 = comparisonValue12;
                branchMergedValue32 = productValue28;
                branchMergedValue33 = productValue27;
                branchMergedValue34 = productValue23;
                branchMergedValue35 = productValue22;
                branchMergedValue36 = productValue26;
                branchMergedValue37 = productValue25;
                branchMergedValue38 = productValue24;
                branchMergedValue47 = productValue21;
                branchMergedValue48 = productValue20;
                branchMergedValue49 = productValue19;
            }
            else
            {
                uvec4 sampledTextureValue13 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)));
                uint scalarValue41 = sampledTextureValue13.x;
                uint bitwiseValue8 = gl_LocalInvocationID.x >> 2u;
                uint bitwiseValue9 = gl_LocalInvocationID.y >> 2u;
                uint productValue31 = intermediateValue[bitwiseValue8 + (bitwiseValue9 * 5u)] - scalarValue41;
                float productValue58;
                if (int(uint(abs(int(productValue31)))) < int(200u))
                {
                    productValue58 = spvNMin(ViewCB.packedValues[98u].z, intermediateValue1[bitwiseValue8 + (bitwiseValue9 * 5u)]);
                }
                else
                {
                    productValue58 = ViewCB.packedValues[98u].z;
                }
                uint sumValue23 = bitwiseValue9 + 1u;
                uint productValue32 = intermediateValue[bitwiseValue8 + (sumValue23 * 5u)] - scalarValue41;
                float productValue64;
                if (int(uint(abs(int(productValue32)))) < int(200u))
                {
                    productValue64 = spvNMin(productValue58, intermediateValue1[bitwiseValue8 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue64 = productValue58;
                }
                uint sumValue24 = bitwiseValue8 + 1u;
                uint productValue33 = intermediateValue[sumValue24 + (bitwiseValue9 * 5u)] - scalarValue41;
                float productValue67;
                if (int(uint(abs(int(productValue33)))) < int(200u))
                {
                    productValue67 = spvNMin(productValue64, intermediateValue1[sumValue24 + (bitwiseValue9 * 5u)]);
                }
                else
                {
                    productValue67 = productValue64;
                }
                uint productValue38 = intermediateValue[sumValue24 + (sumValue23 * 5u)] - scalarValue41;
                float productValue74;
                if (int(uint(abs(int(productValue38)))) < int(200u))
                {
                    productValue74 = spvNMin(productValue67, intermediateValue1[sumValue24 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue74 = productValue67;
                }
                branchMergedValue22 = 0u;
                branchMergedValue30 = spvNMin(comparisonValue13, productValue74);
                branchMergedValue31 = spvNMin(comparisonValue12, productValue74);
                branchMergedValue32 = productValue28;
                branchMergedValue33 = productValue27;
                branchMergedValue34 = productValue23;
                branchMergedValue35 = productValue22;
                branchMergedValue36 = productValue26;
                branchMergedValue37 = productValue25;
                branchMergedValue38 = productValue24;
                branchMergedValue47 = productValue21;
                branchMergedValue48 = productValue20;
                branchMergedValue49 = productValue19;
            }
            intermediateValue41 = branchMergedValue49;
            intermediateValue42 = branchMergedValue48;
            intermediateValue43 = branchMergedValue47;
            intermediateValue44 = branchMergedValue38;
            intermediateValue45 = branchMergedValue37;
            intermediateValue46 = branchMergedValue36;
            intermediateValue47 = branchMergedValue35;
            intermediateValue48 = branchMergedValue34;
            intermediateValue49 = branchMergedValue33;
            intermediateValue50 = branchMergedValue32;
            intermediateValue51 = branchMergedValue31;
            intermediateValue52 = branchMergedValue30;
            intermediateValue53 = branchMergedValue22;
        }
        else
        {
            intermediateValue41 = 0.0;
            intermediateValue42 = 0.0;
            intermediateValue43 = 0.0;
            intermediateValue44 = 0.0;
            intermediateValue45 = 0.0;
            intermediateValue46 = 0.0;
            intermediateValue47 = 0.0;
            intermediateValue48 = 0.0;
            intermediateValue49 = 0.0;
            intermediateValue50 = 0.0;
            intermediateValue51 = 1.0;
            intermediateValue52 = 1.0;
            intermediateValue53 = 1u;
        }
        float productValue39 = ViewCB.packedValues[78u].z * sumValue5;
        float productValue40 = ViewCB.packedValues[78u].w * sumValue7;
        float productValue41 = ViewCB.packedValues[78u].z * (sumValue5 - sumValue2);
        float productValue42 = ViewCB.packedValues[78u].w * (sumValue7 - sumValue1);
        float comparisonValue14 = (productValue39 < 0.5) ? spvNMin(spvNClamp(((productValue41 < 0.0) ? productValue39 : (1.0 - productValue39)) / (abs(productValue41) + 9.9999997473787516355514526367188e-06), 0.0, 1.0), spvNClamp(((productValue42 < 0.0) ? productValue40 : (1.0 - productValue40)) / (abs(productValue42) + 9.9999997473787516355514526367188e-06), 0.0, 1.0)) : 1.0;
        vec4 loadedBufferValue = imageLoad(outputBufferIndirectDiffuse, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue42 = loadedBufferValue.x;
        float intermediateValue81;
        float intermediateValue82;
        float comparisonValue18;
        if (comparisonValue10)
        {
            float dotProductValue = dot(vec3(scalarValue42, loadedBufferValue.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float comparisonValue16 = spvNMin(spvNMax(1.0 / spvNMax(intermediateValue51, 0.00999999977648258209228515625), ViewCB.packedValues[88u].z), (sumValue14 == 0.0) ? 1.0 : 0.100000001490116119384765625);
            float productValue43 = (comparisonValue16 * (dotProductValue - intermediateValue47)) + intermediateValue47;
            float productValue44 = (comparisonValue16 * ((dotProductValue * dotProductValue) - intermediateValue48)) + intermediateValue48;
            float exponentialValue = spvNMax(exp2((12.0 / intermediateValue51) + 1.0) + (-10.55606365203857421875), 0.0);
            float comparisonValue17 = (intermediateValue53 != 0u) ? (exponentialValue + 1000000.0) : exponentialValue;
            float productValue45 = spvNMax(0.0, productValue44 - (productValue43 * productValue43));
            float sumValue25 = comparisonValue17 + productValue45;
            intermediateValue81 = productValue43;
            intermediateValue82 = productValue44;
            comparisonValue18 = (comparisonValue17 > productValue45) ? ((-0.0) - sumValue25) : sumValue25;
        }
        else
        {
            intermediateValue81 = 0.0;
            intermediateValue82 = 0.0;
            comparisonValue18 = 0.0;
        }
        imageStore(outputBufferDiffuseMoments, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue81, intermediateValue82, intermediateValue81, intermediateValue81));
        float quotientValue1 = ((spvNMax(ViewCB.packedValues[88u].y, 1.0 / intermediateValue51) + (-1.0)) * comparisonValue14) + 1.0;
        float intermediateValue83;
        if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
        {
            intermediateValue83 = 1.0;
        }
        else
        {
            intermediateValue83 = uintBitsToFloat(texelFetch(inputIncidentLight, int(4u)).x);
        }
        float productValue46 = intermediateValue83 * intermediateValue41;
        float productValue47 = intermediateValue83 * intermediateValue42;
        float productValue48 = intermediateValue83 * intermediateValue43;
        imageStore(denoisingOutputs[((floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u) + 0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(((scalarValue42 - productValue46) * quotientValue1) + productValue46, ((loadedBufferValue.y - productValue47) * quotientValue1) + productValue47, ((loadedBufferValue.z - productValue48) * quotientValue1) + productValue48, comparisonValue18));
        vec4 loadedBufferValue1 = imageLoad(outputBufferIndirectSpecular, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue43 = loadedBufferValue1.x;
        vec4 sampledTextureValue14 = texelFetch(inputEmissiveAndLinearRoughness, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue44 = sampledTextureValue14.w;
        vec4 loadedBufferValue2 = imageLoad(outputBufferReflectionDistance, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue45 = loadedBufferValue2.x;
        float sumValue26 = scalarValue45 + scalarValue1;
        float productValue49 = ((sumValue * 2.0) * ViewCB.packedValues[78u].z) + (-1.0);
        float productValue50 = 1.0 - (ViewCB.packedValues[78u].w * productValue1);
        float multiplyAddValue11 = fma(0.5, ViewCB.packedValues[22u].w, fma(productValue50, ViewCB.packedValues[21u].w, productValue49 * ViewCB.packedValues[20u].w)) + ViewCB.packedValues[23u].w;
        float multiplyAddValue12 = ((fma(0.5, ViewCB.packedValues[22u].x, fma(productValue50, ViewCB.packedValues[21u].x, productValue49 * ViewCB.packedValues[20u].x)) + ViewCB.packedValues[23u].x) / multiplyAddValue11) - ViewCB.packedValues[72u].x;
        float multiplyAddValue13 = ((fma(0.5, ViewCB.packedValues[22u].y, fma(productValue50, ViewCB.packedValues[21u].y, productValue49 * ViewCB.packedValues[20u].y)) + ViewCB.packedValues[23u].y) / multiplyAddValue11) - ViewCB.packedValues[72u].y;
        float multiplyAddValue14 = ((fma(0.5, ViewCB.packedValues[22u].z, fma(productValue50, ViewCB.packedValues[21u].z, productValue49 * ViewCB.packedValues[20u].z)) + ViewCB.packedValues[23u].z) / multiplyAddValue11) - ViewCB.packedValues[72u].z;
        float inverseLengthValue5 = inversesqrt(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14))) * sumValue26;
        float productValue51 = ((inverseLengthValue5 * multiplyAddValue12) - ViewCB.packedValues[71u].x) + ViewCB.packedValues[72u].x;
        float productValue53 = ((inverseLengthValue5 * multiplyAddValue13) - ViewCB.packedValues[71u].y) + ViewCB.packedValues[72u].y;
        float productValue54 = ((inverseLengthValue5 * multiplyAddValue14) - ViewCB.packedValues[71u].z) + ViewCB.packedValues[72u].z;
        float multiplyAddValue15 = fma(productValue54, ViewCB.packedValues[26u].w, fma(productValue53, ViewCB.packedValues[25u].w, productValue51 * ViewCB.packedValues[24u].w)) + ViewCB.packedValues[27u].w;
        float multiplyAddValue16 = (sumValue3 * 0.5) * (((fma(productValue54, ViewCB.packedValues[26u].x, fma(productValue53, ViewCB.packedValues[25u].x, productValue51 * ViewCB.packedValues[24u].x)) + ViewCB.packedValues[27u].x) / multiplyAddValue15) - productValue49);
        float multiplyAddValue17 = (scalarValue5 * (-0.5)) * (((fma(productValue54, ViewCB.packedValues[26u].y, fma(productValue53, ViewCB.packedValues[25u].y, productValue51 * ViewCB.packedValues[24u].y)) + ViewCB.packedValues[27u].y) / multiplyAddValue15) - productValue50);
        float sumValue27 = multiplyAddValue16 - productValue2;
        float sumValue28 = multiplyAddValue17 - productValue3;
        float nonlinearValue1 = spvNMax(sqrt((sumValue28 * sumValue28) + (sumValue27 * sumValue27)) + (-0.100000001490116119384765625), 0.0);
        float productValue55 = nonlinearValue1 * 0.02500000037252902984619140625;
        float quotientValue2 = spvNMax(((scalarValue44 * scalarValue44) * scalarValue45) / sumValue26, scalarValue44 * 0.5);
        float quotientValue3 = spvNMax(spvNMax(ViewCB.packedValues[88u].w, 1.0 / intermediateValue52), spvNMin(productValue55, 1.0) * 0.25);
        float productValue56 = spvNMin(((1.0 - quotientValue2) * (1.0 - productValue55)) + productValue55, 1.0);
        float intermediateValue93;
        float intermediateValue94;
        float intermediateValue95;
        float intermediateValue96;
        float intermediateValue97;
        float intermediateValue98;
        float intermediateValue100;
        if ((sumValue14 != 0.0) && (productValue56 > 0.0))
        {
            float sumValue29 = (multiplyAddValue16 + sumValue4) + (-0.5);
            float sumValue32 = (multiplyAddValue17 + sumValue6) + (-0.5);
            uint scalarValue46 = uint(int(floor(sumValue29)));
            uint scalarValue47 = uint(int(floor(sumValue32)));
            float scalarValue48 = fract(sumValue29);
            float scalarValue49 = fract(sumValue32);
            float nonlinearValue2 = log2(spvNMax(scalarValue45, 0.00999999977648258209228515625));
            float intermediateValue99;
            float intermediateValue105;
            float intermediateValue107;
            float intermediateValue109;
            float intermediateValue111;
            float intermediateValue113;
            float scalarValue50 = 0.0;
            uint scalarValue51 = 0u;
            float scalarValue52 = 0.0;
            float scalarValue53 = 0.0;
            float scalarValue54 = 0.0;
            float scalarValue55 = 0.0;
            float scalarValue56 = 0.0;
            uint bitwiseValue11;
            uint sumValue30;
            uint sumValue31;
            float productValue52;
            uint reinterpretedBits8;
            bool comparisonValue19;
            for (;;)
            {
                uint bitwiseValue10 = scalarValue51 & 1u;
                bitwiseValue11 = scalarValue51 >> 1u;
                uint bitwiseValue12 = bitwiseValue11 & 1u;
                sumValue30 = bitwiseValue10 + scalarValue46;
                sumValue31 = bitwiseValue12 + scalarValue47;
                float sumValue33 = 1.0 - scalarValue48;
                float sumValue34 = 1.0 - scalarValue49;
                productValue52 = ((float(int(bitwiseValue12)) * (scalarValue49 - sumValue34)) + sumValue34) * ((float(int(bitwiseValue10)) * (scalarValue48 - sumValue33)) + sumValue33);
                reinterpretedBits8 = floatBitsToUint(ViewCB.packedValues[91u]).y;
                comparisonValue19 = reinterpretedBits8 == 2u;
                uint intermediateValue117;
                uint intermediateValue118;
                if (comparisonValue1)
                {
                    uint branchMergedValue25;
                    uint branchMergedValue45;
                    if (comparisonValue19)
                    {
                        branchMergedValue25 = sumValue30;
                        branchMergedValue45 = sumValue30;
                    }
                    else
                    {
                        uint productValue57 = uint(ViewCB.packedValues[78u].x * 0.5);
                        uint reinterpretedBits9 = (((reinterpretedBits8 == 0u) ? (floatBitsToUint(ViewCB.packedValues[84u]).z + 1u) : 0u) + sumValue31) & 1u;
                        uint branchMergedValue55;
                        uint branchMergedValue59;
                        if (sumValue30 < productValue57)
                        {
                            branchMergedValue55 = ((sumValue30 << 1u) | 1u) - reinterpretedBits9;
                            branchMergedValue59 = sumValue30;
                        }
                        else
                        {
                            branchMergedValue55 = reinterpretedBits9 | ((sumValue30 - productValue57) << 1u);
                            branchMergedValue59 = sumValue30;
                        }
                        branchMergedValue25 = branchMergedValue55;
                        branchMergedValue45 = branchMergedValue59;
                    }
                    intermediateValue117 = branchMergedValue45;
                    intermediateValue118 = branchMergedValue25;
                }
                else
                {
                    uint branchMergedValue26;
                    uint branchMergedValue46;
                    if (comparisonValue19)
                    {
                        branchMergedValue26 = sumValue30;
                        branchMergedValue46 = sumValue30;
                    }
                    else
                    {
                        branchMergedValue26 = sumValue30;
                        branchMergedValue46 = ((((((bitwiseValue11 + scalarValue47) ^ (scalarValue51 + scalarValue46)) & 1u) != 0u) != (((floatBitsToUint(ViewCB.packedValues[84u]).z & 1u) | reinterpretedBits8) != 0u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue30 >> 1u);
                    }
                    intermediateValue117 = branchMergedValue46;
                    intermediateValue118 = branchMergedValue26;
                }
                float branchMergedValue2;
                float branchMergedValue13;
                float branchMergedValue14;
                float branchMergedValue15;
                float branchMergedValue16;
                float branchMergedValue17;
                if (((int(sumValue31) < int(0u)) || (int(intermediateValue117) < int(intermediateValue11))) || ((int(sumValue31) >= int(intermediateValue13)) || (int(intermediateValue117) >= int(intermediateValue12))))
                {
                    branchMergedValue2 = scalarValue56;
                    branchMergedValue13 = scalarValue55;
                    branchMergedValue14 = scalarValue54;
                    branchMergedValue15 = scalarValue53;
                    branchMergedValue16 = scalarValue52;
                    branchMergedValue17 = scalarValue50;
                }
                else
                {
                    uint productValue59 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(intermediateValue117))), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x));
                    uint productValue60 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(sumValue31))), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x));
                    float productValue61 = scalarValue44 * (-0.25);
                    vec4 sampledTextureValue15 = texelFetch(previousPrimaryNormalBuffer, ivec2(uvec2(productValue59, productValue60)), int(0u));
                    float scalarValue57 = sampledTextureValue15.x;
                    float scalarValue58 = sampledTextureValue15.y;
                    float sumValue35 = 1.0 - abs(scalarValue57);
                    float scalarValue59 = abs(scalarValue58);
                    float sumValue36 = sumValue35 - scalarValue59;
                    bool conditionValue3 = sumValue36 < 0.0;
                    float comparisonValue20 = conditionValue3 ? ((1.0 - scalarValue59) * ((scalarValue57 >= 0.0) ? 1.0 : (-1.0))) : scalarValue57;
                    float comparisonValue21 = conditionValue3 ? (((scalarValue58 >= 0.0) ? 1.0 : (-1.0)) * sumValue35) : scalarValue58;
                    float inverseLengthValue6 = inversesqrt(dot(vec3(comparisonValue20, comparisonValue21, sumValue36), vec3(comparisonValue20, comparisonValue21, sumValue36)));
                    float sumValue37 = 0.050000011920928955078125 - productValue61;
                    vec4 sampledTextureValue16 = texelFetch(previousPrimaryPathLengthBuffer, ivec2(uvec2(productValue59, productValue60)), int(0u));
                    float scalarValue60 = sampledTextureValue16.x;
                    float productValue62 = (((float(int(intermediateValue118)) + 0.5) * 2.0) * ViewCB.packedValues[78u].z) + (-1.0);
                    float productValue63 = 1.0 - (((float(int(sumValue31)) + 0.5) * 2.0) * ViewCB.packedValues[78u].w);
                    float multiplyAddValue19 = fma(0.5, ViewCB.packedValues[34u].w, fma(productValue63, ViewCB.packedValues[33u].w, ViewCB.packedValues[32u].w * productValue62)) + ViewCB.packedValues[35u].w;
                    float multiplyAddValue20 = ((fma(0.5, ViewCB.packedValues[34u].x, fma(productValue63, ViewCB.packedValues[33u].x, ViewCB.packedValues[32u].x * productValue62)) + ViewCB.packedValues[35u].x) / multiplyAddValue19) - ViewCB.packedValues[73u].x;
                    float multiplyAddValue21 = ((fma(0.5, ViewCB.packedValues[34u].y, fma(productValue63, ViewCB.packedValues[33u].y, ViewCB.packedValues[32u].y * productValue62)) + ViewCB.packedValues[35u].y) / multiplyAddValue19) - ViewCB.packedValues[73u].y;
                    float multiplyAddValue22 = ((fma(0.5, ViewCB.packedValues[34u].z, fma(productValue63, ViewCB.packedValues[33u].z, ViewCB.packedValues[32u].z * productValue62)) + ViewCB.packedValues[35u].z) / multiplyAddValue19) - ViewCB.packedValues[73u].z;
                    float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22), vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22)));
                    float sampledTextureValue17 = spvNClamp(fma(abs(nonlinearValue2 - log2(spvNMax(texelFetch(previousReflectionDistanceBuffer, ivec2(uvec2(productValue59, productValue60)), int(0u)).x, 0.00999999977648258209228515625))), -2.0, 2.0), 0.0, 1.0);
                    float sampledTextureValue18 = (((1.0 - sampledTextureValue17) * scalarValue44) + sampledTextureValue17) * ((abs(multiplyAddValue4 - dot(vec3(fma(multiplyAddValue20 * inverseLengthValue7, scalarValue60, ViewCB.packedValues[73u].x), fma(multiplyAddValue21 * inverseLengthValue7, scalarValue60, ViewCB.packedValues[73u].y), fma(multiplyAddValue22 * inverseLengthValue7, scalarValue60, ViewCB.packedValues[73u].z)), vec3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0 : ((productValue52 * spvNClamp(fma(dot(vec3(productValue7, productValue8, productValue9), vec3(comparisonValue20 * inverseLengthValue6, comparisonValue21 * inverseLengthValue6, inverseLengthValue6 * sumValue36)), 1.0 / sumValue37, ((-0.0) - (productValue61 + 0.949999988079071044921875)) / sumValue37), 0.0, 1.0)) * spvNClamp(fma(abs(scalarValue44 - texelFetch(previousLinearRoughnessBuffer, ivec2(uvec2(productValue59, productValue60)), int(0u)).x), -12.5, 1.5), 0.0, 1.0)));
                    vec4 sampledTextureValue19 = texelFetch(previousSpecularBuffer, ivec2(uvec2(productValue59, productValue60)), int(0u));
                    vec4 sampledTextureValue20 = texelFetch(inputFinalSpecularMoments, ivec2(uvec2(intermediateValue117, sumValue31)), int(0u));
                    branchMergedValue2 = (sampledTextureValue20.y * sampledTextureValue18) + scalarValue56;
                    branchMergedValue13 = (sampledTextureValue20.x * sampledTextureValue18) + scalarValue55;
                    branchMergedValue14 = (sampledTextureValue18 * sampledTextureValue19.z) + scalarValue54;
                    branchMergedValue15 = (sampledTextureValue18 * sampledTextureValue19.y) + scalarValue53;
                    branchMergedValue16 = (sampledTextureValue18 * sampledTextureValue19.x) + scalarValue52;
                    branchMergedValue17 = sampledTextureValue18 + scalarValue50;
                }
                intermediateValue113 = branchMergedValue2;
                intermediateValue111 = branchMergedValue13;
                intermediateValue109 = branchMergedValue14;
                intermediateValue107 = branchMergedValue15;
                intermediateValue105 = branchMergedValue16;
                intermediateValue99 = branchMergedValue17;
                uint sumValue38 = scalarValue51 + 1u;
                if (sumValue38 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue50 = intermediateValue99;
                    scalarValue51 = sumValue38;
                    scalarValue52 = intermediateValue105;
                    scalarValue53 = intermediateValue107;
                    scalarValue54 = intermediateValue109;
                    scalarValue55 = intermediateValue111;
                    scalarValue56 = intermediateValue113;
                    continue;
                }
            }
            float branchMergedValue24;
            float branchMergedValue39;
            float branchMergedValue40;
            float branchMergedValue41;
            float branchMergedValue42;
            float branchMergedValue43;
            float branchMergedValue44;
            if (intermediateValue99 > 0.00999999977648258209228515625)
            {
                branchMergedValue24 = intermediateValue99;
                branchMergedValue39 = (((intermediateValue113 / intermediateValue99) - intermediateValue50) * productValue56) + intermediateValue50;
                branchMergedValue40 = (((intermediateValue111 / intermediateValue99) - intermediateValue49) * productValue56) + intermediateValue49;
                branchMergedValue41 = (((intermediateValue109 / intermediateValue99) - intermediateValue46) * productValue56) + intermediateValue46;
                branchMergedValue42 = quotientValue3;
                branchMergedValue43 = (((intermediateValue105 / intermediateValue99) - intermediateValue44) * productValue56) + intermediateValue44;
                branchMergedValue44 = (((intermediateValue107 / intermediateValue99) - intermediateValue45) * productValue56) + intermediateValue45;
            }
            else
            {
                branchMergedValue24 = intermediateValue99;
                branchMergedValue39 = intermediateValue50;
                branchMergedValue40 = intermediateValue49;
                branchMergedValue41 = intermediateValue46;
                branchMergedValue42 = 1.0;
                branchMergedValue43 = intermediateValue44;
                branchMergedValue44 = intermediateValue45;
            }
            intermediateValue93 = branchMergedValue43;
            intermediateValue94 = branchMergedValue44;
            intermediateValue95 = branchMergedValue41;
            intermediateValue96 = branchMergedValue40;
            intermediateValue97 = branchMergedValue39;
            intermediateValue98 = branchMergedValue24;
            intermediateValue100 = branchMergedValue42;
        }
        else
        {
            intermediateValue93 = intermediateValue44;
            intermediateValue94 = intermediateValue45;
            intermediateValue95 = intermediateValue46;
            intermediateValue96 = intermediateValue49;
            intermediateValue97 = intermediateValue50;
            intermediateValue98 = sumValue14;
            intermediateValue100 = quotientValue3;
        }
        float intermediateValue114;
        float intermediateValue115;
        float multiplyAddValue18;
        if (comparisonValue11)
        {
            float dotProductValue1 = dot(vec3(scalarValue43, loadedBufferValue1.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float comparisonValue22 = spvNMin(spvNMax(1.0 / spvNMax(intermediateValue52, 0.00999999977648258209228515625), ViewCB.packedValues[89u].x), (intermediateValue98 == 0.0) ? 1.0 : 0.100000001490116119384765625);
            float productValue65 = (comparisonValue22 * (dotProductValue1 - intermediateValue96)) + intermediateValue96;
            float productValue66 = (comparisonValue22 * ((dotProductValue1 * dotProductValue1) - intermediateValue97)) + intermediateValue97;
            float exponentialValue1 = spvNMax(exp2((12.0 / intermediateValue52) + 1.0) + (-10.55606365203857421875), 0.0);
            float comparisonValue23 = (intermediateValue53 != 0u) ? (exponentialValue1 + 1000000.0) : exponentialValue1;
            float productValue68 = spvNMax(0.0, productValue66 - (productValue65 * productValue65));
            float sumValue39 = comparisonValue23 + productValue68;
            intermediateValue114 = productValue65;
            intermediateValue115 = productValue66;
            multiplyAddValue18 = ((comparisonValue23 > productValue68) ? ((-0.0) - sumValue39) : sumValue39) * fma(productValue56, (nonlinearValue1 * 200.0) * quotientValue2, 1.0);
        }
        else
        {
            intermediateValue114 = 0.0;
            intermediateValue115 = 0.0;
            multiplyAddValue18 = 0.0;
        }
        imageStore(outputBufferSpecularMoments, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue114, intermediateValue115, intermediateValue114, intermediateValue114));
        float productValue69 = ((intermediateValue100 + (-1.0)) * comparisonValue14) + 1.0;
        float intermediateValue116;
        if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
        {
            intermediateValue116 = 1.0;
        }
        else
        {
            intermediateValue116 = uintBitsToFloat(texelFetch(inputIncidentLight, int(4u)).x);
        }
        float productValue70 = intermediateValue116 * intermediateValue93;
        float productValue71 = intermediateValue116 * intermediateValue94;
        float productValue72 = intermediateValue116 * intermediateValue95;
        imageStore(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(((scalarValue43 - productValue70) * productValue69) + productValue70, ((loadedBufferValue1.y - productValue71) * productValue69) + productValue71, ((loadedBufferValue1.z - productValue72) * productValue69) + productValue72, multiplyAddValue18));
        float productValue73 = intermediateValue51 * 0.0039215688593685626983642578125;
        imageStore(outputBufferHistoryLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(productValue73, 0.0039215688593685626983642578125 / productValue69, productValue73, productValue73));
    }
}
