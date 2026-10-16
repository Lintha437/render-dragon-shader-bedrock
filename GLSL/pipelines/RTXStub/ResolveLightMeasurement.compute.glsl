#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / ResolveLightMeasurement / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 39
#endif

#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    if (gl_GlobalInvocationID.x == 0u)
    {
        float loadedBufferValue = uintBitsToFloat(imageLoad(bufferIncidentLight, int(0u)).x);
        uint sumValue = 8u + 1u;
        uint sumValue1 = 8u + 2u;
        vec3 loadedBufferValue1 = uintBitsToFloat(uvec3(imageLoad(bufferIncidentLight, int(8u)).x, imageLoad(bufferIncidentLight, int(sumValue)).x, imageLoad(bufferIncidentLight, int(sumValue1)).x));
        float scalarValue = loadedBufferValue1.x;
        float intermediateValue1;
        float intermediateValue2;
        float intermediateValue3;
        float intermediateValue4;
        uint intermediateValue5;
        intermediateValue1 = 0.0;
        intermediateValue2 = 0.0;
        intermediateValue3 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0u;
        float sumValue2;
        float productValue;
        float productValue1;
        float productValue2;
        for (;;)
        {
            uint productValue3 = (intermediateValue5 * 4u) + 12u;
            vec4 loadedBufferValue2 = uintBitsToFloat(uvec4(imageLoad(bufferIncidentLight, int(productValue3)).x, imageLoad(bufferIncidentLight, int(productValue3 + 1u)).x, imageLoad(bufferIncidentLight, int(productValue3 + 2u)).x, imageLoad(bufferIncidentLight, int(productValue3 + 3u)).x));
            float scalarValue1 = loadedBufferValue2.w;
            productValue = (loadedBufferValue2.x * scalarValue1) + intermediateValue2;
            productValue1 = (loadedBufferValue2.y * scalarValue1) + intermediateValue3;
            productValue2 = (loadedBufferValue2.z * scalarValue1) + intermediateValue4;
            sumValue2 = scalarValue1 + intermediateValue1;
            uint sumValue3 = intermediateValue5 + 1u;
            if (sumValue3 == 256u)
            {
                break;
            }
            else
            {
                intermediateValue1 = sumValue2;
                intermediateValue2 = productValue;
                intermediateValue3 = productValue1;
                intermediateValue4 = productValue2;
                intermediateValue5 = sumValue3;
            }
        }
        float scalarValue2 = loadedBufferValue1.y;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        uint intermediateValue11;
        if (!(sumValue2 >= 16.0))
        {
            intermediateValue8 = LightMeterDataCB.packedValues[1u].w;
            intermediateValue9 = LightMeterDataCB.packedValues[1u].w;
            intermediateValue10 = LightMeterDataCB.packedValues[1u].w;
            intermediateValue11 = 0u;
        }
        else
        {
            float exponentialValue = spvNMax(spvNMax(exp2(log2(productValue / sumValue2) * 3.0) / loadedBufferValue, exp2(log2(productValue1 / sumValue2) * 3.0) / loadedBufferValue), exp2(log2(productValue2 / sumValue2) * 3.0) / loadedBufferValue);
            float nonlinearValue = log2(((floatBitsToUint(exponentialValue) & 2147483647u) > 2139095040u) ? 750000.0 : (0.75 / (exponentialValue + 9.9999999747524270787835121154785e-07)));
            intermediateValue8 = spvNMin(spvNMax(nonlinearValue + 0.300000011920928955078125, LightMeterDataCB.packedValues[0u].z + (-4.0)), LightMeterDataCB.packedValues[0u].y + 4.0) + LightMeterDataCB.packedValues[1u].w;
            intermediateValue9 = spvNMin(spvNMax(nonlinearValue, LightMeterDataCB.packedValues[0u].z), LightMeterDataCB.packedValues[0u].y) + LightMeterDataCB.packedValues[1u].w;
            intermediateValue10 = nonlinearValue + LightMeterDataCB.packedValues[1u].w;
            intermediateValue11 = 1u;
        }
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        float comparisonValue1;
        float comparisonValue2;
        float comparisonValue3;
        if ((loadedBufferValue != 0.0) && (floatBitsToUint(LightMeterDataCB.packedValues[0u]).w == 0u))
        {
            bool comparisonValue = intermediateValue11 != 0u;
            intermediateValue12 = loadedBufferValue1.z;
            intermediateValue13 = scalarValue;
            intermediateValue14 = scalarValue2;
            comparisonValue1 = comparisonValue ? intermediateValue8 : scalarValue;
            comparisonValue2 = comparisonValue ? intermediateValue9 : scalarValue2;
            comparisonValue3 = comparisonValue ? intermediateValue10 : scalarValue;
        }
        else
        {
            intermediateValue12 = intermediateValue10;
            intermediateValue13 = intermediateValue8;
            intermediateValue14 = intermediateValue8;
            comparisonValue1 = intermediateValue8;
            comparisonValue2 = intermediateValue9;
            comparisonValue3 = intermediateValue10;
        }
        float productValue4 = (LightMeterDataCB.packedValues[0u].x * (comparisonValue1 - intermediateValue13)) + intermediateValue13;
        float productValue5 = (LightMeterDataCB.packedValues[0u].x * (comparisonValue2 - intermediateValue14)) + intermediateValue14;
        float exponentialValue1 = exp2(productValue4);
        float exponentialValue2 = exp2(productValue5);
        float exponentialValue3 = exp2(intermediateValue13);
        float exponentialValue4 = exp2(intermediateValue14);
        imageStore(bufferIncidentLight, int(0u), uvec4(floatBitsToUint(exponentialValue1)));
        uint sumValue4 = 0u + 1u;
        imageStore(bufferIncidentLight, int(sumValue4), uvec4(floatBitsToUint(exponentialValue2)));
        uint sumValue5 = 0u + 2u;
        imageStore(bufferIncidentLight, int(sumValue5), uvec4(floatBitsToUint(exponentialValue3)));
        uint sumValue6 = 0u + 3u;
        imageStore(bufferIncidentLight, int(sumValue6), uvec4(floatBitsToUint(exponentialValue4)));
        imageStore(bufferIncidentLight, int(4u), uvec4(floatBitsToUint(exponentialValue1 / exponentialValue3)));
        imageStore(bufferIncidentLight, int(5u), uvec4(floatBitsToUint(exponentialValue2 / exponentialValue4)));
        imageStore(bufferIncidentLight, int(8u), uvec4(floatBitsToUint(productValue4)));
        imageStore(bufferIncidentLight, int(9u), uvec4(floatBitsToUint(productValue5)));
        imageStore(bufferIncidentLight, int(10u), uvec4(floatBitsToUint((LightMeterDataCB.packedValues[0u].x * (comparisonValue3 - intermediateValue12)) + intermediateValue12)));
    }
}
