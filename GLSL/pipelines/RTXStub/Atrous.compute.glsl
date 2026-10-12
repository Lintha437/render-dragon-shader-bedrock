#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / Atrous / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
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
    uvec4 reinterpretedBits2 = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue1 = reinterpretedBits2.x;
    vec4 sampledTextureValue = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
    float scalarValue2 = sampledTextureValue.x;
    if (scalarValue2 == 65504.0)
    {
        imageStore(denoisingOutputs[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
    }
    else
    {
        uint bitwiseValue3 = (scalarValue & 255u) + 0u;
        vec4 sampledTextureValue1 = texelFetch(inputBufferNormal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue3 = sampledTextureValue1.x;
        float scalarValue4 = sampledTextureValue1.y;
        float sumValue = 1.0 - abs(scalarValue3);
        float scalarValue5 = abs(scalarValue4);
        float sumValue1 = sumValue - scalarValue5;
        bool conditionValue = sumValue1 < 0.0;
        float comparisonValue = conditionValue ? ((1.0 - scalarValue5) * ((scalarValue3 >= 0.0) ? 1.0 : (-1.0))) : scalarValue3;
        float comparisonValue1 = conditionValue ? (((scalarValue4 >= 0.0) ? 1.0 : (-1.0)) * sumValue) : scalarValue4;
        float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue1), vec3(comparisonValue, comparisonValue1, sumValue1)));
        float productValue = comparisonValue * inverseLengthValue;
        float productValue1 = comparisonValue1 * inverseLengthValue;
        float productValue2 = inverseLengthValue * sumValue1;
        uvec4 sampledTextureValue2 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)));
        uint scalarValue6 = sampledTextureValue2.x;
        uint multiplyAddValue = uint(int(fma(scalarValue2, 0.004999999888241291046142578125, 0.02500000037252902984619140625) * 1023.0));
        vec4 loadedBufferValue = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue7 = loadedBufferValue.x;
        float scalarValue8 = loadedBufferValue.y;
        float scalarValue9 = loadedBufferValue.z;
        float scalarValue10 = loadedBufferValue.w;
        float dotProductValue = dot(vec3(scalarValue7, scalarValue8, scalarValue9), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        uint bitwiseValue4 = ((scalarValue1 >> 23u) & 2u) + 46u;
        float intermediateValue12;
        uint intermediateValue13;
        float intermediateValue15;
        float intermediateValue16;
        if ((scalarValue1 & 67108864u) == 0u)
        {
            intermediateValue12 = scalarValue10;
            intermediateValue13 = 0u;
            intermediateValue15 = 1.0;
            intermediateValue16 = ViewCB.packedValues[bitwiseValue4].x;
        }
        else
        {
            float sumValue2;
            uint intermediateValue14;
            float intermediateValue17;
            if (scalarValue10 < 0.0)
            {
                sumValue2 = (-0.0) - scalarValue10;
                intermediateValue14 = 1u;
                intermediateValue17 = spvNMax(ViewCB.packedValues[bitwiseValue4].x, 4.0);
            }
            else
            {
                sumValue2 = scalarValue10;
                intermediateValue14 = 0u;
                intermediateValue17 = ViewCB.packedValues[bitwiseValue4].x;
            }
            intermediateValue12 = sumValue2;
            intermediateValue13 = intermediateValue14;
            intermediateValue15 = sqrt(spvNMax(1.0000000133514319600180897396058e-10, sumValue2));
            intermediateValue16 = intermediateValue17;
        }
        float productValue3 = intermediateValue16 * intermediateValue15;
        float loadedBufferValue1 = spvNMax(spvNMin((imageLoad(outputBufferHistoryLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y))).x * 25.5) + (-1.0), 1.0) * ViewCB.packedValues[bitwiseValue4].z, 4.0);
        uvec4 reinterpretedBits3 = floatBitsToUint(ViewCB.packedValues[91u]);
        uint scalarValue11 = reinterpretedBits3.y;
        bool comparisonValue2 = scalarValue11 != 2u;
        uint sampledTextureValue3;
        if (bitwiseValue && comparisonValue2)
        {
            sampledTextureValue3 = uint((uint(texelFetch(inputPrimaryThroughput, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).w) & 15u) == 0u);
        }
        else
        {
            sampledTextureValue3 = 0u;
        }
        bool comparisonValue3 = sampledTextureValue3 == 0u;
        bool comparisonValue4 = scalarValue11 == 2u;
        uint intermediateValue23;
        uint intermediateValue24;
        uint intermediateValue25;
        uint intermediateValue26;
        if (comparisonValue3)
        {
            uint branchMergedValue;
            uint branchMergedValue2;
            uint branchMergedValue3;
            uint branchMergedValue4;
            if (comparisonValue4)
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
            intermediateValue23 = branchMergedValue4;
            intermediateValue24 = branchMergedValue3;
            intermediateValue25 = branchMergedValue2;
            intermediateValue26 = branchMergedValue;
        }
        else
        {
            uint scalarValue14 = uint(int(ViewCB.packedValues[78u].x));
            uint scalarValue15 = uint(int(ViewCB.packedValues[78u].y));
            uint branchMergedValue1;
            uint branchMergedValue5;
            uint branchMergedValue6;
            uint branchMergedValue7;
            if (comparisonValue4)
            {
                branchMergedValue1 = gl_GlobalInvocationID.x;
                branchMergedValue5 = scalarValue15;
                branchMergedValue6 = scalarValue14;
                branchMergedValue7 = 0u;
            }
            else
            {
                uint productValue4 = uint(ViewCB.packedValues[78u].x * 0.5);
                uint reinterpretedBits4 = (((scalarValue11 == 0u) ? floatBitsToUint(ViewCB.packedValues[84u]).z : 0u) + gl_GlobalInvocationID.y) & 1u;
                uint branchMergedValue9;
                uint branchMergedValue13;
                uint branchMergedValue14;
                uint branchMergedValue15;
                if (gl_GlobalInvocationID.x < productValue4)
                {
                    branchMergedValue9 = ((gl_GlobalInvocationID.x << 1u) | 1u) - reinterpretedBits4;
                    branchMergedValue13 = scalarValue15;
                    branchMergedValue14 = scalarValue14;
                    branchMergedValue15 = 0u;
                }
                else
                {
                    branchMergedValue9 = reinterpretedBits4 | ((gl_GlobalInvocationID.x - productValue4) << 1u);
                    branchMergedValue13 = scalarValue15;
                    branchMergedValue14 = scalarValue14;
                    branchMergedValue15 = 0u;
                }
                branchMergedValue1 = branchMergedValue9;
                branchMergedValue5 = branchMergedValue13;
                branchMergedValue6 = branchMergedValue14;
                branchMergedValue7 = branchMergedValue15;
            }
            intermediateValue23 = branchMergedValue7;
            intermediateValue24 = branchMergedValue6;
            intermediateValue25 = branchMergedValue5;
            intermediateValue26 = branchMergedValue1;
        }
        uvec4 reinterpretedBits5 = floatBitsToUint(ViewCB.packedValues[84u]);
        uint scalarValue16 = reinterpretedBits5.z;
        uint sumValue3 = scalarValue16 + bitwiseValue1;
        vec4 sampledTextureValue4 = texelFetch(blueNoiseTexture, ivec3(uvec3(gl_GlobalInvocationID.x & 255u, gl_GlobalInvocationID.y & 255u, (sumValue3 >> 1u) & 127u)), int(0u));
        bool comparisonValue5 = (sumValue3 & 1u) == 0u;
        float productValue5 = spvNMin(float(int(bitwiseValue2)), 16.0) * 0.5;
        uint comparisonValue6 = uint(int(((comparisonValue5 ? sampledTextureValue4.x : sampledTextureValue4.z) + (-0.5)) * productValue5)) + intermediateValue26;
        uint comparisonValue7 = uint(int(((comparisonValue5 ? sampledTextureValue4.y : sampledTextureValue4.w) + (-0.5)) * productValue5)) + gl_GlobalInvocationID.y;
        uint bitwiseValue5;
        if (comparisonValue2 && (!bitwiseValue))
        {
            bitwiseValue5 = uint(max(int(1u), int(uint(int(bitwiseValue2) >> int(1u)))));
        }
        else
        {
            bitwiseValue5 = bitwiseValue2;
        }
        uint sumValue4 = comparisonValue6 - bitwiseValue5;
        uint sumValue5 = comparisonValue7 - bitwiseValue2;
        uint intermediateValue28;
        if (comparisonValue3)
        {
            intermediateValue28 = sumValue4;
        }
        else
        {
            intermediateValue28 = ((((sumValue4 ^ sumValue5) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue4 >> 1u);
        }
        bool conditionValue1 = int(sumValue5) > int(4294967295u);
        bool conditionValue2 = int(sumValue5) < int(intermediateValue25);
        float sumValue8;
        float productValue6;
        float productValue7;
        float productValue8;
        float productValue9;
        if ((conditionValue1 && (int(intermediateValue28) >= int(intermediateValue23))) && (conditionValue2 && (int(intermediateValue28) < int(intermediateValue24))))
        {
            uint sampledTextureValue5 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue28, sumValue5)), int(0u))).x - scalarValue6;
            vec4 sampledTextureValue6 = texelFetch(inputBufferNormal, ivec2(uvec2(intermediateValue28, sumValue5)), int(0u));
            float scalarValue17 = sampledTextureValue6.x;
            float scalarValue18 = sampledTextureValue6.y;
            float sumValue6 = 1.0 - abs(scalarValue17);
            float scalarValue19 = abs(scalarValue18);
            float sumValue7 = sumValue6 - scalarValue19;
            bool conditionValue3 = sumValue7 < 0.0;
            float comparisonValue8 = conditionValue3 ? ((1.0 - scalarValue19) * ((scalarValue17 >= 0.0) ? 1.0 : (-1.0))) : scalarValue17;
            float comparisonValue9 = conditionValue3 ? (((scalarValue18 >= 0.0) ? 1.0 : (-1.0)) * sumValue6) : scalarValue18;
            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue8, comparisonValue9, sumValue7), vec3(comparisonValue8, comparisonValue9, sumValue7)));
            vec4 loadedBufferValue2 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue28, sumValue5)));
            float scalarValue20 = loadedBufferValue2.x;
            float scalarValue21 = loadedBufferValue2.w;
            float dotProductValue1 = (exp2(log2(spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(comparisonValue8 * inverseLengthValue1, comparisonValue9 * inverseLengthValue1, inverseLengthValue1 * sumValue7)), 0.0, 1.0)) * loadedBufferValue1) * ((int(uint(abs(int(sampledTextureValue5)))) <= int(multiplyAddValue)) ? 0.25 : 0.0)) * exp2((((-0.0) - abs(dotProductValue - dot(vec3(scalarValue20, loadedBufferValue2.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)))) / productValue3) * 1.44269502162933349609375);
            float sumValue9;
            if (scalarValue21 < 0.0)
            {
                sumValue9 = spvNMin((-0.0) - scalarValue21, intermediateValue12);
            }
            else
            {
                sumValue9 = scalarValue21;
            }
            sumValue8 = dotProductValue1 + 1.0;
            productValue6 = (dotProductValue1 * scalarValue20) + scalarValue7;
            productValue7 = (dotProductValue1 * loadedBufferValue2.y) + scalarValue8;
            productValue8 = (dotProductValue1 * loadedBufferValue2.z) + scalarValue9;
            productValue9 = ((dotProductValue1 * dotProductValue1) * sumValue9) + intermediateValue12;
        }
        else
        {
            sumValue8 = 1.0;
            productValue6 = scalarValue7;
            productValue7 = scalarValue8;
            productValue8 = scalarValue9;
            productValue9 = intermediateValue12;
        }
        uint intermediateValue37;
        if (comparisonValue3)
        {
            intermediateValue37 = comparisonValue6;
        }
        else
        {
            intermediateValue37 = ((((sumValue5 ^ comparisonValue6) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (comparisonValue6 >> 1u);
        }
        float sumValue12;
        float productValue10;
        float productValue11;
        float productValue12;
        float productValue13;
        if ((conditionValue1 && (int(intermediateValue37) >= int(intermediateValue23))) && (conditionValue2 && (int(intermediateValue37) < int(intermediateValue24))))
        {
            uint sampledTextureValue7 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue37, sumValue5)), int(0u))).x - scalarValue6;
            vec4 sampledTextureValue8 = texelFetch(inputBufferNormal, ivec2(uvec2(intermediateValue37, sumValue5)), int(0u));
            float scalarValue22 = sampledTextureValue8.x;
            float scalarValue23 = sampledTextureValue8.y;
            float sumValue10 = 1.0 - abs(scalarValue22);
            float scalarValue24 = abs(scalarValue23);
            float sumValue11 = sumValue10 - scalarValue24;
            bool conditionValue4 = sumValue11 < 0.0;
            float comparisonValue10 = conditionValue4 ? ((1.0 - scalarValue24) * ((scalarValue22 >= 0.0) ? 1.0 : (-1.0))) : scalarValue22;
            float comparisonValue11 = conditionValue4 ? (((scalarValue23 >= 0.0) ? 1.0 : (-1.0)) * sumValue10) : scalarValue23;
            float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue10, comparisonValue11, sumValue11), vec3(comparisonValue10, comparisonValue11, sumValue11)));
            vec4 loadedBufferValue3 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue37, sumValue5)));
            float scalarValue25 = loadedBufferValue3.x;
            float scalarValue26 = loadedBufferValue3.w;
            float dotProductValue2 = (exp2(log2(spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(comparisonValue10 * inverseLengthValue2, comparisonValue11 * inverseLengthValue2, inverseLengthValue2 * sumValue11)), 0.0, 1.0)) * loadedBufferValue1) * ((int(uint(abs(int(sampledTextureValue7)))) <= int(multiplyAddValue)) ? 0.5 : 0.0)) * exp2((((-0.0) - abs(dotProductValue - dot(vec3(scalarValue25, loadedBufferValue3.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)))) / productValue3) * 1.44269502162933349609375);
            float sumValue14;
            if (scalarValue26 < 0.0)
            {
                sumValue14 = spvNMin((-0.0) - scalarValue26, intermediateValue12);
            }
            else
            {
                sumValue14 = scalarValue26;
            }
            sumValue12 = dotProductValue2 + sumValue8;
            productValue10 = (dotProductValue2 * scalarValue25) + productValue6;
            productValue11 = (dotProductValue2 * loadedBufferValue3.y) + productValue7;
            productValue12 = (dotProductValue2 * loadedBufferValue3.z) + productValue8;
            productValue13 = ((dotProductValue2 * dotProductValue2) * sumValue14) + productValue9;
        }
        else
        {
            sumValue12 = sumValue8;
            productValue10 = productValue6;
            productValue11 = productValue7;
            productValue12 = productValue8;
            productValue13 = productValue9;
        }
        uint sumValue13 = bitwiseValue5 + comparisonValue6;
        uint intermediateValue44;
        if (comparisonValue3)
        {
            intermediateValue44 = sumValue13;
        }
        else
        {
            intermediateValue44 = ((((sumValue13 ^ sumValue5) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue13 >> 1u);
        }
        float sumValue17;
        float productValue14;
        float productValue15;
        float productValue16;
        float productValue17;
        if ((conditionValue1 && (int(intermediateValue44) >= int(intermediateValue23))) && (conditionValue2 && (int(intermediateValue44) < int(intermediateValue24))))
        {
            uint sampledTextureValue9 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue44, sumValue5)), int(0u))).x - scalarValue6;
            vec4 sampledTextureValue10 = texelFetch(inputBufferNormal, ivec2(uvec2(intermediateValue44, sumValue5)), int(0u));
            float scalarValue27 = sampledTextureValue10.x;
            float scalarValue28 = sampledTextureValue10.y;
            float sumValue15 = 1.0 - abs(scalarValue27);
            float scalarValue29 = abs(scalarValue28);
            float sumValue16 = sumValue15 - scalarValue29;
            bool conditionValue5 = sumValue16 < 0.0;
            float comparisonValue12 = conditionValue5 ? ((1.0 - scalarValue29) * ((scalarValue27 >= 0.0) ? 1.0 : (-1.0))) : scalarValue27;
            float comparisonValue13 = conditionValue5 ? (((scalarValue28 >= 0.0) ? 1.0 : (-1.0)) * sumValue15) : scalarValue28;
            float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue12, comparisonValue13, sumValue16), vec3(comparisonValue12, comparisonValue13, sumValue16)));
            vec4 loadedBufferValue4 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue44, sumValue5)));
            float scalarValue30 = loadedBufferValue4.x;
            float scalarValue31 = loadedBufferValue4.w;
            float dotProductValue3 = (exp2(log2(spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(comparisonValue12 * inverseLengthValue3, comparisonValue13 * inverseLengthValue3, inverseLengthValue3 * sumValue16)), 0.0, 1.0)) * loadedBufferValue1) * ((int(uint(abs(int(sampledTextureValue9)))) <= int(multiplyAddValue)) ? 0.25 : 0.0)) * exp2((((-0.0) - abs(dotProductValue - dot(vec3(scalarValue30, loadedBufferValue4.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)))) / productValue3) * 1.44269502162933349609375);
            float sumValue18;
            if (scalarValue31 < 0.0)
            {
                sumValue18 = spvNMin((-0.0) - scalarValue31, intermediateValue12);
            }
            else
            {
                sumValue18 = scalarValue31;
            }
            sumValue17 = dotProductValue3 + sumValue12;
            productValue14 = (dotProductValue3 * scalarValue30) + productValue10;
            productValue15 = (dotProductValue3 * loadedBufferValue4.y) + productValue11;
            productValue16 = (dotProductValue3 * loadedBufferValue4.z) + productValue12;
            productValue17 = ((dotProductValue3 * dotProductValue3) * sumValue18) + productValue13;
        }
        else
        {
            sumValue17 = sumValue12;
            productValue14 = productValue10;
            productValue15 = productValue11;
            productValue16 = productValue12;
            productValue17 = productValue13;
        }
        uint intermediateValue51;
        if (comparisonValue3)
        {
            intermediateValue51 = sumValue4;
        }
        else
        {
            intermediateValue51 = ((((sumValue4 ^ comparisonValue7) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue4 >> 1u);
        }
        bool conditionValue6 = int(comparisonValue7) > int(4294967295u);
        bool conditionValue7 = int(comparisonValue7) < int(intermediateValue25);
        float sumValue21;
        float productValue18;
        float productValue19;
        float productValue20;
        float productValue21;
        if ((conditionValue6 && (int(intermediateValue51) >= int(intermediateValue23))) && (conditionValue7 && (int(intermediateValue51) < int(intermediateValue24))))
        {
            uint sampledTextureValue11 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue51, comparisonValue7)), int(0u))).x - scalarValue6;
            vec4 sampledTextureValue12 = texelFetch(inputBufferNormal, ivec2(uvec2(intermediateValue51, comparisonValue7)), int(0u));
            float scalarValue32 = sampledTextureValue12.x;
            float scalarValue33 = sampledTextureValue12.y;
            float sumValue19 = 1.0 - abs(scalarValue32);
            float scalarValue34 = abs(scalarValue33);
            float sumValue20 = sumValue19 - scalarValue34;
            bool conditionValue8 = sumValue20 < 0.0;
            float comparisonValue14 = conditionValue8 ? ((1.0 - scalarValue34) * ((scalarValue32 >= 0.0) ? 1.0 : (-1.0))) : scalarValue32;
            float comparisonValue15 = conditionValue8 ? (((scalarValue33 >= 0.0) ? 1.0 : (-1.0)) * sumValue19) : scalarValue33;
            float inverseLengthValue4 = inversesqrt(dot(vec3(comparisonValue14, comparisonValue15, sumValue20), vec3(comparisonValue14, comparisonValue15, sumValue20)));
            vec4 loadedBufferValue5 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue51, comparisonValue7)));
            float scalarValue35 = loadedBufferValue5.x;
            float scalarValue36 = loadedBufferValue5.w;
            float dotProductValue4 = (exp2(log2(spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(comparisonValue14 * inverseLengthValue4, comparisonValue15 * inverseLengthValue4, inverseLengthValue4 * sumValue20)), 0.0, 1.0)) * loadedBufferValue1) * ((int(uint(abs(int(sampledTextureValue11)))) <= int(multiplyAddValue)) ? 0.5 : 0.0)) * exp2((((-0.0) - abs(dotProductValue - dot(vec3(scalarValue35, loadedBufferValue5.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)))) / productValue3) * 1.44269502162933349609375);
            float sumValue22;
            if (scalarValue36 < 0.0)
            {
                sumValue22 = spvNMin((-0.0) - scalarValue36, intermediateValue12);
            }
            else
            {
                sumValue22 = scalarValue36;
            }
            sumValue21 = dotProductValue4 + sumValue17;
            productValue18 = (dotProductValue4 * scalarValue35) + productValue14;
            productValue19 = (dotProductValue4 * loadedBufferValue5.y) + productValue15;
            productValue20 = (dotProductValue4 * loadedBufferValue5.z) + productValue16;
            productValue21 = ((dotProductValue4 * dotProductValue4) * sumValue22) + productValue17;
        }
        else
        {
            sumValue21 = sumValue17;
            productValue18 = productValue14;
            productValue19 = productValue15;
            productValue20 = productValue16;
            productValue21 = productValue17;
        }
        uint intermediateValue60;
        if (comparisonValue3)
        {
            intermediateValue60 = sumValue13;
        }
        else
        {
            intermediateValue60 = ((((sumValue13 ^ comparisonValue7) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue13 >> 1u);
        }
        float sumValue25;
        float productValue22;
        float productValue23;
        float productValue24;
        float productValue25;
        if ((conditionValue6 && (int(intermediateValue60) >= int(intermediateValue23))) && (conditionValue7 && (int(intermediateValue60) < int(intermediateValue24))))
        {
            uint sampledTextureValue13 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue60, comparisonValue7)), int(0u))).x - scalarValue6;
            vec4 sampledTextureValue14 = texelFetch(inputBufferNormal, ivec2(uvec2(intermediateValue60, comparisonValue7)), int(0u));
            float scalarValue37 = sampledTextureValue14.x;
            float scalarValue38 = sampledTextureValue14.y;
            float sumValue23 = 1.0 - abs(scalarValue37);
            float scalarValue39 = abs(scalarValue38);
            float sumValue24 = sumValue23 - scalarValue39;
            bool conditionValue9 = sumValue24 < 0.0;
            float comparisonValue16 = conditionValue9 ? ((1.0 - scalarValue39) * ((scalarValue37 >= 0.0) ? 1.0 : (-1.0))) : scalarValue37;
            float comparisonValue17 = conditionValue9 ? (((scalarValue38 >= 0.0) ? 1.0 : (-1.0)) * sumValue23) : scalarValue38;
            float inverseLengthValue5 = inversesqrt(dot(vec3(comparisonValue16, comparisonValue17, sumValue24), vec3(comparisonValue16, comparisonValue17, sumValue24)));
            vec4 loadedBufferValue6 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue60, comparisonValue7)));
            float scalarValue40 = loadedBufferValue6.x;
            float scalarValue41 = loadedBufferValue6.w;
            float dotProductValue5 = (exp2(log2(spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(comparisonValue16 * inverseLengthValue5, comparisonValue17 * inverseLengthValue5, inverseLengthValue5 * sumValue24)), 0.0, 1.0)) * loadedBufferValue1) * ((int(uint(abs(int(sampledTextureValue13)))) <= int(multiplyAddValue)) ? 0.5 : 0.0)) * exp2((((-0.0) - abs(dotProductValue - dot(vec3(scalarValue40, loadedBufferValue6.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)))) / productValue3) * 1.44269502162933349609375);
            float sumValue27;
            if (scalarValue41 < 0.0)
            {
                sumValue27 = spvNMin((-0.0) - scalarValue41, intermediateValue12);
            }
            else
            {
                sumValue27 = scalarValue41;
            }
            sumValue25 = dotProductValue5 + sumValue21;
            productValue22 = (dotProductValue5 * scalarValue40) + productValue18;
            productValue23 = (dotProductValue5 * loadedBufferValue6.y) + productValue19;
            productValue24 = (dotProductValue5 * loadedBufferValue6.z) + productValue20;
            productValue25 = ((dotProductValue5 * dotProductValue5) * sumValue27) + productValue21;
        }
        else
        {
            sumValue25 = sumValue21;
            productValue22 = productValue18;
            productValue23 = productValue19;
            productValue24 = productValue20;
            productValue25 = productValue21;
        }
        uint sumValue26 = comparisonValue7 + bitwiseValue2;
        uint intermediateValue67;
        if (comparisonValue3)
        {
            intermediateValue67 = sumValue4;
        }
        else
        {
            intermediateValue67 = ((((sumValue4 ^ sumValue26) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue4 >> 1u);
        }
        bool conditionValue10 = int(sumValue26) > int(4294967295u);
        bool conditionValue11 = int(sumValue26) < int(intermediateValue25);
        float sumValue30;
        float productValue26;
        float productValue27;
        float productValue28;
        float productValue29;
        if ((conditionValue10 && (int(intermediateValue67) >= int(intermediateValue23))) && (conditionValue11 && (int(intermediateValue67) < int(intermediateValue24))))
        {
            uint sampledTextureValue15 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue67, sumValue26)), int(0u))).x - scalarValue6;
            vec4 sampledTextureValue16 = texelFetch(inputBufferNormal, ivec2(uvec2(intermediateValue67, sumValue26)), int(0u));
            float scalarValue42 = sampledTextureValue16.x;
            float scalarValue43 = sampledTextureValue16.y;
            float sumValue28 = 1.0 - abs(scalarValue42);
            float scalarValue44 = abs(scalarValue43);
            float sumValue29 = sumValue28 - scalarValue44;
            bool conditionValue12 = sumValue29 < 0.0;
            float comparisonValue18 = conditionValue12 ? ((1.0 - scalarValue44) * ((scalarValue42 >= 0.0) ? 1.0 : (-1.0))) : scalarValue42;
            float comparisonValue19 = conditionValue12 ? (((scalarValue43 >= 0.0) ? 1.0 : (-1.0)) * sumValue28) : scalarValue43;
            float inverseLengthValue6 = inversesqrt(dot(vec3(comparisonValue18, comparisonValue19, sumValue29), vec3(comparisonValue18, comparisonValue19, sumValue29)));
            vec4 loadedBufferValue7 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue67, sumValue26)));
            float scalarValue45 = loadedBufferValue7.x;
            float scalarValue46 = loadedBufferValue7.w;
            float dotProductValue6 = (exp2(log2(spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(comparisonValue18 * inverseLengthValue6, comparisonValue19 * inverseLengthValue6, inverseLengthValue6 * sumValue29)), 0.0, 1.0)) * loadedBufferValue1) * ((int(uint(abs(int(sampledTextureValue15)))) <= int(multiplyAddValue)) ? 0.25 : 0.0)) * exp2((((-0.0) - abs(dotProductValue - dot(vec3(scalarValue45, loadedBufferValue7.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)))) / productValue3) * 1.44269502162933349609375);
            float sumValue31;
            if (scalarValue46 < 0.0)
            {
                sumValue31 = spvNMin((-0.0) - scalarValue46, intermediateValue12);
            }
            else
            {
                sumValue31 = scalarValue46;
            }
            sumValue30 = dotProductValue6 + sumValue25;
            productValue26 = (dotProductValue6 * scalarValue45) + productValue22;
            productValue27 = (dotProductValue6 * loadedBufferValue7.y) + productValue23;
            productValue28 = (dotProductValue6 * loadedBufferValue7.z) + productValue24;
            productValue29 = ((dotProductValue6 * dotProductValue6) * sumValue31) + productValue25;
        }
        else
        {
            sumValue30 = sumValue25;
            productValue26 = productValue22;
            productValue27 = productValue23;
            productValue28 = productValue24;
            productValue29 = productValue25;
        }
        uint intermediateValue76;
        if (comparisonValue3)
        {
            intermediateValue76 = comparisonValue6;
        }
        else
        {
            intermediateValue76 = ((((sumValue26 ^ comparisonValue6) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (comparisonValue6 >> 1u);
        }
        float sumValue34;
        float productValue30;
        float productValue31;
        float productValue32;
        float productValue33;
        if ((conditionValue10 && (int(intermediateValue76) >= int(intermediateValue23))) && (conditionValue11 && (int(intermediateValue76) < int(intermediateValue24))))
        {
            uint sampledTextureValue17 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue76, sumValue26)), int(0u))).x - scalarValue6;
            vec4 sampledTextureValue18 = texelFetch(inputBufferNormal, ivec2(uvec2(intermediateValue76, sumValue26)), int(0u));
            float scalarValue47 = sampledTextureValue18.x;
            float scalarValue48 = sampledTextureValue18.y;
            float sumValue32 = 1.0 - abs(scalarValue47);
            float scalarValue49 = abs(scalarValue48);
            float sumValue33 = sumValue32 - scalarValue49;
            bool conditionValue13 = sumValue33 < 0.0;
            float comparisonValue20 = conditionValue13 ? ((1.0 - scalarValue49) * ((scalarValue47 >= 0.0) ? 1.0 : (-1.0))) : scalarValue47;
            float comparisonValue21 = conditionValue13 ? (((scalarValue48 >= 0.0) ? 1.0 : (-1.0)) * sumValue32) : scalarValue48;
            float inverseLengthValue7 = inversesqrt(dot(vec3(comparisonValue20, comparisonValue21, sumValue33), vec3(comparisonValue20, comparisonValue21, sumValue33)));
            vec4 loadedBufferValue8 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue76, sumValue26)));
            float scalarValue50 = loadedBufferValue8.x;
            float scalarValue51 = loadedBufferValue8.w;
            float dotProductValue7 = (exp2(log2(spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(comparisonValue20 * inverseLengthValue7, comparisonValue21 * inverseLengthValue7, inverseLengthValue7 * sumValue33)), 0.0, 1.0)) * loadedBufferValue1) * ((int(uint(abs(int(sampledTextureValue17)))) <= int(multiplyAddValue)) ? 0.5 : 0.0)) * exp2((((-0.0) - abs(dotProductValue - dot(vec3(scalarValue50, loadedBufferValue8.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)))) / productValue3) * 1.44269502162933349609375);
            float sumValue35;
            if (scalarValue51 < 0.0)
            {
                sumValue35 = spvNMin((-0.0) - scalarValue51, intermediateValue12);
            }
            else
            {
                sumValue35 = scalarValue51;
            }
            sumValue34 = dotProductValue7 + sumValue30;
            productValue30 = (dotProductValue7 * scalarValue50) + productValue26;
            productValue31 = (dotProductValue7 * loadedBufferValue8.y) + productValue27;
            productValue32 = (dotProductValue7 * loadedBufferValue8.z) + productValue28;
            productValue33 = ((dotProductValue7 * dotProductValue7) * sumValue35) + productValue29;
        }
        else
        {
            sumValue34 = sumValue30;
            productValue30 = productValue26;
            productValue31 = productValue27;
            productValue32 = productValue28;
            productValue33 = productValue29;
        }
        uint intermediateValue83;
        if (comparisonValue3)
        {
            intermediateValue83 = sumValue13;
        }
        else
        {
            intermediateValue83 = ((((sumValue13 ^ sumValue26) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue13 >> 1u);
        }
        float sumValue38;
        float productValue34;
        float productValue35;
        float productValue36;
        float productValue37;
        if ((conditionValue10 && (int(intermediateValue83) >= int(intermediateValue23))) && (conditionValue11 && (int(intermediateValue83) < int(intermediateValue24))))
        {
            uint sampledTextureValue19 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(intermediateValue83, sumValue26)), int(0u))).x - scalarValue6;
            vec4 sampledTextureValue20 = texelFetch(inputBufferNormal, ivec2(uvec2(intermediateValue83, sumValue26)), int(0u));
            float scalarValue52 = sampledTextureValue20.x;
            float scalarValue53 = sampledTextureValue20.y;
            float sumValue36 = 1.0 - abs(scalarValue52);
            float scalarValue54 = abs(scalarValue53);
            float sumValue37 = sumValue36 - scalarValue54;
            bool conditionValue14 = sumValue37 < 0.0;
            float comparisonValue22 = conditionValue14 ? ((1.0 - scalarValue54) * ((scalarValue52 >= 0.0) ? 1.0 : (-1.0))) : scalarValue52;
            float comparisonValue23 = conditionValue14 ? (((scalarValue53 >= 0.0) ? 1.0 : (-1.0)) * sumValue36) : scalarValue53;
            float inverseLengthValue8 = inversesqrt(dot(vec3(comparisonValue22, comparisonValue23, sumValue37), vec3(comparisonValue22, comparisonValue23, sumValue37)));
            vec4 loadedBufferValue9 = imageLoad(denoisingOutputs[bitwiseValue3], ivec2(uvec2(intermediateValue83, sumValue26)));
            float scalarValue55 = loadedBufferValue9.x;
            float scalarValue56 = loadedBufferValue9.w;
            float dotProductValue8 = (exp2(log2(spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(comparisonValue22 * inverseLengthValue8, comparisonValue23 * inverseLengthValue8, inverseLengthValue8 * sumValue37)), 0.0, 1.0)) * loadedBufferValue1) * ((int(uint(abs(int(sampledTextureValue19)))) <= int(multiplyAddValue)) ? 0.25 : 0.0)) * exp2((((-0.0) - abs(dotProductValue - dot(vec3(scalarValue55, loadedBufferValue9.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)))) / productValue3) * 1.44269502162933349609375);
            float sumValue39;
            if (scalarValue56 < 0.0)
            {
                sumValue39 = spvNMin((-0.0) - scalarValue56, intermediateValue12);
            }
            else
            {
                sumValue39 = scalarValue56;
            }
            sumValue38 = dotProductValue8 + sumValue34;
            productValue34 = (dotProductValue8 * scalarValue55) + productValue30;
            productValue35 = (dotProductValue8 * loadedBufferValue9.y) + productValue31;
            productValue36 = (dotProductValue8 * loadedBufferValue9.z) + productValue32;
            productValue37 = ((dotProductValue8 * dotProductValue8) * sumValue39) + productValue33;
        }
        else
        {
            sumValue38 = sumValue34;
            productValue34 = productValue30;
            productValue35 = productValue31;
            productValue36 = productValue32;
            productValue37 = productValue33;
        }
        float quotientValue = productValue37 / (sumValue38 * sumValue38);
        float comparisonValue24 = (intermediateValue13 != 0u) ? ((-0.0) - quotientValue) : quotientValue;
        float quotientValue1 = productValue34 / sumValue38;
        float quotientValue2 = productValue35 / sumValue38;
        float quotientValue3 = productValue36 / sumValue38;
        uint reinterpretedBits6 = floatBitsToUint(quotientValue1) & 2147483647u;
        uint reinterpretedBits7 = floatBitsToUint(quotientValue2) & 2147483647u;
        uint reinterpretedBits8 = floatBitsToUint(quotientValue3) & 2147483647u;
        uint reinterpretedBits9 = floatBitsToUint(comparisonValue24) & 2147483647u;
        if (!(((reinterpretedBits9 > 2139095040u) || (((reinterpretedBits6 > 2139095040u) || (reinterpretedBits7 > 2139095040u)) || (reinterpretedBits8 > 2139095040u))) || ((reinterpretedBits9 == 2139095040u) || (((reinterpretedBits6 == 2139095040u) || (reinterpretedBits7 == 2139095040u)) || (reinterpretedBits8 == 2139095040u)))))
        {
            imageStore(denoisingOutputs[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(quotientValue1, quotientValue2, quotientValue3, comparisonValue24));
        }
    }
}
