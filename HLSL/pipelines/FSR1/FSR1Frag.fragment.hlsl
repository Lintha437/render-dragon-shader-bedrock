// FSR1 / FSR1Frag / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_FFXPRECISION
#define RD_OPTION_FFXPRECISION RD_FFXPRECISION_HALF
#endif
#ifndef RD_OPTION_FSRFILTER_MODE
#define RD_OPTION_FSRFILTER_MODE RD_FSRFILTER_MODE_EASU
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/FSR1/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.zw * varyingTexCoord0.xy;
  workingVector0.xy = (int2)workingVector0.xy;
  workingVector0.x = (int)-workingVector0.y + (int)workingVector0.x;
  workingVector0.x = (int)workingVector0.x;
  workingVector0.y = 0.0625 * workingVector0.x;
  workingVector0.y = floor(workingVector0.y);
  workingVector0.x = -workingVector0.y * 16 + workingVector0.x;
  workingVector0.x = RD_COMPARISON_MASK(0.93749994 >= workingVector0.x);
  fragmentColor0.xyz = workingVector0.xxx ? float3(0.957000017,0.275000006,0.0670000017) : 0;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM60
    float productValue2 = float(int(uint(int(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.z * varyingTexCoord0.x)) - uint(int(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.w * varyingTexCoord0.y))));
    float comparisonValue = (((productValue2 - (floor(productValue2 * 0.0625f) * 16.0f)) * 0.066666670143604278564453125f) > 0.0625f) ? 0.0f : 1.0f;
    fragmentColor0.x = comparisonValue * 0.9570000171661376953125f;
    fragmentColor0.y = comparisonValue * 0.2750000059604644775390625f;
    fragmentColor0.z = comparisonValue * 0.0670000016689300537109375f;
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_HALF && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_EASU && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue3 = (RD_UNIFORM_FSR_CONST0.x * float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.z * varyingTexCoord0.x))) + RD_UNIFORM_FSR_CONST0.z;
    float productValue16 = (RD_UNIFORM_FSR_CONST0.y * float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.w * varyingTexCoord0.y))) + RD_UNIFORM_FSR_CONST0.w;
    float productValue17 = (productValue3 + 0.5f) * RD_UNIFORM_FSR_CONST1.x;
    float productValue94 = (productValue16 + 0.5f) * RD_UNIFORM_FSR_CONST1.y;
    float4 sampledTextureValue = inputTexTexture.SampleLevel(inputTexSampler, float2(productValue17, productValue94 - RD_UNIFORM_FSR_CONST1.y), 0.0f);
    float4 sampledTextureValue1 = inputTexTexture.SampleLevel(inputTexSampler, float2(productValue17 - RD_UNIFORM_FSR_CONST1.x, productValue94), 0.0f);
    float4 sampledTextureValue2 = inputTexTexture.SampleLevel(inputTexSampler, float2(productValue17, productValue94), 0.0f);
    min16float intermediateValue = min16float(sampledTextureValue2.x);
    min16float intermediateValue1 = min16float(sampledTextureValue2.y);
    float4 sampledTextureValue3 = inputTexTexture.SampleLevel(inputTexSampler, float2(productValue17 + RD_UNIFORM_FSR_CONST1.x, productValue94), 0.0f);
    float4 sampledTextureValue4 = inputTexTexture.SampleLevel(inputTexSampler, float2(productValue17, productValue94 + RD_UNIFORM_FSR_CONST1.y), 0.0f);
    min16float productValue4 = (min16float(sampledTextureValue.x) * min16float(0.5)) + min16float(sampledTextureValue.y);
    min16float productValue5 = (min16float(sampledTextureValue1.x) * min16float(0.5)) + min16float(sampledTextureValue1.y);
    min16float productValue6 = (intermediateValue * min16float(0.5)) + intermediateValue1;
    min16float productValue7 = (min16float(sampledTextureValue3.x) * min16float(0.5)) + min16float(sampledTextureValue3.y);
    min16float productValue8 = (min16float(sampledTextureValue4.x) * min16float(0.5)) + min16float(sampledTextureValue4.y);
    min16float sumValue = productValue7 - productValue5;
    min16float clampedValue = clamp(abs(sumValue) * (min16float(1.0) / max(abs(productValue7 - productValue6), abs(productValue6 - productValue5))), min16float(0.0), min16float(1.0));
    min16float sumValue1 = productValue8 - productValue4;
    min16float clampedValue1 = clamp(abs(sumValue1) * (min16float(1.0) / max(abs(productValue8 - productValue6), abs(productValue6 - productValue4))), min16float(0.0), min16float(1.0));
    min16float productValue9 = (sumValue1 * sumValue1) + (sumValue * sumValue);
    min16float intermediateValue2;
    min16float intermediateValue3;
    min16float intermediateValue4;
    if (productValue9 < min16float(0.015625))
    {
        intermediateValue2 = intermediateValue;
        intermediateValue3 = intermediateValue1;
        intermediateValue4 = min16float(sampledTextureValue2.z);
    }
    else
    {
        min16float inverseLengthValue = rsqrt(productValue9);
        min16float productValue10 = inverseLengthValue * sumValue;
        min16float productValue11 = inverseLengthValue * sumValue1;
        min16float productValue12 = ((clampedValue1 * clampedValue1) + (clampedValue * clampedValue)) * min16float(0.5);
        min16float productValue13 = productValue12 * productValue12;
        min16float quotientValue = ((((min16float(1.0) / max(abs(productValue10), abs(productValue11))) * ((productValue10 * productValue10) + (productValue11 * productValue11))) + min16float(-1.0)) * productValue13) + min16float(1.0);
        min16float productValue14 = min16float(1.0) - (productValue13 * min16float(0.5));
        min16float productValue15 = min16float(0.5) - (productValue13 * min16float(0.2900390625));
        min16float quotientValue1 = min16float(1.0) / productValue15;
        float scalarValue = floor(productValue3);
        float scalarValue1 = floor(productValue16);
        min16float sumValue2 = min16float(productValue3 - scalarValue);
        min16float sumValue3 = min16float(productValue16 - scalarValue1);
        float productValue95 = scalarValue1 * RD_UNIFORM_FSR_CONST1.y;
        float productValue96 = (scalarValue * RD_UNIFORM_FSR_CONST1.x) + RD_UNIFORM_FSR_CONST1.z;
        float sumValue4 = productValue95 + RD_UNIFORM_FSR_CONST1.w;
        float sumValue5 = productValue96 + RD_UNIFORM_FSR_CONST2.x;
        float sumValue6 = sumValue4 + RD_UNIFORM_FSR_CONST2.y;
        float sumValue7 = productValue96 + RD_UNIFORM_FSR_CONST2.z;
        float sumValue8 = sumValue4 + RD_UNIFORM_FSR_CONST2.w;
        float sumValue9 = productValue96 + RD_UNIFORM_FSR_CONST3.x;
        float sumValue10 = (RD_UNIFORM_FSR_CONST1.w + RD_UNIFORM_FSR_CONST3.y) + sumValue4;
        float4 vectorValue = inputTexTexture.GatherRed(inputTexSampler, float2(productValue96, productValue95));
        float4 vectorValue1 = inputTexTexture.GatherGreen(inputTexSampler, float2(productValue96, productValue95));
        float4 vectorValue2 = inputTexTexture.GatherBlue(inputTexSampler, float2(productValue96, productValue95));
        float4 vectorValue3 = inputTexTexture.GatherRed(inputTexSampler, float2(sumValue5, sumValue6));
        float4 vectorValue4 = inputTexTexture.GatherGreen(inputTexSampler, float2(sumValue5, sumValue6));
        float4 vectorValue5 = inputTexTexture.GatherBlue(inputTexSampler, float2(sumValue5, sumValue6));
        float4 vectorValue6 = inputTexTexture.GatherRed(inputTexSampler, float2(sumValue7, sumValue8));
        float4 vectorValue7 = inputTexTexture.GatherGreen(inputTexSampler, float2(sumValue7, sumValue8));
        float4 vectorValue8 = inputTexTexture.GatherBlue(inputTexSampler, float2(sumValue7, sumValue8));
        float4 vectorValue9 = inputTexTexture.GatherRed(inputTexSampler, float2(sumValue9, sumValue10));
        float4 vectorValue10 = inputTexTexture.GatherGreen(inputTexSampler, float2(sumValue9, sumValue10));
        float4 vectorValue11 = inputTexTexture.GatherBlue(inputTexSampler, float2(sumValue9, sumValue10));
        min16float sumValue11 = min16float(-1.0) - sumValue3;
        min16float sumValue12 = min16float(1.0) - sumValue2;
        min16float productValue18 = sumValue12 * productValue10;
        min16float productValue19 = sumValue2 * productValue10;
        min16float productValue20 = sumValue11 * productValue11;
        min16float productValue21 = sumValue12 * productValue11;
        min16float productValue22 = sumValue2 * productValue11;
        min16float productValue23 = sumValue11 * productValue10;
        min16float productValue24 = (productValue20 + productValue18) * quotientValue;
        min16float productValue25 = (productValue20 - productValue19) * quotientValue;
        min16float productValue26 = (productValue23 - productValue21) * productValue14;
        min16float productValue27 = (productValue23 + productValue22) * productValue14;
        min16float productValue28 = min((productValue24 * productValue24) + (productValue26 * productValue26), quotientValue1);
        min16float productValue29 = min((productValue25 * productValue25) + (productValue27 * productValue27), quotientValue1);
        min16float productValue30 = (productValue28 * productValue15) + min16float(-1.0);
        min16float productValue31 = (productValue29 * productValue15) + min16float(-1.0);
        min16float productValue32 = (productValue30 * productValue30) * ((((productValue28 * min16float(0.625)) + min16float(-1.5625)) * ((productValue28 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float productValue33 = (productValue31 * productValue31) * ((((productValue29 * min16float(0.625)) + min16float(-1.5625)) * ((productValue29 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float sumValue13 = min16float(1.0) - sumValue3;
        min16float sumValue14 = min16float(-1.0) - sumValue2;
        min16float productValue34 = sumValue14 * productValue10;
        min16float productValue35 = sumValue13 * productValue11;
        min16float productValue36 = sumValue14 * productValue11;
        min16float productValue37 = sumValue13 * productValue10;
        min16float productValue38 = (productValue35 + productValue34) * quotientValue;
        min16float productValue39 = (productValue35 - productValue19) * quotientValue;
        min16float productValue40 = (productValue37 - productValue36) * productValue14;
        min16float productValue41 = (productValue37 + productValue22) * productValue14;
        min16float productValue42 = min((productValue38 * productValue38) + (productValue40 * productValue40), quotientValue1);
        min16float productValue43 = min((productValue39 * productValue39) + (productValue41 * productValue41), quotientValue1);
        min16float productValue44 = (productValue42 * productValue15) + min16float(-1.0);
        min16float productValue45 = (productValue43 * productValue15) + min16float(-1.0);
        min16float productValue46 = (productValue44 * productValue44) * ((((productValue42 * min16float(0.625)) + min16float(-1.5625)) * ((productValue42 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float productValue47 = (productValue45 * productValue45) * ((((productValue43 * min16float(0.625)) + min16float(-1.5625)) * ((productValue43 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float sumValue15 = min16float(-0.0) - sumValue3;
        min16float productValue48 = productValue11 * sumValue15;
        min16float productValue49 = productValue10 * sumValue15;
        min16float productValue50 = (productValue48 - productValue19) * quotientValue;
        min16float productValue51 = (productValue34 + productValue48) * quotientValue;
        min16float productValue52 = (productValue49 + productValue22) * productValue14;
        min16float productValue53 = (productValue49 - productValue36) * productValue14;
        min16float productValue54 = min((productValue50 * productValue50) + (productValue52 * productValue52), quotientValue1);
        min16float productValue55 = min((productValue51 * productValue51) + (productValue53 * productValue53), quotientValue1);
        min16float productValue56 = (productValue54 * productValue15) + min16float(-1.0);
        min16float productValue57 = (productValue55 * productValue15) + min16float(-1.0);
        min16float productValue58 = (productValue56 * productValue56) * ((((productValue54 * min16float(0.625)) + min16float(-1.5625)) * ((productValue54 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float productValue59 = (productValue57 * productValue57) * ((((productValue55 * min16float(0.625)) + min16float(-1.5625)) * ((productValue55 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float sumValue16 = min16float(2.0) - sumValue2;
        min16float productValue60 = sumValue16 * productValue10;
        min16float productValue61 = sumValue16 * productValue11;
        min16float productValue62 = (productValue35 + productValue18) * quotientValue;
        min16float productValue63 = (productValue35 + productValue60) * quotientValue;
        min16float productValue64 = (productValue37 - productValue21) * productValue14;
        min16float productValue65 = (productValue37 - productValue61) * productValue14;
        min16float productValue66 = min((productValue62 * productValue62) + (productValue64 * productValue64), quotientValue1);
        min16float productValue67 = min((productValue63 * productValue63) + (productValue65 * productValue65), quotientValue1);
        min16float productValue68 = (productValue66 * productValue15) + min16float(-1.0);
        min16float productValue69 = (productValue67 * productValue15) + min16float(-1.0);
        min16float productValue70 = (productValue68 * productValue68) * ((((productValue66 * min16float(0.625)) + min16float(-1.5625)) * ((productValue66 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float productValue71 = (productValue69 * productValue69) * ((((productValue67 * min16float(0.625)) + min16float(-1.5625)) * ((productValue67 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float productValue72 = (productValue60 + productValue48) * quotientValue;
        min16float productValue73 = (productValue18 + productValue48) * quotientValue;
        min16float productValue74 = (productValue49 - productValue61) * productValue14;
        min16float productValue75 = (productValue49 - productValue21) * productValue14;
        min16float productValue76 = min((productValue72 * productValue72) + (productValue74 * productValue74), quotientValue1);
        min16float productValue77 = min((productValue73 * productValue73) + (productValue75 * productValue75), quotientValue1);
        min16float productValue78 = (productValue76 * productValue15) + min16float(-1.0);
        min16float productValue79 = (productValue77 * productValue15) + min16float(-1.0);
        min16float productValue80 = (productValue78 * productValue78) * ((((productValue76 * min16float(0.625)) + min16float(-1.5625)) * ((productValue76 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float productValue81 = (productValue79 * productValue79) * ((((productValue77 * min16float(0.625)) + min16float(-1.5625)) * ((productValue77 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float sumValue17 = min16float(2.0) - sumValue3;
        min16float productValue82 = sumValue17 * productValue11;
        min16float productValue83 = sumValue17 * productValue10;
        min16float productValue84 = (productValue82 - productValue19) * quotientValue;
        min16float productValue85 = (productValue82 + productValue18) * quotientValue;
        min16float productValue86 = (productValue83 + productValue22) * productValue14;
        min16float productValue87 = (productValue83 - productValue21) * productValue14;
        min16float productValue88 = min((productValue84 * productValue84) + (productValue86 * productValue86), quotientValue1);
        min16float productValue89 = min((productValue85 * productValue85) + (productValue87 * productValue87), quotientValue1);
        min16float productValue90 = (productValue88 * productValue15) + min16float(-1.0);
        min16float productValue91 = (productValue89 * productValue15) + min16float(-1.0);
        min16float productValue92 = (productValue90 * productValue90) * ((((productValue88 * min16float(0.625)) + min16float(-1.5625)) * ((productValue88 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float productValue93 = (productValue91 * productValue91) * ((((productValue89 * min16float(0.625)) + min16float(-1.5625)) * ((productValue89 * min16float(0.39990234375)) + min16float(-1.0))) + min16float(-0.5625));
        min16float quotientValue2 = min16float(1.0) / (((((((((((productValue33 + productValue32) + productValue46) + productValue47) + productValue58) + productValue59) + productValue70) + productValue71) + productValue80) + productValue81) + productValue92) + productValue93);
        intermediateValue2 = ((((((((((((productValue33 * min16float(vectorValue.w)) + (productValue32 * min16float(vectorValue.z))) + (productValue46 * min16float(vectorValue3.x))) + (productValue47 * min16float(vectorValue3.y))) + (productValue58 * min16float(vectorValue3.z))) + (productValue59 * min16float(vectorValue3.w))) + (productValue70 * min16float(vectorValue6.x))) + (productValue71 * min16float(vectorValue6.y))) + (productValue80 * min16float(vectorValue6.z))) + (productValue81 * min16float(vectorValue6.w))) + (productValue92 * min16float(vectorValue9.x))) + (productValue93 * min16float(vectorValue9.y))) * quotientValue2;
        intermediateValue3 = ((((((((((((productValue33 * min16float(vectorValue1.w)) + (productValue32 * min16float(vectorValue1.z))) + (productValue46 * min16float(vectorValue4.x))) + (productValue47 * min16float(vectorValue4.y))) + (productValue58 * min16float(vectorValue4.z))) + (productValue59 * min16float(vectorValue4.w))) + (productValue70 * min16float(vectorValue7.x))) + (productValue71 * min16float(vectorValue7.y))) + (productValue80 * min16float(vectorValue7.z))) + (productValue81 * min16float(vectorValue7.w))) + (productValue92 * min16float(vectorValue10.x))) + (productValue93 * min16float(vectorValue10.y))) * quotientValue2;
        intermediateValue4 = ((((((((((((productValue33 * min16float(vectorValue2.w)) + (productValue32 * min16float(vectorValue2.z))) + (productValue46 * min16float(vectorValue5.x))) + (productValue47 * min16float(vectorValue5.y))) + (productValue58 * min16float(vectorValue5.z))) + (productValue59 * min16float(vectorValue5.w))) + (productValue70 * min16float(vectorValue8.x))) + (productValue71 * min16float(vectorValue8.y))) + (productValue80 * min16float(vectorValue8.z))) + (productValue81 * min16float(vectorValue8.w))) + (productValue92 * min16float(vectorValue11.x))) + (productValue93 * min16float(vectorValue11.y))) * quotientValue2;
    }
    fragmentColor0.x = float(intermediateValue2);
    fragmentColor0.y = float(intermediateValue3);
    fragmentColor0.z = float(intermediateValue4);
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_HALF && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_RCAS)
    uint bitwiseValue = uint(float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.z * varyingTexCoord0.x))) << 16u;
    uint bitwiseValue1 = uint(int(bitwiseValue) >> int(16u));
    uint bitwiseValue2 = uint(float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.w * varyingTexCoord0.y))) << 16u;
    float4 loadedBufferValue = inputTexTexture.Load(int3(uint2(bitwiseValue1, uint(int(bitwiseValue2 + 4294901760u) >> int(16u))), 0u));
    min16float intermediateValue = min16float(loadedBufferValue.x);
    min16float intermediateValue1 = min16float(loadedBufferValue.y);
    min16float intermediateValue2 = min16float(loadedBufferValue.z);
    uint bitwiseValue3 = uint(int(bitwiseValue2) >> int(16u));
    float4 loadedBufferValue1 = inputTexTexture.Load(int3(uint2(uint(int(bitwiseValue + 4294901760u) >> int(16u)), bitwiseValue3), 0u));
    min16float intermediateValue3 = min16float(loadedBufferValue1.x);
    min16float intermediateValue4 = min16float(loadedBufferValue1.y);
    min16float intermediateValue5 = min16float(loadedBufferValue1.z);
    float4 loadedBufferValue2 = inputTexTexture.Load(int3(uint2(bitwiseValue1, bitwiseValue3), 0u));
    min16float intermediateValue6 = min16float(loadedBufferValue2.x);
    min16float intermediateValue7 = min16float(loadedBufferValue2.y);
    min16float intermediateValue8 = min16float(loadedBufferValue2.z);
    float4 loadedBufferValue3 = inputTexTexture.Load(int3(uint2(uint(int(bitwiseValue + 65536u) >> int(16u)), bitwiseValue3), 0u));
    min16float intermediateValue9 = min16float(loadedBufferValue3.x);
    min16float intermediateValue10 = min16float(loadedBufferValue3.y);
    min16float intermediateValue11 = min16float(loadedBufferValue3.z);
    float4 loadedBufferValue4 = inputTexTexture.Load(int3(uint2(bitwiseValue1, uint(int(bitwiseValue2 + 65536u) >> int(16u))), 0u));
    min16float intermediateValue12 = min16float(loadedBufferValue4.x);
    min16float intermediateValue13 = min16float(loadedBufferValue4.y);
    min16float intermediateValue14 = min16float(loadedBufferValue4.z);
    min16float intermediateValue15 = min(min(intermediateValue, min(intermediateValue3, intermediateValue9)), intermediateValue12);
    min16float intermediateValue16 = min(min(intermediateValue1, min(intermediateValue4, intermediateValue10)), intermediateValue13);
    min16float intermediateValue17 = min(min(intermediateValue2, min(intermediateValue5, intermediateValue11)), intermediateValue14);
    min16float intermediateValue18 = max(max(intermediateValue, max(intermediateValue3, intermediateValue9)), intermediateValue12);
    min16float intermediateValue19 = max(max(intermediateValue1, max(intermediateValue4, intermediateValue10)), intermediateValue13);
    min16float intermediateValue20 = max(max(intermediateValue2, max(intermediateValue5, intermediateValue11)), intermediateValue14);
    min16float quotientValue = max(min16float(-0.1875), min(max(max(min16float(-0.0) - (min(intermediateValue15, intermediateValue6) * (min16float(0.25) / intermediateValue18)), (min16float(1.0) - max(intermediateValue18, intermediateValue6)) * (min16float(1.0) / ((intermediateValue15 * min16float(4.0)) + min16float(-4.0)))), max(max(min16float(-0.0) - (min(intermediateValue16, intermediateValue7) * (min16float(0.25) / intermediateValue19)), (min16float(1.0) - max(intermediateValue19, intermediateValue7)) * (min16float(1.0) / ((intermediateValue16 * min16float(4.0)) + min16float(-4.0)))), max(min16float(-0.0) - (min(intermediateValue17, intermediateValue8) * (min16float(0.25) / intermediateValue20)), (min16float(1.0) - max(intermediateValue20, intermediateValue8)) * (min16float(1.0) / ((intermediateValue17 * min16float(4.0)) + min16float(-4.0)))))), min16float(0.0))) * min16float(RD_UNIFORM_FSR_CONST0.x);
    min16float productValue = (quotientValue * min16float(4.0)) + min16float(1.0);
    min16float sumValue = (min16float)f16tof32(30605u - (min16uint)f32tof16(productValue));
    min16float productValue1 = (min16float(2.0) - (sumValue * productValue)) * sumValue;
    fragmentColor0.x = float(productValue1 * ((quotientValue * (((intermediateValue3 + intermediateValue) + intermediateValue9) + intermediateValue12)) + intermediateValue6));
    fragmentColor0.y = float(productValue1 * ((quotientValue * (((intermediateValue4 + intermediateValue1) + intermediateValue10) + intermediateValue13)) + intermediateValue7));
    fragmentColor0.z = float(productValue1 * ((quotientValue * (((intermediateValue5 + intermediateValue2) + intermediateValue11) + intermediateValue14)) + intermediateValue8));
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_HALF && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_BILINEAR)
    float4 sampledTextureValue5 = inputTexTexture.SampleLevel(inputTexSampler, float2((((float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.z * varyingTexCoord0.x)) * RD_UNIFORM_FSR_CONST0.x) + RD_UNIFORM_FSR_CONST0.z) * RD_UNIFORM_FSR_CONST1.x) + (RD_UNIFORM_FSR_CONST1.z * 0.5f), (((float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.w * varyingTexCoord0.y)) * RD_UNIFORM_FSR_CONST0.y) + RD_UNIFORM_FSR_CONST0.w) * RD_UNIFORM_FSR_CONST1.y) - (RD_UNIFORM_FSR_CONST1.w * 0.5f)), 0.0f);
    fragmentColor0.x = float(min16float(sampledTextureValue5.x));
    fragmentColor0.y = float(min16float(sampledTextureValue5.y));
    fragmentColor0.z = float(min16float(sampledTextureValue5.z));
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_FULL && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_EASU)
    float productValue97 = (float(uint(float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.z * varyingTexCoord0.x)))) * RD_UNIFORM_FSR_CONST0.x) + RD_UNIFORM_FSR_CONST0.z;
    float productValue98 = (float(uint(float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.w * varyingTexCoord0.y)))) * RD_UNIFORM_FSR_CONST0.y) + RD_UNIFORM_FSR_CONST0.w;
    float scalarValue2 = floor(productValue97);
    float scalarValue3 = floor(productValue98);
    float sumValue18 = productValue97 - scalarValue2;
    float sumValue19 = productValue98 - scalarValue3;
    float productValue99 = (scalarValue2 * RD_UNIFORM_FSR_CONST1.x) + RD_UNIFORM_FSR_CONST1.z;
    float productValue100 = (scalarValue3 * RD_UNIFORM_FSR_CONST1.y) + RD_UNIFORM_FSR_CONST1.w;
    float sumValue20 = productValue99 + RD_UNIFORM_FSR_CONST2.x;
    float sumValue21 = productValue100 + RD_UNIFORM_FSR_CONST2.y;
    float sumValue22 = productValue99 + RD_UNIFORM_FSR_CONST2.z;
    float sumValue23 = productValue100 + RD_UNIFORM_FSR_CONST2.w;
    float sumValue24 = productValue99 + RD_UNIFORM_FSR_CONST3.x;
    float sumValue25 = productValue100 + RD_UNIFORM_FSR_CONST3.y;
    float4 vectorValue12 = inputTexTexture.GatherRed(inputTexSampler, float2(productValue99, productValue100));
    float scalarValue4 = vectorValue12.x;
    float scalarValue5 = vectorValue12.y;
    float4 vectorValue13 = inputTexTexture.GatherGreen(inputTexSampler, float2(productValue99, productValue100));
    float scalarValue6 = vectorValue13.x;
    float scalarValue7 = vectorValue13.y;
    float4 vectorValue14 = inputTexTexture.GatherBlue(inputTexSampler, float2(productValue99, productValue100));
    float scalarValue8 = vectorValue14.x;
    float scalarValue9 = vectorValue14.y;
    float4 vectorValue15 = inputTexTexture.GatherRed(inputTexSampler, float2(sumValue20, sumValue21));
    float scalarValue10 = vectorValue15.x;
    float scalarValue11 = vectorValue15.y;
    float scalarValue12 = vectorValue15.z;
    float scalarValue13 = vectorValue15.w;
    float4 vectorValue16 = inputTexTexture.GatherGreen(inputTexSampler, float2(sumValue20, sumValue21));
    float scalarValue14 = vectorValue16.x;
    float scalarValue15 = vectorValue16.y;
    float scalarValue16 = vectorValue16.z;
    float scalarValue17 = vectorValue16.w;
    float4 vectorValue17 = inputTexTexture.GatherBlue(inputTexSampler, float2(sumValue20, sumValue21));
    float scalarValue18 = vectorValue17.x;
    float scalarValue19 = vectorValue17.y;
    float scalarValue20 = vectorValue17.z;
    float scalarValue21 = vectorValue17.w;
    float4 vectorValue18 = inputTexTexture.GatherRed(inputTexSampler, float2(sumValue22, sumValue23));
    float scalarValue22 = vectorValue18.x;
    float scalarValue23 = vectorValue18.y;
    float scalarValue24 = vectorValue18.z;
    float scalarValue25 = vectorValue18.w;
    float4 vectorValue19 = inputTexTexture.GatherGreen(inputTexSampler, float2(sumValue22, sumValue23));
    float scalarValue26 = vectorValue19.x;
    float scalarValue27 = vectorValue19.y;
    float scalarValue28 = vectorValue19.z;
    float scalarValue29 = vectorValue19.w;
    float4 vectorValue20 = inputTexTexture.GatherBlue(inputTexSampler, float2(sumValue22, sumValue23));
    float scalarValue30 = vectorValue20.x;
    float scalarValue31 = vectorValue20.y;
    float scalarValue32 = vectorValue20.z;
    float scalarValue33 = vectorValue20.w;
    float4 vectorValue21 = inputTexTexture.GatherRed(inputTexSampler, float2(sumValue24, sumValue25));
    float scalarValue34 = vectorValue21.z;
    float scalarValue35 = vectorValue21.w;
    float4 vectorValue22 = inputTexTexture.GatherGreen(inputTexSampler, float2(sumValue24, sumValue25));
    float scalarValue36 = vectorValue22.z;
    float scalarValue37 = vectorValue22.w;
    float4 vectorValue23 = inputTexTexture.GatherBlue(inputTexSampler, float2(sumValue24, sumValue25));
    float scalarValue38 = vectorValue23.z;
    float scalarValue39 = vectorValue23.w;
    float productValue101 = ((scalarValue8 + scalarValue4) * 0.5f) + scalarValue6;
    float productValue102 = ((scalarValue9 + scalarValue5) * 0.5f) + scalarValue7;
    float productValue103 = ((scalarValue18 + scalarValue10) * 0.5f) + scalarValue14;
    float productValue104 = ((scalarValue19 + scalarValue11) * 0.5f) + scalarValue15;
    float productValue105 = ((scalarValue20 + scalarValue12) * 0.5f) + scalarValue16;
    float productValue106 = ((scalarValue21 + scalarValue13) * 0.5f) + scalarValue17;
    float productValue107 = ((scalarValue30 + scalarValue22) * 0.5f) + scalarValue26;
    float productValue108 = ((scalarValue31 + scalarValue23) * 0.5f) + scalarValue27;
    float productValue109 = ((scalarValue32 + scalarValue24) * 0.5f) + scalarValue28;
    float productValue110 = ((scalarValue33 + scalarValue25) * 0.5f) + scalarValue29;
    float productValue111 = ((scalarValue38 + scalarValue34) * 0.5f) + scalarValue36;
    float productValue112 = ((scalarValue39 + scalarValue35) * 0.5f) + scalarValue37;
    float sumValue26 = 1.0f - sumValue18;
    float sumValue27 = 1.0f - sumValue19;
    float productValue113 = sumValue26 * sumValue27;
    float sumValue28 = abs(productValue110 - productValue105);
    float sumValue29 = productValue110 - productValue106;
    float clampedValue2 = clamp(asfloat(2129690299u - asuint(max(sumValue28, abs(productValue105 - productValue106)))) * abs(sumValue29), 0.0f, 1.0f);
    float sumValue30 = abs(productValue104 - productValue105);
    float sumValue31 = productValue104 - productValue101;
    float clampedValue3 = clamp(asfloat(2129690299u - asuint(max(sumValue30, abs(productValue105 - productValue101)))) * abs(sumValue31), 0.0f, 1.0f);
    float productValue114 = sumValue27 * sumValue18;
    float sumValue32 = productValue109 - productValue105;
    float clampedValue4 = clamp(asfloat(2129690299u - asuint(max(abs(productValue109 - productValue110), sumValue28))) * abs(sumValue32), 0.0f, 1.0f);
    float sumValue33 = abs(productValue107 - productValue110);
    float sumValue34 = productValue107 - productValue102;
    float clampedValue5 = clamp(asfloat(2129690299u - asuint(max(sumValue33, abs(productValue110 - productValue102)))) * abs(sumValue34), 0.0f, 1.0f);
    float productValue115 = sumValue26 * sumValue19;
    float sumValue35 = abs(productValue107 - productValue104);
    float sumValue36 = productValue107 - productValue103;
    float clampedValue6 = clamp(asfloat(2129690299u - asuint(max(sumValue35, abs(productValue104 - productValue103)))) * abs(sumValue36), 0.0f, 1.0f);
    float sumValue37 = productValue112 - productValue105;
    float clampedValue7 = clamp(asfloat(2129690299u - asuint(max(abs(productValue112 - productValue104), sumValue30))) * abs(sumValue37), 0.0f, 1.0f);
    float productValue116 = sumValue18 * sumValue19;
    float sumValue38 = productValue108 - productValue104;
    float productValue117 = (((sumValue29 * productValue113) + (sumValue32 * productValue114)) + (sumValue36 * productValue115)) + (sumValue38 * productValue116);
    float clampedValue8 = clamp(asfloat(2129690299u - asuint(max(abs(productValue108 - productValue107), sumValue35))) * abs(sumValue38), 0.0f, 1.0f);
    float sumValue39 = productValue111 - productValue110;
    float productValue118 = (((sumValue34 * productValue114) + (sumValue31 * productValue113)) + (sumValue37 * productValue115)) + (sumValue39 * productValue116);
    float clampedValue9 = clamp(asfloat(2129690299u - asuint(max(abs(productValue111 - productValue107), sumValue33))) * abs(sumValue39), 0.0f, 1.0f);
    float productValue119 = (productValue118 * productValue118) + (productValue117 * productValue117);
    bool conditionValue = productValue119 < 3.0517578125e-05f;
    float reinterpretedBits = conditionValue ? 1.0f : asfloat(1597275508u - (asuint(productValue119) >> 1u));
    float comparisonValue1 = reinterpretedBits * (conditionValue ? 1.0f : productValue117);
    float productValue120 = reinterpretedBits * productValue118;
    float productValue121 = ((((((clampedValue5 * clampedValue5) + (clampedValue4 * clampedValue4)) * productValue114) + (((clampedValue3 * clampedValue3) + (clampedValue2 * clampedValue2)) * productValue113)) + (((clampedValue7 * clampedValue7) + (clampedValue6 * clampedValue6)) * productValue115)) + (((clampedValue9 * clampedValue9) + (clampedValue8 * clampedValue8)) * productValue116)) * 0.5f;
    float productValue122 = productValue121 * productValue121;
    float reinterpretedBits1 = (((asfloat(2129690299u - asuint(max(abs(comparisonValue1), abs(productValue120)))) * ((comparisonValue1 * comparisonValue1) + (productValue120 * productValue120))) + (-1.0f)) * productValue122) + 1.0f;
    float productValue123 = 1.0f - (productValue122 * 0.5f);
    float productValue124 = 0.5f - (productValue122 * 0.2899999916553497314453125f);
    float reinterpretedBits2 = asfloat(2129690299u - asuint(productValue124));
    float sumValue40 = (-1.0f) - sumValue19;
    float productValue125 = comparisonValue1 * sumValue18;
    float productValue126 = productValue120 * sumValue40;
    float productValue127 = productValue120 * sumValue18;
    float productValue128 = comparisonValue1 * sumValue40;
    float productValue129 = reinterpretedBits1 * (productValue126 - productValue125);
    float productValue130 = productValue123 * (productValue127 + productValue128);
    float productValue131 = min((productValue129 * productValue129) + (productValue130 * productValue130), reinterpretedBits2);
    float productValue132 = (productValue131 * productValue124) + (-1.0f);
    float productValue133 = (productValue132 * productValue132) * ((((productValue131 * 0.625f) + (-1.5625f)) * ((productValue131 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float productValue134 = comparisonValue1 * sumValue26;
    float productValue135 = productValue120 * sumValue26;
    float productValue136 = reinterpretedBits1 * (productValue134 + productValue126);
    float productValue137 = productValue123 * (productValue128 - productValue135);
    float productValue138 = min((productValue136 * productValue136) + (productValue137 * productValue137), reinterpretedBits2);
    float productValue139 = (productValue138 * productValue124) + (-1.0f);
    float productValue140 = (productValue139 * productValue139) * ((((productValue138 * 0.625f) + (-1.5625f)) * ((productValue138 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float sumValue41 = (-1.0f) - sumValue18;
    float productValue141 = comparisonValue1 * sumValue41;
    float productValue142 = productValue120 * sumValue27;
    float productValue143 = productValue120 * sumValue41;
    float productValue144 = comparisonValue1 * sumValue27;
    float productValue145 = reinterpretedBits1 * (productValue141 + productValue142);
    float productValue146 = productValue123 * (productValue144 - productValue143);
    float productValue147 = min((productValue145 * productValue145) + (productValue146 * productValue146), reinterpretedBits2);
    float productValue148 = (productValue147 * productValue124) + (-1.0f);
    float productValue149 = (productValue148 * productValue148) * ((((productValue147 * 0.625f) + (-1.5625f)) * ((productValue147 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float productValue150 = reinterpretedBits1 * (productValue142 - productValue125);
    float productValue151 = productValue123 * (productValue127 + productValue144);
    float productValue152 = min((productValue150 * productValue150) + (productValue151 * productValue151), reinterpretedBits2);
    float productValue153 = (productValue152 * productValue124) + (-1.0f);
    float productValue154 = (productValue153 * productValue153) * ((((productValue152 * 0.625f) + (-1.5625f)) * ((productValue152 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float sumValue42 = (-0.0f) - sumValue19;
    float productValue155 = productValue120 * sumValue42;
    float productValue156 = comparisonValue1 * sumValue42;
    float productValue157 = reinterpretedBits1 * (productValue155 - productValue125);
    float productValue158 = productValue123 * (productValue127 + productValue156);
    float productValue159 = min((productValue157 * productValue157) + (productValue158 * productValue158), reinterpretedBits2);
    float productValue160 = (productValue159 * productValue124) + (-1.0f);
    float productValue161 = (productValue160 * productValue160) * ((((productValue159 * 0.625f) + (-1.5625f)) * ((productValue159 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float productValue162 = reinterpretedBits1 * (productValue141 + productValue155);
    float productValue163 = productValue123 * (productValue156 - productValue143);
    float productValue164 = min((productValue162 * productValue162) + (productValue163 * productValue163), reinterpretedBits2);
    float productValue165 = (productValue164 * productValue124) + (-1.0f);
    float productValue166 = (productValue165 * productValue165) * ((((productValue164 * 0.625f) + (-1.5625f)) * ((productValue164 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float productValue167 = reinterpretedBits1 * (productValue134 + productValue142);
    float productValue168 = productValue123 * (productValue144 - productValue135);
    float productValue169 = min((productValue167 * productValue167) + (productValue168 * productValue168), reinterpretedBits2);
    float productValue170 = (productValue169 * productValue124) + (-1.0f);
    float productValue171 = (productValue170 * productValue170) * ((((productValue169 * 0.625f) + (-1.5625f)) * ((productValue169 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float sumValue43 = 2.0f - sumValue18;
    float productValue172 = comparisonValue1 * sumValue43;
    float productValue173 = productValue120 * sumValue43;
    float productValue174 = reinterpretedBits1 * (productValue172 + productValue142);
    float productValue175 = productValue123 * (productValue144 - productValue173);
    float productValue176 = min((productValue174 * productValue174) + (productValue175 * productValue175), reinterpretedBits2);
    float productValue177 = (productValue176 * productValue124) + (-1.0f);
    float productValue178 = (productValue177 * productValue177) * ((((productValue176 * 0.625f) + (-1.5625f)) * ((productValue176 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float productValue179 = reinterpretedBits1 * (productValue172 + productValue155);
    float productValue180 = productValue123 * (productValue156 - productValue173);
    float productValue181 = min((productValue179 * productValue179) + (productValue180 * productValue180), reinterpretedBits2);
    float productValue182 = (productValue181 * productValue124) + (-1.0f);
    float productValue183 = (productValue182 * productValue182) * ((((productValue181 * 0.625f) + (-1.5625f)) * ((productValue181 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float productValue184 = reinterpretedBits1 * (productValue134 + productValue155);
    float productValue185 = productValue123 * (productValue156 - productValue135);
    float productValue186 = min((productValue184 * productValue184) + (productValue185 * productValue185), reinterpretedBits2);
    float productValue187 = (productValue186 * productValue124) + (-1.0f);
    float productValue188 = (productValue187 * productValue187) * ((((productValue186 * 0.625f) + (-1.5625f)) * ((productValue186 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float sumValue44 = 2.0f - sumValue19;
    float productValue189 = productValue120 * sumValue44;
    float productValue190 = comparisonValue1 * sumValue44;
    float productValue191 = reinterpretedBits1 * (productValue134 + productValue189);
    float productValue192 = productValue123 * (productValue190 - productValue135);
    float productValue193 = min((productValue191 * productValue191) + (productValue192 * productValue192), reinterpretedBits2);
    float productValue194 = (productValue193 * productValue124) + (-1.0f);
    float productValue195 = (productValue194 * productValue194) * ((((productValue193 * 0.625f) + (-1.5625f)) * ((productValue193 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float productValue196 = reinterpretedBits1 * (productValue189 - productValue125);
    float productValue197 = productValue123 * (productValue127 + productValue190);
    float productValue198 = min((productValue196 * productValue196) + (productValue197 * productValue197), reinterpretedBits2);
    float productValue199 = (productValue198 * productValue124) + (-1.0f);
    float productValue200 = (productValue199 * productValue199) * ((((productValue198 * 0.625f) + (-1.5625f)) * ((productValue198 * 0.4000000059604644775390625f) + (-1.0f))) + (-0.5625f));
    float quotientValue3 = 1.0f / (((((((((((productValue140 + productValue133) + productValue149) + productValue154) + productValue161) + productValue166) + productValue171) + productValue178) + productValue183) + productValue188) + productValue195) + productValue200);
    fragmentColor0.x = min(max(max(scalarValue12, max(scalarValue25, scalarValue11)), scalarValue22), max(min(min(scalarValue12, min(scalarValue25, scalarValue11)), scalarValue22), ((((((((((((productValue140 * scalarValue5) + (productValue133 * scalarValue4)) + (productValue149 * scalarValue10)) + (productValue154 * scalarValue11)) + (productValue161 * scalarValue12)) + (productValue166 * scalarValue13)) + (productValue171 * scalarValue22)) + (productValue178 * scalarValue23)) + (productValue183 * scalarValue24)) + (productValue188 * scalarValue25)) + (productValue195 * scalarValue34)) + (productValue200 * scalarValue35)) * quotientValue3));
    fragmentColor0.y = min(max(max(scalarValue16, max(scalarValue29, scalarValue15)), scalarValue26), max(min(min(scalarValue16, min(scalarValue29, scalarValue15)), scalarValue26), ((((((((((((productValue140 * scalarValue7) + (productValue133 * scalarValue6)) + (productValue149 * scalarValue14)) + (productValue154 * scalarValue15)) + (productValue161 * scalarValue16)) + (productValue166 * scalarValue17)) + (productValue171 * scalarValue26)) + (productValue178 * scalarValue27)) + (productValue183 * scalarValue28)) + (productValue188 * scalarValue29)) + (productValue195 * scalarValue36)) + (productValue200 * scalarValue37)) * quotientValue3));
    fragmentColor0.z = min(max(max(scalarValue20, max(scalarValue33, scalarValue19)), scalarValue30), max(min(min(scalarValue20, min(scalarValue33, scalarValue19)), scalarValue30), ((((((((((((productValue140 * scalarValue9) + (productValue133 * scalarValue8)) + (productValue149 * scalarValue18)) + (productValue154 * scalarValue19)) + (productValue161 * scalarValue20)) + (productValue166 * scalarValue21)) + (productValue171 * scalarValue30)) + (productValue178 * scalarValue31)) + (productValue183 * scalarValue32)) + (productValue188 * scalarValue33)) + (productValue195 * scalarValue38)) + (productValue200 * scalarValue39)) * quotientValue3));
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_FULL && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_RCAS)
    uint productValue201 = uint(float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.z * varyingTexCoord0.x)));
    uint productValue202 = uint(float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.w * varyingTexCoord0.y)));
    float4 loadedBufferValue5 = inputTexTexture.Load(int3(uint2(productValue201, productValue202 + 4294967295u), 0u));
    float scalarValue40 = loadedBufferValue5.x;
    float scalarValue41 = loadedBufferValue5.y;
    float scalarValue42 = loadedBufferValue5.z;
    float4 loadedBufferValue6 = inputTexTexture.Load(int3(uint2(productValue201 + 4294967295u, productValue202), 0u));
    float scalarValue43 = loadedBufferValue6.x;
    float scalarValue44 = loadedBufferValue6.y;
    float scalarValue45 = loadedBufferValue6.z;
    float4 loadedBufferValue7 = inputTexTexture.Load(int3(uint2(productValue201, productValue202), 0u));
    float scalarValue46 = loadedBufferValue7.x;
    float scalarValue47 = loadedBufferValue7.y;
    float scalarValue48 = loadedBufferValue7.z;
    float4 loadedBufferValue8 = inputTexTexture.Load(int3(uint2(productValue201 + 1u, productValue202), 0u));
    float scalarValue49 = loadedBufferValue8.x;
    float scalarValue50 = loadedBufferValue8.y;
    float scalarValue51 = loadedBufferValue8.z;
    float4 loadedBufferValue9 = inputTexTexture.Load(int3(uint2(productValue201, productValue202 + 1u), 0u));
    float scalarValue52 = loadedBufferValue9.x;
    float scalarValue53 = loadedBufferValue9.y;
    float scalarValue54 = loadedBufferValue9.z;
    float scalarValue55 = min(min(scalarValue40, min(scalarValue43, scalarValue49)), scalarValue52);
    float scalarValue56 = min(min(scalarValue41, min(scalarValue44, scalarValue50)), scalarValue53);
    float scalarValue57 = min(min(scalarValue42, min(scalarValue45, scalarValue51)), scalarValue54);
    float scalarValue58 = max(max(scalarValue40, max(scalarValue43, scalarValue49)), scalarValue52);
    float scalarValue59 = max(max(scalarValue41, max(scalarValue44, scalarValue50)), scalarValue53);
    float scalarValue60 = max(max(scalarValue42, max(scalarValue45, scalarValue51)), scalarValue54);
    float quotientValue4 = max(-0.1875f, min(max(max((-0.0f) - (min(scalarValue55, scalarValue46) * (0.25f / scalarValue58)), (1.0f - max(scalarValue58, scalarValue46)) * (1.0f / ((scalarValue55 * 4.0f) + (-4.0f)))), max(max((-0.0f) - (min(scalarValue56, scalarValue47) * (0.25f / scalarValue59)), (1.0f - max(scalarValue59, scalarValue47)) * (1.0f / ((scalarValue56 * 4.0f) + (-4.0f)))), max((-0.0f) - (min(scalarValue57, scalarValue48) * (0.25f / scalarValue60)), (1.0f - max(scalarValue60, scalarValue48)) * (1.0f / ((scalarValue57 * 4.0f) + (-4.0f)))))), 0.0f)) * RD_UNIFORM_FSR_CONST0.x;
    float productValue203 = (quotientValue4 * 4.0f) + 1.0f;
    float reinterpretedBits3 = asfloat(2129764351u - asuint(productValue203));
    float productValue204 = (2.0f - (reinterpretedBits3 * productValue203)) * reinterpretedBits3;
    fragmentColor0.x = productValue204 * ((quotientValue4 * (((scalarValue43 + scalarValue40) + scalarValue49) + scalarValue52)) + scalarValue46);
    fragmentColor0.y = productValue204 * ((quotientValue4 * (((scalarValue44 + scalarValue41) + scalarValue50) + scalarValue53)) + scalarValue47);
    fragmentColor0.z = productValue204 * ((quotientValue4 * (((scalarValue45 + scalarValue42) + scalarValue51) + scalarValue54)) + scalarValue48);
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_FULL && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_BILINEAR)
    float4 sampledTextureValue5 = inputTexTexture.SampleLevel(inputTexSampler, float2((((float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.z * varyingTexCoord0.x)) * RD_UNIFORM_FSR_CONST0.x) + RD_UNIFORM_FSR_CONST0.z) * RD_UNIFORM_FSR_CONST1.x) + (RD_UNIFORM_FSR_CONST1.z * 0.5f), (((float(uint(RD_UNIFORM_INPUT_AND_OUTPUT_RESOLUTION.w * varyingTexCoord0.y)) * RD_UNIFORM_FSR_CONST0.y) + RD_UNIFORM_FSR_CONST0.w) * RD_UNIFORM_FSR_CONST1.y) - (RD_UNIFORM_FSR_CONST1.w * 0.5f)), 0.0f);
    fragmentColor0.x = sampledTextureValue5.x;
    fragmentColor0.y = sampledTextureValue5.y;
    fragmentColor0.z = sampledTextureValue5.z;
#endif
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
