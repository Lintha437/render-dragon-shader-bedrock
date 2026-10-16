#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / AtrousSH / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 6
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue = reinterpretedBits.x;
    bool bitwiseValue = (scalarValue & 16711680u) < 196608u;
    uint bitwiseValue1 = scalarValue >> 16u;
    uint bitwiseValue2 = 1u << (bitwiseValue1 & 31u);
    uint reinterpretedBits1 = ((floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u) + 0u;
    uint reinterpretedBits2 = (floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u;
    vec4 sampledTextureValue = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
    float scalarValue1 = sampledTextureValue.x;
    if (scalarValue1 == 65504.0)
    {
        imageStore(denoisingOutputs[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(denoisingChromaAndVarianceOutputs[reinterpretedBits2], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
    }
    else
    {
        uint reinterpretedBits3 = floatBitsToUint(RootConstants.packedValues[0u]).x & 255u;
        uint bitwiseValue3 = (scalarValue & 255u) + 0u;
        uvec4 reinterpretedBits4 = floatBitsToUint(RootConstants.packedValues[0u]);
        uint scalarValue2 = reinterpretedBits4.x;
        uvec4 sampledTextureValue1 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)));
        uint scalarValue3 = sampledTextureValue1.x;
        uint multiplyAddValue = uint(int(fma(scalarValue1, 0.004999999888241291046142578125, 0.02500000037252902984619140625) * 1023.0));
        vec4 loadedBufferValue = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue4 = loadedBufferValue.x;
        float scalarValue5 = loadedBufferValue.y;
        float scalarValue6 = loadedBufferValue.z;
        float scalarValue7 = loadedBufferValue.w;
        vec4 loadedBufferValue1 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits3], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue8 = loadedBufferValue1.x;
        float scalarValue9 = loadedBufferValue1.y;
        float scalarValue10 = loadedBufferValue1.w;
        uint bitwiseValue4 = ((scalarValue2 >> 23u) & 2u) + 46u;
        float intermediateValue11;
        uint intermediateValue12;
        float intermediateValue14;
        float intermediateValue15;
        if ((scalarValue2 & 67108864u) == 0u)
        {
            intermediateValue11 = scalarValue10;
            intermediateValue12 = 0u;
            intermediateValue14 = 1.0;
            intermediateValue15 = ViewCB.packedValues[bitwiseValue4].x;
        }
        else
        {
            float sumValue;
            uint intermediateValue13;
            float intermediateValue16;
            if (scalarValue10 < 0.0)
            {
                sumValue = (-0.0) - scalarValue10;
                intermediateValue13 = 1u;
                intermediateValue16 = spvNMax(ViewCB.packedValues[bitwiseValue4].x, 4.0);
            }
            else
            {
                sumValue = scalarValue10;
                intermediateValue13 = 0u;
                intermediateValue16 = ViewCB.packedValues[bitwiseValue4].x;
            }
            intermediateValue11 = sumValue;
            intermediateValue12 = intermediateValue13;
            intermediateValue14 = sqrt(spvNMax(1.0000000133514319600180897396058e-10, sumValue));
            intermediateValue15 = intermediateValue16;
        }
        float productValue = intermediateValue15 * intermediateValue14;
        uvec4 reinterpretedBits5 = floatBitsToUint(ViewCB.packedValues[91u]);
        uint scalarValue11 = reinterpretedBits5.y;
        bool comparisonValue = scalarValue11 != 2u;
        uint sampledTextureValue2;
        if (bitwiseValue && comparisonValue)
        {
            sampledTextureValue2 = uint((uint(texelFetch(inputPrimaryThroughput, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).w) & 15u) == 0u);
        }
        else
        {
            sampledTextureValue2 = 0u;
        }
        bool comparisonValue1 = sampledTextureValue2 == 0u;
        bool comparisonValue2 = scalarValue11 == 2u;
        uint intermediateValue22;
        uint intermediateValue23;
        uint intermediateValue24;
        uint intermediateValue25;
        if (comparisonValue1)
        {
            uint branchMergedValue;
            uint branchMergedValue2;
            uint branchMergedValue3;
            uint branchMergedValue4;
            if (comparisonValue2)
            {
                branchMergedValue = gl_GlobalInvocationID.x;
                branchMergedValue2 = uint(int(ViewCB.packedValues[78u].y));
                branchMergedValue3 = uint(int(ViewCB.packedValues[78u].x));
                branchMergedValue4 = 0u;
            }
            else
            {
                uint scalarValue12 = uint(ViewCB.packedValues[80u].x);
                uint scalarValue13 = uint(ViewCB.packedValues[78u].y);
                uint branchMergedValue8;
                uint branchMergedValue10;
                uint branchMergedValue11;
                uint branchMergedValue12;
                if (gl_GlobalInvocationID.x < scalarValue12)
                {
                    branchMergedValue8 = gl_GlobalInvocationID.x;
                    branchMergedValue10 = scalarValue13;
                    branchMergedValue11 = scalarValue12;
                    branchMergedValue12 = 0u;
                }
                else
                {
                    branchMergedValue8 = gl_GlobalInvocationID.x;
                    branchMergedValue10 = scalarValue13;
                    branchMergedValue11 = uint(ViewCB.packedValues[78u].x);
                    branchMergedValue12 = scalarValue12;
                }
                branchMergedValue = branchMergedValue8;
                branchMergedValue2 = branchMergedValue10;
                branchMergedValue3 = branchMergedValue11;
                branchMergedValue4 = branchMergedValue12;
            }
            intermediateValue22 = branchMergedValue4;
            intermediateValue23 = branchMergedValue3;
            intermediateValue24 = branchMergedValue2;
            intermediateValue25 = branchMergedValue;
        }
        else
        {
            uint scalarValue14 = uint(int(ViewCB.packedValues[78u].x));
            uint scalarValue15 = uint(int(ViewCB.packedValues[78u].y));
            uint branchMergedValue1;
            uint branchMergedValue5;
            uint branchMergedValue6;
            uint branchMergedValue7;
            if (comparisonValue2)
            {
                branchMergedValue1 = gl_GlobalInvocationID.x;
                branchMergedValue5 = scalarValue15;
                branchMergedValue6 = scalarValue14;
                branchMergedValue7 = 0u;
            }
            else
            {
                uint productValue1 = uint(ViewCB.packedValues[78u].x * 0.5);
                uint reinterpretedBits6 = (((scalarValue11 == 0u) ? floatBitsToUint(ViewCB.packedValues[84u]).z : 0u) + gl_GlobalInvocationID.y) & 1u;
                uint branchMergedValue9;
                uint branchMergedValue13;
                uint branchMergedValue14;
                uint branchMergedValue15;
                if (gl_GlobalInvocationID.x < productValue1)
                {
                    branchMergedValue9 = ((gl_GlobalInvocationID.x << 1u) | 1u) - reinterpretedBits6;
                    branchMergedValue13 = scalarValue15;
                    branchMergedValue14 = scalarValue14;
                    branchMergedValue15 = 0u;
                }
                else
                {
                    branchMergedValue9 = reinterpretedBits6 | ((gl_GlobalInvocationID.x - productValue1) << 1u);
                    branchMergedValue13 = scalarValue15;
                    branchMergedValue14 = scalarValue14;
                    branchMergedValue15 = 0u;
                }
                branchMergedValue1 = branchMergedValue9;
                branchMergedValue5 = branchMergedValue13;
                branchMergedValue6 = branchMergedValue14;
                branchMergedValue7 = branchMergedValue15;
            }
            intermediateValue22 = branchMergedValue7;
            intermediateValue23 = branchMergedValue6;
            intermediateValue24 = branchMergedValue5;
            intermediateValue25 = branchMergedValue1;
        }
        uvec4 reinterpretedBits7 = floatBitsToUint(ViewCB.packedValues[84u]);
        uint scalarValue16 = reinterpretedBits7.z;
        uint sumValue1 = scalarValue16 + bitwiseValue1;
        vec4 sampledTextureValue3 = texelFetch(blueNoiseTexture, ivec3(uvec3(gl_GlobalInvocationID.x & 255u, gl_GlobalInvocationID.y & 255u, (sumValue1 >> 1u) & 127u)), int(0u));
        bool comparisonValue3 = (sumValue1 & 1u) == 0u;
        float productValue2 = spvNMin(float(int(bitwiseValue2)), 16.0) * 0.5;
        uint comparisonValue4 = uint(int(((comparisonValue3 ? sampledTextureValue3.x : sampledTextureValue3.z) + (-0.5)) * productValue2)) + intermediateValue25;
        uint comparisonValue5 = uint(int(((comparisonValue3 ? sampledTextureValue3.y : sampledTextureValue3.w) + (-0.5)) * productValue2)) + gl_GlobalInvocationID.y;
        uint bitwiseValue5;
        if (comparisonValue && (!bitwiseValue))
        {
            bitwiseValue5 = uint(max(int(1u), int(uint(int(bitwiseValue2) >> int(1u)))));
        }
        else
        {
            bitwiseValue5 = bitwiseValue2;
        }
        uint sumValue2 = comparisonValue4 - bitwiseValue5;
        uint sumValue3 = comparisonValue5 - bitwiseValue2;
        uint intermediateValue27;
        if (comparisonValue1)
        {
            intermediateValue27 = sumValue2;
        }
        else
        {
            intermediateValue27 = ((((sumValue2 ^ sumValue3) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue2 >> 1u);
        }
        bool conditionValue = int(sumValue3) > int(4294967295u);
        bool conditionValue1 = int(sumValue3) < int(intermediateValue24);
        float sumValue4;
        float productValue3;
        float productValue4;
        float productValue5;
        float productValue6;
        float productValue7;
        float productValue8;
        float productValue9;
        if ((conditionValue && (int(intermediateValue27) >= int(intermediateValue22))) && (conditionValue1 && (int(intermediateValue27) < int(intermediateValue23))))
        {
            uint sampledTextureValue4 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue27, sumValue3)), int(0u))).x - scalarValue3;
            vec4 loadedBufferValue2 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue27, sumValue3)));
            float scalarValue17 = loadedBufferValue2.w;
            float exponentialValue = exp2((((-0.0) - abs(scalarValue7 - scalarValue17)) / productValue) * 1.44269502162933349609375) * ((int(uint(abs(int(sampledTextureValue4)))) <= int(multiplyAddValue)) ? 0.25 : 0.0);
            vec4 loadedBufferValue3 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits3], ivec2(uvec2(intermediateValue27, sumValue3)));
            float scalarValue18 = loadedBufferValue3.w;
            float sumValue5;
            if (scalarValue18 < 0.0)
            {
                sumValue5 = spvNMin((-0.0) - scalarValue18, intermediateValue11);
            }
            else
            {
                sumValue5 = scalarValue18;
            }
            sumValue4 = exponentialValue + 1.0;
            productValue3 = (exponentialValue * loadedBufferValue2.x) + scalarValue4;
            productValue4 = (exponentialValue * loadedBufferValue2.y) + scalarValue5;
            productValue5 = (exponentialValue * loadedBufferValue2.z) + scalarValue6;
            productValue6 = (exponentialValue * scalarValue17) + scalarValue7;
            productValue7 = (loadedBufferValue3.x * exponentialValue) + scalarValue8;
            productValue8 = (loadedBufferValue3.y * exponentialValue) + scalarValue9;
            productValue9 = ((exponentialValue * exponentialValue) * sumValue5) + intermediateValue11;
        }
        else
        {
            sumValue4 = 1.0;
            productValue3 = scalarValue4;
            productValue4 = scalarValue5;
            productValue5 = scalarValue6;
            productValue6 = scalarValue7;
            productValue7 = scalarValue8;
            productValue8 = scalarValue9;
            productValue9 = intermediateValue11;
        }
        uint intermediateValue32;
        if (comparisonValue1)
        {
            intermediateValue32 = comparisonValue4;
        }
        else
        {
            intermediateValue32 = ((((sumValue3 ^ comparisonValue4) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (comparisonValue4 >> 1u);
        }
        float sumValue6;
        float productValue10;
        float productValue11;
        float productValue12;
        float productValue13;
        float productValue14;
        float productValue15;
        float productValue16;
        if ((conditionValue && (int(intermediateValue32) >= int(intermediateValue22))) && (conditionValue1 && (int(intermediateValue32) < int(intermediateValue23))))
        {
            uint sampledTextureValue5 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue32, sumValue3)), int(0u))).x - scalarValue3;
            vec4 loadedBufferValue4 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue32, sumValue3)));
            float scalarValue19 = loadedBufferValue4.w;
            float exponentialValue1 = exp2((((-0.0) - abs(scalarValue7 - scalarValue19)) / productValue) * 1.44269502162933349609375) * ((int(uint(abs(int(sampledTextureValue5)))) <= int(multiplyAddValue)) ? 0.5 : 0.0);
            vec4 loadedBufferValue5 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits3], ivec2(uvec2(intermediateValue32, sumValue3)));
            float scalarValue20 = loadedBufferValue5.w;
            float sumValue8;
            if (scalarValue20 < 0.0)
            {
                sumValue8 = spvNMin((-0.0) - scalarValue20, intermediateValue11);
            }
            else
            {
                sumValue8 = scalarValue20;
            }
            sumValue6 = exponentialValue1 + sumValue4;
            productValue10 = (exponentialValue1 * loadedBufferValue4.x) + productValue3;
            productValue11 = (exponentialValue1 * loadedBufferValue4.y) + productValue4;
            productValue12 = (exponentialValue1 * loadedBufferValue4.z) + productValue5;
            productValue13 = (exponentialValue1 * scalarValue19) + productValue6;
            productValue14 = (loadedBufferValue5.x * exponentialValue1) + productValue7;
            productValue15 = (loadedBufferValue5.y * exponentialValue1) + productValue8;
            productValue16 = ((exponentialValue1 * exponentialValue1) * sumValue8) + productValue9;
        }
        else
        {
            sumValue6 = sumValue4;
            productValue10 = productValue3;
            productValue11 = productValue4;
            productValue12 = productValue5;
            productValue13 = productValue6;
            productValue14 = productValue7;
            productValue15 = productValue8;
            productValue16 = productValue9;
        }
        uint sumValue7 = bitwiseValue5 + comparisonValue4;
        uint intermediateValue35;
        if (comparisonValue1)
        {
            intermediateValue35 = sumValue7;
        }
        else
        {
            intermediateValue35 = ((((sumValue7 ^ sumValue3) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue7 >> 1u);
        }
        float sumValue9;
        float productValue17;
        float productValue18;
        float productValue19;
        float productValue20;
        float productValue21;
        float productValue22;
        float productValue23;
        if ((conditionValue && (int(intermediateValue35) >= int(intermediateValue22))) && (conditionValue1 && (int(intermediateValue35) < int(intermediateValue23))))
        {
            uint sampledTextureValue6 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue35, sumValue3)), int(0u))).x - scalarValue3;
            vec4 loadedBufferValue6 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue35, sumValue3)));
            float scalarValue21 = loadedBufferValue6.w;
            float exponentialValue2 = exp2((((-0.0) - abs(scalarValue7 - scalarValue21)) / productValue) * 1.44269502162933349609375) * ((int(uint(abs(int(sampledTextureValue6)))) <= int(multiplyAddValue)) ? 0.25 : 0.0);
            vec4 loadedBufferValue7 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits3], ivec2(uvec2(intermediateValue35, sumValue3)));
            float scalarValue22 = loadedBufferValue7.w;
            float sumValue10;
            if (scalarValue22 < 0.0)
            {
                sumValue10 = spvNMin((-0.0) - scalarValue22, intermediateValue11);
            }
            else
            {
                sumValue10 = scalarValue22;
            }
            sumValue9 = exponentialValue2 + sumValue6;
            productValue17 = (exponentialValue2 * loadedBufferValue6.x) + productValue10;
            productValue18 = (exponentialValue2 * loadedBufferValue6.y) + productValue11;
            productValue19 = (exponentialValue2 * loadedBufferValue6.z) + productValue12;
            productValue20 = (exponentialValue2 * scalarValue21) + productValue13;
            productValue21 = (loadedBufferValue7.x * exponentialValue2) + productValue14;
            productValue22 = (loadedBufferValue7.y * exponentialValue2) + productValue15;
            productValue23 = ((exponentialValue2 * exponentialValue2) * sumValue10) + productValue16;
        }
        else
        {
            sumValue9 = sumValue6;
            productValue17 = productValue10;
            productValue18 = productValue11;
            productValue19 = productValue12;
            productValue20 = productValue13;
            productValue21 = productValue14;
            productValue22 = productValue15;
            productValue23 = productValue16;
        }
        uint intermediateValue38;
        if (comparisonValue1)
        {
            intermediateValue38 = sumValue2;
        }
        else
        {
            intermediateValue38 = ((((sumValue2 ^ comparisonValue5) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue2 >> 1u);
        }
        bool conditionValue2 = int(comparisonValue5) > int(4294967295u);
        bool conditionValue3 = int(comparisonValue5) < int(intermediateValue24);
        float sumValue11;
        float productValue24;
        float productValue25;
        float productValue26;
        float productValue27;
        float productValue28;
        float productValue29;
        float productValue30;
        if ((conditionValue2 && (int(intermediateValue38) >= int(intermediateValue22))) && (conditionValue3 && (int(intermediateValue38) < int(intermediateValue23))))
        {
            uint sampledTextureValue7 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue38, comparisonValue5)), int(0u))).x - scalarValue3;
            vec4 loadedBufferValue8 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue38, comparisonValue5)));
            float scalarValue23 = loadedBufferValue8.w;
            float exponentialValue3 = exp2((((-0.0) - abs(scalarValue7 - scalarValue23)) / productValue) * 1.44269502162933349609375) * ((int(uint(abs(int(sampledTextureValue7)))) <= int(multiplyAddValue)) ? 0.5 : 0.0);
            vec4 loadedBufferValue9 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits3], ivec2(uvec2(intermediateValue38, comparisonValue5)));
            float scalarValue24 = loadedBufferValue9.w;
            float sumValue12;
            if (scalarValue24 < 0.0)
            {
                sumValue12 = spvNMin((-0.0) - scalarValue24, intermediateValue11);
            }
            else
            {
                sumValue12 = scalarValue24;
            }
            sumValue11 = exponentialValue3 + sumValue9;
            productValue24 = (exponentialValue3 * loadedBufferValue8.x) + productValue17;
            productValue25 = (exponentialValue3 * loadedBufferValue8.y) + productValue18;
            productValue26 = (exponentialValue3 * loadedBufferValue8.z) + productValue19;
            productValue27 = (exponentialValue3 * scalarValue23) + productValue20;
            productValue28 = (loadedBufferValue9.x * exponentialValue3) + productValue21;
            productValue29 = (loadedBufferValue9.y * exponentialValue3) + productValue22;
            productValue30 = ((exponentialValue3 * exponentialValue3) * sumValue12) + productValue23;
        }
        else
        {
            sumValue11 = sumValue9;
            productValue24 = productValue17;
            productValue25 = productValue18;
            productValue26 = productValue19;
            productValue27 = productValue20;
            productValue28 = productValue21;
            productValue29 = productValue22;
            productValue30 = productValue23;
        }
        uint intermediateValue43;
        if (comparisonValue1)
        {
            intermediateValue43 = sumValue7;
        }
        else
        {
            intermediateValue43 = ((((sumValue7 ^ comparisonValue5) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue7 >> 1u);
        }
        float sumValue13;
        float productValue31;
        float productValue32;
        float productValue33;
        float productValue34;
        float productValue35;
        float productValue36;
        float productValue37;
        if ((conditionValue2 && (int(intermediateValue43) >= int(intermediateValue22))) && (conditionValue3 && (int(intermediateValue43) < int(intermediateValue23))))
        {
            uint sampledTextureValue8 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue43, comparisonValue5)), int(0u))).x - scalarValue3;
            vec4 loadedBufferValue10 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue43, comparisonValue5)));
            float scalarValue25 = loadedBufferValue10.w;
            float exponentialValue4 = exp2((((-0.0) - abs(scalarValue7 - scalarValue25)) / productValue) * 1.44269502162933349609375) * ((int(uint(abs(int(sampledTextureValue8)))) <= int(multiplyAddValue)) ? 0.5 : 0.0);
            vec4 loadedBufferValue11 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits3], ivec2(uvec2(intermediateValue43, comparisonValue5)));
            float scalarValue26 = loadedBufferValue11.w;
            float sumValue15;
            if (scalarValue26 < 0.0)
            {
                sumValue15 = spvNMin((-0.0) - scalarValue26, intermediateValue11);
            }
            else
            {
                sumValue15 = scalarValue26;
            }
            sumValue13 = exponentialValue4 + sumValue11;
            productValue31 = (exponentialValue4 * loadedBufferValue10.x) + productValue24;
            productValue32 = (exponentialValue4 * loadedBufferValue10.y) + productValue25;
            productValue33 = (exponentialValue4 * loadedBufferValue10.z) + productValue26;
            productValue34 = (exponentialValue4 * scalarValue25) + productValue27;
            productValue35 = (loadedBufferValue11.x * exponentialValue4) + productValue28;
            productValue36 = (loadedBufferValue11.y * exponentialValue4) + productValue29;
            productValue37 = ((exponentialValue4 * exponentialValue4) * sumValue15) + productValue30;
        }
        else
        {
            sumValue13 = sumValue11;
            productValue31 = productValue24;
            productValue32 = productValue25;
            productValue33 = productValue26;
            productValue34 = productValue27;
            productValue35 = productValue28;
            productValue36 = productValue29;
            productValue37 = productValue30;
        }
        uint sumValue14 = comparisonValue5 + bitwiseValue2;
        uint intermediateValue46;
        if (comparisonValue1)
        {
            intermediateValue46 = sumValue2;
        }
        else
        {
            intermediateValue46 = ((((sumValue2 ^ sumValue14) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue2 >> 1u);
        }
        bool conditionValue4 = int(sumValue14) > int(4294967295u);
        bool conditionValue5 = int(sumValue14) < int(intermediateValue24);
        float sumValue16;
        float productValue38;
        float productValue39;
        float productValue40;
        float productValue41;
        float productValue42;
        float productValue43;
        float productValue44;
        if ((conditionValue4 && (int(intermediateValue46) >= int(intermediateValue22))) && (conditionValue5 && (int(intermediateValue46) < int(intermediateValue23))))
        {
            uint sampledTextureValue9 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue46, sumValue14)), int(0u))).x - scalarValue3;
            vec4 loadedBufferValue12 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue46, sumValue14)));
            float scalarValue27 = loadedBufferValue12.w;
            float exponentialValue5 = exp2((((-0.0) - abs(scalarValue7 - scalarValue27)) / productValue) * 1.44269502162933349609375) * ((int(uint(abs(int(sampledTextureValue9)))) <= int(multiplyAddValue)) ? 0.25 : 0.0);
            vec4 loadedBufferValue13 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits3], ivec2(uvec2(intermediateValue46, sumValue14)));
            float scalarValue28 = loadedBufferValue13.w;
            float sumValue17;
            if (scalarValue28 < 0.0)
            {
                sumValue17 = spvNMin((-0.0) - scalarValue28, intermediateValue11);
            }
            else
            {
                sumValue17 = scalarValue28;
            }
            sumValue16 = exponentialValue5 + sumValue13;
            productValue38 = (exponentialValue5 * loadedBufferValue12.x) + productValue31;
            productValue39 = (exponentialValue5 * loadedBufferValue12.y) + productValue32;
            productValue40 = (exponentialValue5 * loadedBufferValue12.z) + productValue33;
            productValue41 = (exponentialValue5 * scalarValue27) + productValue34;
            productValue42 = (loadedBufferValue13.x * exponentialValue5) + productValue35;
            productValue43 = (loadedBufferValue13.y * exponentialValue5) + productValue36;
            productValue44 = ((exponentialValue5 * exponentialValue5) * sumValue17) + productValue37;
        }
        else
        {
            sumValue16 = sumValue13;
            productValue38 = productValue31;
            productValue39 = productValue32;
            productValue40 = productValue33;
            productValue41 = productValue34;
            productValue42 = productValue35;
            productValue43 = productValue36;
            productValue44 = productValue37;
        }
        uint intermediateValue51;
        if (comparisonValue1)
        {
            intermediateValue51 = comparisonValue4;
        }
        else
        {
            intermediateValue51 = ((((sumValue14 ^ comparisonValue4) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (comparisonValue4 >> 1u);
        }
        float sumValue18;
        float productValue45;
        float productValue46;
        float productValue47;
        float productValue48;
        float productValue49;
        float productValue50;
        float productValue51;
        if ((conditionValue4 && (int(intermediateValue51) >= int(intermediateValue22))) && (conditionValue5 && (int(intermediateValue51) < int(intermediateValue23))))
        {
            uint sampledTextureValue10 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue51, sumValue14)), int(0u))).x - scalarValue3;
            vec4 loadedBufferValue14 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue51, sumValue14)));
            float scalarValue29 = loadedBufferValue14.w;
            float exponentialValue6 = exp2((((-0.0) - abs(scalarValue7 - scalarValue29)) / productValue) * 1.44269502162933349609375) * ((int(uint(abs(int(sampledTextureValue10)))) <= int(multiplyAddValue)) ? 0.5 : 0.0);
            vec4 loadedBufferValue15 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits3], ivec2(uvec2(intermediateValue51, sumValue14)));
            float scalarValue30 = loadedBufferValue15.w;
            float sumValue19;
            if (scalarValue30 < 0.0)
            {
                sumValue19 = spvNMin((-0.0) - scalarValue30, intermediateValue11);
            }
            else
            {
                sumValue19 = scalarValue30;
            }
            sumValue18 = exponentialValue6 + sumValue16;
            productValue45 = (exponentialValue6 * loadedBufferValue14.x) + productValue38;
            productValue46 = (exponentialValue6 * loadedBufferValue14.y) + productValue39;
            productValue47 = (exponentialValue6 * loadedBufferValue14.z) + productValue40;
            productValue48 = (exponentialValue6 * scalarValue29) + productValue41;
            productValue49 = (loadedBufferValue15.x * exponentialValue6) + productValue42;
            productValue50 = (loadedBufferValue15.y * exponentialValue6) + productValue43;
            productValue51 = ((exponentialValue6 * exponentialValue6) * sumValue19) + productValue44;
        }
        else
        {
            sumValue18 = sumValue16;
            productValue45 = productValue38;
            productValue46 = productValue39;
            productValue47 = productValue40;
            productValue48 = productValue41;
            productValue49 = productValue42;
            productValue50 = productValue43;
            productValue51 = productValue44;
        }
        uint intermediateValue54;
        if (comparisonValue1)
        {
            intermediateValue54 = sumValue7;
        }
        else
        {
            intermediateValue54 = ((((sumValue7 ^ sumValue14) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue7 >> 1u);
        }
        float sumValue20;
        float productValue52;
        float productValue53;
        float productValue54;
        float productValue55;
        float productValue56;
        float productValue57;
        float productValue58;
        if ((conditionValue4 && (int(intermediateValue54) >= int(intermediateValue22))) && (conditionValue5 && (int(intermediateValue54) < int(intermediateValue23))))
        {
            uint sampledTextureValue11 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue54, sumValue14)), int(0u))).x - scalarValue3;
            vec4 loadedBufferValue16 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue54, sumValue14)));
            float scalarValue31 = loadedBufferValue16.w;
            float exponentialValue7 = exp2((((-0.0) - abs(scalarValue7 - scalarValue31)) / productValue) * 1.44269502162933349609375) * ((int(uint(abs(int(sampledTextureValue11)))) <= int(multiplyAddValue)) ? 0.25 : 0.0);
            vec4 loadedBufferValue17 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits3], ivec2(uvec2(intermediateValue54, sumValue14)));
            float scalarValue32 = loadedBufferValue17.w;
            float sumValue21;
            if (scalarValue32 < 0.0)
            {
                sumValue21 = spvNMin((-0.0) - scalarValue32, intermediateValue11);
            }
            else
            {
                sumValue21 = scalarValue32;
            }
            sumValue20 = exponentialValue7 + sumValue18;
            productValue52 = (exponentialValue7 * loadedBufferValue16.x) + productValue45;
            productValue53 = (exponentialValue7 * loadedBufferValue16.y) + productValue46;
            productValue54 = (exponentialValue7 * loadedBufferValue16.z) + productValue47;
            productValue55 = (exponentialValue7 * scalarValue31) + productValue48;
            productValue56 = (loadedBufferValue17.x * exponentialValue7) + productValue49;
            productValue57 = (loadedBufferValue17.y * exponentialValue7) + productValue50;
            productValue58 = ((exponentialValue7 * exponentialValue7) * sumValue21) + productValue51;
        }
        else
        {
            sumValue20 = sumValue18;
            productValue52 = productValue45;
            productValue53 = productValue46;
            productValue54 = productValue47;
            productValue55 = productValue48;
            productValue56 = productValue49;
            productValue57 = productValue50;
            productValue58 = productValue51;
        }
        float quotientValue = productValue58 / (sumValue20 * sumValue20);
        float comparisonValue6 = (intermediateValue12 != 0u) ? ((-0.0) - quotientValue) : quotientValue;
        float quotientValue1 = productValue52 / sumValue20;
        float quotientValue2 = productValue53 / sumValue20;
        float quotientValue3 = productValue54 / sumValue20;
        float quotientValue4 = productValue55 / sumValue20;
        float quotientValue5 = productValue56 / sumValue20;
        float quotientValue6 = productValue57 / sumValue20;
        uint reinterpretedBits8 = floatBitsToUint(quotientValue1) & 2147483647u;
        uint reinterpretedBits9 = floatBitsToUint(quotientValue2) & 2147483647u;
        uint reinterpretedBits10 = floatBitsToUint(quotientValue3) & 2147483647u;
        uint reinterpretedBits11 = floatBitsToUint(quotientValue4) & 2147483647u;
        if (!(((((reinterpretedBits8 > 2139095040u) || (reinterpretedBits9 > 2139095040u)) || (reinterpretedBits10 > 2139095040u)) || (reinterpretedBits11 > 2139095040u)) || ((((reinterpretedBits8 == 2139095040u) || (reinterpretedBits9 == 2139095040u)) || (reinterpretedBits10 == 2139095040u)) || (reinterpretedBits11 == 2139095040u))))
        {
            imageStore(denoisingOutputs[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(quotientValue1, quotientValue2, quotientValue3, quotientValue4));
        }
        uint reinterpretedBits12 = floatBitsToUint(quotientValue5) & 2147483647u;
        uint reinterpretedBits13 = floatBitsToUint(quotientValue6) & 2147483647u;
        uint reinterpretedBits14 = floatBitsToUint(comparisonValue6) & 2147483647u;
        if (!(((reinterpretedBits14 > 2139095040u) || ((reinterpretedBits12 > 2139095040u) || (reinterpretedBits13 > 2139095040u))) || ((reinterpretedBits14 == 2139095040u) || ((reinterpretedBits12 == 2139095040u) || (reinterpretedBits13 == 2139095040u)))))
        {
            imageStore(denoisingChromaAndVarianceOutputs[reinterpretedBits2], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(quotientValue5, quotientValue6, 0.0, comparisonValue6));
        }
    }
}
