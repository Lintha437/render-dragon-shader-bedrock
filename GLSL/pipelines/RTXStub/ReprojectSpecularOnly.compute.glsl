#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / ReprojectSpecularOnly / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 38
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
            uint branchMergedValue15;
            if (gl_GlobalInvocationID.x < productValue)
            {
                branchMergedValue15 = ((gl_GlobalInvocationID.x << 1u) | 1u) - reinterpretedBits2;
            }
            else
            {
                branchMergedValue15 = reinterpretedBits2 | ((gl_GlobalInvocationID.x - productValue) << 1u);
            }
            intermediateValue6 = branchMergedValue15;
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
            uint branchMergedValue16;
            uint branchMergedValue22;
            uint branchMergedValue23;
            uint branchMergedValue24;
            if (comparisonValue)
            {
                branchMergedValue16 = gl_GlobalInvocationID.x;
                branchMergedValue22 = 0u;
                branchMergedValue23 = uint(int(ViewCB.packedValues[78u].x));
                branchMergedValue24 = uint(int(ViewCB.packedValues[78u].y));
            }
            else
            {
                uint scalarValue3 = uint(ViewCB.packedValues[80u].x);
                uint scalarValue4 = uint(ViewCB.packedValues[78u].y);
                uint branchMergedValue44;
                uint branchMergedValue46;
                uint branchMergedValue47;
                uint branchMergedValue48;
                if (gl_GlobalInvocationID.x < scalarValue3)
                {
                    branchMergedValue44 = gl_GlobalInvocationID.x;
                    branchMergedValue46 = 0u;
                    branchMergedValue47 = scalarValue3;
                    branchMergedValue48 = scalarValue4;
                }
                else
                {
                    branchMergedValue44 = gl_GlobalInvocationID.x;
                    branchMergedValue46 = scalarValue3;
                    branchMergedValue47 = uint(ViewCB.packedValues[78u].x);
                    branchMergedValue48 = scalarValue4;
                }
                branchMergedValue16 = branchMergedValue44;
                branchMergedValue22 = branchMergedValue46;
                branchMergedValue23 = branchMergedValue47;
                branchMergedValue24 = branchMergedValue48;
            }
            intermediateValue10 = branchMergedValue16;
            intermediateValue11 = branchMergedValue22;
            intermediateValue12 = branchMergedValue23;
            intermediateValue13 = branchMergedValue24;
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
        float sumValue12 = sumValue5 + (-0.5);
        float sumValue13 = sumValue7 + (-0.5);
        uint scalarValue15 = uint(int(floor(sumValue12)));
        uint scalarValue16 = uint(int(floor(sumValue13)));
        float scalarValue17 = fract(sumValue12);
        float scalarValue18 = fract(sumValue13);
        float sumValue14;
        uint intermediateValue32;
        uint intermediateValue33;
        float intermediateValue2[4];
        float scalarValue19 = 0.0;
        uint scalarValue20 = 0u;
        uint bitwiseValue3;
        uint sumValue16;
        uint sumValue17;
        float comparisonValue6;
        uint reinterpretedBits3;
        bool comparisonValue7;
        for (;;)
        {
            uint bitwiseValue2 = scalarValue20 & 1u;
            bitwiseValue3 = scalarValue20 >> 1u;
            uint bitwiseValue4 = bitwiseValue3 & 1u;
            sumValue16 = bitwiseValue2 + scalarValue15;
            sumValue17 = bitwiseValue4 + scalarValue16;
            float sumValue15 = 1.0 - scalarValue17;
            float sumValue18 = 1.0 - scalarValue18;
            comparisonValue6 = (((int(sumValue16) < int(intermediateValue11)) || (int(sumValue17) < int(0u))) || ((int(sumValue16) >= int(intermediateValue12)) || (int(sumValue17) >= int(intermediateValue13)))) ? 0.0 : (((float(int(bitwiseValue4)) * (scalarValue18 - sumValue18)) + sumValue18) * ((float(int(bitwiseValue2)) * (scalarValue17 - sumValue15)) + sumValue15));
            reinterpretedBits3 = floatBitsToUint(ViewCB.packedValues[91u]).y;
            comparisonValue7 = reinterpretedBits3 == 2u;
            uint branchMergedValue;
            uint branchMergedValue3;
            if (comparisonValue1)
            {
                uint branchMergedValue40;
                uint branchMergedValue42;
                if (comparisonValue7)
                {
                    branchMergedValue40 = sumValue16;
                    branchMergedValue42 = sumValue16;
                }
                else
                {
                    uint productValue12 = uint(ViewCB.packedValues[78u].x * 0.5);
                    uint reinterpretedBits4 = (((reinterpretedBits3 == 0u) ? (floatBitsToUint(ViewCB.packedValues[84u]).z + 1u) : 0u) + sumValue17) & 1u;
                    uint branchMergedValue50;
                    uint branchMergedValue51;
                    if (sumValue16 < productValue12)
                    {
                        branchMergedValue50 = sumValue16;
                        branchMergedValue51 = ((sumValue16 << 1u) | 1u) - reinterpretedBits4;
                    }
                    else
                    {
                        branchMergedValue50 = sumValue16;
                        branchMergedValue51 = reinterpretedBits4 | ((sumValue16 - productValue12) << 1u);
                    }
                    branchMergedValue40 = branchMergedValue50;
                    branchMergedValue42 = branchMergedValue51;
                }
                branchMergedValue = branchMergedValue40;
                branchMergedValue3 = branchMergedValue42;
            }
            else
            {
                uint branchMergedValue41;
                uint branchMergedValue43;
                if (comparisonValue7)
                {
                    branchMergedValue41 = sumValue16;
                    branchMergedValue43 = sumValue16;
                }
                else
                {
                    branchMergedValue41 = ((((((bitwiseValue3 + scalarValue16) ^ (scalarValue20 + scalarValue15)) & 1u) != 0u) != (((floatBitsToUint(ViewCB.packedValues[84u]).z & 1u) | reinterpretedBits3) != 0u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue16 >> 1u);
                    branchMergedValue43 = sumValue16;
                }
                branchMergedValue = branchMergedValue41;
                branchMergedValue3 = branchMergedValue43;
            }
            intermediateValue32 = branchMergedValue;
            intermediateValue33 = branchMergedValue3;
            float scalarValue21 = float(sumValue17);
            uint productValue13 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(intermediateValue32))), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x));
            uint productValue14 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * scalarValue21)), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x));
            vec4 sampledTextureValue6 = texelFetch(previousPrimaryNormalBuffer, ivec2(uvec2(productValue13, productValue14)), int(0u));
            float scalarValue22 = sampledTextureValue6.x;
            float scalarValue23 = sampledTextureValue6.y;
            float sumValue19 = 1.0 - abs(scalarValue22);
            float scalarValue24 = abs(scalarValue23);
            float sumValue20 = sumValue19 - scalarValue24;
            bool conditionValue2 = sumValue20 < 0.0;
            float comparisonValue8 = conditionValue2 ? ((1.0 - scalarValue24) * ((scalarValue22 >= 0.0) ? 1.0 : (-1.0))) : scalarValue22;
            float comparisonValue9 = conditionValue2 ? (((scalarValue23 >= 0.0) ? 1.0 : (-1.0)) * sumValue19) : scalarValue23;
            float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue8, comparisonValue9, sumValue20), vec3(comparisonValue8, comparisonValue9, sumValue20)));
            vec4 sampledTextureValue7 = texelFetch(previousPrimaryPathLengthBuffer, ivec2(uvec2(productValue13, productValue14)), int(0u));
            float scalarValue25 = sampledTextureValue7.x;
            float productValue15 = (((float(intermediateValue33) + 0.5) * 2.0) * ViewCB.packedValues[78u].z) + (-1.0);
            float productValue16 = 1.0 - (((scalarValue21 + 0.5) * 2.0) * ViewCB.packedValues[78u].w);
            float multiplyAddValue6 = fma(0.5, ViewCB.packedValues[34u].w, fma(productValue16, ViewCB.packedValues[33u].w, ViewCB.packedValues[32u].w * productValue15)) + ViewCB.packedValues[35u].w;
            float multiplyAddValue7 = ((fma(0.5, ViewCB.packedValues[34u].x, fma(productValue16, ViewCB.packedValues[33u].x, ViewCB.packedValues[32u].x * productValue15)) + ViewCB.packedValues[35u].x) / multiplyAddValue6) - ViewCB.packedValues[73u].x;
            float multiplyAddValue8 = ((fma(0.5, ViewCB.packedValues[34u].y, fma(productValue16, ViewCB.packedValues[33u].y, ViewCB.packedValues[32u].y * productValue15)) + ViewCB.packedValues[35u].y) / multiplyAddValue6) - ViewCB.packedValues[73u].y;
            float multiplyAddValue9 = ((fma(0.5, ViewCB.packedValues[34u].z, fma(productValue16, ViewCB.packedValues[33u].z, ViewCB.packedValues[32u].z * productValue15)) + ViewCB.packedValues[35u].z) / multiplyAddValue6) - ViewCB.packedValues[73u].z;
            float inverseLengthValue4 = inversesqrt(dot(vec3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9), vec3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9)));
            float multiplyAddValue10 = (abs(multiplyAddValue4 - dot(vec3(fma(multiplyAddValue7 * inverseLengthValue4, scalarValue25, ViewCB.packedValues[73u].x), fma(multiplyAddValue8 * inverseLengthValue4, scalarValue25, ViewCB.packedValues[73u].y), fma(multiplyAddValue9 * inverseLengthValue4, scalarValue25, ViewCB.packedValues[73u].z)), vec3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0 : (spvNClamp(fma(dot(vec3(comparisonValue8 * inverseLengthValue3, comparisonValue9 * inverseLengthValue3, inverseLengthValue3 * sumValue20), vec3(productValue7, productValue8, productValue9)), 3.759398937225341796875, -2.2556393146514892578125), 0.0, 1.0) * comparisonValue6);
            intermediateValue2[scalarValue20] = multiplyAddValue10;
            sumValue14 = multiplyAddValue10 + scalarValue19;
            uint sumValue21 = scalarValue20 + 1u;
            if (sumValue21 == 4u)
            {
                break;
            }
            else
            {
                scalarValue19 = sumValue14;
                scalarValue20 = sumValue21;
                continue;
            }
        }
        bool reinterpretedBits5 = (floatBitsToUint(RootConstants.packedValues[0u]).x & 2u) != 0u;
        float quotientValue = 1.0 / sumValue14;
        float intermediateValue40;
        float intermediateValue41;
        float intermediateValue42;
        float intermediateValue43;
        float intermediateValue44;
        float intermediateValue45;
        float intermediateValue46;
        uint intermediateValue47;
        if (sumValue14 > 0.0)
        {
            float intermediateValue52;
            float intermediateValue54;
            float intermediateValue56;
            float intermediateValue58;
            float intermediateValue60;
            float intermediateValue62;
            float intermediateValue64;
            float scalarValue26 = 0.0;
            float scalarValue27 = 0.0;
            float scalarValue28 = 0.0;
            float scalarValue29 = 0.0;
            float scalarValue30 = 0.0;
            float scalarValue31 = 0.0;
            float scalarValue32 = 0.0;
            uint scalarValue33 = 0u;
            float intermediateValue66;
            bool comparisonValue12;
            for (;;)
            {
                intermediateValue66 = intermediateValue2[scalarValue33];
                comparisonValue12 = intermediateValue66 != 0.0;
                float branchMergedValue1;
                float branchMergedValue4;
                float branchMergedValue5;
                float branchMergedValue6;
                float branchMergedValue7;
                float branchMergedValue8;
                float branchMergedValue9;
                if (comparisonValue12)
                {
                    uint bitwiseValue5 = scalarValue33 >> 1u;
                    uint bitwiseValue6 = (scalarValue33 & 1u) + scalarValue15;
                    uint intermediateValue93;
                    if (comparisonValue1)
                    {
                        intermediateValue93 = bitwiseValue6;
                    }
                    else
                    {
                        uvec4 reinterpretedBits7 = floatBitsToUint(ViewCB.packedValues[91u]);
                        uint scalarValue34 = reinterpretedBits7.y;
                        uint branchMergedValue19;
                        if (scalarValue34 == 2u)
                        {
                            branchMergedValue19 = bitwiseValue6;
                        }
                        else
                        {
                            branchMergedValue19 = ((((((bitwiseValue5 + scalarValue16) ^ (scalarValue33 + scalarValue15)) & 1u) != 0u) != (((floatBitsToUint(ViewCB.packedValues[84u]).z & 1u) | scalarValue34) != 0u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (bitwiseValue6 >> 1u);
                        }
                        intermediateValue93 = branchMergedValue19;
                    }
                    uint productValue17 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(intermediateValue93))), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x));
                    uint bitwiseValue7 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float((bitwiseValue5 & 1u) + scalarValue16))), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x));
                    vec4 sampledTextureValue8 = texelFetch(previousSpecularBuffer, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                    float productValue33;
                    float productValue34;
                    if (reinterpretedBits5)
                    {
                        vec4 sampledTextureValue9 = texelFetch(inputFinalSpecularMoments, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                        productValue33 = (sampledTextureValue9.x * intermediateValue66) + scalarValue29;
                        productValue34 = (sampledTextureValue9.y * intermediateValue66) + scalarValue30;
                    }
                    else
                    {
                        productValue33 = scalarValue29;
                        productValue34 = scalarValue30;
                    }
                    vec4 sampledTextureValue10 = texelFetch(previousHistoryLengthBuffer, ivec2(uvec2(productValue17, bitwiseValue7)), int(0u));
                    float productValue18 = intermediateValue66 * 255.0;
                    branchMergedValue1 = (sampledTextureValue10.y * productValue18) + scalarValue32;
                    branchMergedValue4 = (sampledTextureValue10.x * productValue18) + scalarValue31;
                    branchMergedValue5 = productValue34;
                    branchMergedValue6 = (sampledTextureValue8.z * intermediateValue66) + scalarValue28;
                    branchMergedValue7 = (sampledTextureValue8.y * intermediateValue66) + scalarValue27;
                    branchMergedValue8 = (sampledTextureValue8.x * intermediateValue66) + scalarValue26;
                    branchMergedValue9 = productValue33;
                }
                else
                {
                    branchMergedValue1 = scalarValue32;
                    branchMergedValue4 = scalarValue31;
                    branchMergedValue5 = scalarValue30;
                    branchMergedValue6 = scalarValue28;
                    branchMergedValue7 = scalarValue27;
                    branchMergedValue8 = scalarValue26;
                    branchMergedValue9 = scalarValue29;
                }
                intermediateValue64 = branchMergedValue1;
                intermediateValue62 = branchMergedValue4;
                intermediateValue60 = branchMergedValue5;
                intermediateValue56 = branchMergedValue6;
                intermediateValue54 = branchMergedValue7;
                intermediateValue52 = branchMergedValue8;
                intermediateValue58 = branchMergedValue9;
                uint sumValue22 = scalarValue33 + 1u;
                if (sumValue22 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue26 = intermediateValue52;
                    scalarValue27 = intermediateValue54;
                    scalarValue28 = intermediateValue56;
                    scalarValue29 = intermediateValue58;
                    scalarValue30 = intermediateValue60;
                    scalarValue31 = intermediateValue62;
                    scalarValue32 = intermediateValue64;
                    scalarValue33 = sumValue22;
                    continue;
                }
            }
            float productValue19 = intermediateValue52 * quotientValue;
            float productValue20 = intermediateValue54 * quotientValue;
            float productValue21 = intermediateValue56 * quotientValue;
            float productValue22 = intermediateValue58 * quotientValue;
            float productValue23 = intermediateValue60 * quotientValue;
            float productValue24 = intermediateValue62 * quotientValue;
            float productValue25 = intermediateValue64 * quotientValue;
            bool reinterpretedBits8 = floatBitsToUint(ViewCB.packedValues[53u]).w != 0u;
            float comparisonValue10 = reinterpretedBits8 ? (productValue24 + 1.0) : productValue24;
            float comparisonValue11 = reinterpretedBits8 ? (productValue25 + 1.0) : productValue25;
            float branchMergedValue17;
            uint branchMergedValue25;
            float branchMergedValue26;
            float branchMergedValue27;
            float branchMergedValue28;
            float branchMergedValue29;
            float branchMergedValue30;
            float branchMergedValue31;
            if (floatBitsToUint(ViewCB.packedValues[87u]).w == 0u)
            {
                branchMergedValue17 = comparisonValue11;
                branchMergedValue25 = 0u;
                branchMergedValue26 = productValue19;
                branchMergedValue27 = productValue20;
                branchMergedValue28 = productValue21;
                branchMergedValue29 = productValue22;
                branchMergedValue30 = productValue23;
                branchMergedValue31 = comparisonValue10;
            }
            else
            {
                uvec4 sampledTextureValue11 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)));
                uint scalarValue35 = sampledTextureValue11.x;
                uint bitwiseValue9 = gl_LocalInvocationID.x >> 2u;
                uint bitwiseValue10 = gl_LocalInvocationID.y >> 2u;
                uint productValue26 = intermediateValue[bitwiseValue9 + (bitwiseValue10 * 5u)] - scalarValue35;
                float productValue49;
                if (int(uint(abs(int(productValue26)))) < int(200u))
                {
                    productValue49 = spvNMin(ViewCB.packedValues[98u].z, intermediateValue1[bitwiseValue9 + (bitwiseValue10 * 5u)]);
                }
                else
                {
                    productValue49 = ViewCB.packedValues[98u].z;
                }
                uint sumValue23 = bitwiseValue10 + 1u;
                uint productValue27 = intermediateValue[bitwiseValue9 + (sumValue23 * 5u)] - scalarValue35;
                float productValue56;
                if (int(uint(abs(int(productValue27)))) < int(200u))
                {
                    productValue56 = spvNMin(productValue49, intermediateValue1[bitwiseValue9 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue56 = productValue49;
                }
                uint sumValue24 = bitwiseValue9 + 1u;
                uint productValue28 = intermediateValue[sumValue24 + (bitwiseValue10 * 5u)] - scalarValue35;
                float productValue58;
                if (int(uint(abs(int(productValue28)))) < int(200u))
                {
                    productValue58 = spvNMin(productValue56, intermediateValue1[sumValue24 + (bitwiseValue10 * 5u)]);
                }
                else
                {
                    productValue58 = productValue56;
                }
                uint productValue29 = intermediateValue[sumValue24 + (sumValue23 * 5u)] - scalarValue35;
                float productValue60;
                if (int(uint(abs(int(productValue29)))) < int(200u))
                {
                    productValue60 = spvNMin(productValue58, intermediateValue1[sumValue24 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue60 = productValue58;
                }
                branchMergedValue17 = spvNMin(comparisonValue11, productValue60);
                branchMergedValue25 = 0u;
                branchMergedValue26 = productValue19;
                branchMergedValue27 = productValue20;
                branchMergedValue28 = productValue21;
                branchMergedValue29 = productValue22;
                branchMergedValue30 = productValue23;
                branchMergedValue31 = spvNMin(comparisonValue10, productValue60);
            }
            intermediateValue40 = branchMergedValue26;
            intermediateValue41 = branchMergedValue27;
            intermediateValue42 = branchMergedValue28;
            intermediateValue43 = branchMergedValue29;
            intermediateValue44 = branchMergedValue30;
            intermediateValue45 = branchMergedValue31;
            intermediateValue46 = branchMergedValue17;
            intermediateValue47 = branchMergedValue25;
        }
        else
        {
            intermediateValue40 = 0.0;
            intermediateValue41 = 0.0;
            intermediateValue42 = 0.0;
            intermediateValue43 = 0.0;
            intermediateValue44 = 0.0;
            intermediateValue45 = 1.0;
            intermediateValue46 = 1.0;
            intermediateValue47 = 1u;
        }
        float productValue30 = ViewCB.packedValues[78u].z * sumValue5;
        float productValue31 = ViewCB.packedValues[78u].w * sumValue7;
        float productValue32 = ViewCB.packedValues[78u].z * (sumValue5 - sumValue2);
        float productValue36 = ViewCB.packedValues[78u].w * (sumValue7 - sumValue1);
        vec4 loadedBufferValue = imageLoad(outputBufferIndirectSpecular, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue36 = loadedBufferValue.x;
        vec4 sampledTextureValue12 = texelFetch(inputEmissiveAndLinearRoughness, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue37 = sampledTextureValue12.w;
        vec4 loadedBufferValue1 = imageLoad(outputBufferReflectionDistance, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue38 = loadedBufferValue1.x;
        float sumValue25 = scalarValue38 + scalarValue1;
        float productValue37 = ((sumValue * 2.0) * ViewCB.packedValues[78u].z) + (-1.0);
        float productValue38 = 1.0 - (ViewCB.packedValues[78u].w * productValue1);
        float multiplyAddValue11 = fma(0.5, ViewCB.packedValues[22u].w, fma(productValue38, ViewCB.packedValues[21u].w, ViewCB.packedValues[20u].w * productValue37)) + ViewCB.packedValues[23u].w;
        float multiplyAddValue12 = ((fma(0.5, ViewCB.packedValues[22u].x, fma(productValue38, ViewCB.packedValues[21u].x, ViewCB.packedValues[20u].x * productValue37)) + ViewCB.packedValues[23u].x) / multiplyAddValue11) - ViewCB.packedValues[72u].x;
        float multiplyAddValue13 = ((fma(0.5, ViewCB.packedValues[22u].y, fma(productValue38, ViewCB.packedValues[21u].y, ViewCB.packedValues[20u].y * productValue37)) + ViewCB.packedValues[23u].y) / multiplyAddValue11) - ViewCB.packedValues[72u].y;
        float multiplyAddValue14 = ((fma(0.5, ViewCB.packedValues[22u].z, fma(productValue38, ViewCB.packedValues[21u].z, ViewCB.packedValues[20u].z * productValue37)) + ViewCB.packedValues[23u].z) / multiplyAddValue11) - ViewCB.packedValues[72u].z;
        float inverseLengthValue5 = inversesqrt(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14))) * sumValue25;
        float productValue39 = ((inverseLengthValue5 * multiplyAddValue12) - ViewCB.packedValues[71u].x) + ViewCB.packedValues[72u].x;
        float productValue40 = ((inverseLengthValue5 * multiplyAddValue13) - ViewCB.packedValues[71u].y) + ViewCB.packedValues[72u].y;
        float productValue41 = ((inverseLengthValue5 * multiplyAddValue14) - ViewCB.packedValues[71u].z) + ViewCB.packedValues[72u].z;
        float multiplyAddValue15 = fma(productValue41, ViewCB.packedValues[26u].w, fma(productValue40, ViewCB.packedValues[25u].w, productValue39 * ViewCB.packedValues[24u].w)) + ViewCB.packedValues[27u].w;
        float multiplyAddValue16 = (sumValue3 * 0.5) * (((fma(productValue41, ViewCB.packedValues[26u].x, fma(productValue40, ViewCB.packedValues[25u].x, productValue39 * ViewCB.packedValues[24u].x)) + ViewCB.packedValues[27u].x) / multiplyAddValue15) - productValue37);
        float multiplyAddValue17 = (scalarValue5 * (-0.5)) * (((fma(productValue41, ViewCB.packedValues[26u].y, fma(productValue40, ViewCB.packedValues[25u].y, productValue39 * ViewCB.packedValues[24u].y)) + ViewCB.packedValues[27u].y) / multiplyAddValue15) - productValue38);
        float sumValue26 = multiplyAddValue16 - productValue2;
        float sumValue27 = multiplyAddValue17 - productValue3;
        float nonlinearValue1 = spvNMax(sqrt((sumValue27 * sumValue27) + (sumValue26 * sumValue26)) + (-0.100000001490116119384765625), 0.0);
        float productValue42 = nonlinearValue1 * 0.02500000037252902984619140625;
        float quotientValue1 = spvNMax(((scalarValue37 * scalarValue37) * scalarValue38) / sumValue25, scalarValue37 * 0.5);
        float quotientValue2 = spvNMax(spvNMax(ViewCB.packedValues[88u].w, 1.0 / intermediateValue46), spvNMin(productValue42, 1.0) * 0.25);
        float productValue43 = spvNMin(((1.0 - quotientValue1) * (1.0 - productValue42)) + productValue42, 1.0);
        float intermediateValue71;
        float intermediateValue72;
        float intermediateValue73;
        float intermediateValue74;
        float intermediateValue75;
        float intermediateValue76;
        float intermediateValue78;
        if ((sumValue14 != 0.0) && (productValue43 > 0.0))
        {
            float sumValue28 = (multiplyAddValue16 + sumValue4) + (-0.5);
            float sumValue31 = (multiplyAddValue17 + sumValue6) + (-0.5);
            uint scalarValue39 = uint(int(floor(sumValue28)));
            uint scalarValue40 = uint(int(floor(sumValue31)));
            float scalarValue41 = fract(sumValue28);
            float scalarValue42 = fract(sumValue31);
            float nonlinearValue2 = log2(spvNMax(scalarValue38, 0.00999999977648258209228515625));
            float intermediateValue77;
            float intermediateValue82;
            float intermediateValue84;
            float intermediateValue86;
            float intermediateValue88;
            float intermediateValue90;
            float scalarValue43 = 0.0;
            uint scalarValue44 = 0u;
            float scalarValue45 = 0.0;
            float scalarValue46 = 0.0;
            float scalarValue47 = 0.0;
            float scalarValue48 = 0.0;
            float scalarValue49 = 0.0;
            uint bitwiseValue8;
            uint sumValue29;
            uint sumValue30;
            float productValue35;
            uint reinterpretedBits6;
            bool comparisonValue13;
            for (;;)
            {
                uint bitwiseValue11 = scalarValue44 & 1u;
                bitwiseValue8 = scalarValue44 >> 1u;
                uint bitwiseValue12 = bitwiseValue8 & 1u;
                sumValue29 = bitwiseValue11 + scalarValue39;
                sumValue30 = bitwiseValue12 + scalarValue40;
                float sumValue32 = 1.0 - scalarValue41;
                float sumValue33 = 1.0 - scalarValue42;
                productValue35 = ((float(int(bitwiseValue12)) * (scalarValue42 - sumValue33)) + sumValue33) * ((float(int(bitwiseValue11)) * (scalarValue41 - sumValue32)) + sumValue32);
                reinterpretedBits6 = floatBitsToUint(ViewCB.packedValues[91u]).y;
                comparisonValue13 = reinterpretedBits6 == 2u;
                uint intermediateValue97;
                uint intermediateValue98;
                if (comparisonValue1)
                {
                    uint branchMergedValue20;
                    uint branchMergedValue38;
                    if (comparisonValue13)
                    {
                        branchMergedValue20 = sumValue29;
                        branchMergedValue38 = sumValue29;
                    }
                    else
                    {
                        uint productValue44 = uint(ViewCB.packedValues[78u].x * 0.5);
                        uint reinterpretedBits9 = (((reinterpretedBits6 == 0u) ? (floatBitsToUint(ViewCB.packedValues[84u]).z + 1u) : 0u) + sumValue30) & 1u;
                        uint branchMergedValue45;
                        uint branchMergedValue49;
                        if (sumValue29 < productValue44)
                        {
                            branchMergedValue45 = ((sumValue29 << 1u) | 1u) - reinterpretedBits9;
                            branchMergedValue49 = sumValue29;
                        }
                        else
                        {
                            branchMergedValue45 = reinterpretedBits9 | ((sumValue29 - productValue44) << 1u);
                            branchMergedValue49 = sumValue29;
                        }
                        branchMergedValue20 = branchMergedValue45;
                        branchMergedValue38 = branchMergedValue49;
                    }
                    intermediateValue97 = branchMergedValue38;
                    intermediateValue98 = branchMergedValue20;
                }
                else
                {
                    uint branchMergedValue21;
                    uint branchMergedValue39;
                    if (comparisonValue13)
                    {
                        branchMergedValue21 = sumValue29;
                        branchMergedValue39 = sumValue29;
                    }
                    else
                    {
                        branchMergedValue21 = sumValue29;
                        branchMergedValue39 = ((((((bitwiseValue8 + scalarValue40) ^ (scalarValue44 + scalarValue39)) & 1u) != 0u) != (((floatBitsToUint(ViewCB.packedValues[84u]).z & 1u) | reinterpretedBits6) != 0u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue29 >> 1u);
                    }
                    intermediateValue97 = branchMergedValue39;
                    intermediateValue98 = branchMergedValue21;
                }
                float branchMergedValue2;
                float branchMergedValue10;
                float branchMergedValue11;
                float branchMergedValue12;
                float branchMergedValue13;
                float branchMergedValue14;
                if (((int(sumValue30) < int(0u)) || (int(intermediateValue97) < int(intermediateValue11))) || ((int(sumValue30) >= int(intermediateValue13)) || (int(intermediateValue97) >= int(intermediateValue12))))
                {
                    branchMergedValue2 = scalarValue48;
                    branchMergedValue10 = scalarValue47;
                    branchMergedValue11 = scalarValue46;
                    branchMergedValue12 = scalarValue45;
                    branchMergedValue13 = scalarValue43;
                    branchMergedValue14 = scalarValue49;
                }
                else
                {
                    uint productValue45 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(intermediateValue97))), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x));
                    uint productValue46 = uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(sumValue30))), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x));
                    float productValue47 = scalarValue37 * (-0.25);
                    vec4 sampledTextureValue13 = texelFetch(previousPrimaryNormalBuffer, ivec2(uvec2(productValue45, productValue46)), int(0u));
                    float scalarValue50 = sampledTextureValue13.x;
                    float scalarValue51 = sampledTextureValue13.y;
                    float sumValue34 = 1.0 - abs(scalarValue50);
                    float scalarValue52 = abs(scalarValue51);
                    float sumValue35 = sumValue34 - scalarValue52;
                    bool conditionValue3 = sumValue35 < 0.0;
                    float comparisonValue14 = conditionValue3 ? ((1.0 - scalarValue52) * ((scalarValue50 >= 0.0) ? 1.0 : (-1.0))) : scalarValue50;
                    float comparisonValue15 = conditionValue3 ? (((scalarValue51 >= 0.0) ? 1.0 : (-1.0)) * sumValue34) : scalarValue51;
                    float inverseLengthValue6 = inversesqrt(dot(vec3(comparisonValue14, comparisonValue15, sumValue35), vec3(comparisonValue14, comparisonValue15, sumValue35)));
                    float sumValue36 = 0.050000011920928955078125 - productValue47;
                    vec4 sampledTextureValue14 = texelFetch(previousPrimaryPathLengthBuffer, ivec2(uvec2(productValue45, productValue46)), int(0u));
                    float scalarValue53 = sampledTextureValue14.x;
                    float productValue48 = (((float(int(intermediateValue98)) + 0.5) * 2.0) * ViewCB.packedValues[78u].z) + (-1.0);
                    float productValue50 = 1.0 - (((float(int(sumValue30)) + 0.5) * 2.0) * ViewCB.packedValues[78u].w);
                    float multiplyAddValue19 = fma(0.5, ViewCB.packedValues[34u].w, fma(productValue50, ViewCB.packedValues[33u].w, ViewCB.packedValues[32u].w * productValue48)) + ViewCB.packedValues[35u].w;
                    float multiplyAddValue20 = ((fma(0.5, ViewCB.packedValues[34u].x, fma(productValue50, ViewCB.packedValues[33u].x, ViewCB.packedValues[32u].x * productValue48)) + ViewCB.packedValues[35u].x) / multiplyAddValue19) - ViewCB.packedValues[73u].x;
                    float multiplyAddValue21 = ((fma(0.5, ViewCB.packedValues[34u].y, fma(productValue50, ViewCB.packedValues[33u].y, ViewCB.packedValues[32u].y * productValue48)) + ViewCB.packedValues[35u].y) / multiplyAddValue19) - ViewCB.packedValues[73u].y;
                    float multiplyAddValue22 = ((fma(0.5, ViewCB.packedValues[34u].z, fma(productValue50, ViewCB.packedValues[33u].z, ViewCB.packedValues[32u].z * productValue48)) + ViewCB.packedValues[35u].z) / multiplyAddValue19) - ViewCB.packedValues[73u].z;
                    float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22), vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22)));
                    float sampledTextureValue15 = spvNClamp(fma(abs(nonlinearValue2 - log2(spvNMax(texelFetch(previousReflectionDistanceBuffer, ivec2(uvec2(productValue45, productValue46)), int(0u)).x, 0.00999999977648258209228515625))), -2.0, 2.0), 0.0, 1.0);
                    float sampledTextureValue16 = (((1.0 - sampledTextureValue15) * scalarValue37) + sampledTextureValue15) * ((abs(multiplyAddValue4 - dot(vec3(fma(multiplyAddValue20 * inverseLengthValue7, scalarValue53, ViewCB.packedValues[73u].x), fma(multiplyAddValue21 * inverseLengthValue7, scalarValue53, ViewCB.packedValues[73u].y), fma(multiplyAddValue22 * inverseLengthValue7, scalarValue53, ViewCB.packedValues[73u].z)), vec3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0 : ((productValue35 * spvNClamp(fma(dot(vec3(productValue7, productValue8, productValue9), vec3(comparisonValue14 * inverseLengthValue6, comparisonValue15 * inverseLengthValue6, inverseLengthValue6 * sumValue35)), 1.0 / sumValue36, ((-0.0) - (productValue47 + 0.949999988079071044921875)) / sumValue36), 0.0, 1.0)) * spvNClamp(fma(abs(scalarValue37 - texelFetch(previousLinearRoughnessBuffer, ivec2(uvec2(productValue45, productValue46)), int(0u)).x), -12.5, 1.5), 0.0, 1.0)));
                    vec4 sampledTextureValue17 = texelFetch(previousSpecularBuffer, ivec2(uvec2(productValue45, productValue46)), int(0u));
                    vec4 sampledTextureValue18 = texelFetch(inputFinalSpecularMoments, ivec2(uvec2(intermediateValue97, sumValue30)), int(0u));
                    branchMergedValue2 = (sampledTextureValue18.x * sampledTextureValue16) + scalarValue48;
                    branchMergedValue10 = (sampledTextureValue16 * sampledTextureValue17.z) + scalarValue47;
                    branchMergedValue11 = (sampledTextureValue16 * sampledTextureValue17.y) + scalarValue46;
                    branchMergedValue12 = (sampledTextureValue16 * sampledTextureValue17.x) + scalarValue45;
                    branchMergedValue13 = sampledTextureValue16 + scalarValue43;
                    branchMergedValue14 = (sampledTextureValue18.y * sampledTextureValue16) + scalarValue49;
                }
                intermediateValue88 = branchMergedValue2;
                intermediateValue86 = branchMergedValue10;
                intermediateValue84 = branchMergedValue11;
                intermediateValue82 = branchMergedValue12;
                intermediateValue77 = branchMergedValue13;
                intermediateValue90 = branchMergedValue14;
                uint sumValue37 = scalarValue44 + 1u;
                if (sumValue37 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue43 = intermediateValue77;
                    scalarValue44 = sumValue37;
                    scalarValue45 = intermediateValue82;
                    scalarValue46 = intermediateValue84;
                    scalarValue47 = intermediateValue86;
                    scalarValue48 = intermediateValue88;
                    scalarValue49 = intermediateValue90;
                    continue;
                }
            }
            float branchMergedValue18;
            float branchMergedValue32;
            float branchMergedValue33;
            float branchMergedValue34;
            float branchMergedValue35;
            float branchMergedValue36;
            float branchMergedValue37;
            if (intermediateValue77 > 0.00999999977648258209228515625)
            {
                branchMergedValue18 = quotientValue2;
                branchMergedValue32 = intermediateValue77;
                branchMergedValue33 = (((intermediateValue88 / intermediateValue77) - intermediateValue43) * productValue43) + intermediateValue43;
                branchMergedValue34 = (((intermediateValue86 / intermediateValue77) - intermediateValue42) * productValue43) + intermediateValue42;
                branchMergedValue35 = (((intermediateValue84 / intermediateValue77) - intermediateValue41) * productValue43) + intermediateValue41;
                branchMergedValue36 = (((intermediateValue82 / intermediateValue77) - intermediateValue40) * productValue43) + intermediateValue40;
                branchMergedValue37 = (((intermediateValue90 / intermediateValue77) - intermediateValue44) * productValue43) + intermediateValue44;
            }
            else
            {
                branchMergedValue18 = 1.0;
                branchMergedValue32 = intermediateValue77;
                branchMergedValue33 = intermediateValue43;
                branchMergedValue34 = intermediateValue42;
                branchMergedValue35 = intermediateValue41;
                branchMergedValue36 = intermediateValue40;
                branchMergedValue37 = intermediateValue44;
            }
            intermediateValue71 = branchMergedValue36;
            intermediateValue72 = branchMergedValue35;
            intermediateValue73 = branchMergedValue34;
            intermediateValue74 = branchMergedValue33;
            intermediateValue75 = branchMergedValue37;
            intermediateValue76 = branchMergedValue32;
            intermediateValue78 = branchMergedValue18;
        }
        else
        {
            intermediateValue71 = intermediateValue40;
            intermediateValue72 = intermediateValue41;
            intermediateValue73 = intermediateValue42;
            intermediateValue74 = intermediateValue43;
            intermediateValue75 = intermediateValue44;
            intermediateValue76 = sumValue14;
            intermediateValue78 = quotientValue2;
        }
        float intermediateValue91;
        float intermediateValue92;
        float multiplyAddValue18;
        if (reinterpretedBits5)
        {
            float dotProductValue = dot(vec3(scalarValue36, loadedBufferValue.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float comparisonValue16 = spvNMin(spvNMax(1.0 / spvNMax(intermediateValue46, 0.00999999977648258209228515625), ViewCB.packedValues[89u].x), (intermediateValue76 == 0.0) ? 1.0 : 0.100000001490116119384765625);
            float productValue51 = (comparisonValue16 * (dotProductValue - intermediateValue74)) + intermediateValue74;
            float productValue52 = (comparisonValue16 * ((dotProductValue * dotProductValue) - intermediateValue75)) + intermediateValue75;
            float exponentialValue = spvNMax(exp2((12.0 / intermediateValue46) + 1.0) + (-10.55606365203857421875), 0.0);
            float comparisonValue17 = (intermediateValue47 != 0u) ? (exponentialValue + 1000000.0) : exponentialValue;
            float productValue53 = spvNMax(0.0, productValue52 - (productValue51 * productValue51));
            float sumValue38 = comparisonValue17 + productValue53;
            intermediateValue91 = productValue51;
            intermediateValue92 = productValue52;
            multiplyAddValue18 = ((comparisonValue17 > productValue53) ? ((-0.0) - sumValue38) : sumValue38) * fma(productValue43, (nonlinearValue1 * 200.0) * quotientValue1, 1.0);
        }
        else
        {
            intermediateValue91 = 0.0;
            intermediateValue92 = 0.0;
            multiplyAddValue18 = 0.0;
        }
        imageStore(outputBufferSpecularMoments, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue91, intermediateValue92, intermediateValue91, intermediateValue91));
        float comparisonValue18 = ((intermediateValue78 + (-1.0)) * ((productValue30 < 0.5) ? spvNMin(spvNClamp(((productValue32 < 0.0) ? productValue30 : (1.0 - productValue30)) / (abs(productValue32) + 9.9999997473787516355514526367188e-06), 0.0, 1.0), spvNClamp(((productValue36 < 0.0) ? productValue31 : (1.0 - productValue31)) / (abs(productValue36) + 9.9999997473787516355514526367188e-06), 0.0, 1.0)) : 1.0)) + 1.0;
        float intermediateValue95;
        if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
        {
            intermediateValue95 = 1.0;
        }
        else
        {
            intermediateValue95 = uintBitsToFloat(texelFetch(inputIncidentLight, int(4u)).x);
        }
        float productValue54 = intermediateValue95 * intermediateValue71;
        float productValue55 = intermediateValue95 * intermediateValue72;
        float productValue57 = intermediateValue95 * intermediateValue73;
        imageStore(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(((scalarValue36 - productValue54) * comparisonValue18) + productValue54, ((loadedBufferValue.y - productValue55) * comparisonValue18) + productValue55, ((loadedBufferValue.z - productValue57) * comparisonValue18) + productValue57, multiplyAddValue18));
        float productValue59 = intermediateValue45 * 0.0039215688593685626983642578125;
        imageStore(outputBufferHistoryLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(productValue59, 0.0039215688593685626983642578125 / comparisonValue18, productValue59, productValue59));
    }
}
