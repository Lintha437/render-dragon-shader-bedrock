#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / ReprojectSH / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 36
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
    uint reinterpretedBits = ((floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u) + 0u;
    uint reinterpretedBits1 = (floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u;
    uint reinterpretedBits2 = ((floatBitsToUint(RootConstants.packedValues[0u]).x >> 16u) & 255u) + 0u;
    if (scalarValue1 == 65504.0)
    {
        imageStore(outputBufferHistoryLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0039215688593685626983642578125));
        imageStore(outputBufferDiffuseMoments, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(outputBufferSpecularMoments, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(denoisingOutputs[reinterpretedBits2], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(outputBufferReflectionDistance, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
    }
    else
    {
        uvec4 reinterpretedBits3 = floatBitsToUint(ViewCB.packedValues[91u]);
        uint scalarValue2 = reinterpretedBits3.y;
        bool comparisonValue = scalarValue2 == 2u;
        uint intermediateValue6;
        if (comparisonValue)
        {
            intermediateValue6 = gl_GlobalInvocationID.x;
        }
        else
        {
            uint productValue = uint(ViewCB.packedValues[78u].x * 0.5);
            uint reinterpretedBits4 = (((scalarValue2 == 0u) ? floatBitsToUint(ViewCB.packedValues[84u]).z : 0u) + gl_GlobalInvocationID.y) & 1u;
            uint branchMergedValue23;
            if (gl_GlobalInvocationID.x < productValue)
            {
                branchMergedValue23 = ((gl_GlobalInvocationID.x << 1u) | 1u) - reinterpretedBits4;
            }
            else
            {
                branchMergedValue23 = reinterpretedBits4 | ((gl_GlobalInvocationID.x - productValue) << 1u);
            }
            intermediateValue6 = branchMergedValue23;
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
            uint branchMergedValue24;
            uint branchMergedValue30;
            uint branchMergedValue31;
            uint branchMergedValue32;
            if (comparisonValue)
            {
                branchMergedValue24 = 0u;
                branchMergedValue30 = uint(int(ViewCB.packedValues[78u].y));
                branchMergedValue31 = uint(int(ViewCB.packedValues[78u].x));
                branchMergedValue32 = gl_GlobalInvocationID.x;
            }
            else
            {
                uint scalarValue3 = uint(ViewCB.packedValues[80u].x);
                uint scalarValue4 = uint(ViewCB.packedValues[78u].y);
                uint branchMergedValue60;
                uint branchMergedValue62;
                uint branchMergedValue63;
                uint branchMergedValue64;
                if (gl_GlobalInvocationID.x < scalarValue3)
                {
                    branchMergedValue60 = 0u;
                    branchMergedValue62 = scalarValue4;
                    branchMergedValue63 = scalarValue3;
                    branchMergedValue64 = gl_GlobalInvocationID.x;
                }
                else
                {
                    branchMergedValue60 = scalarValue3;
                    branchMergedValue62 = scalarValue4;
                    branchMergedValue63 = uint(ViewCB.packedValues[78u].x);
                    branchMergedValue64 = gl_GlobalInvocationID.x;
                }
                branchMergedValue24 = branchMergedValue60;
                branchMergedValue30 = branchMergedValue62;
                branchMergedValue31 = branchMergedValue63;
                branchMergedValue32 = branchMergedValue64;
            }
            intermediateValue10 = branchMergedValue32;
            intermediateValue11 = branchMergedValue24;
            intermediateValue12 = branchMergedValue31;
            intermediateValue13 = branchMergedValue30;
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
        float productValue7 = comparisonValue5 * inverseLengthValue1;
        float productValue8 = ((scalarValue6 + (sumValue * ViewCB.packedValues[78u].z)) * 2.0) + (-1.0);
        float productValue9 = (1.0 - (ViewCB.packedValues[78u].w * productValue1)) - (scalarValue7 * 2.0);
        float multiplyAddValue = fma(0.5, ViewCB.packedValues[34u].w, fma(productValue9, ViewCB.packedValues[33u].w, ViewCB.packedValues[32u].w * productValue8)) + ViewCB.packedValues[35u].w;
        float multiplyAddValue1 = ((fma(0.5, ViewCB.packedValues[34u].x, fma(productValue9, ViewCB.packedValues[33u].x, ViewCB.packedValues[32u].x * productValue8)) + ViewCB.packedValues[35u].x) / multiplyAddValue) - ViewCB.packedValues[73u].x;
        float multiplyAddValue2 = ((fma(0.5, ViewCB.packedValues[34u].y, fma(productValue9, ViewCB.packedValues[33u].y, ViewCB.packedValues[32u].y * productValue8)) + ViewCB.packedValues[35u].y) / multiplyAddValue) - ViewCB.packedValues[73u].y;
        float multiplyAddValue3 = ((fma(0.5, ViewCB.packedValues[34u].z, fma(productValue9, ViewCB.packedValues[33u].z, ViewCB.packedValues[32u].z * productValue8)) + ViewCB.packedValues[35u].z) / multiplyAddValue) - ViewCB.packedValues[73u].z;
        float inverseLengthValue2 = inversesqrt(dot(vec3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3), vec3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3)));
        float multiplyAddValue4 = dot(vec3(fma(multiplyAddValue1 * inverseLengthValue2, scalarValue8, ViewCB.packedValues[73u].x), fma(multiplyAddValue2 * inverseLengthValue2, scalarValue8, ViewCB.packedValues[73u].y), fma(multiplyAddValue3 * inverseLengthValue2, scalarValue8, ViewCB.packedValues[73u].z)), vec3(productValue4, productValue5, productValue6));
        float multiplyAddValue5 = fma(scalarValue8, 0.004999999888241291046142578125, 0.02500000037252902984619140625);
        uvec4 reinterpretedBits5 = floatBitsToUint(RootConstants.packedValues[0u]);
        uint scalarValue15 = reinterpretedBits5.x;
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
        uint reinterpretedBits6;
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
            reinterpretedBits6 = floatBitsToUint(ViewCB.packedValues[91u]).y;
            comparisonValue7 = reinterpretedBits6 == 2u;
            uint branchMergedValue;
            uint branchMergedValue3;
            if (comparisonValue1)
            {
                uint branchMergedValue56;
                uint branchMergedValue58;
                if (comparisonValue7)
                {
                    branchMergedValue56 = sumValue16;
                    branchMergedValue58 = sumValue16;
                }
                else
                {
                    uint productValue10 = uint(ViewCB.packedValues[78u].x * 0.5);
                    uint reinterpretedBits7 = (((reinterpretedBits6 == 0u) ? (floatBitsToUint(ViewCB.packedValues[84u]).z + 1u) : 0u) + sumValue17) & 1u;
                    uint branchMergedValue66;
                    uint branchMergedValue67;
                    if (sumValue16 < productValue10)
                    {
                        branchMergedValue66 = sumValue16;
                        branchMergedValue67 = ((sumValue16 << 1u) | 1u) - reinterpretedBits7;
                    }
                    else
                    {
                        branchMergedValue66 = sumValue16;
                        branchMergedValue67 = reinterpretedBits7 | ((sumValue16 - productValue10) << 1u);
                    }
                    branchMergedValue56 = branchMergedValue66;
                    branchMergedValue58 = branchMergedValue67;
                }
                branchMergedValue = branchMergedValue56;
                branchMergedValue3 = branchMergedValue58;
            }
            else
            {
                uint branchMergedValue57;
                uint branchMergedValue59;
                if (comparisonValue7)
                {
                    branchMergedValue57 = sumValue16;
                    branchMergedValue59 = sumValue16;
                }
                else
                {
                    branchMergedValue57 = ((((((bitwiseValue3 + scalarValue17) ^ (scalarValue21 + scalarValue16)) & 1u) != 0u) != (((floatBitsToUint(ViewCB.packedValues[84u]).z & 1u) | reinterpretedBits6) != 0u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue16 >> 1u);
                    branchMergedValue59 = sumValue16;
                }
                branchMergedValue = branchMergedValue57;
                branchMergedValue3 = branchMergedValue59;
            }
            intermediateValue33 = branchMergedValue;
            intermediateValue34 = branchMergedValue3;
            float scalarValue22 = float(sumValue17);
            uint productValue11 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(intermediateValue33))), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x));
            uint productValue12 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * scalarValue22)), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x));
            vec4 sampledTextureValue6 = texelFetch(inputPreviousGeometryNormal, ivec2(uvec2(productValue11, productValue12)), int(0u));
            float scalarValue23 = sampledTextureValue6.x;
            float scalarValue24 = sampledTextureValue6.y;
            float sumValue19 = 1.0 - abs(scalarValue23);
            float scalarValue25 = abs(scalarValue24);
            float sumValue20 = sumValue19 - scalarValue25;
            bool conditionValue2 = sumValue20 < 0.0;
            float comparisonValue8 = conditionValue2 ? ((1.0 - scalarValue25) * ((scalarValue23 >= 0.0) ? 1.0 : (-1.0))) : scalarValue23;
            float comparisonValue9 = conditionValue2 ? (((scalarValue24 >= 0.0) ? 1.0 : (-1.0)) * sumValue19) : scalarValue24;
            float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue8, comparisonValue9, sumValue20), vec3(comparisonValue8, comparisonValue9, sumValue20)));
            vec4 sampledTextureValue7 = texelFetch(previousPrimaryPathLengthBuffer, ivec2(uvec2(productValue11, productValue12)), int(0u));
            float scalarValue26 = sampledTextureValue7.x;
            float productValue13 = (((float(intermediateValue34) + 0.5) * 2.0) * ViewCB.packedValues[78u].z) + (-1.0);
            float productValue14 = 1.0 - (((scalarValue22 + 0.5) * 2.0) * ViewCB.packedValues[78u].w);
            float multiplyAddValue6 = fma(0.5, ViewCB.packedValues[34u].w, fma(productValue14, ViewCB.packedValues[33u].w, ViewCB.packedValues[32u].w * productValue13)) + ViewCB.packedValues[35u].w;
            float multiplyAddValue7 = ((fma(0.5, ViewCB.packedValues[34u].x, fma(productValue14, ViewCB.packedValues[33u].x, ViewCB.packedValues[32u].x * productValue13)) + ViewCB.packedValues[35u].x) / multiplyAddValue6) - ViewCB.packedValues[73u].x;
            float multiplyAddValue8 = ((fma(0.5, ViewCB.packedValues[34u].y, fma(productValue14, ViewCB.packedValues[33u].y, ViewCB.packedValues[32u].y * productValue13)) + ViewCB.packedValues[35u].y) / multiplyAddValue6) - ViewCB.packedValues[73u].y;
            float multiplyAddValue9 = ((fma(0.5, ViewCB.packedValues[34u].z, fma(productValue14, ViewCB.packedValues[33u].z, ViewCB.packedValues[32u].z * productValue13)) + ViewCB.packedValues[35u].z) / multiplyAddValue6) - ViewCB.packedValues[73u].z;
            float inverseLengthValue4 = inversesqrt(dot(vec3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9), vec3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9)));
            float multiplyAddValue10 = (abs(multiplyAddValue4 - dot(vec3(fma(multiplyAddValue7 * inverseLengthValue4, scalarValue26, ViewCB.packedValues[73u].x), fma(multiplyAddValue8 * inverseLengthValue4, scalarValue26, ViewCB.packedValues[73u].y), fma(multiplyAddValue9 * inverseLengthValue4, scalarValue26, ViewCB.packedValues[73u].z)), vec3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0 : (spvNClamp(fma(dot(vec3(comparisonValue8 * inverseLengthValue3, comparisonValue9 * inverseLengthValue3, inverseLengthValue3 * sumValue20), vec3(productValue4, productValue5, productValue6)), 3.759398937225341796875, -2.2556393146514892578125), 0.0, 1.0) * comparisonValue6);
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
        float productValue15 = comparisonValue4 * inverseLengthValue1;
        float productValue16 = inverseLengthValue1 * sumValue11;
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
        float intermediateValue53;
        float intermediateValue54;
        float intermediateValue55;
        uint intermediateValue56;
        if (sumValue14 > 0.0)
        {
            float intermediateValue59;
            float intermediateValue61;
            float intermediateValue63;
            float intermediateValue65;
            float intermediateValue67;
            float intermediateValue69;
            float intermediateValue71;
            float intermediateValue73;
            float intermediateValue75;
            float intermediateValue77;
            float intermediateValue79;
            float intermediateValue81;
            float intermediateValue83;
            float intermediateValue85;
            float intermediateValue87;
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
            float scalarValue39 = 0.0;
            float scalarValue40 = 0.0;
            float scalarValue41 = 0.0;
            uint scalarValue42 = 0u;
            float intermediateValue89;
            bool comparisonValue15;
            for (;;)
            {
                intermediateValue89 = intermediateValue2[scalarValue42];
                comparisonValue15 = intermediateValue89 != 0.0;
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
                float branchMergedValue20;
                float branchMergedValue21;
                float branchMergedValue22;
                if (comparisonValue15)
                {
                    uint bitwiseValue5 = scalarValue42 >> 1u;
                    uint bitwiseValue6 = (scalarValue42 & 1u) + scalarValue16;
                    uint intermediateValue96;
                    if (comparisonValue1)
                    {
                        intermediateValue96 = bitwiseValue6;
                    }
                    else
                    {
                        uvec4 reinterpretedBits8 = floatBitsToUint(ViewCB.packedValues[91u]);
                        uint scalarValue43 = reinterpretedBits8.y;
                        uint branchMergedValue26;
                        if (scalarValue43 == 2u)
                        {
                            branchMergedValue26 = bitwiseValue6;
                        }
                        else
                        {
                            branchMergedValue26 = ((((((bitwiseValue5 + scalarValue17) ^ (scalarValue42 + scalarValue16)) & 1u) != 0u) != (((floatBitsToUint(ViewCB.packedValues[84u]).z & 1u) | scalarValue43) != 0u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (bitwiseValue6 >> 1u);
                        }
                        intermediateValue96 = branchMergedValue26;
                    }
                    uint productValue17 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(intermediateValue96))), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x));
                    uint bitwiseValue7 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float((bitwiseValue5 & 1u) + scalarValue17))), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x));
                    vec4 sampledTextureValue8 = texelFetch(previousDiffuseBuffer, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                    vec4 sampledTextureValue9 = texelFetch(previousDiffuseChromaBuffer, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                    vec4 sampledTextureValue10 = texelFetch(previousSpecularBuffer, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                    float productValue37;
                    float productValue38;
                    if (comparisonValue10)
                    {
                        vec4 sampledTextureValue11 = texelFetch(inputFinalDiffuseMoments, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                        productValue37 = (sampledTextureValue11.x * intermediateValue89) + scalarValue36;
                        productValue38 = (sampledTextureValue11.y * intermediateValue89) + scalarValue37;
                    }
                    else
                    {
                        productValue37 = scalarValue36;
                        productValue38 = scalarValue37;
                    }
                    float productValue39;
                    float productValue40;
                    if (comparisonValue11)
                    {
                        vec4 sampledTextureValue12 = texelFetch(inputFinalSpecularMoments, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                        productValue39 = (sampledTextureValue12.x * intermediateValue89) + scalarValue38;
                        productValue40 = (sampledTextureValue12.y * intermediateValue89) + scalarValue39;
                    }
                    else
                    {
                        productValue39 = scalarValue38;
                        productValue40 = scalarValue39;
                    }
                    vec4 sampledTextureValue13 = texelFetch(previousHistoryLengthBuffer, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                    float productValue18 = intermediateValue89 * 255.0;
                    branchMergedValue1 = (sampledTextureValue13.y * productValue18) + scalarValue41;
                    branchMergedValue4 = (sampledTextureValue13.x * productValue18) + scalarValue40;
                    branchMergedValue5 = productValue40;
                    branchMergedValue6 = productValue39;
                    branchMergedValue7 = productValue38;
                    branchMergedValue8 = productValue37;
                    branchMergedValue9 = (sampledTextureValue10.z * intermediateValue89) + scalarValue35;
                    branchMergedValue10 = (sampledTextureValue10.y * intermediateValue89) + scalarValue34;
                    branchMergedValue11 = (sampledTextureValue10.x * intermediateValue89) + scalarValue33;
                    branchMergedValue12 = (sampledTextureValue9.y * intermediateValue89) + scalarValue32;
                    branchMergedValue18 = (sampledTextureValue9.x * intermediateValue89) + scalarValue31;
                    branchMergedValue19 = (sampledTextureValue8.w * intermediateValue89) + scalarValue30;
                    branchMergedValue20 = (sampledTextureValue8.z * intermediateValue89) + scalarValue29;
                    branchMergedValue21 = (sampledTextureValue8.y * intermediateValue89) + scalarValue28;
                    branchMergedValue22 = (sampledTextureValue8.x * intermediateValue89) + scalarValue27;
                }
                else
                {
                    branchMergedValue1 = scalarValue41;
                    branchMergedValue4 = scalarValue40;
                    branchMergedValue5 = scalarValue39;
                    branchMergedValue6 = scalarValue38;
                    branchMergedValue7 = scalarValue37;
                    branchMergedValue8 = scalarValue36;
                    branchMergedValue9 = scalarValue35;
                    branchMergedValue10 = scalarValue34;
                    branchMergedValue11 = scalarValue33;
                    branchMergedValue12 = scalarValue32;
                    branchMergedValue18 = scalarValue31;
                    branchMergedValue19 = scalarValue30;
                    branchMergedValue20 = scalarValue29;
                    branchMergedValue21 = scalarValue28;
                    branchMergedValue22 = scalarValue27;
                }
                intermediateValue87 = branchMergedValue1;
                intermediateValue85 = branchMergedValue4;
                intermediateValue83 = branchMergedValue5;
                intermediateValue81 = branchMergedValue6;
                intermediateValue79 = branchMergedValue7;
                intermediateValue77 = branchMergedValue8;
                intermediateValue75 = branchMergedValue9;
                intermediateValue73 = branchMergedValue10;
                intermediateValue71 = branchMergedValue11;
                intermediateValue69 = branchMergedValue12;
                intermediateValue67 = branchMergedValue18;
                intermediateValue65 = branchMergedValue19;
                intermediateValue63 = branchMergedValue20;
                intermediateValue61 = branchMergedValue21;
                intermediateValue59 = branchMergedValue22;
                uint sumValue22 = scalarValue42 + 1u;
                if (sumValue22 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue27 = intermediateValue59;
                    scalarValue28 = intermediateValue61;
                    scalarValue29 = intermediateValue63;
                    scalarValue30 = intermediateValue65;
                    scalarValue31 = intermediateValue67;
                    scalarValue32 = intermediateValue69;
                    scalarValue33 = intermediateValue71;
                    scalarValue34 = intermediateValue73;
                    scalarValue35 = intermediateValue75;
                    scalarValue36 = intermediateValue77;
                    scalarValue37 = intermediateValue79;
                    scalarValue38 = intermediateValue81;
                    scalarValue39 = intermediateValue83;
                    scalarValue40 = intermediateValue85;
                    scalarValue41 = intermediateValue87;
                    scalarValue42 = sumValue22;
                    continue;
                }
            }
            float productValue19 = intermediateValue59 * quotientValue;
            float productValue20 = intermediateValue61 * quotientValue;
            float productValue21 = intermediateValue63 * quotientValue;
            float productValue22 = intermediateValue65 * quotientValue;
            float productValue23 = intermediateValue67 * quotientValue;
            float productValue24 = intermediateValue69 * quotientValue;
            float productValue25 = intermediateValue77 * quotientValue;
            float productValue26 = intermediateValue79 * quotientValue;
            float productValue27 = intermediateValue71 * quotientValue;
            float productValue28 = intermediateValue73 * quotientValue;
            float productValue29 = intermediateValue75 * quotientValue;
            float productValue30 = intermediateValue81 * quotientValue;
            float productValue31 = intermediateValue83 * quotientValue;
            float productValue32 = intermediateValue85 * quotientValue;
            float productValue33 = intermediateValue87 * quotientValue;
            bool reinterpretedBits9 = floatBitsToUint(ViewCB.packedValues[53u]).w != 0u;
            float comparisonValue12 = reinterpretedBits9 ? (productValue32 + 1.0) : productValue32;
            float comparisonValue13 = reinterpretedBits9 ? (productValue33 + 1.0) : productValue33;
            float branchMergedValue25;
            uint branchMergedValue33;
            float branchMergedValue34;
            float branchMergedValue35;
            float branchMergedValue36;
            float branchMergedValue37;
            float branchMergedValue38;
            float branchMergedValue39;
            float branchMergedValue40;
            float branchMergedValue41;
            float branchMergedValue50;
            float branchMergedValue51;
            float branchMergedValue52;
            float branchMergedValue53;
            float branchMergedValue54;
            float branchMergedValue55;
            if (floatBitsToUint(ViewCB.packedValues[87u]).w == 0u)
            {
                branchMergedValue25 = productValue31;
                branchMergedValue33 = 0u;
                branchMergedValue34 = comparisonValue13;
                branchMergedValue35 = comparisonValue12;
                branchMergedValue36 = productValue27;
                branchMergedValue37 = productValue30;
                branchMergedValue38 = productValue26;
                branchMergedValue39 = productValue25;
                branchMergedValue40 = productValue29;
                branchMergedValue41 = productValue28;
                branchMergedValue50 = productValue24;
                branchMergedValue51 = productValue23;
                branchMergedValue52 = productValue22;
                branchMergedValue53 = productValue21;
                branchMergedValue54 = productValue20;
                branchMergedValue55 = productValue19;
            }
            else
            {
                uvec4 sampledTextureValue14 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)));
                uint scalarValue44 = sampledTextureValue14.x;
                uint bitwiseValue8 = gl_LocalInvocationID.x >> 2u;
                uint bitwiseValue9 = gl_LocalInvocationID.y >> 2u;
                uint productValue34 = intermediateValue[bitwiseValue8 + (bitwiseValue9 * 5u)] - scalarValue44;
                float productValue64;
                if (int(uint(abs(int(productValue34)))) < int(200u))
                {
                    productValue64 = spvNMin(ViewCB.packedValues[98u].z, intermediateValue1[bitwiseValue8 + (bitwiseValue9 * 5u)]);
                }
                else
                {
                    productValue64 = ViewCB.packedValues[98u].z;
                }
                uint sumValue23 = bitwiseValue9 + 1u;
                uint productValue35 = intermediateValue[bitwiseValue8 + (sumValue23 * 5u)] - scalarValue44;
                float productValue70;
                if (int(uint(abs(int(productValue35)))) < int(200u))
                {
                    productValue70 = spvNMin(productValue64, intermediateValue1[bitwiseValue8 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue70 = productValue64;
                }
                uint sumValue24 = bitwiseValue8 + 1u;
                uint productValue36 = intermediateValue[sumValue24 + (bitwiseValue9 * 5u)] - scalarValue44;
                float productValue73;
                if (int(uint(abs(int(productValue36)))) < int(200u))
                {
                    productValue73 = spvNMin(productValue70, intermediateValue1[sumValue24 + (bitwiseValue9 * 5u)]);
                }
                else
                {
                    productValue73 = productValue70;
                }
                uint productValue41 = intermediateValue[sumValue24 + (sumValue23 * 5u)] - scalarValue44;
                float productValue80;
                if (int(uint(abs(int(productValue41)))) < int(200u))
                {
                    productValue80 = spvNMin(productValue73, intermediateValue1[sumValue24 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue80 = productValue73;
                }
                branchMergedValue25 = productValue31;
                branchMergedValue33 = 0u;
                branchMergedValue34 = spvNMin(comparisonValue13, productValue80);
                branchMergedValue35 = spvNMin(comparisonValue12, productValue80);
                branchMergedValue36 = productValue27;
                branchMergedValue37 = productValue30;
                branchMergedValue38 = productValue26;
                branchMergedValue39 = productValue25;
                branchMergedValue40 = productValue29;
                branchMergedValue41 = productValue28;
                branchMergedValue50 = productValue24;
                branchMergedValue51 = productValue23;
                branchMergedValue52 = productValue22;
                branchMergedValue53 = productValue21;
                branchMergedValue54 = productValue20;
                branchMergedValue55 = productValue19;
            }
            intermediateValue41 = branchMergedValue55;
            intermediateValue42 = branchMergedValue54;
            intermediateValue43 = branchMergedValue53;
            intermediateValue44 = branchMergedValue52;
            intermediateValue45 = branchMergedValue51;
            intermediateValue46 = branchMergedValue50;
            intermediateValue47 = branchMergedValue36;
            intermediateValue48 = branchMergedValue41;
            intermediateValue49 = branchMergedValue40;
            intermediateValue50 = branchMergedValue39;
            intermediateValue51 = branchMergedValue38;
            intermediateValue52 = branchMergedValue37;
            intermediateValue53 = branchMergedValue25;
            intermediateValue54 = branchMergedValue35;
            intermediateValue55 = branchMergedValue34;
            intermediateValue56 = branchMergedValue33;
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
            intermediateValue51 = 0.0;
            intermediateValue52 = 0.0;
            intermediateValue53 = 0.0;
            intermediateValue54 = 1.0;
            intermediateValue55 = 1.0;
            intermediateValue56 = 1u;
        }
        float productValue42 = ViewCB.packedValues[78u].z * sumValue5;
        float productValue43 = ViewCB.packedValues[78u].w * sumValue7;
        float productValue44 = ViewCB.packedValues[78u].z * (sumValue5 - sumValue2);
        float productValue45 = ViewCB.packedValues[78u].w * (sumValue7 - sumValue1);
        float comparisonValue14 = (productValue42 < 0.5) ? spvNMin(spvNClamp(((productValue44 < 0.0) ? productValue42 : (1.0 - productValue42)) / (abs(productValue44) + 9.9999997473787516355514526367188e-06), 0.0, 1.0), spvNClamp(((productValue45 < 0.0) ? productValue43 : (1.0 - productValue43)) / (abs(productValue45) + 9.9999997473787516355514526367188e-06), 0.0, 1.0)) : 1.0;
        vec4 loadedBufferValue = imageLoad(outputBufferIndirectDiffuse, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue45 = loadedBufferValue.w;
        vec4 loadedBufferValue1 = imageLoad(outputBufferIndirectDiffuseChroma, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float intermediateValue90;
        float intermediateValue91;
        float comparisonValue18;
        if (comparisonValue10)
        {
            float comparisonValue16 = spvNMin(spvNMax(1.0 / spvNMax(intermediateValue54, 0.00999999977648258209228515625), ViewCB.packedValues[88u].z), (sumValue14 == 0.0) ? 1.0 : 0.100000001490116119384765625);
            float productValue46 = (comparisonValue16 * (scalarValue45 - intermediateValue50)) + intermediateValue50;
            float productValue47 = (comparisonValue16 * ((scalarValue45 * scalarValue45) - intermediateValue51)) + intermediateValue51;
            float exponentialValue = spvNMax(exp2((12.0 / intermediateValue54) + 1.0) + (-10.55606365203857421875), 0.0);
            float comparisonValue17 = (intermediateValue56 != 0u) ? (exponentialValue + 1000000.0) : exponentialValue;
            float productValue48 = spvNMax(0.0, productValue47 - (productValue46 * productValue46));
            float sumValue25 = comparisonValue17 + productValue48;
            intermediateValue90 = productValue46;
            intermediateValue91 = productValue47;
            comparisonValue18 = (comparisonValue17 > productValue48) ? ((-0.0) - sumValue25) : sumValue25;
        }
        else
        {
            intermediateValue90 = 0.0;
            intermediateValue91 = 0.0;
            comparisonValue18 = 0.0;
        }
        imageStore(outputBufferDiffuseMoments, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue90, intermediateValue91, intermediateValue90, intermediateValue90));
        float quotientValue1 = ((spvNMax(ViewCB.packedValues[88u].y, 1.0 / intermediateValue54) + (-1.0)) * comparisonValue14) + 1.0;
        float intermediateValue92;
        if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
        {
            intermediateValue92 = 1.0;
        }
        else
        {
            intermediateValue92 = uintBitsToFloat(texelFetch(inputIncidentLight, int(4u)).x);
        }
        float dotProductValue = dot(vec3(intermediateValue92), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float productValue49 = dotProductValue * intermediateValue41;
        float productValue50 = dotProductValue * intermediateValue42;
        float productValue51 = dotProductValue * intermediateValue43;
        float productValue52 = dotProductValue * intermediateValue44;
        float productValue53 = dotProductValue * intermediateValue45;
        float productValue54 = dotProductValue * intermediateValue46;
        imageStore(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(((loadedBufferValue.x - productValue49) * quotientValue1) + productValue49, ((loadedBufferValue.y - productValue50) * quotientValue1) + productValue50, ((loadedBufferValue.z - productValue51) * quotientValue1) + productValue51, ((scalarValue45 - productValue52) * quotientValue1) + productValue52));
        imageStore(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(((loadedBufferValue1.x - productValue53) * quotientValue1) + productValue53, ((loadedBufferValue1.y - productValue54) * quotientValue1) + productValue54, 0.0, comparisonValue18));
        vec4 loadedBufferValue2 = imageLoad(outputBufferIndirectSpecular, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue46 = loadedBufferValue2.x;
        vec4 sampledTextureValue15 = texelFetch(inputEmissiveAndLinearRoughness, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue47 = sampledTextureValue15.w;
        vec4 loadedBufferValue3 = imageLoad(outputBufferReflectionDistance, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue48 = loadedBufferValue3.x;
        float sumValue26 = scalarValue48 + scalarValue1;
        float productValue55 = ((sumValue * 2.0) * ViewCB.packedValues[78u].z) + (-1.0);
        float productValue56 = 1.0 - (ViewCB.packedValues[78u].w * productValue1);
        float multiplyAddValue11 = fma(0.5, ViewCB.packedValues[22u].w, fma(productValue56, ViewCB.packedValues[21u].w, productValue55 * ViewCB.packedValues[20u].w)) + ViewCB.packedValues[23u].w;
        float multiplyAddValue12 = ((fma(0.5, ViewCB.packedValues[22u].x, fma(productValue56, ViewCB.packedValues[21u].x, productValue55 * ViewCB.packedValues[20u].x)) + ViewCB.packedValues[23u].x) / multiplyAddValue11) - ViewCB.packedValues[72u].x;
        float multiplyAddValue13 = ((fma(0.5, ViewCB.packedValues[22u].y, fma(productValue56, ViewCB.packedValues[21u].y, productValue55 * ViewCB.packedValues[20u].y)) + ViewCB.packedValues[23u].y) / multiplyAddValue11) - ViewCB.packedValues[72u].y;
        float multiplyAddValue14 = ((fma(0.5, ViewCB.packedValues[22u].z, fma(productValue56, ViewCB.packedValues[21u].z, productValue55 * ViewCB.packedValues[20u].z)) + ViewCB.packedValues[23u].z) / multiplyAddValue11) - ViewCB.packedValues[72u].z;
        float inverseLengthValue5 = inversesqrt(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14))) * sumValue26;
        float productValue57 = ((inverseLengthValue5 * multiplyAddValue12) - ViewCB.packedValues[71u].x) + ViewCB.packedValues[72u].x;
        float productValue59 = ((inverseLengthValue5 * multiplyAddValue13) - ViewCB.packedValues[71u].y) + ViewCB.packedValues[72u].y;
        float productValue60 = ((inverseLengthValue5 * multiplyAddValue14) - ViewCB.packedValues[71u].z) + ViewCB.packedValues[72u].z;
        float multiplyAddValue15 = fma(productValue60, ViewCB.packedValues[26u].w, fma(productValue59, ViewCB.packedValues[25u].w, productValue57 * ViewCB.packedValues[24u].w)) + ViewCB.packedValues[27u].w;
        float multiplyAddValue16 = (sumValue3 * 0.5) * (((fma(productValue60, ViewCB.packedValues[26u].x, fma(productValue59, ViewCB.packedValues[25u].x, productValue57 * ViewCB.packedValues[24u].x)) + ViewCB.packedValues[27u].x) / multiplyAddValue15) - productValue55);
        float multiplyAddValue17 = (scalarValue5 * (-0.5)) * (((fma(productValue60, ViewCB.packedValues[26u].y, fma(productValue59, ViewCB.packedValues[25u].y, productValue57 * ViewCB.packedValues[24u].y)) + ViewCB.packedValues[27u].y) / multiplyAddValue15) - productValue56);
        float sumValue27 = multiplyAddValue16 - productValue2;
        float sumValue28 = multiplyAddValue17 - productValue3;
        float nonlinearValue1 = spvNMax(sqrt((sumValue28 * sumValue28) + (sumValue27 * sumValue27)) + (-0.100000001490116119384765625), 0.0);
        float productValue61 = nonlinearValue1 * 0.02500000037252902984619140625;
        float quotientValue2 = spvNMax(((scalarValue47 * scalarValue47) * scalarValue48) / sumValue26, scalarValue47 * 0.5);
        float quotientValue3 = spvNMax(spvNMax(ViewCB.packedValues[88u].w, 1.0 / intermediateValue55), spvNMin(productValue61, 1.0) * 0.25);
        float productValue62 = spvNMin(((1.0 - quotientValue2) * (1.0 - productValue61)) + productValue61, 1.0);
        float intermediateValue102;
        float intermediateValue103;
        float intermediateValue104;
        float intermediateValue105;
        float intermediateValue106;
        float intermediateValue107;
        float intermediateValue109;
        if ((sumValue14 != 0.0) && (productValue62 > 0.0))
        {
            float sumValue29 = (multiplyAddValue16 + sumValue4) + (-0.5);
            float sumValue32 = (multiplyAddValue17 + sumValue6) + (-0.5);
            uint scalarValue49 = uint(int(floor(sumValue29)));
            uint scalarValue50 = uint(int(floor(sumValue32)));
            float scalarValue51 = fract(sumValue29);
            float scalarValue52 = fract(sumValue32);
            float nonlinearValue2 = log2(spvNMax(scalarValue48, 0.00999999977648258209228515625));
            float intermediateValue108;
            float intermediateValue114;
            float intermediateValue116;
            float intermediateValue118;
            float intermediateValue120;
            float intermediateValue122;
            float scalarValue53 = 0.0;
            uint scalarValue54 = 0u;
            float scalarValue55 = 0.0;
            float scalarValue56 = 0.0;
            float scalarValue57 = 0.0;
            float scalarValue58 = 0.0;
            float scalarValue59 = 0.0;
            uint bitwiseValue11;
            uint sumValue30;
            uint sumValue31;
            float productValue58;
            uint reinterpretedBits10;
            bool comparisonValue19;
            for (;;)
            {
                uint bitwiseValue10 = scalarValue54 & 1u;
                bitwiseValue11 = scalarValue54 >> 1u;
                uint bitwiseValue12 = bitwiseValue11 & 1u;
                sumValue30 = bitwiseValue10 + scalarValue49;
                sumValue31 = bitwiseValue12 + scalarValue50;
                float sumValue33 = 1.0 - scalarValue51;
                float sumValue34 = 1.0 - scalarValue52;
                productValue58 = ((float(int(bitwiseValue12)) * (scalarValue52 - sumValue34)) + sumValue34) * ((float(int(bitwiseValue10)) * (scalarValue51 - sumValue33)) + sumValue33);
                reinterpretedBits10 = floatBitsToUint(ViewCB.packedValues[91u]).y;
                comparisonValue19 = reinterpretedBits10 == 2u;
                uint intermediateValue126;
                uint intermediateValue127;
                if (comparisonValue1)
                {
                    uint branchMergedValue28;
                    uint branchMergedValue48;
                    if (comparisonValue19)
                    {
                        branchMergedValue28 = sumValue30;
                        branchMergedValue48 = sumValue30;
                    }
                    else
                    {
                        uint productValue63 = uint(ViewCB.packedValues[78u].x * 0.5);
                        uint reinterpretedBits11 = (((reinterpretedBits10 == 0u) ? (floatBitsToUint(ViewCB.packedValues[84u]).z + 1u) : 0u) + sumValue31) & 1u;
                        uint branchMergedValue61;
                        uint branchMergedValue65;
                        if (sumValue30 < productValue63)
                        {
                            branchMergedValue61 = ((sumValue30 << 1u) | 1u) - reinterpretedBits11;
                            branchMergedValue65 = sumValue30;
                        }
                        else
                        {
                            branchMergedValue61 = reinterpretedBits11 | ((sumValue30 - productValue63) << 1u);
                            branchMergedValue65 = sumValue30;
                        }
                        branchMergedValue28 = branchMergedValue61;
                        branchMergedValue48 = branchMergedValue65;
                    }
                    intermediateValue126 = branchMergedValue48;
                    intermediateValue127 = branchMergedValue28;
                }
                else
                {
                    uint branchMergedValue29;
                    uint branchMergedValue49;
                    if (comparisonValue19)
                    {
                        branchMergedValue29 = sumValue30;
                        branchMergedValue49 = sumValue30;
                    }
                    else
                    {
                        branchMergedValue29 = sumValue30;
                        branchMergedValue49 = ((((((bitwiseValue11 + scalarValue50) ^ (scalarValue54 + scalarValue49)) & 1u) != 0u) != (((floatBitsToUint(ViewCB.packedValues[84u]).z & 1u) | reinterpretedBits10) != 0u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue30 >> 1u);
                    }
                    intermediateValue126 = branchMergedValue49;
                    intermediateValue127 = branchMergedValue29;
                }
                float branchMergedValue2;
                float branchMergedValue13;
                float branchMergedValue14;
                float branchMergedValue15;
                float branchMergedValue16;
                float branchMergedValue17;
                if (((int(sumValue31) < int(0u)) || (int(intermediateValue126) < int(intermediateValue11))) || ((int(sumValue31) >= int(intermediateValue13)) || (int(intermediateValue126) >= int(intermediateValue12))))
                {
                    branchMergedValue2 = scalarValue59;
                    branchMergedValue13 = scalarValue58;
                    branchMergedValue14 = scalarValue57;
                    branchMergedValue15 = scalarValue55;
                    branchMergedValue16 = scalarValue56;
                    branchMergedValue17 = scalarValue53;
                }
                else
                {
                    uint productValue65 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(intermediateValue126))), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x));
                    uint productValue66 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(sumValue31))), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x));
                    float productValue67 = scalarValue47 * (-0.25);
                    vec4 sampledTextureValue16 = texelFetch(previousPrimaryNormalBuffer, ivec2(uvec2(productValue65, productValue66)), int(0u));
                    float scalarValue60 = sampledTextureValue16.x;
                    float scalarValue61 = sampledTextureValue16.y;
                    float sumValue35 = 1.0 - abs(scalarValue60);
                    float scalarValue62 = abs(scalarValue61);
                    float sumValue36 = sumValue35 - scalarValue62;
                    bool conditionValue3 = sumValue36 < 0.0;
                    float comparisonValue20 = conditionValue3 ? ((1.0 - scalarValue62) * ((scalarValue60 >= 0.0) ? 1.0 : (-1.0))) : scalarValue60;
                    float comparisonValue21 = conditionValue3 ? (((scalarValue61 >= 0.0) ? 1.0 : (-1.0)) * sumValue35) : scalarValue61;
                    float inverseLengthValue6 = inversesqrt(dot(vec3(comparisonValue20, comparisonValue21, sumValue36), vec3(comparisonValue20, comparisonValue21, sumValue36)));
                    float sumValue37 = 0.050000011920928955078125 - productValue67;
                    vec4 sampledTextureValue17 = texelFetch(previousPrimaryPathLengthBuffer, ivec2(uvec2(productValue65, productValue66)), int(0u));
                    float scalarValue63 = sampledTextureValue17.x;
                    float productValue68 = (((float(int(intermediateValue127)) + 0.5) * 2.0) * ViewCB.packedValues[78u].z) + (-1.0);
                    float productValue69 = 1.0 - (((float(int(sumValue31)) + 0.5) * 2.0) * ViewCB.packedValues[78u].w);
                    float multiplyAddValue19 = fma(0.5, ViewCB.packedValues[34u].w, fma(productValue69, ViewCB.packedValues[33u].w, ViewCB.packedValues[32u].w * productValue68)) + ViewCB.packedValues[35u].w;
                    float multiplyAddValue20 = ((fma(0.5, ViewCB.packedValues[34u].x, fma(productValue69, ViewCB.packedValues[33u].x, ViewCB.packedValues[32u].x * productValue68)) + ViewCB.packedValues[35u].x) / multiplyAddValue19) - ViewCB.packedValues[73u].x;
                    float multiplyAddValue21 = ((fma(0.5, ViewCB.packedValues[34u].y, fma(productValue69, ViewCB.packedValues[33u].y, ViewCB.packedValues[32u].y * productValue68)) + ViewCB.packedValues[35u].y) / multiplyAddValue19) - ViewCB.packedValues[73u].y;
                    float multiplyAddValue22 = ((fma(0.5, ViewCB.packedValues[34u].z, fma(productValue69, ViewCB.packedValues[33u].z, ViewCB.packedValues[32u].z * productValue68)) + ViewCB.packedValues[35u].z) / multiplyAddValue19) - ViewCB.packedValues[73u].z;
                    float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22), vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22)));
                    float sampledTextureValue18 = spvNClamp(fma(abs(nonlinearValue2 - log2(spvNMax(texelFetch(previousReflectionDistanceBuffer, ivec2(uvec2(productValue65, productValue66)), int(0u)).x, 0.00999999977648258209228515625))), -2.0, 2.0), 0.0, 1.0);
                    float sampledTextureValue19 = (((1.0 - sampledTextureValue18) * scalarValue47) + sampledTextureValue18) * ((abs(multiplyAddValue4 - dot(vec3(fma(multiplyAddValue20 * inverseLengthValue7, scalarValue63, ViewCB.packedValues[73u].x), fma(multiplyAddValue21 * inverseLengthValue7, scalarValue63, ViewCB.packedValues[73u].y), fma(multiplyAddValue22 * inverseLengthValue7, scalarValue63, ViewCB.packedValues[73u].z)), vec3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0 : ((productValue58 * spvNClamp(fma(dot(vec3(productValue15, productValue7, productValue16), vec3(comparisonValue20 * inverseLengthValue6, comparisonValue21 * inverseLengthValue6, inverseLengthValue6 * sumValue36)), 1.0 / sumValue37, ((-0.0) - (productValue67 + 0.949999988079071044921875)) / sumValue37), 0.0, 1.0)) * spvNClamp(fma(abs(scalarValue47 - texelFetch(previousLinearRoughnessBuffer, ivec2(uvec2(productValue65, productValue66)), int(0u)).x), -12.5, 1.5), 0.0, 1.0)));
                    vec4 sampledTextureValue20 = texelFetch(previousSpecularBuffer, ivec2(uvec2(productValue65, productValue66)), int(0u));
                    vec4 sampledTextureValue21 = texelFetch(inputFinalSpecularMoments, ivec2(uvec2(intermediateValue126, sumValue31)), int(0u));
                    branchMergedValue2 = (sampledTextureValue21.y * sampledTextureValue19) + scalarValue59;
                    branchMergedValue13 = (sampledTextureValue21.x * sampledTextureValue19) + scalarValue58;
                    branchMergedValue14 = (sampledTextureValue19 * sampledTextureValue20.z) + scalarValue57;
                    branchMergedValue15 = (sampledTextureValue19 * sampledTextureValue20.x) + scalarValue55;
                    branchMergedValue16 = (sampledTextureValue19 * sampledTextureValue20.y) + scalarValue56;
                    branchMergedValue17 = sampledTextureValue19 + scalarValue53;
                }
                intermediateValue122 = branchMergedValue2;
                intermediateValue120 = branchMergedValue13;
                intermediateValue118 = branchMergedValue14;
                intermediateValue114 = branchMergedValue15;
                intermediateValue116 = branchMergedValue16;
                intermediateValue108 = branchMergedValue17;
                uint sumValue38 = scalarValue54 + 1u;
                if (sumValue38 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue53 = intermediateValue108;
                    scalarValue54 = sumValue38;
                    scalarValue55 = intermediateValue114;
                    scalarValue56 = intermediateValue116;
                    scalarValue57 = intermediateValue118;
                    scalarValue58 = intermediateValue120;
                    scalarValue59 = intermediateValue122;
                    continue;
                }
            }
            float branchMergedValue27;
            float branchMergedValue42;
            float branchMergedValue43;
            float branchMergedValue44;
            float branchMergedValue45;
            float branchMergedValue46;
            float branchMergedValue47;
            if (intermediateValue108 > 0.00999999977648258209228515625)
            {
                branchMergedValue27 = quotientValue3;
                branchMergedValue42 = intermediateValue108;
                branchMergedValue43 = (((intermediateValue122 / intermediateValue108) - intermediateValue53) * productValue62) + intermediateValue53;
                branchMergedValue44 = (((intermediateValue120 / intermediateValue108) - intermediateValue52) * productValue62) + intermediateValue52;
                branchMergedValue45 = (((intermediateValue118 / intermediateValue108) - intermediateValue49) * productValue62) + intermediateValue49;
                branchMergedValue46 = (((intermediateValue116 / intermediateValue108) - intermediateValue48) * productValue62) + intermediateValue48;
                branchMergedValue47 = (((intermediateValue114 / intermediateValue108) - intermediateValue47) * productValue62) + intermediateValue47;
            }
            else
            {
                branchMergedValue27 = 1.0;
                branchMergedValue42 = intermediateValue108;
                branchMergedValue43 = intermediateValue53;
                branchMergedValue44 = intermediateValue52;
                branchMergedValue45 = intermediateValue49;
                branchMergedValue46 = intermediateValue48;
                branchMergedValue47 = intermediateValue47;
            }
            intermediateValue102 = branchMergedValue47;
            intermediateValue103 = branchMergedValue46;
            intermediateValue104 = branchMergedValue45;
            intermediateValue105 = branchMergedValue44;
            intermediateValue106 = branchMergedValue43;
            intermediateValue107 = branchMergedValue42;
            intermediateValue109 = branchMergedValue27;
        }
        else
        {
            intermediateValue102 = intermediateValue47;
            intermediateValue103 = intermediateValue48;
            intermediateValue104 = intermediateValue49;
            intermediateValue105 = intermediateValue52;
            intermediateValue106 = intermediateValue53;
            intermediateValue107 = sumValue14;
            intermediateValue109 = quotientValue3;
        }
        float intermediateValue123;
        float intermediateValue124;
        float multiplyAddValue18;
        if (comparisonValue11)
        {
            float dotProductValue1 = dot(vec3(scalarValue46, loadedBufferValue2.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float comparisonValue22 = spvNMin(spvNMax(1.0 / spvNMax(intermediateValue55, 0.00999999977648258209228515625), ViewCB.packedValues[89u].x), (intermediateValue107 == 0.0) ? 1.0 : 0.100000001490116119384765625);
            float productValue71 = (comparisonValue22 * (dotProductValue1 - intermediateValue105)) + intermediateValue105;
            float productValue72 = (comparisonValue22 * ((dotProductValue1 * dotProductValue1) - intermediateValue106)) + intermediateValue106;
            float exponentialValue1 = spvNMax(exp2((12.0 / intermediateValue55) + 1.0) + (-10.55606365203857421875), 0.0);
            float comparisonValue23 = (intermediateValue56 != 0u) ? (exponentialValue1 + 1000000.0) : exponentialValue1;
            float productValue74 = spvNMax(0.0, productValue72 - (productValue71 * productValue71));
            float sumValue39 = comparisonValue23 + productValue74;
            intermediateValue123 = productValue71;
            intermediateValue124 = productValue72;
            multiplyAddValue18 = ((comparisonValue23 > productValue74) ? ((-0.0) - sumValue39) : sumValue39) * fma(productValue62, (nonlinearValue1 * 200.0) * quotientValue2, 1.0);
        }
        else
        {
            intermediateValue123 = 0.0;
            intermediateValue124 = 0.0;
            multiplyAddValue18 = 0.0;
        }
        imageStore(outputBufferSpecularMoments, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue123, intermediateValue124, intermediateValue123, intermediateValue123));
        float productValue75 = ((intermediateValue109 + (-1.0)) * comparisonValue14) + 1.0;
        float intermediateValue125;
        if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
        {
            intermediateValue125 = 1.0;
        }
        else
        {
            intermediateValue125 = uintBitsToFloat(texelFetch(inputIncidentLight, int(4u)).x);
        }
        float productValue76 = intermediateValue125 * intermediateValue102;
        float productValue77 = intermediateValue125 * intermediateValue103;
        float productValue78 = intermediateValue125 * intermediateValue104;
        imageStore(denoisingOutputs[reinterpretedBits2], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(((scalarValue46 - productValue76) * productValue75) + productValue76, ((loadedBufferValue2.y - productValue77) * productValue75) + productValue77, ((loadedBufferValue2.z - productValue78) * productValue75) + productValue78, multiplyAddValue18));
        float productValue79 = intermediateValue54 * 0.0039215688593685626983642578125;
        imageStore(outputBufferHistoryLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(productValue79, 0.0039215688593685626983642578125 / productValue75, productValue79, productValue79));
    }
}
