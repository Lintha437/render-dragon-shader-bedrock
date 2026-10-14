#version 460
#extension GL_GOOGLE_include_directive : require
// WaterSimulation / UpdateSpectrum / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
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
    precise float sumValue1 = varyingTexCoord0.x - 0.5;
    precise float sumValue2 = varyingTexCoord0.y - 0.5;
    precise float productValue2 = sumValue1 * fragmentScalarConstants1.packedValues[12u];
    precise float productValue3 = sumValue2 * fragmentScalarConstants1.packedValues[12u];
    precise float productValue4 = productValue2 * 6.283185482025146484375;
    precise float productValue5 = productValue3 * 6.283185482025146484375;
    precise float quotientValue3 = productValue4 / fragmentScalarConstants1.packedValues[8u];
    precise float quotientValue4 = productValue5 / fragmentScalarConstants1.packedValues[8u];
    vec2 vectorValue = vec2(quotientValue3, quotientValue4);
    precise float nonlinearValue1 = sqrt(rdDot2Precise(vectorValue, vectorValue)) * fragmentScalarConstants1.packedValues[4u];
    precise float wavePhaseValue4 = sin(rdDot2Precise(vectorValue, vec2(25.9796009063720703125, 156.46600341796875))) * 43758.546875;
    precise float nonlinearValue2 = fract(wavePhaseValue4) * sqrt(nonlinearValue1);
    precise float productValue6 = nonlinearValue2 * fragmentScalarConstants1.packedValues[0u];
    precise float productValue7 = productValue6 * 0.15915493667125701904296875;
    float multiplyAddValue1 = fma(-floor(productValue7), 6.283185482025146484375, productValue6);
    float wavePhaseValue5 = sin(multiplyAddValue1);
    float wavePhaseValue6 = cos(multiplyAddValue1);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    precise float productValue8 = wavePhaseValue5 * scalarValue5;
    float scalarValue9 = -wavePhaseValue5;
    precise float productValue9 = scalarValue9 * scalarValue7;
    precise float multiplyAddValue2 = fma(scalarValue6, wavePhaseValue6, -productValue9) + fma(scalarValue4, wavePhaseValue6, -productValue8);
    fragmentColor0.x = multiplyAddValue2;
    precise float productValue10 = wavePhaseValue6 * scalarValue5;
    precise float productValue11 = wavePhaseValue6 * scalarValue7;
    precise float multiplyAddValue3 = fma(scalarValue6, scalarValue9, productValue11) + fma(scalarValue4, wavePhaseValue5, productValue10);
    fragmentColor0.y = multiplyAddValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec2 quotientValue2 = vec2((((varyingTexCoord0.x - 0.5) * fragmentScalarConstants1.packedValues[12u]) * 6.283185482025146484375) / fragmentScalarConstants1.packedValues[8u], (((varyingTexCoord0.y - 0.5) * fragmentScalarConstants1.packedValues[12u]) * 6.283185482025146484375) / fragmentScalarConstants1.packedValues[8u]);
    float nonlinearValue = (fract(sin(rdDot2Precise(quotientValue2, vec2(25.9796009063720703125, 156.46600341796875))) * 43758.546875) * sqrt(sqrt(rdDot2Precise(quotientValue2, quotientValue2)) * fragmentScalarConstants1.packedValues[4u])) * fragmentScalarConstants1.packedValues[0u];
    float multiplyAddValue = fma(-floor(nonlinearValue * 0.15915493667125701904296875), 6.283185482025146484375, nonlinearValue);
    float wavePhaseValue2 = sin(multiplyAddValue);
    float wavePhaseValue3 = cos(multiplyAddValue);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    float scalarValue8 = -wavePhaseValue2;
    fragmentColor0.x = fma(scalarValue6, wavePhaseValue3, -(scalarValue8 * scalarValue7)) + fma(scalarValue4, wavePhaseValue3, -(wavePhaseValue2 * scalarValue5));
    fragmentColor0.y = fma(scalarValue6, scalarValue8, wavePhaseValue3 * scalarValue7) + fma(scalarValue4, wavePhaseValue2, wavePhaseValue3 * scalarValue5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(simTextureTexture, simTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = fragmentVectorConstants1.packedValues[3u].x * 6.283185482025146484375;
    float quotientValue = (productValue * (varyingTexCoord0.x + (-0.5))) / fragmentVectorConstants1.packedValues[2u].x;
    float quotientValue1 = (productValue * (varyingTexCoord0.y + (-0.5))) / fragmentVectorConstants1.packedValues[2u].x;
    float dotProductValue = (sqrt(fragmentVectorConstants1.packedValues[1u].x * sqrt((quotientValue1 * quotientValue1) + (quotientValue * quotientValue))) * fract(sin(dot(vec2(quotientValue, quotientValue1), vec2(25.9796009063720703125, 156.46600341796875))) * 43758.546875)) * fragmentVectorConstants1.packedValues[0u].x;
    float productValue1 = dotProductValue - (floor(dotProductValue * 0.15915493667125701904296875) * 6.283185482025146484375);
    float wavePhaseValue = sin(productValue1);
    float wavePhaseValue1 = cos(productValue1);
    float sumValue = (-0.0) - wavePhaseValue;
    fragmentColor0.x = (((-0.0) - (scalarValue3 * sumValue)) - (scalarValue1 * wavePhaseValue)) + (wavePhaseValue1 * (scalarValue2 + scalarValue));
    fragmentColor0.y = ((scalarValue2 * sumValue) + (wavePhaseValue * scalarValue)) + (wavePhaseValue1 * (scalarValue3 + scalarValue1));
#endif
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
}
