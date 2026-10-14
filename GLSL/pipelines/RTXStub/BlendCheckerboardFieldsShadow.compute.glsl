#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / BlendCheckerboardFieldsShadow / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 11
#endif

#extension GL_EXT_samplerless_texture_functions : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    if (!((float(gl_GlobalInvocationID.x) >= ViewCB.packedValues[80u].x) || (float(gl_GlobalInvocationID.y) >= ViewCB.packedValues[80u].y)))
    {
        uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
        uint scalarValue = reinterpretedBits.x;
        uint bitwiseValue = ((scalarValue >> 8u) & 255u) + 0u;
        uint bitwiseValue1 = ((scalarValue >> 16u) & 255u) + 0u;
        uint sumValue = uint(ViewCB.packedValues[80u].x) + gl_GlobalInvocationID.x;
        uvec4 sampledTextureValue = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)));
        uint scalarValue1 = sampledTextureValue.x;
        uint sampledTextureValue1 = scalarValue1 - uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)), int(0u))).x;
        vec4 loadedBufferValue = imageLoad(shadowDenoisingOutputs[bitwiseValue], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue2 = loadedBufferValue.x;
        float scalarValue3 = loadedBufferValue.y;
        float scalarValue4 = loadedBufferValue.z;
        float scalarValue5 = loadedBufferValue.w;
        vec4 loadedBufferValue1 = imageLoad(shadowDenoisingOutputs[bitwiseValue], ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)));
        float scalarValue6 = loadedBufferValue1.x;
        float scalarValue7 = loadedBufferValue1.y;
        float scalarValue8 = loadedBufferValue1.z;
        float scalarValue9 = loadedBufferValue1.w;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        if ((scalarValue1 != 0u) && (int(uint(abs(int(sampledTextureValue1)))) < int(uint(int(fma(texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).x, 0.001000000047497451305389404296875, 0.02500000037252902984619140625) * 1023.0)))))
        {
            float productValue = ((scalarValue6 - scalarValue2) * 0.5) + scalarValue2;
            float productValue1 = ((scalarValue7 - scalarValue3) * 0.5) + scalarValue3;
            float productValue2 = ((scalarValue8 - scalarValue4) * 0.5) + scalarValue4;
            float productValue3 = ((scalarValue9 - scalarValue5) * 0.5) + scalarValue5;
            intermediateValue10 = productValue;
            intermediateValue11 = productValue1;
            intermediateValue12 = productValue2;
            intermediateValue13 = productValue3;
            intermediateValue14 = productValue;
            intermediateValue15 = productValue1;
            intermediateValue16 = productValue2;
            intermediateValue17 = productValue3;
        }
        else
        {
            intermediateValue10 = scalarValue2;
            intermediateValue11 = scalarValue3;
            intermediateValue12 = scalarValue4;
            intermediateValue13 = scalarValue5;
            intermediateValue14 = scalarValue6;
            intermediateValue15 = scalarValue7;
            intermediateValue16 = scalarValue8;
            intermediateValue17 = scalarValue9;
        }
        imageStore(shadowDenoisingOutputs[bitwiseValue1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue10, intermediateValue11, intermediateValue12, intermediateValue13));
        imageStore(shadowDenoisingOutputs[bitwiseValue1], ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)), vec4(intermediateValue14, intermediateValue15, intermediateValue16, intermediateValue17));
    }
}
