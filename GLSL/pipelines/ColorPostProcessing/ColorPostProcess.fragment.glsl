#version 460
#extension GL_GOOGLE_include_directive : require
// ColorPostProcessing / ColorPostProcess / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/ColorPostProcessing/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue5.x;
    float scalarValue9 = sampledTextureValue5.y;
    float scalarValue10 = sampledTextureValue5.z;
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    if (fragmentScalarConstants1.packedValues[74u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue5.x;
    float scalarValue9 = sampledTextureValue5.y;
    float scalarValue10 = sampledTextureValue5.z;
    float quotientValue;
    float quotientValue1;
    float quotientValue2;
    if (fragmentScalarConstants1.packedValues[74u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(colorTextureTexture, colorTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float quotientValue;
    float quotientValue1;
    float quotientValue2;
    if (fragmentVectorConstants1.packedValues[18u].z > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float sampledTextureValue8 = 0.180000007152557373046875 / texture(sampler2D(materialTexture3, textureSampler3), vec2(0.5)).x;
        precise float sumValue5 = sampledTextureValue8 + 9.9999997473787516355514526367188e-05;
        precise float quotientValue54 = scalarValue8 / sumValue5;
        precise float quotientValue55 = scalarValue9 / sumValue5;
        precise float quotientValue56 = scalarValue10 / sumValue5;
        intermediateValue19 = quotientValue54;
        intermediateValue20 = quotientValue55;
        intermediateValue21 = quotientValue56;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue6 = (0.180000007152557373046875 / texture(sampler2D(materialTexture3, textureSampler3), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        quotientValue = scalarValue8 / sampledTextureValue6;
        quotientValue1 = scalarValue9 / sampledTextureValue6;
        quotientValue2 = scalarValue10 / sampledTextureValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue1 = (0.180000007152557373046875 / texture(sampler2D(preExposureLuminanceTexture, preExposureLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        quotientValue = scalarValue / sampledTextureValue1;
        quotientValue1 = scalarValue1 / sampledTextureValue1;
        quotientValue2 = scalarValue2 / sampledTextureValue1;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue19 = scalarValue8;
        intermediateValue20 = scalarValue9;
        intermediateValue21 = scalarValue10;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        quotientValue = scalarValue8;
        quotientValue1 = scalarValue9;
        quotientValue2 = scalarValue10;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        quotientValue = scalarValue;
        quotientValue1 = scalarValue1;
        quotientValue2 = scalarValue2;
#endif
    }
    float sampledTextureValue2;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    if (fragmentScalarConstants1.packedValues[10u] > 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (fragmentVectorConstants1.packedValues[2u].z > 0.5)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        sampledTextureValue2 = spvNMin(spvNMax(texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x, fragmentScalarConstants1.packedValues[88u]), fragmentScalarConstants1.packedValues[89u]);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sampledTextureValue2 = spvNMin(spvNMax(texture(sampler2D(averageLuminanceTexture, averageLuminanceSampler), vec2(0.5)).x, fragmentVectorConstants1.packedValues[22u].x), fragmentVectorConstants1.packedValues[22u].y);
#endif
    }
    else
    {
        sampledTextureValue2 = 0.180000007152557373046875;
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint scalarValue11 = uint(int(fragmentScalarConstants1.packedValues[8u]));
    float intermediateValue23;
    if ((int(scalarValue11) > int(0u)) && (int(scalarValue11) < int(2u)))
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue11 = uint(int(fragmentScalarConstants1.packedValues[8u]));
    float multiplyAddValue;
    if ((int(scalarValue11) > int(0u)) && (int(scalarValue11) < int(2u)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint scalarValue3 = uint(int(fragmentVectorConstants1.packedValues[2u].x));
    float intermediateValue4;
    if (scalarValue3 == 1u)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float sumValue6 = sampledTextureValue2 + 1.0;
        precise float multiplyAddValue86 = 2.0 / fma(log2(sumValue6), 0.3010300099849700927734375, 2.0);
        precise float sumValue7 = 1.0299999713897705078125 - multiplyAddValue86;
        intermediateValue23 = sumValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue = 1.0299999713897705078125 - (2.0 / fma(log2(sampledTextureValue2 + 1.0), 0.3010300099849700927734375, 2.0));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue4 = 1.0299999713897705078125 - (2.0 / ((log2(sampledTextureValue2 + 1.0) * 0.301029980182647705078125) + 2.0));
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue3;
        if (int(scalarValue11) > int(1u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue;
        if (int(scalarValue3) > int(1u))
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float nonlinearValue11 = log2(sampledTextureValue2) + 3.0;
            precise float nonlinearValue12 = log2(fragmentVectorConstants1.packedValues[22u].x) + 3.0;
            precise float sumValue8 = nonlinearValue11 - nonlinearValue12;
            precise float nonlinearValue13 = log2(fragmentVectorConstants1.packedValues[22u].y) - nonlinearValue12;
            precise float sumValue9 = nonlinearValue13 + 3.0;
            precise float quotientValue57 = sumValue8 / sumValue9;
            sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2((fragmentScalarConstants1.packedValues[89u] == fragmentScalarConstants1.packedValues[88u]) ? 0.5 : quotientValue57, 0.5)).x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float nonlinearValue4 = log2(fragmentVectorConstants1.packedValues[22u].x) + 3.0;
            sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2((fragmentScalarConstants1.packedValues[89u] == fragmentScalarConstants1.packedValues[88u]) ? 0.5 : (((log2(sampledTextureValue2) + 3.0) - nonlinearValue4) / ((log2(fragmentVectorConstants1.packedValues[22u].y) - nonlinearValue4) + 3.0)), 0.5)).x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float nonlinearValue = log2(fragmentVectorConstants1.packedValues[22u].x);
            branchMergedValue = texture(sampler2D(customExposureCompensationTexture, customExposureCompensationSampler), vec2((fragmentVectorConstants1.packedValues[22u].x == fragmentVectorConstants1.packedValues[22u].y) ? 0.5 : ((log2(sampledTextureValue2) - nonlinearValue) / (log2(fragmentVectorConstants1.packedValues[22u].y) - nonlinearValue)), 0.5)).x;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            sampledTextureValue3 = fragmentScalarConstants1.packedValues[9u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = fragmentVectorConstants1.packedValues[2u].y;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue23 = sampledTextureValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue = sampledTextureValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue4 = branchMergedValue;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec3 vectorValue2 = vec3(intermediateValue19, intermediateValue20, intermediateValue21);
    float scalarValue43 = rdDot3Precise2(vectorValue2, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    float intermediateValue33;
    float intermediateValue34;
    float intermediateValue35;
    if (fragmentScalarConstants1.packedValues[84u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec3 vectorValue = vec3(quotientValue, quotientValue1, quotientValue2);
    float scalarValue12 = rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    if (fragmentScalarConstants1.packedValues[84u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float dotProductValue = dot(vec3(quotientValue, quotientValue1, quotientValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    float multiplyAddValue9;
    float multiplyAddValue10;
    float multiplyAddValue11;
    if (fragmentVectorConstants1.packedValues[21u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float productValue81 = fragmentScalarConstants1.packedValues[85u] * fragmentScalarConstants1.packedValues[85u];
        precise float multiplyAddValue87 = fma(productValue81, 1.2864121856637211749330163002014e-07, fma(fragmentScalarConstants1.packedValues[85u], 0.00015411825734190642833709716796875, 0.860117733478546142578125)) / fma(productValue81, 7.0814513719597016461193561553955e-07, fma(fragmentScalarConstants1.packedValues[85u], 0.0008424202096648514270782470703125, 1.0));
        precise float multiplyAddValue91 = fma(productValue81, 4.2048167614439080352894961833954e-08, fma(fragmentScalarConstants1.packedValues[85u], 4.2280626075807958841323852539062e-05, 0.317398726940155029296875)) / fma(productValue81, 1.6145605741257895715534687042236e-07, fma(-fragmentScalarConstants1.packedValues[85u], 2.8974181986995972692966461181641e-05, 1.0));
        precise float productValue82 = multiplyAddValue87 * 3.0;
        precise float sumValue10 = multiplyAddValue91 + multiplyAddValue91;
        precise float sumValue11 = multiplyAddValue87 + multiplyAddValue87;
        precise float multiplyAddValue92 = fma(-multiplyAddValue91, 8.0, sumValue11) + 4.0;
        precise float quotientValue58 = productValue82 / multiplyAddValue92;
        precise float quotientValue59 = sumValue10 / multiplyAddValue92;
        precise float quotientValue60 = quotientValue58 / quotientValue59;
        precise float sumValue12 = 1.0 - quotientValue58;
        precise float sumValue13 = sumValue12 - quotientValue59;
        precise float quotientValue61 = sumValue13 / quotientValue59;
        vec3 vectorValue3 = vec3(quotientValue60, 1.0, quotientValue61);
        float scalarValue44 = rdDot3Precise2(vectorValue3, vec3(0.732800006866455078125, 0.4296000003814697265625, -0.1624000072479248046875));
        float scalarValue45 = rdDot3Precise2(vectorValue3, vec3(-0.703599989414215087890625, 1.6974999904632568359375, 0.006099999882280826568603515625));
        float scalarValue46 = rdDot3Precise2(vectorValue3, vec3(0.0030000000260770320892333984375, 0.013600000180304050445556640625, 0.98339998722076416015625));
        precise float quotientValue62 = 0.94925296306610107421875 / scalarValue44;
        precise float quotientValue63 = 1.03541910648345947265625 / scalarValue45;
        precise float quotientValue64 = 1.087183475494384765625 / scalarValue46;
        precise float productValue83 = scalarValue44 * 1.05346000194549560546875;
        precise float productValue84 = scalarValue45 * 0.965792477130889892578125;
        precise float productValue85 = scalarValue46 * 0.919807970523834228515625;
        bool comparisonValue39 = uint(int(fragmentScalarConstants1.packedValues[86u])) != 0u;
        float comparisonValue99 = comparisonValue39 ? productValue83 : quotientValue62;
        float comparisonValue100 = comparisonValue39 ? productValue84 : quotientValue63;
        float comparisonValue101 = comparisonValue39 ? productValue85 : quotientValue64;
        precise float productValue86 = comparisonValue99 * 0.38999998569488525390625;
        precise float productValue87 = comparisonValue100 * 0.071000002324581146240234375;
        precise float productValue88 = comparisonValue101 * 0.02300000004470348358154296875;
        vec3 vectorValue4 = vec3(productValue86, productValue87, productValue88);
        precise float productValue89 = comparisonValue99 * 0.550000011920928955078125;
        precise float productValue90 = comparisonValue100 * 0.962999999523162841796875;
        precise float productValue91 = comparisonValue101 * 0.12800000607967376708984375;
        vec3 vectorValue5 = vec3(productValue89, productValue90, productValue91);
        precise float productValue92 = comparisonValue99 * 0.0089999996125698089599609375;
        precise float productValue93 = comparisonValue100 * 0.001000000047497451305389404296875;
        precise float productValue94 = comparisonValue101 * 0.93599998950958251953125;
        vec3 vectorValue6 = vec3(productValue92, productValue93, productValue94);
        intermediateValue33 = rdDot3Precise2(vec3(rdDot3Precise2(vectorValue4, vec3(-0.0419999994337558746337890625, -0.1180000007152557373046875, 1.0690000057220458984375)), rdDot3Precise2(vectorValue5, vec3(-0.0419999994337558746337890625, -0.1180000007152557373046875, 1.0690000057220458984375)), rdDot3Precise2(vectorValue6, vec3(-0.0419999994337558746337890625, -0.1180000007152557373046875, 1.0690000057220458984375))), vectorValue2);
        intermediateValue34 = rdDot3Precise2(vec3(rdDot2Precise(vec2(productValue86, productValue87), vec2(-0.20999999344348907470703125, 1.15799999237060546875)), rdDot2Precise(vec2(productValue89, productValue90), vec2(-0.20999999344348907470703125, 1.15799999237060546875)), rdDot2Precise(vec2(productValue92, productValue93), vec2(-0.20999999344348907470703125, 1.15799999237060546875))), vectorValue2);
        intermediateValue35 = rdDot3Precise2(vec3(rdDot3Precise2(vectorValue4, vec3(2.8589999675750732421875, -1.6289999485015869140625, -0.02500000037252902984619140625)), rdDot3Precise2(vectorValue5, vec3(2.8589999675750732421875, -1.6289999485015869140625, -0.02500000037252902984619140625)), rdDot3Precise2(vectorValue6, vec3(2.8589999675750732421875, -1.6289999485015869140625, -0.02500000037252902984619140625))), vectorValue2);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float productValue62 = fragmentScalarConstants1.packedValues[85u] * fragmentScalarConstants1.packedValues[85u];
        float multiplyAddValue19 = fma(productValue62, 1.2864121856637211749330163002014e-07, fma(fragmentScalarConstants1.packedValues[85u], 0.00015411825734190642833709716796875, 0.860117733478546142578125)) / fma(productValue62, 7.0814513719597016461193561553955e-07, fma(fragmentScalarConstants1.packedValues[85u], 0.0008424202096648514270782470703125, 1.0));
        float multiplyAddValue20 = fma(productValue62, 4.2048167614439080352894961833954e-08, fma(fragmentScalarConstants1.packedValues[85u], 4.2280626075807958841323852539062e-05, 0.317398726940155029296875)) / fma(productValue62, 1.6145605741257895715534687042236e-07, fma(-fragmentScalarConstants1.packedValues[85u], 2.8974181986995972692966461181641e-05, 1.0));
        float multiplyAddValue21 = fma(-multiplyAddValue20, 8.0, multiplyAddValue19 + multiplyAddValue19) + 4.0;
        float quotientValue48 = (multiplyAddValue19 * 3.0) / multiplyAddValue21;
        float quotientValue49 = (multiplyAddValue20 + multiplyAddValue20) / multiplyAddValue21;
        vec3 quotientValue50 = vec3(quotientValue48 / quotientValue49, 1.0, ((1.0 - quotientValue48) - quotientValue49) / quotientValue49);
        float scalarValue13 = rdDot3Precise2(quotientValue50, vec3(0.732800006866455078125, 0.4296000003814697265625, -0.1624000072479248046875));
        float scalarValue14 = rdDot3Precise2(quotientValue50, vec3(-0.703599989414215087890625, 1.6974999904632568359375, 0.006099999882280826568603515625));
        float scalarValue15 = rdDot3Precise2(quotientValue50, vec3(0.0030000000260770320892333984375, 0.013600000180304050445556640625, 0.98339998722076416015625));
        bool comparisonValue39 = uint(int(fragmentScalarConstants1.packedValues[86u])) != 0u;
        float comparisonValue40 = comparisonValue39 ? (scalarValue13 * 1.05346000194549560546875) : (0.94925296306610107421875 / scalarValue13);
        float comparisonValue41 = comparisonValue39 ? (scalarValue14 * 0.965792477130889892578125) : (1.03541910648345947265625 / scalarValue14);
        float comparisonValue42 = comparisonValue39 ? (scalarValue15 * 0.919807970523834228515625) : (1.087183475494384765625 / scalarValue15);
        float productValue63 = comparisonValue40 * 0.38999998569488525390625;
        float productValue64 = comparisonValue41 * 0.071000002324581146240234375;
        vec3 productValue65 = vec3(productValue63, productValue64, comparisonValue42 * 0.02300000004470348358154296875);
        float productValue66 = comparisonValue40 * 0.550000011920928955078125;
        float productValue67 = comparisonValue41 * 0.962999999523162841796875;
        vec3 productValue68 = vec3(productValue66, productValue67, comparisonValue42 * 0.12800000607967376708984375);
        float productValue69 = comparisonValue40 * 0.0089999996125698089599609375;
        float productValue70 = comparisonValue41 * 0.001000000047497451305389404296875;
        vec3 productValue71 = vec3(productValue69, productValue70, comparisonValue42 * 0.93599998950958251953125);
        intermediateValue25 = rdDot3Precise2(vec3(rdDot3Precise2(productValue65, vec3(-0.0419999994337558746337890625, -0.1180000007152557373046875, 1.0690000057220458984375)), rdDot3Precise2(productValue68, vec3(-0.0419999994337558746337890625, -0.1180000007152557373046875, 1.0690000057220458984375)), rdDot3Precise2(productValue71, vec3(-0.0419999994337558746337890625, -0.1180000007152557373046875, 1.0690000057220458984375))), vectorValue);
        intermediateValue26 = rdDot3Precise2(vec3(rdDot2Precise(vec2(productValue63, productValue64), vec2(-0.20999999344348907470703125, 1.15799999237060546875)), rdDot2Precise(vec2(productValue66, productValue67), vec2(-0.20999999344348907470703125, 1.15799999237060546875)), rdDot2Precise(vec2(productValue69, productValue70), vec2(-0.20999999344348907470703125, 1.15799999237060546875))), vectorValue);
        intermediateValue27 = rdDot3Precise2(vec3(rdDot3Precise2(productValue65, vec3(2.8589999675750732421875, -1.6289999485015869140625, -0.02500000037252902984619140625)), rdDot3Precise2(productValue68, vec3(2.8589999675750732421875, -1.6289999485015869140625, -0.02500000037252902984619140625)), rdDot3Precise2(productValue71, vec3(2.8589999675750732421875, -1.6289999485015869140625, -0.02500000037252902984619140625))), vectorValue);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float quotientValue3 = ((((fragmentVectorConstants1.packedValues[21u].y * 1.2864121856637211749330163002014e-07) + 0.00015411825734190642833709716796875) * fragmentVectorConstants1.packedValues[21u].y) + 0.860117733478546142578125) / ((((fragmentVectorConstants1.packedValues[21u].y * 7.0814513719597016461193561553955e-07) + 0.0008424202096648514270782470703125) * fragmentVectorConstants1.packedValues[21u].y) + 1.0);
        float quotientValue4 = ((((fragmentVectorConstants1.packedValues[21u].y * 4.2048167614439080352894961833954e-08) + 4.2280626075807958841323852539062e-05) * fragmentVectorConstants1.packedValues[21u].y) + 0.317398726940155029296875) / ((1.0 - (fragmentVectorConstants1.packedValues[21u].y * 2.8974181986995972692966461181641e-05)) + ((fragmentVectorConstants1.packedValues[21u].y * fragmentVectorConstants1.packedValues[21u].y) * 1.6145605741257895715534687042236e-07));
        float productValue = ((quotientValue3 * 2.0) - (quotientValue4 * 8.0)) + 4.0;
        float quotientValue5 = (quotientValue3 * 3.0) / productValue;
        float quotientValue6 = (quotientValue4 * 2.0) / productValue;
        float quotientValue7 = quotientValue5 / quotientValue6;
        float quotientValue8 = ((1.0 - quotientValue5) - quotientValue6) / quotientValue6;
        float multiplyAddValue1 = fma(-0.1624000072479248046875, quotientValue8, (quotientValue7 * 0.732800006866455078125) + 0.4296000003814697265625);
        float multiplyAddValue2 = fma(0.006099999882280826568603515625, quotientValue8, 1.6974999904632568359375 - (quotientValue7 * 0.703599989414215087890625));
        float multiplyAddValue3 = fma(0.98339998722076416015625, quotientValue8, (quotientValue7 * 0.0030000000260770320892333984375) + 0.013600000180304050445556640625);
        bool comparisonValue = uint(int(fragmentVectorConstants1.packedValues[21u].z)) == 0u;
        float comparisonValue1 = comparisonValue ? (0.94925296306610107421875 / multiplyAddValue1) : (multiplyAddValue1 * 1.05346000194549560546875);
        float comparisonValue2 = comparisonValue ? (1.03541910648345947265625 / multiplyAddValue2) : (multiplyAddValue2 * 0.965792477130889892578125);
        float comparisonValue3 = comparisonValue ? (1.087183475494384765625 / multiplyAddValue3) : (multiplyAddValue3 * 0.919807970523834228515625);
        float multiplyAddValue4 = fma(comparisonValue2, 0.071000002324581146240234375, 0.0);
        float multiplyAddValue5 = fma(comparisonValue2, 0.962999999523162841796875, 0.0);
        float multiplyAddValue6 = fma(comparisonValue2, 0.001000000047497451305389404296875, 0.0);
        float multiplyAddValue7 = fma(comparisonValue3, 0.02300000004470348358154296875, 0.0);
        float multiplyAddValue8 = fma(comparisonValue3, 0.12800000607967376708984375, 0.0);
        float multiplyAddValue12 = fma(comparisonValue3, 0.93599998950958251953125, 0.0);
        multiplyAddValue9 = fma(fma(-0.02500000037252902984619140625, multiplyAddValue12, fma(-1.6289999485015869140625, multiplyAddValue6, comparisonValue1 * 0.02573099918663501739501953125)), quotientValue2, fma(fma(-0.02500000037252902984619140625, multiplyAddValue8, fma(-1.6289999485015869140625, multiplyAddValue5, comparisonValue1 * 1.57245004177093505859375)), quotientValue1, fma(-0.02500000037252902984619140625, multiplyAddValue7, fma(-1.6289999485015869140625, multiplyAddValue4, comparisonValue1 * 1.11500990390777587890625)) * quotientValue));
        multiplyAddValue10 = fma(fma(1.15799999237060546875, multiplyAddValue6, comparisonValue1 * (-0.001889999839477241039276123046875)), quotientValue2, fma(fma(1.15799999237060546875, multiplyAddValue5, comparisonValue1 * (-0.115499995648860931396484375)), quotientValue1, fma(1.15799999237060546875, multiplyAddValue4, comparisonValue1 * (-0.081899993121623992919921875)) * quotientValue));
        multiplyAddValue11 = fma(fma(1.0690000057220458984375, multiplyAddValue12, fma(-0.1180000007152557373046875, multiplyAddValue6, comparisonValue1 * (-0.000377999967895448207855224609375))), quotientValue2, fma(fma(1.0690000057220458984375, multiplyAddValue8, fma(-0.1180000007152557373046875, multiplyAddValue5, comparisonValue1 * (-0.0230999998748302459716796875))), quotientValue1, fma(1.0690000057220458984375, multiplyAddValue7, fma(-0.1180000007152557373046875, multiplyAddValue4, comparisonValue1 * (-0.01637999899685382843017578125))) * quotientValue));
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue33 = intermediateValue21;
        intermediateValue34 = intermediateValue20;
        intermediateValue35 = intermediateValue19;
    }
    bool comparisonValue43 = fragmentScalarConstants1.packedValues[23u] != 0.0;
    bool comparisonValue44 = fragmentScalarConstants1.packedValues[31u] != 0.0;
    bool comparisonValue45 = fragmentScalarConstants1.packedValues[35u] != 0.0;
    precise float productValue95 = sampledTextureValue2 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue96 = sampledTextureValue2 * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue97 = sampledTextureValue2 * fragmentVectorConstants1.packedValues[0u].x;
    bool comparisonValue102 = scalarValue43 >= productValue95;
    bool comparisonValue103 = productValue96 >= scalarValue43;
    bool bitwiseValue30 = comparisonValue43 && comparisonValue102;
    bool bitwiseValue31 = comparisonValue45 && comparisonValue103;
    bool conditionValue2 = scalarValue43 < sampledTextureValue2;
    bool bitwiseValue32 = comparisonValue45 && conditionValue2;
    float scalarValue16 = -sampledTextureValue2;
    precise float multiplyAddValue93 = fma(scalarValue16, fragmentScalarConstants1.packedValues[2u], scalarValue43) / fma(scalarValue16, fragmentScalarConstants1.packedValues[2u], sampledTextureValue2);
    precise float sumValue14 = fragmentVectorConstants1.packedValues[7u].x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue15 = fragmentVectorConstants1.packedValues[7u].y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue16 = fragmentVectorConstants1.packedValues[7u].z - fragmentVectorConstants1.packedValues[8u].z;
    bool conditionValue3 = sampledTextureValue2 < scalarValue43;
    bool bitwiseValue33 = comparisonValue43 && conditionValue3;
    precise float sumValue17 = scalarValue43 - sampledTextureValue2;
    precise float multiplyAddValue94 = sumValue17 / fma(sampledTextureValue2, fragmentScalarConstants1.packedValues[1u], scalarValue16);
    precise float sumValue18 = fragmentVectorConstants1.packedValues[5u].x - fragmentVectorConstants1.packedValues[7u].x;
    precise float sumValue19 = fragmentVectorConstants1.packedValues[5u].y - fragmentVectorConstants1.packedValues[7u].y;
    precise float sumValue20 = fragmentVectorConstants1.packedValues[5u].z - fragmentVectorConstants1.packedValues[7u].z;
    precise float quotientValue65 = spvNMax(intermediateValue35, 0.0) / productValue97;
    precise float quotientValue66 = spvNMax(intermediateValue34, 0.0) / productValue97;
    precise float quotientValue67 = spvNMax(intermediateValue33, 0.0) / productValue97;
    precise float multiplyAddValue95 = log2(quotientValue65) * (bitwiseValue30 ? fragmentVectorConstants1.packedValues[5u].x : (bitwiseValue31 ? fragmentVectorConstants1.packedValues[8u].x : (comparisonValue44 ? (bitwiseValue32 ? fma(multiplyAddValue93, sumValue14, fragmentVectorConstants1.packedValues[8u].x) : (bitwiseValue33 ? fma(multiplyAddValue94, sumValue18, fragmentVectorConstants1.packedValues[7u].x) : fragmentVectorConstants1.packedValues[7u].x)) : 1.0)));
    precise float multiplyAddValue96 = log2(quotientValue66) * (bitwiseValue30 ? fragmentVectorConstants1.packedValues[5u].y : (bitwiseValue31 ? fragmentVectorConstants1.packedValues[8u].y : (comparisonValue44 ? (bitwiseValue32 ? fma(multiplyAddValue93, sumValue15, fragmentVectorConstants1.packedValues[8u].y) : (bitwiseValue33 ? fma(multiplyAddValue94, sumValue19, fragmentVectorConstants1.packedValues[7u].y) : fragmentVectorConstants1.packedValues[7u].y)) : 1.0)));
    precise float multiplyAddValue97 = log2(quotientValue67) * (bitwiseValue30 ? fragmentVectorConstants1.packedValues[5u].z : (bitwiseValue31 ? fragmentVectorConstants1.packedValues[8u].z : (comparisonValue44 ? (bitwiseValue32 ? fma(multiplyAddValue93, sumValue16, fragmentVectorConstants1.packedValues[8u].z) : (bitwiseValue33 ? fma(multiplyAddValue94, sumValue20, fragmentVectorConstants1.packedValues[7u].z) : fragmentVectorConstants1.packedValues[7u].z)) : 1.0)));
    precise float exponentialValue19 = exp2(multiplyAddValue95) * productValue97;
    precise float exponentialValue20 = exp2(multiplyAddValue96) * productValue97;
    precise float exponentialValue21 = exp2(multiplyAddValue97) * productValue97;
    float scalarValue47 = spvNMax(exponentialValue19, 0.0);
    float scalarValue48 = spvNMax(exponentialValue20, 0.0);
    float scalarValue49 = spvNMax(exponentialValue21, 0.0);
    bool comparisonValue48 = fragmentScalarConstants1.packedValues[27u] != 0.0;
    bool comparisonValue49 = fragmentScalarConstants1.packedValues[79u] != 0.0;
    bool comparisonValue50 = fragmentScalarConstants1.packedValues[83u] != 0.0;
    bool bitwiseValue34 = comparisonValue102 && comparisonValue48;
    bool bitwiseValue35 = comparisonValue103 && comparisonValue50;
    bool bitwiseValue36 = conditionValue2 && comparisonValue50;
    precise float sumValue21 = fragmentVectorConstants1.packedValues[19u].x - fragmentVectorConstants1.packedValues[20u].x;
    precise float sumValue22 = fragmentVectorConstants1.packedValues[19u].y - fragmentVectorConstants1.packedValues[20u].y;
    precise float sumValue23 = fragmentVectorConstants1.packedValues[19u].z - fragmentVectorConstants1.packedValues[20u].z;
    bool bitwiseValue37 = conditionValue3 && comparisonValue48;
    precise float sumValue24 = fragmentVectorConstants1.packedValues[6u].x - fragmentVectorConstants1.packedValues[19u].x;
    precise float sumValue25 = fragmentVectorConstants1.packedValues[6u].y - fragmentVectorConstants1.packedValues[19u].y;
    precise float sumValue26 = fragmentVectorConstants1.packedValues[6u].z - fragmentVectorConstants1.packedValues[19u].z;
    float scalarValue50 = rdDot3Precise2(vec3(scalarValue47, scalarValue48, scalarValue49), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    precise float sumValue27 = scalarValue47 - scalarValue50;
    precise float sumValue28 = scalarValue48 - scalarValue50;
    precise float sumValue29 = scalarValue49 - scalarValue50;
    bool comparisonValue51 = fragmentScalarConstants1.packedValues[39u] != 0.0;
    bool comparisonValue52 = fragmentScalarConstants1.packedValues[43u] != 0.0;
    bool comparisonValue53 = fragmentScalarConstants1.packedValues[47u] != 0.0;
    bool bitwiseValue38 = comparisonValue102 && comparisonValue51;
    bool bitwiseValue39 = comparisonValue103 && comparisonValue53;
    bool bitwiseValue40 = conditionValue2 && comparisonValue53;
    precise float sumValue30 = fragmentVectorConstants1.packedValues[10u].x - fragmentVectorConstants1.packedValues[11u].x;
    precise float sumValue31 = fragmentVectorConstants1.packedValues[10u].y - fragmentVectorConstants1.packedValues[11u].y;
    precise float sumValue32 = fragmentVectorConstants1.packedValues[10u].z - fragmentVectorConstants1.packedValues[11u].z;
    bool bitwiseValue41 = conditionValue3 && comparisonValue51;
    precise float sumValue33 = fragmentVectorConstants1.packedValues[9u].x - fragmentVectorConstants1.packedValues[10u].x;
    precise float sumValue34 = fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[10u].y;
    precise float sumValue35 = fragmentVectorConstants1.packedValues[9u].z - fragmentVectorConstants1.packedValues[10u].z;
    precise float multiplyAddValue98 = spvNMax(fma(bitwiseValue34 ? fragmentVectorConstants1.packedValues[6u].x : (bitwiseValue35 ? fragmentVectorConstants1.packedValues[20u].x : (comparisonValue49 ? (bitwiseValue36 ? fma(multiplyAddValue93, sumValue21, fragmentVectorConstants1.packedValues[20u].x) : (bitwiseValue37 ? fma(multiplyAddValue94, sumValue24, fragmentVectorConstants1.packedValues[19u].x) : fragmentVectorConstants1.packedValues[19u].x)) : 1.0)), sumValue27, scalarValue50), 0.0) * (bitwiseValue38 ? fragmentVectorConstants1.packedValues[9u].x : (bitwiseValue39 ? fragmentVectorConstants1.packedValues[11u].x : (comparisonValue52 ? (bitwiseValue40 ? fma(multiplyAddValue93, sumValue30, fragmentVectorConstants1.packedValues[11u].x) : (bitwiseValue41 ? fma(multiplyAddValue94, sumValue33, fragmentVectorConstants1.packedValues[10u].x) : fragmentVectorConstants1.packedValues[10u].x)) : 1.0)));
    precise float multiplyAddValue99 = spvNMax(fma(bitwiseValue34 ? fragmentVectorConstants1.packedValues[6u].y : (bitwiseValue35 ? fragmentVectorConstants1.packedValues[20u].y : (comparisonValue49 ? (bitwiseValue36 ? fma(multiplyAddValue93, sumValue22, fragmentVectorConstants1.packedValues[20u].y) : (bitwiseValue37 ? fma(multiplyAddValue94, sumValue25, fragmentVectorConstants1.packedValues[19u].y) : fragmentVectorConstants1.packedValues[19u].y)) : 1.0)), sumValue28, scalarValue50), 0.0) * (bitwiseValue38 ? fragmentVectorConstants1.packedValues[9u].y : (bitwiseValue39 ? fragmentVectorConstants1.packedValues[11u].y : (comparisonValue52 ? (bitwiseValue40 ? fma(multiplyAddValue93, sumValue31, fragmentVectorConstants1.packedValues[11u].y) : (bitwiseValue41 ? fma(multiplyAddValue94, sumValue34, fragmentVectorConstants1.packedValues[10u].y) : fragmentVectorConstants1.packedValues[10u].y)) : 1.0)));
    precise float multiplyAddValue100 = spvNMax(fma(bitwiseValue34 ? fragmentVectorConstants1.packedValues[6u].z : (bitwiseValue35 ? fragmentVectorConstants1.packedValues[20u].z : (comparisonValue49 ? (bitwiseValue36 ? fma(multiplyAddValue93, sumValue23, fragmentVectorConstants1.packedValues[20u].z) : (bitwiseValue37 ? fma(multiplyAddValue94, sumValue26, fragmentVectorConstants1.packedValues[19u].z) : fragmentVectorConstants1.packedValues[19u].z)) : 1.0)), sumValue29, scalarValue50), 0.0) * (bitwiseValue38 ? fragmentVectorConstants1.packedValues[9u].z : (bitwiseValue39 ? fragmentVectorConstants1.packedValues[11u].z : (comparisonValue52 ? (bitwiseValue40 ? fma(multiplyAddValue93, sumValue32, fragmentVectorConstants1.packedValues[11u].z) : (bitwiseValue41 ? fma(multiplyAddValue94, sumValue35, fragmentVectorConstants1.packedValues[10u].z) : fragmentVectorConstants1.packedValues[10u].z)) : 1.0)));
    bool comparisonValue54 = fragmentScalarConstants1.packedValues[15u] != 0.0;
    bool comparisonValue55 = fragmentScalarConstants1.packedValues[55u] != 0.0;
    bool comparisonValue56 = fragmentScalarConstants1.packedValues[51u] != 0.0;
    bool bitwiseValue42 = comparisonValue102 && comparisonValue54;
    bool bitwiseValue43 = comparisonValue103 && comparisonValue56;
    bool bitwiseValue44 = conditionValue2 && comparisonValue56;
    precise float sumValue36 = fragmentVectorConstants1.packedValues[13u].x - fragmentVectorConstants1.packedValues[12u].x;
    precise float sumValue37 = fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[12u].y;
    precise float sumValue38 = fragmentVectorConstants1.packedValues[13u].z - fragmentVectorConstants1.packedValues[12u].z;
    bool bitwiseValue45 = conditionValue3 && comparisonValue54;
    precise float sumValue39 = fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[13u].x;
    precise float sumValue40 = fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[13u].y;
    precise float sumValue41 = fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[13u].z;
    float multiplyAddValue101 = spvNMax(fma(sampledTextureValue2, bitwiseValue42 ? fragmentVectorConstants1.packedValues[3u].x : (bitwiseValue43 ? fragmentVectorConstants1.packedValues[12u].x : (comparisonValue55 ? (bitwiseValue44 ? fma(multiplyAddValue93, sumValue36, fragmentVectorConstants1.packedValues[12u].x) : (bitwiseValue45 ? fma(multiplyAddValue94, sumValue39, fragmentVectorConstants1.packedValues[13u].x) : fragmentVectorConstants1.packedValues[13u].x)) : 0.0)), spvNMax(multiplyAddValue98, 0.0)), 0.0);
    float multiplyAddValue102 = spvNMax(fma(sampledTextureValue2, bitwiseValue42 ? fragmentVectorConstants1.packedValues[3u].y : (bitwiseValue43 ? fragmentVectorConstants1.packedValues[12u].y : (comparisonValue55 ? (bitwiseValue44 ? fma(multiplyAddValue93, sumValue37, fragmentVectorConstants1.packedValues[12u].y) : (bitwiseValue45 ? fma(multiplyAddValue94, sumValue40, fragmentVectorConstants1.packedValues[13u].y) : fragmentVectorConstants1.packedValues[13u].y)) : 0.0)), spvNMax(multiplyAddValue99, 0.0)), 0.0);
    float multiplyAddValue103 = spvNMax(fma(sampledTextureValue2, bitwiseValue42 ? fragmentVectorConstants1.packedValues[3u].z : (bitwiseValue43 ? fragmentVectorConstants1.packedValues[12u].z : (comparisonValue55 ? (bitwiseValue44 ? fma(multiplyAddValue93, sumValue38, fragmentVectorConstants1.packedValues[12u].z) : (bitwiseValue45 ? fma(multiplyAddValue94, sumValue41, fragmentVectorConstants1.packedValues[13u].z) : fragmentVectorConstants1.packedValues[13u].z)) : 0.0)), spvNMax(multiplyAddValue100, 0.0)), 0.0);
    float intermediateValue67;
    float intermediateValue68;
    float intermediateValue69;
    if (fragmentScalarConstants1.packedValues[73u] >= 0.5)
    {
        precise float quotientValue68 = 0.180000007152557373046875 / sampledTextureValue2;
        precise float productValue98 = intermediateValue23 * quotientValue68;
        precise float productValue99 = productValue98 * multiplyAddValue101;
        precise float productValue100 = productValue98 * multiplyAddValue102;
        precise float productValue101 = productValue98 * multiplyAddValue103;
        precise float productValue102 = spvNMax(fragmentScalarConstants1.packedValues[91u], fragmentScalarConstants1.packedValues[90u]) * productValue98;
        precise float productValue103 = productValue102 * productValue102;
        vec3 vectorValue7 = vec3(productValue99, productValue100, productValue101);
        float exponentialValue11;
        float exponentialValue12;
        float exponentialValue13;
        switch (uint(int(fragmentScalarConstants1.packedValues[72u])))
#elif RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue25 = quotientValue2;
        intermediateValue26 = quotientValue1;
        intermediateValue27 = quotientValue;
    }
    bool comparisonValue43 = fragmentScalarConstants1.packedValues[23u] != 0.0;
    bool comparisonValue44 = fragmentScalarConstants1.packedValues[31u] != 0.0;
    bool comparisonValue45 = fragmentScalarConstants1.packedValues[35u] != 0.0;
    float productValue72 = sampledTextureValue2 * fragmentVectorConstants1.packedValues[0u].x;
    bool comparisonValue46 = scalarValue12 >= (sampledTextureValue2 * fragmentVectorConstants1.packedValues[0u].y);
    bool bitwiseValue = comparisonValue43 && comparisonValue46;
    bool comparisonValue47 = (sampledTextureValue2 * fragmentVectorConstants1.packedValues[0u].z) >= scalarValue12;
    bool bitwiseValue1 = comparisonValue45 && comparisonValue47;
    bool conditionValue = scalarValue12 < sampledTextureValue2;
    bool bitwiseValue2 = comparisonValue45 && conditionValue;
    float scalarValue16 = -sampledTextureValue2;
    float multiplyAddValue22 = fma(scalarValue16, fragmentScalarConstants1.packedValues[2u], scalarValue12) / fma(scalarValue16, fragmentScalarConstants1.packedValues[2u], sampledTextureValue2);
    bool conditionValue1 = sampledTextureValue2 < scalarValue12;
    bool bitwiseValue3 = comparisonValue43 && conditionValue1;
    float multiplyAddValue23 = (scalarValue12 - sampledTextureValue2) / fma(sampledTextureValue2, fragmentScalarConstants1.packedValues[1u], scalarValue16);
    float multiplyAddValue24 = spvNMax(exp2(log2(spvNMax(intermediateValue27, 0.0) / productValue72) * (bitwiseValue ? fragmentVectorConstants1.packedValues[5u].x : (bitwiseValue1 ? fragmentVectorConstants1.packedValues[8u].x : (comparisonValue44 ? (bitwiseValue2 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[7u].x - fragmentVectorConstants1.packedValues[8u].x, fragmentVectorConstants1.packedValues[8u].x) : (bitwiseValue3 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[5u].x - fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[7u].x) : fragmentVectorConstants1.packedValues[7u].x)) : 1.0)))) * productValue72, 0.0);
    float multiplyAddValue25 = spvNMax(exp2(log2(spvNMax(intermediateValue26, 0.0) / productValue72) * (bitwiseValue ? fragmentVectorConstants1.packedValues[5u].y : (bitwiseValue1 ? fragmentVectorConstants1.packedValues[8u].y : (comparisonValue44 ? (bitwiseValue2 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[7u].y - fragmentVectorConstants1.packedValues[8u].y, fragmentVectorConstants1.packedValues[8u].y) : (bitwiseValue3 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[5u].y - fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[7u].y) : fragmentVectorConstants1.packedValues[7u].y)) : 1.0)))) * productValue72, 0.0);
    float multiplyAddValue26 = spvNMax(exp2(log2(spvNMax(intermediateValue25, 0.0) / productValue72) * (bitwiseValue ? fragmentVectorConstants1.packedValues[5u].z : (bitwiseValue1 ? fragmentVectorConstants1.packedValues[8u].z : (comparisonValue44 ? (bitwiseValue2 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[7u].z - fragmentVectorConstants1.packedValues[8u].z, fragmentVectorConstants1.packedValues[8u].z) : (bitwiseValue3 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[5u].z - fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[7u].z) : fragmentVectorConstants1.packedValues[7u].z)) : 1.0)))) * productValue72, 0.0);
    bool comparisonValue48 = fragmentScalarConstants1.packedValues[27u] != 0.0;
    bool comparisonValue49 = fragmentScalarConstants1.packedValues[79u] != 0.0;
    bool comparisonValue50 = fragmentScalarConstants1.packedValues[83u] != 0.0;
    bool bitwiseValue4 = comparisonValue46 && comparisonValue48;
    bool bitwiseValue5 = comparisonValue47 && comparisonValue50;
    bool bitwiseValue6 = conditionValue && comparisonValue50;
    bool bitwiseValue7 = conditionValue1 && comparisonValue48;
    float scalarValue17 = rdDot3Precise2(vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    bool comparisonValue51 = fragmentScalarConstants1.packedValues[39u] != 0.0;
    bool comparisonValue52 = fragmentScalarConstants1.packedValues[43u] != 0.0;
    bool comparisonValue53 = fragmentScalarConstants1.packedValues[47u] != 0.0;
    bool bitwiseValue8 = comparisonValue46 && comparisonValue51;
    bool bitwiseValue9 = comparisonValue47 && comparisonValue53;
    bool bitwiseValue10 = conditionValue && comparisonValue53;
    bool bitwiseValue11 = conditionValue1 && comparisonValue51;
    bool comparisonValue54 = fragmentScalarConstants1.packedValues[15u] != 0.0;
    bool comparisonValue55 = fragmentScalarConstants1.packedValues[55u] != 0.0;
    bool comparisonValue56 = fragmentScalarConstants1.packedValues[51u] != 0.0;
    bool bitwiseValue12 = comparisonValue46 && comparisonValue54;
    bool bitwiseValue13 = comparisonValue47 && comparisonValue56;
    bool bitwiseValue14 = conditionValue && comparisonValue56;
    bool bitwiseValue15 = conditionValue1 && comparisonValue54;
    float multiplyAddValue27 = spvNMax(fma(sampledTextureValue2, bitwiseValue12 ? fragmentVectorConstants1.packedValues[3u].x : (bitwiseValue13 ? fragmentVectorConstants1.packedValues[12u].x : (comparisonValue55 ? (bitwiseValue14 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[13u].x - fragmentVectorConstants1.packedValues[12u].x, fragmentVectorConstants1.packedValues[12u].x) : (bitwiseValue15 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[13u].x, fragmentVectorConstants1.packedValues[13u].x) : fragmentVectorConstants1.packedValues[13u].x)) : 0.0)), spvNMax(spvNMax(fma(bitwiseValue4 ? fragmentVectorConstants1.packedValues[6u].x : (bitwiseValue5 ? fragmentVectorConstants1.packedValues[20u].x : (comparisonValue49 ? (bitwiseValue6 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[19u].x - fragmentVectorConstants1.packedValues[20u].x, fragmentVectorConstants1.packedValues[20u].x) : (bitwiseValue7 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[6u].x - fragmentVectorConstants1.packedValues[19u].x, fragmentVectorConstants1.packedValues[19u].x) : fragmentVectorConstants1.packedValues[19u].x)) : 1.0)), multiplyAddValue24 - scalarValue17, scalarValue17), 0.0) * (bitwiseValue8 ? fragmentVectorConstants1.packedValues[9u].x : (bitwiseValue9 ? fragmentVectorConstants1.packedValues[11u].x : (comparisonValue52 ? (bitwiseValue10 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[10u].x - fragmentVectorConstants1.packedValues[11u].x, fragmentVectorConstants1.packedValues[11u].x) : (bitwiseValue11 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[9u].x - fragmentVectorConstants1.packedValues[10u].x, fragmentVectorConstants1.packedValues[10u].x) : fragmentVectorConstants1.packedValues[10u].x)) : 1.0))), 0.0)), 0.0);
    float multiplyAddValue28 = spvNMax(fma(sampledTextureValue2, bitwiseValue12 ? fragmentVectorConstants1.packedValues[3u].y : (bitwiseValue13 ? fragmentVectorConstants1.packedValues[12u].y : (comparisonValue55 ? (bitwiseValue14 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[12u].y, fragmentVectorConstants1.packedValues[12u].y) : (bitwiseValue15 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[13u].y, fragmentVectorConstants1.packedValues[13u].y) : fragmentVectorConstants1.packedValues[13u].y)) : 0.0)), spvNMax(spvNMax(fma(bitwiseValue4 ? fragmentVectorConstants1.packedValues[6u].y : (bitwiseValue5 ? fragmentVectorConstants1.packedValues[20u].y : (comparisonValue49 ? (bitwiseValue6 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[19u].y - fragmentVectorConstants1.packedValues[20u].y, fragmentVectorConstants1.packedValues[20u].y) : (bitwiseValue7 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[6u].y - fragmentVectorConstants1.packedValues[19u].y, fragmentVectorConstants1.packedValues[19u].y) : fragmentVectorConstants1.packedValues[19u].y)) : 1.0)), multiplyAddValue25 - scalarValue17, scalarValue17), 0.0) * (bitwiseValue8 ? fragmentVectorConstants1.packedValues[9u].y : (bitwiseValue9 ? fragmentVectorConstants1.packedValues[11u].y : (comparisonValue52 ? (bitwiseValue10 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[10u].y - fragmentVectorConstants1.packedValues[11u].y, fragmentVectorConstants1.packedValues[11u].y) : (bitwiseValue11 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[10u].y, fragmentVectorConstants1.packedValues[10u].y) : fragmentVectorConstants1.packedValues[10u].y)) : 1.0))), 0.0)), 0.0);
    float multiplyAddValue29 = spvNMax(fma(sampledTextureValue2, bitwiseValue12 ? fragmentVectorConstants1.packedValues[3u].z : (bitwiseValue13 ? fragmentVectorConstants1.packedValues[12u].z : (comparisonValue55 ? (bitwiseValue14 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[13u].z - fragmentVectorConstants1.packedValues[12u].z, fragmentVectorConstants1.packedValues[12u].z) : (bitwiseValue15 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[13u].z, fragmentVectorConstants1.packedValues[13u].z) : fragmentVectorConstants1.packedValues[13u].z)) : 0.0)), spvNMax(spvNMax(fma(bitwiseValue4 ? fragmentVectorConstants1.packedValues[6u].z : (bitwiseValue5 ? fragmentVectorConstants1.packedValues[20u].z : (comparisonValue49 ? (bitwiseValue6 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[19u].z - fragmentVectorConstants1.packedValues[20u].z, fragmentVectorConstants1.packedValues[20u].z) : (bitwiseValue7 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[6u].z - fragmentVectorConstants1.packedValues[19u].z, fragmentVectorConstants1.packedValues[19u].z) : fragmentVectorConstants1.packedValues[19u].z)) : 1.0)), multiplyAddValue26 - scalarValue17, scalarValue17), 0.0) * (bitwiseValue8 ? fragmentVectorConstants1.packedValues[9u].z : (bitwiseValue9 ? fragmentVectorConstants1.packedValues[11u].z : (comparisonValue52 ? (bitwiseValue10 ? fma(multiplyAddValue22, fragmentVectorConstants1.packedValues[10u].z - fragmentVectorConstants1.packedValues[11u].z, fragmentVectorConstants1.packedValues[11u].z) : (bitwiseValue11 ? fma(multiplyAddValue23, fragmentVectorConstants1.packedValues[9u].z - fragmentVectorConstants1.packedValues[10u].z, fragmentVectorConstants1.packedValues[10u].z) : fragmentVectorConstants1.packedValues[10u].z)) : 1.0))), 0.0)), 0.0);
    float intermediateValue55;
    float intermediateValue56;
    float intermediateValue57;
    if (fragmentScalarConstants1.packedValues[73u] >= 0.5)
    {
        float quotientValue51 = multiplyAddValue * (0.180000007152557373046875 / sampledTextureValue2);
        float productValue73 = quotientValue51 * multiplyAddValue27;
        float productValue74 = quotientValue51 * multiplyAddValue28;
        float productValue75 = quotientValue51 * multiplyAddValue29;
        float productValue76 = spvNMax(fragmentScalarConstants1.packedValues[91u], fragmentScalarConstants1.packedValues[90u]) * quotientValue51;
        float productValue77 = productValue76 * productValue76;
        vec3 vectorValue1 = vec3(productValue73, productValue74, productValue75);
        float multiplyAddValue62;
        float multiplyAddValue63;
        float multiplyAddValue64;
        switch (uint(int(fragmentScalarConstants1.packedValues[72u])))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        multiplyAddValue9 = quotientValue;
        multiplyAddValue10 = quotientValue1;
        multiplyAddValue11 = quotientValue2;
    }
    bool comparisonValue4 = fragmentVectorConstants1.packedValues[8u].w != 0.0;
    bool comparisonValue5 = fragmentVectorConstants1.packedValues[5u].w != 0.0;
    float productValue1 = fragmentVectorConstants1.packedValues[0u].y * sampledTextureValue2;
    bool comparisonValue6 = dotProductValue >= productValue1;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if (comparisonValue5 && comparisonValue6)
    {
        intermediateValue5 = fragmentVectorConstants1.packedValues[5u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[5u].y;
        intermediateValue7 = fragmentVectorConstants1.packedValues[5u].z;
    }
    else
    {
        float productValue2 = fragmentVectorConstants1.packedValues[0u].z * sampledTextureValue2;
        bool comparisonValue7 = comparisonValue4 && (dotProductValue <= productValue2);
        float branchMergedValue1;
        float branchMergedValue12;
        float branchMergedValue13;
        if ((fragmentVectorConstants1.packedValues[7u].w == 0.0) || comparisonValue7)
        {
            branchMergedValue1 = comparisonValue7 ? fragmentVectorConstants1.packedValues[8u].z : 1.0;
            branchMergedValue12 = comparisonValue7 ? fragmentVectorConstants1.packedValues[8u].y : 1.0;
            branchMergedValue13 = comparisonValue7 ? fragmentVectorConstants1.packedValues[8u].x : 1.0;
        }
        else
        {
            float branchMergedValue37;
            float branchMergedValue48;
            float branchMergedValue49;
            if ((dotProductValue < sampledTextureValue2) && comparisonValue4)
            {
                float quotientValue9 = (dotProductValue - productValue2) / (sampledTextureValue2 - productValue2);
                branchMergedValue37 = (quotientValue9 * (fragmentVectorConstants1.packedValues[7u].z - fragmentVectorConstants1.packedValues[8u].z)) + fragmentVectorConstants1.packedValues[8u].z;
                branchMergedValue48 = (quotientValue9 * (fragmentVectorConstants1.packedValues[7u].y - fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[8u].y;
                branchMergedValue49 = (quotientValue9 * (fragmentVectorConstants1.packedValues[7u].x - fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[8u].x;
            }
            else
            {
                float branchMergedValue70;
                float branchMergedValue81;
                float branchMergedValue82;
                if ((dotProductValue > sampledTextureValue2) && comparisonValue5)
                {
                    float quotientValue10 = (dotProductValue - sampledTextureValue2) / (productValue1 - sampledTextureValue2);
                    branchMergedValue70 = (quotientValue10 * (fragmentVectorConstants1.packedValues[5u].z - fragmentVectorConstants1.packedValues[7u].z)) + fragmentVectorConstants1.packedValues[7u].z;
                    branchMergedValue81 = (quotientValue10 * (fragmentVectorConstants1.packedValues[5u].y - fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[7u].y;
                    branchMergedValue82 = (quotientValue10 * (fragmentVectorConstants1.packedValues[5u].x - fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[7u].x;
                }
                else
                {
                    branchMergedValue70 = fragmentVectorConstants1.packedValues[7u].z;
                    branchMergedValue81 = fragmentVectorConstants1.packedValues[7u].y;
                    branchMergedValue82 = fragmentVectorConstants1.packedValues[7u].x;
                }
                branchMergedValue37 = branchMergedValue70;
                branchMergedValue48 = branchMergedValue81;
                branchMergedValue49 = branchMergedValue82;
            }
            branchMergedValue1 = branchMergedValue37;
            branchMergedValue12 = branchMergedValue48;
            branchMergedValue13 = branchMergedValue49;
        }
        intermediateValue5 = branchMergedValue13;
        intermediateValue6 = branchMergedValue12;
        intermediateValue7 = branchMergedValue1;
    }
    float productValue3 = fragmentVectorConstants1.packedValues[0u].x * sampledTextureValue2;
    float exponentialValue = spvNMax(exp2(log2(spvNMax(multiplyAddValue9, 0.0) / productValue3) * intermediateValue5) * productValue3, 0.0);
    float exponentialValue1 = spvNMax(exp2(log2(spvNMax(multiplyAddValue10, 0.0) / productValue3) * intermediateValue6) * productValue3, 0.0);
    float exponentialValue2 = spvNMax(exp2(log2(spvNMax(multiplyAddValue11, 0.0) / productValue3) * intermediateValue7) * productValue3, 0.0);
    bool comparisonValue8 = fragmentVectorConstants1.packedValues[20u].w != 0.0;
    bool comparisonValue9 = fragmentVectorConstants1.packedValues[6u].w != 0.0;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if (comparisonValue6 && comparisonValue9)
    {
        intermediateValue8 = fragmentVectorConstants1.packedValues[6u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[6u].y;
        intermediateValue10 = fragmentVectorConstants1.packedValues[6u].z;
    }
    else
    {
        float productValue4 = fragmentVectorConstants1.packedValues[0u].z * sampledTextureValue2;
        bool comparisonValue10 = (dotProductValue <= productValue4) && comparisonValue8;
        float branchMergedValue2;
        float branchMergedValue14;
        float branchMergedValue15;
        if (comparisonValue10 || (fragmentVectorConstants1.packedValues[19u].w == 0.0))
        {
            branchMergedValue2 = comparisonValue10 ? fragmentVectorConstants1.packedValues[20u].y : 1.0;
            branchMergedValue14 = comparisonValue10 ? fragmentVectorConstants1.packedValues[20u].z : 1.0;
            branchMergedValue15 = comparisonValue10 ? fragmentVectorConstants1.packedValues[20u].x : 1.0;
        }
        else
        {
            float branchMergedValue38;
            float branchMergedValue50;
            float branchMergedValue51;
            if ((dotProductValue < sampledTextureValue2) && comparisonValue8)
            {
                float quotientValue11 = (dotProductValue - productValue4) / (sampledTextureValue2 - productValue4);
                branchMergedValue38 = (quotientValue11 * (fragmentVectorConstants1.packedValues[19u].y - fragmentVectorConstants1.packedValues[20u].y)) + fragmentVectorConstants1.packedValues[20u].y;
                branchMergedValue50 = (quotientValue11 * (fragmentVectorConstants1.packedValues[19u].z - fragmentVectorConstants1.packedValues[20u].z)) + fragmentVectorConstants1.packedValues[20u].z;
                branchMergedValue51 = (quotientValue11 * (fragmentVectorConstants1.packedValues[19u].x - fragmentVectorConstants1.packedValues[20u].x)) + fragmentVectorConstants1.packedValues[20u].x;
            }
            else
            {
                float branchMergedValue71;
                float branchMergedValue83;
                float branchMergedValue84;
                if ((dotProductValue > sampledTextureValue2) && comparisonValue9)
                {
                    float quotientValue12 = (dotProductValue - sampledTextureValue2) / (productValue1 - sampledTextureValue2);
                    branchMergedValue71 = (quotientValue12 * (fragmentVectorConstants1.packedValues[6u].y - fragmentVectorConstants1.packedValues[19u].y)) + fragmentVectorConstants1.packedValues[19u].y;
                    branchMergedValue83 = (quotientValue12 * (fragmentVectorConstants1.packedValues[6u].z - fragmentVectorConstants1.packedValues[19u].z)) + fragmentVectorConstants1.packedValues[19u].z;
                    branchMergedValue84 = (quotientValue12 * (fragmentVectorConstants1.packedValues[6u].x - fragmentVectorConstants1.packedValues[19u].x)) + fragmentVectorConstants1.packedValues[19u].x;
                }
                else
                {
                    branchMergedValue71 = fragmentVectorConstants1.packedValues[19u].y;
                    branchMergedValue83 = fragmentVectorConstants1.packedValues[19u].z;
                    branchMergedValue84 = fragmentVectorConstants1.packedValues[19u].x;
                }
                branchMergedValue38 = branchMergedValue71;
                branchMergedValue50 = branchMergedValue83;
                branchMergedValue51 = branchMergedValue84;
            }
            branchMergedValue2 = branchMergedValue38;
            branchMergedValue14 = branchMergedValue50;
            branchMergedValue15 = branchMergedValue51;
        }
        intermediateValue8 = branchMergedValue15;
        intermediateValue9 = branchMergedValue2;
        intermediateValue10 = branchMergedValue14;
    }
    float dotProductValue1 = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    bool comparisonValue11 = fragmentVectorConstants1.packedValues[11u].w != 0.0;
    bool comparisonValue12 = fragmentVectorConstants1.packedValues[9u].w != 0.0;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if (comparisonValue6 && comparisonValue12)
    {
        intermediateValue11 = fragmentVectorConstants1.packedValues[9u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[9u].y;
        intermediateValue13 = fragmentVectorConstants1.packedValues[9u].z;
    }
    else
    {
        float productValue5 = fragmentVectorConstants1.packedValues[0u].z * sampledTextureValue2;
        bool comparisonValue13 = (dotProductValue <= productValue5) && comparisonValue11;
        float branchMergedValue3;
        float branchMergedValue16;
        float branchMergedValue17;
        if (comparisonValue13 || (fragmentVectorConstants1.packedValues[10u].w == 0.0))
        {
            branchMergedValue3 = comparisonValue13 ? fragmentVectorConstants1.packedValues[11u].z : 1.0;
            branchMergedValue16 = comparisonValue13 ? fragmentVectorConstants1.packedValues[11u].y : 1.0;
            branchMergedValue17 = comparisonValue13 ? fragmentVectorConstants1.packedValues[11u].x : 1.0;
        }
        else
        {
            float branchMergedValue39;
            float branchMergedValue52;
            float branchMergedValue53;
            if ((dotProductValue < sampledTextureValue2) && comparisonValue11)
            {
                float quotientValue13 = (dotProductValue - productValue5) / (sampledTextureValue2 - productValue5);
                branchMergedValue39 = (quotientValue13 * (fragmentVectorConstants1.packedValues[10u].z - fragmentVectorConstants1.packedValues[11u].z)) + fragmentVectorConstants1.packedValues[11u].z;
                branchMergedValue52 = (quotientValue13 * (fragmentVectorConstants1.packedValues[10u].y - fragmentVectorConstants1.packedValues[11u].y)) + fragmentVectorConstants1.packedValues[11u].y;
                branchMergedValue53 = (quotientValue13 * (fragmentVectorConstants1.packedValues[10u].x - fragmentVectorConstants1.packedValues[11u].x)) + fragmentVectorConstants1.packedValues[11u].x;
            }
            else
            {
                float branchMergedValue72;
                float branchMergedValue85;
                float branchMergedValue86;
                if ((dotProductValue > sampledTextureValue2) && comparisonValue12)
                {
                    float quotientValue14 = (dotProductValue - sampledTextureValue2) / (productValue1 - sampledTextureValue2);
                    branchMergedValue72 = (quotientValue14 * (fragmentVectorConstants1.packedValues[9u].z - fragmentVectorConstants1.packedValues[10u].z)) + fragmentVectorConstants1.packedValues[10u].z;
                    branchMergedValue85 = (quotientValue14 * (fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[10u].y)) + fragmentVectorConstants1.packedValues[10u].y;
                    branchMergedValue86 = (quotientValue14 * (fragmentVectorConstants1.packedValues[9u].x - fragmentVectorConstants1.packedValues[10u].x)) + fragmentVectorConstants1.packedValues[10u].x;
                }
                else
                {
                    branchMergedValue72 = fragmentVectorConstants1.packedValues[10u].z;
                    branchMergedValue85 = fragmentVectorConstants1.packedValues[10u].y;
                    branchMergedValue86 = fragmentVectorConstants1.packedValues[10u].x;
                }
                branchMergedValue39 = branchMergedValue72;
                branchMergedValue52 = branchMergedValue85;
                branchMergedValue53 = branchMergedValue86;
            }
            branchMergedValue3 = branchMergedValue39;
            branchMergedValue16 = branchMergedValue52;
            branchMergedValue17 = branchMergedValue53;
        }
        intermediateValue11 = branchMergedValue17;
        intermediateValue12 = branchMergedValue16;
        intermediateValue13 = branchMergedValue3;
    }
    bool comparisonValue14 = fragmentVectorConstants1.packedValues[12u].w != 0.0;
    bool comparisonValue15 = fragmentVectorConstants1.packedValues[3u].w != 0.0;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if (comparisonValue6 && comparisonValue15)
    {
        intermediateValue14 = fragmentVectorConstants1.packedValues[3u].x;
        intermediateValue15 = fragmentVectorConstants1.packedValues[3u].y;
        intermediateValue16 = fragmentVectorConstants1.packedValues[3u].z;
    }
    else
    {
        float productValue6 = fragmentVectorConstants1.packedValues[0u].z * sampledTextureValue2;
        bool comparisonValue16 = (dotProductValue <= productValue6) && comparisonValue14;
        float branchMergedValue4;
        float branchMergedValue18;
        float branchMergedValue19;
        if (comparisonValue16 || (fragmentVectorConstants1.packedValues[13u].w == 0.0))
        {
            branchMergedValue4 = comparisonValue16 ? fragmentVectorConstants1.packedValues[12u].z : 0.0;
            branchMergedValue18 = comparisonValue16 ? fragmentVectorConstants1.packedValues[12u].y : 0.0;
            branchMergedValue19 = comparisonValue16 ? fragmentVectorConstants1.packedValues[12u].x : 0.0;
        }
        else
        {
            float branchMergedValue40;
            float branchMergedValue54;
            float branchMergedValue55;
            if ((dotProductValue < sampledTextureValue2) && comparisonValue14)
            {
                float quotientValue15 = (dotProductValue - productValue6) / (sampledTextureValue2 - productValue6);
                branchMergedValue40 = (quotientValue15 * (fragmentVectorConstants1.packedValues[13u].z - fragmentVectorConstants1.packedValues[12u].z)) + fragmentVectorConstants1.packedValues[12u].z;
                branchMergedValue54 = (quotientValue15 * (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[12u].y)) + fragmentVectorConstants1.packedValues[12u].y;
                branchMergedValue55 = (quotientValue15 * (fragmentVectorConstants1.packedValues[13u].x - fragmentVectorConstants1.packedValues[12u].x)) + fragmentVectorConstants1.packedValues[12u].x;
            }
            else
            {
                float branchMergedValue73;
                float branchMergedValue87;
                float branchMergedValue88;
                if ((dotProductValue > sampledTextureValue2) && comparisonValue15)
                {
                    float quotientValue16 = (dotProductValue - sampledTextureValue2) / (productValue1 - sampledTextureValue2);
                    branchMergedValue73 = (quotientValue16 * (fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[13u].z;
                    branchMergedValue87 = (quotientValue16 * (fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[13u].y)) + fragmentVectorConstants1.packedValues[13u].y;
                    branchMergedValue88 = (quotientValue16 * (fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[13u].x)) + fragmentVectorConstants1.packedValues[13u].x;
                }
                else
                {
                    branchMergedValue73 = fragmentVectorConstants1.packedValues[13u].z;
                    branchMergedValue87 = fragmentVectorConstants1.packedValues[13u].y;
                    branchMergedValue88 = fragmentVectorConstants1.packedValues[13u].x;
                }
                branchMergedValue40 = branchMergedValue73;
                branchMergedValue54 = branchMergedValue87;
                branchMergedValue55 = branchMergedValue88;
            }
            branchMergedValue4 = branchMergedValue40;
            branchMergedValue18 = branchMergedValue54;
            branchMergedValue19 = branchMergedValue55;
        }
        intermediateValue14 = branchMergedValue19;
        intermediateValue15 = branchMergedValue18;
        intermediateValue16 = branchMergedValue4;
    }
    float productValue7 = spvNMax((intermediateValue14 * sampledTextureValue2) + spvNMax(intermediateValue11 * spvNMax(((exponentialValue - dotProductValue1) * intermediateValue8) + dotProductValue1, 0.0), 0.0), 0.0);
    float productValue8 = spvNMax((intermediateValue15 * sampledTextureValue2) + spvNMax(intermediateValue12 * spvNMax(((exponentialValue1 - dotProductValue1) * intermediateValue9) + dotProductValue1, 0.0), 0.0), 0.0);
    float productValue9 = spvNMax((intermediateValue16 * sampledTextureValue2) + spvNMax(intermediateValue13 * spvNMax(((exponentialValue2 - dotProductValue1) * intermediateValue10) + dotProductValue1, 0.0), 0.0), 0.0);
    float quotientValue17 = (0.180000007152557373046875 / sampledTextureValue2) * intermediateValue4;
    float productValue10 = quotientValue17 * productValue7;
    float productValue11 = quotientValue17 * productValue8;
    float productValue12 = quotientValue17 * productValue9;
    float exponentialValue11;
    float exponentialValue12;
    float exponentialValue13;
    if (!(fragmentVectorConstants1.packedValues[18u].y >= 0.5))
    {
        float dotProductValue2 = dot(vec3(productValue7, productValue8, productValue9), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        bool comparisonValue17 = fragmentVectorConstants1.packedValues[14u].w != 0.0;
        bool comparisonValue18 = fragmentVectorConstants1.packedValues[4u].w != 0.0;
        float productValue13 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        if ((dotProductValue2 >= productValue13) && comparisonValue18)
        {
            intermediateValue17 = fragmentVectorConstants1.packedValues[4u].x;
            intermediateValue18 = fragmentVectorConstants1.packedValues[4u].y;
            intermediateValue19 = fragmentVectorConstants1.packedValues[4u].z;
        }
        else
        {
            float productValue14 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
            bool comparisonValue19 = (dotProductValue2 <= productValue14) && comparisonValue17;
            float branchMergedValue5;
            float branchMergedValue20;
            float branchMergedValue21;
            if (comparisonValue19 || (fragmentVectorConstants1.packedValues[15u].w == 0.0))
            {
                branchMergedValue5 = comparisonValue19 ? fragmentVectorConstants1.packedValues[14u].z : 2.2000000476837158203125;
                branchMergedValue20 = comparisonValue19 ? fragmentVectorConstants1.packedValues[14u].y : 2.2000000476837158203125;
                branchMergedValue21 = comparisonValue19 ? fragmentVectorConstants1.packedValues[14u].x : 2.2000000476837158203125;
            }
            else
            {
                float branchMergedValue41;
                float branchMergedValue56;
                float branchMergedValue57;
                if ((dotProductValue2 < 0.180000007152557373046875) && comparisonValue17)
                {
                    float quotientValue18 = (dotProductValue2 - productValue14) / (0.180000007152557373046875 - productValue14);
                    branchMergedValue41 = (quotientValue18 * (fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z)) + fragmentVectorConstants1.packedValues[14u].z;
                    branchMergedValue56 = (quotientValue18 * (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[14u].y;
                    branchMergedValue57 = (quotientValue18 * (fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[14u].x;
                }
                else
                {
                    float branchMergedValue74;
                    float branchMergedValue89;
                    float branchMergedValue90;
                    if ((dotProductValue2 > 0.180000007152557373046875) && comparisonValue18)
                    {
                        float quotientValue19 = (dotProductValue2 + (-0.180000007152557373046875)) / (productValue13 + (-0.180000007152557373046875));
                        branchMergedValue74 = (quotientValue19 * (fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z)) + fragmentVectorConstants1.packedValues[15u].z;
                        branchMergedValue89 = (quotientValue19 * (fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[15u].y;
                        branchMergedValue90 = (quotientValue19 * (fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[15u].x;
                    }
                    else
                    {
                        branchMergedValue74 = fragmentVectorConstants1.packedValues[15u].z;
                        branchMergedValue89 = fragmentVectorConstants1.packedValues[15u].y;
                        branchMergedValue90 = fragmentVectorConstants1.packedValues[15u].x;
                    }
                    branchMergedValue41 = branchMergedValue74;
                    branchMergedValue56 = branchMergedValue89;
                    branchMergedValue57 = branchMergedValue90;
                }
                branchMergedValue5 = branchMergedValue41;
                branchMergedValue20 = branchMergedValue56;
                branchMergedValue21 = branchMergedValue57;
            }
            intermediateValue17 = branchMergedValue21;
            intermediateValue18 = branchMergedValue20;
            intermediateValue19 = branchMergedValue5;
        }
        float productValue15 = intermediateValue17 * fragmentVectorConstants1.packedValues[0u].w;
        float productValue16 = intermediateValue18 * fragmentVectorConstants1.packedValues[0u].w;
        float productValue17 = intermediateValue19 * fragmentVectorConstants1.packedValues[0u].w;
        float nonlinearValue1;
        float nonlinearValue2;
        float nonlinearValue3;
        if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
        {
            nonlinearValue1 = log2(spvNMax(productValue7, 0.0)) * (1.0 / productValue15);
            nonlinearValue2 = log2(spvNMax(productValue8, 0.0)) * (1.0 / productValue16);
            nonlinearValue3 = log2(spvNMax(productValue9, 0.0)) * (1.0 / productValue17);
        }
        else
        {
            nonlinearValue1 = log2((productValue7 <= 0.003130800090730190277099609375) ? (productValue7 * 12.9200000762939453125) : ((exp2(log2(abs(productValue7)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue15);
            nonlinearValue2 = log2((productValue8 <= 0.003130800090730190277099609375) ? (productValue8 * 12.9200000762939453125) : ((exp2(log2(abs(productValue8)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue16);
            nonlinearValue3 = log2((productValue9 <= 0.003130800090730190277099609375) ? (productValue9 * 12.9200000762939453125) : ((exp2(log2(abs(productValue9)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue17);
        }
        exponentialValue11 = exp2(nonlinearValue1);
        exponentialValue12 = exp2(nonlinearValue2);
        exponentialValue13 = exp2(nonlinearValue3);
    }
    else
    {
        float comparisonValue20 = ((fragmentVectorConstants1.packedValues[22u].z < fragmentVectorConstants1.packedValues[22u].w) ? fragmentVectorConstants1.packedValues[22u].w : fragmentVectorConstants1.packedValues[22u].z) * quotientValue17;
        float productValue18 = comparisonValue20 * comparisonValue20;
        float branchMergedValue34;
        float branchMergedValue35;
        float branchMergedValue36;
        switch (uint(int(fragmentVectorConstants1.packedValues[18u].x)))
#endif
        {
            case 1u:
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                precise float quotientValue69 = productValue99 / productValue103;
                precise float quotientValue70 = productValue100 / productValue103;
                precise float quotientValue71 = productValue101 / productValue103;
                precise float sumValue42 = quotientValue69 + 1.0;
                precise float sumValue43 = quotientValue70 + 1.0;
                precise float sumValue44 = quotientValue71 + 1.0;
                precise float productValue104 = productValue99 * sumValue42;
                precise float productValue105 = productValue100 * sumValue43;
                precise float productValue106 = productValue101 * sumValue44;
                precise float multiplyAddValue104 = productValue104 / fma(multiplyAddValue101, productValue98, 1.0);
                precise float multiplyAddValue105 = productValue105 / fma(multiplyAddValue102, productValue98, 1.0);
                precise float multiplyAddValue106 = productValue106 / fma(multiplyAddValue103, productValue98, 1.0);
                float scalarValue51 = rdDot3Precise2(vec3(multiplyAddValue104, multiplyAddValue105, multiplyAddValue106), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue57 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue58 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue59 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                precise float productValue107 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                precise float productValue108 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                bool comparisonValue104 = comparisonValue57 && (scalarValue51 >= productValue107);
                bool comparisonValue105 = comparisonValue59 && (productValue108 >= scalarValue51);
                bool bitwiseValue46 = comparisonValue59 && (scalarValue51 < 0.180000007152557373046875);
                float scalarValue19 = -fragmentScalarConstants1.packedValues[2u];
                precise float multiplyAddValue107 = fma(scalarValue19, 0.180000007152557373046875, scalarValue51) / fma(scalarValue19, 0.180000007152557373046875, 0.180000007152557373046875);
                precise float sumValue45 = fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x;
                precise float sumValue46 = fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y;
                precise float sumValue47 = fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z;
                bool bitwiseValue47 = comparisonValue57 && (scalarValue51 > 0.180000007152557373046875);
                precise float sumValue48 = scalarValue51 - 0.180000007152557373046875;
                precise float multiplyAddValue108 = sumValue48 / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                precise float sumValue49 = fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x;
                precise float sumValue50 = fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y;
                precise float sumValue51 = fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z;
                bool comparisonValue62 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                precise float multiplyAddValue109 = (comparisonValue104 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue105 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue58 ? (bitwiseValue46 ? fma(multiplyAddValue107, sumValue45, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue47 ? fma(multiplyAddValue108, sumValue49, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue110 = (comparisonValue104 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue105 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue58 ? (bitwiseValue46 ? fma(multiplyAddValue107, sumValue46, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue47 ? fma(multiplyAddValue108, sumValue50, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue111 = (comparisonValue104 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue105 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue58 ? (bitwiseValue46 ? fma(multiplyAddValue107, sumValue47, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue47 ? fma(multiplyAddValue108, sumValue51, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float quotientValue72 = 1.0 / multiplyAddValue109;
                precise float quotientValue73 = 1.0 / multiplyAddValue110;
                precise float quotientValue74 = 1.0 / multiplyAddValue111;
                precise float nonlinearValue14 = quotientValue72 * log2(spvNMax(multiplyAddValue104, 0.0));
                precise float nonlinearValue15 = quotientValue73 * log2(spvNMax(multiplyAddValue105, 0.0));
                precise float nonlinearValue16 = quotientValue74 * log2(spvNMax(multiplyAddValue106, 0.0));
                precise float productValue109 = multiplyAddValue104 * 12.9200000762939453125;
                precise float productValue110 = multiplyAddValue105 * 12.9200000762939453125;
                precise float productValue111 = multiplyAddValue106 * 12.9200000762939453125;
                precise float nonlinearValue17 = log2(abs(multiplyAddValue104)) * 0.4166666567325592041015625;
                precise float nonlinearValue18 = log2(abs(multiplyAddValue105)) * 0.4166666567325592041015625;
                precise float nonlinearValue19 = log2(abs(multiplyAddValue106)) * 0.4166666567325592041015625;
                precise float quotientValue75 = 2.2000000476837158203125 / multiplyAddValue109;
                precise float quotientValue76 = 2.2000000476837158203125 / multiplyAddValue110;
                precise float quotientValue77 = 2.2000000476837158203125 / multiplyAddValue111;
                precise float multiplyAddValue112 = log2((multiplyAddValue104 <= 0.003130800090730190277099609375) ? productValue109 : fma(exp2(nonlinearValue17), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue75;
                precise float multiplyAddValue113 = log2((multiplyAddValue105 <= 0.003130800090730190277099609375) ? productValue110 : fma(exp2(nonlinearValue18), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue76;
                precise float multiplyAddValue114 = log2((multiplyAddValue106 <= 0.003130800090730190277099609375) ? productValue111 : fma(exp2(nonlinearValue19), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue77;
                exponentialValue13 = comparisonValue62 ? exp2(nonlinearValue14) : exp2(multiplyAddValue112);
                exponentialValue12 = comparisonValue62 ? exp2(nonlinearValue15) : exp2(multiplyAddValue113);
                exponentialValue11 = comparisonValue62 ? exp2(nonlinearValue16) : exp2(multiplyAddValue114);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float multiplyAddValue30 = (productValue73 * ((productValue73 / productValue77) + 1.0)) / fma(multiplyAddValue27, quotientValue51, 1.0);
                float multiplyAddValue31 = (productValue74 * ((productValue74 / productValue77) + 1.0)) / fma(multiplyAddValue28, quotientValue51, 1.0);
                float multiplyAddValue32 = (productValue75 * ((productValue75 / productValue77) + 1.0)) / fma(multiplyAddValue29, quotientValue51, 1.0);
                float scalarValue18 = rdDot3Precise2(vec3(multiplyAddValue30, multiplyAddValue31, multiplyAddValue32), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue57 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue58 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue59 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                bool comparisonValue60 = comparisonValue57 && (scalarValue18 >= (fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875));
                bool comparisonValue61 = comparisonValue59 && ((fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875) >= scalarValue18);
                bool bitwiseValue16 = comparisonValue59 && (scalarValue18 < 0.180000007152557373046875);
                float scalarValue19 = -fragmentScalarConstants1.packedValues[2u];
                float multiplyAddValue33 = fma(scalarValue19, 0.180000007152557373046875, scalarValue18) / fma(scalarValue19, 0.180000007152557373046875, 0.180000007152557373046875);
                bool bitwiseValue17 = comparisonValue57 && (scalarValue18 > 0.180000007152557373046875);
                float multiplyAddValue34 = (scalarValue18 - 0.180000007152557373046875) / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                bool comparisonValue62 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                float multiplyAddValue35 = (comparisonValue60 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue61 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue58 ? (bitwiseValue16 ? fma(multiplyAddValue33, fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue17 ? fma(multiplyAddValue34, fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue36 = (comparisonValue60 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue61 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue58 ? (bitwiseValue16 ? fma(multiplyAddValue33, fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue17 ? fma(multiplyAddValue34, fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue37 = (comparisonValue60 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue61 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue58 ? (bitwiseValue16 ? fma(multiplyAddValue33, fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue17 ? fma(multiplyAddValue34, fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                multiplyAddValue64 = comparisonValue62 ? exp2((1.0 / multiplyAddValue35) * log2(spvNMax(multiplyAddValue30, 0.0))) : exp2(log2((multiplyAddValue30 <= 0.003130800090730190277099609375) ? (multiplyAddValue30 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue30)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue35));
                multiplyAddValue63 = comparisonValue62 ? exp2((1.0 / multiplyAddValue36) * log2(spvNMax(multiplyAddValue31, 0.0))) : exp2(log2((multiplyAddValue31 <= 0.003130800090730190277099609375) ? (multiplyAddValue31 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue31)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue36));
                multiplyAddValue62 = comparisonValue62 ? exp2((1.0 / multiplyAddValue37) * log2(spvNMax(multiplyAddValue32, 0.0))) : exp2(log2((multiplyAddValue32 <= 0.003130800090730190277099609375) ? (multiplyAddValue32 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue32)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue37));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float quotientValue20 = (((productValue10 / productValue18) + 1.0) * productValue10) / (productValue10 + 1.0);
                float quotientValue21 = (((productValue11 / productValue18) + 1.0) * productValue11) / (productValue11 + 1.0);
                float quotientValue22 = (((productValue12 / productValue18) + 1.0) * productValue12) / (productValue12 + 1.0);
                float dotProductValue3 = dot(vec3(quotientValue20, quotientValue21, quotientValue22), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue21 = fragmentVectorConstants1.packedValues[14u].w != 0.0;
                bool comparisonValue22 = fragmentVectorConstants1.packedValues[4u].w != 0.0;
                float productValue19 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                float intermediateValue24;
                float intermediateValue25;
                float intermediateValue26;
                if ((dotProductValue3 >= productValue19) && comparisonValue22)
                {
                    intermediateValue24 = fragmentVectorConstants1.packedValues[4u].x;
                    intermediateValue25 = fragmentVectorConstants1.packedValues[4u].y;
                    intermediateValue26 = fragmentVectorConstants1.packedValues[4u].z;
                }
                else
                {
                    float productValue20 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                    bool comparisonValue23 = (dotProductValue3 <= productValue20) && comparisonValue21;
                    float branchMergedValue7;
                    float branchMergedValue24;
                    float branchMergedValue25;
                    if (comparisonValue23 || (fragmentVectorConstants1.packedValues[15u].w == 0.0))
                    {
                        branchMergedValue7 = comparisonValue23 ? fragmentVectorConstants1.packedValues[14u].z : 2.2000000476837158203125;
                        branchMergedValue24 = comparisonValue23 ? fragmentVectorConstants1.packedValues[14u].y : 2.2000000476837158203125;
                        branchMergedValue25 = comparisonValue23 ? fragmentVectorConstants1.packedValues[14u].x : 2.2000000476837158203125;
                    }
                    else
                    {
                        float branchMergedValue43;
                        float branchMergedValue60;
                        float branchMergedValue61;
                        if ((dotProductValue3 < 0.180000007152557373046875) && comparisonValue21)
                        {
                            float quotientValue23 = (dotProductValue3 - productValue20) / (0.180000007152557373046875 - productValue20);
                            branchMergedValue43 = (quotientValue23 * (fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z)) + fragmentVectorConstants1.packedValues[14u].z;
                            branchMergedValue60 = (quotientValue23 * (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[14u].y;
                            branchMergedValue61 = (quotientValue23 * (fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[14u].x;
                        }
                        else
                        {
                            float branchMergedValue76;
                            float branchMergedValue93;
                            float branchMergedValue94;
                            if ((dotProductValue3 > 0.180000007152557373046875) && comparisonValue22)
                            {
                                float quotientValue24 = (dotProductValue3 + (-0.180000007152557373046875)) / (productValue19 + (-0.180000007152557373046875));
                                branchMergedValue76 = (quotientValue24 * (fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z)) + fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue93 = (quotientValue24 * (fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[15u].y;
                                branchMergedValue94 = (quotientValue24 * (fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[15u].x;
                            }
                            else
                            {
                                branchMergedValue76 = fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue93 = fragmentVectorConstants1.packedValues[15u].y;
                                branchMergedValue94 = fragmentVectorConstants1.packedValues[15u].x;
                            }
                            branchMergedValue43 = branchMergedValue76;
                            branchMergedValue60 = branchMergedValue93;
                            branchMergedValue61 = branchMergedValue94;
                        }
                        branchMergedValue7 = branchMergedValue43;
                        branchMergedValue24 = branchMergedValue60;
                        branchMergedValue25 = branchMergedValue61;
                    }
                    intermediateValue24 = branchMergedValue25;
                    intermediateValue25 = branchMergedValue24;
                    intermediateValue26 = branchMergedValue7;
                }
                float productValue21 = intermediateValue24 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue22 = intermediateValue25 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue23 = intermediateValue26 * fragmentVectorConstants1.packedValues[0u].w;
                if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
                {
                    branchMergedValue34 = exp2(log2(spvNMax(quotientValue22, 0.0)) * (1.0 / productValue23));
                    branchMergedValue35 = exp2(log2(spvNMax(quotientValue21, 0.0)) * (1.0 / productValue22));
                    branchMergedValue36 = exp2(log2(spvNMax(quotientValue20, 0.0)) * (1.0 / productValue21));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((quotientValue22 <= 0.003130800090730190277099609375) ? (quotientValue22 * 12.9200000762939453125) : ((exp2(log2(abs(quotientValue22)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue23));
                    branchMergedValue35 = exp2(log2((quotientValue21 <= 0.003130800090730190277099609375) ? (quotientValue21 * 12.9200000762939453125) : ((exp2(log2(abs(quotientValue21)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue22));
                    branchMergedValue36 = exp2(log2((quotientValue20 <= 0.003130800090730190277099609375) ? (quotientValue20 * 12.9200000762939453125) : ((exp2(log2(abs(quotientValue20)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue21));
                    break;
                }
#endif
                break;
            }
            case 2u:
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float scalarValue52 = rdDot3Precise2(vectorValue7, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                precise float quotientValue78 = scalarValue52 / productValue103;
                precise float sumValue52 = quotientValue78 + 1.0;
                precise float productValue112 = scalarValue52 * sumValue52;
                precise float sumValue53 = scalarValue52 + 1.0;
                precise float quotientValue79 = productValue112 / sumValue53;
                precise float quotientValue80 = quotientValue79 / scalarValue52;
                precise float productValue113 = productValue99 * quotientValue80;
                precise float productValue114 = productValue100 * quotientValue80;
                precise float productValue115 = productValue101 * quotientValue80;
                float scalarValue53 = rdDot3Precise2(vec3(productValue113, productValue114, productValue115), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue63 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue64 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue65 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                precise float productValue116 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                precise float productValue117 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                bool comparisonValue106 = comparisonValue63 && (scalarValue53 >= productValue116);
                bool comparisonValue107 = comparisonValue65 && (productValue117 >= scalarValue53);
                bool bitwiseValue48 = comparisonValue65 && (scalarValue53 < 0.180000007152557373046875);
                float scalarValue22 = -fragmentScalarConstants1.packedValues[2u];
                precise float multiplyAddValue115 = fma(scalarValue22, 0.180000007152557373046875, scalarValue53) / fma(scalarValue22, 0.180000007152557373046875, 0.180000007152557373046875);
                precise float sumValue54 = fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x;
                precise float sumValue55 = fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y;
                precise float sumValue56 = fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z;
                bool bitwiseValue49 = comparisonValue63 && (scalarValue53 > 0.180000007152557373046875);
                precise float sumValue57 = scalarValue53 - 0.180000007152557373046875;
                precise float multiplyAddValue116 = sumValue57 / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                precise float sumValue58 = fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x;
                precise float sumValue59 = fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y;
                precise float sumValue60 = fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z;
                bool comparisonValue68 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                precise float multiplyAddValue117 = (comparisonValue106 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue107 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue64 ? (bitwiseValue48 ? fma(multiplyAddValue115, sumValue54, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue49 ? fma(multiplyAddValue116, sumValue58, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue118 = (comparisonValue106 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue107 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue64 ? (bitwiseValue48 ? fma(multiplyAddValue115, sumValue55, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue49 ? fma(multiplyAddValue116, sumValue59, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue119 = (comparisonValue106 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue107 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue64 ? (bitwiseValue48 ? fma(multiplyAddValue115, sumValue56, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue49 ? fma(multiplyAddValue116, sumValue60, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float quotientValue81 = 1.0 / multiplyAddValue117;
                precise float quotientValue82 = 1.0 / multiplyAddValue118;
                precise float quotientValue83 = 1.0 / multiplyAddValue119;
                precise float nonlinearValue20 = quotientValue81 * log2(spvNMax(productValue113, 0.0));
                precise float nonlinearValue21 = quotientValue82 * log2(spvNMax(productValue114, 0.0));
                precise float nonlinearValue22 = quotientValue83 * log2(spvNMax(productValue115, 0.0));
                precise float productValue118 = productValue113 * 12.9200000762939453125;
                precise float productValue119 = productValue114 * 12.9200000762939453125;
                precise float productValue120 = productValue115 * 12.9200000762939453125;
                precise float nonlinearValue23 = log2(abs(productValue113)) * 0.4166666567325592041015625;
                precise float nonlinearValue24 = log2(abs(productValue114)) * 0.4166666567325592041015625;
                precise float nonlinearValue25 = log2(abs(productValue115)) * 0.4166666567325592041015625;
                precise float quotientValue84 = 2.2000000476837158203125 / multiplyAddValue117;
                precise float quotientValue85 = 2.2000000476837158203125 / multiplyAddValue118;
                precise float quotientValue86 = 2.2000000476837158203125 / multiplyAddValue119;
                precise float multiplyAddValue120 = log2((productValue113 <= 0.003130800090730190277099609375) ? productValue118 : fma(exp2(nonlinearValue23), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue84;
                precise float multiplyAddValue121 = log2((productValue114 <= 0.003130800090730190277099609375) ? productValue119 : fma(exp2(nonlinearValue24), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue85;
                precise float multiplyAddValue122 = log2((productValue115 <= 0.003130800090730190277099609375) ? productValue120 : fma(exp2(nonlinearValue25), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue86;
                exponentialValue13 = comparisonValue68 ? exp2(nonlinearValue20) : exp2(multiplyAddValue120);
                exponentialValue12 = comparisonValue68 ? exp2(nonlinearValue21) : exp2(multiplyAddValue121);
                exponentialValue11 = comparisonValue68 ? exp2(nonlinearValue22) : exp2(multiplyAddValue122);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue20 = rdDot3Precise2(vectorValue1, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                float quotientValue52 = ((scalarValue20 * ((scalarValue20 / productValue77) + 1.0)) / (scalarValue20 + 1.0)) / scalarValue20;
                float productValue78 = productValue73 * quotientValue52;
                float productValue79 = productValue74 * quotientValue52;
                float productValue80 = productValue75 * quotientValue52;
                float scalarValue21 = rdDot3Precise2(vec3(productValue78, productValue79, productValue80), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue63 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue64 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue65 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                bool comparisonValue66 = comparisonValue63 && (scalarValue21 >= (fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875));
                bool comparisonValue67 = comparisonValue65 && ((fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875) >= scalarValue21);
                bool bitwiseValue18 = comparisonValue65 && (scalarValue21 < 0.180000007152557373046875);
                float scalarValue22 = -fragmentScalarConstants1.packedValues[2u];
                float multiplyAddValue38 = fma(scalarValue22, 0.180000007152557373046875, scalarValue21) / fma(scalarValue22, 0.180000007152557373046875, 0.180000007152557373046875);
                bool bitwiseValue19 = comparisonValue63 && (scalarValue21 > 0.180000007152557373046875);
                float multiplyAddValue39 = (scalarValue21 - 0.180000007152557373046875) / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                bool comparisonValue68 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                float multiplyAddValue40 = (comparisonValue66 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue67 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue64 ? (bitwiseValue18 ? fma(multiplyAddValue38, fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue19 ? fma(multiplyAddValue39, fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue41 = (comparisonValue66 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue67 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue64 ? (bitwiseValue18 ? fma(multiplyAddValue38, fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue19 ? fma(multiplyAddValue39, fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue42 = (comparisonValue66 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue67 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue64 ? (bitwiseValue18 ? fma(multiplyAddValue38, fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue19 ? fma(multiplyAddValue39, fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                multiplyAddValue64 = comparisonValue68 ? exp2((1.0 / multiplyAddValue40) * log2(spvNMax(productValue78, 0.0))) : exp2(log2((productValue78 <= 0.003130800090730190277099609375) ? (productValue78 * 12.9200000762939453125) : fma(exp2(log2(abs(productValue78)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue40));
                multiplyAddValue63 = comparisonValue68 ? exp2((1.0 / multiplyAddValue41) * log2(spvNMax(productValue79, 0.0))) : exp2(log2((productValue79 <= 0.003130800090730190277099609375) ? (productValue79 * 12.9200000762939453125) : fma(exp2(log2(abs(productValue79)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue41));
                multiplyAddValue62 = comparisonValue68 ? exp2((1.0 / multiplyAddValue42) * log2(spvNMax(productValue80, 0.0))) : exp2(log2((productValue80 <= 0.003130800090730190277099609375) ? (productValue80 * 12.9200000762939453125) : fma(exp2(log2(abs(productValue80)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue42));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float dotProductValue4 = dot(vec3(productValue10, productValue11, productValue12), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                float quotientValue25 = (((dotProductValue4 / productValue18) + 1.0) * dotProductValue4) / ((dotProductValue4 + 1.0) * dotProductValue4);
                float productValue24 = quotientValue25 * productValue10;
                float productValue25 = quotientValue25 * productValue11;
                float productValue26 = quotientValue25 * productValue12;
                float dotProductValue5 = dot(vec3(productValue24, productValue25, productValue26), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue24 = fragmentVectorConstants1.packedValues[14u].w != 0.0;
                bool comparisonValue25 = fragmentVectorConstants1.packedValues[4u].w != 0.0;
                float productValue27 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                float intermediateValue27;
                float intermediateValue28;
                float intermediateValue29;
                if ((dotProductValue5 >= productValue27) && comparisonValue25)
                {
                    intermediateValue27 = fragmentVectorConstants1.packedValues[4u].x;
                    intermediateValue28 = fragmentVectorConstants1.packedValues[4u].y;
                    intermediateValue29 = fragmentVectorConstants1.packedValues[4u].z;
                }
                else
                {
                    float productValue28 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                    bool comparisonValue26 = (dotProductValue5 <= productValue28) && comparisonValue24;
                    float branchMergedValue8;
                    float branchMergedValue26;
                    float branchMergedValue27;
                    if (comparisonValue26 || (fragmentVectorConstants1.packedValues[15u].w == 0.0))
                    {
                        branchMergedValue8 = comparisonValue26 ? fragmentVectorConstants1.packedValues[14u].z : 2.2000000476837158203125;
                        branchMergedValue26 = comparisonValue26 ? fragmentVectorConstants1.packedValues[14u].y : 2.2000000476837158203125;
                        branchMergedValue27 = comparisonValue26 ? fragmentVectorConstants1.packedValues[14u].x : 2.2000000476837158203125;
                    }
                    else
                    {
                        float branchMergedValue44;
                        float branchMergedValue62;
                        float branchMergedValue63;
                        if ((dotProductValue5 < 0.180000007152557373046875) && comparisonValue24)
                        {
                            float quotientValue26 = (dotProductValue5 - productValue28) / (0.180000007152557373046875 - productValue28);
                            branchMergedValue44 = (quotientValue26 * (fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z)) + fragmentVectorConstants1.packedValues[14u].z;
                            branchMergedValue62 = (quotientValue26 * (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[14u].y;
                            branchMergedValue63 = (quotientValue26 * (fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[14u].x;
                        }
                        else
                        {
                            float branchMergedValue77;
                            float branchMergedValue95;
                            float branchMergedValue96;
                            if ((dotProductValue5 > 0.180000007152557373046875) && comparisonValue25)
                            {
                                float quotientValue27 = (dotProductValue5 + (-0.180000007152557373046875)) / (productValue27 + (-0.180000007152557373046875));
                                branchMergedValue77 = (quotientValue27 * (fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z)) + fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue95 = (quotientValue27 * (fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[15u].y;
                                branchMergedValue96 = (quotientValue27 * (fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[15u].x;
                            }
                            else
                            {
                                branchMergedValue77 = fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue95 = fragmentVectorConstants1.packedValues[15u].y;
                                branchMergedValue96 = fragmentVectorConstants1.packedValues[15u].x;
                            }
                            branchMergedValue44 = branchMergedValue77;
                            branchMergedValue62 = branchMergedValue95;
                            branchMergedValue63 = branchMergedValue96;
                        }
                        branchMergedValue8 = branchMergedValue44;
                        branchMergedValue26 = branchMergedValue62;
                        branchMergedValue27 = branchMergedValue63;
                    }
                    intermediateValue27 = branchMergedValue27;
                    intermediateValue28 = branchMergedValue26;
                    intermediateValue29 = branchMergedValue8;
                }
                float productValue29 = intermediateValue27 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue30 = intermediateValue28 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue31 = intermediateValue29 * fragmentVectorConstants1.packedValues[0u].w;
                if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
                {
                    branchMergedValue34 = exp2(log2(spvNMax(productValue26, 0.0)) * (1.0 / productValue31));
                    branchMergedValue35 = exp2(log2(spvNMax(productValue25, 0.0)) * (1.0 / productValue30));
                    branchMergedValue36 = exp2(log2(spvNMax(productValue24, 0.0)) * (1.0 / productValue29));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((productValue26 <= 0.003130800090730190277099609375) ? (productValue26 * 12.9200000762939453125) : ((exp2(log2(abs(productValue26)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue31));
                    branchMergedValue35 = exp2(log2((productValue25 <= 0.003130800090730190277099609375) ? (productValue25 * 12.9200000762939453125) : ((exp2(log2(abs(productValue25)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue30));
                    branchMergedValue36 = exp2(log2((productValue24 <= 0.003130800090730190277099609375) ? (productValue24 * 12.9200000762939453125) : ((exp2(log2(abs(productValue24)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue29));
                    break;
                }
#endif
                break;
            }
            case 3u:
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                precise float sumValue61 = productValue99 + productValue99;
                precise float sumValue62 = productValue100 + productValue100;
                precise float sumValue63 = productValue101 + productValue101;
                precise float multiplyAddValue123 = fma(sumValue61, fma(productValue99, 0.300000011920928955078125, 0.0500000007450580596923828125), 0.0040000001899898052215576171875) / fma(sumValue61, fma(productValue99, 0.300000011920928955078125, 0.5), 0.060000002384185791015625);
                precise float multiplyAddValue124 = fma(sumValue62, fma(productValue100, 0.300000011920928955078125, 0.0500000007450580596923828125), 0.0040000001899898052215576171875) / fma(sumValue62, fma(productValue100, 0.300000011920928955078125, 0.5), 0.060000002384185791015625);
                precise float multiplyAddValue125 = fma(sumValue63, fma(productValue101, 0.300000011920928955078125, 0.0500000007450580596923828125), 0.0040000001899898052215576171875) / fma(sumValue63, fma(productValue101, 0.300000011920928955078125, 0.5), 0.060000002384185791015625);
                precise float sumValue64 = multiplyAddValue123 - 0.066666662693023681640625;
                precise float sumValue65 = multiplyAddValue124 - 0.066666662693023681640625;
                precise float sumValue66 = multiplyAddValue125 - 0.066666662693023681640625;
                precise float multiplyAddValue126 = fma(productValue103, fma(productValue103, 0.1500000059604644775390625, 0.0500000007450580596923828125), 0.0040000001899898052215576171875) / fma(productValue103, fma(productValue103, 0.1500000059604644775390625, 0.5), 0.060000002384185791015625);
                precise float sumValue67 = multiplyAddValue126 - 0.066666662693023681640625;
                precise float quotientValue87 = 1.0 / sumValue67;
                precise float productValue121 = quotientValue87 * sumValue64;
                precise float productValue122 = quotientValue87 * sumValue65;
                precise float productValue123 = quotientValue87 * sumValue66;
                float scalarValue54 = rdDot3Precise2(vec3(productValue121, productValue122, productValue123), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue69 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue70 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue71 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                precise float productValue124 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                precise float productValue125 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                bool comparisonValue108 = comparisonValue69 && (scalarValue54 >= productValue124);
                bool comparisonValue109 = comparisonValue71 && (productValue125 >= scalarValue54);
                bool bitwiseValue50 = comparisonValue71 && (scalarValue54 < 0.180000007152557373046875);
                float scalarValue24 = -fragmentScalarConstants1.packedValues[2u];
                precise float multiplyAddValue127 = fma(scalarValue24, 0.180000007152557373046875, scalarValue54) / fma(scalarValue24, 0.180000007152557373046875, 0.180000007152557373046875);
                precise float sumValue68 = fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x;
                precise float sumValue69 = fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y;
                precise float sumValue70 = fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z;
                bool bitwiseValue51 = comparisonValue69 && (scalarValue54 > 0.180000007152557373046875);
                precise float sumValue71 = scalarValue54 - 0.180000007152557373046875;
                precise float multiplyAddValue128 = sumValue71 / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                precise float sumValue72 = fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x;
                precise float sumValue73 = fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y;
                precise float sumValue74 = fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z;
                bool comparisonValue74 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                precise float multiplyAddValue129 = (comparisonValue108 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue109 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue70 ? (bitwiseValue50 ? fma(multiplyAddValue127, sumValue68, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue51 ? fma(multiplyAddValue128, sumValue72, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue130 = (comparisonValue108 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue109 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue70 ? (bitwiseValue50 ? fma(multiplyAddValue127, sumValue69, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue51 ? fma(multiplyAddValue128, sumValue73, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue131 = (comparisonValue108 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue109 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue70 ? (bitwiseValue50 ? fma(multiplyAddValue127, sumValue70, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue51 ? fma(multiplyAddValue128, sumValue74, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float quotientValue88 = 1.0 / multiplyAddValue129;
                precise float quotientValue89 = 1.0 / multiplyAddValue130;
                precise float quotientValue90 = 1.0 / multiplyAddValue131;
                precise float nonlinearValue26 = quotientValue88 * log2(spvNMax(productValue121, 0.0));
                precise float nonlinearValue27 = quotientValue89 * log2(spvNMax(productValue122, 0.0));
                precise float nonlinearValue28 = quotientValue90 * log2(spvNMax(productValue123, 0.0));
                precise float productValue126 = productValue121 * 12.9200000762939453125;
                precise float productValue127 = productValue122 * 12.9200000762939453125;
                precise float productValue128 = productValue123 * 12.9200000762939453125;
                precise float nonlinearValue29 = log2(abs(productValue121)) * 0.4166666567325592041015625;
                precise float nonlinearValue30 = log2(abs(productValue122)) * 0.4166666567325592041015625;
                precise float nonlinearValue31 = log2(abs(productValue123)) * 0.4166666567325592041015625;
                precise float quotientValue91 = 2.2000000476837158203125 / multiplyAddValue129;
                precise float quotientValue92 = 2.2000000476837158203125 / multiplyAddValue130;
                precise float quotientValue93 = 2.2000000476837158203125 / multiplyAddValue131;
                precise float multiplyAddValue132 = log2((productValue121 <= 0.003130800090730190277099609375) ? productValue126 : fma(exp2(nonlinearValue29), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue91;
                precise float multiplyAddValue133 = log2((productValue122 <= 0.003130800090730190277099609375) ? productValue127 : fma(exp2(nonlinearValue30), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue92;
                precise float multiplyAddValue134 = log2((productValue123 <= 0.003130800090730190277099609375) ? productValue128 : fma(exp2(nonlinearValue31), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue93;
                exponentialValue13 = comparisonValue74 ? exp2(nonlinearValue26) : exp2(multiplyAddValue132);
                exponentialValue12 = comparisonValue74 ? exp2(nonlinearValue27) : exp2(multiplyAddValue133);
                exponentialValue11 = comparisonValue74 ? exp2(nonlinearValue28) : exp2(multiplyAddValue134);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float sumValue1 = productValue73 + productValue73;
                float sumValue2 = productValue74 + productValue74;
                float sumValue3 = productValue75 + productValue75;
                float multiplyAddValue43 = 1.0 / ((fma(productValue77, fma(productValue77, 0.1500000059604644775390625, 0.0500000007450580596923828125), 0.0040000001899898052215576171875) / fma(productValue77, fma(productValue77, 0.1500000059604644775390625, 0.5), 0.060000002384185791015625)) - 0.066666662693023681640625);
                float multiplyAddValue44 = multiplyAddValue43 * ((fma(sumValue1, fma(productValue73, 0.300000011920928955078125, 0.0500000007450580596923828125), 0.0040000001899898052215576171875) / fma(sumValue1, fma(productValue73, 0.300000011920928955078125, 0.5), 0.060000002384185791015625)) - 0.066666662693023681640625);
                float multiplyAddValue45 = multiplyAddValue43 * ((fma(sumValue2, fma(productValue74, 0.300000011920928955078125, 0.0500000007450580596923828125), 0.0040000001899898052215576171875) / fma(sumValue2, fma(productValue74, 0.300000011920928955078125, 0.5), 0.060000002384185791015625)) - 0.066666662693023681640625);
                float multiplyAddValue46 = multiplyAddValue43 * ((fma(sumValue3, fma(productValue75, 0.300000011920928955078125, 0.0500000007450580596923828125), 0.0040000001899898052215576171875) / fma(sumValue3, fma(productValue75, 0.300000011920928955078125, 0.5), 0.060000002384185791015625)) - 0.066666662693023681640625);
                float scalarValue23 = rdDot3Precise2(vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue69 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue70 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue71 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                bool comparisonValue72 = comparisonValue69 && (scalarValue23 >= (fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875));
                bool comparisonValue73 = comparisonValue71 && ((fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875) >= scalarValue23);
                bool bitwiseValue20 = comparisonValue71 && (scalarValue23 < 0.180000007152557373046875);
                float scalarValue24 = -fragmentScalarConstants1.packedValues[2u];
                float multiplyAddValue47 = fma(scalarValue24, 0.180000007152557373046875, scalarValue23) / fma(scalarValue24, 0.180000007152557373046875, 0.180000007152557373046875);
                bool bitwiseValue21 = comparisonValue69 && (scalarValue23 > 0.180000007152557373046875);
                float multiplyAddValue48 = (scalarValue23 - 0.180000007152557373046875) / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                bool comparisonValue74 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                float multiplyAddValue49 = (comparisonValue72 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue73 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue70 ? (bitwiseValue20 ? fma(multiplyAddValue47, fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue21 ? fma(multiplyAddValue48, fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue50 = (comparisonValue72 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue73 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue70 ? (bitwiseValue20 ? fma(multiplyAddValue47, fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue21 ? fma(multiplyAddValue48, fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue51 = (comparisonValue72 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue73 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue70 ? (bitwiseValue20 ? fma(multiplyAddValue47, fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue21 ? fma(multiplyAddValue48, fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                multiplyAddValue64 = comparisonValue74 ? exp2((1.0 / multiplyAddValue49) * log2(spvNMax(multiplyAddValue44, 0.0))) : exp2(log2((multiplyAddValue44 <= 0.003130800090730190277099609375) ? (multiplyAddValue44 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue44)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue49));
                multiplyAddValue63 = comparisonValue74 ? exp2((1.0 / multiplyAddValue50) * log2(spvNMax(multiplyAddValue45, 0.0))) : exp2(log2((multiplyAddValue45 <= 0.003130800090730190277099609375) ? (multiplyAddValue45 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue45)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue50));
                multiplyAddValue62 = comparisonValue74 ? exp2((1.0 / multiplyAddValue51) * log2(spvNMax(multiplyAddValue46, 0.0))) : exp2(log2((multiplyAddValue46 <= 0.003130800090730190277099609375) ? (multiplyAddValue46 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue46)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue51));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float productValue32 = productValue10 * 2.0;
                float productValue33 = productValue11 * 2.0;
                float productValue34 = productValue12 * 2.0;
                float productValue35 = productValue10 * 0.300000011920928955078125;
                float productValue36 = productValue11 * 0.300000011920928955078125;
                float productValue37 = productValue12 * 0.300000011920928955078125;
                float productValue38 = productValue18 * 0.1500000059604644775390625;
                float quotientValue28 = 1.0 / (((((productValue38 + 0.0500000007450580596923828125) * productValue18) + 0.0040000001899898052215576171875) / (((productValue38 + 0.5) * productValue18) + 0.060000002384185791015625)) + (-0.066666662693023681640625));
                float quotientValue29 = quotientValue28 * (((((productValue35 + 0.0500000007450580596923828125) * productValue32) + 0.0040000001899898052215576171875) / (((productValue35 + 0.5) * productValue32) + 0.060000002384185791015625)) + (-0.066666662693023681640625));
                float quotientValue30 = quotientValue28 * (((((productValue36 + 0.0500000007450580596923828125) * productValue33) + 0.0040000001899898052215576171875) / (((productValue36 + 0.5) * productValue33) + 0.060000002384185791015625)) + (-0.066666662693023681640625));
                float quotientValue31 = quotientValue28 * (((((productValue37 + 0.0500000007450580596923828125) * productValue34) + 0.0040000001899898052215576171875) / (((productValue37 + 0.5) * productValue34) + 0.060000002384185791015625)) + (-0.066666662693023681640625));
                float dotProductValue6 = dot(vec3(quotientValue29, quotientValue30, quotientValue31), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue27 = fragmentVectorConstants1.packedValues[14u].w != 0.0;
                bool comparisonValue28 = fragmentVectorConstants1.packedValues[4u].w != 0.0;
                float productValue39 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                float intermediateValue30;
                float intermediateValue31;
                float intermediateValue32;
                if ((dotProductValue6 >= productValue39) && comparisonValue28)
                {
                    intermediateValue30 = fragmentVectorConstants1.packedValues[4u].x;
                    intermediateValue31 = fragmentVectorConstants1.packedValues[4u].y;
                    intermediateValue32 = fragmentVectorConstants1.packedValues[4u].z;
                }
                else
                {
                    float productValue40 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                    bool comparisonValue29 = (dotProductValue6 <= productValue40) && comparisonValue27;
                    float branchMergedValue9;
                    float branchMergedValue28;
                    float branchMergedValue29;
                    if (comparisonValue29 || (fragmentVectorConstants1.packedValues[15u].w == 0.0))
                    {
                        branchMergedValue9 = comparisonValue29 ? fragmentVectorConstants1.packedValues[14u].z : 2.2000000476837158203125;
                        branchMergedValue28 = comparisonValue29 ? fragmentVectorConstants1.packedValues[14u].y : 2.2000000476837158203125;
                        branchMergedValue29 = comparisonValue29 ? fragmentVectorConstants1.packedValues[14u].x : 2.2000000476837158203125;
                    }
                    else
                    {
                        float branchMergedValue45;
                        float branchMergedValue64;
                        float branchMergedValue65;
                        if ((dotProductValue6 < 0.180000007152557373046875) && comparisonValue27)
                        {
                            float quotientValue32 = (dotProductValue6 - productValue40) / (0.180000007152557373046875 - productValue40);
                            branchMergedValue45 = (quotientValue32 * (fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z)) + fragmentVectorConstants1.packedValues[14u].z;
                            branchMergedValue64 = (quotientValue32 * (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[14u].y;
                            branchMergedValue65 = (quotientValue32 * (fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[14u].x;
                        }
                        else
                        {
                            float branchMergedValue78;
                            float branchMergedValue97;
                            float branchMergedValue98;
                            if ((dotProductValue6 > 0.180000007152557373046875) && comparisonValue28)
                            {
                                float quotientValue33 = (dotProductValue6 + (-0.180000007152557373046875)) / (productValue39 + (-0.180000007152557373046875));
                                branchMergedValue78 = (quotientValue33 * (fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z)) + fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue97 = (quotientValue33 * (fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[15u].y;
                                branchMergedValue98 = (quotientValue33 * (fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[15u].x;
                            }
                            else
                            {
                                branchMergedValue78 = fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue97 = fragmentVectorConstants1.packedValues[15u].y;
                                branchMergedValue98 = fragmentVectorConstants1.packedValues[15u].x;
                            }
                            branchMergedValue45 = branchMergedValue78;
                            branchMergedValue64 = branchMergedValue97;
                            branchMergedValue65 = branchMergedValue98;
                        }
                        branchMergedValue9 = branchMergedValue45;
                        branchMergedValue28 = branchMergedValue64;
                        branchMergedValue29 = branchMergedValue65;
                    }
                    intermediateValue30 = branchMergedValue29;
                    intermediateValue31 = branchMergedValue28;
                    intermediateValue32 = branchMergedValue9;
                }
                float productValue41 = intermediateValue30 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue42 = intermediateValue31 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue43 = intermediateValue32 * fragmentVectorConstants1.packedValues[0u].w;
                if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
                {
                    branchMergedValue34 = exp2(log2(spvNMax(quotientValue31, 0.0)) * (1.0 / productValue43));
                    branchMergedValue35 = exp2(log2(spvNMax(quotientValue30, 0.0)) * (1.0 / productValue42));
                    branchMergedValue36 = exp2(log2(spvNMax(quotientValue29, 0.0)) * (1.0 / productValue41));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((quotientValue31 <= 0.003130800090730190277099609375) ? (quotientValue31 * 12.9200000762939453125) : ((exp2(log2(abs(quotientValue31)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue43));
                    branchMergedValue35 = exp2(log2((quotientValue30 <= 0.003130800090730190277099609375) ? (quotientValue30 * 12.9200000762939453125) : ((exp2(log2(abs(quotientValue30)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue42));
                    branchMergedValue36 = exp2(log2((quotientValue29 <= 0.003130800090730190277099609375) ? (quotientValue29 * 12.9200000762939453125) : ((exp2(log2(abs(quotientValue29)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue41));
                    break;
                }
#endif
                break;
            }
            case 4u:
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float scalarValue55 = rdDot3Precise2(vectorValue7, vec3(0.59719002246856689453125, 0.354579985141754150390625, 0.048229999840259552001953125));
                float scalarValue56 = rdDot3Precise2(vectorValue7, vec3(0.075999997556209564208984375, 0.908339977264404296875, 0.0156599991023540496826171875));
                float scalarValue57 = rdDot3Precise2(vectorValue7, vec3(0.0284000001847743988037109375, 0.13382999598979949951171875, 0.837769985198974609375));
                precise float sumValue75 = scalarValue55 + 0.02457859925925731658935546875;
                precise float sumValue76 = scalarValue56 + 0.02457859925925731658935546875;
                precise float sumValue77 = scalarValue57 + 0.02457859925925731658935546875;
                precise float multiplyAddValue135 = fma(scalarValue55, sumValue75, -9.0537003416102379560470581054688e-05) / fma(scalarValue55, fma(scalarValue55, 0.98372900485992431640625, 0.4329510033130645751953125), 0.23808099329471588134765625);
                precise float multiplyAddValue136 = fma(scalarValue56, sumValue76, -9.0537003416102379560470581054688e-05) / fma(scalarValue56, fma(scalarValue56, 0.98372900485992431640625, 0.4329510033130645751953125), 0.23808099329471588134765625);
                precise float multiplyAddValue137 = fma(scalarValue57, sumValue77, -9.0537003416102379560470581054688e-05) / fma(scalarValue57, fma(scalarValue57, 0.98372900485992431640625, 0.4329510033130645751953125), 0.23808099329471588134765625);
                vec3 vectorValue8 = vec3(multiplyAddValue135, multiplyAddValue136, multiplyAddValue137);
                float scalarValue58 = spvNClamp(rdDot3Precise2(vectorValue8, vec3(1.60475003719329833984375, -0.5310800075531005859375, -0.0736699998378753662109375)), 0.0, 1.0);
                float scalarValue59 = spvNClamp(rdDot3Precise2(vectorValue8, vec3(-0.10208000242710113525390625, 1.108129978179931640625, -0.00604999996721744537353515625)), 0.0, 1.0);
                float scalarValue60 = spvNClamp(rdDot3Precise2(vectorValue8, vec3(-0.00326999998651444911956787109375, -0.07276000082492828369140625, 1.0760200023651123046875)), 0.0, 1.0);
                float scalarValue61 = rdDot3Precise2(vec3(scalarValue58, scalarValue59, scalarValue60), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue75 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue76 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue77 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                precise float productValue129 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                precise float productValue130 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                bool comparisonValue110 = comparisonValue75 && (scalarValue61 >= productValue129);
                bool comparisonValue111 = comparisonValue77 && (productValue130 >= scalarValue61);
                bool bitwiseValue52 = comparisonValue77 && (scalarValue61 < 0.180000007152557373046875);
                float scalarValue32 = -fragmentScalarConstants1.packedValues[2u];
                precise float multiplyAddValue138 = fma(scalarValue32, 0.180000007152557373046875, scalarValue61) / fma(scalarValue32, 0.180000007152557373046875, 0.180000007152557373046875);
                precise float sumValue78 = fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x;
                precise float sumValue79 = fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y;
                precise float sumValue80 = fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z;
                bool bitwiseValue53 = comparisonValue75 && (scalarValue61 > 0.180000007152557373046875);
                precise float sumValue81 = scalarValue61 - 0.180000007152557373046875;
                precise float multiplyAddValue139 = sumValue81 / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                precise float sumValue82 = fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x;
                precise float sumValue83 = fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y;
                precise float sumValue84 = fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z;
                bool comparisonValue80 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                precise float multiplyAddValue140 = (comparisonValue110 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue111 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue76 ? (bitwiseValue52 ? fma(multiplyAddValue138, sumValue78, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue53 ? fma(multiplyAddValue139, sumValue82, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue141 = (comparisonValue110 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue111 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue76 ? (bitwiseValue52 ? fma(multiplyAddValue138, sumValue79, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue53 ? fma(multiplyAddValue139, sumValue83, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue142 = (comparisonValue110 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue111 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue76 ? (bitwiseValue52 ? fma(multiplyAddValue138, sumValue80, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue53 ? fma(multiplyAddValue139, sumValue84, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float quotientValue94 = 1.0 / multiplyAddValue140;
                precise float quotientValue95 = 1.0 / multiplyAddValue141;
                precise float quotientValue96 = 1.0 / multiplyAddValue142;
                float nonlinearValue32 = log2(scalarValue58);
                float nonlinearValue33 = log2(scalarValue59);
                float nonlinearValue34 = log2(scalarValue60);
                precise float productValue131 = quotientValue94 * nonlinearValue32;
                precise float productValue132 = quotientValue95 * nonlinearValue33;
                precise float productValue133 = quotientValue96 * nonlinearValue34;
                precise float productValue134 = scalarValue58 * 12.9200000762939453125;
                precise float productValue135 = scalarValue59 * 12.9200000762939453125;
                precise float productValue136 = scalarValue60 * 12.9200000762939453125;
                precise float productValue137 = nonlinearValue32 * 0.4166666567325592041015625;
                precise float productValue138 = nonlinearValue33 * 0.4166666567325592041015625;
                precise float productValue139 = nonlinearValue34 * 0.4166666567325592041015625;
                precise float quotientValue97 = 2.2000000476837158203125 / multiplyAddValue140;
                precise float quotientValue98 = 2.2000000476837158203125 / multiplyAddValue141;
                precise float quotientValue99 = 2.2000000476837158203125 / multiplyAddValue142;
                precise float multiplyAddValue143 = quotientValue97 * log2((scalarValue58 <= 0.003130800090730190277099609375) ? productValue134 : fma(exp2(productValue137), 1.05499994754791259765625, -0.054999999701976776123046875));
                precise float multiplyAddValue144 = quotientValue98 * log2((scalarValue59 <= 0.003130800090730190277099609375) ? productValue135 : fma(exp2(productValue138), 1.05499994754791259765625, -0.054999999701976776123046875));
                precise float multiplyAddValue145 = quotientValue99 * log2((scalarValue60 <= 0.003130800090730190277099609375) ? productValue136 : fma(exp2(productValue139), 1.05499994754791259765625, -0.054999999701976776123046875));
                exponentialValue13 = comparisonValue80 ? exp2(productValue131) : exp2(multiplyAddValue143);
                exponentialValue12 = comparisonValue80 ? exp2(productValue132) : exp2(multiplyAddValue144);
                exponentialValue11 = comparisonValue80 ? exp2(productValue133) : exp2(multiplyAddValue145);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue25 = rdDot3Precise2(vectorValue1, vec3(0.59719002246856689453125, 0.354579985141754150390625, 0.048229999840259552001953125));
                float scalarValue26 = rdDot3Precise2(vectorValue1, vec3(0.075999997556209564208984375, 0.908339977264404296875, 0.0156599991023540496826171875));
                float scalarValue27 = rdDot3Precise2(vectorValue1, vec3(0.0284000001847743988037109375, 0.13382999598979949951171875, 0.837769985198974609375));
                vec3 multiplyAddValue52 = vec3(fma(scalarValue25, scalarValue25 + 0.02457859925925731658935546875, -9.0537003416102379560470581054688e-05) / fma(scalarValue25, fma(scalarValue25, 0.98372900485992431640625, 0.4329510033130645751953125), 0.23808099329471588134765625), fma(scalarValue26, scalarValue26 + 0.02457859925925731658935546875, -9.0537003416102379560470581054688e-05) / fma(scalarValue26, fma(scalarValue26, 0.98372900485992431640625, 0.4329510033130645751953125), 0.23808099329471588134765625), fma(scalarValue27, scalarValue27 + 0.02457859925925731658935546875, -9.0537003416102379560470581054688e-05) / fma(scalarValue27, fma(scalarValue27, 0.98372900485992431640625, 0.4329510033130645751953125), 0.23808099329471588134765625));
                float scalarValue28 = spvNClamp(rdDot3Precise2(multiplyAddValue52, vec3(1.60475003719329833984375, -0.5310800075531005859375, -0.0736699998378753662109375)), 0.0, 1.0);
                float scalarValue29 = spvNClamp(rdDot3Precise2(multiplyAddValue52, vec3(-0.10208000242710113525390625, 1.108129978179931640625, -0.00604999996721744537353515625)), 0.0, 1.0);
                float scalarValue30 = spvNClamp(rdDot3Precise2(multiplyAddValue52, vec3(-0.00326999998651444911956787109375, -0.07276000082492828369140625, 1.0760200023651123046875)), 0.0, 1.0);
                float scalarValue31 = rdDot3Precise2(vec3(scalarValue28, scalarValue29, scalarValue30), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue75 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue76 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue77 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                bool comparisonValue78 = comparisonValue75 && (scalarValue31 >= (fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875));
                bool comparisonValue79 = comparisonValue77 && ((fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875) >= scalarValue31);
                bool bitwiseValue22 = comparisonValue77 && (scalarValue31 < 0.180000007152557373046875);
                float scalarValue32 = -fragmentScalarConstants1.packedValues[2u];
                float multiplyAddValue53 = fma(scalarValue32, 0.180000007152557373046875, scalarValue31) / fma(scalarValue32, 0.180000007152557373046875, 0.180000007152557373046875);
                bool bitwiseValue23 = comparisonValue75 && (scalarValue31 > 0.180000007152557373046875);
                float multiplyAddValue54 = (scalarValue31 - 0.180000007152557373046875) / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                bool comparisonValue80 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                float multiplyAddValue55 = (comparisonValue78 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue79 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue76 ? (bitwiseValue22 ? fma(multiplyAddValue53, fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue23 ? fma(multiplyAddValue54, fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue56 = (comparisonValue78 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue79 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue76 ? (bitwiseValue22 ? fma(multiplyAddValue53, fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue23 ? fma(multiplyAddValue54, fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue57 = (comparisonValue78 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue79 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue76 ? (bitwiseValue22 ? fma(multiplyAddValue53, fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue23 ? fma(multiplyAddValue54, fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float nonlinearValue5 = log2(scalarValue28);
                float nonlinearValue6 = log2(scalarValue29);
                float nonlinearValue7 = log2(scalarValue30);
                multiplyAddValue64 = comparisonValue80 ? exp2((1.0 / multiplyAddValue55) * nonlinearValue5) : exp2((2.2000000476837158203125 / multiplyAddValue55) * log2((scalarValue28 <= 0.003130800090730190277099609375) ? (scalarValue28 * 12.9200000762939453125) : fma(exp2(nonlinearValue5 * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)));
                multiplyAddValue63 = comparisonValue80 ? exp2((1.0 / multiplyAddValue56) * nonlinearValue6) : exp2((2.2000000476837158203125 / multiplyAddValue56) * log2((scalarValue29 <= 0.003130800090730190277099609375) ? (scalarValue29 * 12.9200000762939453125) : fma(exp2(nonlinearValue6 * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)));
                multiplyAddValue62 = comparisonValue80 ? exp2((1.0 / multiplyAddValue57) * nonlinearValue7) : exp2((2.2000000476837158203125 / multiplyAddValue57) * log2((scalarValue30 <= 0.003130800090730190277099609375) ? (scalarValue30 * 12.9200000762939453125) : fma(exp2(nonlinearValue7 * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float multiplyAddValue13 = fma(0.048229999840259552001953125, productValue12, fma(0.354579985141754150390625, productValue11, productValue10 * 0.59719002246856689453125));
                float multiplyAddValue14 = fma(0.0156599991023540496826171875, productValue12, fma(0.908339977264404296875, productValue11, productValue10 * 0.075999997556209564208984375));
                float multiplyAddValue15 = fma(0.837769985198974609375, productValue12, fma(0.13382999598979949951171875, productValue11, productValue10 * 0.0284000001847743988037109375));
                float quotientValue34 = (((multiplyAddValue13 + 0.02457859925925731658935546875) * multiplyAddValue13) + (-9.0537003416102379560470581054688e-05)) / ((((multiplyAddValue13 * 0.98372900485992431640625) + 0.4329510033130645751953125) * multiplyAddValue13) + 0.23808099329471588134765625);
                float quotientValue35 = (((multiplyAddValue14 + 0.02457859925925731658935546875) * multiplyAddValue14) + (-9.0537003416102379560470581054688e-05)) / ((((multiplyAddValue14 * 0.98372900485992431640625) + 0.4329510033130645751953125) * multiplyAddValue14) + 0.23808099329471588134765625);
                float quotientValue36 = (((multiplyAddValue15 + 0.02457859925925731658935546875) * multiplyAddValue15) + (-9.0537003416102379560470581054688e-05)) / ((((multiplyAddValue15 * 0.98372900485992431640625) + 0.4329510033130645751953125) * multiplyAddValue15) + 0.23808099329471588134765625);
                float multiplyAddValue16 = spvNClamp(fma(-0.0736699998378753662109375, quotientValue36, fma(-0.5310800075531005859375, quotientValue35, quotientValue34 * 1.60475003719329833984375)), 0.0, 1.0);
                float multiplyAddValue17 = spvNClamp(fma(-0.00604999996721744537353515625, quotientValue36, fma(1.108129978179931640625, quotientValue35, quotientValue34 * (-0.10208000242710113525390625))), 0.0, 1.0);
                float multiplyAddValue18 = spvNClamp(fma(1.0760200023651123046875, quotientValue36, fma(-0.07276000082492828369140625, quotientValue35, quotientValue34 * (-0.00326999998651444911956787109375))), 0.0, 1.0);
                float dotProductValue7 = dot(vec3(multiplyAddValue16, multiplyAddValue17, multiplyAddValue18), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue30 = fragmentVectorConstants1.packedValues[14u].w != 0.0;
                bool comparisonValue31 = fragmentVectorConstants1.packedValues[4u].w != 0.0;
                float productValue44 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                float intermediateValue33;
                float intermediateValue34;
                float intermediateValue35;
                if ((dotProductValue7 >= productValue44) && comparisonValue31)
                {
                    intermediateValue33 = fragmentVectorConstants1.packedValues[4u].x;
                    intermediateValue34 = fragmentVectorConstants1.packedValues[4u].y;
                    intermediateValue35 = fragmentVectorConstants1.packedValues[4u].z;
                }
                else
                {
                    float productValue45 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                    bool comparisonValue32 = (dotProductValue7 <= productValue45) && comparisonValue30;
                    float branchMergedValue10;
                    float branchMergedValue30;
                    float branchMergedValue31;
                    if (comparisonValue32 || (fragmentVectorConstants1.packedValues[15u].w == 0.0))
                    {
                        branchMergedValue10 = comparisonValue32 ? fragmentVectorConstants1.packedValues[14u].z : 2.2000000476837158203125;
                        branchMergedValue30 = comparisonValue32 ? fragmentVectorConstants1.packedValues[14u].x : 2.2000000476837158203125;
                        branchMergedValue31 = comparisonValue32 ? fragmentVectorConstants1.packedValues[14u].y : 2.2000000476837158203125;
                    }
                    else
                    {
                        float branchMergedValue46;
                        float branchMergedValue66;
                        float branchMergedValue67;
                        if ((dotProductValue7 < 0.180000007152557373046875) && comparisonValue30)
                        {
                            float quotientValue37 = (dotProductValue7 - productValue45) / (0.180000007152557373046875 - productValue45);
                            branchMergedValue46 = (quotientValue37 * (fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z)) + fragmentVectorConstants1.packedValues[14u].z;
                            branchMergedValue66 = (quotientValue37 * (fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[14u].x;
                            branchMergedValue67 = (quotientValue37 * (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[14u].y;
                        }
                        else
                        {
                            float branchMergedValue79;
                            float branchMergedValue99;
                            float branchMergedValue100;
                            if ((dotProductValue7 > 0.180000007152557373046875) && comparisonValue31)
                            {
                                float quotientValue38 = (dotProductValue7 + (-0.180000007152557373046875)) / (productValue44 + (-0.180000007152557373046875));
                                branchMergedValue79 = (quotientValue38 * (fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z)) + fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue99 = (quotientValue38 * (fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[15u].x;
                                branchMergedValue100 = (quotientValue38 * (fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[15u].y;
                            }
                            else
                            {
                                branchMergedValue79 = fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue99 = fragmentVectorConstants1.packedValues[15u].x;
                                branchMergedValue100 = fragmentVectorConstants1.packedValues[15u].y;
                            }
                            branchMergedValue46 = branchMergedValue79;
                            branchMergedValue66 = branchMergedValue99;
                            branchMergedValue67 = branchMergedValue100;
                        }
                        branchMergedValue10 = branchMergedValue46;
                        branchMergedValue30 = branchMergedValue66;
                        branchMergedValue31 = branchMergedValue67;
                    }
                    intermediateValue33 = branchMergedValue30;
                    intermediateValue34 = branchMergedValue31;
                    intermediateValue35 = branchMergedValue10;
                }
                float productValue46 = intermediateValue33 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue47 = intermediateValue34 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue48 = intermediateValue35 * fragmentVectorConstants1.packedValues[0u].w;
                if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
                {
                    branchMergedValue34 = exp2(log2(spvNMax(multiplyAddValue18, 0.0)) * (1.0 / productValue48));
                    branchMergedValue35 = exp2(log2(spvNMax(multiplyAddValue17, 0.0)) * (1.0 / productValue47));
                    branchMergedValue36 = exp2(log2(spvNMax(multiplyAddValue16, 0.0)) * (1.0 / productValue46));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((multiplyAddValue18 <= 0.003130800090730190277099609375) ? (multiplyAddValue18 * 12.9200000762939453125) : ((exp2(log2(abs(multiplyAddValue18)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue48));
                    branchMergedValue35 = exp2(log2((multiplyAddValue17 <= 0.003130800090730190277099609375) ? (multiplyAddValue17 * 12.9200000762939453125) : ((exp2(log2(abs(multiplyAddValue17)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue47));
                    branchMergedValue36 = exp2(log2((multiplyAddValue16 <= 0.003130800090730190277099609375) ? (multiplyAddValue16 * 12.9200000762939453125) : ((exp2(log2(abs(multiplyAddValue16)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue46));
                    break;
                }
#endif
                break;
            }
            case 5u:
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float scalarValue62 = spvNMax(spvNMax(productValue101, productValue100), productValue99);
                precise float quotientValue100 = productValue99 / scalarValue62;
                precise float quotientValue101 = productValue100 / scalarValue62;
                precise float quotientValue102 = productValue101 / scalarValue62;
                precise float nonlinearValue35 = log2(scalarValue62) * fragmentScalarConstants1.packedValues[4u];
                float exponentialValue22 = exp2(nonlinearValue35);
                precise float multiplyAddValue146 = exponentialValue22 / fma(fragmentScalarConstants1.packedValues[5u], exponentialValue22, fragmentScalarConstants1.packedValues[6u]);
                precise float quotientValue103 = 1.0 / fragmentScalarConstants1.packedValues[64u];
                precise float nonlinearValue36 = quotientValue103 * log2(quotientValue100);
                precise float nonlinearValue37 = quotientValue103 * log2(quotientValue101);
                precise float nonlinearValue38 = quotientValue103 * log2(quotientValue102);
                float exponentialValue23 = exp2(nonlinearValue36);
                float exponentialValue24 = exp2(nonlinearValue37);
                float exponentialValue25 = exp2(nonlinearValue38);
                precise float nonlinearValue39 = log2(multiplyAddValue146) * fragmentScalarConstants1.packedValues[7u];
                float exponentialValue26 = exp2(nonlinearValue39);
                precise float sumValue85 = 1.0 - exponentialValue23;
                precise float sumValue86 = 1.0 - exponentialValue24;
                precise float sumValue87 = 1.0 - exponentialValue25;
                precise float multiplyAddValue147 = log2(fma(exponentialValue26, sumValue85, exponentialValue23)) * fragmentScalarConstants1.packedValues[64u];
                precise float multiplyAddValue148 = log2(fma(exponentialValue26, sumValue86, exponentialValue24)) * fragmentScalarConstants1.packedValues[64u];
                precise float multiplyAddValue149 = log2(fma(exponentialValue26, sumValue87, exponentialValue25)) * fragmentScalarConstants1.packedValues[64u];
                precise float exponentialValue27 = multiplyAddValue146 * exp2(multiplyAddValue147);
                precise float exponentialValue28 = multiplyAddValue146 * exp2(multiplyAddValue148);
                precise float exponentialValue29 = multiplyAddValue146 * exp2(multiplyAddValue149);
                float scalarValue63 = rdDot3Precise2(vec3(exponentialValue27, exponentialValue28, exponentialValue29), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue81 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue82 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue83 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                precise float productValue140 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                precise float productValue141 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                bool comparisonValue112 = comparisonValue81 && (scalarValue63 >= productValue140);
                bool comparisonValue113 = comparisonValue83 && (productValue141 >= scalarValue63);
                bool bitwiseValue54 = comparisonValue83 && (scalarValue63 < 0.180000007152557373046875);
                float scalarValue35 = -fragmentScalarConstants1.packedValues[2u];
                precise float multiplyAddValue150 = fma(scalarValue35, 0.180000007152557373046875, scalarValue63) / fma(scalarValue35, 0.180000007152557373046875, 0.180000007152557373046875);
                precise float sumValue88 = fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x;
                precise float sumValue89 = fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y;
                precise float sumValue90 = fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z;
                bool bitwiseValue55 = comparisonValue81 && (scalarValue63 > 0.180000007152557373046875);
                precise float sumValue91 = scalarValue63 - 0.180000007152557373046875;
                precise float multiplyAddValue151 = sumValue91 / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                precise float sumValue92 = fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x;
                precise float sumValue93 = fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y;
                precise float sumValue94 = fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z;
                bool comparisonValue86 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                precise float multiplyAddValue152 = (comparisonValue112 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue113 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue82 ? (bitwiseValue54 ? fma(multiplyAddValue150, sumValue88, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue55 ? fma(multiplyAddValue151, sumValue92, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue153 = (comparisonValue112 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue113 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue82 ? (bitwiseValue54 ? fma(multiplyAddValue150, sumValue89, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue55 ? fma(multiplyAddValue151, sumValue93, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue154 = (comparisonValue112 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue113 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue82 ? (bitwiseValue54 ? fma(multiplyAddValue150, sumValue90, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue55 ? fma(multiplyAddValue151, sumValue94, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float quotientValue104 = 1.0 / multiplyAddValue152;
                precise float quotientValue105 = 1.0 / multiplyAddValue153;
                precise float quotientValue106 = 1.0 / multiplyAddValue154;
                precise float nonlinearValue40 = quotientValue104 * log2(spvNMax(exponentialValue27, 0.0));
                precise float nonlinearValue41 = quotientValue105 * log2(spvNMax(exponentialValue28, 0.0));
                precise float nonlinearValue42 = quotientValue106 * log2(spvNMax(exponentialValue29, 0.0));
                precise float productValue142 = exponentialValue27 * 12.9200000762939453125;
                precise float productValue143 = exponentialValue28 * 12.9200000762939453125;
                precise float productValue144 = exponentialValue29 * 12.9200000762939453125;
                precise float nonlinearValue43 = log2(abs(exponentialValue27)) * 0.4166666567325592041015625;
                precise float nonlinearValue44 = log2(abs(exponentialValue28)) * 0.4166666567325592041015625;
                precise float nonlinearValue45 = log2(abs(exponentialValue29)) * 0.4166666567325592041015625;
                precise float quotientValue107 = 2.2000000476837158203125 / multiplyAddValue152;
                precise float quotientValue108 = 2.2000000476837158203125 / multiplyAddValue153;
                precise float quotientValue109 = 2.2000000476837158203125 / multiplyAddValue154;
                precise float multiplyAddValue155 = log2((exponentialValue27 <= 0.003130800090730190277099609375) ? productValue142 : fma(exp2(nonlinearValue43), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue107;
                precise float multiplyAddValue156 = log2((exponentialValue28 <= 0.003130800090730190277099609375) ? productValue143 : fma(exp2(nonlinearValue44), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue108;
                precise float multiplyAddValue157 = log2((exponentialValue29 <= 0.003130800090730190277099609375) ? productValue144 : fma(exp2(nonlinearValue45), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue109;
                exponentialValue13 = comparisonValue86 ? exp2(nonlinearValue40) : exp2(multiplyAddValue155);
                exponentialValue12 = comparisonValue86 ? exp2(nonlinearValue41) : exp2(multiplyAddValue156);
                exponentialValue11 = comparisonValue86 ? exp2(nonlinearValue42) : exp2(multiplyAddValue157);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue33 = spvNMax(spvNMax(productValue75, productValue74), productValue73);
                float exponentialValue14 = exp2(log2(scalarValue33) * fragmentScalarConstants1.packedValues[4u]);
                float multiplyAddValue58 = exponentialValue14 / fma(fragmentScalarConstants1.packedValues[5u], exponentialValue14, fragmentScalarConstants1.packedValues[6u]);
                float quotientValue53 = 1.0 / fragmentScalarConstants1.packedValues[64u];
                float exponentialValue15 = exp2(quotientValue53 * log2(productValue73 / scalarValue33));
                float exponentialValue16 = exp2(quotientValue53 * log2(productValue74 / scalarValue33));
                float exponentialValue17 = exp2(quotientValue53 * log2(productValue75 / scalarValue33));
                float exponentialValue18 = exp2(log2(multiplyAddValue58) * fragmentScalarConstants1.packedValues[7u]);
                float multiplyAddValue59 = multiplyAddValue58 * exp2(log2(fma(exponentialValue18, 1.0 - exponentialValue15, exponentialValue15)) * fragmentScalarConstants1.packedValues[64u]);
                float multiplyAddValue60 = multiplyAddValue58 * exp2(log2(fma(exponentialValue18, 1.0 - exponentialValue16, exponentialValue16)) * fragmentScalarConstants1.packedValues[64u]);
                float multiplyAddValue61 = multiplyAddValue58 * exp2(log2(fma(exponentialValue18, 1.0 - exponentialValue17, exponentialValue17)) * fragmentScalarConstants1.packedValues[64u]);
                float scalarValue34 = rdDot3Precise2(vec3(multiplyAddValue59, multiplyAddValue60, multiplyAddValue61), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue81 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue82 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue83 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                bool comparisonValue84 = comparisonValue81 && (scalarValue34 >= (fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875));
                bool comparisonValue85 = comparisonValue83 && ((fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875) >= scalarValue34);
                bool bitwiseValue24 = comparisonValue83 && (scalarValue34 < 0.180000007152557373046875);
                float scalarValue35 = -fragmentScalarConstants1.packedValues[2u];
                float multiplyAddValue68 = fma(scalarValue35, 0.180000007152557373046875, scalarValue34) / fma(scalarValue35, 0.180000007152557373046875, 0.180000007152557373046875);
                bool bitwiseValue25 = comparisonValue81 && (scalarValue34 > 0.180000007152557373046875);
                float multiplyAddValue69 = (scalarValue34 - 0.180000007152557373046875) / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                bool comparisonValue86 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                float multiplyAddValue70 = (comparisonValue84 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue85 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue82 ? (bitwiseValue24 ? fma(multiplyAddValue68, fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue25 ? fma(multiplyAddValue69, fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue71 = (comparisonValue84 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue85 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue82 ? (bitwiseValue24 ? fma(multiplyAddValue68, fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue25 ? fma(multiplyAddValue69, fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue72 = (comparisonValue84 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue85 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue82 ? (bitwiseValue24 ? fma(multiplyAddValue68, fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue25 ? fma(multiplyAddValue69, fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                multiplyAddValue64 = comparisonValue86 ? exp2((1.0 / multiplyAddValue70) * log2(spvNMax(multiplyAddValue59, 0.0))) : exp2(log2((multiplyAddValue59 <= 0.003130800090730190277099609375) ? (multiplyAddValue59 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue59)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue70));
                multiplyAddValue63 = comparisonValue86 ? exp2((1.0 / multiplyAddValue71) * log2(spvNMax(multiplyAddValue60, 0.0))) : exp2(log2((multiplyAddValue60 <= 0.003130800090730190277099609375) ? (multiplyAddValue60 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue60)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue71));
                multiplyAddValue62 = comparisonValue86 ? exp2((1.0 / multiplyAddValue72) * log2(spvNMax(multiplyAddValue61, 0.0))) : exp2(log2((multiplyAddValue61 <= 0.003130800090730190277099609375) ? (multiplyAddValue61 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue61)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue72));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float scalarValue4 = spvNMax(productValue10, spvNMax(productValue11, productValue12));
                float exponentialValue3 = exp2(log2(scalarValue4) * fragmentVectorConstants1.packedValues[1u].x);
                float quotientValue39 = exponentialValue3 / ((exponentialValue3 * fragmentVectorConstants1.packedValues[1u].y) + fragmentVectorConstants1.packedValues[1u].z);
                float quotientValue40 = 1.0 / fragmentVectorConstants1.packedValues[16u].x;
                float exponentialValue4 = exp2(log2(productValue10 / scalarValue4) * quotientValue40);
                float exponentialValue5 = exp2(log2(productValue11 / scalarValue4) * quotientValue40);
                float exponentialValue6 = exp2(log2(productValue12 / scalarValue4) * quotientValue40);
                float exponentialValue7 = exp2(log2(quotientValue39) * fragmentVectorConstants1.packedValues[1u].w);
                float exponentialValue8 = exp2(log2((exponentialValue7 * (1.0 - exponentialValue4)) + exponentialValue4) * fragmentVectorConstants1.packedValues[16u].x) * quotientValue39;
                float exponentialValue9 = exp2(log2((exponentialValue7 * (1.0 - exponentialValue5)) + exponentialValue5) * fragmentVectorConstants1.packedValues[16u].x) * quotientValue39;
                float exponentialValue10 = exp2(log2((exponentialValue7 * (1.0 - exponentialValue6)) + exponentialValue6) * fragmentVectorConstants1.packedValues[16u].x) * quotientValue39;
                float dotProductValue8 = dot(vec3(exponentialValue8, exponentialValue9, exponentialValue10), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue33 = fragmentVectorConstants1.packedValues[14u].w != 0.0;
                bool comparisonValue34 = fragmentVectorConstants1.packedValues[4u].w != 0.0;
                float productValue49 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                float intermediateValue36;
                float intermediateValue37;
                float intermediateValue38;
                if ((dotProductValue8 >= productValue49) && comparisonValue34)
                {
                    intermediateValue36 = fragmentVectorConstants1.packedValues[4u].x;
                    intermediateValue37 = fragmentVectorConstants1.packedValues[4u].y;
                    intermediateValue38 = fragmentVectorConstants1.packedValues[4u].z;
                }
                else
                {
                    float productValue50 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                    bool comparisonValue35 = (dotProductValue8 <= productValue50) && comparisonValue33;
                    float branchMergedValue11;
                    float branchMergedValue32;
                    float branchMergedValue33;
                    if (comparisonValue35 || (fragmentVectorConstants1.packedValues[15u].w == 0.0))
                    {
                        branchMergedValue11 = comparisonValue35 ? fragmentVectorConstants1.packedValues[14u].x : 2.2000000476837158203125;
                        branchMergedValue32 = comparisonValue35 ? fragmentVectorConstants1.packedValues[14u].z : 2.2000000476837158203125;
                        branchMergedValue33 = comparisonValue35 ? fragmentVectorConstants1.packedValues[14u].y : 2.2000000476837158203125;
                    }
                    else
                    {
                        float branchMergedValue47;
                        float branchMergedValue68;
                        float branchMergedValue69;
                        if ((dotProductValue8 < 0.180000007152557373046875) && comparisonValue33)
                        {
                            float quotientValue41 = (dotProductValue8 - productValue50) / (0.180000007152557373046875 - productValue50);
                            branchMergedValue47 = (quotientValue41 * (fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[14u].x;
                            branchMergedValue68 = (quotientValue41 * (fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z)) + fragmentVectorConstants1.packedValues[14u].z;
                            branchMergedValue69 = (quotientValue41 * (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[14u].y;
                        }
                        else
                        {
                            float branchMergedValue80;
                            float branchMergedValue101;
                            float branchMergedValue102;
                            if ((dotProductValue8 > 0.180000007152557373046875) && comparisonValue34)
                            {
                                float quotientValue42 = (dotProductValue8 + (-0.180000007152557373046875)) / (productValue49 + (-0.180000007152557373046875));
                                branchMergedValue80 = (quotientValue42 * (fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[15u].x;
                                branchMergedValue101 = (quotientValue42 * (fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z)) + fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue102 = (quotientValue42 * (fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[15u].y;
                            }
                            else
                            {
                                branchMergedValue80 = fragmentVectorConstants1.packedValues[15u].x;
                                branchMergedValue101 = fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue102 = fragmentVectorConstants1.packedValues[15u].y;
                            }
                            branchMergedValue47 = branchMergedValue80;
                            branchMergedValue68 = branchMergedValue101;
                            branchMergedValue69 = branchMergedValue102;
                        }
                        branchMergedValue11 = branchMergedValue47;
                        branchMergedValue32 = branchMergedValue68;
                        branchMergedValue33 = branchMergedValue69;
                    }
                    intermediateValue36 = branchMergedValue11;
                    intermediateValue37 = branchMergedValue33;
                    intermediateValue38 = branchMergedValue32;
                }
                float productValue51 = intermediateValue36 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue52 = intermediateValue37 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue53 = intermediateValue38 * fragmentVectorConstants1.packedValues[0u].w;
                if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
                {
                    branchMergedValue34 = exp2(log2(spvNMax(exponentialValue10, 0.0)) * (1.0 / productValue53));
                    branchMergedValue35 = exp2(log2(spvNMax(exponentialValue9, 0.0)) * (1.0 / productValue52));
                    branchMergedValue36 = exp2(log2(spvNMax(exponentialValue8, 0.0)) * (1.0 / productValue51));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((exponentialValue10 <= 0.003130800090730190277099609375) ? (exponentialValue10 * 12.9200000762939453125) : ((exp2(log2(abs(exponentialValue10)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue53));
                    branchMergedValue35 = exp2(log2((exponentialValue9 <= 0.003130800090730190277099609375) ? (exponentialValue9 * 12.9200000762939453125) : ((exp2(log2(abs(exponentialValue9)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue52));
                    branchMergedValue36 = exp2(log2((exponentialValue8 <= 0.003130800090730190277099609375) ? (exponentialValue8 * 12.9200000762939453125) : ((exp2(log2(abs(exponentialValue8)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue51));
                    break;
                }
#endif
                break;
            }
            default:
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                precise float multiplyAddValue158 = productValue99 / fma(multiplyAddValue101, productValue98, 1.0);
                precise float multiplyAddValue159 = productValue100 / fma(multiplyAddValue102, productValue98, 1.0);
                precise float multiplyAddValue160 = productValue101 / fma(multiplyAddValue103, productValue98, 1.0);
                float scalarValue64 = rdDot3Precise2(vec3(multiplyAddValue158, multiplyAddValue159, multiplyAddValue160), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue87 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue88 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue89 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                precise float productValue145 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                precise float productValue146 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                bool comparisonValue114 = comparisonValue87 && (scalarValue64 >= productValue145);
                bool comparisonValue115 = comparisonValue89 && (productValue146 >= scalarValue64);
                bool bitwiseValue56 = comparisonValue89 && (scalarValue64 < 0.180000007152557373046875);
                float scalarValue37 = -fragmentScalarConstants1.packedValues[2u];
                precise float multiplyAddValue161 = fma(scalarValue37, 0.180000007152557373046875, scalarValue64) / fma(scalarValue37, 0.180000007152557373046875, 0.180000007152557373046875);
                precise float sumValue95 = fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x;
                precise float sumValue96 = fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y;
                precise float sumValue97 = fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z;
                bool bitwiseValue57 = comparisonValue87 && (scalarValue64 > 0.180000007152557373046875);
                precise float sumValue98 = scalarValue64 - 0.180000007152557373046875;
                precise float multiplyAddValue162 = sumValue98 / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                precise float sumValue99 = fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x;
                precise float sumValue100 = fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y;
                precise float sumValue101 = fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z;
                bool comparisonValue92 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                precise float multiplyAddValue163 = (comparisonValue114 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue115 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue88 ? (bitwiseValue56 ? fma(multiplyAddValue161, sumValue95, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue57 ? fma(multiplyAddValue162, sumValue99, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue164 = (comparisonValue114 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue115 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue88 ? (bitwiseValue56 ? fma(multiplyAddValue161, sumValue96, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue57 ? fma(multiplyAddValue162, sumValue100, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float multiplyAddValue165 = (comparisonValue114 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue115 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue88 ? (bitwiseValue56 ? fma(multiplyAddValue161, sumValue97, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue57 ? fma(multiplyAddValue162, sumValue101, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                precise float quotientValue110 = 1.0 / multiplyAddValue163;
                precise float quotientValue111 = 1.0 / multiplyAddValue164;
                precise float quotientValue112 = 1.0 / multiplyAddValue165;
                precise float nonlinearValue46 = quotientValue110 * log2(spvNMax(multiplyAddValue158, 0.0));
                precise float nonlinearValue47 = quotientValue111 * log2(spvNMax(multiplyAddValue159, 0.0));
                precise float nonlinearValue48 = quotientValue112 * log2(spvNMax(multiplyAddValue160, 0.0));
                precise float productValue147 = multiplyAddValue158 * 12.9200000762939453125;
                precise float productValue148 = multiplyAddValue159 * 12.9200000762939453125;
                precise float productValue149 = multiplyAddValue160 * 12.9200000762939453125;
                precise float nonlinearValue49 = log2(abs(multiplyAddValue158)) * 0.4166666567325592041015625;
                precise float nonlinearValue50 = log2(abs(multiplyAddValue159)) * 0.4166666567325592041015625;
                precise float nonlinearValue51 = log2(abs(multiplyAddValue160)) * 0.4166666567325592041015625;
                precise float quotientValue113 = 2.2000000476837158203125 / multiplyAddValue163;
                precise float quotientValue114 = 2.2000000476837158203125 / multiplyAddValue164;
                precise float quotientValue115 = 2.2000000476837158203125 / multiplyAddValue165;
                precise float multiplyAddValue166 = log2((multiplyAddValue158 <= 0.003130800090730190277099609375) ? productValue147 : fma(exp2(nonlinearValue49), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue113;
                precise float multiplyAddValue167 = log2((multiplyAddValue159 <= 0.003130800090730190277099609375) ? productValue148 : fma(exp2(nonlinearValue50), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue114;
                precise float multiplyAddValue168 = log2((multiplyAddValue160 <= 0.003130800090730190277099609375) ? productValue149 : fma(exp2(nonlinearValue51), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue115;
                exponentialValue13 = comparisonValue92 ? exp2(nonlinearValue46) : exp2(multiplyAddValue166);
                exponentialValue12 = comparisonValue92 ? exp2(nonlinearValue47) : exp2(multiplyAddValue167);
                exponentialValue11 = comparisonValue92 ? exp2(nonlinearValue48) : exp2(multiplyAddValue168);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float multiplyAddValue73 = productValue73 / fma(multiplyAddValue27, quotientValue51, 1.0);
                float multiplyAddValue74 = productValue74 / fma(multiplyAddValue28, quotientValue51, 1.0);
                float multiplyAddValue75 = productValue75 / fma(multiplyAddValue29, quotientValue51, 1.0);
                float scalarValue36 = rdDot3Precise2(vec3(multiplyAddValue73, multiplyAddValue74, multiplyAddValue75), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue87 = fragmentScalarConstants1.packedValues[19u] != 0.0;
                bool comparisonValue88 = fragmentScalarConstants1.packedValues[63u] != 0.0;
                bool comparisonValue89 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                bool comparisonValue90 = comparisonValue87 && (scalarValue36 >= (fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875));
                bool comparisonValue91 = comparisonValue89 && ((fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875) >= scalarValue36);
                bool bitwiseValue26 = comparisonValue89 && (scalarValue36 < 0.180000007152557373046875);
                float scalarValue37 = -fragmentScalarConstants1.packedValues[2u];
                float multiplyAddValue76 = fma(scalarValue37, 0.180000007152557373046875, scalarValue36) / fma(scalarValue37, 0.180000007152557373046875, 0.180000007152557373046875);
                bool bitwiseValue27 = comparisonValue87 && (scalarValue36 > 0.180000007152557373046875);
                float multiplyAddValue77 = (scalarValue36 - 0.180000007152557373046875) / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
                bool comparisonValue92 = fragmentScalarConstants1.packedValues[68u] != 0.0;
                float multiplyAddValue78 = (comparisonValue90 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue91 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue88 ? (bitwiseValue26 ? fma(multiplyAddValue76, fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue27 ? fma(multiplyAddValue77, fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue79 = (comparisonValue90 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue91 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue88 ? (bitwiseValue26 ? fma(multiplyAddValue76, fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue27 ? fma(multiplyAddValue77, fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                float multiplyAddValue80 = (comparisonValue90 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue91 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue88 ? (bitwiseValue26 ? fma(multiplyAddValue76, fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue27 ? fma(multiplyAddValue77, fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
                multiplyAddValue64 = comparisonValue92 ? exp2((1.0 / multiplyAddValue78) * log2(spvNMax(multiplyAddValue73, 0.0))) : exp2(log2((multiplyAddValue73 <= 0.003130800090730190277099609375) ? (multiplyAddValue73 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue73)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue78));
                multiplyAddValue63 = comparisonValue92 ? exp2((1.0 / multiplyAddValue79) * log2(spvNMax(multiplyAddValue74, 0.0))) : exp2(log2((multiplyAddValue74 <= 0.003130800090730190277099609375) ? (multiplyAddValue74 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue74)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue79));
                multiplyAddValue62 = comparisonValue92 ? exp2((1.0 / multiplyAddValue80) * log2(spvNMax(multiplyAddValue75, 0.0))) : exp2(log2((multiplyAddValue75 <= 0.003130800090730190277099609375) ? (multiplyAddValue75 * 12.9200000762939453125) : fma(exp2(log2(abs(multiplyAddValue75)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue80));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float quotientValue43 = productValue10 / (productValue10 + 1.0);
                float quotientValue44 = productValue11 / (productValue11 + 1.0);
                float quotientValue45 = productValue12 / (productValue12 + 1.0);
                float dotProductValue9 = dot(vec3(quotientValue43, quotientValue44, quotientValue45), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool comparisonValue36 = fragmentVectorConstants1.packedValues[14u].w != 0.0;
                bool comparisonValue37 = fragmentVectorConstants1.packedValues[4u].w != 0.0;
                float productValue54 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
                float intermediateValue21;
                float intermediateValue22;
                float intermediateValue23;
                if ((dotProductValue9 >= productValue54) && comparisonValue37)
                {
                    intermediateValue21 = fragmentVectorConstants1.packedValues[4u].x;
                    intermediateValue22 = fragmentVectorConstants1.packedValues[4u].y;
                    intermediateValue23 = fragmentVectorConstants1.packedValues[4u].z;
                }
                else
                {
                    float productValue55 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
                    bool comparisonValue38 = (dotProductValue9 <= productValue55) && comparisonValue36;
                    float branchMergedValue6;
                    float branchMergedValue22;
                    float branchMergedValue23;
                    if (comparisonValue38 || (fragmentVectorConstants1.packedValues[15u].w == 0.0))
                    {
                        branchMergedValue6 = comparisonValue38 ? fragmentVectorConstants1.packedValues[14u].x : 2.2000000476837158203125;
                        branchMergedValue22 = comparisonValue38 ? fragmentVectorConstants1.packedValues[14u].z : 2.2000000476837158203125;
                        branchMergedValue23 = comparisonValue38 ? fragmentVectorConstants1.packedValues[14u].y : 2.2000000476837158203125;
                    }
                    else
                    {
                        float branchMergedValue42;
                        float branchMergedValue58;
                        float branchMergedValue59;
                        if ((dotProductValue9 < 0.180000007152557373046875) && comparisonValue36)
                        {
                            float quotientValue46 = (dotProductValue9 - productValue55) / (0.180000007152557373046875 - productValue55);
                            branchMergedValue42 = (quotientValue46 * (fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[14u].x;
                            branchMergedValue58 = (quotientValue46 * (fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z)) + fragmentVectorConstants1.packedValues[14u].z;
                            branchMergedValue59 = (quotientValue46 * (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[14u].y;
                        }
                        else
                        {
                            float branchMergedValue75;
                            float branchMergedValue91;
                            float branchMergedValue92;
                            if ((dotProductValue9 > 0.180000007152557373046875) && comparisonValue37)
                            {
                                float quotientValue47 = (dotProductValue9 + (-0.180000007152557373046875)) / (productValue54 + (-0.180000007152557373046875));
                                branchMergedValue75 = (quotientValue47 * (fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[15u].x;
                                branchMergedValue91 = (quotientValue47 * (fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z)) + fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue92 = (quotientValue47 * (fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[15u].y;
                            }
                            else
                            {
                                branchMergedValue75 = fragmentVectorConstants1.packedValues[15u].x;
                                branchMergedValue91 = fragmentVectorConstants1.packedValues[15u].z;
                                branchMergedValue92 = fragmentVectorConstants1.packedValues[15u].y;
                            }
                            branchMergedValue42 = branchMergedValue75;
                            branchMergedValue58 = branchMergedValue91;
                            branchMergedValue59 = branchMergedValue92;
                        }
                        branchMergedValue6 = branchMergedValue42;
                        branchMergedValue22 = branchMergedValue58;
                        branchMergedValue23 = branchMergedValue59;
                    }
                    intermediateValue21 = branchMergedValue6;
                    intermediateValue22 = branchMergedValue23;
                    intermediateValue23 = branchMergedValue22;
                }
                float productValue56 = intermediateValue21 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue57 = intermediateValue22 * fragmentVectorConstants1.packedValues[0u].w;
                float productValue58 = intermediateValue23 * fragmentVectorConstants1.packedValues[0u].w;
                if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
                {
                    branchMergedValue34 = exp2(log2(spvNMax(quotientValue45, 0.0)) * (1.0 / productValue58));
                    branchMergedValue35 = exp2(log2(spvNMax(quotientValue44, 0.0)) * (1.0 / productValue57));
                    branchMergedValue36 = exp2(log2(spvNMax(quotientValue43, 0.0)) * (1.0 / productValue56));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((quotientValue45 <= 0.003130800090730190277099609375) ? (quotientValue45 * 12.9200000762939453125) : ((exp2(log2(abs(quotientValue45)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue58));
                    branchMergedValue35 = exp2(log2((quotientValue44 <= 0.003130800090730190277099609375) ? (quotientValue44 * 12.9200000762939453125) : ((exp2(log2(abs(quotientValue44)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue57));
                    branchMergedValue36 = exp2(log2((quotientValue43 <= 0.003130800090730190277099609375) ? (quotientValue43 * 12.9200000762939453125) : ((exp2(log2(abs(quotientValue43)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * (2.2000000476837158203125 / productValue56));
                    break;
                }
#endif
                break;
            }
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue67 = exponentialValue11;
        intermediateValue68 = exponentialValue12;
        intermediateValue69 = exponentialValue13;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue55 = multiplyAddValue62;
        intermediateValue56 = multiplyAddValue63;
        intermediateValue57 = multiplyAddValue64;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue11 = branchMergedValue36;
        exponentialValue12 = branchMergedValue35;
        exponentialValue13 = branchMergedValue34;
    }
    float scalarValue5 = spvNMin(spvNMax(exponentialValue11, 0.0), 1.0);
    float scalarValue6 = spvNMin(spvNMax(exponentialValue12, 0.0), 1.0);
    float scalarValue7 = spvNMin(spvNMax(exponentialValue13, 0.0), 1.0);
    float productValue59;
    float productValue60;
    float productValue61;
    if (fragmentVectorConstants1.packedValues[23u].x > 0.0)
    {
        vec4 sampledTextureValue4 = texture(sampler2D(rasterizedColorTexture, rasterizedColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        float sumValue = 1.0 - sampledTextureValue4.w;
        productValue59 = (sumValue * scalarValue5) + sampledTextureValue4.x;
        productValue60 = (sumValue * scalarValue6) + sampledTextureValue4.y;
        productValue61 = (sumValue * scalarValue7) + sampledTextureValue4.z;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        float scalarValue65 = rdDot3Precise2(vec3(multiplyAddValue101, multiplyAddValue102, multiplyAddValue103), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        bool comparisonValue93 = fragmentScalarConstants1.packedValues[19u] != 0.0;
        bool comparisonValue94 = fragmentScalarConstants1.packedValues[63u] != 0.0;
        bool comparisonValue95 = fragmentScalarConstants1.packedValues[59u] != 0.0;
        precise float productValue150 = fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875;
        precise float productValue151 = fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875;
        bool comparisonValue116 = comparisonValue93 && (scalarValue65 >= productValue150);
        bool comparisonValue117 = comparisonValue95 && (productValue151 >= scalarValue65);
        bool bitwiseValue58 = comparisonValue95 && (scalarValue65 < 0.180000007152557373046875);
        float scalarValue39 = -fragmentScalarConstants1.packedValues[2u];
        precise float multiplyAddValue169 = fma(scalarValue39, 0.180000007152557373046875, scalarValue65) / fma(scalarValue39, 0.180000007152557373046875, 0.180000007152557373046875);
        precise float sumValue102 = fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x;
        precise float sumValue103 = fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y;
        precise float sumValue104 = fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z;
        bool bitwiseValue59 = comparisonValue93 && (scalarValue65 > 0.180000007152557373046875);
        precise float sumValue105 = scalarValue65 - 0.180000007152557373046875;
        precise float multiplyAddValue170 = sumValue105 / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
        precise float sumValue106 = fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x;
        precise float sumValue107 = fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y;
        precise float sumValue108 = fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z;
        bool comparisonValue98 = fragmentScalarConstants1.packedValues[68u] != 0.0;
        precise float multiplyAddValue171 = (comparisonValue116 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue117 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue94 ? (bitwiseValue58 ? fma(multiplyAddValue169, sumValue102, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue59 ? fma(multiplyAddValue170, sumValue106, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
        precise float multiplyAddValue172 = (comparisonValue116 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue117 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue94 ? (bitwiseValue58 ? fma(multiplyAddValue169, sumValue103, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue59 ? fma(multiplyAddValue170, sumValue107, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
        precise float multiplyAddValue173 = (comparisonValue116 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue117 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue94 ? (bitwiseValue58 ? fma(multiplyAddValue169, sumValue104, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue59 ? fma(multiplyAddValue170, sumValue108, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
        precise float quotientValue116 = 1.0 / multiplyAddValue171;
        precise float quotientValue117 = 1.0 / multiplyAddValue172;
        precise float quotientValue118 = 1.0 / multiplyAddValue173;
        float nonlinearValue52 = log2(multiplyAddValue101);
        float nonlinearValue53 = log2(multiplyAddValue102);
        float nonlinearValue54 = log2(multiplyAddValue103);
        precise float productValue152 = quotientValue116 * nonlinearValue52;
        precise float productValue153 = quotientValue117 * nonlinearValue53;
        precise float productValue154 = quotientValue118 * nonlinearValue54;
        precise float productValue155 = multiplyAddValue101 * 12.9200000762939453125;
        precise float productValue156 = multiplyAddValue102 * 12.9200000762939453125;
        precise float productValue157 = multiplyAddValue103 * 12.9200000762939453125;
        precise float productValue158 = nonlinearValue52 * 0.4166666567325592041015625;
        precise float productValue159 = nonlinearValue53 * 0.4166666567325592041015625;
        precise float productValue160 = nonlinearValue54 * 0.4166666567325592041015625;
        precise float quotientValue119 = 2.2000000476837158203125 / multiplyAddValue171;
        precise float quotientValue120 = 2.2000000476837158203125 / multiplyAddValue172;
        precise float quotientValue121 = 2.2000000476837158203125 / multiplyAddValue173;
        precise float multiplyAddValue174 = log2((multiplyAddValue101 <= 0.003130800090730190277099609375) ? productValue155 : fma(exp2(productValue158), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue119;
        precise float multiplyAddValue175 = log2((multiplyAddValue102 <= 0.003130800090730190277099609375) ? productValue156 : fma(exp2(productValue159), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue120;
        precise float multiplyAddValue176 = log2((multiplyAddValue103 <= 0.003130800090730190277099609375) ? productValue157 : fma(exp2(productValue160), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue121;
        intermediateValue67 = comparisonValue98 ? exp2(productValue154) : exp2(multiplyAddValue176);
        intermediateValue68 = comparisonValue98 ? exp2(productValue153) : exp2(multiplyAddValue175);
        intermediateValue69 = comparisonValue98 ? exp2(productValue152) : exp2(multiplyAddValue174);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float scalarValue38 = rdDot3Precise2(vec3(multiplyAddValue27, multiplyAddValue28, multiplyAddValue29), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        bool comparisonValue93 = fragmentScalarConstants1.packedValues[19u] != 0.0;
        bool comparisonValue94 = fragmentScalarConstants1.packedValues[63u] != 0.0;
        bool comparisonValue95 = fragmentScalarConstants1.packedValues[59u] != 0.0;
        bool comparisonValue96 = comparisonValue93 && (scalarValue38 >= (fragmentVectorConstants1.packedValues[0u].y * 0.180000007152557373046875));
        bool comparisonValue97 = comparisonValue95 && ((fragmentVectorConstants1.packedValues[0u].z * 0.180000007152557373046875) >= scalarValue38);
        bool bitwiseValue28 = comparisonValue95 && (scalarValue38 < 0.180000007152557373046875);
        float scalarValue39 = -fragmentScalarConstants1.packedValues[2u];
        float multiplyAddValue81 = fma(scalarValue39, 0.180000007152557373046875, scalarValue38) / fma(scalarValue39, 0.180000007152557373046875, 0.180000007152557373046875);
        bool bitwiseValue29 = comparisonValue93 && (scalarValue38 > 0.180000007152557373046875);
        float multiplyAddValue82 = (scalarValue38 - 0.180000007152557373046875) / fma(fragmentScalarConstants1.packedValues[1u], 0.180000007152557373046875, -0.180000007152557373046875);
        bool comparisonValue98 = fragmentScalarConstants1.packedValues[68u] != 0.0;
        float multiplyAddValue83 = (comparisonValue96 ? fragmentVectorConstants1.packedValues[4u].x : (comparisonValue97 ? fragmentVectorConstants1.packedValues[14u].x : (comparisonValue94 ? (bitwiseValue28 ? fma(multiplyAddValue81, fragmentVectorConstants1.packedValues[15u].x - fragmentVectorConstants1.packedValues[14u].x, fragmentVectorConstants1.packedValues[14u].x) : (bitwiseValue29 ? fma(multiplyAddValue82, fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[15u].x, fragmentVectorConstants1.packedValues[15u].x) : fragmentVectorConstants1.packedValues[15u].x)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
        float multiplyAddValue84 = (comparisonValue96 ? fragmentVectorConstants1.packedValues[4u].y : (comparisonValue97 ? fragmentVectorConstants1.packedValues[14u].y : (comparisonValue94 ? (bitwiseValue28 ? fma(multiplyAddValue81, fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[14u].y, fragmentVectorConstants1.packedValues[14u].y) : (bitwiseValue29 ? fma(multiplyAddValue82, fragmentVectorConstants1.packedValues[4u].y - fragmentVectorConstants1.packedValues[15u].y, fragmentVectorConstants1.packedValues[15u].y) : fragmentVectorConstants1.packedValues[15u].y)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
        float multiplyAddValue85 = (comparisonValue96 ? fragmentVectorConstants1.packedValues[4u].z : (comparisonValue97 ? fragmentVectorConstants1.packedValues[14u].z : (comparisonValue94 ? (bitwiseValue28 ? fma(multiplyAddValue81, fragmentVectorConstants1.packedValues[15u].z - fragmentVectorConstants1.packedValues[14u].z, fragmentVectorConstants1.packedValues[14u].z) : (bitwiseValue29 ? fma(multiplyAddValue82, fragmentVectorConstants1.packedValues[4u].z - fragmentVectorConstants1.packedValues[15u].z, fragmentVectorConstants1.packedValues[15u].z) : fragmentVectorConstants1.packedValues[15u].z)) : 2.2000000476837158203125))) * fragmentScalarConstants1.packedValues[3u];
        float nonlinearValue8 = log2(multiplyAddValue27);
        float nonlinearValue9 = log2(multiplyAddValue28);
        float nonlinearValue10 = log2(multiplyAddValue29);
        intermediateValue55 = comparisonValue98 ? exp2((1.0 / multiplyAddValue85) * nonlinearValue10) : exp2(log2((multiplyAddValue29 <= 0.003130800090730190277099609375) ? (multiplyAddValue29 * 12.9200000762939453125) : fma(exp2(nonlinearValue10 * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue85));
        intermediateValue56 = comparisonValue98 ? exp2((1.0 / multiplyAddValue84) * nonlinearValue9) : exp2(log2((multiplyAddValue28 <= 0.003130800090730190277099609375) ? (multiplyAddValue28 * 12.9200000762939453125) : fma(exp2(nonlinearValue9 * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue84));
        intermediateValue57 = comparisonValue98 ? exp2((1.0 / multiplyAddValue83) * nonlinearValue8) : exp2(log2((multiplyAddValue27 <= 0.003130800090730190277099609375) ? (multiplyAddValue27 * 12.9200000762939453125) : fma(exp2(nonlinearValue8 * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * (2.2000000476837158203125 / multiplyAddValue83));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue59 = scalarValue5;
        productValue60 = scalarValue6;
        productValue61 = scalarValue7;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    float scalarValue66 = spvNMin(intermediateValue69, 1.0);
    float scalarValue67 = spvNMin(intermediateValue68, 1.0);
    float scalarValue68 = spvNMin(intermediateValue67, 1.0);
    float multiplyAddValue88;
    float multiplyAddValue89;
    float multiplyAddValue90;
    if (fragmentScalarConstants1.packedValues[92u] > 0.0)
    {
        vec4 sampledTextureValue7 = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        precise float sumValue109 = 1.0 - sampledTextureValue7.w;
        multiplyAddValue88 = fma(scalarValue68, sumValue109, sampledTextureValue7.z);
        multiplyAddValue89 = fma(scalarValue67, sumValue109, sampledTextureValue7.y);
        multiplyAddValue90 = fma(scalarValue66, sumValue109, sampledTextureValue7.x);
    }
    else
    {
        multiplyAddValue88 = scalarValue68;
        multiplyAddValue89 = scalarValue67;
        multiplyAddValue90 = scalarValue66;
    }
    fragmentColor0.x = multiplyAddValue90;
    fragmentColor0.y = multiplyAddValue89;
    fragmentColor0.z = multiplyAddValue88;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float scalarValue40 = spvNMin(intermediateValue57, 1.0);
    float scalarValue41 = spvNMin(intermediateValue56, 1.0);
    float scalarValue42 = spvNMin(intermediateValue55, 1.0);
    float multiplyAddValue65;
    float multiplyAddValue66;
    float multiplyAddValue67;
    if (fragmentScalarConstants1.packedValues[92u] > 0.0)
    {
        vec4 sampledTextureValue7 = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        float sumValue4 = 1.0 - sampledTextureValue7.w;
        multiplyAddValue65 = fma(scalarValue42, sumValue4, sampledTextureValue7.z);
        multiplyAddValue66 = fma(scalarValue41, sumValue4, sampledTextureValue7.y);
        multiplyAddValue67 = fma(scalarValue40, sumValue4, sampledTextureValue7.x);
    }
    else
    {
        multiplyAddValue65 = scalarValue42;
        multiplyAddValue66 = scalarValue41;
        multiplyAddValue67 = scalarValue40;
    }
    fragmentColor0.x = multiplyAddValue67;
    fragmentColor0.y = multiplyAddValue66;
    fragmentColor0.z = multiplyAddValue65;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue59;
    fragmentColor0.y = productValue60;
    fragmentColor0.z = productValue61;
#endif
    fragmentColor0.w = 1.0;
}
