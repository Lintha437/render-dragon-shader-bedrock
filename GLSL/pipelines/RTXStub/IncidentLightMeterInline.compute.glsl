#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / IncidentLightMeterInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 28
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue = reinterpretedBits.x;
    uint bitwiseValue = scalarValue & 65535u;
    if (gl_GlobalInvocationID.z == 0u)
    {
        uint quotientValue = uint(((1.0 / float(bitwiseValue)) * (float(gl_GlobalInvocationID.x) + 0.5)) * ViewCB.packedValues[80u].x);
        uint bitwiseValue1 = uint(((1.0 / float(scalarValue >> 16u)) * (float(gl_GlobalInvocationID.y) + 0.5)) * ViewCB.packedValues[80u].y);
        vec4 sampledTextureValue = texelFetch(previousDiffuseBuffer, ivec2(uvec2(quotientValue, bitwiseValue1)), int(0u));
        float scalarValue1 = sampledTextureValue.x;
        float scalarValue2 = sampledTextureValue.w;
        vec4 sampledTextureValue1 = texelFetch(inputPreviousGeometryNormal, ivec2(uvec2(quotientValue, bitwiseValue1)), int(0u));
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
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        if (floatBitsToUint(ViewCB.packedValues[96u]).x == 0u)
        {
            intermediateValue7 = scalarValue1;
            intermediateValue8 = sampledTextureValue.y;
            intermediateValue9 = sampledTextureValue.z;
        }
        else
        {
            vec4 sampledTextureValue2 = texelFetch(previousDiffuseChromaBuffer, ivec2(uvec2(quotientValue, bitwiseValue1)), int(0u));
            float dotProductValue = (dot(vec3(scalarValue1, sampledTextureValue.yz), vec3(productValue, productValue1, productValue2)) * 1.02332603931427001953125) + (scalarValue2 * 0.886225998401641845703125);
            float quotientValue1 = dotProductValue * (0.564189970493316650390625 / (scalarValue2 + 9.9999999747524270787835121154785e-07));
            float productValue3 = quotientValue1 * sampledTextureValue2.x;
            float productValue4 = quotientValue1 * sampledTextureValue2.y;
            float productValue5 = (dotProductValue * 2.0) - (productValue4 * 0.5);
            float productValue6 = productValue5 - (productValue3 * 0.5);
            intermediateValue7 = spvNMax(productValue6 + productValue3, 0.0);
            intermediateValue8 = spvNMax(productValue5 + productValue4, 0.0);
            intermediateValue9 = spvNMax(productValue6, 0.0);
        }
        float dotProductValue1 = spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(ViewCB.packedValues[52u].xyz)), 0.0, 1.0);
        float productValue7;
        float productValue8;
        float productValue9;
        if (dotProductValue1 > 0.0)
        {
            vec4 sampledTextureValue3 = texelFetch(previousSunLightShadowBuffer, ivec2(uvec2(quotientValue, bitwiseValue1)), int(0u));
            float loadedBufferValue = uintBitsToFloat(imageLoad(bufferIncidentLight, int(0u)).x) * (dotProductValue1 * 0.3183098733425140380859375);
            productValue7 = ((loadedBufferValue * sampledTextureValue3.x) * ViewCB.packedValues[50u].x) + intermediateValue7;
            productValue8 = ((loadedBufferValue * sampledTextureValue3.y) * ViewCB.packedValues[50u].y) + intermediateValue8;
            productValue9 = ((loadedBufferValue * sampledTextureValue3.z) * ViewCB.packedValues[50u].z) + intermediateValue9;
        }
        else
        {
            productValue7 = intermediateValue7;
            productValue8 = intermediateValue8;
            productValue9 = intermediateValue9;
        }
        float exponentialValue = exp2(log2(productValue7) * 0.3333333432674407958984375);
        float exponentialValue1 = exp2(log2(productValue8) * 0.3333333432674407958984375);
        float exponentialValue2 = exp2(log2(productValue9) * 0.3333333432674407958984375);
        bool reinterpretedBits1 = (((floatBitsToUint(exponentialValue) & 2147483647u) > 2139095040u) || ((floatBitsToUint(exponentialValue1) & 2147483647u) > 2139095040u)) || ((floatBitsToUint(exponentialValue2) & 2147483647u) > 2139095040u);
        uint productValue10 = ((gl_GlobalInvocationID.x + 3u) + (bitwiseValue * gl_GlobalInvocationID.y)) * 4u;
        imageStore(bufferIncidentLight, int(productValue10), uvec4(floatBitsToUint(reinterpretedBits1 ? 0.0 : exponentialValue)));
        imageStore(bufferIncidentLight, int(productValue10 + 1u), uvec4(floatBitsToUint(reinterpretedBits1 ? 0.0 : exponentialValue1)));
        imageStore(bufferIncidentLight, int(productValue10 + 2u), uvec4(floatBitsToUint(reinterpretedBits1 ? 0.0 : exponentialValue2)));
        imageStore(bufferIncidentLight, int(productValue10 + 3u), uvec4(floatBitsToUint(1.0 - spvNClamp(fma(texelFetch(previousPrimaryPathLengthBuffer, ivec2(uvec2(quotientValue, bitwiseValue1)), int(0u)).x, ViewCB.packedValues[51u].x, ViewCB.packedValues[51u].y), 0.0, 1.0))));
    }
}
