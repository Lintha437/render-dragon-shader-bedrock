#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / SpecularFireflyFilter / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 41
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uint scalarValue = uint(int(ViewCB.packedValues[78u].x));
    uint scalarValue1 = uint(int(ViewCB.packedValues[78u].y));
    uint sumValue = scalarValue1 + 4294967295u;
    uint intermediateValue4;
    uint intermediateValue5;
    uint intermediateValue6;
    if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
    {
        intermediateValue4 = 0u;
        intermediateValue5 = scalarValue;
        intermediateValue6 = scalarValue1;
    }
    else
    {
        uint scalarValue2 = uint(ViewCB.packedValues[80u].x);
        bool conditionValue = gl_GlobalInvocationID.x < scalarValue2;
        intermediateValue4 = conditionValue ? 0u : scalarValue2;
        intermediateValue5 = conditionValue ? scalarValue2 : uint(ViewCB.packedValues[78u].x);
        intermediateValue6 = uint(ViewCB.packedValues[78u].y);
    }
    uint reinterpretedBits = (floatBitsToUint(RootConstants.packedValues[0u]).x & 255u) + 0u;
    uint bitwiseValue = (gl_LocalInvocationID.y << 4u) + gl_LocalInvocationID.x;
    if (int(bitwiseValue) < int(162u))
    {
        uint quotientValue = uint(int(bitwiseValue) - int(18u) * (int(bitwiseValue) / int(18u)));
        uint quotientValue1 = uint(int(bitwiseValue) / int(18u));
        uint bitwiseValue1 = ((gl_WorkGroupID.y << 4u) + 4294967295u) + quotientValue1;
        uint bitwiseValue2 = uint(min(int(uint(max(int(((gl_WorkGroupID.x << 4u) + 4294967295u) + quotientValue), int(0u)))), int(scalarValue + 4294967295u)));
        uint scalarValue3 = uint(min(int(uint(max(int(bitwiseValue1), int(0u)))), int(sumValue)));
        intermediateValue[quotientValue + (quotientValue1 * 18u)] = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(bitwiseValue2, scalarValue3)), int(0u))).x;
        vec4 loadedBufferValue = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(bitwiseValue2, scalarValue3)));
        intermediateValue1[0u + ((quotientValue + (quotientValue1 * 18u)) * 3u)] = loadedBufferValue.x;
        intermediateValue1[1u + ((quotientValue + (quotientValue1 * 18u)) * 3u)] = loadedBufferValue.y;
        intermediateValue1[2u + ((quotientValue + (quotientValue1 * 18u)) * 3u)] = loadedBufferValue.z;
        uint sumValue1 = quotientValue1 + 9u;
        uint sumValue2 = uint(min(int(bitwiseValue1 + 9u), int(sumValue)));
        intermediateValue[quotientValue + (sumValue1 * 18u)] = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(bitwiseValue2, sumValue2)), int(0u))).x;
        vec4 loadedBufferValue1 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(bitwiseValue2, sumValue2)));
        intermediateValue1[0u + ((quotientValue + (sumValue1 * 18u)) * 3u)] = loadedBufferValue1.x;
        intermediateValue1[1u + ((quotientValue + (sumValue1 * 18u)) * 3u)] = loadedBufferValue1.y;
        intermediateValue1[2u + ((quotientValue + (sumValue1 * 18u)) * 3u)] = loadedBufferValue1.z;
    }
    barrier();
    uint sumValue3 = gl_LocalInvocationID.x + 1u;
    uint sumValue4 = gl_LocalInvocationID.y + 1u;
    uint productValue = sumValue3 + (sumValue4 * 18u);
    uint sampledTextureValue = uint(int(fma(texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).x, 0.004999999888241291046142578125, 0.02500000037252902984619140625) * 1023.0));
    float intermediateValue11;
    float intermediateValue13;
    float intermediateValue15;
    float intermediateValue17;
    float scalarValue4 = 0.0;
    float scalarValue5 = 0.0;
    float scalarValue6 = 0.0;
    float scalarValue7 = 0.0;
    uint scalarValue8 = 4294967295u;
    bool intermediateValue19;
    bool intermediateValue20;
    bool comparisonValue;
    for (;;)
    {
        uint sumValue5 = gl_GlobalInvocationID.x + 4294967295u;
        uint sumValue6 = scalarValue8 + gl_GlobalInvocationID.y;
        intermediateValue19 = int(sumValue6) > int(4294967295u);
        intermediateValue20 = int(sumValue6) < int(intermediateValue6);
        comparisonValue = ((int(sumValue5) >= int(intermediateValue4)) && intermediateValue19) && ((int(sumValue5) < int(intermediateValue5)) && intermediateValue20);
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
        if (comparisonValue)
        {
            uint sumValue7 = scalarValue8 + sumValue4;
            uint productValue1 = intermediateValue[gl_LocalInvocationID.x + (sumValue7 * 18u)] - intermediateValue[productValue];
            float comparisonValue1 = (int(uint(abs(int(productValue1)))) > int(sampledTextureValue)) ? 0.0 : 1.0;
            float branchMergedValue4;
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            if (comparisonValue1 > 0.0)
            {
                branchMergedValue4 = comparisonValue1 + scalarValue4;
                branchMergedValue7 = (intermediateValue1[0u + ((gl_LocalInvocationID.x + (sumValue7 * 18u)) * 3u)] * comparisonValue1) + scalarValue5;
                branchMergedValue8 = (intermediateValue1[1u + ((gl_LocalInvocationID.x + (sumValue7 * 18u)) * 3u)] * comparisonValue1) + scalarValue6;
                branchMergedValue9 = (intermediateValue1[2u + ((gl_LocalInvocationID.x + (sumValue7 * 18u)) * 3u)] * comparisonValue1) + scalarValue7;
            }
            else
            {
                branchMergedValue4 = scalarValue4;
                branchMergedValue7 = scalarValue5;
                branchMergedValue8 = scalarValue6;
                branchMergedValue9 = scalarValue7;
            }
            intermediateValue21 = branchMergedValue4;
            intermediateValue22 = branchMergedValue7;
            intermediateValue23 = branchMergedValue8;
            intermediateValue24 = branchMergedValue9;
        }
        else
        {
            intermediateValue21 = scalarValue4;
            intermediateValue22 = scalarValue5;
            intermediateValue23 = scalarValue6;
            intermediateValue24 = scalarValue7;
        }
        float intermediateValue25;
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
        if (((int(gl_GlobalInvocationID.x) < int(intermediateValue5)) && intermediateValue20) && ((scalarValue8 != 0u) && ((int(gl_GlobalInvocationID.x) >= int(intermediateValue4)) && intermediateValue19)))
        {
            uint sumValue8 = scalarValue8 + sumValue4;
            uint productValue2 = intermediateValue[sumValue3 + (sumValue8 * 18u)] - intermediateValue[productValue];
            float comparisonValue2 = (int(uint(abs(int(productValue2)))) > int(sampledTextureValue)) ? 0.0 : 1.0;
            float branchMergedValue5;
            float branchMergedValue10;
            float branchMergedValue11;
            float branchMergedValue12;
            if (comparisonValue2 > 0.0)
            {
                branchMergedValue5 = comparisonValue2 + intermediateValue21;
                branchMergedValue10 = (intermediateValue1[0u + ((sumValue3 + (sumValue8 * 18u)) * 3u)] * comparisonValue2) + intermediateValue22;
                branchMergedValue11 = (intermediateValue1[1u + ((sumValue3 + (sumValue8 * 18u)) * 3u)] * comparisonValue2) + intermediateValue23;
                branchMergedValue12 = (intermediateValue1[2u + ((sumValue3 + (sumValue8 * 18u)) * 3u)] * comparisonValue2) + intermediateValue24;
            }
            else
            {
                branchMergedValue5 = intermediateValue21;
                branchMergedValue10 = intermediateValue22;
                branchMergedValue11 = intermediateValue23;
                branchMergedValue12 = intermediateValue24;
            }
            intermediateValue25 = branchMergedValue5;
            intermediateValue26 = branchMergedValue10;
            intermediateValue27 = branchMergedValue11;
            intermediateValue28 = branchMergedValue12;
        }
        else
        {
            intermediateValue25 = intermediateValue21;
            intermediateValue26 = intermediateValue22;
            intermediateValue27 = intermediateValue23;
            intermediateValue28 = intermediateValue24;
        }
        uint sumValue9 = gl_GlobalInvocationID.x + 1u;
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (((int(sumValue9) >= int(intermediateValue4)) && intermediateValue19) && ((int(sumValue9) < int(intermediateValue5)) && intermediateValue20))
        {
            uint sumValue10 = gl_LocalInvocationID.x + 2u;
            uint sumValue11 = scalarValue8 + sumValue4;
            uint productValue3 = intermediateValue[sumValue10 + (sumValue11 * 18u)] - intermediateValue[productValue];
            float comparisonValue3 = (int(uint(abs(int(productValue3)))) > int(sampledTextureValue)) ? 0.0 : 1.0;
            float branchMergedValue15;
            float branchMergedValue16;
            float branchMergedValue17;
            float branchMergedValue18;
            if (comparisonValue3 > 0.0)
            {
                branchMergedValue15 = comparisonValue3 + intermediateValue25;
                branchMergedValue16 = (intermediateValue1[0u + ((sumValue10 + (sumValue11 * 18u)) * 3u)] * comparisonValue3) + intermediateValue26;
                branchMergedValue17 = (intermediateValue1[1u + ((sumValue10 + (sumValue11 * 18u)) * 3u)] * comparisonValue3) + intermediateValue27;
                branchMergedValue18 = (intermediateValue1[2u + ((sumValue10 + (sumValue11 * 18u)) * 3u)] * comparisonValue3) + intermediateValue28;
            }
            else
            {
                branchMergedValue15 = intermediateValue25;
                branchMergedValue16 = intermediateValue26;
                branchMergedValue17 = intermediateValue27;
                branchMergedValue18 = intermediateValue28;
            }
            branchMergedValue = branchMergedValue15;
            branchMergedValue1 = branchMergedValue16;
            branchMergedValue2 = branchMergedValue17;
            branchMergedValue3 = branchMergedValue18;
        }
        else
        {
            branchMergedValue = intermediateValue25;
            branchMergedValue1 = intermediateValue26;
            branchMergedValue2 = intermediateValue27;
            branchMergedValue3 = intermediateValue28;
        }
        intermediateValue11 = branchMergedValue;
        intermediateValue13 = branchMergedValue1;
        intermediateValue15 = branchMergedValue2;
        intermediateValue17 = branchMergedValue3;
        uint sumValue12 = scalarValue8 + 1u;
        if (sumValue12 == 2u)
        {
            break;
        }
        else
        {
            scalarValue4 = intermediateValue11;
            scalarValue5 = intermediateValue13;
            scalarValue6 = intermediateValue15;
            scalarValue7 = intermediateValue17;
            scalarValue8 = sumValue12;
            continue;
        }
    }
    uint productValue4 = 0u + ((sumValue3 + (sumValue4 * 18u)) * 3u);
    uint productValue5 = 1u + ((sumValue3 + (sumValue4 * 18u)) * 3u);
    uint productValue6 = 2u + ((sumValue3 + (sumValue4 * 18u)) * 3u);
    float intermediateValue29;
    float intermediateValue30;
    float intermediateValue31;
    if (intermediateValue11 != 0.0)
    {
        float quotientValue2 = intermediateValue13 / intermediateValue11;
        float quotientValue3 = intermediateValue15 / intermediateValue11;
        float quotientValue4 = intermediateValue17 / intermediateValue11;
        float dotProductValue = dot(vec3(intermediateValue1[productValue4], intermediateValue1[productValue5], intermediateValue1[productValue6]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float branchMergedValue6;
        float branchMergedValue13;
        float branchMergedValue14;
        if (dotProductValue != 0.0)
        {
            uint reinterpretedBits1 = ((floatBitsToUint(RootConstants.packedValues[0u]).x >> 24u) << 1u) + 47u;
            float loadedBufferValue2 = ((ViewCB.packedValues[reinterpretedBits1].x - ViewCB.packedValues[reinterpretedBits1].y) * spvNClamp((imageLoad(outputBufferHistoryLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y))).x * 63.75) + (-0.25), 0.0, 1.0)) + ViewCB.packedValues[reinterpretedBits1].y;
            float dotProductValue1 = dot(vec3(quotientValue2, quotientValue3, quotientValue4), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) / dotProductValue;
            float branchMergedValue19;
            float branchMergedValue20;
            float branchMergedValue21;
            if (dotProductValue1 < loadedBufferValue2)
            {
                float quotientValue5 = dotProductValue1 / loadedBufferValue2;
                branchMergedValue19 = (quotientValue5 * (intermediateValue1[productValue4] - quotientValue2)) + quotientValue2;
                branchMergedValue20 = (quotientValue5 * (intermediateValue1[productValue5] - quotientValue3)) + quotientValue3;
                branchMergedValue21 = (quotientValue5 * (intermediateValue1[productValue6] - quotientValue4)) + quotientValue4;
            }
            else
            {
                branchMergedValue19 = intermediateValue1[productValue4];
                branchMergedValue20 = intermediateValue1[productValue5];
                branchMergedValue21 = intermediateValue1[productValue6];
            }
            branchMergedValue6 = branchMergedValue19;
            branchMergedValue13 = branchMergedValue20;
            branchMergedValue14 = branchMergedValue21;
        }
        else
        {
            branchMergedValue6 = intermediateValue1[productValue4];
            branchMergedValue13 = intermediateValue1[productValue5];
            branchMergedValue14 = intermediateValue1[productValue6];
        }
        intermediateValue29 = branchMergedValue6;
        intermediateValue30 = branchMergedValue13;
        intermediateValue31 = branchMergedValue14;
    }
    else
    {
        intermediateValue29 = intermediateValue1[productValue4];
        intermediateValue30 = intermediateValue1[productValue5];
        intermediateValue31 = intermediateValue1[productValue6];
    }
    vec4 loadedBufferValue3 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
    float scalarValue9 = loadedBufferValue3.w;
    uint reinterpretedBits2 = floatBitsToUint(intermediateValue29) & 2147483647u;
    uint reinterpretedBits3 = floatBitsToUint(intermediateValue30) & 2147483647u;
    uint reinterpretedBits4 = floatBitsToUint(intermediateValue31) & 2147483647u;
    uint reinterpretedBits5 = floatBitsToUint(scalarValue9) & 2147483647u;
    if (!(((((reinterpretedBits2 > 2139095040u) || (reinterpretedBits3 > 2139095040u)) || (reinterpretedBits4 > 2139095040u)) || (reinterpretedBits5 > 2139095040u)) || ((((reinterpretedBits2 == 2139095040u) || (reinterpretedBits3 == 2139095040u)) || (reinterpretedBits4 == 2139095040u)) || (reinterpretedBits5 == 2139095040u))))
    {
        imageStore(denoisingOutputs[((floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u) + 0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue29, intermediateValue30, intermediateValue31, scalarValue9));
    }
}
