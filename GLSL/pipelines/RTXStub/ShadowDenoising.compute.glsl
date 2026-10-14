#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / ShadowDenoising / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 26
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue = reinterpretedBits.x;
    uint bitwiseValue = scalarValue & 2u;
    bool comparisonValue = bitwiseValue != 0u;
    uint bitwiseValue1 = gl_GlobalInvocationID.x >> 4u;
    uint bitwiseValue2 = gl_GlobalInvocationID.y >> 4u;
    uvec4 sampledTextureValue = uvec4(texelFetch(inputTileClassification, ivec2(uvec2(bitwiseValue1, bitwiseValue2)), int(0u)));
    uint scalarValue1 = sampledTextureValue.x;
    if ((scalarValue1 & 1u) == 0u)
    {
        uint sumValue = bitwiseValue1 + 4294967295u;
        uint sumValue1 = bitwiseValue2 + 4294967295u;
        uint sumValue2 = bitwiseValue2 + 1u;
        uint sumValue3 = bitwiseValue1 + 1u;
        uint bitwiseValue3 = ((scalarValue >> 8u) & 255u) + 0u;
        uint bitwiseValue4 = ((scalarValue >> 16u) & 255u) + 0u;
        uint bitwiseValue5 = bitwiseValue >> 1u;
        vec4 loadedBufferValue = imageLoad(shadowDenoisingOutputs[bitwiseValue3], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue2 = loadedBufferValue.x;
        float scalarValue3 = loadedBufferValue.y;
        float scalarValue4 = loadedBufferValue.z;
        float scalarValue5 = loadedBufferValue.w;
        if (((((((((scalarValue1 & 4u) & uvec4(texelFetch(inputTileClassification, ivec2(uvec2(sumValue, sumValue1)), int(0u))).x) & uvec4(texelFetch(inputTileClassification, ivec2(uvec2(sumValue, bitwiseValue2)), int(0u))).x) & uvec4(texelFetch(inputTileClassification, ivec2(uvec2(sumValue, sumValue2)), int(0u))).x) & uvec4(texelFetch(inputTileClassification, ivec2(uvec2(bitwiseValue1, sumValue1)), int(0u))).x) & uvec4(texelFetch(inputTileClassification, ivec2(uvec2(bitwiseValue1, sumValue2)), int(0u))).x) & uvec4(texelFetch(inputTileClassification, ivec2(uvec2(sumValue3, sumValue1)), int(0u))).x) & uvec4(texelFetch(inputTileClassification, ivec2(uvec2(sumValue3, bitwiseValue2)), int(0u))).x) == 0u)
        {
            uint intermediateValue8;
            uint intermediateValue9;
            uint intermediateValue10;
            if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
            {
                intermediateValue8 = 0u;
                intermediateValue9 = uint(int(ViewCB.packedValues[78u].x));
                intermediateValue10 = uint(int(ViewCB.packedValues[78u].y));
            }
            else
            {
                uint scalarValue6 = uint(ViewCB.packedValues[80u].x);
                uint scalarValue7 = uint(ViewCB.packedValues[78u].y);
                uint branchMergedValue4;
                uint branchMergedValue5;
                uint branchMergedValue6;
                if (gl_GlobalInvocationID.x < scalarValue6)
                {
                    branchMergedValue4 = 0u;
                    branchMergedValue5 = scalarValue6;
                    branchMergedValue6 = scalarValue7;
                }
                else
                {
                    branchMergedValue4 = scalarValue6;
                    branchMergedValue5 = uint(ViewCB.packedValues[78u].x);
                    branchMergedValue6 = scalarValue7;
                }
                intermediateValue8 = branchMergedValue4;
                intermediateValue9 = branchMergedValue5;
                intermediateValue10 = branchMergedValue6;
            }
            vec4 sampledTextureValue1 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
            float scalarValue8 = sampledTextureValue1.x;
            vec4 sampledTextureValue2 = texelFetch(inputGeometryNormal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
            float scalarValue9 = sampledTextureValue2.x;
            float scalarValue10 = sampledTextureValue2.y;
            float sumValue4 = 1.0 - abs(scalarValue9);
            float scalarValue11 = abs(scalarValue10);
            float sumValue5 = sumValue4 - scalarValue11;
            bool conditionValue = sumValue5 < 0.0;
            float comparisonValue1 = conditionValue ? ((1.0 - scalarValue11) * ((scalarValue9 >= 0.0) ? 1.0 : (-1.0))) : scalarValue9;
            float comparisonValue2 = conditionValue ? (((scalarValue10 >= 0.0) ? 1.0 : (-1.0)) * sumValue4) : scalarValue10;
            float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue1, comparisonValue2, sumValue5), vec3(comparisonValue1, comparisonValue2, sumValue5)));
            float productValue = comparisonValue1 * inverseLengthValue;
            float productValue1 = comparisonValue2 * inverseLengthValue;
            float productValue2 = inverseLengthValue * sumValue5;
            float dotProductValue = dot(vec3(productValue, productValue1, productValue2), vec3(ViewCB.packedValues[52u].xyz));
            if (!(dotProductValue <= 0.0))
            {
                float productValue3 = ViewCB.packedValues[78u].z * 2.0;
                float productValue4 = ViewCB.packedValues[78u].w * (-2.0);
                float scalarValue12 = float(int(gl_GlobalInvocationID.x));
                float scalarValue13 = float(int(gl_GlobalInvocationID.y));
                float multiplyAddValue = fma(scalarValue12 + 0.5, productValue3, -1.0);
                float multiplyAddValue1 = fma(scalarValue13 + 0.5, productValue4, 1.0);
                float multiplyAddValue2 = fma(multiplyAddValue, ViewCB.packedValues[40u].x, ViewCB.packedValues[42u].x);
                float multiplyAddValue3 = fma(multiplyAddValue, ViewCB.packedValues[40u].y, ViewCB.packedValues[42u].y);
                float multiplyAddValue4 = fma(multiplyAddValue, ViewCB.packedValues[40u].z, ViewCB.packedValues[42u].z);
                float multiplyAddValue5 = fma(multiplyAddValue1, ViewCB.packedValues[41u].x, multiplyAddValue2);
                float multiplyAddValue6 = fma(multiplyAddValue1, ViewCB.packedValues[41u].y, multiplyAddValue3);
                float multiplyAddValue7 = fma(multiplyAddValue1, ViewCB.packedValues[41u].z, multiplyAddValue4);
                float nonlinearValue = 1.0 / sqrt(((multiplyAddValue6 * multiplyAddValue6) + (multiplyAddValue5 * multiplyAddValue5)) + (multiplyAddValue7 * multiplyAddValue7));
                float productValue5 = nonlinearValue * scalarValue8;
                float productValue6 = productValue5 * multiplyAddValue5;
                float productValue7 = productValue5 * multiplyAddValue6;
                float productValue8 = productValue5 * multiplyAddValue7;
                float productValue9 = scalarValue5 * 0.01860214583575725555419921875;
                float scalarValue14 = abs(dotProductValue);
                float quotientValue = 1.0 / scalarValue14;
                float productValue10 = quotientValue * productValue9;
                float productValue11 = spvNMax(productValue9, productValue10 * 0.5);
                float scalarValue15 = float(int(bitwiseValue5));
                float bitwiseValue6 = float(int(bitwiseValue5 ^ 1u));
                float dotProductValue1 = dot(vec2(productValue10, productValue11), vec2(scalarValue15, bitwiseValue6));
                float quotientValue1 = 1.0 / (((dotProductValue1 * dotProductValue1) * 0.88871109485626220703125) + 1.0000000116860974230803549289703e-07);
                bool conditionValue1 = scalarValue14 < 0.25;
                float dotProductValue2 = dot(vec3(ViewCB.packedValues[52u].xyz), vec3(productValue, productValue1, productValue2));
                float productValue12 = ViewCB.packedValues[52u].x - (dotProductValue2 * productValue);
                float productValue13 = ViewCB.packedValues[52u].y - (dotProductValue2 * productValue1);
                float productValue14 = ViewCB.packedValues[52u].z - (dotProductValue2 * productValue2);
                float inverseLengthValue1 = inversesqrt(dot(vec3(productValue12, productValue13, productValue14), vec3(productValue12, productValue13, productValue14)));
                float productValue15 = productValue12 * inverseLengthValue1;
                float productValue16 = productValue13 * inverseLengthValue1;
                float productValue17 = productValue14 * inverseLengthValue1;
                float dotProductValue3 = dot(vec3(productValue15, productValue16, productValue17), vec3(productValue, productValue1, productValue2)) * (1.0 / dotProductValue2);
                float productValue18 = productValue15 - (dotProductValue3 * ViewCB.packedValues[52u].x);
                float productValue19 = productValue16 - (dotProductValue3 * ViewCB.packedValues[52u].y);
                float productValue20 = productValue17 - (dotProductValue3 * ViewCB.packedValues[52u].z);
                float sumValue6 = productValue6 - productValue18;
                float sumValue7 = productValue7 - productValue19;
                float sumValue8 = productValue8 - productValue20;
                float multiplyAddValue8 = fma(sumValue8, ViewCB.packedValues[6u].w, fma(sumValue7, ViewCB.packedValues[5u].w, sumValue6 * ViewCB.packedValues[4u].w)) + ViewCB.packedValues[7u].w;
                float sumValue9 = productValue18 + productValue6;
                float sumValue10 = productValue19 + productValue7;
                float sumValue11 = productValue20 + productValue8;
                float multiplyAddValue9 = fma(sumValue11, ViewCB.packedValues[6u].w, fma(sumValue10, ViewCB.packedValues[5u].w, sumValue9 * ViewCB.packedValues[4u].w)) + ViewCB.packedValues[7u].w;
                float multiplyAddValue10 = ((fma(sumValue8, ViewCB.packedValues[6u].x, fma(sumValue7, ViewCB.packedValues[5u].x, sumValue6 * ViewCB.packedValues[4u].x)) + ViewCB.packedValues[7u].x) / multiplyAddValue8) - ((fma(sumValue11, ViewCB.packedValues[6u].x, fma(sumValue10, ViewCB.packedValues[5u].x, sumValue9 * ViewCB.packedValues[4u].x)) + ViewCB.packedValues[7u].x) / multiplyAddValue9);
                float multiplyAddValue11 = ((fma(sumValue8, ViewCB.packedValues[6u].y, fma(sumValue7, ViewCB.packedValues[5u].y, sumValue6 * ViewCB.packedValues[4u].y)) + ViewCB.packedValues[7u].y) / multiplyAddValue8) - ((fma(sumValue11, ViewCB.packedValues[6u].y, fma(sumValue10, ViewCB.packedValues[5u].y, sumValue9 * ViewCB.packedValues[4u].y)) + ViewCB.packedValues[7u].y) / multiplyAddValue9);
                float inverseLengthValue2 = inversesqrt(dot(vec2(multiplyAddValue10, multiplyAddValue11), vec2(multiplyAddValue10, multiplyAddValue11)));
                float productValue21 = inverseLengthValue2 * multiplyAddValue10;
                float productValue22 = inverseLengthValue2 * multiplyAddValue11;
                float comparisonValue3 = conditionValue1 ? (comparisonValue ? ((-0.0) - productValue22) : productValue21) : bitwiseValue6;
                float comparisonValue4 = (conditionValue1 ? (comparisonValue ? productValue21 : productValue22) : scalarValue15) * 0.5;
                uint multiplyAddValue12 = uint(int(fma(scalarValue8, 0.004999999888241291046142578125, 0.02500000037252902984619140625) * 1023.0));
                uvec4 sampledTextureValue3 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)));
                uint scalarValue16 = sampledTextureValue3.x;
                uint sumValue12 = gl_GlobalInvocationID.x + 1u;
                bool conditionValue2 = int(gl_GlobalInvocationID.y) < int(0u);
                bool comparisonValue5 = int(gl_GlobalInvocationID.y) >= int(intermediateValue10);
                uint sampledTextureValue4 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(sumValue12, gl_GlobalInvocationID.y)), int(0u))).x - scalarValue16;
                float nonlinearValue1;
                float intermediateValue23;
                if ((int(uint(abs(int(sampledTextureValue4)))) <= int(multiplyAddValue12)) && (!((conditionValue2 || (int(sumValue12) < int(intermediateValue8))) || ((int(sumValue12) >= int(intermediateValue9)) || comparisonValue5))))
                {
                    float multiplyAddValue13 = fma(float(int(sumValue12)) + 0.5, productValue3, -1.0);
                    float sampledTextureValue5 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(sumValue12, gl_GlobalInvocationID.y)), int(0u)).x * nonlinearValue;
                    float multiplyAddValue14 = productValue6 - (fma(multiplyAddValue1, ViewCB.packedValues[41u].x, fma(multiplyAddValue13, ViewCB.packedValues[40u].x, ViewCB.packedValues[42u].x)) * sampledTextureValue5);
                    float multiplyAddValue15 = productValue7 - (fma(multiplyAddValue1, ViewCB.packedValues[41u].y, fma(multiplyAddValue13, ViewCB.packedValues[40u].y, ViewCB.packedValues[42u].y)) * sampledTextureValue5);
                    float multiplyAddValue16 = productValue8 - (fma(multiplyAddValue1, ViewCB.packedValues[41u].z, fma(multiplyAddValue13, ViewCB.packedValues[40u].z, ViewCB.packedValues[42u].z)) * sampledTextureValue5);
                    nonlinearValue1 = sqrt(((multiplyAddValue15 * multiplyAddValue15) + (multiplyAddValue14 * multiplyAddValue14)) + (multiplyAddValue16 * multiplyAddValue16));
                    intermediateValue23 = 1.0;
                }
                else
                {
                    nonlinearValue1 = 0.0;
                    intermediateValue23 = 0.0;
                }
                uint sumValue13 = gl_GlobalInvocationID.x + 4294967295u;
                uint sampledTextureValue6 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(sumValue13, gl_GlobalInvocationID.y)), int(0u))).x - scalarValue16;
                float nonlinearValue2;
                float sumValue14;
                if ((int(uint(abs(int(sampledTextureValue6)))) <= int(multiplyAddValue12)) && (!((conditionValue2 || (int(sumValue13) < int(intermediateValue8))) || ((int(sumValue13) >= int(intermediateValue9)) || comparisonValue5))))
                {
                    float multiplyAddValue17 = fma(float(int(sumValue13)) + 0.5, productValue3, -1.0);
                    float sampledTextureValue7 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(sumValue13, gl_GlobalInvocationID.y)), int(0u)).x * nonlinearValue;
                    float multiplyAddValue18 = productValue6 - (fma(multiplyAddValue1, ViewCB.packedValues[41u].x, fma(multiplyAddValue17, ViewCB.packedValues[40u].x, ViewCB.packedValues[42u].x)) * sampledTextureValue7);
                    float multiplyAddValue19 = productValue7 - (fma(multiplyAddValue1, ViewCB.packedValues[41u].y, fma(multiplyAddValue17, ViewCB.packedValues[40u].y, ViewCB.packedValues[42u].y)) * sampledTextureValue7);
                    float multiplyAddValue20 = productValue8 - (fma(multiplyAddValue1, ViewCB.packedValues[41u].z, fma(multiplyAddValue17, ViewCB.packedValues[40u].z, ViewCB.packedValues[42u].z)) * sampledTextureValue7);
                    nonlinearValue2 = sqrt(((multiplyAddValue19 * multiplyAddValue19) + (multiplyAddValue18 * multiplyAddValue18)) + (multiplyAddValue20 * multiplyAddValue20)) + nonlinearValue1;
                    sumValue14 = intermediateValue23 + 1.0;
                }
                else
                {
                    nonlinearValue2 = nonlinearValue1;
                    sumValue14 = intermediateValue23;
                }
                uint sumValue15 = gl_GlobalInvocationID.y + 1u;
                bool conditionValue3 = int(gl_GlobalInvocationID.x) < int(intermediateValue8);
                bool comparisonValue6 = int(gl_GlobalInvocationID.x) >= int(intermediateValue9);
                uint sampledTextureValue8 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue15)), int(0u))).x - scalarValue16;
                float nonlinearValue3;
                float intermediateValue25;
                if ((int(uint(abs(int(sampledTextureValue8)))) <= int(multiplyAddValue12)) && (!(((int(sumValue15) < int(0u)) || conditionValue3) || (comparisonValue6 || (int(sumValue15) >= int(intermediateValue10))))))
                {
                    float multiplyAddValue21 = fma(float(int(sumValue15)) + 0.5, productValue4, 1.0);
                    float sampledTextureValue9 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue15)), int(0u)).x * nonlinearValue;
                    float multiplyAddValue22 = productValue6 - (sampledTextureValue9 * fma(multiplyAddValue21, ViewCB.packedValues[41u].x, multiplyAddValue2));
                    float multiplyAddValue23 = productValue7 - (fma(multiplyAddValue21, ViewCB.packedValues[41u].y, multiplyAddValue3) * sampledTextureValue9);
                    float multiplyAddValue24 = productValue8 - (fma(multiplyAddValue21, ViewCB.packedValues[41u].z, multiplyAddValue4) * sampledTextureValue9);
                    nonlinearValue3 = sqrt(((multiplyAddValue23 * multiplyAddValue23) + (multiplyAddValue22 * multiplyAddValue22)) + (multiplyAddValue24 * multiplyAddValue24));
                    intermediateValue25 = 1.0;
                }
                else
                {
                    nonlinearValue3 = 0.0;
                    intermediateValue25 = 0.0;
                }
                uint sumValue16 = gl_GlobalInvocationID.y + 4294967295u;
                uint sampledTextureValue10 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue16)), int(0u))).x - scalarValue16;
                float nonlinearValue4;
                float sumValue17;
                if ((int(uint(abs(int(sampledTextureValue10)))) <= int(multiplyAddValue12)) && (!(((int(sumValue16) < int(0u)) || conditionValue3) || (comparisonValue6 || (int(sumValue16) >= int(intermediateValue10))))))
                {
                    float multiplyAddValue25 = fma(float(int(sumValue16)) + 0.5, productValue4, 1.0);
                    float sampledTextureValue11 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue16)), int(0u)).x * nonlinearValue;
                    float multiplyAddValue26 = productValue6 - (sampledTextureValue11 * fma(multiplyAddValue25, ViewCB.packedValues[41u].x, multiplyAddValue2));
                    float multiplyAddValue27 = productValue7 - (fma(multiplyAddValue25, ViewCB.packedValues[41u].y, multiplyAddValue3) * sampledTextureValue11);
                    float multiplyAddValue28 = productValue8 - (fma(multiplyAddValue25, ViewCB.packedValues[41u].z, multiplyAddValue4) * sampledTextureValue11);
                    nonlinearValue4 = sqrt(((multiplyAddValue27 * multiplyAddValue27) + (multiplyAddValue26 * multiplyAddValue26)) + (multiplyAddValue28 * multiplyAddValue28)) + nonlinearValue3;
                    sumValue17 = intermediateValue25 + 1.0;
                }
                else
                {
                    nonlinearValue4 = nonlinearValue3;
                    sumValue17 = intermediateValue25;
                }
                precise float comparisonValue7 = ((sumValue14 > 0.0) ? (nonlinearValue2 / sumValue14) : nonlinearValue2) * 0.5;
                precise float comparisonValue8 = ((sumValue17 > 0.0) ? (nonlinearValue4 / sumValue17) : nonlinearValue4) * 0.5;
                float quotientValue2 = productValue10 / comparisonValue7;
                float quotientValue3 = productValue11 / comparisonValue8;
                uint dotProductValue4 = uint(max(int(1u), int(uint(int(dot(vec2(spvNMin(12.0, spvNMax(0.0, comparisonValue ? (quotientValue2 * quotientValue) : quotientValue2)), spvNMin(12.0, spvNMax(0.0, comparisonValue ? (quotientValue3 * quotientValue) : quotientValue3))), vec2(scalarValue15, bitwiseValue6)))))));
                float intermediateValue26;
                float intermediateValue28;
                float intermediateValue30;
                float intermediateValue32;
                if (int(dotProductValue4) > int(1u))
                {
                    float intermediateValue27;
                    float intermediateValue29;
                    float intermediateValue31;
                    float intermediateValue33;
                    float scalarValue17 = 1.0;
                    float scalarValue18 = scalarValue2;
                    float scalarValue19 = scalarValue3;
                    float scalarValue20 = scalarValue4;
                    uint scalarValue21 = 1u;
                    float productValue23;
                    float productValue24;
                    uint sumValue19;
                    uint sumValue20;
                    uint intermediateValue40;
                    bool comparisonValue9;
                    for (;;)
                    {
                        float scalarValue22 = float(int(scalarValue21));
                        productValue23 = comparisonValue4 * scalarValue22;
                        productValue24 = scalarValue22 * comparisonValue3;
                        sumValue19 = uint(int(scalarValue12 - productValue23));
                        sumValue20 = uint(int(scalarValue13 - productValue24));
                        intermediateValue40 = uint(int(float(int(multiplyAddValue12))));
                        uint sampledTextureValue12 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(sumValue19, sumValue20)), int(0u))).x - scalarValue16;
                        comparisonValue9 = (int(uint(abs(int(sampledTextureValue12)))) <= int(intermediateValue40)) && (!(((int(sumValue19) < int(intermediateValue8)) || (int(sumValue20) < int(0u))) || ((int(sumValue19) >= int(intermediateValue9)) || (int(sumValue20) >= int(intermediateValue10)))));
                        float sumValue21;
                        float productValue25;
                        float productValue26;
                        float productValue27;
                        if (comparisonValue9)
                        {
                            float multiplyAddValue29 = fma(float(int(sumValue19)) + 0.5, ViewCB.packedValues[78u].z * 2.0, -1.0);
                            float multiplyAddValue30 = fma(float(int(sumValue20)) + 0.5, ViewCB.packedValues[78u].w * (-2.0), 1.0);
                            float sampledTextureValue13 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(sumValue19, sumValue20)), int(0u)).x * nonlinearValue;
                            float multiplyAddValue31 = productValue6 - (fma(multiplyAddValue30, ViewCB.packedValues[41u].x, fma(multiplyAddValue29, ViewCB.packedValues[40u].x, ViewCB.packedValues[42u].x)) * sampledTextureValue13);
                            float multiplyAddValue32 = productValue7 - (fma(multiplyAddValue30, ViewCB.packedValues[41u].y, fma(multiplyAddValue29, ViewCB.packedValues[40u].y, ViewCB.packedValues[42u].y)) * sampledTextureValue13);
                            float multiplyAddValue33 = productValue8 - (fma(multiplyAddValue30, ViewCB.packedValues[41u].z, fma(multiplyAddValue29, ViewCB.packedValues[40u].z, ViewCB.packedValues[42u].z)) * sampledTextureValue13);
                            float dotProductValue5 = exp2((quotientValue1 * (-1.44269502162933349609375)) * dot(vec3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33), vec3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33)));
                            vec4 loadedBufferValue1 = imageLoad(shadowDenoisingOutputs[bitwiseValue3], ivec2(uvec2(sumValue19, sumValue20)));
                            sumValue21 = dotProductValue5 + scalarValue17;
                            productValue25 = (loadedBufferValue1.x * dotProductValue5) + scalarValue18;
                            productValue26 = (loadedBufferValue1.y * dotProductValue5) + scalarValue19;
                            productValue27 = (loadedBufferValue1.z * dotProductValue5) + scalarValue20;
                        }
                        else
                        {
                            sumValue21 = scalarValue17;
                            productValue25 = scalarValue18;
                            productValue26 = scalarValue19;
                            productValue27 = scalarValue20;
                        }
                        uint sumValue18 = uint(int(productValue23 + scalarValue12));
                        uint sumValue22 = uint(int(productValue24 + scalarValue13));
                        uint sampledTextureValue14 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(sumValue18, sumValue22)), int(0u))).x - scalarValue16;
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        if ((int(uint(abs(int(sampledTextureValue14)))) <= int(intermediateValue40)) && (!(((int(sumValue18) < int(intermediateValue8)) || (int(sumValue22) < int(0u))) || ((int(sumValue18) >= int(intermediateValue9)) || (int(sumValue22) >= int(intermediateValue10))))))
                        {
                            float multiplyAddValue34 = fma(float(int(sumValue18)) + 0.5, ViewCB.packedValues[78u].z * 2.0, -1.0);
                            float multiplyAddValue35 = fma(float(int(sumValue22)) + 0.5, ViewCB.packedValues[78u].w * (-2.0), 1.0);
                            float sampledTextureValue15 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(sumValue18, sumValue22)), int(0u)).x * nonlinearValue;
                            float multiplyAddValue36 = productValue6 - (fma(multiplyAddValue35, ViewCB.packedValues[41u].x, fma(multiplyAddValue34, ViewCB.packedValues[40u].x, ViewCB.packedValues[42u].x)) * sampledTextureValue15);
                            float multiplyAddValue37 = productValue7 - (fma(multiplyAddValue35, ViewCB.packedValues[41u].y, fma(multiplyAddValue34, ViewCB.packedValues[40u].y, ViewCB.packedValues[42u].y)) * sampledTextureValue15);
                            float multiplyAddValue38 = productValue8 - (fma(multiplyAddValue35, ViewCB.packedValues[41u].z, fma(multiplyAddValue34, ViewCB.packedValues[40u].z, ViewCB.packedValues[42u].z)) * sampledTextureValue15);
                            float dotProductValue6 = exp2((quotientValue1 * (-1.44269502162933349609375)) * dot(vec3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38), vec3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38)));
                            vec4 loadedBufferValue2 = imageLoad(shadowDenoisingOutputs[bitwiseValue3], ivec2(uvec2(sumValue18, sumValue22)));
                            branchMergedValue = dotProductValue6 + sumValue21;
                            branchMergedValue1 = (loadedBufferValue2.x * dotProductValue6) + productValue25;
                            branchMergedValue2 = (loadedBufferValue2.y * dotProductValue6) + productValue26;
                            branchMergedValue3 = (loadedBufferValue2.z * dotProductValue6) + productValue27;
                        }
                        else
                        {
                            branchMergedValue = sumValue21;
                            branchMergedValue1 = productValue25;
                            branchMergedValue2 = productValue26;
                            branchMergedValue3 = productValue27;
                        }
                        intermediateValue27 = branchMergedValue;
                        intermediateValue29 = branchMergedValue1;
                        intermediateValue31 = branchMergedValue2;
                        intermediateValue33 = branchMergedValue3;
                        uint sumValue23 = scalarValue21 + 1u;
                        if (sumValue23 == dotProductValue4)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue17 = intermediateValue27;
                            scalarValue18 = intermediateValue29;
                            scalarValue19 = intermediateValue31;
                            scalarValue20 = intermediateValue33;
                            scalarValue21 = sumValue23;
                            continue;
                        }
                    }
                    intermediateValue26 = intermediateValue27;
                    intermediateValue28 = intermediateValue29;
                    intermediateValue30 = intermediateValue31;
                    intermediateValue32 = intermediateValue33;
                }
                else
                {
                    intermediateValue26 = 1.0;
                    intermediateValue28 = scalarValue2;
                    intermediateValue30 = scalarValue3;
                    intermediateValue32 = scalarValue4;
                }
                imageStore(shadowDenoisingOutputs[bitwiseValue4], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(spvNMin(spvNMax(intermediateValue28 / intermediateValue26, 0.0), 100.0), spvNMin(spvNMax(intermediateValue30 / intermediateValue26, 0.0), 100.0), spvNMin(spvNMax(intermediateValue32 / intermediateValue26, 0.0), 100.0), scalarValue5));
            }
            else
            {
                imageStore(shadowDenoisingOutputs[bitwiseValue4], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
            }
        }
        else
        {
            imageStore(shadowDenoisingOutputs[bitwiseValue4], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(scalarValue2, scalarValue3, scalarValue4, scalarValue5));
        }
    }
}
