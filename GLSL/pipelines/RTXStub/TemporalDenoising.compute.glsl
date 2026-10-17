#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / TemporalDenoising / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 42
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue = reinterpretedBits.x;
    uint bitwiseValue = ((scalarValue >> 16u) & 255u) + 0u;
    vec4 loadedBufferValue = imageLoad(shadowDenoisingOutputs[((scalarValue >> 8u) & 255u) + 0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
    float scalarValue1 = loadedBufferValue.x;
    float scalarValue2 = loadedBufferValue.y;
    float scalarValue3 = loadedBufferValue.z;
    if ((uvec4(texelFetch(inputTileClassification, ivec2(uvec2(uint(int(gl_GlobalInvocationID.x) / int(16u)), uint(int(gl_GlobalInvocationID.y) / int(16u)))), int(0u))).x & 4u) == 0u)
    {
        vec4 sampledTextureValue = texelFetch(inputBufferMotionVectors, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        uint productValue = uint(int(((sampledTextureValue.x + (ViewCB.packedValues[78u].z * ViewCB.packedValues[81u].z)) * ViewCB.packedValues[80u].x) + float(int(gl_GlobalInvocationID.x))));
        uint productValue1 = uint(int(((sampledTextureValue.y + (ViewCB.packedValues[78u].w * ViewCB.packedValues[81u].w)) * ViewCB.packedValues[80u].y) + float(int(gl_GlobalInvocationID.y))));
        uint intermediateValue6;
        uint intermediateValue7;
        uint intermediateValue8;
        if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
        {
            intermediateValue6 = 0u;
            intermediateValue7 = uint(int(ViewCB.packedValues[78u].x));
            intermediateValue8 = uint(int(ViewCB.packedValues[78u].y));
        }
        else
        {
            uint scalarValue4 = uint(ViewCB.packedValues[80u].x);
            bool conditionValue = gl_GlobalInvocationID.x < scalarValue4;
            intermediateValue6 = conditionValue ? 0u : scalarValue4;
            intermediateValue7 = conditionValue ? scalarValue4 : uint(ViewCB.packedValues[78u].x);
            intermediateValue8 = uint(ViewCB.packedValues[78u].y);
        }
        float productValue2 = ViewCB.packedValues[88u].x * ViewCB.packedValues[78u].x;
        float productValue3 = ViewCB.packedValues[88u].x * ViewCB.packedValues[78u].y;
        uint productValue4 = uint(float(uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(productValue))), 0.0), productValue2))));
        uint productValue5 = uint(float(uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(productValue1))), 0.0), productValue3))));
        bool sampledTextureValue4;
        if (((int(productValue1) > int(4294967295u)) && (int(productValue) >= int(intermediateValue6))) && ((int(productValue) < int(intermediateValue7)) && (int(productValue1) < int(intermediateValue8))))
        {
            vec4 sampledTextureValue1 = texelFetch(inputGeometryNormal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
            float scalarValue5 = sampledTextureValue1.x;
            float scalarValue6 = sampledTextureValue1.y;
            float sumValue = 1.0 - abs(scalarValue5);
            float scalarValue7 = abs(scalarValue6);
            float sumValue1 = sumValue - scalarValue7;
            bool conditionValue1 = sumValue1 < 0.0;
            float comparisonValue = conditionValue1 ? ((1.0 - scalarValue7) * ((scalarValue5 >= 0.0) ? 1.0 : (-1.0))) : scalarValue5;
            float comparisonValue1 = conditionValue1 ? (((scalarValue6 >= 0.0) ? 1.0 : (-1.0)) * sumValue) : scalarValue6;
            float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue1), vec3(comparisonValue, comparisonValue1, sumValue1)));
            vec4 sampledTextureValue2 = texelFetch(previousPrimaryNormalBuffer, ivec2(uvec2(uint(float(uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(gl_GlobalInvocationID.x))), 0.0), productValue2)))), uint(float(uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(gl_GlobalInvocationID.y))), 0.0), productValue3)))))), int(0u));
            float scalarValue8 = sampledTextureValue2.x;
            float scalarValue9 = sampledTextureValue2.y;
            float sumValue2 = 1.0 - abs(scalarValue8);
            float scalarValue10 = abs(scalarValue9);
            float sumValue3 = sumValue2 - scalarValue10;
            bool conditionValue2 = sumValue3 < 0.0;
            float comparisonValue2 = conditionValue2 ? ((1.0 - scalarValue10) * ((scalarValue8 >= 0.0) ? 1.0 : (-1.0))) : scalarValue8;
            float comparisonValue3 = conditionValue2 ? (((scalarValue9 >= 0.0) ? 1.0 : (-1.0)) * sumValue2) : scalarValue9;
            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue2, comparisonValue3, sumValue3), vec3(comparisonValue2, comparisonValue3, sumValue3)));
            vec4 sampledTextureValue3 = texelFetch(inputBufferReprojectedPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
            float scalarValue11 = sampledTextureValue3.x;
            sampledTextureValue4 = spvNClamp(float((abs(texelFetch(previousPrimaryPathLengthBuffer, ivec2(uvec2(productValue4, productValue5)), int(0u)).x - scalarValue11) / scalarValue11) < 0.039999999105930328369140625) - float(dot(vec3(comparisonValue2 * inverseLengthValue1, comparisonValue3 * inverseLengthValue1, inverseLengthValue1 * sumValue3), vec3(comparisonValue * inverseLengthValue, comparisonValue1 * inverseLengthValue, inverseLengthValue * sumValue1)) < 0.60000002384185791015625), 0.0, 1.0) != 0.0;
        }
        else
        {
            sampledTextureValue4 = false;
        }
        vec4 sampledTextureValue5 = texelFetch(previousSunLightShadowBuffer, ivec2(uvec2(productValue4, productValue5)), int(0u));
        imageStore(shadowDenoisingOutputs[bitwiseValue], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(sampledTextureValue4 ? ((((sampledTextureValue4 ? sampledTextureValue5.x : 0.0) - scalarValue1) * 0.60000002384185791015625) + scalarValue1) : scalarValue1, sampledTextureValue4 ? ((((sampledTextureValue4 ? sampledTextureValue5.y : 0.0) - scalarValue2) * 0.60000002384185791015625) + scalarValue2) : scalarValue2, sampledTextureValue4 ? ((((sampledTextureValue4 ? sampledTextureValue5.z : 0.0) - scalarValue3) * 0.60000002384185791015625) + scalarValue3) : scalarValue3, loadedBufferValue.w));
    }
    else
    {
        imageStore(shadowDenoisingOutputs[bitwiseValue], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(scalarValue1, scalarValue2, scalarValue3, loadedBufferValue.w));
    }
}
