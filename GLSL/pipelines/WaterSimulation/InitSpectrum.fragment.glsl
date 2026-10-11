#version 460
#extension GL_GOOGLE_include_directive : require
// WaterSimulation / InitSpectrum / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif

#include "../../include/materials/WaterSimulation/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec2 vectorValue = vec2(fragmentVectorConstants1.packedValues[5u].xy);
    float scalarValue = rdDot2Precise(vectorValue, vectorValue);
    precise float quotientValue10 = scalarValue / fragmentScalarConstants1.packedValues[8u];
    float nonlinearValue5 = sqrt(scalarValue);
    precise float productValue4 = quotientValue10 * quotientValue10;
    precise float sumValue = varyingTexCoord0.x - 0.5;
    precise float sumValue1 = varyingTexCoord0.y - 0.5;
    precise float productValue5 = sumValue * fragmentScalarConstants1.packedValues[16u];
    precise float productValue6 = sumValue1 * fragmentScalarConstants1.packedValues[16u];
    precise float productValue7 = productValue5 * 6.283185482025146484375;
    precise float productValue8 = productValue6 * 6.283185482025146484375;
    precise float quotientValue11 = productValue7 / fragmentScalarConstants1.packedValues[12u];
    precise float quotientValue12 = productValue8 / fragmentScalarConstants1.packedValues[12u];
    float scalarValue5 = -quotientValue11;
    float scalarValue6 = -quotientValue12;
    vec2 vectorValue3 = vec2(scalarValue5, scalarValue6);
    float scalarValue7 = rdDot2Precise(vectorValue3, vectorValue3);
    precise float productValue9 = productValue4 * scalarValue7;
    precise float quotientValue13 = (-1.0) / productValue9;
    precise float productValue10 = quotientValue13 * 1.44269502162933349609375;
    precise float exponentialValue4 = exp2(productValue10) * 9.9999997473787516355514526367188e-06;
    precise float productValue11 = scalarValue7 * scalarValue7;
    precise float quotientValue14 = exponentialValue4 / productValue11;
    float nonlinearValue8 = sqrt(scalarValue7);
    precise float productValue12 = (-scalarValue7) * fragmentScalarConstants1.packedValues[0u];
    precise float productValue13 = productValue12 * 1.44269502162933349609375;
    precise float quotientValue15 = scalarValue5 / nonlinearValue8;
    precise float quotientValue16 = scalarValue6 / nonlinearValue8;
    precise float quotientValue17 = fragmentVectorConstants1.packedValues[5u].x / nonlinearValue5;
    precise float quotientValue18 = fragmentVectorConstants1.packedValues[5u].y / nonlinearValue5;
    bool comparisonValue1 = nonlinearValue5 != 0.0;
    vec2 vectorValue4 = vec2(quotientValue17, quotientValue18);
    float scalarValue8 = rdDot2Precise(vectorValue4, vec2(quotientValue15, quotientValue16));
    precise float productValue14 = scalarValue8 * scalarValue8;
    precise float productValue15 = quotientValue14 * productValue14;
    precise float exponentialValue5 = exp2(productValue13) * productValue15;
    precise float comparisonValue2 = ((scalarValue8 < 0.0) ? fragmentScalarConstants1.packedValues[4u] : 1.0) * exponentialValue5;
    precise float comparisonValue3 = (((nonlinearValue8 != 0.0) && comparisonValue1) ? comparisonValue2 : 0.0) * 0.5;
    float nonlinearValue9 = sqrt(comparisonValue3);
    precise float productValue16 = nonlinearValue9 * 1.0;
    precise float productValue17 = nonlinearValue9 * (-1.0);
    fragmentColor0.z = productValue16;
    fragmentColor0.w = productValue17;
    vec2 vectorValue5 = vec2(quotientValue11, quotientValue12);
    float scalarValue9 = rdDot2Precise(vectorValue5, vectorValue5);
    precise float productValue18 = productValue4 * scalarValue9;
    precise float quotientValue19 = (-1.0) / productValue18;
    precise float productValue19 = quotientValue19 * 1.44269502162933349609375;
    precise float exponentialValue6 = exp2(productValue19) * 9.9999997473787516355514526367188e-06;
    precise float productValue20 = scalarValue9 * scalarValue9;
    precise float quotientValue20 = exponentialValue6 / productValue20;
    float nonlinearValue10 = sqrt(scalarValue9);
    precise float productValue21 = (-scalarValue9) * fragmentScalarConstants1.packedValues[0u];
    precise float productValue22 = productValue21 * 1.44269502162933349609375;
    precise float quotientValue21 = quotientValue11 / nonlinearValue10;
    precise float quotientValue22 = quotientValue12 / nonlinearValue10;
    float scalarValue10 = rdDot2Precise(vectorValue4, vec2(quotientValue21, quotientValue22));
    precise float productValue23 = scalarValue10 * scalarValue10;
    precise float productValue24 = productValue23 * quotientValue20;
    precise float exponentialValue7 = exp2(productValue22) * productValue24;
    precise float comparisonValue4 = ((scalarValue10 < 0.0) ? fragmentScalarConstants1.packedValues[4u] : 1.0) * exponentialValue7;
    precise float comparisonValue5 = ((comparisonValue1 && (nonlinearValue10 != 0.0)) ? comparisonValue4 : 0.0) * 0.5;
    float nonlinearValue11 = sqrt(comparisonValue5);
    fragmentColor0.x = nonlinearValue11;
    fragmentColor0.y = nonlinearValue11;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec2 vectorValue = vec2(fragmentVectorConstants1.packedValues[5u].xy);
    float scalarValue = rdDot2Precise(vectorValue, vectorValue);
    float quotientValue4 = scalarValue / fragmentScalarConstants1.packedValues[8u];
    float nonlinearValue5 = sqrt(scalarValue);
    float productValue3 = quotientValue4 * quotientValue4;
    float quotientValue5 = (((varyingTexCoord0.x - 0.5) * fragmentScalarConstants1.packedValues[16u]) * 6.283185482025146484375) / fragmentScalarConstants1.packedValues[12u];
    float quotientValue6 = (((varyingTexCoord0.y - 0.5) * fragmentScalarConstants1.packedValues[16u]) * 6.283185482025146484375) / fragmentScalarConstants1.packedValues[12u];
    float scalarValue1 = -quotientValue5;
    float scalarValue2 = -quotientValue6;
    vec2 vectorValue1 = vec2(scalarValue1, scalarValue2);
    float scalarValue3 = rdDot2Precise(vectorValue1, vectorValue1);
    float nonlinearValue6 = sqrt(scalarValue3);
    bool comparisonValue1 = nonlinearValue5 != 0.0;
    vec2 quotientValue7 = vec2(fragmentVectorConstants1.packedValues[5u].x / nonlinearValue5, fragmentVectorConstants1.packedValues[5u].y / nonlinearValue5);
    float quotientValue8 = rdDot2Precise(quotientValue7, vec2(scalarValue1 / nonlinearValue6, scalarValue2 / nonlinearValue6));
    float exponentialValue2 = sqrt(((nonlinearValue6 != 0.0) && comparisonValue1) ? ((((quotientValue8 < 0.0) ? fragmentScalarConstants1.packedValues[4u] : 1.0) * (exp2(((-scalarValue3) * fragmentScalarConstants1.packedValues[0u]) * 1.44269502162933349609375) * (((exp2((-(1.0 / (productValue3 * scalarValue3))) * 1.44269502162933349609375) * 9.9999997473787516355514526367188e-06) / (scalarValue3 * scalarValue3)) * (quotientValue8 * quotientValue8)))) * 0.5) : 0.0);
    fragmentColor0.z = exponentialValue2;
    fragmentColor0.w = -exponentialValue2;
    vec2 vectorValue2 = vec2(quotientValue5, quotientValue6);
    float scalarValue4 = rdDot2Precise(vectorValue2, vectorValue2);
    float nonlinearValue7 = sqrt(scalarValue4);
    float quotientValue9 = rdDot2Precise(quotientValue7, vec2(quotientValue5 / nonlinearValue7, quotientValue6 / nonlinearValue7));
    float exponentialValue3 = sqrt((comparisonValue1 && (nonlinearValue7 != 0.0)) ? ((((quotientValue9 < 0.0) ? fragmentScalarConstants1.packedValues[4u] : 1.0) * (exp2(((-scalarValue4) * fragmentScalarConstants1.packedValues[0u]) * 1.44269502162933349609375) * ((quotientValue9 * quotientValue9) * ((exp2((-(1.0 / (productValue3 * scalarValue4))) * 1.44269502162933349609375) * 9.9999997473787516355514526367188e-06) / (scalarValue4 * scalarValue4))))) * 0.5) : 0.0);
    fragmentColor0.x = exponentialValue3;
    fragmentColor0.y = exponentialValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = fragmentVectorConstants1.packedValues[4u].x * 6.283185482025146484375;
    float quotientValue = (productValue * (varyingTexCoord0.x + (-0.5))) / fragmentVectorConstants1.packedValues[3u].x;
    float quotientValue1 = (productValue * (varyingTexCoord0.y + (-0.5))) / fragmentVectorConstants1.packedValues[3u].x;
    float nonlinearValue = sqrt((quotientValue1 * quotientValue1) + (quotientValue * quotientValue));
    bool comparisonValue = nonlinearValue == 0.0;
    float intermediateValue;
    if (comparisonValue)
    {
        intermediateValue = 0.0;
    }
    else
    {
        float productValue1 = nonlinearValue * nonlinearValue;
        float nonlinearValue1 = sqrt((fragmentVectorConstants1.packedValues[5u].x * fragmentVectorConstants1.packedValues[5u].x) + (fragmentVectorConstants1.packedValues[5u].y * fragmentVectorConstants1.packedValues[5u].y));
        float branchMergedValue;
        if (nonlinearValue1 == 0.0)
        {
            branchMergedValue = 0.0;
        }
        else
        {
            float quotientValue2 = (nonlinearValue1 * nonlinearValue1) / fragmentVectorConstants1.packedValues[2u].x;
            float dotProductValue = dot(vec2(fragmentVectorConstants1.packedValues[5u].x / nonlinearValue1, fragmentVectorConstants1.packedValues[5u].y / nonlinearValue1), vec2(quotientValue / nonlinearValue, quotientValue1 / nonlinearValue));
            precise float exponentialValue = (((dotProductValue < 0.0) ? fragmentVectorConstants1.packedValues[1u].x : 1.0) * (((dotProductValue * dotProductValue) * ((exp2((-1.44269502162933349609375) / ((quotientValue2 * quotientValue2) * productValue1)) * 9.9999997473787516355514526367188e-06) / (productValue1 * productValue1))) * exp2((fragmentVectorConstants1.packedValues[0u].x * (-1.44269502162933349609375)) * productValue1))) * 0.5;
            branchMergedValue = exponentialValue;
        }
        intermediateValue = branchMergedValue;
    }
    float nonlinearValue2 = sqrt(intermediateValue);
    float intermediateValue1;
    if (comparisonValue)
    {
        intermediateValue1 = 0.0;
    }
    else
    {
        float productValue2 = nonlinearValue * nonlinearValue;
        float nonlinearValue3 = sqrt((fragmentVectorConstants1.packedValues[5u].x * fragmentVectorConstants1.packedValues[5u].x) + (fragmentVectorConstants1.packedValues[5u].y * fragmentVectorConstants1.packedValues[5u].y));
        float branchMergedValue1;
        if (nonlinearValue3 == 0.0)
        {
            branchMergedValue1 = 0.0;
        }
        else
        {
            float quotientValue3 = (nonlinearValue3 * nonlinearValue3) / fragmentVectorConstants1.packedValues[2u].x;
            float dotProductValue1 = dot(vec2(fragmentVectorConstants1.packedValues[5u].x / nonlinearValue3, fragmentVectorConstants1.packedValues[5u].y / nonlinearValue3), vec2(((-0.0) - quotientValue) / nonlinearValue, ((-0.0) - quotientValue1) / nonlinearValue));
            precise float exponentialValue1 = (((dotProductValue1 < 0.0) ? fragmentVectorConstants1.packedValues[1u].x : 1.0) * (((dotProductValue1 * dotProductValue1) * ((exp2((-1.44269502162933349609375) / ((quotientValue3 * quotientValue3) * productValue2)) * 9.9999997473787516355514526367188e-06) / (productValue2 * productValue2))) * exp2((fragmentVectorConstants1.packedValues[0u].x * (-1.44269502162933349609375)) * productValue2))) * 0.5;
            branchMergedValue1 = exponentialValue1;
        }
        intermediateValue1 = branchMergedValue1;
    }
    float nonlinearValue4 = sqrt(intermediateValue1);
    fragmentColor0.x = nonlinearValue2;
    fragmentColor0.y = nonlinearValue2;
    fragmentColor0.z = nonlinearValue4;
    fragmentColor0.w = (-0.0) - nonlinearValue4;
#endif
}
