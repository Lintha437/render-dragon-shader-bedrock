#version 460
#extension GL_GOOGLE_include_directive : require
// EditorHighlight / HighlightTextureEdge / fragment forward pipeline.
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
#extension GL_EXT_samplerless_texture_functions : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/EditorHighlight/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue16 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue17.x;
    vec4 sampledTextureValue18 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue18.x;
    float scalarValue11 = sampledTextureValue18.y;
    float scalarValue12 = sampledTextureValue18.z;
    float scalarValue18 = sampledTextureValue18.w;
    vec4 sampledTextureValue19 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue19.x;
    float scalarValue14 = sampledTextureValue19.y;
    float scalarValue15 = sampledTextureValue19.z;
    bool comparisonValue = fragmentScalarConstants1.packedValues[28u] != 0.0;
    float intermediateValue24;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
    float intermediateValue29;
    float intermediateValue30;
    if (comparisonValue)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue16 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue17.x;
    vec4 sampledTextureValue18 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue18.x;
    float scalarValue11 = sampledTextureValue18.y;
    float scalarValue12 = sampledTextureValue18.z;
    vec4 sampledTextureValue19 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue19.x;
    float scalarValue14 = sampledTextureValue19.y;
    float scalarValue15 = sampledTextureValue19.z;
    bool comparisonValue = fragmentScalarConstants1.packedValues[28u] != 0.0;
    float intermediateValue23;
    float quotientValue1;
    float quotientValue2;
    float quotientValue3;
    float quotientValue4;
    float quotientValue5;
    float quotientValue6;
    if (comparisonValue)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(sceneTextureDepthTexture, sceneTextureDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    vec4 sampledTextureValue2 = texture(sampler2D(sceneTextureColorTexture, sceneTextureColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.x;
    float scalarValue2 = sampledTextureValue2.y;
    float scalarValue3 = sampledTextureValue2.z;
    float scalarValue4 = sampledTextureValue2.w;
    vec4 sampledTextureValue3 = texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float quotientValue1;
    float quotientValue2;
    float quotientValue3;
    float quotientValue4;
    float quotientValue5;
    float quotientValue6;
    float intermediateValue9;
    if (fragmentVectorConstants1.packedValues[7u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        vec4 sampledTextureValue20 = texelFetch(materialTexture2, ivec2(uvec2(0u)), int(0u));
        float scalarValue16 = sampledTextureValue20.x;
        precise float quotientValue10 = 0.180000007152557373046875 / scalarValue16;
        precise float sumValue9 = quotientValue10 + 9.9999997473787516355514526367188e-05;
        precise float quotientValue11 = scalarValue10 / sumValue9;
        precise float quotientValue12 = scalarValue11 / sumValue9;
        precise float quotientValue13 = scalarValue12 / sumValue9;
        precise float quotientValue14 = scalarValue13 / sumValue9;
        precise float quotientValue15 = scalarValue14 / sumValue9;
        precise float quotientValue16 = scalarValue15 / sumValue9;
        intermediateValue24 = scalarValue16;
        intermediateValue25 = quotientValue13;
        intermediateValue26 = quotientValue12;
        intermediateValue27 = quotientValue11;
        intermediateValue28 = quotientValue16;
        intermediateValue29 = quotientValue15;
        intermediateValue30 = quotientValue14;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue20 = texelFetch(materialTexture2, ivec2(uvec2(0u)), int(0u));
        float scalarValue16 = sampledTextureValue20.x;
        float quotientValue8 = (0.180000007152557373046875 / scalarValue16) + 9.9999997473787516355514526367188e-05;
        intermediateValue23 = scalarValue16;
        quotientValue1 = scalarValue12 / quotientValue8;
        quotientValue2 = scalarValue11 / quotientValue8;
        quotientValue3 = scalarValue10 / quotientValue8;
        quotientValue4 = scalarValue15 / quotientValue8;
        quotientValue5 = scalarValue14 / quotientValue8;
        quotientValue6 = scalarValue13 / quotientValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue4 = texelFetch(previousFrameAverageLuminanceTexture, ivec2(uvec2(0u)), int(0u));
        float scalarValue8 = sampledTextureValue4.x;
        float quotientValue = (0.180000007152557373046875 / scalarValue8) + 9.9999997473787516355514526367188e-05;
        quotientValue1 = scalarValue1 / quotientValue;
        quotientValue2 = scalarValue2 / quotientValue;
        quotientValue3 = scalarValue3 / quotientValue;
        quotientValue4 = scalarValue5 / quotientValue;
        quotientValue5 = scalarValue6 / quotientValue;
        quotientValue6 = scalarValue7 / quotientValue;
        intermediateValue9 = scalarValue8;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue24 = 1.0;
        intermediateValue25 = scalarValue12;
        intermediateValue26 = scalarValue11;
        intermediateValue27 = scalarValue10;
        intermediateValue28 = scalarValue15;
        intermediateValue29 = scalarValue14;
        intermediateValue30 = scalarValue13;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue23 = 1.0;
        quotientValue1 = scalarValue12;
        quotientValue2 = scalarValue11;
        quotientValue3 = scalarValue10;
        quotientValue4 = scalarValue15;
        quotientValue5 = scalarValue14;
        quotientValue6 = scalarValue13;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        quotientValue1 = scalarValue1;
        quotientValue2 = scalarValue2;
        quotientValue3 = scalarValue3;
        quotientValue4 = scalarValue5;
        quotientValue5 = scalarValue6;
        quotientValue6 = scalarValue7;
        intermediateValue9 = 1.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue23 = fragmentScalarConstants1.packedValues[24u] * fragmentVectorConstants1.packedValues[8u].z;
    precise float productValue24 = fragmentScalarConstants1.packedValues[24u] * fragmentVectorConstants1.packedValues[8u].w;
    float scalarValue17 = -fragmentScalarConstants1.packedValues[24u];
    float multiplyAddValue18 = fma(productValue23, -1.0, varyingTexCoord0.x);
    float multiplyAddValue19 = fma(productValue24, 0.0, varyingTexCoord0.y);
    float multiplyAddValue20 = fma(productValue24, 1.0, varyingTexCoord0.y);
    float multiplyAddValue21 = fma(productValue23, 0.0, varyingTexCoord0.x);
    float multiplyAddValue22 = fma(productValue24, -1.0, varyingTexCoord0.y);
    float multiplyAddValue23 = fma(productValue23, 1.0, varyingTexCoord0.x);
    float sampledTextureValue21 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(scalarValue17, fragmentVectorConstants1.packedValues[8u].z, varyingTexCoord0.x), fma(scalarValue17, fragmentVectorConstants1.packedValues[8u].w, varyingTexCoord0.y))).w);
    float sampledTextureValue29 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue18, multiplyAddValue20)).w);
    float sampledTextureValue30 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue23, multiplyAddValue22)).w);
    float sampledTextureValue24 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fragmentScalarConstants1.packedValues[24u], fragmentVectorConstants1.packedValues[8u].z, varyingTexCoord0.x), fma(fragmentScalarConstants1.packedValues[24u], fragmentVectorConstants1.packedValues[8u].w, varyingTexCoord0.y))).w);
    precise float sampledTextureValue31 = rdDot3Precise2(vec3(sampledTextureValue30, ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue23, multiplyAddValue19)).w), sampledTextureValue24), vec3(-1.0, -2.0, -1.0)) + rdDot3Precise2(vec3(sampledTextureValue21, ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue18, multiplyAddValue19)).w), sampledTextureValue29), vec3(1.0, 2.0, 1.0));
    precise float sampledTextureValue32 = rdDot2Precise(vec2(sampledTextureValue21, sampledTextureValue29), vec2(1.0, -1.0)) + rdDot2Precise(vec2(ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue21, multiplyAddValue22)).w), ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue21, multiplyAddValue20)).w)), vec2(2.0, -2.0));
    precise float sumValue10 = sampledTextureValue32 + rdDot2Precise(vec2(sampledTextureValue30, sampledTextureValue24), vec2(1.0, -1.0));
    precise float productValue25 = sumValue10 * sumValue10;
    precise float sumValue11 = fragmentVectorConstants1.packedValues[0u].x - intermediateValue30;
    precise float sumValue12 = fragmentVectorConstants1.packedValues[0u].y - intermediateValue29;
    precise float sumValue13 = fragmentVectorConstants1.packedValues[0u].z - intermediateValue28;
    float multiplyAddValue24 = fma(fragmentScalarConstants1.packedValues[3u], sumValue11, intermediateValue30);
    float multiplyAddValue25 = fma(fragmentScalarConstants1.packedValues[3u], sumValue12, intermediateValue29);
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[3u], sumValue13, intermediateValue28);
    precise float sumValue14 = intermediateValue27 - multiplyAddValue24;
    precise float sumValue15 = intermediateValue26 - multiplyAddValue25;
    precise float sumValue16 = intermediateValue25 - multiplyAddValue26;
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[4u], sumValue14, multiplyAddValue24);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[4u], sumValue15, multiplyAddValue25);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[4u], sumValue16, multiplyAddValue26);
    precise float productValue26 = fragmentScalarConstants1.packedValues[16u] * fragmentVectorConstants1.packedValues[8u].z;
    precise float productValue27 = fragmentScalarConstants1.packedValues[16u] * fragmentVectorConstants1.packedValues[8u].w;
    float multiplyAddValue30 = fma(productValue27, 0.0, varyingTexCoord0.y);
    float multiplyAddValue31 = fma(productValue26, 0.0, varyingTexCoord0.x);
    float multiplyAddValue6 = fma(scalarValue9, 9999.0, 1.0);
    float sampledTextureValue33 = rdDot3Precise2(vec3(fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(productValue26, -1.0, varyingTexCoord0.x), multiplyAddValue30)).x, 9999.0, 1.0), multiplyAddValue6, fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(productValue26, 1.0, varyingTexCoord0.x), multiplyAddValue30)).x, 9999.0, 1.0)), vec3(-1.0, 2.0, -1.0));
    float sampledTextureValue34 = rdDot3Precise2(vec3(fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue31, fma(productValue27, -1.0, varyingTexCoord0.y))).x, 9999.0, 1.0), multiplyAddValue6, fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue31, fma(productValue27, 1.0, varyingTexCoord0.y))).x, 9999.0, 1.0)), vec3(-1.0, 2.0, -1.0));
    precise float productValue28 = sampledTextureValue34 * sampledTextureValue34;
    precise float multiplyAddValue32 = float(sqrt(fma(sampledTextureValue33, sampledTextureValue33, productValue28)) > 0.00999999977648258209228515625) * fragmentScalarConstants1.packedValues[15u];
    precise float sumValue17 = fragmentVectorConstants1.packedValues[3u].x - multiplyAddValue27;
    precise float sumValue18 = fragmentVectorConstants1.packedValues[3u].y - multiplyAddValue28;
    precise float sumValue19 = fragmentVectorConstants1.packedValues[3u].z - multiplyAddValue29;
    float multiplyAddValue33 = fma(multiplyAddValue32, sumValue17, multiplyAddValue27);
    float multiplyAddValue34 = fma(multiplyAddValue32, sumValue18, multiplyAddValue28);
    float multiplyAddValue35 = fma(multiplyAddValue32, sumValue19, multiplyAddValue29);
    precise float sumValue20 = scalarValue9 + 1.1999999571798980468884110450745e-07;
    precise float sumValue21 = scalarValue9 - 1.1999999571798980468884110450745e-07;
    bool conditionValue = sumValue20 < 1.0;
    bool comparisonValue2 = sampledTextureValue16.x >= sumValue21;
    precise float multiplyAddValue36 = sqrt(fma(sampledTextureValue31, sampledTextureValue31, productValue25)) * fragmentScalarConstants1.packedValues[23u];
    precise float sumValue22 = fragmentVectorConstants1.packedValues[5u].x - intermediateValue27;
    precise float sumValue23 = fragmentVectorConstants1.packedValues[5u].y - intermediateValue26;
    precise float sumValue24 = fragmentVectorConstants1.packedValues[5u].z - intermediateValue25;
    float multiplyAddValue37 = fma(multiplyAddValue36, sumValue22, intermediateValue27);
    float multiplyAddValue38 = fma(multiplyAddValue36, sumValue23, intermediateValue26);
    float multiplyAddValue39 = fma(multiplyAddValue36, sumValue24, intermediateValue25);
    precise float sumValue25 = multiplyAddValue33 - multiplyAddValue37;
    precise float sumValue26 = multiplyAddValue34 - multiplyAddValue38;
    precise float sumValue27 = multiplyAddValue35 - multiplyAddValue39;
    float multiplyAddValue40 = conditionValue ? (comparisonValue2 ? multiplyAddValue33 : fma(fragmentScalarConstants1.packedValues[8u], sumValue25, multiplyAddValue37)) : intermediateValue27;
    float multiplyAddValue41 = conditionValue ? (comparisonValue2 ? multiplyAddValue34 : fma(fragmentScalarConstants1.packedValues[8u], sumValue26, multiplyAddValue38)) : intermediateValue26;
    float multiplyAddValue42 = conditionValue ? (comparisonValue2 ? multiplyAddValue35 : fma(fragmentScalarConstants1.packedValues[8u], sumValue27, multiplyAddValue39)) : intermediateValue25;
    precise float quotientValue17 = 0.180000007152557373046875 / intermediateValue24;
    precise float sumValue28 = quotientValue17 + 9.9999997473787516355514526367188e-05;
    precise float productValue29 = sumValue28 * multiplyAddValue40;
    precise float productValue30 = sumValue28 * multiplyAddValue41;
    precise float productValue31 = sumValue28 * multiplyAddValue42;
    fragmentColor0.x = comparisonValue ? productValue29 : multiplyAddValue40;
    fragmentColor0.y = comparisonValue ? productValue30 : multiplyAddValue41;
    fragmentColor0.z = comparisonValue ? productValue31 : multiplyAddValue42;
    fragmentColor0.w = conditionValue ? (comparisonValue2 ? fragmentScalarConstants1.packedValues[4u] : fma(multiplyAddValue36, 0.0, scalarValue18)) : scalarValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float productValue19 = fragmentScalarConstants1.packedValues[24u] * fragmentVectorConstants1.packedValues[8u].z;
    float productValue20 = fragmentScalarConstants1.packedValues[24u] * fragmentVectorConstants1.packedValues[8u].w;
    float scalarValue17 = -fragmentScalarConstants1.packedValues[24u];
    float sumValue4 = varyingTexCoord0.x - productValue19;
    float sumValue5 = productValue20 + varyingTexCoord0.y;
    float sumValue6 = varyingTexCoord0.y - productValue20;
    float sumValue7 = productValue19 + varyingTexCoord0.x;
    float sampledTextureValue21 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(scalarValue17, fragmentVectorConstants1.packedValues[8u].z, varyingTexCoord0.x), fma(scalarValue17, fragmentVectorConstants1.packedValues[8u].w, varyingTexCoord0.y))).w);
    float sampledTextureValue22 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(sumValue4, sumValue5)).w);
    float sampledTextureValue23 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(sumValue7, sumValue6)).w);
    float sampledTextureValue24 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fragmentScalarConstants1.packedValues[24u], fragmentVectorConstants1.packedValues[8u].z, varyingTexCoord0.x), fma(fragmentScalarConstants1.packedValues[24u], fragmentVectorConstants1.packedValues[8u].w, varyingTexCoord0.y))).w);
    float sampledTextureValue25 = rdDot3Precise2(vec3(sampledTextureValue21, ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(sumValue4, varyingTexCoord0.y)).w), sampledTextureValue22), vec3(1.0, 2.0, 1.0)) + rdDot3Precise2(vec3(sampledTextureValue23, ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(sumValue7, varyingTexCoord0.y)).w), sampledTextureValue24), vec3(-1.0, -2.0, -1.0));
    float sampledTextureValue26 = rdDot2Precise(vec2(sampledTextureValue23, sampledTextureValue24), vec2(1.0, -1.0)) + (rdDot2Precise(vec2(ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, sumValue6)).w), ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, sumValue5)).w)), vec2(2.0, -2.0)) + rdDot2Precise(vec2(sampledTextureValue21, sampledTextureValue22), vec2(1.0, -1.0)));
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - quotientValue6, quotientValue6);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - quotientValue5, quotientValue5);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - quotientValue4, quotientValue4);
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[4u], quotientValue3 - multiplyAddValue, multiplyAddValue);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[4u], quotientValue2 - multiplyAddValue1, multiplyAddValue1);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[4u], quotientValue1 - multiplyAddValue2, multiplyAddValue2);
    float productValue21 = fragmentScalarConstants1.packedValues[16u] * fragmentVectorConstants1.packedValues[8u].z;
    float productValue22 = fragmentScalarConstants1.packedValues[16u] * fragmentVectorConstants1.packedValues[8u].w;
    float multiplyAddValue6 = fma(scalarValue9, 9999.0, 1.0);
    float sampledTextureValue27 = rdDot3Precise2(vec3(fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x - productValue21, varyingTexCoord0.y)).x, 9999.0, 1.0), multiplyAddValue6, fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(productValue21 + varyingTexCoord0.x, varyingTexCoord0.y)).x, 9999.0, 1.0)), vec3(-1.0, 2.0, -1.0));
    float sampledTextureValue28 = rdDot3Precise2(vec3(fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y - productValue22)).x, 9999.0, 1.0), multiplyAddValue6, fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, productValue22 + varyingTexCoord0.y)).x, 9999.0, 1.0)), vec3(-1.0, 2.0, -1.0));
    bool multiplyAddValue7 = sqrt(fma(sampledTextureValue27, sampledTextureValue27, sampledTextureValue28 * sampledTextureValue28)) > 0.00999999977648258209228515625;
    float multiplyAddValue8 = multiplyAddValue7 ? fma(fragmentVectorConstants1.packedValues[3u].x - multiplyAddValue3, fragmentScalarConstants1.packedValues[15u], multiplyAddValue3) : multiplyAddValue3;
    float multiplyAddValue9 = multiplyAddValue7 ? fma(fragmentVectorConstants1.packedValues[3u].y - multiplyAddValue4, fragmentScalarConstants1.packedValues[15u], multiplyAddValue4) : multiplyAddValue4;
    float multiplyAddValue10 = multiplyAddValue7 ? fma(fragmentVectorConstants1.packedValues[3u].z - multiplyAddValue5, fragmentScalarConstants1.packedValues[15u], multiplyAddValue5) : multiplyAddValue5;
    bool sumValue8 = (scalarValue9 + 1.1999999571798980468884110450745e-07) < 1.0;
    bool comparisonValue1 = sampledTextureValue16.x >= (scalarValue9 - 1.1999999571798980468884110450745e-07);
    float multiplyAddValue11 = sqrt(fma(sampledTextureValue25, sampledTextureValue25, sampledTextureValue26 * sampledTextureValue26)) * fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue12 = fma(multiplyAddValue11, fragmentVectorConstants1.packedValues[5u].x - quotientValue3, quotientValue3);
    float multiplyAddValue13 = fma(multiplyAddValue11, fragmentVectorConstants1.packedValues[5u].y - quotientValue2, quotientValue2);
    float multiplyAddValue14 = fma(multiplyAddValue11, fragmentVectorConstants1.packedValues[5u].z - quotientValue1, quotientValue1);
    float multiplyAddValue15 = sumValue8 ? (comparisonValue1 ? multiplyAddValue8 : fma(fragmentScalarConstants1.packedValues[8u], multiplyAddValue8 - multiplyAddValue12, multiplyAddValue12)) : quotientValue3;
    float multiplyAddValue16 = sumValue8 ? (comparisonValue1 ? multiplyAddValue9 : fma(fragmentScalarConstants1.packedValues[8u], multiplyAddValue9 - multiplyAddValue13, multiplyAddValue13)) : quotientValue2;
    float multiplyAddValue17 = sumValue8 ? (comparisonValue1 ? multiplyAddValue10 : fma(fragmentScalarConstants1.packedValues[8u], multiplyAddValue10 - multiplyAddValue14, multiplyAddValue14)) : quotientValue1;
    float quotientValue9 = (0.180000007152557373046875 / intermediateValue23) + 9.9999997473787516355514526367188e-05;
    fragmentColor0.x = comparisonValue ? (quotientValue9 * multiplyAddValue15) : multiplyAddValue15;
    fragmentColor0.y = comparisonValue ? (quotientValue9 * multiplyAddValue16) : multiplyAddValue16;
    fragmentColor0.z = comparisonValue ? (quotientValue9 * multiplyAddValue17) : multiplyAddValue17;
    fragmentColor0.w = (sumValue8 && comparisonValue1) ? fragmentScalarConstants1.packedValues[4u] : sampledTextureValue18.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = fragmentVectorConstants1.packedValues[8u].z * fragmentVectorConstants1.packedValues[6u].x;
    float productValue1 = fragmentVectorConstants1.packedValues[8u].w * fragmentVectorConstants1.packedValues[6u].x;
    float sumValue = varyingTexCoord0.x - productValue;
    float sumValue1 = varyingTexCoord0.y - productValue1;
    float sumValue2 = productValue1 + varyingTexCoord0.y;
    float sumValue3 = productValue + varyingTexCoord0.x;
    float sampledTextureValue5 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue, sumValue1)).w);
    float sampledTextureValue6 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue, varyingTexCoord0.y)).w);
    float sampledTextureValue7 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue, sumValue2)).w);
    float sampledTextureValue8 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(varyingTexCoord0.x, sumValue1)).w);
    float sampledTextureValue9 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(varyingTexCoord0.x, sumValue2)).w);
    float sampledTextureValue10 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue3, sumValue1)).w);
    float sampledTextureValue11 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue3, varyingTexCoord0.y)).w);
    float sampledTextureValue12 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue3, sumValue2)).w);
    float dotProductValue = (dot(vec3(0.0), vec3(sampledTextureValue8, 0.0, sampledTextureValue9)) + dot(vec3(1.0, 2.0, 1.0), vec3(sampledTextureValue5, sampledTextureValue6, sampledTextureValue7))) + dot(vec3(-1.0, -2.0, -1.0), vec3(sampledTextureValue10, sampledTextureValue11, sampledTextureValue12));
    float dotProductValue1 = (dot(vec3(2.0, 0.0, -2.0), vec3(sampledTextureValue8, 0.0, sampledTextureValue9)) + dot(vec3(1.0, 0.0, -1.0), vec3(sampledTextureValue5, sampledTextureValue6, sampledTextureValue7))) + dot(vec3(1.0, 0.0, -1.0), vec3(sampledTextureValue10, sampledTextureValue11, sampledTextureValue12));
    float productValue2 = ((fragmentVectorConstants1.packedValues[0u].x - quotientValue4) * fragmentVectorConstants1.packedValues[0u].w) + quotientValue4;
    float productValue3 = ((fragmentVectorConstants1.packedValues[0u].y - quotientValue5) * fragmentVectorConstants1.packedValues[0u].w) + quotientValue5;
    float productValue4 = ((fragmentVectorConstants1.packedValues[0u].z - quotientValue6) * fragmentVectorConstants1.packedValues[0u].w) + quotientValue6;
    float productValue5 = ((quotientValue1 - productValue2) * fragmentVectorConstants1.packedValues[1u].x) + productValue2;
    float productValue6 = ((quotientValue2 - productValue3) * fragmentVectorConstants1.packedValues[1u].x) + productValue3;
    float productValue7 = ((quotientValue3 - productValue4) * fragmentVectorConstants1.packedValues[1u].x) + productValue4;
    float productValue8 = fragmentVectorConstants1.packedValues[8u].z * fragmentVectorConstants1.packedValues[4u].x;
    float productValue9 = fragmentVectorConstants1.packedValues[8u].w * fragmentVectorConstants1.packedValues[4u].x;
    float sampledTextureValue13 = (texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x * 9999.0) + 1.0;
    float sampledTextureValue14 = dot(vec3(-1.0, 2.0, -1.0), vec3((texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x - productValue8, varyingTexCoord0.y)).x * 9999.0) + 1.0, sampledTextureValue13, (texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(productValue8 + varyingTexCoord0.x, varyingTexCoord0.y)).x * 9999.0) + 1.0));
    float sampledTextureValue15 = dot(vec3(-1.0, 2.0, -1.0), vec3((texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y - productValue9)).x * 9999.0) + 1.0, sampledTextureValue13, (texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x, productValue9 + varyingTexCoord0.y)).x * 9999.0) + 1.0));
    float nonlinearValue = float(sqrt((sampledTextureValue15 * sampledTextureValue15) + (sampledTextureValue14 * sampledTextureValue14)) > 0.00999999977648258209228515625) * fragmentVectorConstants1.packedValues[3u].w;
    float productValue10 = ((fragmentVectorConstants1.packedValues[3u].x - productValue5) * nonlinearValue) + productValue5;
    float productValue11 = ((fragmentVectorConstants1.packedValues[3u].y - productValue6) * nonlinearValue) + productValue6;
    float productValue12 = ((fragmentVectorConstants1.packedValues[3u].z - productValue7) * nonlinearValue) + productValue7;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue + 1.1999999571798980468884110450745e-07) < 1.0)
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (!((scalarValue + (-1.1999999571798980468884110450745e-07)) <= sampledTextureValue.x))
        {
            float nonlinearValue1 = fragmentVectorConstants1.packedValues[5u].w * sqrt((dotProductValue1 * dotProductValue1) + (dotProductValue * dotProductValue));
            float productValue13 = ((fragmentVectorConstants1.packedValues[5u].x - quotientValue1) * nonlinearValue1) + quotientValue1;
            float productValue14 = ((fragmentVectorConstants1.packedValues[5u].y - quotientValue2) * nonlinearValue1) + quotientValue2;
            float productValue15 = ((fragmentVectorConstants1.packedValues[5u].z - quotientValue3) * nonlinearValue1) + quotientValue3;
            branchMergedValue = ((productValue10 - productValue13) * fragmentVectorConstants1.packedValues[2u].x) + productValue13;
            branchMergedValue1 = ((productValue11 - productValue14) * fragmentVectorConstants1.packedValues[2u].x) + productValue14;
            branchMergedValue2 = ((productValue12 - productValue15) * fragmentVectorConstants1.packedValues[2u].x) + productValue15;
            branchMergedValue3 = scalarValue4;
        }
        else
        {
            branchMergedValue = productValue10;
            branchMergedValue1 = productValue11;
            branchMergedValue2 = productValue12;
            branchMergedValue3 = fragmentVectorConstants1.packedValues[1u].x;
        }
        intermediateValue10 = branchMergedValue;
        intermediateValue11 = branchMergedValue1;
        intermediateValue12 = branchMergedValue2;
        intermediateValue13 = branchMergedValue3;
    }
    else
    {
        intermediateValue10 = quotientValue1;
        intermediateValue11 = quotientValue2;
        intermediateValue12 = quotientValue3;
        intermediateValue13 = scalarValue4;
    }
    float productValue16;
    float productValue17;
    float productValue18;
    if (fragmentVectorConstants1.packedValues[7u].x != 0.0)
    {
        float quotientValue7 = (0.180000007152557373046875 / intermediateValue9) + 9.9999997473787516355514526367188e-05;
        productValue16 = quotientValue7 * intermediateValue10;
        productValue17 = quotientValue7 * intermediateValue11;
        productValue18 = quotientValue7 * intermediateValue12;
    }
    else
    {
        productValue16 = intermediateValue10;
        productValue17 = intermediateValue11;
        productValue18 = intermediateValue12;
    }
    fragmentColor0.x = productValue16;
    fragmentColor0.y = productValue17;
    fragmentColor0.z = productValue18;
    fragmentColor0.w = intermediateValue13;
#endif
}
