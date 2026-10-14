#version 460
#extension GL_GOOGLE_include_directive : require
// EditorHighlight / Highlight / fragment forward pipeline.
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
    vec4 sampledTextureValue20 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue21.x;
    vec4 sampledTextureValue22 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue22.x;
    float scalarValue14 = sampledTextureValue22.y;
    float scalarValue15 = sampledTextureValue22.z;
    float scalarValue16 = sampledTextureValue22.w;
    vec4 sampledTextureValue23 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue17 = sampledTextureValue23.x;
    float scalarValue18 = sampledTextureValue23.y;
    float scalarValue19 = sampledTextureValue23.z;
    float multiplyAddValue18 = fma(varyingTexCoord0.x, 2.0, -1.0);
    float multiplyAddValue19 = -fma(varyingTexCoord0.y, 2.0, -1.0);
    precise float productValue49 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[7u].x;
    precise float productValue50 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[7u].y;
    precise float productValue51 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[7u].z;
    precise float productValue52 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[7u].w;
    precise float multiplyAddValue58 = fma(fragmentVectorConstants1.packedValues[8u].x, scalarValue12, fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue18, productValue49)) + fragmentVectorConstants1.packedValues[9u].x;
    precise float multiplyAddValue59 = fma(fragmentVectorConstants1.packedValues[8u].y, scalarValue12, fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue18, productValue50)) + fragmentVectorConstants1.packedValues[9u].y;
    precise float multiplyAddValue60 = fma(fragmentVectorConstants1.packedValues[8u].z, scalarValue12, fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue18, productValue51)) + fragmentVectorConstants1.packedValues[9u].z;
    precise float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[8u].w, scalarValue12, fma(fragmentVectorConstants1.packedValues[6u].w, multiplyAddValue18, productValue52)) + fragmentVectorConstants1.packedValues[9u].w;
    precise float quotientValue10 = multiplyAddValue59 / multiplyAddValue61;
    precise float quotientValue11 = multiplyAddValue60 / multiplyAddValue61;
    precise float quotientValue12 = multiplyAddValue58 / multiplyAddValue61;
    precise float sumValue14 = quotientValue11 + fragmentVectorConstants1.packedValues[3u].z;
    precise float sumValue15 = quotientValue10 + fragmentVectorConstants1.packedValues[3u].y;
    precise float sumValue16 = quotientValue12 + fragmentVectorConstants1.packedValues[3u].x;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[14u].z, -1.0, varyingTexCoord0.x);
    float multiplyAddValue63 = fma(fragmentVectorConstants1.packedValues[14u].w, 0.0, varyingTexCoord0.y);
    float multiplyAddValue64 = fma(fragmentVectorConstants1.packedValues[14u].z, 0.0, varyingTexCoord0.x);
    float multiplyAddValue65 = fma(fragmentVectorConstants1.packedValues[14u].w, -1.0, varyingTexCoord0.y);
    vec4 sampledTextureValue36 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue62, multiplyAddValue63));
    float scalarValue25 = sampledTextureValue36.x;
    vec4 sampledTextureValue37 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue64, multiplyAddValue65));
    float scalarValue26 = sampledTextureValue37.x;
    float multiplyAddValue66 = fma(multiplyAddValue62, 2.0, -1.0);
    float multiplyAddValue67 = fma(multiplyAddValue64, 2.0, -1.0);
    float multiplyAddValue68 = -fma(multiplyAddValue63, 2.0, -1.0);
    precise float productValue53 = multiplyAddValue68 * fragmentVectorConstants1.packedValues[7u].x;
    precise float productValue54 = multiplyAddValue68 * fragmentVectorConstants1.packedValues[7u].y;
    precise float productValue55 = multiplyAddValue68 * fragmentVectorConstants1.packedValues[7u].z;
    precise float productValue56 = multiplyAddValue68 * fragmentVectorConstants1.packedValues[7u].w;
    precise float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[8u].x, scalarValue25, fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue66, productValue53)) + fragmentVectorConstants1.packedValues[9u].x;
    precise float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[8u].y, scalarValue25, fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue66, productValue54)) + fragmentVectorConstants1.packedValues[9u].y;
    precise float multiplyAddValue71 = fma(fragmentVectorConstants1.packedValues[8u].z, scalarValue25, fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue66, productValue55)) + fragmentVectorConstants1.packedValues[9u].z;
    precise float multiplyAddValue72 = fma(fragmentVectorConstants1.packedValues[8u].w, scalarValue25, fma(fragmentVectorConstants1.packedValues[6u].w, multiplyAddValue66, productValue56)) + fragmentVectorConstants1.packedValues[9u].w;
    precise float quotientValue13 = multiplyAddValue71 / multiplyAddValue72;
    precise float quotientValue14 = multiplyAddValue69 / multiplyAddValue72;
    precise float quotientValue15 = multiplyAddValue70 / multiplyAddValue72;
    float multiplyAddValue73 = -fma(multiplyAddValue65, 2.0, -1.0);
    precise float productValue57 = multiplyAddValue73 * fragmentVectorConstants1.packedValues[7u].x;
    precise float productValue58 = multiplyAddValue73 * fragmentVectorConstants1.packedValues[7u].y;
    precise float productValue59 = multiplyAddValue73 * fragmentVectorConstants1.packedValues[7u].z;
    precise float productValue60 = multiplyAddValue73 * fragmentVectorConstants1.packedValues[7u].w;
    precise float multiplyAddValue74 = fma(fragmentVectorConstants1.packedValues[8u].x, scalarValue26, fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue67, productValue57)) + fragmentVectorConstants1.packedValues[9u].x;
    precise float multiplyAddValue75 = fma(fragmentVectorConstants1.packedValues[8u].y, scalarValue26, fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue67, productValue58)) + fragmentVectorConstants1.packedValues[9u].y;
    precise float multiplyAddValue76 = fma(fragmentVectorConstants1.packedValues[8u].z, scalarValue26, fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue67, productValue59)) + fragmentVectorConstants1.packedValues[9u].z;
    precise float multiplyAddValue77 = fma(fragmentVectorConstants1.packedValues[8u].w, scalarValue26, fma(fragmentVectorConstants1.packedValues[6u].w, multiplyAddValue67, productValue60)) + fragmentVectorConstants1.packedValues[9u].w;
    precise float quotientValue16 = multiplyAddValue75 / multiplyAddValue77;
    precise float quotientValue17 = multiplyAddValue76 / multiplyAddValue77;
    precise float quotientValue18 = multiplyAddValue74 / multiplyAddValue77;
    precise float sumValue17 = quotientValue13 - quotientValue11;
    precise float sumValue18 = quotientValue14 - quotientValue12;
    precise float sumValue19 = quotientValue15 - quotientValue10;
    precise float sumValue20 = quotientValue16 - quotientValue10;
    precise float sumValue21 = quotientValue17 - quotientValue11;
    precise float sumValue22 = quotientValue18 - quotientValue12;
    precise float productValue61 = sumValue20 * sumValue17;
    precise float productValue62 = sumValue21 * sumValue18;
    precise float productValue63 = sumValue22 * sumValue19;
    float multiplyAddValue78 = fma(sumValue19, sumValue21, -productValue61);
    float multiplyAddValue79 = fma(sumValue17, sumValue22, -productValue62);
    float multiplyAddValue80 = fma(sumValue18, sumValue20, -productValue63);
    vec3 vectorValue1 = vec3(multiplyAddValue78, multiplyAddValue79, multiplyAddValue80);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    precise float productValue64 = multiplyAddValue78 * inverseLengthValue2;
    precise float productValue65 = multiplyAddValue79 * inverseLengthValue2;
    precise float productValue66 = multiplyAddValue80 * inverseLengthValue2;
    precise float productValue67 = productValue64 * 10.0;
    precise float productValue68 = productValue65 * 10.0;
    precise float productValue69 = productValue66 * 10.0;
    precise float productValue70 = roundEven(productValue67) * 0.100000001490116119384765625;
    precise float productValue71 = roundEven(productValue68) * 0.100000001490116119384765625;
    precise float productValue72 = roundEven(productValue69) * 0.100000001490116119384765625;
    precise float productValue73 = productValue70 * sumValue14;
    precise float productValue74 = productValue70 * sumValue15;
    precise float productValue75 = productValue71 * sumValue16;
    precise float productValue76 = productValue71 * sumValue14;
    precise float sumValue23 = productValue75 + productValue73;
    precise float sumValue24 = productValue76 + productValue74;
    precise float multiplyAddValue81 = fma(sumValue16, productValue72, sumValue23) / fragmentScalarConstants1.packedValues[48u];
    precise float multiplyAddValue82 = fma(sumValue15, productValue72, sumValue24) / fragmentScalarConstants1.packedValues[48u];
    vec4 sampledTextureValue38 = texture(sampler2D(materialTexture5, textureSampler5), vec2(fract(multiplyAddValue81), fract(multiplyAddValue82)));
    float scalarValue27 = sampledTextureValue38.w;
    precise float sumValue25 = sampledTextureValue38.x - scalarValue17;
    precise float sumValue26 = sampledTextureValue38.y - scalarValue18;
    precise float sumValue27 = sampledTextureValue38.z - scalarValue19;
    float multiplyAddValue83 = fma(scalarValue27, sumValue25, scalarValue17);
    float multiplyAddValue84 = fma(scalarValue27, sumValue26, scalarValue18);
    float multiplyAddValue85 = fma(scalarValue27, sumValue27, scalarValue19);
    bool comparisonValue = fragmentScalarConstants1.packedValues[52u] != 0.0;
    float intermediateValue30;
    float intermediateValue31;
    float intermediateValue32;
    float intermediateValue33;
    float intermediateValue34;
    float intermediateValue35;
    float intermediateValue36;
    if (comparisonValue)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue20 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue21.x;
    vec4 sampledTextureValue22 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue22.x;
    float scalarValue14 = sampledTextureValue22.y;
    float scalarValue15 = sampledTextureValue22.z;
    float scalarValue16 = sampledTextureValue22.w;
    vec4 sampledTextureValue23 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue17 = sampledTextureValue23.x;
    float scalarValue18 = sampledTextureValue23.y;
    float scalarValue19 = sampledTextureValue23.z;
    float multiplyAddValue18 = fma(varyingTexCoord0.x, 2.0, -1.0);
    float multiplyAddValue19 = -fma(varyingTexCoord0.y, 2.0, -1.0);
    float productValue37 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[7u].x;
    float productValue38 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[7u].y;
    float productValue39 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[7u].z;
    float productValue40 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[8u].w, scalarValue12, fma(fragmentVectorConstants1.packedValues[6u].w, multiplyAddValue18, productValue40)) + fragmentVectorConstants1.packedValues[9u].w;
    float multiplyAddValue21 = (fma(fragmentVectorConstants1.packedValues[8u].y, scalarValue12, fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue18, productValue38)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue20;
    float multiplyAddValue22 = (fma(fragmentVectorConstants1.packedValues[8u].z, scalarValue12, fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue18, productValue39)) + fragmentVectorConstants1.packedValues[9u].z) / multiplyAddValue20;
    float multiplyAddValue23 = (fma(fragmentVectorConstants1.packedValues[8u].x, scalarValue12, fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue18, productValue37)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue20;
    float sumValue6 = multiplyAddValue22 + fragmentVectorConstants1.packedValues[3u].z;
    float sumValue7 = multiplyAddValue21 + fragmentVectorConstants1.packedValues[3u].y;
    float sumValue8 = multiplyAddValue23 + fragmentVectorConstants1.packedValues[3u].x;
    float sumValue = varyingTexCoord0.x - fragmentVectorConstants1.packedValues[14u].z;
    float sumValue1 = varyingTexCoord0.y - fragmentVectorConstants1.packedValues[14u].w;
    vec4 sampledTextureValue24 = texture(sampler2D(materialTexture1, textureSampler1), vec2(sumValue, varyingTexCoord0.y));
    float scalarValue20 = sampledTextureValue24.x;
    vec4 sampledTextureValue25 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, sumValue1));
    float scalarValue21 = sampledTextureValue25.x;
    float multiplyAddValue24 = fma(sumValue, 2.0, -1.0);
    float multiplyAddValue25 = fma(fragmentVectorConstants1.packedValues[8u].w, scalarValue20, fma(fragmentVectorConstants1.packedValues[6u].w, multiplyAddValue24, productValue40)) + fragmentVectorConstants1.packedValues[9u].w;
    float multiplyAddValue26 = -fma(sumValue1, 2.0, -1.0);
    float multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[8u].w, scalarValue21, fma(fragmentVectorConstants1.packedValues[6u].w, multiplyAddValue18, multiplyAddValue26 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float multiplyAddValue28 = ((fma(fragmentVectorConstants1.packedValues[8u].z, scalarValue20, fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue24, productValue39)) + fragmentVectorConstants1.packedValues[9u].z) / multiplyAddValue25) - multiplyAddValue22;
    float multiplyAddValue29 = ((fma(fragmentVectorConstants1.packedValues[8u].x, scalarValue20, fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue24, productValue37)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue25) - multiplyAddValue23;
    float multiplyAddValue30 = ((fma(fragmentVectorConstants1.packedValues[8u].y, scalarValue20, fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue24, productValue38)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue25) - multiplyAddValue21;
    float multiplyAddValue31 = ((fma(fragmentVectorConstants1.packedValues[8u].y, scalarValue21, fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue18, multiplyAddValue26 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue27) - multiplyAddValue21;
    float multiplyAddValue32 = ((fma(fragmentVectorConstants1.packedValues[8u].z, scalarValue21, fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue18, multiplyAddValue26 * fragmentVectorConstants1.packedValues[7u].z)) + fragmentVectorConstants1.packedValues[9u].z) / multiplyAddValue27) - multiplyAddValue22;
    float multiplyAddValue33 = ((fma(fragmentVectorConstants1.packedValues[8u].x, scalarValue21, fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue18, multiplyAddValue26 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue27) - multiplyAddValue23;
    float multiplyAddValue34 = fma(multiplyAddValue30, multiplyAddValue32, -(multiplyAddValue31 * multiplyAddValue28));
    float multiplyAddValue35 = fma(multiplyAddValue28, multiplyAddValue33, -(multiplyAddValue32 * multiplyAddValue29));
    float multiplyAddValue36 = fma(multiplyAddValue29, multiplyAddValue31, -(multiplyAddValue33 * multiplyAddValue30));
    vec3 vectorValue = vec3(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue41 = roundEven((inverseLengthValue1 * multiplyAddValue34) * 10.0) * 0.100000001490116119384765625;
    float productValue42 = roundEven((inverseLengthValue1 * multiplyAddValue35) * 10.0) * 0.100000001490116119384765625;
    float productValue43 = roundEven((inverseLengthValue1 * multiplyAddValue36) * 10.0) * 0.100000001490116119384765625;
    vec4 sampledTextureValue26 = texture(sampler2D(materialTexture5, textureSampler5), vec2(fract(fma(sumValue8, productValue43, fma(productValue42, sumValue8, productValue41 * sumValue6)) / fragmentScalarConstants1.packedValues[48u]), fract(fma(sumValue7, productValue43, fma(productValue42, sumValue6, productValue41 * sumValue7)) / fragmentScalarConstants1.packedValues[48u])));
    float scalarValue22 = sampledTextureValue26.w;
    float multiplyAddValue37 = fma(scalarValue22, sampledTextureValue26.x - scalarValue17, scalarValue17);
    float multiplyAddValue38 = fma(scalarValue22, sampledTextureValue26.y - scalarValue18, scalarValue18);
    float multiplyAddValue39 = fma(scalarValue22, sampledTextureValue26.z - scalarValue19, scalarValue19);
    bool comparisonValue = fragmentScalarConstants1.packedValues[52u] != 0.0;
    float intermediateValue30;
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
    vec4 sampledTextureValue3 = texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue3.x;
    float scalarValue5 = sampledTextureValue3.y;
    float scalarValue6 = sampledTextureValue3.z;
    float productValue = (varyingTexCoord0.x * 2.0) + (-1.0);
    float productValue1 = (-0.0) - ((varyingTexCoord0.y * 2.0) + (-1.0));
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[7u].x, productValue1, fragmentVectorConstants1.packedValues[6u].x * productValue);
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[7u].y, productValue1, fragmentVectorConstants1.packedValues[6u].y * productValue);
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[7u].z, productValue1, fragmentVectorConstants1.packedValues[6u].z * productValue);
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[7u].w, productValue1, fragmentVectorConstants1.packedValues[6u].w * productValue);
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[8u].w, scalarValue, multiplyAddValue3) + fragmentVectorConstants1.packedValues[9u].w;
    float multiplyAddValue5 = fragmentVectorConstants1.packedValues[3u].z + ((fma(fragmentVectorConstants1.packedValues[8u].z, scalarValue, multiplyAddValue2) + fragmentVectorConstants1.packedValues[9u].z) / multiplyAddValue4);
    float sumValue = varyingTexCoord0.x - fragmentVectorConstants1.packedValues[14u].z;
    float sumValue1 = varyingTexCoord0.y - fragmentVectorConstants1.packedValues[14u].w;
    vec4 sampledTextureValue4 = texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(sumValue, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.x;
    vec4 sampledTextureValue5 = texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue5.x;
    vec4 sampledTextureValue6 = texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x, sumValue1));
    float scalarValue9 = sampledTextureValue6.x;
    float productValue2 = (sumValue * 2.0) + (-1.0);
    float productValue3 = (-0.0) - ((varyingTexCoord0.y * 2.0) + (-1.0));
    float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[8u].w, scalarValue7, fma(fragmentVectorConstants1.packedValues[7u].w, productValue3, productValue2 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[8u].w, scalarValue8, multiplyAddValue3) + fragmentVectorConstants1.packedValues[9u].w;
    float multiplyAddValue8 = (fma(fragmentVectorConstants1.packedValues[8u].x, scalarValue8, multiplyAddValue) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue7;
    float multiplyAddValue9 = (fma(fragmentVectorConstants1.packedValues[8u].y, scalarValue8, multiplyAddValue1) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue7;
    float multiplyAddValue10 = (fma(fragmentVectorConstants1.packedValues[8u].z, scalarValue8, multiplyAddValue2) + fragmentVectorConstants1.packedValues[9u].z) / multiplyAddValue7;
    float productValue4 = (varyingTexCoord0.x * 2.0) + (-1.0);
    float productValue5 = (-0.0) - ((sumValue1 * 2.0) + (-1.0));
    float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[8u].w, scalarValue9, fma(fragmentVectorConstants1.packedValues[7u].w, productValue5, productValue4 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float multiplyAddValue12 = ((fma(fragmentVectorConstants1.packedValues[8u].x, scalarValue7, fma(fragmentVectorConstants1.packedValues[7u].x, productValue3, productValue2 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue6) - multiplyAddValue8;
    float multiplyAddValue13 = ((fma(fragmentVectorConstants1.packedValues[8u].y, scalarValue7, fma(fragmentVectorConstants1.packedValues[7u].y, productValue3, productValue2 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue6) - multiplyAddValue9;
    float multiplyAddValue14 = ((fma(fragmentVectorConstants1.packedValues[8u].z, scalarValue7, fma(fragmentVectorConstants1.packedValues[7u].z, productValue3, productValue2 * fragmentVectorConstants1.packedValues[6u].z)) + fragmentVectorConstants1.packedValues[9u].z) / multiplyAddValue6) - multiplyAddValue10;
    float multiplyAddValue15 = ((fma(fragmentVectorConstants1.packedValues[8u].x, scalarValue9, fma(fragmentVectorConstants1.packedValues[7u].x, productValue5, productValue4 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue11) - multiplyAddValue8;
    float multiplyAddValue16 = ((fma(fragmentVectorConstants1.packedValues[8u].y, scalarValue9, fma(fragmentVectorConstants1.packedValues[7u].y, productValue5, productValue4 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue11) - multiplyAddValue9;
    float multiplyAddValue17 = ((fma(fragmentVectorConstants1.packedValues[8u].z, scalarValue9, fma(fragmentVectorConstants1.packedValues[7u].z, productValue5, productValue4 * fragmentVectorConstants1.packedValues[6u].z)) + fragmentVectorConstants1.packedValues[9u].z) / multiplyAddValue11) - multiplyAddValue10;
    float productValue6 = (multiplyAddValue17 * multiplyAddValue13) - (multiplyAddValue16 * multiplyAddValue14);
    float productValue7 = (multiplyAddValue15 * multiplyAddValue14) - (multiplyAddValue17 * multiplyAddValue12);
    float productValue8 = (multiplyAddValue16 * multiplyAddValue12) - (multiplyAddValue15 * multiplyAddValue13);
    float inverseLengthValue = inversesqrt(dot(vec3(productValue6, productValue7, productValue8), vec3(productValue6, productValue7, productValue8))) * 10.0;
    float productValue9 = roundEven(inverseLengthValue * productValue6);
    float productValue10 = roundEven(inverseLengthValue * productValue7);
    float productValue11 = roundEven(inverseLengthValue * productValue8);
    vec4 sampledTextureValue7 = texture(sampler2D(selectedBlocksOverlayTextureTexture, selectedBlocksOverlayTextureSampler), vec2(fract(((((productValue11 + productValue10) * (fragmentVectorConstants1.packedValues[3u].x + ((fma(fragmentVectorConstants1.packedValues[8u].x, scalarValue, multiplyAddValue) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue4))) + (productValue9 * multiplyAddValue5)) * 0.100000001490116119384765625) / fragmentVectorConstants1.packedValues[12u].x), fract(((((productValue11 + productValue9) * (fragmentVectorConstants1.packedValues[3u].y + ((fma(fragmentVectorConstants1.packedValues[8u].y, scalarValue, multiplyAddValue1) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue4))) + (productValue10 * multiplyAddValue5)) * 0.100000001490116119384765625) / fragmentVectorConstants1.packedValues[12u].x)));
    float scalarValue10 = sampledTextureValue7.w;
    float productValue12 = ((sampledTextureValue7.x - scalarValue4) * scalarValue10) + scalarValue4;
    float productValue13 = ((sampledTextureValue7.y - scalarValue5) * scalarValue10) + scalarValue5;
    float productValue14 = ((sampledTextureValue7.z - scalarValue6) * scalarValue10) + scalarValue6;
    float quotientValue1;
    float quotientValue2;
    float quotientValue3;
    float quotientValue4;
    float quotientValue5;
    float quotientValue6;
    float intermediateValue12;
    if (fragmentVectorConstants1.packedValues[13u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        vec4 sampledTextureValue27 = texelFetch(materialTexture2, ivec2(uvec2(0u)), int(0u));
        float scalarValue23 = sampledTextureValue27.x;
        precise float quotientValue19 = 0.180000007152557373046875 / scalarValue23;
        precise float sumValue28 = quotientValue19 + 9.9999997473787516355514526367188e-05;
        precise float quotientValue20 = scalarValue13 / sumValue28;
        precise float quotientValue21 = scalarValue14 / sumValue28;
        precise float quotientValue22 = scalarValue15 / sumValue28;
        precise float quotientValue23 = multiplyAddValue83 / sumValue28;
        precise float quotientValue24 = multiplyAddValue84 / sumValue28;
        precise float quotientValue25 = multiplyAddValue85 / sumValue28;
        intermediateValue30 = scalarValue23;
        intermediateValue31 = quotientValue22;
        intermediateValue32 = quotientValue21;
        intermediateValue33 = quotientValue20;
        intermediateValue34 = quotientValue25;
        intermediateValue35 = quotientValue24;
        intermediateValue36 = quotientValue23;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue27 = texelFetch(materialTexture2, ivec2(uvec2(0u)), int(0u));
        float scalarValue23 = sampledTextureValue27.x;
        float quotientValue8 = (0.180000007152557373046875 / scalarValue23) + 9.9999997473787516355514526367188e-05;
        intermediateValue30 = scalarValue23;
        quotientValue1 = scalarValue15 / quotientValue8;
        quotientValue2 = scalarValue14 / quotientValue8;
        quotientValue3 = scalarValue13 / quotientValue8;
        quotientValue4 = multiplyAddValue39 / quotientValue8;
        quotientValue5 = multiplyAddValue38 / quotientValue8;
        quotientValue6 = multiplyAddValue37 / quotientValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue8 = texelFetch(previousFrameAverageLuminanceTexture, ivec2(uvec2(0u)), int(0u));
        float scalarValue11 = sampledTextureValue8.x;
        float quotientValue = (0.180000007152557373046875 / scalarValue11) + 9.9999997473787516355514526367188e-05;
        quotientValue1 = scalarValue1 / quotientValue;
        quotientValue2 = scalarValue2 / quotientValue;
        quotientValue3 = scalarValue3 / quotientValue;
        quotientValue4 = productValue12 / quotientValue;
        quotientValue5 = productValue13 / quotientValue;
        quotientValue6 = productValue14 / quotientValue;
        intermediateValue12 = scalarValue11;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue30 = 1.0;
        intermediateValue31 = scalarValue15;
        intermediateValue32 = scalarValue14;
        intermediateValue33 = scalarValue13;
        intermediateValue34 = multiplyAddValue85;
        intermediateValue35 = multiplyAddValue84;
        intermediateValue36 = multiplyAddValue83;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue30 = 1.0;
        quotientValue1 = scalarValue15;
        quotientValue2 = scalarValue14;
        quotientValue3 = scalarValue13;
        quotientValue4 = multiplyAddValue39;
        quotientValue5 = multiplyAddValue38;
        quotientValue6 = multiplyAddValue37;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        quotientValue1 = scalarValue1;
        quotientValue2 = scalarValue2;
        quotientValue3 = scalarValue3;
        quotientValue4 = productValue12;
        quotientValue5 = productValue13;
        quotientValue6 = productValue14;
        intermediateValue12 = 1.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue77 = fragmentScalarConstants1.packedValues[44u] * fragmentVectorConstants1.packedValues[14u].z;
    precise float productValue78 = fragmentScalarConstants1.packedValues[44u] * fragmentVectorConstants1.packedValues[14u].w;
    float scalarValue24 = -fragmentScalarConstants1.packedValues[44u];
    float multiplyAddValue86 = fma(productValue77, -1.0, varyingTexCoord0.x);
    float multiplyAddValue87 = fma(productValue78, 0.0, varyingTexCoord0.y);
    float multiplyAddValue88 = fma(productValue78, 1.0, varyingTexCoord0.y);
    float multiplyAddValue89 = fma(productValue77, 0.0, varyingTexCoord0.x);
    float multiplyAddValue90 = fma(productValue78, -1.0, varyingTexCoord0.y);
    float multiplyAddValue91 = fma(productValue77, 1.0, varyingTexCoord0.x);
    float sampledTextureValue28 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(scalarValue24, fragmentVectorConstants1.packedValues[14u].z, varyingTexCoord0.x), fma(scalarValue24, fragmentVectorConstants1.packedValues[14u].w, varyingTexCoord0.y))).w);
    float sampledTextureValue39 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue86, multiplyAddValue88)).w);
    float sampledTextureValue40 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue91, multiplyAddValue90)).w);
    float sampledTextureValue31 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fragmentScalarConstants1.packedValues[44u], fragmentVectorConstants1.packedValues[14u].z, varyingTexCoord0.x), fma(fragmentScalarConstants1.packedValues[44u], fragmentVectorConstants1.packedValues[14u].w, varyingTexCoord0.y))).w);
    precise float sampledTextureValue41 = rdDot3Precise2(vec3(sampledTextureValue40, ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue91, multiplyAddValue87)).w), sampledTextureValue31), vec3(-1.0, -2.0, -1.0)) + rdDot3Precise2(vec3(sampledTextureValue28, ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue86, multiplyAddValue87)).w), sampledTextureValue39), vec3(1.0, 2.0, 1.0));
    precise float sampledTextureValue42 = rdDot2Precise(vec2(sampledTextureValue28, sampledTextureValue39), vec2(1.0, -1.0)) + rdDot2Precise(vec2(ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue89, multiplyAddValue90)).w), ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue89, multiplyAddValue88)).w)), vec2(2.0, -2.0));
    precise float sumValue29 = sampledTextureValue42 + rdDot2Precise(vec2(sampledTextureValue40, sampledTextureValue31), vec2(1.0, -1.0));
    precise float productValue79 = sumValue29 * sumValue29;
    precise float sumValue30 = fragmentVectorConstants1.packedValues[0u].x - intermediateValue36;
    precise float sumValue31 = fragmentVectorConstants1.packedValues[0u].y - intermediateValue35;
    precise float sumValue32 = fragmentVectorConstants1.packedValues[0u].z - intermediateValue34;
    precise float productValue80 = sampledTextureValue23.w * fragmentScalarConstants1.packedValues[4u];
    precise float multiplyAddValue92 = fma(fragmentScalarConstants1.packedValues[3u], sumValue30, intermediateValue36) - intermediateValue33;
    precise float multiplyAddValue93 = fma(fragmentScalarConstants1.packedValues[3u], sumValue31, intermediateValue35) - intermediateValue32;
    precise float multiplyAddValue94 = fma(fragmentScalarConstants1.packedValues[3u], sumValue32, intermediateValue34) - intermediateValue31;
    float multiplyAddValue95 = fma(productValue80, multiplyAddValue92, intermediateValue33);
    float multiplyAddValue96 = fma(productValue80, multiplyAddValue93, intermediateValue32);
    float multiplyAddValue97 = fma(productValue80, multiplyAddValue94, intermediateValue31);
    precise float multiplyAddValue98 = sqrt(fma(sampledTextureValue41, sampledTextureValue41, productValue79)) * fragmentScalarConstants1.packedValues[43u];
    precise float sumValue33 = fragmentVectorConstants1.packedValues[10u].x - multiplyAddValue95;
    precise float sumValue34 = fragmentVectorConstants1.packedValues[10u].y - multiplyAddValue96;
    precise float sumValue35 = fragmentVectorConstants1.packedValues[10u].z - multiplyAddValue97;
    float multiplyAddValue99 = fma(multiplyAddValue98, sumValue33, multiplyAddValue95);
    float multiplyAddValue100 = fma(multiplyAddValue98, sumValue34, multiplyAddValue96);
    float multiplyAddValue101 = fma(multiplyAddValue98, sumValue35, multiplyAddValue97);
    precise float productValue81 = fragmentScalarConstants1.packedValues[20u] * fragmentVectorConstants1.packedValues[14u].z;
    precise float productValue82 = fragmentScalarConstants1.packedValues[20u] * fragmentVectorConstants1.packedValues[14u].w;
    float multiplyAddValue102 = fma(productValue82, 0.0, varyingTexCoord0.y);
    float multiplyAddValue103 = fma(productValue81, 0.0, varyingTexCoord0.x);
    float multiplyAddValue47 = fma(scalarValue12, 9999.0, 1.0);
    float sampledTextureValue43 = rdDot3Precise2(vec3(fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(productValue81, -1.0, varyingTexCoord0.x), multiplyAddValue102)).x, 9999.0, 1.0), multiplyAddValue47, fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(productValue81, 1.0, varyingTexCoord0.x), multiplyAddValue102)).x, 9999.0, 1.0)), vec3(-1.0, 2.0, -1.0));
    float sampledTextureValue44 = rdDot3Precise2(vec3(fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue103, fma(productValue82, -1.0, varyingTexCoord0.y))).x, 9999.0, 1.0), multiplyAddValue47, fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue103, fma(productValue82, 1.0, varyingTexCoord0.y))).x, 9999.0, 1.0)), vec3(-1.0, 2.0, -1.0));
    precise float productValue83 = sampledTextureValue44 * sampledTextureValue44;
    precise float multiplyAddValue104 = float(sqrt(fma(sampledTextureValue43, sampledTextureValue43, productValue83)) > 0.00999999977648258209228515625) * fragmentScalarConstants1.packedValues[19u];
    precise float sumValue36 = fragmentVectorConstants1.packedValues[4u].x - multiplyAddValue99;
    precise float sumValue37 = fragmentVectorConstants1.packedValues[4u].y - multiplyAddValue100;
    precise float sumValue38 = fragmentVectorConstants1.packedValues[4u].z - multiplyAddValue101;
    float multiplyAddValue105 = fma(multiplyAddValue104, sumValue36, multiplyAddValue99);
    float multiplyAddValue106 = fma(multiplyAddValue104, sumValue37, multiplyAddValue100);
    float multiplyAddValue107 = fma(multiplyAddValue104, sumValue38, multiplyAddValue101);
    precise float sumValue39 = scalarValue12 + 1.1999999571798980468884110450745e-07;
    precise float sumValue40 = scalarValue12 - 1.1999999571798980468884110450745e-07;
    bool conditionValue = sumValue39 < 1.0;
    bool comparisonValue2 = sampledTextureValue20.x >= sumValue40;
    precise float sumValue41 = fragmentVectorConstants1.packedValues[10u].x - intermediateValue33;
    precise float sumValue42 = fragmentVectorConstants1.packedValues[10u].y - intermediateValue32;
    precise float sumValue43 = fragmentVectorConstants1.packedValues[10u].z - intermediateValue31;
    precise float sumValue44 = scalarValue16 - scalarValue16;
    float multiplyAddValue108 = fma(multiplyAddValue98, sumValue41, intermediateValue33);
    float multiplyAddValue109 = fma(multiplyAddValue98, sumValue42, intermediateValue32);
    float multiplyAddValue110 = fma(multiplyAddValue98, sumValue43, intermediateValue31);
    precise float sumValue45 = multiplyAddValue105 - multiplyAddValue108;
    precise float sumValue46 = multiplyAddValue106 - multiplyAddValue109;
    precise float sumValue47 = multiplyAddValue107 - multiplyAddValue110;
    float multiplyAddValue111 = conditionValue ? (comparisonValue2 ? multiplyAddValue105 : fma(fragmentScalarConstants1.packedValues[8u], sumValue45, multiplyAddValue108)) : intermediateValue33;
    float multiplyAddValue112 = conditionValue ? (comparisonValue2 ? multiplyAddValue106 : fma(fragmentScalarConstants1.packedValues[8u], sumValue46, multiplyAddValue109)) : intermediateValue32;
    float multiplyAddValue113 = conditionValue ? (comparisonValue2 ? multiplyAddValue107 : fma(fragmentScalarConstants1.packedValues[8u], sumValue47, multiplyAddValue110)) : intermediateValue31;
    precise float quotientValue26 = 0.180000007152557373046875 / intermediateValue30;
    precise float sumValue48 = quotientValue26 + 9.9999997473787516355514526367188e-05;
    precise float productValue84 = multiplyAddValue111 * sumValue48;
    precise float productValue85 = multiplyAddValue112 * sumValue48;
    precise float productValue86 = multiplyAddValue113 * sumValue48;
    fragmentColor0.x = comparisonValue ? productValue84 : multiplyAddValue111;
    fragmentColor0.y = comparisonValue ? productValue85 : multiplyAddValue112;
    fragmentColor0.z = comparisonValue ? productValue86 : multiplyAddValue113;
    fragmentColor0.w = ((!comparisonValue2) && conditionValue) ? fma(multiplyAddValue98, sumValue44, scalarValue16) : scalarValue16;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float productValue44 = fragmentScalarConstants1.packedValues[44u] * fragmentVectorConstants1.packedValues[14u].z;
    float productValue45 = fragmentScalarConstants1.packedValues[44u] * fragmentVectorConstants1.packedValues[14u].w;
    float scalarValue24 = -fragmentScalarConstants1.packedValues[44u];
    float sumValue9 = varyingTexCoord0.x - productValue44;
    float sumValue10 = productValue45 + varyingTexCoord0.y;
    float sumValue11 = varyingTexCoord0.y - productValue45;
    float sumValue12 = productValue44 + varyingTexCoord0.x;
    float sampledTextureValue28 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(scalarValue24, fragmentVectorConstants1.packedValues[14u].z, varyingTexCoord0.x), fma(scalarValue24, fragmentVectorConstants1.packedValues[14u].w, varyingTexCoord0.y))).w);
    float sampledTextureValue29 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(sumValue9, sumValue10)).w);
    float sampledTextureValue30 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(sumValue12, sumValue11)).w);
    float sampledTextureValue31 = ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fragmentScalarConstants1.packedValues[44u], fragmentVectorConstants1.packedValues[14u].z, varyingTexCoord0.x), fma(fragmentScalarConstants1.packedValues[44u], fragmentVectorConstants1.packedValues[14u].w, varyingTexCoord0.y))).w);
    float sampledTextureValue32 = rdDot3Precise2(vec3(sampledTextureValue30, ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(sumValue12, varyingTexCoord0.y)).w), sampledTextureValue31), vec3(-1.0, -2.0, -1.0)) + rdDot3Precise2(vec3(sampledTextureValue28, ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(sumValue9, varyingTexCoord0.y)).w), sampledTextureValue29), vec3(1.0, 2.0, 1.0));
    float sampledTextureValue33 = rdDot2Precise(vec2(sampledTextureValue30, sampledTextureValue31), vec2(1.0, -1.0)) + (rdDot2Precise(vec2(ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, sumValue11)).w), ceil(texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, sumValue10)).w)), vec2(2.0, -2.0)) + rdDot2Precise(vec2(sampledTextureValue28, sampledTextureValue29), vec2(1.0, -1.0)));
    float productValue46 = sampledTextureValue23.w * fragmentScalarConstants1.packedValues[4u];
    float multiplyAddValue40 = fma(productValue46, fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - quotientValue6, quotientValue6) - quotientValue3, quotientValue3);
    float multiplyAddValue41 = fma(productValue46, fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - quotientValue5, quotientValue5) - quotientValue2, quotientValue2);
    float multiplyAddValue42 = fma(productValue46, fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - quotientValue4, quotientValue4) - quotientValue1, quotientValue1);
    float multiplyAddValue43 = sqrt(fma(sampledTextureValue32, sampledTextureValue32, sampledTextureValue33 * sampledTextureValue33)) * fragmentScalarConstants1.packedValues[43u];
    float multiplyAddValue44 = fma(multiplyAddValue43, fragmentVectorConstants1.packedValues[10u].x - multiplyAddValue40, multiplyAddValue40);
    float multiplyAddValue45 = fma(multiplyAddValue43, fragmentVectorConstants1.packedValues[10u].y - multiplyAddValue41, multiplyAddValue41);
    float multiplyAddValue46 = fma(multiplyAddValue43, fragmentVectorConstants1.packedValues[10u].z - multiplyAddValue42, multiplyAddValue42);
    float productValue47 = fragmentScalarConstants1.packedValues[20u] * fragmentVectorConstants1.packedValues[14u].z;
    float productValue48 = fragmentScalarConstants1.packedValues[20u] * fragmentVectorConstants1.packedValues[14u].w;
    float multiplyAddValue47 = fma(scalarValue12, 9999.0, 1.0);
    float sampledTextureValue34 = rdDot3Precise2(vec3(fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x - productValue47, varyingTexCoord0.y)).x, 9999.0, 1.0), multiplyAddValue47, fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(productValue47 + varyingTexCoord0.x, varyingTexCoord0.y)).x, 9999.0, 1.0)), vec3(-1.0, 2.0, -1.0));
    float sampledTextureValue35 = rdDot3Precise2(vec3(fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y - productValue48)).x, 9999.0, 1.0), multiplyAddValue47, fma(texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, productValue48 + varyingTexCoord0.y)).x, 9999.0, 1.0)), vec3(-1.0, 2.0, -1.0));
    bool multiplyAddValue48 = sqrt(fma(sampledTextureValue34, sampledTextureValue34, sampledTextureValue35 * sampledTextureValue35)) > 0.00999999977648258209228515625;
    float multiplyAddValue49 = multiplyAddValue48 ? fma(fragmentVectorConstants1.packedValues[4u].x - multiplyAddValue44, fragmentScalarConstants1.packedValues[19u], multiplyAddValue44) : multiplyAddValue44;
    float multiplyAddValue50 = multiplyAddValue48 ? fma(fragmentVectorConstants1.packedValues[4u].y - multiplyAddValue45, fragmentScalarConstants1.packedValues[19u], multiplyAddValue45) : multiplyAddValue45;
    float multiplyAddValue51 = multiplyAddValue48 ? fma(fragmentVectorConstants1.packedValues[4u].z - multiplyAddValue46, fragmentScalarConstants1.packedValues[19u], multiplyAddValue46) : multiplyAddValue46;
    bool sumValue13 = (scalarValue12 + 1.1999999571798980468884110450745e-07) < 1.0;
    bool comparisonValue1 = sampledTextureValue20.x >= (scalarValue12 - 1.1999999571798980468884110450745e-07);
    float multiplyAddValue52 = fma(multiplyAddValue43, fragmentVectorConstants1.packedValues[10u].x - quotientValue3, quotientValue3);
    float multiplyAddValue53 = fma(multiplyAddValue43, fragmentVectorConstants1.packedValues[10u].y - quotientValue2, quotientValue2);
    float multiplyAddValue54 = fma(multiplyAddValue43, fragmentVectorConstants1.packedValues[10u].z - quotientValue1, quotientValue1);
    float multiplyAddValue55 = sumValue13 ? (comparisonValue1 ? multiplyAddValue49 : fma(fragmentScalarConstants1.packedValues[8u], multiplyAddValue49 - multiplyAddValue52, multiplyAddValue52)) : quotientValue3;
    float multiplyAddValue56 = sumValue13 ? (comparisonValue1 ? multiplyAddValue50 : fma(fragmentScalarConstants1.packedValues[8u], multiplyAddValue50 - multiplyAddValue53, multiplyAddValue53)) : quotientValue2;
    float multiplyAddValue57 = sumValue13 ? (comparisonValue1 ? multiplyAddValue51 : fma(fragmentScalarConstants1.packedValues[8u], multiplyAddValue51 - multiplyAddValue54, multiplyAddValue54)) : quotientValue1;
    float quotientValue9 = (0.180000007152557373046875 / intermediateValue30) + 9.9999997473787516355514526367188e-05;
    fragmentColor0.x = comparisonValue ? (quotientValue9 * multiplyAddValue55) : multiplyAddValue55;
    fragmentColor0.y = comparisonValue ? (quotientValue9 * multiplyAddValue56) : multiplyAddValue56;
    fragmentColor0.z = comparisonValue ? (quotientValue9 * multiplyAddValue57) : multiplyAddValue57;
    fragmentColor0.w = ((!comparisonValue1) && sumValue13) ? fma(multiplyAddValue43, scalarValue16 - scalarValue16, scalarValue16) : scalarValue16;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue15 = fragmentVectorConstants1.packedValues[14u].z * fragmentVectorConstants1.packedValues[11u].x;
    float productValue16 = fragmentVectorConstants1.packedValues[14u].w * fragmentVectorConstants1.packedValues[11u].x;
    float sumValue2 = varyingTexCoord0.x - productValue15;
    float sumValue3 = varyingTexCoord0.y - productValue16;
    float sumValue4 = productValue16 + varyingTexCoord0.y;
    float sumValue5 = productValue15 + varyingTexCoord0.x;
    float sampledTextureValue9 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue2, sumValue3)).w);
    float sampledTextureValue10 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue2, varyingTexCoord0.y)).w);
    float sampledTextureValue11 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue2, sumValue4)).w);
    float sampledTextureValue12 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(varyingTexCoord0.x, sumValue3)).w);
    float sampledTextureValue13 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(varyingTexCoord0.x, sumValue4)).w);
    float sampledTextureValue14 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue5, sumValue3)).w);
    float sampledTextureValue15 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue5, varyingTexCoord0.y)).w);
    float sampledTextureValue16 = ceil(texture(sampler2D(highlightTextureColorTexture, highlightTextureColorSampler), vec2(sumValue5, sumValue4)).w);
    float dotProductValue = (dot(vec3(0.0), vec3(sampledTextureValue12, 0.0, sampledTextureValue13)) + dot(vec3(1.0, 2.0, 1.0), vec3(sampledTextureValue9, sampledTextureValue10, sampledTextureValue11))) + dot(vec3(-1.0, -2.0, -1.0), vec3(sampledTextureValue14, sampledTextureValue15, sampledTextureValue16));
    float dotProductValue1 = (dot(vec3(2.0, 0.0, -2.0), vec3(sampledTextureValue12, 0.0, sampledTextureValue13)) + dot(vec3(1.0, 0.0, -1.0), vec3(sampledTextureValue9, sampledTextureValue10, sampledTextureValue11))) + dot(vec3(1.0, 0.0, -1.0), vec3(sampledTextureValue14, sampledTextureValue15, sampledTextureValue16));
    float nonlinearValue = sqrt((dotProductValue1 * dotProductValue1) + (dotProductValue * dotProductValue));
    float productValue17 = fragmentVectorConstants1.packedValues[1u].x * sampledTextureValue3.w;
    float productValue18 = (((quotientValue4 - quotientValue1) + ((fragmentVectorConstants1.packedValues[0u].x - quotientValue4) * fragmentVectorConstants1.packedValues[0u].w)) * productValue17) + quotientValue1;
    float productValue19 = (((quotientValue5 - quotientValue2) + ((fragmentVectorConstants1.packedValues[0u].y - quotientValue5) * fragmentVectorConstants1.packedValues[0u].w)) * productValue17) + quotientValue2;
    float productValue20 = (((quotientValue6 - quotientValue3) + ((fragmentVectorConstants1.packedValues[0u].z - quotientValue6) * fragmentVectorConstants1.packedValues[0u].w)) * productValue17) + quotientValue3;
    float productValue21 = fragmentVectorConstants1.packedValues[10u].w * nonlinearValue;
    float productValue22 = ((fragmentVectorConstants1.packedValues[10u].x - productValue18) * productValue21) + productValue18;
    float productValue23 = ((fragmentVectorConstants1.packedValues[10u].y - productValue19) * productValue21) + productValue19;
    float productValue24 = ((fragmentVectorConstants1.packedValues[10u].z - productValue20) * productValue21) + productValue20;
    float productValue25 = fragmentVectorConstants1.packedValues[14u].z * fragmentVectorConstants1.packedValues[5u].x;
    float productValue26 = fragmentVectorConstants1.packedValues[14u].w * fragmentVectorConstants1.packedValues[5u].x;
    float sampledTextureValue17 = (texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x * 9999.0) + 1.0;
    float sampledTextureValue18 = dot(vec3(-1.0, 2.0, -1.0), vec3((texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x - productValue25, varyingTexCoord0.y)).x * 9999.0) + 1.0, sampledTextureValue17, (texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(productValue25 + varyingTexCoord0.x, varyingTexCoord0.y)).x * 9999.0) + 1.0));
    float sampledTextureValue19 = dot(vec3(-1.0, 2.0, -1.0), vec3((texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y - productValue26)).x * 9999.0) + 1.0, sampledTextureValue17, (texture(sampler2D(highlightTextureDepthTexture, highlightTextureDepthSampler), vec2(varyingTexCoord0.x, productValue26 + varyingTexCoord0.y)).x * 9999.0) + 1.0));
    float nonlinearValue1 = float(sqrt((sampledTextureValue19 * sampledTextureValue19) + (sampledTextureValue18 * sampledTextureValue18)) > 0.00999999977648258209228515625) * fragmentVectorConstants1.packedValues[4u].w;
    float productValue27 = ((fragmentVectorConstants1.packedValues[4u].x - productValue22) * nonlinearValue1) + productValue22;
    float productValue28 = ((fragmentVectorConstants1.packedValues[4u].y - productValue23) * nonlinearValue1) + productValue23;
    float productValue29 = ((fragmentVectorConstants1.packedValues[4u].z - productValue24) * nonlinearValue1) + productValue24;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if ((scalarValue + 1.1999999571798980468884110450745e-07) < 1.0)
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (!((scalarValue + (-1.1999999571798980468884110450745e-07)) <= sampledTextureValue.x))
        {
            float productValue30 = fragmentVectorConstants1.packedValues[10u].w * nonlinearValue;
            float productValue31 = ((fragmentVectorConstants1.packedValues[10u].x - quotientValue1) * productValue30) + quotientValue1;
            float productValue32 = ((fragmentVectorConstants1.packedValues[10u].y - quotientValue2) * productValue30) + quotientValue2;
            float productValue33 = ((fragmentVectorConstants1.packedValues[10u].z - quotientValue3) * productValue30) + quotientValue3;
            branchMergedValue = ((productValue27 - productValue31) * fragmentVectorConstants1.packedValues[2u].x) + productValue31;
            branchMergedValue1 = ((productValue28 - productValue32) * fragmentVectorConstants1.packedValues[2u].x) + productValue32;
            branchMergedValue2 = ((productValue29 - productValue33) * fragmentVectorConstants1.packedValues[2u].x) + productValue33;
        }
        else
        {
            branchMergedValue = productValue27;
            branchMergedValue1 = productValue28;
            branchMergedValue2 = productValue29;
        }
        intermediateValue13 = branchMergedValue;
        intermediateValue14 = branchMergedValue1;
        intermediateValue15 = branchMergedValue2;
    }
    else
    {
        intermediateValue13 = quotientValue1;
        intermediateValue14 = quotientValue2;
        intermediateValue15 = quotientValue3;
    }
    float productValue34;
    float productValue35;
    float productValue36;
    if (fragmentVectorConstants1.packedValues[13u].x != 0.0)
    {
        float quotientValue7 = (0.180000007152557373046875 / intermediateValue12) + 9.9999997473787516355514526367188e-05;
        productValue34 = quotientValue7 * intermediateValue13;
        productValue35 = quotientValue7 * intermediateValue14;
        productValue36 = quotientValue7 * intermediateValue15;
    }
    else
    {
        productValue34 = intermediateValue13;
        productValue35 = intermediateValue14;
        productValue36 = intermediateValue15;
    }
    fragmentColor0.x = productValue34;
    fragmentColor0.y = productValue35;
    fragmentColor0.z = productValue36;
    fragmentColor0.w = sampledTextureValue2.w;
#endif
}
