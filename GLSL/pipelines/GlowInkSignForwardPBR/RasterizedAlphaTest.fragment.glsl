#version 460
#extension GL_GOOGLE_include_directive : require
// GlowInkSignForwardPBR / RasterizedAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#endif
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_samplerless_texture_functions : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE2_FLOAT_2 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION2_FLOAT_7 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT2_FLOAT_9 1
#endif

#include "../../include/materials/GlowInkSignForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue53 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue70 = sampledTextureValue53.w;
    if (scalarValue70 < 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    if (scalarValue < 0.5)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue229 = sampledTextureValue53.x * fragmentVectorConstants1.packedValues[138u].x;
    float productValue230 = sampledTextureValue53.y * fragmentVectorConstants1.packedValues[138u].y;
    float productValue231 = sampledTextureValue53.z * fragmentVectorConstants1.packedValues[138u].z;
    float productValue232 = productValue229 * varyingColor0.x;
    float productValue233 = productValue230 * varyingColor0.y;
    float productValue234 = productValue231 * varyingColor0.z;
    bool comparisonValue112 = fragmentScalarConstants1.packedValues[548u] != 0.0;
    float multiplyAddValue58 = comparisonValue112 ? exp2(log2(spvNMax(productValue232, 0.0)) * 2.2000000476837158203125) : ((productValue232 <= 0.040449999272823333740234375) ? (productValue232 * 0.077399380505084991455078125) : exp2(log2(fma(productValue229, varyingColor0.x, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float multiplyAddValue59 = comparisonValue112 ? exp2(log2(spvNMax(productValue233, 0.0)) * 2.2000000476837158203125) : ((productValue233 <= 0.040449999272823333740234375) ? (productValue233 * 0.077399380505084991455078125) : exp2(log2(fma(productValue230, varyingColor0.y, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float multiplyAddValue60 = comparisonValue112 ? exp2(log2(spvNMax(productValue234, 0.0)) * 2.2000000476837158203125) : ((productValue234 <= 0.040449999272823333740234375) ? (productValue234 * 0.077399380505084991455078125) : exp2(log2(fma(productValue231, varyingColor0.z, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    fragmentColor0.w = (scalarValue70 * fragmentVectorConstants1.packedValues[138u].w) * varyingColor0.w;
    float multiplyAddValue35;
    float multiplyAddValue36;
    float multiplyAddValue37;
    if (fragmentScalarConstants1.packedValues[300u] > 0.0)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue330 = sampledTextureValue53.x * fragmentVectorConstants1.packedValues[141u].x;
    float productValue331 = sampledTextureValue53.y * fragmentVectorConstants1.packedValues[141u].y;
    float productValue332 = sampledTextureValue53.z * fragmentVectorConstants1.packedValues[141u].z;
    float productValue333 = productValue330 * varyingColor0.x;
    float productValue334 = productValue331 * varyingColor0.y;
    float productValue335 = productValue332 * varyingColor0.z;
    bool comparisonValue177 = fragmentScalarConstants1.packedValues[560u] != 0.0;
    float multiplyAddValue253 = comparisonValue177 ? exp2(log2(spvNMax(productValue333, 0.0)) * 2.2000000476837158203125) : ((productValue333 <= 0.040449999272823333740234375) ? (productValue333 * 0.077399380505084991455078125) : exp2(log2(fma(productValue330, varyingColor0.x, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float multiplyAddValue254 = comparisonValue177 ? exp2(log2(spvNMax(productValue334, 0.0)) * 2.2000000476837158203125) : ((productValue334 <= 0.040449999272823333740234375) ? (productValue334 * 0.077399380505084991455078125) : exp2(log2(fma(productValue331, varyingColor0.y, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float multiplyAddValue255 = comparisonValue177 ? exp2(log2(spvNMax(productValue335, 0.0)) * 2.2000000476837158203125) : ((productValue335 <= 0.040449999272823333740234375) ? (productValue335 * 0.077399380505084991455078125) : exp2(log2(fma(productValue332, varyingColor0.z, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    fragmentColor0.w = (scalarValue70 * fragmentVectorConstants1.packedValues[141u].w) * varyingColor0.w;
    float multiplyAddValue35;
    float multiplyAddValue36;
    float multiplyAddValue37;
    if (fragmentScalarConstants1.packedValues[304u] > 0.0)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (sampledTextureValue.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[138u].x;
    float productValue1 = (sampledTextureValue.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[138u].y;
    float productValue2 = (sampledTextureValue.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[138u].z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[137u].x != 0.0)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue442 = (sampledTextureValue.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[141u].x;
    float productValue443 = (sampledTextureValue.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[141u].y;
    float productValue444 = (sampledTextureValue.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[141u].z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[140u].x != 0.0)
#endif
    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[59u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[57u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[58u].x)) + fragmentVectorConstants1.packedValues[60u].x;
        float multiplyAddValue63 = fma(fragmentVectorConstants1.packedValues[59u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[57u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[58u].y)) + fragmentVectorConstants1.packedValues[60u].y;
        float multiplyAddValue64 = fma(fragmentVectorConstants1.packedValues[59u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[57u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[58u].z)) + fragmentVectorConstants1.packedValues[60u].z;
        float multiplyAddValue65 = fma(fragmentVectorConstants1.packedValues[59u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[57u].w, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[58u].w)) + fragmentVectorConstants1.packedValues[60u].w;
        float multiplyAddValue66 = fma(fragmentVectorConstants1.packedValues[7u].x, multiplyAddValue65, fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue64, fma(fragmentVectorConstants1.packedValues[4u].x, multiplyAddValue61, multiplyAddValue63 * fragmentVectorConstants1.packedValues[5u].x)));
        float multiplyAddValue67 = fma(fragmentVectorConstants1.packedValues[7u].y, multiplyAddValue65, fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue64, fma(fragmentVectorConstants1.packedValues[4u].y, multiplyAddValue61, multiplyAddValue63 * fragmentVectorConstants1.packedValues[5u].y)));
        float multiplyAddValue68 = fma(fragmentVectorConstants1.packedValues[7u].z, multiplyAddValue65, fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue64, fma(fragmentVectorConstants1.packedValues[4u].z, multiplyAddValue61, multiplyAddValue63 * fragmentVectorConstants1.packedValues[5u].z)));
        float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[7u].w, multiplyAddValue65, fma(fragmentVectorConstants1.packedValues[6u].w, multiplyAddValue64, fma(fragmentVectorConstants1.packedValues[4u].w, multiplyAddValue61, multiplyAddValue63 * fragmentVectorConstants1.packedValues[5u].w)));
        float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue69, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue68, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue66, multiplyAddValue67 * fragmentVectorConstants1.packedValues[1u].w)));
        float multiplyAddValue71 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue69, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue68, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue66, multiplyAddValue67 * fragmentVectorConstants1.packedValues[1u].x))) / multiplyAddValue70;
        float multiplyAddValue72 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue69, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue68, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue66, multiplyAddValue67 * fragmentVectorConstants1.packedValues[1u].y))) / multiplyAddValue70;
        float multiplyAddValue73 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue69, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue68, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue66, multiplyAddValue67 * fragmentVectorConstants1.packedValues[1u].z))) / multiplyAddValue70;
        vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue71 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue13 = inversesqrt(scalarValue71);
        float productValue236 = inverseLengthValue13 * varyingNormal0.x;
        float productValue237 = inverseLengthValue13 * varyingNormal0.y;
        float productValue238 = inverseLengthValue13 * varyingNormal0.z;
        float multiplyAddValue74 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue238, fma(fragmentVectorConstants1.packedValues[4u].x, productValue236, productValue237 * fragmentVectorConstants1.packedValues[5u].x));
        float multiplyAddValue78 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue238, fma(fragmentVectorConstants1.packedValues[4u].y, productValue236, productValue237 * fragmentVectorConstants1.packedValues[5u].y));
        float multiplyAddValue87 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue238, fma(fragmentVectorConstants1.packedValues[4u].z, productValue236, productValue237 * fragmentVectorConstants1.packedValues[5u].z));
        float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[130u].x;
        float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[130u].y;
        float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[130u].z;
        float scalarValue72 = dFdxCoarse(multiplyAddValue68);
        float scalarValue73 = dFdxCoarse(multiplyAddValue66);
        float scalarValue74 = dFdxCoarse(multiplyAddValue67);
        vec3 vectorValue1 = vec3(scalarValue72, scalarValue73, scalarValue74);
        float scalarValue75 = rdDot3Precise(vectorValue1, vectorValue1);
        float inverseLengthValue14 = inversesqrt(scalarValue75);
        float productValue239 = inverseLengthValue14 * scalarValue72;
        float productValue240 = inverseLengthValue14 * scalarValue73;
        float productValue241 = inverseLengthValue14 * scalarValue74;
        float scalarValue76 = dFdyCoarse(-multiplyAddValue67);
        float scalarValue77 = dFdyCoarse(-multiplyAddValue68);
        float scalarValue78 = dFdyCoarse(-multiplyAddValue66);
        vec3 vectorValue2 = vec3(scalarValue76, scalarValue77, scalarValue78);
        float scalarValue79 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue15 = inversesqrt(scalarValue79);
        float productValue242 = inverseLengthValue15 * scalarValue76;
        float productValue243 = inverseLengthValue15 * scalarValue77;
        float productValue244 = inverseLengthValue15 * scalarValue78;
        float multiplyAddValue88 = fma(productValue241, productValue243, -(productValue239 * productValue242));
        float multiplyAddValue89 = fma(productValue239, productValue244, -(productValue240 * productValue243));
        float multiplyAddValue90 = fma(productValue240, productValue242, -(productValue241 * productValue244));
        vec3 vectorValue3 = vec3(multiplyAddValue88, multiplyAddValue89, multiplyAddValue90);
        float scalarValue80 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue16 = inversesqrt(scalarValue80);
        float productValue245 = inverseLengthValue16 * multiplyAddValue88;
        float productValue246 = inverseLengthValue16 * multiplyAddValue89;
        float productValue247 = inverseLengthValue16 * multiplyAddValue90;
        float multiplyAddValue91 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue247, fma(fragmentVectorConstants1.packedValues[8u].x, productValue245, productValue246 * fragmentVectorConstants1.packedValues[9u].x));
        float multiplyAddValue92 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue247, fma(fragmentVectorConstants1.packedValues[8u].y, productValue245, productValue246 * fragmentVectorConstants1.packedValues[9u].y));
        float multiplyAddValue93 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue247, fma(fragmentVectorConstants1.packedValues[8u].z, productValue245, productValue246 * fragmentVectorConstants1.packedValues[9u].z));
        vec3 vectorValue4 = vec3(multiplyAddValue91, multiplyAddValue92, multiplyAddValue93);
        float scalarValue81 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue17 = inversesqrt(scalarValue81);
        float quotientValue36 = roundEven((inverseLengthValue17 * multiplyAddValue91) / fragmentScalarConstants1.packedValues[616u]) * fragmentScalarConstants1.packedValues[616u];
        float quotientValue37 = roundEven((inverseLengthValue17 * multiplyAddValue92) / fragmentScalarConstants1.packedValues[616u]) * fragmentScalarConstants1.packedValues[616u];
        float quotientValue38 = roundEven((inverseLengthValue17 * multiplyAddValue93) / fragmentScalarConstants1.packedValues[616u]) * fragmentScalarConstants1.packedValues[616u];
        vec3 vectorValue5 = vec3(quotientValue36, quotientValue37, quotientValue38);
        float scalarValue82 = rdDot3Precise(vectorValue5, vectorValue5);
        float inverseLengthValue18 = inversesqrt(scalarValue82);
        float productValue248 = inverseLengthValue18 * quotientValue36;
        float productValue249 = inverseLengthValue18 * quotientValue37;
        float productValue250 = inverseLengthValue18 * quotientValue38;
        float scalarValue83 = -fragmentScalarConstants1.packedValues[606u];
        float multiplyAddValue94 = fma(fragmentScalarConstants1.packedValues[606u], 0.5, -fma(scalarValue83, floor(sumValue / fragmentScalarConstants1.packedValues[606u]), sumValue));
        float multiplyAddValue95 = fma(fragmentScalarConstants1.packedValues[606u], 0.5, -fma(scalarValue83, floor(sumValue1 / fragmentScalarConstants1.packedValues[606u]), sumValue1));
        float multiplyAddValue96 = fma(fragmentScalarConstants1.packedValues[606u], 0.5, -fma(scalarValue83, floor(sumValue2 / fragmentScalarConstants1.packedValues[606u]), sumValue2));
        float scalarValue84 = rdDot3Precise(vec3(multiplyAddValue94, multiplyAddValue95, multiplyAddValue96), vec3(productValue248, productValue249, productValue250));
        float scalarValue85 = -scalarValue84;
        float multiplyAddValue97 = (sumValue + fma(scalarValue85, productValue248, multiplyAddValue94)) + fragmentVectorConstants1.packedValues[130u].x;
        float multiplyAddValue98 = (sumValue1 + fma(scalarValue85, productValue249, multiplyAddValue95)) + fragmentVectorConstants1.packedValues[130u].y;
        float multiplyAddValue99 = (sumValue2 + fma(scalarValue85, productValue250, multiplyAddValue96)) + fragmentVectorConstants1.packedValues[130u].z;
        float sumValue137 = 1.0 - fragmentScalarConstants1.packedValues[512u];
        float multiplyAddValue100 = fma(sumValue137, 0.039999999105930328369140625, multiplyAddValue58 * fragmentScalarConstants1.packedValues[512u]);
        float multiplyAddValue101 = fma(sumValue137, 0.039999999105930328369140625, multiplyAddValue59 * fragmentScalarConstants1.packedValues[512u]);
        float multiplyAddValue102 = fma(sumValue137, 0.039999999105930328369140625, multiplyAddValue60 * fragmentScalarConstants1.packedValues[512u]);
        bool bitwiseValue35 = (((fragmentScalarConstants1.packedValues[317u] + fragmentScalarConstants1.packedValues[316u]) + fragmentScalarConstants1.packedValues[318u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[500u] > 9.9999997473787516355514526367188e-05);
        float productValue251 = fragmentScalarConstants1.packedValues[500u] * fragmentScalarConstants1.packedValues[500u];
        float comparisonValue113 = bitwiseValue35 ? spvNMin(productValue251, 1.0) : fragmentVectorConstants1.packedValues[79u].x;
        float multiplyAddValue103 = bitwiseValue35 ? spvNMin(fma(fma(productValue251, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue251, 1.0) : fragmentVectorConstants1.packedValues[79u].y;
        float multiplyAddValue104 = bitwiseValue35 ? spvNMin(fma(productValue251 * productValue251, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue251, 1.0) : fragmentVectorConstants1.packedValues[79u].z;
        float exponentialValue;
        if ((fragmentScalarConstants1.packedValues[504u] != 0.0) && (fragmentScalarConstants1.packedValues[507u] != 0.0))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[59u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[57u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[58u].x)) + fragmentVectorConstants1.packedValues[60u].x;
        float multiplyAddValue63 = fma(fragmentVectorConstants1.packedValues[59u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[57u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[58u].y)) + fragmentVectorConstants1.packedValues[60u].y;
        float multiplyAddValue64 = fma(fragmentVectorConstants1.packedValues[59u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[57u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[58u].z)) + fragmentVectorConstants1.packedValues[60u].z;
        float multiplyAddValue65 = fma(fragmentVectorConstants1.packedValues[59u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[57u].w, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[58u].w)) + fragmentVectorConstants1.packedValues[60u].w;
        float multiplyAddValue66 = fma(fragmentVectorConstants1.packedValues[7u].x, multiplyAddValue65, fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue64, fma(fragmentVectorConstants1.packedValues[4u].x, multiplyAddValue61, multiplyAddValue63 * fragmentVectorConstants1.packedValues[5u].x)));
        float multiplyAddValue67 = fma(fragmentVectorConstants1.packedValues[7u].y, multiplyAddValue65, fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue64, fma(fragmentVectorConstants1.packedValues[4u].y, multiplyAddValue61, multiplyAddValue63 * fragmentVectorConstants1.packedValues[5u].y)));
        float multiplyAddValue68 = fma(fragmentVectorConstants1.packedValues[7u].z, multiplyAddValue65, fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue64, fma(fragmentVectorConstants1.packedValues[4u].z, multiplyAddValue61, multiplyAddValue63 * fragmentVectorConstants1.packedValues[5u].z)));
        float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[7u].w, multiplyAddValue65, fma(fragmentVectorConstants1.packedValues[6u].w, multiplyAddValue64, fma(fragmentVectorConstants1.packedValues[4u].w, multiplyAddValue61, multiplyAddValue63 * fragmentVectorConstants1.packedValues[5u].w)));
        float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue69, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue68, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue66, multiplyAddValue67 * fragmentVectorConstants1.packedValues[1u].w)));
        float multiplyAddValue71 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue69, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue68, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue66, multiplyAddValue67 * fragmentVectorConstants1.packedValues[1u].x))) / multiplyAddValue70;
        float multiplyAddValue72 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue69, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue68, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue66, multiplyAddValue67 * fragmentVectorConstants1.packedValues[1u].y))) / multiplyAddValue70;
        float multiplyAddValue73 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue69, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue68, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue66, multiplyAddValue67 * fragmentVectorConstants1.packedValues[1u].z))) / multiplyAddValue70;
        vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue71 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue13 = inversesqrt(scalarValue71);
        float productValue236 = inverseLengthValue13 * varyingNormal0.x;
        float productValue237 = inverseLengthValue13 * varyingNormal0.y;
        float productValue238 = inverseLengthValue13 * varyingNormal0.z;
        float multiplyAddValue74 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue238, fma(fragmentVectorConstants1.packedValues[4u].x, productValue236, productValue237 * fragmentVectorConstants1.packedValues[5u].x));
        float multiplyAddValue78 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue238, fma(fragmentVectorConstants1.packedValues[4u].y, productValue236, productValue237 * fragmentVectorConstants1.packedValues[5u].y));
        float multiplyAddValue87 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue238, fma(fragmentVectorConstants1.packedValues[4u].z, productValue236, productValue237 * fragmentVectorConstants1.packedValues[5u].z));
        float sumValue208 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[132u].x;
        float sumValue209 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[132u].y;
        float sumValue210 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[132u].z;
        float scalarValue72 = dFdxCoarse(multiplyAddValue68);
        float scalarValue73 = dFdxCoarse(multiplyAddValue66);
        float scalarValue74 = dFdxCoarse(multiplyAddValue67);
        vec3 vectorValue1 = vec3(scalarValue72, scalarValue73, scalarValue74);
        float scalarValue75 = rdDot3Precise(vectorValue1, vectorValue1);
        float inverseLengthValue14 = inversesqrt(scalarValue75);
        float productValue239 = inverseLengthValue14 * scalarValue72;
        float productValue240 = inverseLengthValue14 * scalarValue73;
        float productValue241 = inverseLengthValue14 * scalarValue74;
        float scalarValue201 = -multiplyAddValue68;
        float scalarValue76 = dFdyCoarse(-multiplyAddValue67);
        float scalarValue202 = dFdyCoarse(scalarValue201);
        float scalarValue78 = dFdyCoarse(-multiplyAddValue66);
        vec3 vectorValue17 = vec3(scalarValue76, scalarValue202, scalarValue78);
        float scalarValue203 = rdDot3Precise(vectorValue17, vectorValue17);
        float inverseLengthValue26 = inversesqrt(scalarValue203);
        float productValue336 = inverseLengthValue26 * scalarValue76;
        float productValue337 = inverseLengthValue26 * scalarValue202;
        float productValue338 = inverseLengthValue26 * scalarValue78;
        float multiplyAddValue256 = fma(productValue241, productValue337, -(productValue239 * productValue336));
        float multiplyAddValue257 = fma(productValue239, productValue338, -(productValue240 * productValue337));
        float multiplyAddValue258 = fma(productValue240, productValue336, -(productValue241 * productValue338));
        vec3 vectorValue18 = vec3(multiplyAddValue256, multiplyAddValue257, multiplyAddValue258);
        float scalarValue204 = rdDot3Precise(vectorValue18, vectorValue18);
        float inverseLengthValue27 = inversesqrt(scalarValue204);
        float productValue339 = inverseLengthValue27 * multiplyAddValue256;
        float productValue340 = inverseLengthValue27 * multiplyAddValue257;
        float productValue341 = inverseLengthValue27 * multiplyAddValue258;
        float multiplyAddValue259 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue341, fma(fragmentVectorConstants1.packedValues[8u].x, productValue339, productValue340 * fragmentVectorConstants1.packedValues[9u].x));
        float multiplyAddValue260 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue341, fma(fragmentVectorConstants1.packedValues[8u].y, productValue339, productValue340 * fragmentVectorConstants1.packedValues[9u].y));
        float multiplyAddValue261 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue341, fma(fragmentVectorConstants1.packedValues[8u].z, productValue339, productValue340 * fragmentVectorConstants1.packedValues[9u].z));
        vec3 vectorValue19 = vec3(multiplyAddValue259, multiplyAddValue260, multiplyAddValue261);
        float scalarValue205 = rdDot3Precise(vectorValue19, vectorValue19);
        float inverseLengthValue28 = inversesqrt(scalarValue205);
        float quotientValue52 = roundEven((inverseLengthValue28 * multiplyAddValue259) / fragmentScalarConstants1.packedValues[684u]) * fragmentScalarConstants1.packedValues[684u];
        float quotientValue53 = roundEven((inverseLengthValue28 * multiplyAddValue260) / fragmentScalarConstants1.packedValues[684u]) * fragmentScalarConstants1.packedValues[684u];
        float quotientValue54 = roundEven((inverseLengthValue28 * multiplyAddValue261) / fragmentScalarConstants1.packedValues[684u]) * fragmentScalarConstants1.packedValues[684u];
        vec3 vectorValue20 = vec3(quotientValue52, quotientValue53, quotientValue54);
        float scalarValue206 = rdDot3Precise(vectorValue20, vectorValue20);
        float inverseLengthValue29 = inversesqrt(scalarValue206);
        float productValue342 = inverseLengthValue29 * quotientValue52;
        float productValue343 = inverseLengthValue29 * quotientValue53;
        float productValue344 = inverseLengthValue29 * quotientValue54;
        float scalarValue207 = -fragmentScalarConstants1.packedValues[666u];
        float multiplyAddValue262 = fma(fragmentScalarConstants1.packedValues[666u], 0.5, -fma(scalarValue207, floor(sumValue208 / fragmentScalarConstants1.packedValues[666u]), sumValue208));
        float multiplyAddValue263 = fma(fragmentScalarConstants1.packedValues[666u], 0.5, -fma(scalarValue207, floor(sumValue209 / fragmentScalarConstants1.packedValues[666u]), sumValue209));
        float multiplyAddValue264 = fma(fragmentScalarConstants1.packedValues[666u], 0.5, -fma(scalarValue207, floor(sumValue210 / fragmentScalarConstants1.packedValues[666u]), sumValue210));
        float scalarValue208 = rdDot3Precise(vec3(multiplyAddValue262, multiplyAddValue263, multiplyAddValue264), vec3(productValue342, productValue343, productValue344));
        float scalarValue209 = -scalarValue208;
        float multiplyAddValue265 = (sumValue208 + fma(scalarValue209, productValue342, multiplyAddValue262)) + fragmentVectorConstants1.packedValues[132u].x;
        float multiplyAddValue266 = (sumValue209 + fma(scalarValue209, productValue343, multiplyAddValue263)) + fragmentVectorConstants1.packedValues[132u].y;
        float multiplyAddValue267 = (sumValue210 + fma(scalarValue209, productValue344, multiplyAddValue264)) + fragmentVectorConstants1.packedValues[132u].z;
        float sumValue211 = 1.0 - fragmentScalarConstants1.packedValues[520u];
        float multiplyAddValue268 = fma(sumValue211, 0.039999999105930328369140625, multiplyAddValue253 * fragmentScalarConstants1.packedValues[520u]);
        float multiplyAddValue269 = fma(sumValue211, 0.039999999105930328369140625, multiplyAddValue254 * fragmentScalarConstants1.packedValues[520u]);
        float multiplyAddValue270 = fma(sumValue211, 0.039999999105930328369140625, multiplyAddValue255 * fragmentScalarConstants1.packedValues[520u]);
        bool bitwiseValue119 = (((fragmentScalarConstants1.packedValues[321u] + fragmentScalarConstants1.packedValues[320u]) + fragmentScalarConstants1.packedValues[322u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[508u] > 9.9999997473787516355514526367188e-05);
        float productValue345 = fragmentScalarConstants1.packedValues[508u] * fragmentScalarConstants1.packedValues[508u];
        float comparisonValue178 = bitwiseValue119 ? spvNMin(productValue345, 1.0) : fragmentVectorConstants1.packedValues[80u].x;
        float multiplyAddValue271 = bitwiseValue119 ? spvNMin(fma(fma(productValue345, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue345, 1.0) : fragmentVectorConstants1.packedValues[80u].y;
        float multiplyAddValue272 = bitwiseValue119 ? spvNMin(fma(productValue345 * productValue345, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue345, 1.0) : fragmentVectorConstants1.packedValues[80u].z;
        float exponentialValue;
        if ((fragmentScalarConstants1.packedValues[512u] != 0.0) && (fragmentScalarConstants1.packedValues[515u] != 0.0))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        exponentialValue = exp2(log2(spvNMax(productValue, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(productValue1, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(productValue2, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (productValue <= 0.040449999272823333740234375) ? (productValue * 0.077399380505084991455078125) : exp2(log2((productValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (productValue1 <= 0.040449999272823333740234375) ? (productValue1 * 0.077399380505084991455078125) : exp2(log2((productValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (productValue2 <= 0.040449999272823333740234375) ? (productValue2 * 0.077399380505084991455078125) : exp2(log2((productValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float productValue29;
    float productValue30;
    float productValue31;
    if (fragmentVectorConstants1.packedValues[75u].x > 0.0)
    {
        float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[59u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[58u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[57u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[60u].x;
        float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[59u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[58u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[57u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[60u].y;
        float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[59u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[58u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[57u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[60u].z;
        float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[59u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[58u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[57u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[60u].w;
        float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[7u].x, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[4u].x)));
        float multiplyAddValue5 = fma(fragmentVectorConstants1.packedValues[7u].y, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[4u].y)));
        float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[7u].z, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[4u].z)));
        float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[7u].w, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[6u].w, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[4u].w)));
        float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].w)));
        float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].x))) / multiplyAddValue8;
        float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].y))) / multiplyAddValue8;
        float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].z))) / multiplyAddValue8;
        float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float productValue3 = inverseLengthValue * varyingNormal0.x;
        float productValue4 = inverseLengthValue * varyingNormal0.y;
        float productValue5 = inverseLengthValue * varyingNormal0.z;
        float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue5, fma(fragmentVectorConstants1.packedValues[5u].x, productValue4, productValue3 * fragmentVectorConstants1.packedValues[4u].x));
        float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue5, fma(fragmentVectorConstants1.packedValues[5u].y, productValue4, productValue3 * fragmentVectorConstants1.packedValues[4u].y));
        float multiplyAddValue14 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue5, fma(fragmentVectorConstants1.packedValues[5u].z, productValue4, productValue3 * fragmentVectorConstants1.packedValues[4u].z));
        float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[130u].x;
        float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[130u].y;
        float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[130u].z;
        float scalarValue1 = dFdxCoarse(multiplyAddValue4);
        float scalarValue2 = dFdxCoarse(multiplyAddValue5);
        float scalarValue3 = dFdxCoarse(multiplyAddValue6);
        float inverseLengthValue1 = inversesqrt(dot(vec3(scalarValue1, scalarValue2, scalarValue3), vec3(scalarValue1, scalarValue2, scalarValue3)));
        float productValue6 = inverseLengthValue1 * scalarValue1;
        float productValue7 = inverseLengthValue1 * scalarValue2;
        float productValue8 = inverseLengthValue1 * scalarValue3;
        float sumValue3 = (-0.0) - multiplyAddValue6;
        float sumValue4 = dFdyCoarse((-0.0) - multiplyAddValue4);
        float sumValue5 = dFdyCoarse((-0.0) - multiplyAddValue5);
        float scalarValue4 = dFdyCoarse(sumValue3);
        float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue4, sumValue5, scalarValue4), vec3(sumValue4, sumValue5, scalarValue4)));
        float productValue9 = inverseLengthValue2 * sumValue4;
        float productValue10 = inverseLengthValue2 * sumValue5;
        float productValue11 = inverseLengthValue2 * scalarValue4;
        float productValue12 = (productValue11 * productValue7) - (productValue10 * productValue8);
        float productValue13 = (productValue9 * productValue8) - (productValue11 * productValue6);
        float productValue14 = (productValue10 * productValue6) - (productValue9 * productValue7);
        float inverseLengthValue3 = inversesqrt(dot(vec3(productValue12, productValue13, productValue14), vec3(productValue12, productValue13, productValue14)));
        float productValue15 = productValue12 * inverseLengthValue3;
        float productValue16 = productValue13 * inverseLengthValue3;
        float productValue17 = productValue14 * inverseLengthValue3;
        float multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue17, fma(fragmentVectorConstants1.packedValues[9u].x, productValue16, productValue15 * fragmentVectorConstants1.packedValues[8u].x));
        float multiplyAddValue16 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue17, fma(fragmentVectorConstants1.packedValues[9u].y, productValue16, productValue15 * fragmentVectorConstants1.packedValues[8u].y));
        float multiplyAddValue17 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue17, fma(fragmentVectorConstants1.packedValues[9u].z, productValue16, productValue15 * fragmentVectorConstants1.packedValues[8u].z));
        float inverseLengthValue4 = inversesqrt(dot(vec3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), vec3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17)));
        float quotientValue = roundEven((inverseLengthValue4 * multiplyAddValue15) / fragmentVectorConstants1.packedValues[154u].x) * fragmentVectorConstants1.packedValues[154u].x;
        float quotientValue1 = roundEven((inverseLengthValue4 * multiplyAddValue16) / fragmentVectorConstants1.packedValues[154u].x) * fragmentVectorConstants1.packedValues[154u].x;
        float quotientValue2 = roundEven((inverseLengthValue4 * multiplyAddValue17) / fragmentVectorConstants1.packedValues[154u].x) * fragmentVectorConstants1.packedValues[154u].x;
        float inverseLengthValue5 = inversesqrt(dot(vec3(quotientValue, quotientValue1, quotientValue2), vec3(quotientValue, quotientValue1, quotientValue2)));
        float productValue18 = inverseLengthValue5 * quotientValue;
        float productValue19 = inverseLengthValue5 * quotientValue1;
        float productValue20 = inverseLengthValue5 * quotientValue2;
        float productValue21 = fragmentVectorConstants1.packedValues[151u].z * 0.5;
        float quotientValue3 = productValue21 - (sumValue - (floor(sumValue / fragmentVectorConstants1.packedValues[151u].z) * fragmentVectorConstants1.packedValues[151u].z));
        float quotientValue10 = productValue21 - (sumValue1 - (floor(sumValue1 / fragmentVectorConstants1.packedValues[151u].z) * fragmentVectorConstants1.packedValues[151u].z));
        float quotientValue11 = productValue21 - (sumValue2 - (floor(sumValue2 / fragmentVectorConstants1.packedValues[151u].z) * fragmentVectorConstants1.packedValues[151u].z));
        float dotProductValue = dot(vec3(quotientValue3, quotientValue10, quotientValue11), vec3(productValue18, productValue19, productValue20));
        float productValue22 = (varyingTexCoord3.x + quotientValue3) - (dotProductValue * productValue18);
        float productValue23 = (varyingTexCoord3.y - (dotProductValue * productValue19)) + quotientValue10;
        float productValue24 = (varyingTexCoord3.z - (dotProductValue * productValue20)) + quotientValue11;
        float sumValue6 = 1.0 - fragmentVectorConstants1.packedValues[128u].x;
        float productValue25 = sumValue6 * 0.039999999105930328369140625;
        float productValue26 = productValue25 + (fragmentVectorConstants1.packedValues[128u].x * exponentialValue);
        float productValue27 = productValue25 + (fragmentVectorConstants1.packedValues[128u].x * exponentialValue1);
        float productValue28 = productValue25 + (fragmentVectorConstants1.packedValues[128u].x * exponentialValue2);
        float intermediateValue8;
        float productValue36;
        float productValue37;
        if ((fragmentVectorConstants1.packedValues[125u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[79u].x + fragmentVectorConstants1.packedValues[79u].y) + fragmentVectorConstants1.packedValues[79u].z) < 9.9999997473787516355514526367188e-05))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        exponentialValue = exp2(log2(spvNMax(productValue442, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(productValue443, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(productValue444, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (productValue442 <= 0.040449999272823333740234375) ? (productValue442 * 0.077399380505084991455078125) : exp2(log2((productValue442 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (productValue443 <= 0.040449999272823333740234375) ? (productValue443 * 0.077399380505084991455078125) : exp2(log2((productValue443 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (productValue444 <= 0.040449999272823333740234375) ? (productValue444 * 0.077399380505084991455078125) : exp2(log2((productValue444 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float productValue29;
    float productValue30;
    float productValue31;
    if (fragmentVectorConstants1.packedValues[76u].x > 0.0)
    {
        float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[59u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[58u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[57u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[60u].x;
        float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[59u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[58u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[57u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[60u].y;
        float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[59u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[58u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[57u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[60u].z;
        float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[59u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[58u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[57u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[60u].w;
        float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[7u].x, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[4u].x)));
        float multiplyAddValue5 = fma(fragmentVectorConstants1.packedValues[7u].y, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[4u].y)));
        float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[7u].z, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[4u].z)));
        float sumValue3 = (-0.0) - multiplyAddValue6;
        float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[7u].w, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[6u].w, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[4u].w)));
        float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].w)));
        float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].x))) / multiplyAddValue8;
        float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].y))) / multiplyAddValue8;
        float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].z))) / multiplyAddValue8;
        float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float productValue3 = inverseLengthValue * varyingNormal0.x;
        float productValue4 = inverseLengthValue * varyingNormal0.y;
        float productValue5 = inverseLengthValue * varyingNormal0.z;
        float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue5, fma(fragmentVectorConstants1.packedValues[5u].x, productValue4, productValue3 * fragmentVectorConstants1.packedValues[4u].x));
        float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue5, fma(fragmentVectorConstants1.packedValues[5u].y, productValue4, productValue3 * fragmentVectorConstants1.packedValues[4u].y));
        float multiplyAddValue14 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue5, fma(fragmentVectorConstants1.packedValues[5u].z, productValue4, productValue3 * fragmentVectorConstants1.packedValues[4u].z));
        float sumValue208 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[132u].x;
        float sumValue209 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[132u].y;
        float sumValue210 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[132u].z;
        float scalarValue1 = dFdxCoarse(multiplyAddValue4);
        float scalarValue2 = dFdxCoarse(multiplyAddValue5);
        float scalarValue3 = dFdxCoarse(multiplyAddValue6);
        float inverseLengthValue1 = inversesqrt(dot(vec3(scalarValue1, scalarValue2, scalarValue3), vec3(scalarValue1, scalarValue2, scalarValue3)));
        float productValue6 = inverseLengthValue1 * scalarValue1;
        float productValue7 = inverseLengthValue1 * scalarValue2;
        float productValue8 = inverseLengthValue1 * scalarValue3;
        float sumValue4 = dFdyCoarse((-0.0) - multiplyAddValue4);
        float sumValue5 = dFdyCoarse((-0.0) - multiplyAddValue5);
        float scalarValue4 = dFdyCoarse(sumValue3);
        float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue4, sumValue5, scalarValue4), vec3(sumValue4, sumValue5, scalarValue4)));
        float productValue9 = inverseLengthValue2 * sumValue4;
        float productValue10 = inverseLengthValue2 * sumValue5;
        float productValue11 = inverseLengthValue2 * scalarValue4;
        float productValue12 = (productValue11 * productValue7) - (productValue10 * productValue8);
        float productValue13 = (productValue9 * productValue8) - (productValue11 * productValue6);
        float productValue14 = (productValue10 * productValue6) - (productValue9 * productValue7);
        float inverseLengthValue3 = inversesqrt(dot(vec3(productValue12, productValue13, productValue14), vec3(productValue12, productValue13, productValue14)));
        float productValue15 = productValue12 * inverseLengthValue3;
        float productValue16 = productValue13 * inverseLengthValue3;
        float productValue17 = productValue14 * inverseLengthValue3;
        float multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue17, fma(fragmentVectorConstants1.packedValues[9u].x, productValue16, productValue15 * fragmentVectorConstants1.packedValues[8u].x));
        float multiplyAddValue16 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue17, fma(fragmentVectorConstants1.packedValues[9u].y, productValue16, productValue15 * fragmentVectorConstants1.packedValues[8u].y));
        float multiplyAddValue17 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue17, fma(fragmentVectorConstants1.packedValues[9u].z, productValue16, productValue15 * fragmentVectorConstants1.packedValues[8u].z));
        float inverseLengthValue4 = inversesqrt(dot(vec3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), vec3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17)));
        float quotientValue74 = roundEven((inverseLengthValue4 * multiplyAddValue15) / fragmentVectorConstants1.packedValues[171u].x) * fragmentVectorConstants1.packedValues[171u].x;
        float quotientValue75 = roundEven((inverseLengthValue4 * multiplyAddValue16) / fragmentVectorConstants1.packedValues[171u].x) * fragmentVectorConstants1.packedValues[171u].x;
        float quotientValue76 = roundEven((inverseLengthValue4 * multiplyAddValue17) / fragmentVectorConstants1.packedValues[171u].x) * fragmentVectorConstants1.packedValues[171u].x;
        float inverseLengthValue38 = inversesqrt(dot(vec3(quotientValue74, quotientValue75, quotientValue76), vec3(quotientValue74, quotientValue75, quotientValue76)));
        float productValue445 = inverseLengthValue38 * quotientValue74;
        float productValue446 = inverseLengthValue38 * quotientValue75;
        float productValue447 = inverseLengthValue38 * quotientValue76;
        float productValue448 = fragmentVectorConstants1.packedValues[166u].z * 0.5;
        float quotientValue77 = productValue448 - (sumValue208 - (floor(sumValue208 / fragmentVectorConstants1.packedValues[166u].z) * fragmentVectorConstants1.packedValues[166u].z));
        float quotientValue78 = productValue448 - (sumValue209 - (floor(sumValue209 / fragmentVectorConstants1.packedValues[166u].z) * fragmentVectorConstants1.packedValues[166u].z));
        float quotientValue79 = productValue448 - (sumValue210 - (floor(sumValue210 / fragmentVectorConstants1.packedValues[166u].z) * fragmentVectorConstants1.packedValues[166u].z));
        float dotProductValue21 = dot(vec3(quotientValue77, quotientValue78, quotientValue79), vec3(productValue445, productValue446, productValue447));
        float productValue449 = (varyingTexCoord3.x + quotientValue77) - (dotProductValue21 * productValue445);
        float productValue450 = (varyingTexCoord3.y - (dotProductValue21 * productValue446)) + quotientValue78;
        float productValue451 = (varyingTexCoord3.z - (dotProductValue21 * productValue447)) + quotientValue79;
        float sumValue299 = 1.0 - fragmentVectorConstants1.packedValues[130u].x;
        float productValue452 = sumValue299 * 0.039999999105930328369140625;
        float productValue453 = productValue452 + (fragmentVectorConstants1.packedValues[130u].x * exponentialValue);
        float productValue454 = productValue452 + (fragmentVectorConstants1.packedValues[130u].x * exponentialValue1);
        float productValue455 = productValue452 + (fragmentVectorConstants1.packedValues[130u].x * exponentialValue2);
        float intermediateValue8;
        float productValue36;
        float productValue37;
        if ((fragmentVectorConstants1.packedValues[127u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[80u].x + fragmentVectorConstants1.packedValues[80u].y) + fragmentVectorConstants1.packedValues[80u].z) < 9.9999997473787516355514526367188e-05))
#endif
        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue54 = texture(sampler2DArray(materialTexture4, textureSampler4), vec3((varyingTexCoord3.x - fragmentScalarConstants1.packedValues[520u]) * fragmentScalarConstants1.packedValues[505u], (varyingTexCoord3.z - fragmentScalarConstants1.packedValues[522u]) * fragmentScalarConstants1.packedValues[505u], fragmentScalarConstants1.packedValues[509u]));
            float scalarValue86 = sampledTextureValue54.x;
            exponentialValue = exp2(log2((scalarValue86 + scalarValue86) * spvNClamp(productValue237, 0.0, 1.0)) * fragmentScalarConstants1.packedValues[506u]) * (fragmentScalarConstants1.packedValues[506u] + 1.0);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue67 = texture(sampler2DArray(materialTexture4, textureSampler4), vec3((varyingTexCoord3.x - fragmentScalarConstants1.packedValues[528u]) * fragmentScalarConstants1.packedValues[513u], (varyingTexCoord3.z - fragmentScalarConstants1.packedValues[530u]) * fragmentScalarConstants1.packedValues[513u], fragmentScalarConstants1.packedValues[517u]));
            float scalarValue210 = sampledTextureValue67.x;
            exponentialValue = exp2(log2((scalarValue210 + scalarValue210) * spvNClamp(productValue237, 0.0, 1.0)) * fragmentScalarConstants1.packedValues[514u]) * (fragmentScalarConstants1.packedValues[514u] + 1.0);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float productValue32 = fragmentVectorConstants1.packedValues[125u].x * fragmentVectorConstants1.packedValues[125u].x;
            intermediateValue8 = spvNClamp(productValue32, 0.0, 1.0);
            productValue36 = spvNClamp(((productValue32 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue32, 0.0, 1.0);
            productValue37 = spvNClamp((((productValue32 * productValue32) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue32, 0.0, 1.0);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float productValue456 = fragmentVectorConstants1.packedValues[127u].x * fragmentVectorConstants1.packedValues[127u].x;
            intermediateValue8 = spvNClamp(productValue456, 0.0, 1.0);
            productValue36 = spvNClamp(((productValue456 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue456, 0.0, 1.0);
            productValue37 = spvNClamp((((productValue456 * productValue456) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue456, 0.0, 1.0);
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            exponentialValue = 1.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            intermediateValue8 = fragmentVectorConstants1.packedValues[79u].x;
            productValue36 = fragmentVectorConstants1.packedValues[79u].y;
            productValue37 = fragmentVectorConstants1.packedValues[79u].z;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            intermediateValue8 = fragmentVectorConstants1.packedValues[80u].x;
            productValue36 = fragmentVectorConstants1.packedValues[80u].y;
            productValue37 = fragmentVectorConstants1.packedValues[80u].z;
#endif
        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec3 vectorValue6 = vec3(multiplyAddValue66, multiplyAddValue67, multiplyAddValue68);
        float scalarValue87 = rdDot3Precise(vectorValue6, vectorValue6);
        float nonlinearValue5 = sqrt(scalarValue87);
        vec3 vectorValue7 = vec3(multiplyAddValue74, multiplyAddValue78, multiplyAddValue87);
        float multiplyAddValue41;
        float multiplyAddValue42;
        float multiplyAddValue43;
        float intermediateValue52;
        float intermediateValue53;
        float intermediateValue54;
        float multiplyAddValue44;
        float multiplyAddValue45;
        float multiplyAddValue46;
        float intermediateValue55;
        float intermediateValue56;
        float intermediateValue57;
        if (multiplyAddValue73 != 1.0)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec3 vectorValue6 = vec3(multiplyAddValue66, multiplyAddValue67, multiplyAddValue68);
        float scalarValue87 = rdDot3Precise(vectorValue6, vectorValue6);
        float nonlinearValue5 = sqrt(scalarValue87);
        vec3 vectorValue21 = vec3(productValue236, productValue237, productValue238);
        vec3 vectorValue7 = vec3(multiplyAddValue74, multiplyAddValue78, multiplyAddValue87);
        float multiplyAddValue41;
        float multiplyAddValue42;
        float multiplyAddValue43;
        float intermediateValue60;
        float intermediateValue61;
        float intermediateValue62;
        float multiplyAddValue47;
        float multiplyAddValue48;
        float multiplyAddValue49;
        float intermediateValue63;
        float intermediateValue64;
        float intermediateValue65;
        if (multiplyAddValue73 != 1.0)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue2;
        if ((fragmentVectorConstants1.packedValues[126u].x != 0.0) && (fragmentVectorConstants1.packedValues[126u].w != 0.0))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue2;
        if ((fragmentVectorConstants1.packedValues[128u].x != 0.0) && (fragmentVectorConstants1.packedValues[128u].w != 0.0))
#endif
        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float quotientValue4;
            float quotientValue5;
            float quotientValue6;
            float multiplyAddValue47;
            float multiplyAddValue48;
            float multiplyAddValue49;
            if (!((fragmentScalarConstants1.packedValues[576u] != 0.0) && (abs(fragmentScalarConstants1.packedValues[501u]) < 9.9999997473787516355514526367188e-05)))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float sumValue138 = nonlinearValue5 + 9.9999997473787516355514526367188e-05;
            float quotientValue55 = multiplyAddValue66 / sumValue138;
            float quotientValue56 = multiplyAddValue67 / sumValue138;
            float quotientValue57 = multiplyAddValue68 / sumValue138;
            float productValue346 = fragmentScalarConstants1.packedValues[523u] * fragmentScalarConstants1.packedValues[704u];
            bool conditionValue19 = int(uint(int(fragmentScalarConstants1.packedValues[665u]))) > int(0u);
            float comparisonValue179 = conditionValue19 ? multiplyAddValue265 : varyingTexCoord3.x;
            float comparisonValue180 = conditionValue19 ? multiplyAddValue266 : varyingTexCoord3.y;
            float comparisonValue181 = conditionValue19 ? multiplyAddValue267 : varyingTexCoord3.z;
            float multiplyAddValue53;
            float multiplyAddValue54;
            float multiplyAddValue55;
            float quotientValue7;
            float quotientValue8;
            float quotientValue9;
            if (!((fragmentScalarConstants1.packedValues[588u] != 0.0) && (abs(fragmentScalarConstants1.packedValues[509u]) < 9.9999997473787516355514526367188e-05)))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue2 = exp2(log2((texture(sampler2DArray(causticsTextureTexture, causticsTextureSampler), vec3(fragmentVectorConstants1.packedValues[126u].y * sumValue, fragmentVectorConstants1.packedValues[126u].y * sumValue2, fragmentVectorConstants1.packedValues[127u].y)).x * 2.0) * spvNClamp(dot(vec3(0.0, 1.0, 0.0), vec3(productValue3, productValue4, productValue5)), 0.0, 1.0)) * fragmentVectorConstants1.packedValues[126u].z) * (fragmentVectorConstants1.packedValues[126u].z + 1.0);
        }
        else
        {
            sampledTextureValue2 = 1.0;
        }
        float quotientValue12 = spvNClamp(((fragmentVectorConstants1.packedValues[125u].y * 16.0) - fragmentVectorConstants1.packedValues[85u].y) / spvNMax(fragmentVectorConstants1.packedValues[85u].x - fragmentVectorConstants1.packedValues[85u].y, 1.0), 0.0, 1.0);
        float nonlinearValue = sqrt(((multiplyAddValue5 * multiplyAddValue5) + (multiplyAddValue4 * multiplyAddValue4)) + (multiplyAddValue6 * multiplyAddValue6));
        float productValue42;
        float productValue43;
        float productValue44;
        float productValue45;
        float productValue46;
        float productValue47;
        float intermediateValue10;
        float intermediateValue12;
        float intermediateValue14;
        float intermediateValue16;
        float intermediateValue18;
        float intermediateValue20;
        if (multiplyAddValue11 != 1.0)
        {
            float sumValue7 = nonlinearValue + 9.9999997473787516355514526367188e-05;
            float quotientValue13 = multiplyAddValue4 / sumValue7;
            float quotientValue14 = multiplyAddValue5 / sumValue7;
            float quotientValue15 = multiplyAddValue6 / sumValue7;
            float sumValue8 = (-0.0) - quotientValue13;
            float sumValue9 = (-0.0) - quotientValue14;
            float sumValue10 = (-0.0) - quotientValue15;
            float productValue33 = fragmentVectorConstants1.packedValues[159u].x * fragmentVectorConstants1.packedValues[128u].w;
            bool conditionValue = int(uint(int(fragmentVectorConstants1.packedValues[151u].y))) > int(0u);
            float intermediateValue11;
            float intermediateValue13;
            float intermediateValue15;
            float intermediateValue17;
            float intermediateValue19;
            float intermediateValue21;
            if ((fragmentVectorConstants1.packedValues[144u].x != 0.0) && (abs(fragmentVectorConstants1.packedValues[125u].y) < 9.9999997473787516355514526367188e-05))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue2 = exp2(log2((texture(sampler2DArray(causticsTextureTexture, causticsTextureSampler), vec3(fragmentVectorConstants1.packedValues[128u].y * sumValue208, fragmentVectorConstants1.packedValues[128u].y * sumValue210, fragmentVectorConstants1.packedValues[129u].y)).x * 2.0) * spvNClamp(dot(vec3(0.0, 1.0, 0.0), vec3(productValue3, productValue4, productValue5)), 0.0, 1.0)) * fragmentVectorConstants1.packedValues[128u].z) * (fragmentVectorConstants1.packedValues[128u].z + 1.0);
        }
        else
        {
            sampledTextureValue2 = 1.0;
        }
        float quotientValue80 = spvNClamp(((fragmentVectorConstants1.packedValues[127u].y * 16.0) - fragmentVectorConstants1.packedValues[86u].y) / spvNMax(fragmentVectorConstants1.packedValues[86u].x - fragmentVectorConstants1.packedValues[86u].y, 1.0), 0.0, 1.0);
        float nonlinearValue = sqrt(((multiplyAddValue5 * multiplyAddValue5) + (multiplyAddValue4 * multiplyAddValue4)) + (multiplyAddValue6 * multiplyAddValue6));
        float productValue42;
        float productValue43;
        float productValue44;
        float productValue45;
        float productValue46;
        float productValue47;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
        if (multiplyAddValue11 != 1.0)
        {
            float sumValue7 = nonlinearValue + 9.9999997473787516355514526367188e-05;
            float quotientValue13 = multiplyAddValue4 / sumValue7;
            float quotientValue14 = multiplyAddValue5 / sumValue7;
            float quotientValue15 = multiplyAddValue6 / sumValue7;
            float sumValue8 = (-0.0) - quotientValue13;
            float sumValue9 = (-0.0) - quotientValue14;
            float sumValue10 = (-0.0) - quotientValue15;
            float productValue457 = fragmentVectorConstants1.packedValues[176u].x * fragmentVectorConstants1.packedValues[130u].w;
            bool conditionValue42 = int(uint(int(fragmentVectorConstants1.packedValues[166u].y))) > int(0u);
            float intermediateValue16;
            float intermediateValue17;
            float intermediateValue18;
            float intermediateValue19;
            float intermediateValue20;
            float intermediateValue21;
            if ((fragmentVectorConstants1.packedValues[147u].x != 0.0) && (abs(fragmentVectorConstants1.packedValues[127u].y) < 9.9999997473787516355514526367188e-05))
#endif
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                float sumValue138 = nonlinearValue5 + 9.9999997473787516355514526367188e-05;
                float productValue252 = fragmentScalarConstants1.packedValues[515u] * fragmentScalarConstants1.packedValues[636u];
                float multiplyAddValue56;
                float intermediateValue71;
                if (uint(int(fragmentScalarConstants1.packedValues[308u])) == 1u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                float multiplyAddValue62;
                float intermediateValue78;
                if (uint(int(fragmentScalarConstants1.packedValues[312u])) == 1u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                intermediateValue11 = 0.0;
                intermediateValue13 = 0.0;
                intermediateValue15 = 0.0;
                intermediateValue17 = 0.0;
                intermediateValue19 = 0.0;
                intermediateValue21 = 0.0;
            }
            else
            {
                float productValue72;
                float intermediateValue25;
                if (uint(int(fragmentVectorConstants1.packedValues[77u].x)) == 1u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                intermediateValue16 = 0.0;
                intermediateValue17 = 0.0;
                intermediateValue18 = 0.0;
                intermediateValue19 = 0.0;
                intermediateValue20 = 0.0;
                intermediateValue21 = 0.0;
            }
            else
            {
                float productValue63;
                float intermediateValue23;
                if (uint(int(fragmentVectorConstants1.packedValues[78u].x)) == 1u)
#endif
                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool conditionValue2 = int(uint(int(fragmentScalarConstants1.packedValues[605u]))) > int(0u);
                    float multiplyAddValue105 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[583u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[582u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[580u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[581u])));
                    float multiplyAddValue106 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[583u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[582u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[580u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[581u])));
                    float multiplyAddValue107 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[583u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[582u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[580u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[581u])));
                    vec3 vectorValue8 = vec3(multiplyAddValue105, multiplyAddValue106, multiplyAddValue107);
                    float scalarValue88 = rdDot3Precise(vectorValue8, vectorValue8);
                    float inverseLengthValue19 = inversesqrt(scalarValue88);
                    float productValue253 = rdDot3Precise(vectorValue7, vec3(inverseLengthValue19 * multiplyAddValue105, inverseLengthValue19 * multiplyAddValue106, inverseLengthValue19 * multiplyAddValue107));
                    float scalarValue89 = spvNMax(productValue253, 0.0);
                    float sumValue139 = spvNMax(1.0 - scalarValue89, 0.0);
                    float multiplyAddValue108 = fma(productValue236 * fragmentScalarConstants1.packedValues[627u], sumValue139, conditionValue2 ? multiplyAddValue97 : varyingTexCoord3.x);
                    float multiplyAddValue109 = fma(productValue237 * fragmentScalarConstants1.packedValues[627u], sumValue139, conditionValue2 ? multiplyAddValue98 : varyingTexCoord3.y);
                    float multiplyAddValue110 = fma(productValue238 * fragmentScalarConstants1.packedValues[627u], sumValue139, conditionValue2 ? multiplyAddValue99 : varyingTexCoord3.z);
                    float scalarValue90 = rdDot4Precise2(vec4(spvNClamp(fragmentVectorConstants1.packedValues[92u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[92u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[92u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[92u].w, 0.0, 1.0)), vec4(1.0));
                    uint scalarValue91 = uint(int(scalarValue90));
                    bool comparisonValue114 = fragmentScalarConstants1.packedValues[604u] != 0.0;
                    float intermediateValue72;
                    float intermediateValue100;
                    intermediateValue100 = 1.0;
                    intermediateValue72 = 1.0;
                    uint sumValue15;
                    float intermediateValue101;
                    float intermediateValue102;
                    uint intermediateValue104;
                    uint scalarValue7 = 0u;
                    uint scalarValue8 = 0u;
                    for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    float multiplyAddValue273 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[595u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[594u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[592u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[593u])));
                    float multiplyAddValue274 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[595u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[594u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[592u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[593u])));
                    float multiplyAddValue275 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[595u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[594u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[592u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[593u])));
                    vec3 vectorValue22 = vec3(multiplyAddValue273, multiplyAddValue274, multiplyAddValue275);
                    float scalarValue211 = rdDot3Precise(vectorValue22, vectorValue22);
                    float inverseLengthValue30 = inversesqrt(scalarValue211);
                    float productValue347 = rdDot3Precise(vectorValue7, vec3(inverseLengthValue30 * multiplyAddValue273, inverseLengthValue30 * multiplyAddValue274, inverseLengthValue30 * multiplyAddValue275));
                    float scalarValue212 = spvNMax(productValue347, 0.0);
                    float sumValue212 = spvNMax(1.0 - scalarValue212, 0.0);
                    float multiplyAddValue276 = fma(productValue236 * fragmentScalarConstants1.packedValues[695u], sumValue212, comparisonValue179);
                    float multiplyAddValue277 = fma(productValue237 * fragmentScalarConstants1.packedValues[695u], sumValue212, comparisonValue180);
                    float multiplyAddValue278 = fma(productValue238 * fragmentScalarConstants1.packedValues[695u], sumValue212, comparisonValue181);
                    float scalarValue213 = rdDot4Precise2(vec4(spvNClamp(fragmentVectorConstants1.packedValues[94u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[94u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[94u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[94u].w, 0.0, 1.0)), vec4(1.0));
                    uint scalarValue214 = uint(int(scalarValue213));
                    bool comparisonValue182 = fragmentScalarConstants1.packedValues[664u] != 0.0;
                    float intermediateValue79;
                    float intermediateValue104;
                    intermediateValue104 = 1.0;
                    intermediateValue79 = 1.0;
                    uint sumValue14;
                    float intermediateValue105;
                    float intermediateValue106;
                    uint intermediateValue108;
                    uint scalarValue7 = 0u;
                    uint scalarValue8 = 0u;
                    for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[145u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[145u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[145u].y, fragmentVectorConstants1.packedValues[145u].x * fragmentVectorConstants1.packedValues[4u].x)));
                    float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[145u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[145u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[145u].y, fragmentVectorConstants1.packedValues[145u].x * fragmentVectorConstants1.packedValues[4u].y)));
                    float multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[145u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[145u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[145u].y, fragmentVectorConstants1.packedValues[145u].x * fragmentVectorConstants1.packedValues[4u].z)));
                    float inverseLengthValue6 = inversesqrt(dot(vec3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), vec3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
                    float dotProductValue1 = spvNMax(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(inverseLengthValue6 * multiplyAddValue18, inverseLengthValue6 * multiplyAddValue19, inverseLengthValue6 * multiplyAddValue20)), 0.0);
                    float productValue34 = spvNClamp(1.0 - dotProductValue1, 0.0, 1.0) * fragmentVectorConstants1.packedValues[156u].w;
                    float comparisonValue = (productValue34 * productValue3) + (conditionValue ? productValue22 : varyingTexCoord3.x);
                    float comparisonValue1 = (productValue34 * productValue4) + (conditionValue ? productValue23 : varyingTexCoord3.y);
                    float comparisonValue2 = (productValue34 * productValue5) + (conditionValue ? productValue24 : varyingTexCoord3.z);
                    uint dotProductValue2 = uint(int(dot(vec4(spvNClamp(fragmentVectorConstants1.packedValues[92u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[92u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[92u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[92u].w, 0.0, 1.0)), vec4(1.0))));
                    float intermediateValue26;
                    float intermediateValue37;
                    if (int(dotProductValue2) > int(0u))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    float multiplyAddValue428 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[148u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[148u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[148u].y, fragmentVectorConstants1.packedValues[148u].x * fragmentVectorConstants1.packedValues[4u].x)));
                    float multiplyAddValue429 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[148u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[148u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[148u].y, fragmentVectorConstants1.packedValues[148u].x * fragmentVectorConstants1.packedValues[4u].y)));
                    float multiplyAddValue430 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[148u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[148u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[148u].y, fragmentVectorConstants1.packedValues[148u].x * fragmentVectorConstants1.packedValues[4u].z)));
                    float inverseLengthValue39 = inversesqrt(dot(vec3(multiplyAddValue428, multiplyAddValue429, multiplyAddValue430), vec3(multiplyAddValue428, multiplyAddValue429, multiplyAddValue430)));
                    float dotProductValue22 = spvNMax(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(inverseLengthValue39 * multiplyAddValue428, inverseLengthValue39 * multiplyAddValue429, inverseLengthValue39 * multiplyAddValue430)), 0.0);
                    float productValue458 = spvNClamp(1.0 - dotProductValue22, 0.0, 1.0) * fragmentVectorConstants1.packedValues[173u].w;
                    float comparisonValue259 = (productValue458 * productValue3) + (conditionValue42 ? productValue449 : varyingTexCoord3.x);
                    float comparisonValue260 = (productValue458 * productValue4) + (conditionValue42 ? productValue450 : varyingTexCoord3.y);
                    float comparisonValue261 = (productValue458 * productValue5) + (conditionValue42 ? productValue451 : varyingTexCoord3.z);
                    uint dotProductValue23 = uint(int(dot(vec4(spvNClamp(fragmentVectorConstants1.packedValues[94u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[94u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[94u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[94u].w, 0.0, 1.0)), vec4(1.0))));
                    float intermediateValue24;
                    float intermediateValue36;
                    if (int(dotProductValue23) > int(0u))
#endif
                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                        if (int(scalarValue91) <= int(scalarValue8))
                        {
                            break;
                        }
                        uint scalarValue92 = min(scalarValue8, 68u);
                        uint scalarValue93 = intermediateValue18[scalarValue92].x;
                        uint scalarValue94 = intermediateValue18[scalarValue92].y;
                        uint scalarValue95 = intermediateValue18[scalarValue92].z;
                        uint scalarValue96 = intermediateValue18[scalarValue92].w;
                        float reinterpretedBits = rdDot4Precise2(fragmentVectorConstants1.packedValues[92u], vec4(uintBitsToFloat(scalarValue93), uintBitsToFloat(scalarValue94), uintBitsToFloat(scalarValue95), uintBitsToFloat(scalarValue96)));
                        uint sumValue140 = uint(min(int(uint(int(reinterpretedBits)) + scalarValue7), int(8u)));
                        intermediateValue101 = intermediateValue100;
                        intermediateValue102 = intermediateValue72;
                        intermediateValue104 = scalarValue7;
                        float quotientValue17;
                        float quotientValue18;
                        uint intermediateValue149;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                        if (int(scalarValue214) <= int(scalarValue8))
                        {
                            break;
                        }
                        uint scalarValue92 = min(scalarValue8, 68u);
                        uint scalarValue215 = intermediateValue23[scalarValue92].x;
                        uint scalarValue216 = intermediateValue23[scalarValue92].y;
                        uint scalarValue217 = intermediateValue23[scalarValue92].z;
                        uint scalarValue218 = intermediateValue23[scalarValue92].w;
                        float reinterpretedBits2 = rdDot4Precise2(fragmentVectorConstants1.packedValues[94u], vec4(uintBitsToFloat(scalarValue215), uintBitsToFloat(scalarValue216), uintBitsToFloat(scalarValue217), uintBitsToFloat(scalarValue218)));
                        uint sumValue213 = uint(min(int(uint(int(reinterpretedBits2)) + scalarValue7), int(8u)));
                        intermediateValue105 = intermediateValue104;
                        intermediateValue106 = intermediateValue79;
                        intermediateValue108 = scalarValue7;
                        float quotientValue20;
                        float quotientValue21;
                        uint intermediateValue187;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        float intermediateValue36;
                        float intermediateValue38;
                        uint intermediateValue49;
                        float scalarValue5 = 1.0;
                        float scalarValue6 = 1.0;
                        uint scalarValue7 = 0u;
                        uint scalarValue8 = 0u;
                        uint sumValue31;
                        bool intermediateValue51;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        float intermediateValue35;
                        float intermediateValue37;
                        uint intermediateValue55;
                        float scalarValue5 = 1.0;
                        float scalarValue6 = 1.0;
                        uint scalarValue7 = 0u;
                        uint scalarValue8 = 0u;
                        uint sumValue31;
                        bool intermediateValue57;
#endif
                        for (;;)
                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                            if (int(sumValue140) <= int(intermediateValue104))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                            if (int(sumValue213) <= int(intermediateValue108))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                            sumValue31 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[scalarValue8 + 368u])) + scalarValue7), int(8u)));
                            intermediateValue51 = int(scalarValue7) < int(sumValue31);
                            uint branchMergedValue;
                            float branchMergedValue5;
                            float branchMergedValue6;
                            if (intermediateValue51)
                            {
                                float intermediateValue58;
                                float intermediateValue59;
                                uint intermediateValue60;
                                float scalarValue9 = scalarValue5;
                                float scalarValue10 = scalarValue6;
                                uint scalarValue11 = scalarValue7;
                                uint bitwiseValue10;
                                float multiplyAddValue35;
                                float multiplyAddValue36;
                                float multiplyAddValue37;
                                bool comparisonValue18;
                                for (;;)
                                {
                                    bitwiseValue10 = scalarValue11 << 2u;
                                    uint sumValue11 = bitwiseValue10 + 93u;
                                    uint sumValue12 = bitwiseValue10 + 94u;
                                    uint sumValue13 = bitwiseValue10 + 95u;
                                    uint sumValue17 = bitwiseValue10 + 96u;
                                    multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[sumValue13].x, comparisonValue2, fma(fragmentVectorConstants1.packedValues[sumValue12].x, comparisonValue1, fragmentVectorConstants1.packedValues[sumValue11].x * comparisonValue)) + fragmentVectorConstants1.packedValues[sumValue17].x;
                                    multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[sumValue13].y, comparisonValue2, fma(fragmentVectorConstants1.packedValues[sumValue12].y, comparisonValue1, fragmentVectorConstants1.packedValues[sumValue11].y * comparisonValue)) + fragmentVectorConstants1.packedValues[sumValue17].y;
                                    multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[sumValue13].z, comparisonValue2, fma(fragmentVectorConstants1.packedValues[sumValue12].z, comparisonValue1, fragmentVectorConstants1.packedValues[sumValue11].z * comparisonValue)) + fragmentVectorConstants1.packedValues[sumValue17].z;
                                    comparisonValue18 = ((abs(multiplyAddValue35) <= 1.0) && (abs(multiplyAddValue36) <= 1.0)) && (abs(multiplyAddValue37) <= 1.0);
                                    float branchMergedValue1;
                                    float branchMergedValue7;
                                    uint branchMergedValue8;
                                    if (comparisonValue18)
                                    {
                                        uint sumValue18 = scalarValue11 + 48u;
                                        float sumValue19 = spvNMin(spvNMax(dotProductValue1, fragmentScalarConstants1.packedValues[scalarValue11 + 312u]), 1.0);
                                        float nonlinearValue1 = (sqrt(1.0 - (sumValue19 * sumValue19)) / sumValue19) * fragmentVectorConstants1.packedValues[sumValue18].z;
                                        float productValue35 = (multiplyAddValue35 * 0.5) + 0.5;
                                        float productValue41 = 0.5 - (multiplyAddValue36 * 0.5);
                                        uint sumValue20 = bitwiseValue10 + 18u;
                                        float nonlinearValue2 = sqrt((((fragmentVectorConstants1.packedValues[sumValue20].x * fragmentVectorConstants1.packedValues[sumValue20].x) + (fragmentVectorConstants1.packedValues[sumValue20].y * fragmentVectorConstants1.packedValues[sumValue20].y)) + (fragmentVectorConstants1.packedValues[sumValue20].z * fragmentVectorConstants1.packedValues[sumValue20].z)) + (fragmentVectorConstants1.packedValues[sumValue20].w * fragmentVectorConstants1.packedValues[sumValue20].w)) * fragmentVectorConstants1.packedValues[159u].z;
                                        uint comparisonValue3 = (fragmentVectorConstants1.packedValues[151u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[sumValue18].w + 0.5))), int(1u)))), int(9u)));
                                        uint quotientValue16 = uint(int(comparisonValue3) / int(2u));
                                        float intermediateValue117;
                                        float intermediateValue118;
                                        if (int(comparisonValue3) > int(0u))
                                        {
                                            float sumValue85;
                                            float productValue171;
                                            float intermediateValue146;
                                            float intermediateValue147;
                                            uint intermediateValue148;
                                            float scalarValue12 = 0.0;
                                            float scalarValue13 = 0.0;
                                            uint scalarValue14 = 0u;
                                            for (;;)
                                            {
                                                intermediateValue146 = scalarValue12;
                                                intermediateValue147 = scalarValue13;
                                                intermediateValue148 = 0u;
                                                float intermediateValue192;
                                                float intermediateValue149;
                                                float intermediateValue150;
                                                float intermediateValue151;
                                                float intermediateValue152;
                                                float productValue179;
                                                float productValue180;
                                                bool comparisonValue44;
                                                float sumValue95;
                                                for (;;)
                                                {
                                                    float productValue54 = (productValue35 + ((float(int(intermediateValue148 - quotientValue16)) + 0.5) * fragmentVectorConstants1.packedValues[156u].x)) * fragmentVectorConstants1.packedValues[sumValue18].x;
                                                    float productValue55 = (productValue41 + (fragmentVectorConstants1.packedValues[156u].x * (float(int(scalarValue14 - quotientValue16)) + 0.5))) * fragmentVectorConstants1.packedValues[sumValue18].x;
                                                    vec4 sampledTextureValue1 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue54, productValue55, float(int(scalarValue11))));
                                                    intermediateValue149 = sampledTextureValue1.x;
                                                    intermediateValue150 = sampledTextureValue1.y;
                                                    intermediateValue151 = sampledTextureValue1.z;
                                                    intermediateValue152 = sampledTextureValue1.w;
                                                    productValue179 = fract((productValue54 * fragmentVectorConstants1.packedValues[156u].z) + 0.5);
                                                    productValue180 = fract((productValue55 * fragmentVectorConstants1.packedValues[156u].z) + 0.5);
                                                    float productValue56 = spvNClamp((multiplyAddValue37 - intermediateValue149) * nonlinearValue2, 0.0, 1.0);
                                                    float productValue60 = spvNClamp((multiplyAddValue37 - intermediateValue150) * nonlinearValue2, 0.0, 1.0);
                                                    float productValue61 = spvNClamp((multiplyAddValue37 - intermediateValue151) * nonlinearValue2, 0.0, 1.0);
                                                    float productValue62 = spvNClamp((multiplyAddValue37 - intermediateValue152) * nonlinearValue2, 0.0, 1.0);
                                                    float productValue64 = 1.0 - ((productValue56 * productValue56) * (3.0 - (productValue56 * 2.0)));
                                                    float productValue65 = 1.0 - ((productValue62 * productValue62) * (3.0 - (productValue62 * 2.0)));
                                                    float productValue66 = (((1.0 - ((productValue61 * productValue61) * (3.0 - (productValue61 * 2.0)))) - productValue65) * productValue179) + productValue65;
                                                    productValue171 = (productValue66 + intermediateValue147) + ((((((1.0 - ((productValue60 * productValue60) * (3.0 - (productValue60 * 2.0)))) - productValue64) * productValue179) + productValue64) - productValue66) * productValue180);
                                                    comparisonValue44 = fragmentVectorConstants1.packedValues[151u].x != 0.0;
                                                    sumValue95 = (multiplyAddValue37 - fragmentVectorConstants1.packedValues[sumValue18].y) - nonlinearValue1;
                                                    float branchMergedValue4;
                                                    if (comparisonValue44)
                                                    {
                                                        branchMergedValue4 = float(intermediateValue152 >= sumValue95);
                                                    }
                                                    else
                                                    {
                                                        float comparisonValue4 = (intermediateValue149 < sumValue95) ? 0.0 : 1.0;
                                                        float comparisonValue5 = (intermediateValue152 < sumValue95) ? 0.0 : 1.0;
                                                        float comparisonValue6 = ((((intermediateValue151 < sumValue95) ? 0.0 : 1.0) - comparisonValue5) * productValue179) + comparisonValue5;
                                                        branchMergedValue4 = (((((((intermediateValue150 < sumValue95) ? 0.0 : 1.0) - comparisonValue4) * productValue179) + comparisonValue4) - comparisonValue6) * productValue180) + comparisonValue6;
                                                    }
                                                    intermediateValue192 = branchMergedValue4;
                                                    sumValue85 = intermediateValue192 + intermediateValue146;
                                                    uint sumValue21 = intermediateValue148 + 1u;
                                                    if (sumValue21 == comparisonValue3)
                                                    {
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        intermediateValue146 = sumValue85;
                                                        intermediateValue147 = productValue171;
                                                        intermediateValue148 = sumValue21;
                                                        continue;
                                                    }
                                                }
                                                uint sumValue22 = scalarValue14 + 1u;
                                                if (sumValue22 == comparisonValue3)
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    scalarValue12 = sumValue85;
                                                    scalarValue13 = productValue171;
                                                    scalarValue14 = sumValue22;
                                                    continue;
                                                }
                                            }
                                            intermediateValue117 = sumValue85;
                                            intermediateValue118 = productValue171;
                                        }
                                        else
                                        {
                                            intermediateValue117 = 0.0;
                                            intermediateValue118 = 0.0;
                                        }
                                        float productValue67 = float(int(comparisonValue3 * comparisonValue3));
                                        branchMergedValue1 = spvNMin(scalarValue10, intermediateValue117 / productValue67);
                                        branchMergedValue7 = spvNMin(scalarValue9, intermediateValue118 / productValue67);
                                        branchMergedValue8 = sumValue31;
                                    }
                                    else
                                    {
                                        branchMergedValue1 = scalarValue10;
                                        branchMergedValue7 = scalarValue9;
                                        branchMergedValue8 = scalarValue11 + 1u;
                                    }
                                    intermediateValue59 = branchMergedValue1;
                                    intermediateValue58 = branchMergedValue7;
                                    intermediateValue60 = branchMergedValue8;
                                    if (int(intermediateValue60) < int(sumValue31))
                                    {
                                        scalarValue9 = intermediateValue58;
                                        scalarValue10 = intermediateValue59;
                                        scalarValue11 = intermediateValue60;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                branchMergedValue = intermediateValue60;
                                branchMergedValue5 = intermediateValue59;
                                branchMergedValue6 = intermediateValue58;
                            }
                            else
                            {
                                branchMergedValue = scalarValue7;
                                branchMergedValue5 = scalarValue6;
                                branchMergedValue6 = scalarValue5;
                            }
                            intermediateValue49 = branchMergedValue;
                            intermediateValue38 = branchMergedValue5;
                            intermediateValue36 = branchMergedValue6;
                            uint sumValue23 = scalarValue8 + 1u;
                            if (sumValue23 == dotProductValue2)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                            sumValue31 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[scalarValue8 + 376u])) + scalarValue7), int(8u)));
                            intermediateValue57 = int(scalarValue7) < int(sumValue31);
                            uint branchMergedValue;
                            float branchMergedValue6;
                            float branchMergedValue7;
                            if (intermediateValue57)
                            {
                                float intermediateValue74;
                                float intermediateValue75;
                                uint intermediateValue76;
                                float scalarValue9 = scalarValue5;
                                float scalarValue10 = scalarValue6;
                                uint scalarValue11 = scalarValue7;
                                uint bitwiseValue10;
                                float multiplyAddValue35;
                                float multiplyAddValue36;
                                float multiplyAddValue37;
                                bool comparisonValue17;
                                for (;;)
                                {
                                    bitwiseValue10 = scalarValue11 << 2u;
                                    uint sumValue13 = bitwiseValue10 + 95u;
                                    uint sumValue17 = bitwiseValue10 + 96u;
                                    uint sumValue300 = bitwiseValue10 + 97u;
                                    uint sumValue301 = bitwiseValue10 + 98u;
                                    multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[sumValue300].x, comparisonValue261, fma(fragmentVectorConstants1.packedValues[sumValue17].x, comparisonValue260, fragmentVectorConstants1.packedValues[sumValue13].x * comparisonValue259)) + fragmentVectorConstants1.packedValues[sumValue301].x;
                                    multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[sumValue300].y, comparisonValue261, fma(fragmentVectorConstants1.packedValues[sumValue17].y, comparisonValue260, fragmentVectorConstants1.packedValues[sumValue13].y * comparisonValue259)) + fragmentVectorConstants1.packedValues[sumValue301].y;
                                    multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[sumValue300].z, comparisonValue261, fma(fragmentVectorConstants1.packedValues[sumValue17].z, comparisonValue260, fragmentVectorConstants1.packedValues[sumValue13].z * comparisonValue259)) + fragmentVectorConstants1.packedValues[sumValue301].z;
                                    comparisonValue17 = ((abs(multiplyAddValue35) <= 1.0) && (abs(multiplyAddValue36) <= 1.0)) && (abs(multiplyAddValue37) <= 1.0);
                                    uint branchMergedValue1;
                                    float branchMergedValue8;
                                    float branchMergedValue9;
                                    if (comparisonValue17)
                                    {
                                        uint sumValue18 = scalarValue11 + 48u;
                                        float sumValue302 = spvNMin(spvNMax(dotProductValue22, fragmentScalarConstants1.packedValues[scalarValue11 + 316u]), 1.0);
                                        float nonlinearValue14 = (sqrt(1.0 - (sumValue302 * sumValue302)) / sumValue302) * fragmentVectorConstants1.packedValues[sumValue18].z;
                                        float productValue35 = (multiplyAddValue35 * 0.5) + 0.5;
                                        float productValue41 = 0.5 - (multiplyAddValue36 * 0.5);
                                        uint sumValue20 = bitwiseValue10 + 18u;
                                        float nonlinearValue15 = sqrt((((fragmentVectorConstants1.packedValues[sumValue20].x * fragmentVectorConstants1.packedValues[sumValue20].x) + (fragmentVectorConstants1.packedValues[sumValue20].y * fragmentVectorConstants1.packedValues[sumValue20].y)) + (fragmentVectorConstants1.packedValues[sumValue20].z * fragmentVectorConstants1.packedValues[sumValue20].z)) + (fragmentVectorConstants1.packedValues[sumValue20].w * fragmentVectorConstants1.packedValues[sumValue20].w)) * fragmentVectorConstants1.packedValues[176u].z;
                                        uint comparisonValue262 = (fragmentVectorConstants1.packedValues[166u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[sumValue18].w + 0.5))), int(1u)))), int(9u)));
                                        uint quotientValue81 = uint(int(comparisonValue262) / int(2u));
                                        float intermediateValue142;
                                        float intermediateValue143;
                                        if (int(comparisonValue262) > int(0u))
                                        {
                                            float sumValue100;
                                            float productValue204;
                                            float intermediateValue179;
                                            float intermediateValue180;
                                            uint intermediateValue181;
                                            float scalarValue12 = 0.0;
                                            float scalarValue13 = 0.0;
                                            uint scalarValue14 = 0u;
                                            for (;;)
                                            {
                                                intermediateValue179 = scalarValue12;
                                                intermediateValue180 = scalarValue13;
                                                intermediateValue181 = 0u;
                                                float intermediateValue234;
                                                float intermediateValue182;
                                                float intermediateValue183;
                                                float intermediateValue184;
                                                float intermediateValue185;
                                                float productValue218;
                                                float productValue219;
                                                bool comparisonValue47;
                                                float sumValue110;
                                                for (;;)
                                                {
                                                    float productValue459 = (productValue35 + ((float(int(intermediateValue181 - quotientValue81)) + 0.5) * fragmentVectorConstants1.packedValues[173u].x)) * fragmentVectorConstants1.packedValues[sumValue18].x;
                                                    float productValue460 = (productValue41 + (fragmentVectorConstants1.packedValues[173u].x * (float(int(scalarValue14 - quotientValue81)) + 0.5))) * fragmentVectorConstants1.packedValues[sumValue18].x;
                                                    vec4 sampledTextureValue80 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue459, productValue460, float(int(scalarValue11))));
                                                    intermediateValue182 = sampledTextureValue80.x;
                                                    intermediateValue183 = sampledTextureValue80.y;
                                                    intermediateValue184 = sampledTextureValue80.z;
                                                    intermediateValue185 = sampledTextureValue80.w;
                                                    productValue218 = fract((productValue459 * fragmentVectorConstants1.packedValues[173u].z) + 0.5);
                                                    productValue219 = fract((productValue460 * fragmentVectorConstants1.packedValues[173u].z) + 0.5);
                                                    float productValue461 = spvNClamp((multiplyAddValue37 - intermediateValue182) * nonlinearValue15, 0.0, 1.0);
                                                    float productValue462 = spvNClamp((multiplyAddValue37 - intermediateValue183) * nonlinearValue15, 0.0, 1.0);
                                                    float productValue463 = spvNClamp((multiplyAddValue37 - intermediateValue184) * nonlinearValue15, 0.0, 1.0);
                                                    float productValue464 = spvNClamp((multiplyAddValue37 - intermediateValue185) * nonlinearValue15, 0.0, 1.0);
                                                    float productValue465 = 1.0 - ((productValue461 * productValue461) * (3.0 - (productValue461 * 2.0)));
                                                    float productValue466 = 1.0 - ((productValue464 * productValue464) * (3.0 - (productValue464 * 2.0)));
                                                    float productValue467 = (((1.0 - ((productValue463 * productValue463) * (3.0 - (productValue463 * 2.0)))) - productValue466) * productValue218) + productValue466;
                                                    productValue204 = (productValue467 + intermediateValue180) + ((((((1.0 - ((productValue462 * productValue462) * (3.0 - (productValue462 * 2.0)))) - productValue465) * productValue218) + productValue465) - productValue467) * productValue219);
                                                    comparisonValue47 = fragmentVectorConstants1.packedValues[166u].x != 0.0;
                                                    sumValue110 = (multiplyAddValue37 - fragmentVectorConstants1.packedValues[sumValue18].y) - nonlinearValue14;
                                                    float branchMergedValue5;
                                                    if (comparisonValue47)
                                                    {
                                                        branchMergedValue5 = float(intermediateValue185 >= sumValue110);
                                                    }
                                                    else
                                                    {
                                                        float comparisonValue263 = (intermediateValue182 < sumValue110) ? 0.0 : 1.0;
                                                        float comparisonValue264 = (intermediateValue185 < sumValue110) ? 0.0 : 1.0;
                                                        float comparisonValue265 = ((((intermediateValue184 < sumValue110) ? 0.0 : 1.0) - comparisonValue264) * productValue218) + comparisonValue264;
                                                        branchMergedValue5 = (((((((intermediateValue183 < sumValue110) ? 0.0 : 1.0) - comparisonValue263) * productValue218) + comparisonValue263) - comparisonValue265) * productValue219) + comparisonValue265;
                                                    }
                                                    intermediateValue234 = branchMergedValue5;
                                                    sumValue100 = intermediateValue234 + intermediateValue179;
                                                    uint sumValue303 = intermediateValue181 + 1u;
                                                    if (sumValue303 == comparisonValue262)
                                                    {
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        intermediateValue179 = sumValue100;
                                                        intermediateValue180 = productValue204;
                                                        intermediateValue181 = sumValue303;
                                                        continue;
                                                    }
                                                }
                                                uint sumValue22 = scalarValue14 + 1u;
                                                if (sumValue22 == comparisonValue262)
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    scalarValue12 = sumValue100;
                                                    scalarValue13 = productValue204;
                                                    scalarValue14 = sumValue22;
                                                    continue;
                                                }
                                            }
                                            intermediateValue142 = sumValue100;
                                            intermediateValue143 = productValue204;
                                        }
                                        else
                                        {
                                            intermediateValue142 = 0.0;
                                            intermediateValue143 = 0.0;
                                        }
                                        float productValue468 = float(int(comparisonValue262 * comparisonValue262));
                                        branchMergedValue1 = sumValue31;
                                        branchMergedValue8 = spvNMin(scalarValue10, intermediateValue142 / productValue468);
                                        branchMergedValue9 = spvNMin(scalarValue9, intermediateValue143 / productValue468);
                                    }
                                    else
                                    {
                                        branchMergedValue1 = scalarValue11 + 1u;
                                        branchMergedValue8 = scalarValue10;
                                        branchMergedValue9 = scalarValue9;
                                    }
                                    intermediateValue76 = branchMergedValue1;
                                    intermediateValue75 = branchMergedValue8;
                                    intermediateValue74 = branchMergedValue9;
                                    if (int(intermediateValue76) < int(sumValue31))
                                    {
                                        scalarValue9 = intermediateValue74;
                                        scalarValue10 = intermediateValue75;
                                        scalarValue11 = intermediateValue76;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                branchMergedValue = intermediateValue76;
                                branchMergedValue6 = intermediateValue75;
                                branchMergedValue7 = intermediateValue74;
                            }
                            else
                            {
                                branchMergedValue = scalarValue7;
                                branchMergedValue6 = scalarValue6;
                                branchMergedValue7 = scalarValue5;
                            }
                            intermediateValue55 = branchMergedValue;
                            intermediateValue37 = branchMergedValue6;
                            intermediateValue35 = branchMergedValue7;
                            uint sumValue23 = scalarValue8 + 1u;
                            if (sumValue23 == dotProductValue23)
#endif
                            {
                                break;
                            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                            uint bitwiseValue36 = intermediateValue104 << 2u;
                            uint sumValue141 = bitwiseValue36 + 94u;
                            uint sumValue142 = bitwiseValue36 + 93u;
                            uint sumValue143 = bitwiseValue36 + 95u;
                            uint sumValue144 = bitwiseValue36 + 96u;
                            float multiplyAddValue111 = fma(fragmentVectorConstants1.packedValues[sumValue143].x, multiplyAddValue110, fma(fragmentVectorConstants1.packedValues[sumValue142].x, multiplyAddValue108, multiplyAddValue109 * fragmentVectorConstants1.packedValues[sumValue141].x)) + fragmentVectorConstants1.packedValues[sumValue144].x;
                            float multiplyAddValue112 = fma(fragmentVectorConstants1.packedValues[sumValue143].y, multiplyAddValue110, fma(fragmentVectorConstants1.packedValues[sumValue142].y, multiplyAddValue108, multiplyAddValue109 * fragmentVectorConstants1.packedValues[sumValue141].y)) + fragmentVectorConstants1.packedValues[sumValue144].y;
                            float multiplyAddValue113 = fma(fragmentVectorConstants1.packedValues[sumValue143].z, multiplyAddValue110, fma(fragmentVectorConstants1.packedValues[sumValue142].z, multiplyAddValue108, multiplyAddValue109 * fragmentVectorConstants1.packedValues[sumValue141].z)) + fragmentVectorConstants1.packedValues[sumValue144].z;
                            if (((abs(multiplyAddValue111) <= 1.0) && (abs(multiplyAddValue112) <= 1.0)) && (abs(multiplyAddValue113) <= 1.0))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                            uint bitwiseValue120 = intermediateValue108 << 2u;
                            uint sumValue214 = bitwiseValue120 + 96u;
                            uint sumValue215 = bitwiseValue120 + 95u;
                            uint sumValue216 = bitwiseValue120 + 97u;
                            uint sumValue217 = bitwiseValue120 + 98u;
                            float multiplyAddValue279 = fma(fragmentVectorConstants1.packedValues[sumValue216].x, multiplyAddValue278, fma(fragmentVectorConstants1.packedValues[sumValue215].x, multiplyAddValue276, multiplyAddValue277 * fragmentVectorConstants1.packedValues[sumValue214].x)) + fragmentVectorConstants1.packedValues[sumValue217].x;
                            float multiplyAddValue280 = fma(fragmentVectorConstants1.packedValues[sumValue216].y, multiplyAddValue278, fma(fragmentVectorConstants1.packedValues[sumValue215].y, multiplyAddValue276, multiplyAddValue277 * fragmentVectorConstants1.packedValues[sumValue214].y)) + fragmentVectorConstants1.packedValues[sumValue217].y;
                            float multiplyAddValue281 = fma(fragmentVectorConstants1.packedValues[sumValue216].z, multiplyAddValue278, fma(fragmentVectorConstants1.packedValues[sumValue215].z, multiplyAddValue276, multiplyAddValue277 * fragmentVectorConstants1.packedValues[sumValue214].z)) + fragmentVectorConstants1.packedValues[sumValue217].z;
                            if (((abs(multiplyAddValue279) <= 1.0) && (abs(multiplyAddValue280) <= 1.0)) && (abs(multiplyAddValue281) <= 1.0))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            else
#endif
                            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                                uint scalarValue97 = min(intermediateValue104, 68u);
                                uint scalarValue98 = intermediateValue18[scalarValue97].x;
                                uint scalarValue99 = intermediateValue18[scalarValue97].y;
                                uint scalarValue100 = intermediateValue18[scalarValue97].z;
                                uint scalarValue101 = intermediateValue18[scalarValue97].w;
                                float reinterpretedBits1 = rdDot4Precise2(fragmentVectorConstants1.packedValues[78u], vec4(uintBitsToFloat(scalarValue98), uintBitsToFloat(scalarValue99), uintBitsToFloat(scalarValue100), uintBitsToFloat(scalarValue101)));
                                float scalarValue102 = spvNMin(spvNMax(scalarValue89, reinterpretedBits1), 1.0);
                                float multiplyAddValue114 = fma(multiplyAddValue111, 0.5, 0.5);
                                uint sumValue145 = bitwiseValue36 + 18u;
                                float scalarValue103 = rdDot4Precise2(fragmentVectorConstants1.packedValues[sumValue145], fragmentVectorConstants1.packedValues[sumValue145]);
                                float nonlinearValue6 = sqrt(scalarValue103) * fragmentScalarConstants1.packedValues[638u];
                                uint clampedValue = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[(((16u * intermediateValue104) + 768u) + 12u) >> 2u] + 0.5))), int(1u), int(9u)));
                                bool conditionValue3 = !comparisonValue114;
                                uint comparisonValue115 = (comparisonValue114 ? 1u : clampedValue) >> 1u;
                                float multiplyAddValue115 = 1.0 - fma(multiplyAddValue112, 0.5, 0.5);
                                float scalarValue104 = rdSignedBitsToFloat2(intermediateValue104);
                                float multiplyAddValue119 = multiplyAddValue113 - fma(fragmentScalarConstants1.packedValues[(((16u * intermediateValue104) + 768u) + 8u) >> 2u], sqrt(fma(-scalarValue102, scalarValue102, 1.0)) / scalarValue102, fragmentScalarConstants1.packedValues[(((16u * intermediateValue104) + 768u) + 4u) >> 2u]);
                                float intermediateValue225;
                                float intermediateValue227;
                                intermediateValue225 = 0.0;
                                intermediateValue227 = 0.0;
                                uint sumValue72;
                                float intermediateValue226;
                                float intermediateValue228;
                                uint scalarValue14 = 0u;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                                uint scalarValue219 = min(intermediateValue108, 68u);
                                uint scalarValue220 = intermediateValue23[scalarValue219].x;
                                uint scalarValue221 = intermediateValue23[scalarValue219].y;
                                uint scalarValue222 = intermediateValue23[scalarValue219].z;
                                uint scalarValue223 = intermediateValue23[scalarValue219].w;
                                float reinterpretedBits3 = rdDot4Precise2(fragmentVectorConstants1.packedValues[79u], vec4(uintBitsToFloat(scalarValue220), uintBitsToFloat(scalarValue221), uintBitsToFloat(scalarValue222), uintBitsToFloat(scalarValue223)));
                                float scalarValue224 = spvNMin(spvNMax(scalarValue212, reinterpretedBits3), 1.0);
                                float multiplyAddValue282 = fma(multiplyAddValue279, 0.5, 0.5);
                                uint sumValue218 = bitwiseValue120 + 18u;
                                float scalarValue225 = rdDot4Precise2(fragmentVectorConstants1.packedValues[sumValue218], fragmentVectorConstants1.packedValues[sumValue218]);
                                float nonlinearValue9 = sqrt(scalarValue225) * fragmentScalarConstants1.packedValues[706u];
                                uint clampedValue2 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[(((16u * intermediateValue108) + 768u) + 12u) >> 2u] + 0.5))), int(1u), int(9u)));
                                bool conditionValue20 = !comparisonValue182;
                                uint comparisonValue183 = (comparisonValue182 ? 1u : clampedValue2) >> 1u;
                                float multiplyAddValue283 = 1.0 - fma(multiplyAddValue280, 0.5, 0.5);
                                float scalarValue226 = rdSignedBitsToFloat2(intermediateValue108);
                                float multiplyAddValue284 = multiplyAddValue281 - fma(fragmentScalarConstants1.packedValues[(((16u * intermediateValue108) + 768u) + 8u) >> 2u], sqrt(fma(-scalarValue224, scalarValue224, 1.0)) / scalarValue224, fragmentScalarConstants1.packedValues[(((16u * intermediateValue108) + 768u) + 4u) >> 2u]);
                                float intermediateValue255;
                                float intermediateValue257;
                                intermediateValue255 = 0.0;
                                intermediateValue257 = 0.0;
                                uint sumValue70;
                                float intermediateValue256;
                                float intermediateValue258;
                                uint scalarValue14 = 0u;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                                scalarValue5 = intermediateValue36;
                                scalarValue6 = intermediateValue38;
                                scalarValue7 = intermediateValue49;
                                scalarValue8 = sumValue23;
                                continue;
                            }
                        }
                        intermediateValue26 = intermediateValue36;
                        intermediateValue37 = intermediateValue38;
                    }
                    else
                    {
                        intermediateValue26 = 1.0;
                        intermediateValue37 = 1.0;
                    }
                    float intermediateValue53;
                    if (int(uint(int(fragmentVectorConstants1.packedValues[56u].x))) > int(0u))
                    {
                        float scalarValue15 = spvNMin(spvNMax(dotProductValue1, fragmentVectorConstants1.packedValues[78u].x), 1.0);
                        float multiplyAddValue21 = spvNMin(((fragmentVectorConstants1.packedValues[143u].z - fragmentVectorConstants1.packedValues[48u].y) + fma(fragmentVectorConstants1.packedValues[142u].z, comparisonValue2, fma(fragmentVectorConstants1.packedValues[141u].z, comparisonValue1, fragmentVectorConstants1.packedValues[140u].z * comparisonValue))) - ((sqrt(1.0 - (scalarValue15 * scalarValue15)) / scalarValue15) * fragmentVectorConstants1.packedValues[48u].z), 1.0);
                        float multiplyAddValue22 = (((fma(fragmentVectorConstants1.packedValues[142u].x, comparisonValue2, fma(fragmentVectorConstants1.packedValues[141u].x, comparisonValue1, fragmentVectorConstants1.packedValues[140u].x * comparisonValue)) + fragmentVectorConstants1.packedValues[143u].x) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[56u].y;
                        float multiplyAddValue23 = (0.5 - ((fma(fragmentVectorConstants1.packedValues[142u].y, comparisonValue2, fma(fragmentVectorConstants1.packedValues[141u].y, comparisonValue1, fragmentVectorConstants1.packedValues[140u].y * comparisonValue)) + fragmentVectorConstants1.packedValues[143u].y) * 0.5)) * fragmentVectorConstants1.packedValues[56u].y;
                        uint comparisonValue7 = (fragmentVectorConstants1.packedValues[151u].x != 0.0) ? 1u : 2u;
                        uint bitwiseValue = comparisonValue7 >> 1u;
                        float branchMergedValue11;
                        if ((multiplyAddValue23 < fragmentVectorConstants1.packedValues[56u].y) && (((multiplyAddValue22 >= 0.0) && (multiplyAddValue22 < fragmentVectorConstants1.packedValues[56u].y)) && (multiplyAddValue23 >= 0.0)))
                        {
                            float dotProductValue3 = dot(vec4(fragmentVectorConstants1.packedValues[92u]), vec4(1.0)) + 1.0;
                            float sumValue63;
                            float intermediateValue100;
                            uint intermediateValue101;
                            float scalarValue16 = 0.0;
                            uint scalarValue17 = 0u;
                            for (;;)
                            {
                                intermediateValue100 = scalarValue16;
                                intermediateValue101 = 0u;
                                float intermediateValue139;
                                float productValue167;
                                float productValue168;
                                bool comparisonValue30;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                                scalarValue5 = intermediateValue35;
                                scalarValue6 = intermediateValue37;
                                scalarValue7 = intermediateValue55;
                                scalarValue8 = sumValue23;
                                continue;
                            }
                        }
                        intermediateValue24 = intermediateValue35;
                        intermediateValue36 = intermediateValue37;
                    }
                    else
                    {
                        intermediateValue24 = 1.0;
                        intermediateValue36 = 1.0;
                    }
                    float intermediateValue59;
                    if (int(uint(int(fragmentVectorConstants1.packedValues[56u].x))) > int(0u))
                    {
                        float scalarValue347 = spvNMin(spvNMax(dotProductValue22, fragmentVectorConstants1.packedValues[79u].x), 1.0);
                        float multiplyAddValue431 = spvNMin(((fragmentVectorConstants1.packedValues[146u].z - fragmentVectorConstants1.packedValues[48u].y) + fma(fragmentVectorConstants1.packedValues[145u].z, comparisonValue261, fma(fragmentVectorConstants1.packedValues[144u].z, comparisonValue260, fragmentVectorConstants1.packedValues[143u].z * comparisonValue259))) - ((sqrt(1.0 - (scalarValue347 * scalarValue347)) / scalarValue347) * fragmentVectorConstants1.packedValues[48u].z), 1.0);
                        float multiplyAddValue432 = (((fma(fragmentVectorConstants1.packedValues[145u].x, comparisonValue261, fma(fragmentVectorConstants1.packedValues[144u].x, comparisonValue260, fragmentVectorConstants1.packedValues[143u].x * comparisonValue259)) + fragmentVectorConstants1.packedValues[146u].x) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[56u].y;
                        float multiplyAddValue433 = (0.5 - ((fma(fragmentVectorConstants1.packedValues[145u].y, comparisonValue261, fma(fragmentVectorConstants1.packedValues[144u].y, comparisonValue260, fragmentVectorConstants1.packedValues[143u].y * comparisonValue259)) + fragmentVectorConstants1.packedValues[146u].y) * 0.5)) * fragmentVectorConstants1.packedValues[56u].y;
                        uint comparisonValue266 = (fragmentVectorConstants1.packedValues[166u].x != 0.0) ? 1u : 2u;
                        uint bitwiseValue206 = comparisonValue266 >> 1u;
                        float branchMergedValue17;
                        if ((multiplyAddValue433 < fragmentVectorConstants1.packedValues[56u].y) && (((multiplyAddValue432 >= 0.0) && (multiplyAddValue432 < fragmentVectorConstants1.packedValues[56u].y)) && (multiplyAddValue433 >= 0.0)))
                        {
                            float dotProductValue24 = dot(vec4(fragmentVectorConstants1.packedValues[94u]), vec4(1.0)) + 1.0;
                            float sumValue43;
                            float intermediateValue129;
                            uint intermediateValue130;
                            float scalarValue16 = 0.0;
                            uint scalarValue17 = 0u;
                            for (;;)
                            {
                                intermediateValue129 = scalarValue16;
                                intermediateValue130 = 0u;
                                float intermediateValue157;
                                float productValue200;
                                float productValue201;
                                bool comparisonValue27;
#endif
                                for (;;)
                                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                                    if ((comparisonValue114 && (int(scalarValue14) >= int(1u))) || ((int(clampedValue) <= int(scalarValue14)) && conditionValue3))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                                    if ((comparisonValue182 && (int(scalarValue14) >= int(1u))) || ((int(clampedValue2) <= int(scalarValue14)) && conditionValue20))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                                    float productValue68 = fragmentVectorConstants1.packedValues[56u].y * fragmentVectorConstants1.packedValues[56u].z;
                                    productValue167 = (productValue68 * (float(int(intermediateValue101 - bitwiseValue)) + 0.5)) + multiplyAddValue22;
                                    productValue168 = (productValue68 * (float(int(scalarValue17 - bitwiseValue)) + 0.5)) + multiplyAddValue23;
                                    comparisonValue30 = fragmentVectorConstants1.packedValues[151u].x != 0.0;
                                    float branchMergedValue2;
                                    if (comparisonValue30)
                                    {
                                        branchMergedValue2 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue167, productValue168, dotProductValue3), 0.0).x >= multiplyAddValue21);
                                    }
                                    else
                                    {
                                        vec4 sampledTextureValue4 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue167, productValue168, dotProductValue3));
                                        float productValue73 = fract((fragmentVectorConstants1.packedValues[156u].z * productValue167) + 0.5);
                                        float comparisonValue10 = (sampledTextureValue4.x < multiplyAddValue21) ? 0.0 : 1.0;
                                        float comparisonValue11 = (sampledTextureValue4.w < multiplyAddValue21) ? 0.0 : 1.0;
                                        float comparisonValue12 = ((((sampledTextureValue4.z < multiplyAddValue21) ? 0.0 : 1.0) - comparisonValue11) * productValue73) + comparisonValue11;
                                        branchMergedValue2 = (((((((sampledTextureValue4.y < multiplyAddValue21) ? 0.0 : 1.0) - comparisonValue10) * productValue73) + comparisonValue10) - comparisonValue12) * fract((fragmentVectorConstants1.packedValues[156u].z * productValue168) + 0.5)) + comparisonValue12;
                                    }
                                    intermediateValue139 = branchMergedValue2;
                                    sumValue63 = intermediateValue139 + intermediateValue100;
                                    uint sumValue24 = intermediateValue101 + 1u;
                                    if (int(sumValue24) < int(comparisonValue7))
                                    {
                                        intermediateValue100 = sumValue63;
                                        intermediateValue101 = sumValue24;
                                        continue;
                                    }
                                    else
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                                    float productValue68 = fragmentVectorConstants1.packedValues[56u].y * fragmentVectorConstants1.packedValues[56u].z;
                                    productValue200 = (productValue68 * (float(int(intermediateValue130 - bitwiseValue206)) + 0.5)) + multiplyAddValue432;
                                    productValue201 = (productValue68 * (float(int(scalarValue17 - bitwiseValue206)) + 0.5)) + multiplyAddValue433;
                                    comparisonValue27 = fragmentVectorConstants1.packedValues[166u].x != 0.0;
                                    float branchMergedValue2;
                                    if (comparisonValue27)
                                    {
                                        branchMergedValue2 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue200, productValue201, dotProductValue24), 0.0).x >= multiplyAddValue431);
                                    }
                                    else
                                    {
                                        vec4 sampledTextureValue81 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue200, productValue201, dotProductValue24));
                                        float productValue469 = fract((fragmentVectorConstants1.packedValues[173u].z * productValue200) + 0.5);
                                        float comparisonValue267 = (sampledTextureValue81.x < multiplyAddValue431) ? 0.0 : 1.0;
                                        float comparisonValue268 = (sampledTextureValue81.w < multiplyAddValue431) ? 0.0 : 1.0;
                                        float comparisonValue269 = ((((sampledTextureValue81.z < multiplyAddValue431) ? 0.0 : 1.0) - comparisonValue268) * productValue469) + comparisonValue268;
                                        branchMergedValue2 = (((((((sampledTextureValue81.y < multiplyAddValue431) ? 0.0 : 1.0) - comparisonValue267) * productValue469) + comparisonValue267) - comparisonValue269) * fract((fragmentVectorConstants1.packedValues[173u].z * productValue201) + 0.5)) + comparisonValue269;
                                    }
                                    intermediateValue157 = branchMergedValue2;
                                    sumValue43 = intermediateValue157 + intermediateValue129;
                                    uint sumValue304 = intermediateValue130 + 1u;
                                    if (int(sumValue304) < int(comparisonValue266))
                                    {
                                        intermediateValue129 = sumValue43;
                                        intermediateValue130 = sumValue304;
                                        continue;
                                    }
                                    else
#endif
                                    {
                                        break;
                                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                                    float sumValue146 = rdSignedBitsToFloat2(scalarValue14 - comparisonValue115);
                                    float sumValue147 = sumValue146 + 0.5;
                                    intermediateValue226 = intermediateValue225;
                                    intermediateValue228 = intermediateValue227;
                                    float multiplyAddValue174;
                                    float multiplyAddValue175;
                                    uint sumValue81;
                                    uint scalarValue17 = 0u;
                                    for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                                    float sumValue219 = rdSignedBitsToFloat2(scalarValue14 - comparisonValue183);
                                    float sumValue220 = sumValue219 + 0.5;
                                    intermediateValue256 = intermediateValue255;
                                    intermediateValue258 = intermediateValue257;
                                    float multiplyAddValue217;
                                    float multiplyAddValue218;
                                    uint sumValue100;
                                    uint scalarValue17 = 0u;
                                    for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                                }
                                uint sumValue25 = scalarValue17 + 1u;
                                if (int(sumValue25) < int(comparisonValue7))
                                {
                                    scalarValue16 = sumValue63;
                                    scalarValue17 = sumValue25;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            branchMergedValue11 = sumValue63 / float(int(comparisonValue7 * comparisonValue7));
                        }
                        else
                        {
                            branchMergedValue11 = 1.0;
                        }
                        intermediateValue53 = branchMergedValue11;
                    }
                    else
                    {
                        intermediateValue53 = 1.0;
                    }
                    float intermediateValue62;
                    if ((int(uint(int(fragmentVectorConstants1.packedValues[77u].y))) > int(0u)) && (int(uint(int(fragmentVectorConstants1.packedValues[135u].x))) > int(0u)))
                    {
                        float multiplyAddValue24 = fma(fragmentVectorConstants1.packedValues[133u].w, comparisonValue2, fma(fragmentVectorConstants1.packedValues[132u].w, comparisonValue1, fragmentVectorConstants1.packedValues[131u].w * comparisonValue)) + fragmentVectorConstants1.packedValues[134u].w;
                        float scalarValue18 = spvNMin(spvNMax(dotProductValue1, fragmentVectorConstants1.packedValues[78u].x), 1.0);
                        float multiplyAddValue25 = (((fma(fragmentVectorConstants1.packedValues[133u].z, comparisonValue2, fma(fragmentVectorConstants1.packedValues[132u].z, comparisonValue1, fragmentVectorConstants1.packedValues[131u].z * comparisonValue)) + fragmentVectorConstants1.packedValues[134u].z) / multiplyAddValue24) - fragmentVectorConstants1.packedValues[48u].y) - ((sqrt(1.0 - (scalarValue18 * scalarValue18)) / scalarValue18) * fragmentVectorConstants1.packedValues[48u].z);
                        float multiplyAddValue26 = (((fma(fragmentVectorConstants1.packedValues[133u].x, comparisonValue2, fma(fragmentVectorConstants1.packedValues[132u].x, comparisonValue1, fragmentVectorConstants1.packedValues[131u].x * comparisonValue)) + fragmentVectorConstants1.packedValues[134u].x) / multiplyAddValue24) * 0.5) + 0.5;
                        float multiplyAddValue27 = 0.5 - (((fma(fragmentVectorConstants1.packedValues[133u].y, comparisonValue2, fma(fragmentVectorConstants1.packedValues[132u].y, comparisonValue1, fragmentVectorConstants1.packedValues[131u].y * comparisonValue)) + fragmentVectorConstants1.packedValues[134u].y) / multiplyAddValue24) * 0.5);
                        uint comparisonValue13 = (fragmentVectorConstants1.packedValues[151u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[146u].z + 0.5))), int(1u)))), int(9u)));
                        uint quotientValue19 = uint(int(comparisonValue13) / int(2u));
                        float dotProductValue4 = dot(vec4(fragmentVectorConstants1.packedValues[92u]), vec4(1.0));
                        float intermediateValue93;
                        if (int(comparisonValue13) > int(0u))
                        {
                            float sumValue65;
                            float intermediateValue119;
                            uint intermediateValue120;
                            float scalarValue19 = 0.0;
                            uint scalarValue20 = 0u;
                            for (;;)
                            {
                                intermediateValue119 = scalarValue19;
                                intermediateValue120 = 0u;
                                float intermediateValue153;
                                vec4 intermediateValue121;
                                float productValue174;
                                float productValue175;
                                bool comparisonValue34;
                                for (;;)
                                {
                                    intermediateValue121 = fragmentVectorConstants1.packedValues[156u];
                                    productValue174 = (multiplyAddValue26 + ((float(int(intermediateValue120 - quotientValue19)) + 0.5) * intermediateValue121.x)) * fragmentVectorConstants1.packedValues[48u].x;
                                    productValue175 = (multiplyAddValue27 + (intermediateValue121.x * (float(int(scalarValue20 - quotientValue19)) + 0.5))) * fragmentVectorConstants1.packedValues[48u].x;
                                    comparisonValue34 = fragmentVectorConstants1.packedValues[151u].x != 0.0;
                                    float branchMergedValue3;
                                    if (comparisonValue34)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                                }
                                uint sumValue25 = scalarValue17 + 1u;
                                if (int(sumValue25) < int(comparisonValue266))
                                {
                                    scalarValue16 = sumValue43;
                                    scalarValue17 = sumValue25;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            branchMergedValue17 = sumValue43 / float(int(comparisonValue266 * comparisonValue266));
                        }
                        else
                        {
                            branchMergedValue17 = 1.0;
                        }
                        intermediateValue59 = branchMergedValue17;
                    }
                    else
                    {
                        intermediateValue59 = 1.0;
                    }
                    float intermediateValue78;
                    if ((int(uint(int(fragmentVectorConstants1.packedValues[78u].y))) > int(0u)) && (int(uint(int(fragmentVectorConstants1.packedValues[137u].x))) > int(0u)))
                    {
                        float multiplyAddValue434 = fma(fragmentVectorConstants1.packedValues[135u].w, comparisonValue261, fma(fragmentVectorConstants1.packedValues[134u].w, comparisonValue260, fragmentVectorConstants1.packedValues[133u].w * comparisonValue259)) + fragmentVectorConstants1.packedValues[136u].w;
                        float scalarValue348 = spvNMin(spvNMax(dotProductValue22, fragmentVectorConstants1.packedValues[79u].x), 1.0);
                        float multiplyAddValue435 = (((fma(fragmentVectorConstants1.packedValues[135u].z, comparisonValue261, fma(fragmentVectorConstants1.packedValues[134u].z, comparisonValue260, fragmentVectorConstants1.packedValues[133u].z * comparisonValue259)) + fragmentVectorConstants1.packedValues[136u].z) / multiplyAddValue434) - fragmentVectorConstants1.packedValues[48u].y) - ((sqrt(1.0 - (scalarValue348 * scalarValue348)) / scalarValue348) * fragmentVectorConstants1.packedValues[48u].z);
                        float multiplyAddValue436 = (((fma(fragmentVectorConstants1.packedValues[135u].x, comparisonValue261, fma(fragmentVectorConstants1.packedValues[134u].x, comparisonValue260, fragmentVectorConstants1.packedValues[133u].x * comparisonValue259)) + fragmentVectorConstants1.packedValues[136u].x) / multiplyAddValue434) * 0.5) + 0.5;
                        float multiplyAddValue437 = 0.5 - (((fma(fragmentVectorConstants1.packedValues[135u].y, comparisonValue261, fma(fragmentVectorConstants1.packedValues[134u].y, comparisonValue260, fragmentVectorConstants1.packedValues[133u].y * comparisonValue259)) + fragmentVectorConstants1.packedValues[136u].y) / multiplyAddValue434) * 0.5);
                        uint comparisonValue270 = (fragmentVectorConstants1.packedValues[166u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[149u].z + 0.5))), int(1u)))), int(9u)));
                        uint quotientValue82 = uint(int(comparisonValue270) / int(2u));
                        float dotProductValue25 = dot(vec4(fragmentVectorConstants1.packedValues[94u]), vec4(1.0));
                        float intermediateValue106;
                        if (int(comparisonValue270) > int(0u))
                        {
                            float sumValue45;
                            float intermediateValue144;
                            uint intermediateValue145;
                            float scalarValue19 = 0.0;
                            uint scalarValue20 = 0u;
                            for (;;)
                            {
                                intermediateValue144 = scalarValue19;
                                intermediateValue145 = 0u;
                                float intermediateValue186;
                                vec4 intermediateValue146;
                                float productValue207;
                                float productValue208;
                                bool comparisonValue37;
                                for (;;)
                                {
                                    intermediateValue146 = fragmentVectorConstants1.packedValues[173u];
                                    productValue207 = (multiplyAddValue436 + ((float(int(intermediateValue145 - quotientValue82)) + 0.5) * intermediateValue146.x)) * fragmentVectorConstants1.packedValues[48u].x;
                                    productValue208 = (multiplyAddValue437 + (intermediateValue146.x * (float(int(scalarValue20 - quotientValue82)) + 0.5))) * fragmentVectorConstants1.packedValues[48u].x;
                                    comparisonValue37 = fragmentVectorConstants1.packedValues[166u].x != 0.0;
                                    float branchMergedValue4;
                                    if (comparisonValue37)
#endif
                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                                        if ((comparisonValue114 && (int(scalarValue17) >= int(1u))) || (conditionValue3 && (int(clampedValue) <= int(scalarValue17))))
                                        {
                                            break;
                                        }
                                        float sumValue148 = rdSignedBitsToFloat2(scalarValue17 - comparisonValue115);
                                        uint bitwiseValue37 = (((16u * intermediateValue104) + 768u) + 0u) >> 2u;
                                        float multiplyAddValue120 = fma(multiplyAddValue114, fragmentScalarConstants1.packedValues[bitwiseValue37], ((sumValue148 + 0.5) * fragmentScalarConstants1.packedValues[624u]) * fragmentScalarConstants1.packedValues[bitwiseValue37]);
                                        float multiplyAddValue121 = fma(multiplyAddValue115, fragmentScalarConstants1.packedValues[bitwiseValue37], (sumValue147 * fragmentScalarConstants1.packedValues[624u]) * fragmentScalarConstants1.packedValues[bitwiseValue37]);
                                        vec4 sampledTextureValue55 = textureGather(sampler2DArray(materialTexture6, textureSampler6), vec3(multiplyAddValue120, multiplyAddValue121, scalarValue104));
                                        float scalarValue105 = sampledTextureValue55.x;
                                        float scalarValue106 = sampledTextureValue55.y;
                                        float scalarValue107 = sampledTextureValue55.z;
                                        float scalarValue108 = sampledTextureValue55.w;
                                        float multiplyAddValue128 = fract(fma(multiplyAddValue120, fragmentScalarConstants1.packedValues[626u], 0.5));
                                        float multiplyAddValue129 = fract(fma(multiplyAddValue121, fragmentScalarConstants1.packedValues[626u], 0.5));
                                        float productValue254 = spvNClamp(nonlinearValue6 * (multiplyAddValue113 - scalarValue105), 0.0, 1.0);
                                        float productValue255 = spvNClamp(nonlinearValue6 * (multiplyAddValue113 - scalarValue106), 0.0, 1.0);
                                        float productValue256 = spvNClamp(nonlinearValue6 * (multiplyAddValue113 - scalarValue107), 0.0, 1.0);
                                        float productValue257 = spvNClamp(nonlinearValue6 * (multiplyAddValue113 - scalarValue108), 0.0, 1.0);
                                        float multiplyAddValue130 = fma(-fma(productValue254, -2.0, 3.0), productValue254 * productValue254, 1.0);
                                        float multiplyAddValue131 = fma(-fma(productValue257, -2.0, 3.0), productValue257 * productValue257, 1.0);
                                        float multiplyAddValue132 = fma(multiplyAddValue128, fma(-fma(productValue256, -2.0, 3.0), productValue256 * productValue256, 1.0) - multiplyAddValue131, multiplyAddValue131);
                                        multiplyAddValue175 = fma(multiplyAddValue129, fma(multiplyAddValue128, fma(-fma(productValue255, -2.0, 3.0), productValue255 * productValue255, 1.0) - multiplyAddValue130, multiplyAddValue130) - multiplyAddValue132, multiplyAddValue132) + intermediateValue228;
                                        bool comparisonValue116 = scalarValue108 >= multiplyAddValue119;
                                        bool comparisonValue117 = scalarValue105 >= multiplyAddValue119;
                                        float comparisonValue118 = float(scalarValue106 >= multiplyAddValue119);
                                        float comparisonValue119 = float(scalarValue107 >= multiplyAddValue119);
                                        float multiplyAddValue133 = fma(multiplyAddValue128, comparisonValue116 ? (comparisonValue119 - 1.0) : comparisonValue119, float(comparisonValue116));
                                        multiplyAddValue174 = comparisonValue114 ? (comparisonValue116 ? (intermediateValue226 + 1.0) : intermediateValue226) : (fma(multiplyAddValue129, fma(multiplyAddValue128, comparisonValue117 ? (comparisonValue118 - 1.0) : comparisonValue118, float(comparisonValue117)) - multiplyAddValue133, multiplyAddValue133) + intermediateValue226);
                                        sumValue81 = scalarValue17 + 1u;
                                        intermediateValue226 = multiplyAddValue174;
                                        intermediateValue228 = multiplyAddValue175;
                                        scalarValue17 = sumValue81;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                                        if ((comparisonValue182 && (int(scalarValue17) >= int(1u))) || (conditionValue20 && (int(clampedValue2) <= int(scalarValue17))))
                                        {
                                            break;
                                        }
                                        float sumValue221 = rdSignedBitsToFloat2(scalarValue17 - comparisonValue183);
                                        uint bitwiseValue121 = (((16u * intermediateValue108) + 768u) + 0u) >> 2u;
                                        float multiplyAddValue285 = fma(multiplyAddValue282, fragmentScalarConstants1.packedValues[bitwiseValue121], ((sumValue221 + 0.5) * fragmentScalarConstants1.packedValues[692u]) * fragmentScalarConstants1.packedValues[bitwiseValue121]);
                                        float multiplyAddValue286 = fma(multiplyAddValue283, fragmentScalarConstants1.packedValues[bitwiseValue121], (sumValue220 * fragmentScalarConstants1.packedValues[692u]) * fragmentScalarConstants1.packedValues[bitwiseValue121]);
                                        vec4 sampledTextureValue68 = textureGather(sampler2DArray(materialTexture6, textureSampler6), vec3(multiplyAddValue285, multiplyAddValue286, scalarValue226));
                                        float scalarValue227 = sampledTextureValue68.x;
                                        float scalarValue228 = sampledTextureValue68.y;
                                        float scalarValue229 = sampledTextureValue68.z;
                                        float scalarValue230 = sampledTextureValue68.w;
                                        float multiplyAddValue287 = fract(fma(multiplyAddValue285, fragmentScalarConstants1.packedValues[694u], 0.5));
                                        float multiplyAddValue288 = fract(fma(multiplyAddValue286, fragmentScalarConstants1.packedValues[694u], 0.5));
                                        float productValue348 = spvNClamp(nonlinearValue9 * (multiplyAddValue281 - scalarValue227), 0.0, 1.0);
                                        float productValue349 = spvNClamp(nonlinearValue9 * (multiplyAddValue281 - scalarValue228), 0.0, 1.0);
                                        float productValue350 = spvNClamp(nonlinearValue9 * (multiplyAddValue281 - scalarValue229), 0.0, 1.0);
                                        float productValue351 = spvNClamp(nonlinearValue9 * (multiplyAddValue281 - scalarValue230), 0.0, 1.0);
                                        float multiplyAddValue289 = fma(-fma(productValue348, -2.0, 3.0), productValue348 * productValue348, 1.0);
                                        float multiplyAddValue290 = fma(-fma(productValue351, -2.0, 3.0), productValue351 * productValue351, 1.0);
                                        float multiplyAddValue291 = fma(multiplyAddValue287, fma(-fma(productValue350, -2.0, 3.0), productValue350 * productValue350, 1.0) - multiplyAddValue290, multiplyAddValue290);
                                        multiplyAddValue218 = intermediateValue258 + fma(multiplyAddValue288, fma(multiplyAddValue287, fma(-fma(productValue349, -2.0, 3.0), productValue349 * productValue349, 1.0) - multiplyAddValue289, multiplyAddValue289) - multiplyAddValue291, multiplyAddValue291);
                                        bool comparisonValue184 = scalarValue230 >= multiplyAddValue284;
                                        bool comparisonValue185 = scalarValue227 >= multiplyAddValue284;
                                        float comparisonValue186 = float(scalarValue228 >= multiplyAddValue284);
                                        float comparisonValue187 = float(scalarValue229 >= multiplyAddValue284);
                                        float multiplyAddValue292 = fma(multiplyAddValue287, comparisonValue184 ? (comparisonValue187 - 1.0) : comparisonValue187, float(comparisonValue184));
                                        multiplyAddValue217 = comparisonValue182 ? (comparisonValue184 ? (intermediateValue256 + 1.0) : intermediateValue256) : (intermediateValue256 + fma(multiplyAddValue288, fma(multiplyAddValue287, comparisonValue185 ? (comparisonValue186 - 1.0) : comparisonValue186, float(comparisonValue185)) - multiplyAddValue292, multiplyAddValue292));
                                        sumValue100 = scalarValue17 + 1u;
                                        intermediateValue256 = multiplyAddValue217;
                                        intermediateValue258 = multiplyAddValue218;
                                        scalarValue17 = sumValue100;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                                        branchMergedValue3 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue174, productValue175, dotProductValue4), 0.0).x >= multiplyAddValue25);
                                    }
                                    else
                                    {
                                        vec4 sampledTextureValue6 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue174, productValue175, dotProductValue4));
                                        float productValue74 = fract((productValue174 * intermediateValue121.z) + 0.5);
                                        float comparisonValue14 = (sampledTextureValue6.x < multiplyAddValue25) ? 0.0 : 1.0;
                                        float comparisonValue16 = (sampledTextureValue6.w < multiplyAddValue25) ? 0.0 : 1.0;
                                        float comparisonValue22 = ((((sampledTextureValue6.z < multiplyAddValue25) ? 0.0 : 1.0) - comparisonValue16) * productValue74) + comparisonValue16;
                                        branchMergedValue3 = (((((((sampledTextureValue6.y < multiplyAddValue25) ? 0.0 : 1.0) - comparisonValue14) * productValue74) + comparisonValue14) - comparisonValue22) * fract((productValue175 * intermediateValue121.z) + 0.5)) + comparisonValue22;
                                    }
                                    intermediateValue153 = branchMergedValue3;
                                    sumValue65 = intermediateValue153 + intermediateValue119;
                                    uint sumValue26 = intermediateValue120 + 1u;
                                    if (sumValue26 == comparisonValue13)
                                    {
                                        break;
                                    }
                                    else
                                    {
                                        intermediateValue119 = sumValue65;
                                        intermediateValue120 = sumValue26;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                                        branchMergedValue4 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue207, productValue208, dotProductValue25), 0.0).x >= multiplyAddValue435);
                                    }
                                    else
                                    {
                                        vec4 sampledTextureValue82 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue207, productValue208, dotProductValue25));
                                        float productValue470 = fract((productValue207 * intermediateValue146.z) + 0.5);
                                        float comparisonValue271 = (sampledTextureValue82.x < multiplyAddValue435) ? 0.0 : 1.0;
                                        float comparisonValue272 = (sampledTextureValue82.w < multiplyAddValue435) ? 0.0 : 1.0;
                                        float comparisonValue273 = ((((sampledTextureValue82.z < multiplyAddValue435) ? 0.0 : 1.0) - comparisonValue272) * productValue470) + comparisonValue272;
                                        branchMergedValue4 = (((((((sampledTextureValue82.y < multiplyAddValue435) ? 0.0 : 1.0) - comparisonValue271) * productValue470) + comparisonValue271) - comparisonValue273) * fract((productValue208 * intermediateValue146.z) + 0.5)) + comparisonValue273;
                                    }
                                    intermediateValue186 = branchMergedValue4;
                                    sumValue45 = intermediateValue186 + intermediateValue144;
                                    uint sumValue305 = intermediateValue145 + 1u;
                                    if (sumValue305 == comparisonValue270)
                                    {
                                        break;
                                    }
                                    else
                                    {
                                        intermediateValue144 = sumValue45;
                                        intermediateValue145 = sumValue305;
#endif
                                        continue;
                                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                                    sumValue72 = scalarValue14 + 1u;
                                    intermediateValue225 = intermediateValue226;
                                    intermediateValue227 = intermediateValue228;
                                    scalarValue14 = sumValue72;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                                    sumValue70 = scalarValue14 + 1u;
                                    intermediateValue255 = intermediateValue256;
                                    intermediateValue257 = intermediateValue258;
                                    scalarValue14 = sumValue70;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                                }
                                uint sumValue27 = scalarValue20 + 1u;
                                if (sumValue27 == comparisonValue13)
                                {
                                    break;
                                }
                                else
                                {
                                    scalarValue19 = sumValue65;
                                    scalarValue20 = sumValue27;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                                }
                                uint sumValue27 = scalarValue20 + 1u;
                                if (sumValue27 == comparisonValue270)
                                {
                                    break;
                                }
                                else
                                {
                                    scalarValue19 = sumValue45;
                                    scalarValue20 = sumValue27;
#endif
                                    continue;
                                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                                float comparisonValue120 = rdSignedBitsToFloat2(comparisonValue114 ? 1u : (clampedValue * clampedValue));
                                intermediateValue149 = sumValue140;
                                quotientValue18 = spvNMin(intermediateValue227 / comparisonValue120, intermediateValue102);
                                quotientValue17 = spvNMin(intermediateValue225 / comparisonValue120, intermediateValue101);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                                float comparisonValue188 = rdSignedBitsToFloat2(comparisonValue182 ? 1u : (clampedValue2 * clampedValue2));
                                intermediateValue187 = sumValue213;
                                quotientValue21 = spvNMin(intermediateValue257 / comparisonValue188, intermediateValue106);
                                quotientValue20 = spvNMin(intermediateValue255 / comparisonValue188, intermediateValue105);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                            }
                            intermediateValue93 = sumValue65;
                        }
                        else
                        {
                            intermediateValue93 = 0.0;
                        }
                        float quotientValue22 = intermediateValue93 / float(int(comparisonValue13 * comparisonValue13));
                        float branchMergedValue12;
                        if (quotientValue22 < 1.0)
                        {
                            branchMergedValue12 = spvNMin(1.0, spvNMax(quotientValue22, 1.0 - fragmentVectorConstants1.packedValues[146u].w));
                        }
                        else
                        {
                            branchMergedValue12 = 1.0;
                        }
                        intermediateValue62 = branchMergedValue12;
                    }
                    else
                    {
                        intermediateValue62 = 1.0;
                    }
                    float scalarValue21 = spvNMin(intermediateValue37, spvNMin(intermediateValue53, intermediateValue62));
                    float productValue75 = spvNMax(0.0, fragmentVectorConstants1.packedValues[156u].y - spvNMin(fragmentVectorConstants1.packedValues[156u].y * 0.100000001490116119384765625, 8.0));
                    float quotientValue24 = spvNClamp((sumValue3 - productValue75) / (fragmentVectorConstants1.packedValues[156u].y - productValue75), 0.0, 1.0);
                    productValue72 = (((quotientValue24 * quotientValue24) * (1.0 - scalarValue21)) * (3.0 - (quotientValue24 * 2.0))) + scalarValue21;
                    intermediateValue25 = intermediateValue26;
                }
                else
                {
                    productValue72 = 1.0;
                    intermediateValue25 = 1.0;
                }
                float multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[73u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[73u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[73u].y, fragmentVectorConstants1.packedValues[73u].x * fragmentVectorConstants1.packedValues[4u].x)));
                float multiplyAddValue29 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[73u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[73u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[73u].y, fragmentVectorConstants1.packedValues[73u].x * fragmentVectorConstants1.packedValues[4u].y)));
                float multiplyAddValue30 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[73u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[73u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[73u].y, fragmentVectorConstants1.packedValues[73u].x * fragmentVectorConstants1.packedValues[4u].z)));
                float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30), vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30)));
                float productValue76 = inverseLengthValue7 * multiplyAddValue28;
                float productValue80 = inverseLengthValue7 * multiplyAddValue29;
                float productValue81 = inverseLengthValue7 * multiplyAddValue30;
                float productValue82 = fragmentVectorConstants1.packedValues[147u].x * (fragmentVectorConstants1.packedValues[136u].w * sampledTextureValue2);
                float productValue83 = productValue82 * fragmentVectorConstants1.packedValues[136u].x;
                float productValue84 = productValue82 * fragmentVectorConstants1.packedValues[136u].y;
                float productValue85 = productValue82 * fragmentVectorConstants1.packedValues[136u].z;
                float dotProductValue5 = dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(productValue76, productValue80, productValue81));
                float scalarValue22 = spvNMax(dotProductValue5, 0.0);
                float dotProductValue6 = spvNMax(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(sumValue8, sumValue9, sumValue10)), 0.0);
                float sumValue28 = fragmentVectorConstants1.packedValues[159u].y + 1.0;
                float productValue86 = sumValue28 * sumValue28;
                float sumValue29 = productValue76 - quotientValue13;
                float sumValue32 = productValue80 - quotientValue14;
                float sumValue33 = productValue81 - quotientValue15;
                float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue29, sumValue32, sumValue33), vec3(sumValue29, sumValue32, sumValue33)));
                float productValue87 = inverseLengthValue8 * sumValue29;
                float productValue88 = inverseLengthValue8 * sumValue32;
                float productValue89 = inverseLengthValue8 * sumValue33;
                float scalarValue23 = spvNMax(fragmentVectorConstants1.packedValues[128u].z, 0.0500000007450580596923828125);
                float productValue90 = scalarValue23 * scalarValue23;
                float productValue91 = productValue90 * productValue90;
                float dotProductValue7 = spvNMax(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(productValue87, productValue88, productValue89)), 0.0);
                float productValue92 = ((dotProductValue7 * dotProductValue7) * (productValue91 + (-1.0))) + 1.0;
                float productValue93 = productValue90 * 0.5;
                float sumValue34 = 1.0 - productValue93;
                float sumValue35 = productValue93 + 9.9999997473787516355514526367188e-05;
                float dotProductValue8 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue8, sumValue9, sumValue10), vec3(productValue87, productValue88, productValue89)), 0.0), 0.0, 1.0);
                float productValue97 = dotProductValue8 * dotProductValue8;
                float productValue98 = (productValue97 * productValue97) * dotProductValue8;
                float productValue99 = (productValue98 * (1.0 - productValue26)) + productValue26;
                float productValue100 = (productValue98 * (1.0 - productValue27)) + productValue27;
                float productValue105 = (productValue98 * (1.0 - productValue28)) + productValue28;
                float quotientValue28 = ((dotProductValue6 / ((sumValue34 * dotProductValue6) + sumValue35)) * (productValue91 / ((productValue92 * productValue92) * 3.1415927410125732421875))) * (scalarValue22 / ((sumValue34 * scalarValue22) + sumValue35));
                float productValue106 = ((scalarValue22 * 4.0) * dotProductValue6) + 9.9999997473787516355514526367188e-05;
                float quotientValue29 = (((spvNMax((dotProductValue5 + fragmentVectorConstants1.packedValues[159u].y) / productValue86, 0.0) - scalarValue22) * productValue33) + scalarValue22) * productValue72;
                float dotProductValue9 = (intermediateValue25 * productValue33) * spvNMax((dot(vec3((-0.0) - multiplyAddValue12, (-0.0) - multiplyAddValue13, (-0.0) - multiplyAddValue14), vec3(productValue76, productValue80, productValue81)) + fragmentVectorConstants1.packedValues[159u].y) / productValue86, 0.0);
                float productValue107 = sumValue6 * 0.3183098733425140380859375;
                float productValue108 = fragmentVectorConstants1.packedValues[139u].y * (scalarValue22 * productValue72);
                intermediateValue11 = (productValue108 * productValue83) * ((productValue99 * quotientValue28) / productValue106);
                intermediateValue13 = (productValue108 * productValue84) * ((productValue100 * quotientValue28) / productValue106);
                intermediateValue15 = (productValue108 * productValue85) * ((productValue105 * quotientValue28) / productValue106);
                intermediateValue17 = (((productValue107 * exponentialValue) * productValue83) * fragmentVectorConstants1.packedValues[139u].x) * (((1.0 - productValue99) * quotientValue29) + dotProductValue9);
                intermediateValue19 = (((productValue107 * exponentialValue1) * productValue84) * fragmentVectorConstants1.packedValues[139u].x) * (((1.0 - productValue100) * quotientValue29) + dotProductValue9);
                intermediateValue21 = (((productValue107 * exponentialValue2) * productValue85) * fragmentVectorConstants1.packedValues[139u].x) * (((1.0 - productValue105) * quotientValue29) + dotProductValue9);
            }
            float intermediateValue22;
            float intermediateValue23;
            float intermediateValue24;
            if (fragmentVectorConstants1.packedValues[147u].w != 0.0)
            {
                float productValue113 = ((varyingTexCoord3.x + (-0.5)) + (productValue3 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[130u].x;
                float productValue114 = ((varyingTexCoord3.y + (-0.5)) + (productValue4 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[130u].y;
                float productValue115 = ((varyingTexCoord3.z + (-0.5)) + (productValue5 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[130u].z;
                float productValue116 = floor(productValue113 * 0.0625) * 16.0;
                float productValue117 = floor(productValue114 * 0.0625) * 16.0;
                float productValue118 = floor(productValue115 * 0.0625) * 16.0;
                uint productValue119 = uint(int(floor(float(int(uint(int(floor(productValue113))))) * 0.0625)));
                uint productValue120 = uint(int(floor(float(int(uint(int(floor(productValue114))))) * 0.0625)));
                uint productValue121 = uint(int(floor(float(int(uint(int(floor(productValue115))))) * 0.0625)));
                float sumValue36 = productValue113 - productValue116;
                float sumValue47 = productValue114 - productValue117;
                float sumValue48 = productValue115 - productValue118;
                uint bitwiseValue1 = (productValue120 << 16u) | (productValue119 & 65535u);
                uint bitwiseValue2 = productValue121 & 65535u;
                uint productValue122 = productValue119 * 1540483477u;
                uint productValue123 = productValue120 * 1540483477u;
                uint productValue124 = productValue121 * 1540483477u;
                uint bitwiseValue3 = ((((((((productValue122 >> 24u) ^ productValue122) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue123 >> 24u) ^ productValue123) * 1540483477u)) * 1540483477u) ^ (((productValue124 >> 24u) ^ productValue124) * 1540483477u)) * 1540483477u;
                uint bitwiseValue4 = ((bitwiseValue3 >> 13u) ^ bitwiseValue3) * 1540483477u;
                uint bitwiseValue5 = (bitwiseValue4 >> 15u) ^ bitwiseValue4;
                uint bitwiseValue6 = bitwiseValue5 >> 16u;
                uint bitwiseValue8 = bitwiseValue5 & 65535u;
                uint comparisonValue31 = uint(bitwiseValue8 == bitwiseValue6) | (bitwiseValue8 ^ bitwiseValue6);
                uint sumValue49 = uint(fragmentVectorConstants1.packedValues[76u].x) + 4294967295u;
                bool intermediateValue45;
                uint scalarValue24 = comparisonValue31;
                uint scalarValue25 = 0u;
                uint scalarValue26 = 0u;
                uint sampledTextureValue3;
                uint bitwiseValue7;
                for (;;)
                {
                    bitwiseValue7 = scalarValue24 & sumValue49;
                    uint sampledTextureValue7 = texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 2u)).x & 65535u;
                    bool sampledTextureValue8 = (texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 1u)).x == bitwiseValue2) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue7 * 4u)).x == bitwiseValue1) && (sampledTextureValue7 == comparisonValue31));
                    sampledTextureValue3 = sampledTextureValue8 ? texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 3u)).x : scalarValue25;
                    if ((sampledTextureValue7 == 0u) || sampledTextureValue8)
                    {
                        intermediateValue45 = sampledTextureValue8;
                        break;
                    }
                    else
                    {
                        uint sumValue50 = scalarValue26 + 1u;
                        if (int(sumValue50) < int(8u))
                        {
                            scalarValue24 = bitwiseValue7 + 1u;
                            scalarValue25 = sampledTextureValue3;
                            scalarValue26 = sumValue50;
                            continue;
                        }
                        else
                        {
                            intermediateValue45 = false;
                            break;
                        }
                    }
                }
                uint bitwiseValue9 = sampledTextureValue3 >> 2u;
                float branchMergedValue9;
                float branchMergedValue17;
                float branchMergedValue18;
                if (intermediateValue45)
                {
                    float scalarValue27 = abs(productValue3);
                    float scalarValue28 = abs(productValue4);
                    float scalarValue29 = abs(productValue5);
                    float branchMergedValue48;
                    float branchMergedValue50;
                    float branchMergedValue51;
                    if (((scalarValue27 >= 1.0) || (scalarValue28 >= 1.0)) || (scalarValue29 >= 1.0))
                    {
                        float intermediateValue154;
                        float intermediateValue155;
                        float intermediateValue156;
                        float intermediateValue157;
                        float intermediateValue159;
                        float intermediateValue161;
                        float intermediateValue163;
                        float intermediateValue165;
                        float intermediateValue167;
                        float intermediateValue169;
                        float intermediateValue170;
                        float intermediateValue171;
                        float productValue131;
                        float productValue132;
                        float productValue133;
                        float sumValue37;
                        float sumValue38;
                        float sumValue39;
                        float sumValue40;
                        float sumValue41;
                        float sumValue42;
                        float sumValue43;
                        float sumValue44;
                        float sumValue45;
                        float productValue134;
                        float productValue135;
                        float productValue136;
                        float productValue137;
                        bool comparisonValue15;
                        for (;;)
                        {
                            float dotProductValue10 = dot(vec3(sumValue36, sumValue47, sumValue48), vec3(scalarValue27, scalarValue28, scalarValue29));
                            float dotProductValue11 = dot(vec3(sumValue36, sumValue47, sumValue48), vec3(scalarValue29, scalarValue27, scalarValue28));
                            float dotProductValue12 = dot(vec3(sumValue36, sumValue47, sumValue48), vec3(scalarValue28, scalarValue29, scalarValue27));
                            float comparisonValue35 = ((inverseLengthValue * ((varyingNormal0.y + varyingNormal0.x) + varyingNormal0.z)) > 0.0) ? ceil(dotProductValue10) : floor(dotProductValue10);
                            float scalarValue30 = floor(dotProductValue11);
                            float scalarValue31 = floor(dotProductValue12);
                            productValue131 = ((comparisonValue35 * scalarValue27) + (scalarValue30 * scalarValue29)) + (scalarValue31 * scalarValue28);
                            productValue132 = ((comparisonValue35 * scalarValue28) + (scalarValue30 * scalarValue27)) + (scalarValue31 * scalarValue29);
                            productValue133 = ((comparisonValue35 * scalarValue29) + (scalarValue30 * scalarValue28)) + (scalarValue31 * scalarValue27);
                            sumValue37 = productValue131 + scalarValue29;
                            sumValue38 = productValue132 + scalarValue27;
                            sumValue39 = productValue133 + scalarValue28;
                            sumValue40 = productValue131 + scalarValue28;
                            sumValue41 = productValue132 + scalarValue29;
                            sumValue42 = productValue133 + scalarValue27;
                            sumValue43 = sumValue37 + scalarValue28;
                            sumValue44 = sumValue41 + scalarValue27;
                            sumValue45 = sumValue39 + scalarValue27;
                            float sumValue51 = dotProductValue11 - scalarValue30;
                            float sumValue69 = dotProductValue12 - scalarValue31;
                            float sumValue80 = 1.0 - sumValue51;
                            float sumValue82 = 1.0 - sumValue69;
                            productValue134 = sumValue82 * sumValue80;
                            productValue135 = sumValue82 * sumValue51;
                            productValue136 = sumValue80 * sumValue69;
                            productValue137 = sumValue69 * sumValue51;
                            comparisonValue15 = ((productValue133 >= 0.0) && ((productValue131 >= 0.0) && (productValue132 >= 0.0))) && ((sumValue45 < 16.0) && ((sumValue43 < 16.0) && (sumValue44 < 16.0)));
                            if (comparisonValue15)
                            {
                                uvec4 sampledTextureValue9 = texelFetch(voxelBuffer, int(((uint(productValue132) + bitwiseValue9) + (uint(productValue133) << 4u)) + (uint(productValue131) << 8u)));
                                uint scalarValue32 = sampledTextureValue9.x;
                                float bitwiseValue13;
                                float intermediateValue111;
                                float intermediateValue112;
                                if (scalarValue32 == 0u)
                                {
                                    bitwiseValue13 = 0.0;
                                    intermediateValue111 = 0.0;
                                    intermediateValue112 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue11 = float(scalarValue32 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue13 = bitwiseValue11 * float(scalarValue32 & 255u);
                                    intermediateValue111 = bitwiseValue11 * float((scalarValue32 >> 8u) & 255u);
                                    intermediateValue112 = bitwiseValue11 * float((scalarValue32 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue14 = texelFetch(voxelBuffer, int(((uint(sumValue38) + bitwiseValue9) + (uint(sumValue39) << 4u)) + (uint(sumValue37) << 8u)));
                                uint scalarValue33 = sampledTextureValue14.x;
                                float bitwiseValue17;
                                float intermediateValue122;
                                float intermediateValue123;
                                if (scalarValue33 == 0u)
                                {
                                    bitwiseValue17 = 0.0;
                                    intermediateValue122 = 0.0;
                                    intermediateValue123 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue12 = float(scalarValue33 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue17 = bitwiseValue12 * float(scalarValue33 & 255u);
                                    intermediateValue122 = bitwiseValue12 * float((scalarValue33 >> 8u) & 255u);
                                    intermediateValue123 = bitwiseValue12 * float((scalarValue33 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue15 = texelFetch(voxelBuffer, int(((uint(sumValue41) + bitwiseValue9) + (uint(sumValue42) << 4u)) + (uint(sumValue40) << 8u)));
                                uint scalarValue34 = sampledTextureValue15.x;
                                float bitwiseValue21;
                                float intermediateValue140;
                                float intermediateValue141;
                                if (scalarValue34 == 0u)
                                {
                                    bitwiseValue21 = 0.0;
                                    intermediateValue140 = 0.0;
                                    intermediateValue141 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue14 = float(scalarValue34 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue21 = bitwiseValue14 * float(scalarValue34 & 255u);
                                    intermediateValue140 = bitwiseValue14 * float((scalarValue34 >> 8u) & 255u);
                                    intermediateValue141 = bitwiseValue14 * float((scalarValue34 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue16 = texelFetch(voxelBuffer, int(((uint(sumValue44) + bitwiseValue9) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u)));
                                uint scalarValue35 = sampledTextureValue16.x;
                                float branchMergedValue15;
                                float branchMergedValue26;
                                float branchMergedValue27;
                                float branchMergedValue28;
                                float branchMergedValue29;
                                float branchMergedValue30;
                                float branchMergedValue31;
                                float branchMergedValue32;
                                float branchMergedValue33;
                                float branchMergedValue34;
                                float branchMergedValue44;
                                float branchMergedValue45;
                                if (scalarValue35 == 0u)
                                {
                                    branchMergedValue15 = bitwiseValue21;
                                    branchMergedValue26 = intermediateValue123;
                                    branchMergedValue27 = intermediateValue122;
                                    branchMergedValue28 = bitwiseValue17;
                                    branchMergedValue29 = intermediateValue112;
                                    branchMergedValue30 = intermediateValue111;
                                    branchMergedValue31 = bitwiseValue13;
                                    branchMergedValue32 = 0.0;
                                    branchMergedValue33 = 0.0;
                                    branchMergedValue34 = 0.0;
                                    branchMergedValue44 = intermediateValue141;
                                    branchMergedValue45 = intermediateValue140;
                                }
                                else
                                {
                                    float bitwiseValue16 = float(scalarValue35 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    branchMergedValue15 = bitwiseValue21;
                                    branchMergedValue26 = intermediateValue123;
                                    branchMergedValue27 = intermediateValue122;
                                    branchMergedValue28 = bitwiseValue17;
                                    branchMergedValue29 = intermediateValue112;
                                    branchMergedValue30 = intermediateValue111;
                                    branchMergedValue31 = bitwiseValue13;
                                    branchMergedValue32 = bitwiseValue16 * float((scalarValue35 >> 16u) & 255u);
                                    branchMergedValue33 = bitwiseValue16 * float((scalarValue35 >> 8u) & 255u);
                                    branchMergedValue34 = bitwiseValue16 * float(scalarValue35 & 255u);
                                    branchMergedValue44 = intermediateValue141;
                                    branchMergedValue45 = intermediateValue140;
                                }
                                intermediateValue154 = branchMergedValue31;
                                intermediateValue155 = branchMergedValue30;
                                intermediateValue156 = branchMergedValue29;
                                intermediateValue157 = branchMergedValue28;
                                intermediateValue159 = branchMergedValue27;
                                intermediateValue161 = branchMergedValue26;
                                intermediateValue163 = branchMergedValue15;
                                intermediateValue165 = branchMergedValue45;
                                intermediateValue167 = branchMergedValue44;
                                intermediateValue169 = branchMergedValue34;
                                intermediateValue170 = branchMergedValue33;
                                intermediateValue171 = branchMergedValue32;
                                break;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                            }
                            intermediateValue106 = sumValue45;
                        }
                        else
                        {
                            intermediateValue106 = 0.0;
                        }
                        float quotientValue83 = intermediateValue106 / float(int(comparisonValue270 * comparisonValue270));
                        float branchMergedValue18;
                        if (quotientValue83 < 1.0)
                        {
                            branchMergedValue18 = spvNMin(1.0, spvNMax(quotientValue83, 1.0 - fragmentVectorConstants1.packedValues[149u].w));
                        }
                        else
                        {
                            branchMergedValue18 = 1.0;
                        }
                        intermediateValue78 = branchMergedValue18;
                    }
                    else
                    {
                        intermediateValue78 = 1.0;
                    }
                    float scalarValue349 = spvNMin(intermediateValue36, spvNMin(intermediateValue59, intermediateValue78));
                    float productValue471 = spvNMax(0.0, fragmentVectorConstants1.packedValues[173u].y - spvNMin(fragmentVectorConstants1.packedValues[173u].y * 0.100000001490116119384765625, 8.0));
                    float quotientValue84 = spvNClamp((sumValue3 - productValue471) / (fragmentVectorConstants1.packedValues[173u].y - productValue471), 0.0, 1.0);
                    productValue63 = (((quotientValue84 * quotientValue84) * (1.0 - scalarValue349)) * (3.0 - (quotientValue84 * 2.0))) + scalarValue349;
                    intermediateValue23 = intermediateValue24;
                }
                else
                {
                    productValue63 = 1.0;
                    intermediateValue23 = 1.0;
                }
                float multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[73u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[73u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[73u].y, fragmentVectorConstants1.packedValues[73u].x * fragmentVectorConstants1.packedValues[4u].x)));
                float multiplyAddValue29 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[73u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[73u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[73u].y, fragmentVectorConstants1.packedValues[73u].x * fragmentVectorConstants1.packedValues[4u].y)));
                float multiplyAddValue30 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[73u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[73u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[73u].y, fragmentVectorConstants1.packedValues[73u].x * fragmentVectorConstants1.packedValues[4u].z)));
                float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30), vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30)));
                float productValue76 = inverseLengthValue7 * multiplyAddValue28;
                float productValue80 = inverseLengthValue7 * multiplyAddValue29;
                float productValue81 = inverseLengthValue7 * multiplyAddValue30;
                float productValue472 = fragmentVectorConstants1.packedValues[150u].x * (fragmentVectorConstants1.packedValues[139u].w * sampledTextureValue2);
                float productValue473 = productValue472 * fragmentVectorConstants1.packedValues[139u].x;
                float productValue474 = productValue472 * fragmentVectorConstants1.packedValues[139u].y;
                float productValue475 = productValue472 * fragmentVectorConstants1.packedValues[139u].z;
                float dotProductValue5 = dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(productValue76, productValue80, productValue81));
                float scalarValue22 = spvNMax(dotProductValue5, 0.0);
                float dotProductValue6 = spvNMax(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(sumValue8, sumValue9, sumValue10)), 0.0);
                float sumValue306 = fragmentVectorConstants1.packedValues[176u].y + 1.0;
                float productValue476 = sumValue306 * sumValue306;
                float sumValue29 = productValue76 - quotientValue13;
                float sumValue32 = productValue80 - quotientValue14;
                float sumValue33 = productValue81 - quotientValue15;
                float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue29, sumValue32, sumValue33), vec3(sumValue29, sumValue32, sumValue33)));
                float productValue87 = inverseLengthValue8 * sumValue29;
                float productValue88 = inverseLengthValue8 * sumValue32;
                float productValue89 = inverseLengthValue8 * sumValue33;
                float scalarValue350 = spvNMax(fragmentVectorConstants1.packedValues[130u].z, 0.0500000007450580596923828125);
                float productValue477 = scalarValue350 * scalarValue350;
                float productValue478 = productValue477 * productValue477;
                float dotProductValue7 = spvNMax(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(productValue87, productValue88, productValue89)), 0.0);
                float productValue479 = ((dotProductValue7 * dotProductValue7) * (productValue478 + (-1.0))) + 1.0;
                float productValue480 = productValue477 * 0.5;
                float sumValue307 = 1.0 - productValue480;
                float sumValue308 = productValue480 + 9.9999997473787516355514526367188e-05;
                float dotProductValue8 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue8, sumValue9, sumValue10), vec3(productValue87, productValue88, productValue89)), 0.0), 0.0, 1.0);
                float productValue97 = dotProductValue8 * dotProductValue8;
                float productValue98 = (productValue97 * productValue97) * dotProductValue8;
                float productValue481 = (productValue98 * (1.0 - productValue453)) + productValue453;
                float productValue482 = (productValue98 * (1.0 - productValue454)) + productValue454;
                float productValue483 = (productValue98 * (1.0 - productValue455)) + productValue455;
                float quotientValue85 = ((dotProductValue6 / ((sumValue307 * dotProductValue6) + sumValue308)) * (productValue478 / ((productValue479 * productValue479) * 3.1415927410125732421875))) * (scalarValue22 / ((sumValue307 * scalarValue22) + sumValue308));
                float productValue106 = ((scalarValue22 * 4.0) * dotProductValue6) + 9.9999997473787516355514526367188e-05;
                float quotientValue86 = (((spvNMax((dotProductValue5 + fragmentVectorConstants1.packedValues[176u].y) / productValue476, 0.0) - scalarValue22) * productValue457) + scalarValue22) * productValue63;
                float dotProductValue26 = (intermediateValue23 * productValue457) * spvNMax((dot(vec3((-0.0) - multiplyAddValue12, (-0.0) - multiplyAddValue13, (-0.0) - multiplyAddValue14), vec3(productValue76, productValue80, productValue81)) + fragmentVectorConstants1.packedValues[176u].y) / productValue476, 0.0);
                float productValue484 = sumValue299 * 0.3183098733425140380859375;
                float productValue485 = fragmentVectorConstants1.packedValues[142u].y * (scalarValue22 * productValue63);
                intermediateValue16 = (productValue485 * productValue473) * ((productValue481 * quotientValue85) / productValue106);
                intermediateValue17 = (productValue485 * productValue474) * ((productValue482 * quotientValue85) / productValue106);
                intermediateValue18 = (productValue485 * productValue475) * ((productValue483 * quotientValue85) / productValue106);
                intermediateValue19 = (((productValue484 * exponentialValue) * productValue473) * fragmentVectorConstants1.packedValues[142u].x) * (((1.0 - productValue481) * quotientValue86) + dotProductValue26);
                intermediateValue20 = (((productValue484 * exponentialValue1) * productValue474) * fragmentVectorConstants1.packedValues[142u].x) * (((1.0 - productValue482) * quotientValue86) + dotProductValue26);
                intermediateValue21 = (((productValue484 * exponentialValue2) * productValue475) * fragmentVectorConstants1.packedValues[142u].x) * (((1.0 - productValue483) * quotientValue86) + dotProductValue26);
            }
            float productValue48;
            float productValue49;
            float productValue50;
            float productValue51;
            float productValue52;
            float productValue53;
            if (fragmentVectorConstants1.packedValues[78u].z != 0.0)
            {
                bool conditionValue43 = int(uint(int(fragmentVectorConstants1.packedValues[166u].y))) > int(0u);
                float comparisonValue274 = conditionValue43 ? productValue449 : varyingTexCoord3.x;
                float comparisonValue275 = conditionValue43 ? productValue450 : varyingTexCoord3.y;
                float comparisonValue276 = conditionValue43 ? productValue451 : varyingTexCoord3.z;
                float productValue486 = fragmentVectorConstants1.packedValues[91u].z * sumValue3;
                float productValue487 = productValue486 * fragmentVectorConstants1.packedValues[91u].w;
                float intermediateValue31;
                if (fragmentVectorConstants1.packedValues[91u].x > sumValue3)
                {
                    intermediateValue31 = 0.0;
                }
                else
                {
                    float branchMergedValue15;
                    if (fragmentVectorConstants1.packedValues[91u].y > sumValue3)
                    {
                        branchMergedValue15 = 1.0;
                    }
                    else
                    {
                        branchMergedValue15 = spvNMin(floor(spvNMin(spvNMax((log2(sumValue3) - fragmentVectorConstants1.packedValues[161u].z) * fragmentVectorConstants1.packedValues[161u].x, 0.0), 1.0) * (fragmentVectorConstants1.packedValues[138u].z + (-2.0))) + 2.0, fragmentVectorConstants1.packedValues[138u].z + (-1.0));
                    }
                    intermediateValue31 = branchMergedValue15;
                }
                float quotientValue87 = spvNMin(floor(spvNMin(spvNMax((productValue487 + multiplyAddValue4) / (productValue487 * 2.0), 0.0), 1.0) * fragmentVectorConstants1.packedValues[138u].x), fragmentVectorConstants1.packedValues[138u].x + (-1.0));
                float quotientValue88 = spvNMin(floor(spvNMin(spvNMax((productValue486 + multiplyAddValue5) / (productValue486 * 2.0), 0.0), 1.0) * fragmentVectorConstants1.packedValues[138u].y), fragmentVectorConstants1.packedValues[138u].y + (-1.0));
                uint intermediateValue44;
                bool intermediateValue46;
                uint intermediateValue47;
                if ((intermediateValue31 >= fragmentVectorConstants1.packedValues[138u].z) || ((quotientValue88 >= fragmentVectorConstants1.packedValues[138u].y) || ((quotientValue87 >= fragmentVectorConstants1.packedValues[138u].x) || ((intermediateValue31 < 0.0) || ((quotientValue87 < 0.0) || (quotientValue88 < 0.0))))))
                {
                    intermediateValue44 = intermediateValue45;
                    intermediateValue46 = false;
                    intermediateValue47 = 0u;
                }
                else
                {
                    uint scalarValue351 = uint(int(fragmentVectorConstants1.packedValues[138u].w));
                    uint productValue488 = uint(int(((quotientValue88 + (intermediateValue31 * fragmentVectorConstants1.packedValues[138u].y)) * fragmentVectorConstants1.packedValues[138u].x) + quotientValue87)) * scalarValue351;
                    intermediateValue44 = productValue488;
                    intermediateValue46 = true;
                    intermediateValue47 = productValue488 + scalarValue351;
                }
                float intermediateValue61;
                float intermediateValue63;
                float intermediateValue65;
                float intermediateValue67;
                float intermediateValue69;
                float intermediateValue71;
                if (intermediateValue46 && (int(intermediateValue44) < int(intermediateValue47)))
                {
                    float intermediateValue114;
                    float quotientValue23;
                    float dotProductValue19;
                    float sumValue52;
                    float sumValue53;
                    float sumValue54;
                    float quotientValue25;
                    float quotientValue26;
                    float quotientValue27;
                    float intermediateValue158;
                    float intermediateValue159;
                    float intermediateValue160;
                    float intermediateValue161;
                    float intermediateValue163;
                    float intermediateValue62;
                    float intermediateValue64;
                    float intermediateValue66;
                    float intermediateValue68;
                    float intermediateValue70;
                    float intermediateValue72;
                    float scalarValue352 = 0.0;
                    float scalarValue353 = 0.0;
                    float scalarValue354 = 0.0;
                    float scalarValue355 = 0.0;
                    float scalarValue356 = 0.0;
                    float scalarValue357 = 0.0;
                    uint scalarValue358 = intermediateValue44;
                    uint sampledTextureValue10;
                    for (;;)
                    {
                        sampledTextureValue10 = uint(int(uintBitsToFloat(texelFetch(zLightLookupArray, int(scalarValue358)).x)));
                        if (int(sampledTextureValue10) < int(0u))
                        {
                            intermediateValue62 = scalarValue352;
                            intermediateValue64 = scalarValue353;
                            intermediateValue66 = scalarValue354;
                            intermediateValue68 = scalarValue355;
                            intermediateValue70 = scalarValue356;
                            intermediateValue72 = scalarValue357;
                            break;
                        }
                        else
                        {
                            uint productValue489 = sampledTextureValue10 * 32u;
                            vec4 sampledTextureValue83 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue489)).x, texelFetch(zLights, int(productValue489 + 1u)).x, texelFetch(zLights, int(productValue489 + 2u)).x, texelFetch(zLights, int(productValue489 + 3u)).x));
                            float scalarValue359 = sampledTextureValue83.x;
                            float scalarValue360 = sampledTextureValue83.y;
                            float scalarValue361 = sampledTextureValue83.z;
                            float multiplyAddValue438 = fma(fragmentVectorConstants1.packedValues[6u].x, scalarValue361, fma(fragmentVectorConstants1.packedValues[5u].x, scalarValue360, scalarValue359 * fragmentVectorConstants1.packedValues[4u].x)) + (fragmentVectorConstants1.packedValues[7u].x - multiplyAddValue4);
                            float multiplyAddValue439 = fma(fragmentVectorConstants1.packedValues[6u].y, scalarValue361, fma(fragmentVectorConstants1.packedValues[5u].y, scalarValue360, scalarValue359 * fragmentVectorConstants1.packedValues[4u].y)) + (fragmentVectorConstants1.packedValues[7u].y - multiplyAddValue5);
                            float multiplyAddValue440 = fma(fragmentVectorConstants1.packedValues[6u].z, scalarValue361, fma(fragmentVectorConstants1.packedValues[5u].z, scalarValue360, scalarValue359 * fragmentVectorConstants1.packedValues[4u].z)) + (fragmentVectorConstants1.packedValues[7u].z - multiplyAddValue6);
                            float inverseLengthValue40 = inversesqrt(dot(vec3(multiplyAddValue438, multiplyAddValue439, multiplyAddValue440), vec3(multiplyAddValue438, multiplyAddValue439, multiplyAddValue440)));
                            float productValue490 = inverseLengthValue40 * multiplyAddValue438;
                            float productValue491 = inverseLengthValue40 * multiplyAddValue439;
                            float productValue492 = inverseLengthValue40 * multiplyAddValue440;
                            float dotProductValue27 = dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(productValue490, productValue491, productValue492));
                            intermediateValue114 = spvNMax(dotProductValue27, 0.0);
                            float dotProductValue28 = spvNMax(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(sumValue8, sumValue9, sumValue10)), 0.0);
                            float sumValue309 = fragmentVectorConstants1.packedValues[176u].y + 1.0;
                            float productValue493 = sumValue309 * sumValue309;
                            quotientValue23 = ((spvNMax((dotProductValue27 + fragmentVectorConstants1.packedValues[176u].y) / productValue493, 0.0) - intermediateValue114) * productValue457) + intermediateValue114;
                            dotProductValue19 = spvNMax((dot(vec3((-0.0) - multiplyAddValue12, (-0.0) - multiplyAddValue13, (-0.0) - multiplyAddValue14), vec3(productValue490, productValue491, productValue492)) + fragmentVectorConstants1.packedValues[176u].y) / productValue493, 0.0) * productValue457;
                            float sumValue310 = productValue490 - quotientValue13;
                            float sumValue311 = productValue491 - quotientValue14;
                            float sumValue312 = productValue492 - quotientValue15;
                            float inverseLengthValue41 = inversesqrt(dot(vec3(sumValue310, sumValue311, sumValue312), vec3(sumValue310, sumValue311, sumValue312)));
                            float productValue494 = inverseLengthValue41 * sumValue310;
                            float productValue495 = inverseLengthValue41 * sumValue311;
                            float productValue496 = inverseLengthValue41 * sumValue312;
                            float scalarValue362 = spvNMax(fragmentVectorConstants1.packedValues[130u].z, 0.0500000007450580596923828125);
                            float productValue497 = scalarValue362 * scalarValue362;
                            float productValue498 = productValue497 * productValue497;
                            float dotProductValue29 = spvNMax(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(productValue494, productValue495, productValue496)), 0.0);
                            float productValue499 = ((dotProductValue29 * dotProductValue29) * (productValue498 + (-1.0))) + 1.0;
                            float productValue500 = productValue497 * 0.5;
                            float sumValue313 = 1.0 - productValue500;
                            float sumValue314 = productValue500 + 9.9999997473787516355514526367188e-05;
                            float dotProductValue30 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue8, sumValue9, sumValue10), vec3(productValue494, productValue495, productValue496)), 0.0), 0.0, 1.0);
                            float productValue501 = dotProductValue30 * dotProductValue30;
                            float productValue502 = (productValue501 * productValue501) * dotProductValue30;
                            float productValue503 = (productValue502 * (1.0 - productValue453)) + productValue453;
                            float productValue504 = (productValue502 * (1.0 - productValue454)) + productValue454;
                            float productValue505 = (productValue502 * (1.0 - productValue455)) + productValue455;
                            sumValue52 = 1.0 - productValue503;
                            sumValue53 = 1.0 - productValue504;
                            sumValue54 = 1.0 - productValue505;
                            float quotientValue89 = ((dotProductValue28 / ((sumValue313 * dotProductValue28) + sumValue314)) * (productValue498 / ((productValue499 * productValue499) * 3.1415927410125732421875))) * (intermediateValue114 / ((sumValue313 * intermediateValue114) + sumValue314));
                            float productValue506 = ((intermediateValue114 * 4.0) * dotProductValue28) + 9.9999997473787516355514526367188e-05;
                            quotientValue25 = (productValue503 * quotientValue89) / productValue506;
                            quotientValue26 = (productValue504 * quotientValue89) / productValue506;
                            quotientValue27 = (productValue505 * quotientValue89) / productValue506;
                            float sumValue315 = scalarValue359 - varyingTexCoord3.x;
                            float sumValue316 = scalarValue360 - varyingTexCoord3.y;
                            float sumValue317 = scalarValue361 - varyingTexCoord3.z;
                            float productValue209;
                            if (fragmentVectorConstants1.packedValues[75u].x > 0.0)
                            {
                                float sumValue318 = (abs(sumValue316) + abs(sumValue315)) + abs(sumValue317);
                                productValue209 = sumValue318 * sumValue318;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                                intermediateValue149 = intermediateValue104 + 1u;
                                quotientValue18 = intermediateValue102;
                                quotientValue17 = intermediateValue101;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                                intermediateValue187 = intermediateValue108 + 1u;
                                quotientValue21 = intermediateValue106;
                                quotientValue20 = intermediateValue105;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                                float intermediateValue125;
                                float intermediateValue126;
                                float intermediateValue127;
                                float sumValue66;
                                float sumValue67;
                                float sumValue68;
                                uint comparisonValue24;
                                bool comparisonValue25;
                                for (;;)
                                {
                                    sumValue66 = productValue131 + productValue116;
                                    sumValue67 = productValue132 + productValue117;
                                    sumValue68 = productValue133 + productValue118;
                                    uint comparisonValue38 = ((((uint(productValue131 >= 16.0) << 1u) | uint(productValue131 < 0.0)) | (uint(productValue132 < 0.0) << 2u)) | (uint(productValue132 >= 16.0) << 3u)) | (uint(productValue133 < 0.0) << 4u);
                                    comparisonValue24 = intermediateValue[comparisonValue38 | (uint(productValue133 >= 16.0) << 5u)];
                                    comparisonValue25 = ((((comparisonValue38 | (uint(productValue133 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue38 & 31u))) == 0u;
                                    uint sampledTextureValue20;
                                    if (comparisonValue25)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue24 & 31u))) == 0u)
                                        {
                                            intermediateValue125 = 0.0;
                                            intermediateValue126 = 0.0;
                                            intermediateValue127 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue20 = ((((uint(sumValue66 - (floor(sumValue66 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue67 - (floor(sumValue67 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue68 - (floor(sumValue68 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue24)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue20 = ((((uint(productValue133) << 4u) & 240u) | (uint(productValue132) & 15u)) | ((uint(productValue131) << 8u) & 3840u)) + bitwiseValue9;
                                    }
                                    uvec4 sampledTextureValue17 = texelFetch(voxelBuffer, int(sampledTextureValue20));
                                    uint scalarValue36 = sampledTextureValue17.x;
                                    if (scalarValue36 == 0u)
                                    {
                                        intermediateValue125 = 0.0;
                                        intermediateValue126 = 0.0;
                                        intermediateValue127 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue18 = float(scalarValue36 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue125 = bitwiseValue18 * float(scalarValue36 & 255u);
                                    intermediateValue126 = bitwiseValue18 * float((scalarValue36 >> 8u) & 255u);
                                    intermediateValue127 = bitwiseValue18 * float((scalarValue36 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue158;
                                float intermediateValue160;
                                float intermediateValue162;
                                float sumValue87;
                                float sumValue88;
                                float sumValue89;
                                uint comparisonValue36;
                                bool comparisonValue37;
                                for (;;)
                                {
                                    sumValue87 = sumValue37 + productValue116;
                                    sumValue88 = sumValue38 + productValue117;
                                    sumValue89 = sumValue39 + productValue118;
                                    uint comparisonValue41 = ((((uint(sumValue37 >= 16.0) << 1u) | uint(sumValue37 < 0.0)) | (uint(sumValue38 < 0.0) << 2u)) | (uint(sumValue38 >= 16.0) << 3u)) | (uint(sumValue39 < 0.0) << 4u);
                                    comparisonValue36 = intermediateValue[comparisonValue41 | (uint(sumValue39 >= 16.0) << 5u)];
                                    comparisonValue37 = ((((comparisonValue41 | (uint(sumValue39 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue41 & 31u))) == 0u;
                                    uint sampledTextureValue29;
                                    if (comparisonValue37)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue36 & 31u))) == 0u)
                                        {
                                            intermediateValue158 = 0.0;
                                            intermediateValue160 = 0.0;
                                            intermediateValue162 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue29 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue36)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue29 = ((((uint(sumValue39) << 4u) & 240u) | (uint(sumValue38) & 15u)) | ((uint(sumValue37) << 8u) & 3840u)) + bitwiseValue9;
                                    }
                                    uvec4 sampledTextureValue18 = texelFetch(voxelBuffer, int(sampledTextureValue29));
                                    uint scalarValue37 = sampledTextureValue18.x;
                                    if (scalarValue37 == 0u)
                                    {
                                        intermediateValue158 = 0.0;
                                        intermediateValue160 = 0.0;
                                        intermediateValue162 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue20 = float(scalarValue37 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue158 = bitwiseValue20 * float(scalarValue37 & 255u);
                                    intermediateValue160 = bitwiseValue20 * float((scalarValue37 >> 8u) & 255u);
                                    intermediateValue162 = bitwiseValue20 * float((scalarValue37 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue164;
                                float intermediateValue166;
                                float intermediateValue168;
                                float sumValue96;
                                float sumValue97;
                                float sumValue98;
                                uint comparisonValue46;
                                bool comparisonValue47;
                                for (;;)
                                {
                                    sumValue96 = sumValue40 + productValue116;
                                    sumValue97 = sumValue41 + productValue117;
                                    sumValue98 = sumValue42 + productValue118;
                                    uint comparisonValue48 = ((((uint(sumValue40 >= 16.0) << 1u) | uint(sumValue40 < 0.0)) | (uint(sumValue41 < 0.0) << 2u)) | (uint(sumValue41 >= 16.0) << 3u)) | (uint(sumValue42 < 0.0) << 4u);
                                    comparisonValue46 = intermediateValue[comparisonValue48 | (uint(sumValue42 >= 16.0) << 5u)];
                                    comparisonValue47 = ((((comparisonValue48 | (uint(sumValue42 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue48 & 31u))) == 0u;
                                    uint sampledTextureValue33;
                                    if (comparisonValue47)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue46 & 31u))) == 0u)
                                        {
                                            intermediateValue164 = 0.0;
                                            intermediateValue166 = 0.0;
                                            intermediateValue168 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue33 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue46)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue33 = ((((uint(sumValue42) << 4u) & 240u) | (uint(sumValue41) & 15u)) | ((uint(sumValue40) << 8u) & 3840u)) + bitwiseValue9;
                                    }
                                    uvec4 sampledTextureValue19 = texelFetch(voxelBuffer, int(sampledTextureValue33));
                                    uint scalarValue38 = sampledTextureValue19.x;
                                    if (scalarValue38 == 0u)
                                    {
                                        intermediateValue164 = 0.0;
                                        intermediateValue166 = 0.0;
                                        intermediateValue168 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue22 = float(scalarValue38 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue164 = bitwiseValue22 * float(scalarValue38 & 255u);
                                    intermediateValue166 = bitwiseValue22 * float((scalarValue38 >> 8u) & 255u);
                                    intermediateValue168 = bitwiseValue22 * float((scalarValue38 >> 16u) & 255u);
                                    break;
                                }
                                float sumValue83 = sumValue43 + productValue116;
                                float sumValue84 = sumValue44 + productValue117;
                                float sumValue86 = sumValue45 + productValue118;
                                uint comparisonValue51 = ((((uint(sumValue43 >= 16.0) << 1u) | uint(sumValue43 < 0.0)) | (uint(sumValue44 < 0.0) << 2u)) | (uint(sumValue44 >= 16.0) << 3u)) | (uint(sumValue45 < 0.0) << 4u);
                                uint comparisonValue54 = comparisonValue51 | (uint(sumValue45 >= 16.0) << 5u);
                                uint sampledTextureValue37;
                                if ((((comparisonValue54 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue51 & 31u))) == 0u)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (intermediateValue[comparisonValue54] & 31u))) == 0u)
                                    {
                                        intermediateValue154 = intermediateValue125;
                                        intermediateValue155 = intermediateValue126;
                                        intermediateValue156 = intermediateValue127;
                                        intermediateValue157 = intermediateValue158;
                                        intermediateValue159 = intermediateValue160;
                                        intermediateValue161 = intermediateValue162;
                                        intermediateValue163 = intermediateValue164;
                                        intermediateValue165 = intermediateValue166;
                                        intermediateValue167 = intermediateValue168;
                                        intermediateValue169 = 0.0;
                                        intermediateValue170 = 0.0;
                                        intermediateValue171 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue37 = ((((uint(sumValue83 - (floor(sumValue83 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue84 - (floor(sumValue84 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue86 - (floor(sumValue86 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue54])).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue37 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uvec4 sampledTextureValue21 = texelFetch(voxelBuffer, int(sampledTextureValue37));
                                uint scalarValue39 = sampledTextureValue21.x;
                                if (scalarValue39 == 0u)
                                {
                                    intermediateValue154 = intermediateValue125;
                                    intermediateValue155 = intermediateValue126;
                                    intermediateValue156 = intermediateValue127;
                                    intermediateValue157 = intermediateValue158;
                                    intermediateValue159 = intermediateValue160;
                                    intermediateValue161 = intermediateValue162;
                                    intermediateValue163 = intermediateValue164;
                                    intermediateValue165 = intermediateValue166;
                                    intermediateValue167 = intermediateValue168;
                                    intermediateValue169 = 0.0;
                                    intermediateValue170 = 0.0;
                                    intermediateValue171 = 0.0;
                                    break;
                                }
                                float bitwiseValue23 = float(scalarValue39 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue154 = intermediateValue125;
                                intermediateValue155 = intermediateValue126;
                                intermediateValue156 = intermediateValue127;
                                intermediateValue157 = intermediateValue158;
                                intermediateValue159 = intermediateValue160;
                                intermediateValue161 = intermediateValue162;
                                intermediateValue163 = intermediateValue164;
                                intermediateValue165 = intermediateValue166;
                                intermediateValue167 = intermediateValue168;
                                intermediateValue169 = bitwiseValue23 * float(scalarValue39 & 255u);
                                intermediateValue170 = bitwiseValue23 * float((scalarValue39 >> 8u) & 255u);
                                intermediateValue171 = bitwiseValue23 * float((scalarValue39 >> 16u) & 255u);
                                break;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                                productValue209 = dot(vec3(sumValue315, sumValue316, sumValue317), vec3(sumValue315, sumValue316, sumValue317));
#endif
                            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                            intermediateValue101 = quotientValue17;
                            intermediateValue102 = quotientValue18;
                            intermediateValue104 = intermediateValue149;
                            continue;
                        }
                        sumValue15 = scalarValue8 + 1u;
                        intermediateValue100 = intermediateValue101;
                        intermediateValue72 = intermediateValue102;
                        scalarValue7 = intermediateValue104;
                        scalarValue8 = sumValue15;
                        continue;
                    }
                    float intermediateValue152;
                    if (int(uint(int(fragmentScalarConstants1.packedValues[224u]))) > int(0u))
                    {
                        float multiplyAddValue134 = fma(fma(fragmentVectorConstants1.packedValues[142u].x, multiplyAddValue110, fma(fragmentVectorConstants1.packedValues[140u].x, multiplyAddValue108, multiplyAddValue109 * fragmentVectorConstants1.packedValues[141u].x)) + fragmentVectorConstants1.packedValues[143u].x, 0.5, 0.5) * fragmentScalarConstants1.packedValues[225u];
                        float multiplyAddValue138 = (1.0 - fma(fma(fragmentVectorConstants1.packedValues[142u].y, multiplyAddValue110, fma(fragmentVectorConstants1.packedValues[140u].y, multiplyAddValue108, multiplyAddValue109 * fragmentVectorConstants1.packedValues[141u].y)) + fragmentVectorConstants1.packedValues[143u].y, 0.5, 0.5)) * fragmentScalarConstants1.packedValues[225u];
                        float comparisonValue25;
                        if ((((multiplyAddValue134 >= 0.0) && (multiplyAddValue134 < fragmentScalarConstants1.packedValues[225u])) && (multiplyAddValue138 >= 0.0)) && (multiplyAddValue138 < fragmentScalarConstants1.packedValues[225u]))
                        {
                            float scalarValue109 = spvNMin(spvNMax(scalarValue89, fragmentScalarConstants1.packedValues[312u]), 1.0);
                            float multiplyAddValue139 = spvNMin((fma(fragmentVectorConstants1.packedValues[142u].z, multiplyAddValue110, fma(fragmentVectorConstants1.packedValues[140u].z, multiplyAddValue108, multiplyAddValue109 * fragmentVectorConstants1.packedValues[141u].z)) + fragmentVectorConstants1.packedValues[143u].z) - fma(fragmentScalarConstants1.packedValues[194u], sqrt(fma(-scalarValue109, scalarValue109, 1.0)) / scalarValue109, fragmentScalarConstants1.packedValues[193u]), 1.0);
                            bool conditionValue4 = !comparisonValue114;
                            float scalarValue110 = rdDot4Precise2(fragmentVectorConstants1.packedValues[92u], vec4(1.0));
                            float sumValue149 = scalarValue110 + 1.0;
                            uint comparisonValue121 = comparisonValue114 ? 0u : 4294967295u;
                            float intermediateValue177;
                            intermediateValue177 = 0.0;
                            uint sumValue55;
                            float intermediateValue178;
                            uint scalarValue20 = 0u;
                            for (;;)
                            {
                                if (((int(scalarValue20) >= int(2u)) && conditionValue4) || (comparisonValue114 && (int(scalarValue20) >= int(1u))))
                                {
                                    break;
                                }
                                float sumValue150 = rdSignedBitsToFloat2(comparisonValue121 + scalarValue20);
                                float sumValue151 = sumValue150 + 0.5;
                                intermediateValue178 = intermediateValue177;
                                uint sumValue77;
                                float sampledTextureValue11;
                                uint scalarValue25 = 0u;
                                for (;;)
                                {
                                    if ((conditionValue4 && (int(scalarValue25) >= int(2u))) || (comparisonValue114 && (int(scalarValue25) >= int(1u))))
                                    {
                                        break;
                                    }
                                    float sumValue152 = rdSignedBitsToFloat2(comparisonValue121 + scalarValue25);
                                    float multiplyAddValue140 = fma((sumValue152 + 0.5) * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue134);
                                    float multiplyAddValue141 = fma(sumValue151 * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue138);
                                    if (comparisonValue114)
                                    {
                                        sampledTextureValue11 = (textureLod(sampler2DArray(materialTexture6, textureSampler6), vec3(multiplyAddValue140, multiplyAddValue141, sumValue149), 0.0).x >= multiplyAddValue139) ? (intermediateValue178 + 1.0) : intermediateValue178;
                                    }
                                    else
                                    {
                                        vec4 sampledTextureValue56 = textureGather(sampler2DArray(materialTexture6, textureSampler6), vec3(multiplyAddValue140, multiplyAddValue141, sumValue149));
                                        float multiplyAddValue142 = fract(fma(multiplyAddValue140, fragmentScalarConstants1.packedValues[626u], 0.5));
                                        bool comparisonValue122 = sampledTextureValue56.x >= multiplyAddValue139;
                                        bool comparisonValue123 = sampledTextureValue56.w >= multiplyAddValue139;
                                        float comparisonValue124 = float(sampledTextureValue56.y >= multiplyAddValue139);
                                        float comparisonValue125 = float(sampledTextureValue56.z >= multiplyAddValue139);
                                        float multiplyAddValue143 = fma(multiplyAddValue142, comparisonValue123 ? (comparisonValue125 - 1.0) : comparisonValue125, float(comparisonValue123));
                                        sampledTextureValue11 = intermediateValue178 + fma(fract(fma(multiplyAddValue141, fragmentScalarConstants1.packedValues[626u], 0.5)), fma(multiplyAddValue142, comparisonValue122 ? (comparisonValue124 - 1.0) : comparisonValue124, float(comparisonValue122)) - multiplyAddValue143, multiplyAddValue143);
                                    }
                                    sumValue77 = scalarValue25 + 1u;
                                    intermediateValue178 = sampledTextureValue11;
                                    scalarValue25 = sumValue77;
                                    continue;
                                }
                                sumValue55 = scalarValue20 + 1u;
                                intermediateValue177 = intermediateValue178;
                                scalarValue20 = sumValue55;
                                continue;
                            }
                            comparisonValue25 = intermediateValue177 / (comparisonValue114 ? 1.0 : 4.0);
                        }
                        else
                        {
                            comparisonValue25 = 1.0;
                        }
                        intermediateValue152 = comparisonValue25;
                    }
                    else
                    {
                        intermediateValue152 = 1.0;
                    }
                    float comparisonValue28;
                    if ((int(uint(int(fragmentScalarConstants1.packedValues[540u]))) > int(0u)) && (int(uint(int(fragmentScalarConstants1.packedValues[309u]))) > int(0u)))
                    {
                        float multiplyAddValue144 = fma(fragmentVectorConstants1.packedValues[133u].w, multiplyAddValue110, fma(fragmentVectorConstants1.packedValues[131u].w, multiplyAddValue108, multiplyAddValue109 * fragmentVectorConstants1.packedValues[132u].w)) + fragmentVectorConstants1.packedValues[134u].w;
                        float scalarValue111 = spvNMin(spvNMax(scalarValue89, fragmentScalarConstants1.packedValues[312u]), 1.0);
                        float multiplyAddValue145 = ((fma(fragmentVectorConstants1.packedValues[133u].z, multiplyAddValue110, fma(fragmentVectorConstants1.packedValues[131u].z, multiplyAddValue108, multiplyAddValue109 * fragmentVectorConstants1.packedValues[132u].z)) + fragmentVectorConstants1.packedValues[134u].z) / multiplyAddValue144) - (fma(fragmentScalarConstants1.packedValues[194u], sqrt(fma(-scalarValue111, scalarValue111, 1.0)) / scalarValue111, fragmentScalarConstants1.packedValues[193u]) / (multiplyAddValue144 / multiplyAddValue144));
                        float multiplyAddValue146 = fma((fma(fragmentVectorConstants1.packedValues[133u].x, multiplyAddValue110, fma(fragmentVectorConstants1.packedValues[131u].x, multiplyAddValue108, multiplyAddValue109 * fragmentVectorConstants1.packedValues[132u].x)) + fragmentVectorConstants1.packedValues[134u].x) / multiplyAddValue144, 0.5, 0.5);
                        float multiplyAddValue147 = 1.0 - fma((fma(fragmentVectorConstants1.packedValues[133u].y, multiplyAddValue110, fma(fragmentVectorConstants1.packedValues[131u].y, multiplyAddValue108, multiplyAddValue109 * fragmentVectorConstants1.packedValues[132u].y)) + fragmentVectorConstants1.packedValues[134u].y) / multiplyAddValue144, 0.5, 0.5);
                        uint clampedValue1 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[586u] + 0.5))), int(1u), int(9u)));
                        bool conditionValue5 = !comparisonValue114;
                        uint comparisonValue126 = (comparisonValue114 ? 1u : clampedValue1) >> 1u;
                        float scalarValue112 = rdDot4Precise2(fragmentVectorConstants1.packedValues[92u], vec4(1.0));
                        float intermediateValue180;
                        intermediateValue180 = 0.0;
                        uint sumValue56;
                        float intermediateValue181;
                        uint scalarValue26 = 0u;
                        for (;;)
                        {
                            if ((conditionValue5 && (int(clampedValue1) <= int(scalarValue26))) || (comparisonValue114 && (int(scalarValue26) >= int(1u))))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                            intermediateValue105 = quotientValue20;
                            intermediateValue106 = quotientValue21;
                            intermediateValue108 = intermediateValue187;
                            continue;
                        }
                        sumValue14 = scalarValue8 + 1u;
                        intermediateValue104 = intermediateValue105;
                        intermediateValue79 = intermediateValue106;
                        scalarValue7 = intermediateValue108;
                        scalarValue8 = sumValue14;
                        continue;
                    }
                    float intermediateValue188;
                    if (int(uint(int(fragmentScalarConstants1.packedValues[224u]))) > int(0u))
                    {
                        float multiplyAddValue293 = fma(fma(fragmentVectorConstants1.packedValues[145u].x, multiplyAddValue278, fma(fragmentVectorConstants1.packedValues[143u].x, multiplyAddValue276, multiplyAddValue277 * fragmentVectorConstants1.packedValues[144u].x)) + fragmentVectorConstants1.packedValues[146u].x, 0.5, 0.5) * fragmentScalarConstants1.packedValues[225u];
                        float multiplyAddValue294 = (1.0 - fma(fma(fragmentVectorConstants1.packedValues[145u].y, multiplyAddValue278, fma(fragmentVectorConstants1.packedValues[143u].y, multiplyAddValue276, multiplyAddValue277 * fragmentVectorConstants1.packedValues[144u].y)) + fragmentVectorConstants1.packedValues[146u].y, 0.5, 0.5)) * fragmentScalarConstants1.packedValues[225u];
                        float comparisonValue30;
                        if ((((multiplyAddValue293 >= 0.0) && (multiplyAddValue293 < fragmentScalarConstants1.packedValues[225u])) && (multiplyAddValue294 >= 0.0)) && (multiplyAddValue294 < fragmentScalarConstants1.packedValues[225u]))
                        {
                            float scalarValue231 = spvNMin(spvNMax(scalarValue212, fragmentScalarConstants1.packedValues[316u]), 1.0);
                            float multiplyAddValue295 = spvNMin((fma(fragmentVectorConstants1.packedValues[145u].z, multiplyAddValue278, fma(fragmentVectorConstants1.packedValues[143u].z, multiplyAddValue276, multiplyAddValue277 * fragmentVectorConstants1.packedValues[144u].z)) + fragmentVectorConstants1.packedValues[146u].z) - fma(fragmentScalarConstants1.packedValues[194u], sqrt(fma(-scalarValue231, scalarValue231, 1.0)) / scalarValue231, fragmentScalarConstants1.packedValues[193u]), 1.0);
                            bool conditionValue21 = !comparisonValue182;
                            float scalarValue232 = rdDot4Precise2(fragmentVectorConstants1.packedValues[94u], vec4(1.0));
                            float sumValue222 = scalarValue232 + 1.0;
                            uint comparisonValue189 = comparisonValue182 ? 0u : 4294967295u;
                            float intermediateValue224;
                            intermediateValue224 = 0.0;
                            uint sumValue45;
                            float intermediateValue225;
                            uint scalarValue20 = 0u;
                            for (;;)
                            {
                                if (((int(scalarValue20) >= int(2u)) && conditionValue21) || (comparisonValue182 && (int(scalarValue20) >= int(1u))))
                                {
                                    break;
                                }
                                float sumValue223 = rdSignedBitsToFloat2(comparisonValue189 + scalarValue20);
                                float sumValue224 = sumValue223 + 0.5;
                                intermediateValue225 = intermediateValue224;
                                uint sumValue96;
                                float sampledTextureValue12;
                                uint scalarValue25 = 0u;
                                for (;;)
                                {
                                    if ((comparisonValue182 && (int(scalarValue25) >= int(1u))) || (conditionValue21 && (int(scalarValue25) >= int(2u))))
                                    {
                                        break;
                                    }
                                    float sumValue225 = rdSignedBitsToFloat2(comparisonValue189 + scalarValue25);
                                    float multiplyAddValue296 = fma((sumValue225 + 0.5) * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue293);
                                    float multiplyAddValue297 = fma(sumValue224 * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue294);
                                    if (comparisonValue182)
                                    {
                                        sampledTextureValue12 = (textureLod(sampler2DArray(materialTexture6, textureSampler6), vec3(multiplyAddValue296, multiplyAddValue297, sumValue222), 0.0).x >= multiplyAddValue295) ? (intermediateValue225 + 1.0) : intermediateValue225;
                                    }
                                    else
                                    {
                                        vec4 sampledTextureValue69 = textureGather(sampler2DArray(materialTexture6, textureSampler6), vec3(multiplyAddValue296, multiplyAddValue297, sumValue222));
                                        float multiplyAddValue298 = fract(fma(multiplyAddValue296, fragmentScalarConstants1.packedValues[694u], 0.5));
                                        bool comparisonValue190 = sampledTextureValue69.x >= multiplyAddValue295;
                                        bool comparisonValue191 = sampledTextureValue69.w >= multiplyAddValue295;
                                        float comparisonValue192 = float(sampledTextureValue69.y >= multiplyAddValue295);
                                        float comparisonValue193 = float(sampledTextureValue69.z >= multiplyAddValue295);
                                        float multiplyAddValue299 = fma(multiplyAddValue298, comparisonValue191 ? (comparisonValue193 - 1.0) : comparisonValue193, float(comparisonValue191));
                                        sampledTextureValue12 = intermediateValue225 + fma(fract(fma(multiplyAddValue297, fragmentScalarConstants1.packedValues[694u], 0.5)), fma(multiplyAddValue298, comparisonValue190 ? (comparisonValue192 - 1.0) : comparisonValue192, float(comparisonValue190)) - multiplyAddValue299, multiplyAddValue299);
                                    }
                                    sumValue96 = scalarValue25 + 1u;
                                    intermediateValue225 = sampledTextureValue12;
                                    scalarValue25 = sumValue96;
                                    continue;
                                }
                                sumValue45 = scalarValue20 + 1u;
                                intermediateValue224 = intermediateValue225;
                                scalarValue20 = sumValue45;
                                continue;
                            }
                            comparisonValue30 = intermediateValue224 / (comparisonValue182 ? 1.0 : 4.0);
                        }
                        else
                        {
                            comparisonValue30 = 1.0;
                        }
                        intermediateValue188 = comparisonValue30;
                    }
                    else
                    {
                        intermediateValue188 = 1.0;
                    }
                    float comparisonValue33;
                    if ((int(uint(int(fragmentScalarConstants1.packedValues[548u]))) > int(0u)) && (int(uint(int(fragmentScalarConstants1.packedValues[313u]))) > int(0u)))
                    {
                        float multiplyAddValue300 = fma(fragmentVectorConstants1.packedValues[135u].w, multiplyAddValue278, fma(fragmentVectorConstants1.packedValues[133u].w, multiplyAddValue276, multiplyAddValue277 * fragmentVectorConstants1.packedValues[134u].w)) + fragmentVectorConstants1.packedValues[136u].w;
                        float scalarValue233 = spvNMin(spvNMax(scalarValue212, fragmentScalarConstants1.packedValues[316u]), 1.0);
                        float multiplyAddValue301 = ((fma(fragmentVectorConstants1.packedValues[135u].z, multiplyAddValue278, fma(fragmentVectorConstants1.packedValues[133u].z, multiplyAddValue276, multiplyAddValue277 * fragmentVectorConstants1.packedValues[134u].z)) + fragmentVectorConstants1.packedValues[136u].z) / multiplyAddValue300) - (fma(fragmentScalarConstants1.packedValues[194u], sqrt(fma(-scalarValue233, scalarValue233, 1.0)) / scalarValue233, fragmentScalarConstants1.packedValues[193u]) / (multiplyAddValue300 / multiplyAddValue300));
                        float multiplyAddValue302 = fma((fma(fragmentVectorConstants1.packedValues[135u].x, multiplyAddValue278, fma(fragmentVectorConstants1.packedValues[133u].x, multiplyAddValue276, multiplyAddValue277 * fragmentVectorConstants1.packedValues[134u].x)) + fragmentVectorConstants1.packedValues[136u].x) / multiplyAddValue300, 0.5, 0.5);
                        float multiplyAddValue303 = 1.0 - fma((fma(fragmentVectorConstants1.packedValues[135u].y, multiplyAddValue278, fma(fragmentVectorConstants1.packedValues[133u].y, multiplyAddValue276, multiplyAddValue277 * fragmentVectorConstants1.packedValues[134u].y)) + fragmentVectorConstants1.packedValues[136u].y) / multiplyAddValue300, 0.5, 0.5);
                        uint clampedValue3 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[598u] + 0.5))), int(1u), int(9u)));
                        bool conditionValue22 = !comparisonValue182;
                        uint comparisonValue194 = (comparisonValue182 ? 1u : clampedValue3) >> 1u;
                        float scalarValue234 = rdDot4Precise2(fragmentVectorConstants1.packedValues[94u], vec4(1.0));
                        float intermediateValue227;
                        intermediateValue227 = 0.0;
                        uint sumValue46;
                        float intermediateValue228;
                        uint scalarValue26 = 0u;
                        for (;;)
                        {
                            if ((comparisonValue182 && (int(scalarValue26) >= int(1u))) || (conditionValue22 && (int(clampedValue3) <= int(scalarValue26))))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        }
                        branchMergedValue48 = (((intermediateValue157 * productValue135) + (intermediateValue154 * productValue134)) + (intermediateValue163 * productValue136)) + (intermediateValue169 * productValue137);
                        branchMergedValue50 = (((intermediateValue161 * productValue135) + (intermediateValue156 * productValue134)) + (intermediateValue167 * productValue136)) + (intermediateValue171 * productValue137);
                        branchMergedValue51 = (((intermediateValue159 * productValue135) + (intermediateValue155 * productValue134)) + (intermediateValue165 * productValue136)) + (intermediateValue170 * productValue137);
                    }
                    else
                    {
                        float intermediateValue173;
                        float intermediateValue174;
                        float intermediateValue175;
                        float intermediateValue176;
                        float intermediateValue178;
                        float intermediateValue180;
                        float intermediateValue182;
                        float intermediateValue184;
                        float intermediateValue186;
                        float intermediateValue188;
                        float intermediateValue189;
                        float intermediateValue190;
                        float intermediateValue77;
                        float intermediateValue78;
                        float intermediateValue79;
                        uint intermediateValue80;
                        uint intermediateValue81;
                        uint intermediateValue82;
                        float intermediateValue85;
                        float sumValue53;
                        float sumValue54;
                        float sumValue55;
                        float sumValue56;
                        float sumValue57;
                        float sumValue58;
                        bool comparisonValue17;
                        uint productValue138;
                        uint productValue139;
                        uint productValue140;
                        uint productValue141;
                        uint productValue142;
                        uint productValue143;
                        for (;;)
                        {
                            intermediateValue77 = floor(sumValue36);
                            intermediateValue78 = floor(sumValue47);
                            intermediateValue79 = floor(sumValue48);
                            float sumValue102 = sumValue36 - intermediateValue77;
                            float sumValue109 = sumValue47 - intermediateValue78;
                            float sumValue111 = sumValue48 - intermediateValue79;
                            uint comparisonValue97 = ((uint(sumValue109 >= sumValue111) << 1u) | uint(sumValue102 >= sumValue109)) | (uint(sumValue102 >= sumValue111) << 2u);
                            intermediateValue80 = uint(intermediateValue77);
                            intermediateValue81 = uint(intermediateValue78);
                            intermediateValue82 = uint(intermediateValue79);
                            float scalarValue40 = spvNMin(sumValue102, sumValue109);
                            float scalarValue41 = spvNMax(sumValue102, sumValue109);
                            intermediateValue85 = spvNMin(scalarValue40, sumValue111);
                            float scalarValue42 = spvNMax(scalarValue41, sumValue111);
                            float scalarValue43 = spvNMax(spvNMin(scalarValue41, sumValue111), scalarValue40);
                            sumValue53 = 1.0 - scalarValue42;
                            sumValue54 = scalarValue42 - scalarValue43;
                            sumValue55 = scalarValue43 - intermediateValue85;
                            sumValue56 = intermediateValue77 + 1.0;
                            sumValue57 = intermediateValue78 + 1.0;
                            sumValue58 = intermediateValue79 + 1.0;
                            comparisonValue17 = (((intermediateValue77 >= 0.0) && (intermediateValue78 >= 0.0)) && (intermediateValue79 >= 0.0)) && (((sumValue56 < 16.0) && (sumValue57 < 16.0)) && (sumValue58 < 16.0));
                            productValue138 = 0u + (comparisonValue97 * 3u);
                            productValue139 = 1u + (comparisonValue97 * 3u);
                            productValue140 = 2u + (comparisonValue97 * 3u);
                            productValue141 = 0u + (comparisonValue97 * 3u);
                            productValue142 = 1u + (comparisonValue97 * 3u);
                            productValue143 = 2u + (comparisonValue97 * 3u);
                            if (comparisonValue17)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                            float scalarValue363 = sampledTextureValue83.w;
                            float productValue507 = scalarValue363 * scalarValue363;
                            float branchMergedValue3;
                            float branchMergedValue10;
                            float branchMergedValue11;
                            float branchMergedValue12;
                            float branchMergedValue13;
                            if (!(productValue209 >= productValue507))
                            {
                                float intermediateValue162;
                                float intermediateValue164;
                                if (fragmentVectorConstants1.packedValues[78u].z != 0.0)
                                {
                                    uint productValue508 = (sampledTextureValue10 * 32u) + 8u;
                                    vec4 sampledTextureValue84 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue508)).x, texelFetch(zLights, int(productValue508 + 1u)).x, texelFetch(zLights, int(productValue508 + 2u)).x, texelFetch(zLights, int(productValue508 + 3u)).x));
                                    uint productValue509 = (sampledTextureValue10 * 32u) + 12u;
                                    vec4 sampledTextureValue85 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue509)).x, texelFetch(zLights, int(productValue509 + 1u)).x, texelFetch(zLights, int(productValue509 + 2u)).x, texelFetch(zLights, int(productValue509 + 3u)).x));
                                    uint productValue510 = (sampledTextureValue10 * 32u) + 16u;
                                    vec4 sampledTextureValue86 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue510)).x, texelFetch(zLights, int(productValue510 + 1u)).x, texelFetch(zLights, int(productValue510 + 2u)).x, texelFetch(zLights, int(productValue510 + 3u)).x));
                                    uint productValue511 = (sampledTextureValue10 * 32u) + 20u;
                                    vec4 sampledTextureValue87 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue511)).x, texelFetch(zLights, int(productValue511 + 1u)).x, texelFetch(zLights, int(productValue511 + 2u)).x, texelFetch(zLights, int(productValue511 + 3u)).x));
                                    uint productValue512 = (sampledTextureValue10 * 32u) + 24u;
                                    vec4 sampledTextureValue88 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue512)).x, texelFetch(zLights, int(productValue512 + 1u)).x, texelFetch(zLights, int(productValue512 + 2u)).x, texelFetch(zLights, int(productValue512 + 3u)).x));
                                    uint productValue513 = (sampledTextureValue10 * 32u) + 28u;
                                    vec4 sampledTextureValue89 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue513)).x, texelFetch(zLights, int(productValue513 + 1u)).x, texelFetch(zLights, int(productValue513 + 2u)).x, texelFetch(zLights, int(productValue513 + 3u)).x));
                                    float sumValue319 = comparisonValue274 - scalarValue359;
                                    float sumValue320 = comparisonValue275 - scalarValue360;
                                    float sumValue321 = comparisonValue276 - scalarValue361;
                                    float scalarValue364 = abs(sumValue319);
                                    float scalarValue365 = abs(sumValue320);
                                    float scalarValue366 = abs(sumValue321);
                                    uint comparisonValue57;
                                    if ((scalarValue364 >= scalarValue365) && (scalarValue364 >= scalarValue366))
                                    {
                                        comparisonValue57 = uint(!(sumValue319 >= 0.0));
                                    }
                                    else
                                    {
                                        uint branchMergedValue24;
                                        if (!(scalarValue365 >= scalarValue366))
                                        {
                                            branchMergedValue24 = (sumValue321 >= 0.0) ? 4u : 5u;
                                        }
                                        else
                                        {
                                            branchMergedValue24 = (sumValue320 >= 0.0) ? 2u : 3u;
                                        }
                                        comparisonValue57 = branchMergedValue24;
                                    }
                                    float sumValue322 = (-0.0) - sumValue319;
                                    float intermediateValue237;
                                    float intermediateValue238;
                                    float intermediateValue239;
                                    float intermediateValue240;
                                    float sumValue127;
                                    float intermediateValue241;
                                    float intermediateValue242;
                                    if (comparisonValue57 == 1u)
                                    {
                                        intermediateValue237 = sampledTextureValue85.x;
                                        intermediateValue238 = sampledTextureValue85.y;
                                        intermediateValue239 = sampledTextureValue85.z;
                                        intermediateValue240 = sampledTextureValue85.w;
                                        sumValue127 = (-0.0) - sumValue321;
                                        intermediateValue241 = sumValue320;
                                        intermediateValue242 = sumValue319;
                                    }
                                    else
                                    {
                                        float branchMergedValue25;
                                        float branchMergedValue54;
                                        float branchMergedValue55;
                                        float branchMergedValue56;
                                        float branchMergedValue57;
                                        float branchMergedValue58;
                                        float branchMergedValue59;
                                        if (comparisonValue57 == 2u)
                                        {
                                            branchMergedValue25 = (-0.0) - sumValue320;
                                            branchMergedValue54 = (-0.0) - sumValue321;
                                            branchMergedValue55 = sumValue322;
                                            branchMergedValue56 = sampledTextureValue86.w;
                                            branchMergedValue57 = sampledTextureValue86.z;
                                            branchMergedValue58 = sampledTextureValue86.y;
                                            branchMergedValue59 = sampledTextureValue86.x;
                                        }
                                        else
                                        {
                                            float branchMergedValue72;
                                            float branchMergedValue74;
                                            float branchMergedValue75;
                                            float branchMergedValue76;
                                            float branchMergedValue77;
                                            float branchMergedValue78;
                                            float branchMergedValue79;
                                            if (comparisonValue57 == 3u)
                                            {
                                                branchMergedValue72 = sumValue320;
                                                branchMergedValue74 = sumValue321;
                                                branchMergedValue75 = sumValue322;
                                                branchMergedValue76 = sampledTextureValue87.w;
                                                branchMergedValue77 = sampledTextureValue87.z;
                                                branchMergedValue78 = sampledTextureValue87.y;
                                                branchMergedValue79 = sampledTextureValue87.x;
                                            }
                                            else
                                            {
                                                float branchMergedValue84;
                                                float branchMergedValue85;
                                                float branchMergedValue86;
                                                float branchMergedValue87;
                                                float branchMergedValue88;
                                                float branchMergedValue89;
                                                float branchMergedValue90;
                                                if (comparisonValue57 == 4u)
                                                {
                                                    branchMergedValue84 = (-0.0) - sumValue321;
                                                    branchMergedValue85 = sumValue320;
                                                    branchMergedValue86 = sumValue322;
                                                    branchMergedValue87 = sampledTextureValue88.w;
                                                    branchMergedValue88 = sampledTextureValue88.z;
                                                    branchMergedValue89 = sampledTextureValue88.y;
                                                    branchMergedValue90 = sampledTextureValue88.x;
                                                }
                                                else
                                                {
                                                    bool comparisonValue277 = comparisonValue57 == 5u;
                                                    branchMergedValue84 = comparisonValue277 ? sumValue321 : sumValue322;
                                                    branchMergedValue85 = sumValue320;
                                                    branchMergedValue86 = comparisonValue277 ? sumValue319 : sumValue321;
                                                    branchMergedValue87 = comparisonValue277 ? sampledTextureValue89.w : sampledTextureValue84.w;
                                                    branchMergedValue88 = comparisonValue277 ? sampledTextureValue89.z : sampledTextureValue84.z;
                                                    branchMergedValue89 = comparisonValue277 ? sampledTextureValue89.y : sampledTextureValue84.y;
                                                    branchMergedValue90 = comparisonValue277 ? sampledTextureValue89.x : sampledTextureValue84.x;
                                                }
                                                branchMergedValue72 = branchMergedValue84;
                                                branchMergedValue74 = branchMergedValue85;
                                                branchMergedValue75 = branchMergedValue86;
                                                branchMergedValue76 = branchMergedValue87;
                                                branchMergedValue77 = branchMergedValue88;
                                                branchMergedValue78 = branchMergedValue89;
                                                branchMergedValue79 = branchMergedValue90;
                                            }
                                            branchMergedValue25 = branchMergedValue72;
                                            branchMergedValue54 = branchMergedValue74;
                                            branchMergedValue55 = branchMergedValue75;
                                            branchMergedValue56 = branchMergedValue76;
                                            branchMergedValue57 = branchMergedValue77;
                                            branchMergedValue58 = branchMergedValue78;
                                            branchMergedValue59 = branchMergedValue79;
                                        }
                                        intermediateValue237 = branchMergedValue59;
                                        intermediateValue238 = branchMergedValue58;
                                        intermediateValue239 = branchMergedValue57;
                                        intermediateValue240 = branchMergedValue56;
                                        sumValue127 = branchMergedValue55;
                                        intermediateValue241 = branchMergedValue54;
                                        intermediateValue242 = branchMergedValue25;
                                    }
                                    float branchMergedValue21;
                                    float branchMergedValue35;
                                    if ((intermediateValue239 == 0.0) && (intermediateValue240 == 0.0))
                                    {
                                        branchMergedValue21 = 1.0;
                                        branchMergedValue35 = 0.0;
                                    }
                                    else
                                    {
                                        float multiplyAddValue441 = fma(fragmentVectorConstants1.packedValues[164u].w, intermediateValue242, fma(fragmentVectorConstants1.packedValues[163u].w, intermediateValue241, fragmentVectorConstants1.packedValues[162u].w * sumValue127)) + fragmentVectorConstants1.packedValues[165u].w;
                                        float inverseLengthValue42 = inversesqrt(dot(vec3(productValue3, productValue4, productValue5), vec3(productValue3, productValue4, productValue5)));
                                        float sumValue323 = (-0.0) - sumValue320;
                                        float sumValue324 = (-0.0) - sumValue321;
                                        float inverseLengthValue43 = inversesqrt(dot(vec3(sumValue322, sumValue323, sumValue324), vec3(sumValue322, sumValue323, sumValue324)));
                                        float dotProductValue31 = spvNMin(spvNMax(dot(vec3(inverseLengthValue43 * sumValue322, inverseLengthValue43 * sumValue323, inverseLengthValue43 * sumValue324), vec3(inverseLengthValue42 * productValue3, inverseLengthValue42 * productValue4, inverseLengthValue42 * productValue5)), fragmentVectorConstants1.packedValues[160u].x), 1.0);
                                        float sumValue325 = intermediateValue239 - intermediateValue237;
                                        float productValue514 = fragmentVectorConstants1.packedValues[167u].x * sumValue325;
                                        float multiplyAddValue442 = (fma(fragmentVectorConstants1.packedValues[164u].x, intermediateValue242, fma(fragmentVectorConstants1.packedValues[163u].x, intermediateValue241, fragmentVectorConstants1.packedValues[162u].x * sumValue127)) + fragmentVectorConstants1.packedValues[165u].x) / multiplyAddValue441;
                                        float multiplyAddValue443 = (fma(fragmentVectorConstants1.packedValues[164u].y, intermediateValue242, fma(fragmentVectorConstants1.packedValues[163u].y, intermediateValue241, fragmentVectorConstants1.packedValues[162u].y * sumValue127)) + fragmentVectorConstants1.packedValues[165u].y) / multiplyAddValue441;
                                        float quotientValue62 = 0.5 / fragmentVectorConstants1.packedValues[167u].x;
                                        float quotientValue63 = 0.5 / fragmentVectorConstants1.packedValues[167u].y;
                                        float sumValue326 = intermediateValue240 - intermediateValue238;
                                        float productValue515 = fragmentVectorConstants1.packedValues[167u].y * sumValue326;
                                        vec4 sampledTextureValue90 = textureLod(sampler2D(pointLightShadowTextureAtlasTexture, pointLightShadowTextureAtlasSampler), vec2(spvNMin(spvNMax((((floor(((multiplyAddValue442 * 0.5) + 0.5) * productValue514) + 0.5) / productValue514) * sumValue325) + intermediateValue237, quotientValue62 + intermediateValue237), intermediateValue239 - quotientValue62), spvNMin(spvNMax((((floor((0.5 - (multiplyAddValue443 * 0.5)) * productValue515) + 0.5) / productValue515) * sumValue326) + intermediateValue238, quotientValue63 + intermediateValue238), intermediateValue240 - quotientValue63)), 0.0);
                                        float scalarValue367 = sampledTextureValue90.x;
                                        float multiplyAddValue444 = float(scalarValue367 >= (((fma(fragmentVectorConstants1.packedValues[164u].z, intermediateValue242, fma(fragmentVectorConstants1.packedValues[163u].z, intermediateValue241, fragmentVectorConstants1.packedValues[162u].z * sumValue127)) + fragmentVectorConstants1.packedValues[165u].z) - ((fragmentVectorConstants1.packedValues[167u].z / spvNMax(productValue514, 1.0)) * (((sqrt(1.0 - (dotProductValue31 * dotProductValue31)) / dotProductValue31) * fragmentVectorConstants1.packedValues[169u].y) + fragmentVectorConstants1.packedValues[169u].x))) / multiplyAddValue441));
                                        float branchMergedValue71;
                                        float branchMergedValue73;
                                        if (productValue457 > 0.0)
                                        {
                                            float multiplyAddValue445 = fma(fragmentVectorConstants1.packedValues[158u].w, scalarValue367, fma(fragmentVectorConstants1.packedValues[157u].w, multiplyAddValue443, fragmentVectorConstants1.packedValues[156u].w * multiplyAddValue442)) + fragmentVectorConstants1.packedValues[159u].w;
                                            float multiplyAddValue446 = (fma(fragmentVectorConstants1.packedValues[158u].x, scalarValue367, fma(fragmentVectorConstants1.packedValues[157u].x, multiplyAddValue443, fragmentVectorConstants1.packedValues[156u].x * multiplyAddValue442)) + fragmentVectorConstants1.packedValues[159u].x) / multiplyAddValue445;
                                            float multiplyAddValue447 = (fma(fragmentVectorConstants1.packedValues[158u].y, scalarValue367, fma(fragmentVectorConstants1.packedValues[157u].y, multiplyAddValue443, fragmentVectorConstants1.packedValues[156u].y * multiplyAddValue442)) + fragmentVectorConstants1.packedValues[159u].y) / multiplyAddValue445;
                                            float multiplyAddValue448 = (fma(fragmentVectorConstants1.packedValues[158u].z, scalarValue367, fma(fragmentVectorConstants1.packedValues[157u].z, multiplyAddValue443, fragmentVectorConstants1.packedValues[156u].z * multiplyAddValue442)) + fragmentVectorConstants1.packedValues[159u].z) / multiplyAddValue445;
                                            float nonlinearValue16 = spvNClamp((sqrt(((intermediateValue241 * intermediateValue241) + (sumValue127 * sumValue127)) + (intermediateValue242 * intermediateValue242)) - sqrt(((multiplyAddValue447 * multiplyAddValue447) + (multiplyAddValue446 * multiplyAddValue446)) + (multiplyAddValue448 * multiplyAddValue448))) * fragmentVectorConstants1.packedValues[176u].z, 0.0, 1.0);
                                            branchMergedValue71 = 1.0 - ((nonlinearValue16 * nonlinearValue16) * (3.0 - (nonlinearValue16 * 2.0)));
                                            branchMergedValue73 = multiplyAddValue444;
                                        }
                                        else
                                        {
                                            branchMergedValue71 = 1.0;
                                            branchMergedValue73 = multiplyAddValue444;
                                        }
                                        branchMergedValue21 = branchMergedValue71;
                                        branchMergedValue35 = branchMergedValue73;
                                    }
                                    intermediateValue162 = branchMergedValue35;
                                    intermediateValue164 = branchMergedValue21;
                                }
                                else
                                {
                                    intermediateValue162 = 1.0;
                                    intermediateValue164 = 1.0;
                                }
                                uint productValue516 = (sampledTextureValue10 * 32u) + 4u;
                                vec4 sampledTextureValue91 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue516)).x, texelFetch(zLights, int(productValue516 + 1u)).x, texelFetch(zLights, int(productValue516 + 2u)).x, texelFetch(zLights, int(productValue516 + 3u)).x));
                                float quotientValue90 = productValue209 / (productValue507 + 9.9999997473787516355514526367188e-05);
                                float productValue517 = spvNClamp(1.0 - (quotientValue90 * quotientValue90), 0.0, 1.0);
                                float quotientValue91 = (productValue517 * productValue517) * (1.0 / spvNMax(productValue209, 0.100000001490116119384765625));
                                float productValue235;
                                if (fragmentVectorConstants1.packedValues[155u].x > 0.0)
                                {
                                    float quotientValue92 = spvNClamp(((1.0 - quotientValue91) - fragmentVectorConstants1.packedValues[154u].x) / (fragmentVectorConstants1.packedValues[154u].y - fragmentVectorConstants1.packedValues[154u].x), 0.0, 1.0);
                                    productValue235 = spvNClamp((((quotientValue92 * quotientValue92) * fragmentVectorConstants1.packedValues[154u].z) * (3.0 - (quotientValue92 * 2.0))) + fragmentVectorConstants1.packedValues[154u].w, 0.0, 1.0) * quotientValue91;
                                }
                                else
                                {
                                    productValue235 = quotientValue91;
                                }
                                float productValue518 = productValue235 * sampledTextureValue91.w;
                                branchMergedValue3 = intermediateValue164;
                                branchMergedValue10 = intermediateValue162;
                                branchMergedValue11 = productValue518 * sampledTextureValue91.z;
                                branchMergedValue12 = productValue518 * sampledTextureValue91.y;
                                branchMergedValue13 = productValue518 * sampledTextureValue91.x;
                            }
                            else
                            {
                                branchMergedValue3 = 1.0;
                                branchMergedValue10 = 1.0;
                                branchMergedValue11 = 0.0;
                                branchMergedValue12 = 0.0;
                                branchMergedValue13 = 0.0;
                            }
                            intermediateValue163 = branchMergedValue3;
                            intermediateValue161 = branchMergedValue10;
                            intermediateValue160 = branchMergedValue11;
                            intermediateValue159 = branchMergedValue12;
                            intermediateValue158 = branchMergedValue13;
                            float productValue519 = intermediateValue161 * quotientValue23;
                            float productValue520 = dotProductValue19 * intermediateValue163;
                            float productValue521 = sumValue299 * 0.3183098733425140380859375;
                            float productValue522 = ((((productValue521 * exponentialValue) * intermediateValue158) * (productValue520 + (productValue519 * sumValue52))) * fragmentVectorConstants1.packedValues[142u].x) + scalarValue355;
                            float productValue523 = ((((productValue521 * exponentialValue1) * intermediateValue159) * (productValue520 + (productValue519 * sumValue53))) * fragmentVectorConstants1.packedValues[142u].x) + scalarValue356;
                            float productValue524 = ((((productValue521 * exponentialValue2) * intermediateValue160) * (productValue520 + (productValue519 * sumValue54))) * fragmentVectorConstants1.packedValues[142u].x) + scalarValue357;
                            float productValue525 = fragmentVectorConstants1.packedValues[142u].y * (intermediateValue161 * intermediateValue114);
                            float productValue526 = ((productValue525 * quotientValue25) * intermediateValue158) + scalarValue352;
                            float productValue527 = ((productValue525 * quotientValue26) * intermediateValue159) + scalarValue353;
                            float productValue528 = ((productValue525 * quotientValue27) * intermediateValue160) + scalarValue354;
                            uint sumValue327 = scalarValue358 + 1u;
                            if (int(sumValue327) < int(intermediateValue47))
                            {
                                scalarValue352 = productValue526;
                                scalarValue353 = productValue527;
                                scalarValue354 = productValue528;
                                scalarValue355 = productValue522;
                                scalarValue356 = productValue523;
                                scalarValue357 = productValue524;
                                scalarValue358 = sumValue327;
                                continue;
                            }
                            else
#endif
                            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                                uint bitwiseValue25 = intermediateValue82 << 4u;
                                uint sumValue112 = intermediateValue81 + bitwiseValue9;
                                uint bitwiseValue26 = sumValue112 + (intermediateValue80 << 8u);
                                uvec4 sampledTextureValue22 = texelFetch(voxelBuffer, int(bitwiseValue26 + bitwiseValue25));
                                uint scalarValue44 = sampledTextureValue22.x;
                                float bitwiseValue15;
                                float intermediateValue114;
                                float intermediateValue115;
                                if (scalarValue44 == 0u)
                                {
                                    bitwiseValue15 = 0.0;
                                    intermediateValue114 = 0.0;
                                    intermediateValue115 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue27 = float(scalarValue44 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue15 = bitwiseValue27 * float(scalarValue44 & 255u);
                                    intermediateValue114 = bitwiseValue27 * float((scalarValue44 >> 8u) & 255u);
                                    intermediateValue115 = bitwiseValue27 * float((scalarValue44 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue24 = texelFetch(voxelBuffer, int(((intermediateValue1[productValue139] + sumValue112) + ((intermediateValue1[productValue138] + intermediateValue80) << 8u)) + ((intermediateValue1[productValue140] + intermediateValue82) << 4u)));
                                uint scalarValue45 = sampledTextureValue24.x;
                                float bitwiseValue19;
                                float intermediateValue129;
                                float intermediateValue130;
                                if (scalarValue45 == 0u)
                                {
                                    bitwiseValue19 = 0.0;
                                    intermediateValue129 = 0.0;
                                    intermediateValue130 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue28 = float(scalarValue45 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue19 = bitwiseValue28 * float(scalarValue45 & 255u);
                                    intermediateValue129 = bitwiseValue28 * float((scalarValue45 >> 8u) & 255u);
                                    intermediateValue130 = bitwiseValue28 * float((scalarValue45 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue25 = texelFetch(voxelBuffer, int(((intermediateValue2[productValue142] + sumValue112) + ((intermediateValue2[productValue141] + intermediateValue80) << 8u)) + ((intermediateValue2[productValue143] + intermediateValue82) << 4u)));
                                uint scalarValue46 = sampledTextureValue25.x;
                                float bitwiseValue24;
                                float intermediateValue143;
                                float intermediateValue144;
                                if (scalarValue46 == 0u)
                                {
                                    bitwiseValue24 = 0.0;
                                    intermediateValue143 = 0.0;
                                    intermediateValue144 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue29 = float(scalarValue46 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue24 = bitwiseValue29 * float(scalarValue46 & 255u);
                                    intermediateValue143 = bitwiseValue29 * float((scalarValue46 >> 8u) & 255u);
                                    intermediateValue144 = bitwiseValue29 * float((scalarValue46 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue27 = texelFetch(voxelBuffer, int((bitwiseValue26 + 273u) + bitwiseValue25));
                                uint scalarValue47 = sampledTextureValue27.x;
                                float branchMergedValue16;
                                float branchMergedValue35;
                                float branchMergedValue36;
                                float branchMergedValue37;
                                float branchMergedValue38;
                                float branchMergedValue39;
                                float branchMergedValue40;
                                float branchMergedValue41;
                                float branchMergedValue42;
                                float branchMergedValue43;
                                float branchMergedValue46;
                                float branchMergedValue47;
                                if (scalarValue47 == 0u)
                                {
                                    branchMergedValue16 = intermediateValue130;
                                    branchMergedValue35 = bitwiseValue24;
                                    branchMergedValue36 = intermediateValue143;
                                    branchMergedValue37 = intermediateValue144;
                                    branchMergedValue38 = 0.0;
                                    branchMergedValue39 = 0.0;
                                    branchMergedValue40 = 0.0;
                                    branchMergedValue41 = bitwiseValue15;
                                    branchMergedValue42 = intermediateValue114;
                                    branchMergedValue43 = intermediateValue115;
                                    branchMergedValue46 = bitwiseValue19;
                                    branchMergedValue47 = intermediateValue129;
                                }
                                else
                                {
                                    float bitwiseValue30 = float(scalarValue47 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    branchMergedValue16 = intermediateValue130;
                                    branchMergedValue35 = bitwiseValue24;
                                    branchMergedValue36 = intermediateValue143;
                                    branchMergedValue37 = intermediateValue144;
                                    branchMergedValue38 = bitwiseValue30 * float(scalarValue47 & 255u);
                                    branchMergedValue39 = bitwiseValue30 * float((scalarValue47 >> 8u) & 255u);
                                    branchMergedValue40 = bitwiseValue30 * float((scalarValue47 >> 16u) & 255u);
                                    branchMergedValue41 = bitwiseValue15;
                                    branchMergedValue42 = intermediateValue114;
                                    branchMergedValue43 = intermediateValue115;
                                    branchMergedValue46 = bitwiseValue19;
                                    branchMergedValue47 = intermediateValue129;
                                }
                                intermediateValue173 = branchMergedValue41;
                                intermediateValue174 = branchMergedValue42;
                                intermediateValue175 = branchMergedValue43;
                                intermediateValue176 = branchMergedValue46;
                                intermediateValue178 = branchMergedValue47;
                                intermediateValue180 = branchMergedValue16;
                                intermediateValue182 = branchMergedValue35;
                                intermediateValue184 = branchMergedValue36;
                                intermediateValue186 = branchMergedValue37;
                                intermediateValue188 = branchMergedValue38;
                                intermediateValue189 = branchMergedValue39;
                                intermediateValue190 = branchMergedValue40;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                                intermediateValue62 = productValue526;
                                intermediateValue64 = productValue527;
                                intermediateValue66 = productValue528;
                                intermediateValue68 = productValue522;
                                intermediateValue70 = productValue523;
                                intermediateValue72 = productValue524;
#endif
                                break;
                            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                            float sumValue153 = rdSignedBitsToFloat2(scalarValue26 - comparisonValue126);
                            float sumValue154 = sumValue153 + 0.5;
                            intermediateValue181 = intermediateValue180;
                            uint sumValue78;
                            float sampledTextureValue12;
                            uint scalarValue113 = 0u;
                            for (;;)
                            {
                                if (((int(clampedValue1) <= int(scalarValue113)) && conditionValue5) || (comparisonValue114 && (int(scalarValue113) >= int(1u))))
                                {
                                    break;
                                }
                                float sumValue155 = rdSignedBitsToFloat2(scalarValue113 - comparisonValue126);
                                float multiplyAddValue148 = fma(multiplyAddValue146, fragmentScalarConstants1.packedValues[192u], ((sumValue155 + 0.5) * fragmentScalarConstants1.packedValues[624u]) * fragmentScalarConstants1.packedValues[192u]);
                                float multiplyAddValue149 = fma(multiplyAddValue147, fragmentScalarConstants1.packedValues[192u], (sumValue154 * fragmentScalarConstants1.packedValues[624u]) * fragmentScalarConstants1.packedValues[192u]);
                                if (comparisonValue114)
                                {
                                    sampledTextureValue12 = (textureLod(sampler2DArray(materialTexture6, textureSampler6), vec3(multiplyAddValue148, multiplyAddValue149, scalarValue112), 0.0).x >= multiplyAddValue145) ? (intermediateValue181 + 1.0) : intermediateValue181;
                                }
                                else
                                {
                                    vec4 sampledTextureValue57 = textureGather(sampler2DArray(materialTexture6, textureSampler6), vec3(multiplyAddValue148, multiplyAddValue149, scalarValue112));
                                    float multiplyAddValue150 = fract(fma(multiplyAddValue148, fragmentScalarConstants1.packedValues[626u], 0.5));
                                    bool comparisonValue127 = sampledTextureValue57.x >= multiplyAddValue145;
                                    bool comparisonValue128 = sampledTextureValue57.w >= multiplyAddValue145;
                                    float comparisonValue129 = float(sampledTextureValue57.y >= multiplyAddValue145);
                                    float comparisonValue130 = float(sampledTextureValue57.z >= multiplyAddValue145);
                                    float multiplyAddValue151 = fma(multiplyAddValue150, comparisonValue128 ? (comparisonValue130 - 1.0) : comparisonValue130, float(comparisonValue128));
                                    sampledTextureValue12 = intermediateValue181 + fma(fract(fma(multiplyAddValue149, fragmentScalarConstants1.packedValues[626u], 0.5)), fma(multiplyAddValue150, comparisonValue127 ? (comparisonValue129 - 1.0) : comparisonValue129, float(comparisonValue127)) - multiplyAddValue151, multiplyAddValue151);
                                }
                                sumValue78 = scalarValue113 + 1u;
                                intermediateValue181 = sampledTextureValue12;
                                scalarValue113 = sumValue78;
                                continue;
                            }
                            sumValue56 = scalarValue26 + 1u;
                            intermediateValue180 = intermediateValue181;
                            scalarValue26 = sumValue56;
                            continue;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                            float sumValue226 = rdSignedBitsToFloat2(scalarValue26 - comparisonValue194);
                            float sumValue227 = sumValue226 + 0.5;
                            intermediateValue228 = intermediateValue227;
                            uint sumValue97;
                            float sampledTextureValue13;
                            uint scalarValue113 = 0u;
                            for (;;)
                            {
                                if ((conditionValue22 && (int(clampedValue3) <= int(scalarValue113))) || (comparisonValue182 && (int(scalarValue113) >= int(1u))))
                                {
                                    break;
                                }
                                float sumValue228 = rdSignedBitsToFloat2(scalarValue113 - comparisonValue194);
                                float multiplyAddValue304 = fma(multiplyAddValue302, fragmentScalarConstants1.packedValues[192u], ((sumValue228 + 0.5) * fragmentScalarConstants1.packedValues[692u]) * fragmentScalarConstants1.packedValues[192u]);
                                float multiplyAddValue305 = fma(multiplyAddValue303, fragmentScalarConstants1.packedValues[192u], (sumValue227 * fragmentScalarConstants1.packedValues[692u]) * fragmentScalarConstants1.packedValues[192u]);
                                if (comparisonValue182)
                                {
                                    sampledTextureValue13 = (textureLod(sampler2DArray(materialTexture6, textureSampler6), vec3(multiplyAddValue304, multiplyAddValue305, scalarValue234), 0.0).x >= multiplyAddValue301) ? (intermediateValue228 + 1.0) : intermediateValue228;
                                }
                                else
                                {
                                    vec4 sampledTextureValue70 = textureGather(sampler2DArray(materialTexture6, textureSampler6), vec3(multiplyAddValue304, multiplyAddValue305, scalarValue234));
                                    float multiplyAddValue306 = fract(fma(multiplyAddValue304, fragmentScalarConstants1.packedValues[694u], 0.5));
                                    bool comparisonValue195 = sampledTextureValue70.x >= multiplyAddValue301;
                                    bool comparisonValue196 = sampledTextureValue70.w >= multiplyAddValue301;
                                    float comparisonValue197 = float(sampledTextureValue70.y >= multiplyAddValue301);
                                    float comparisonValue198 = float(sampledTextureValue70.z >= multiplyAddValue301);
                                    float multiplyAddValue307 = fma(multiplyAddValue306, comparisonValue196 ? (comparisonValue198 - 1.0) : comparisonValue198, float(comparisonValue196));
                                    sampledTextureValue13 = intermediateValue228 + fma(fract(fma(multiplyAddValue305, fragmentScalarConstants1.packedValues[694u], 0.5)), fma(multiplyAddValue306, comparisonValue195 ? (comparisonValue197 - 1.0) : comparisonValue197, float(comparisonValue195)) - multiplyAddValue307, multiplyAddValue307);
                                }
                                sumValue97 = scalarValue113 + 1u;
                                intermediateValue228 = sampledTextureValue13;
                                scalarValue113 = sumValue97;
                                continue;
                            }
                            sumValue46 = scalarValue26 + 1u;
                            intermediateValue227 = intermediateValue228;
                            scalarValue26 = sumValue46;
                            continue;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                            else
                            {
                                float intermediateValue132;
                                float intermediateValue133;
                                float intermediateValue134;
                                float sumValue70;
                                float sumValue71;
                                float sumValue72;
                                float sumValue73;
                                float sumValue74;
                                float sumValue75;
                                float sumValue76;
                                float sumValue77;
                                float sumValue78;
                                uint comparisonValue27;
                                bool comparisonValue28;
                                for (;;)
                                {
                                    sumValue70 = float(intermediateValue1[productValue138]) + intermediateValue77;
                                    sumValue71 = float(intermediateValue1[productValue139]) + intermediateValue78;
                                    sumValue72 = float(intermediateValue1[productValue140]) + intermediateValue79;
                                    sumValue73 = float(intermediateValue2[productValue141]) + intermediateValue77;
                                    sumValue74 = float(intermediateValue2[productValue142]) + intermediateValue78;
                                    sumValue75 = float(intermediateValue2[productValue143]) + intermediateValue79;
                                    sumValue76 = intermediateValue77 + productValue116;
                                    sumValue77 = intermediateValue78 + productValue117;
                                    sumValue78 = intermediateValue79 + productValue118;
                                    uint comparisonValue98 = ((((uint(intermediateValue77 >= 16.0) << 1u) | uint(intermediateValue77 < 0.0)) | (uint(intermediateValue78 < 0.0) << 2u)) | (uint(intermediateValue78 >= 16.0) << 3u)) | (uint(intermediateValue79 < 0.0) << 4u);
                                    comparisonValue27 = intermediateValue[comparisonValue98 | (uint(intermediateValue79 >= 16.0) << 5u)];
                                    comparisonValue28 = ((((comparisonValue98 | (uint(intermediateValue79 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue98 & 31u))) == 0u;
                                    uint sampledTextureValue23;
                                    if (comparisonValue28)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue27 & 31u))) == 0u)
                                        {
                                            intermediateValue132 = 0.0;
                                            intermediateValue133 = 0.0;
                                            intermediateValue134 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue23 = ((((uint(sumValue76 - (floor(sumValue76 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue77 - (floor(sumValue77 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue78 - (floor(sumValue78 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue27)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue23 = ((((intermediateValue80 << 8u) & 3840u) | (intermediateValue81 & 15u)) | ((intermediateValue82 << 4u) & 240u)) + bitwiseValue9;
                                    }
                                    uvec4 sampledTextureValue28 = texelFetch(voxelBuffer, int(sampledTextureValue23));
                                    uint scalarValue48 = sampledTextureValue28.x;
                                    if (scalarValue48 == 0u)
                                    {
                                        intermediateValue132 = 0.0;
                                        intermediateValue133 = 0.0;
                                        intermediateValue134 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue31 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue132 = bitwiseValue31 * float(scalarValue48 & 255u);
                                    intermediateValue133 = bitwiseValue31 * float((scalarValue48 >> 8u) & 255u);
                                    intermediateValue134 = bitwiseValue31 * float((scalarValue48 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue177;
                                float intermediateValue179;
                                float intermediateValue181;
                                float sumValue90;
                                float sumValue91;
                                float sumValue92;
                                uint comparisonValue39;
                                bool comparisonValue40;
                                for (;;)
                                {
                                    sumValue90 = sumValue70 + productValue116;
                                    sumValue91 = sumValue71 + productValue117;
                                    sumValue92 = sumValue72 + productValue118;
                                    uint comparisonValue99 = ((((uint(sumValue70 >= 16.0) << 1u) | uint(sumValue70 < 0.0)) | (uint(sumValue71 < 0.0) << 2u)) | (uint(sumValue71 >= 16.0) << 3u)) | (uint(sumValue72 < 0.0) << 4u);
                                    comparisonValue39 = intermediateValue[comparisonValue99 | (uint(sumValue72 >= 16.0) << 5u)];
                                    comparisonValue40 = ((((comparisonValue99 | (uint(sumValue72 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue99 & 31u))) == 0u;
                                    uint sampledTextureValue31;
                                    if (comparisonValue40)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue39 & 31u))) == 0u)
                                        {
                                            intermediateValue177 = 0.0;
                                            intermediateValue179 = 0.0;
                                            intermediateValue181 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue31 = ((((uint(sumValue90 - (floor(sumValue90 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue91 - (floor(sumValue91 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue92 - (floor(sumValue92 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue39)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue31 = ((((uint(sumValue70) << 8u) & 3840u) | (uint(sumValue71) & 15u)) | ((uint(sumValue72) << 4u) & 240u)) + bitwiseValue9;
                                    }
                                    uvec4 sampledTextureValue30 = texelFetch(voxelBuffer, int(sampledTextureValue31));
                                    uint scalarValue49 = sampledTextureValue30.x;
                                    if (scalarValue49 == 0u)
                                    {
                                        intermediateValue177 = 0.0;
                                        intermediateValue179 = 0.0;
                                        intermediateValue181 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue32 = float(scalarValue49 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue177 = bitwiseValue32 * float(scalarValue49 & 255u);
                                    intermediateValue179 = bitwiseValue32 * float((scalarValue49 >> 8u) & 255u);
                                    intermediateValue181 = bitwiseValue32 * float((scalarValue49 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue183;
                                float intermediateValue185;
                                float intermediateValue187;
                                float sumValue99;
                                float sumValue100;
                                float sumValue101;
                                uint comparisonValue49;
                                bool comparisonValue50;
                                for (;;)
                                {
                                    sumValue99 = sumValue73 + productValue116;
                                    sumValue100 = sumValue74 + productValue117;
                                    sumValue101 = sumValue75 + productValue118;
                                    uint comparisonValue100 = ((((uint(sumValue73 >= 16.0) << 1u) | uint(sumValue73 < 0.0)) | (uint(sumValue74 < 0.0) << 2u)) | (uint(sumValue74 >= 16.0) << 3u)) | (uint(sumValue75 < 0.0) << 4u);
                                    comparisonValue49 = intermediateValue[comparisonValue100 | (uint(sumValue75 >= 16.0) << 5u)];
                                    comparisonValue50 = ((((comparisonValue100 | (uint(sumValue75 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue100 & 31u))) == 0u;
                                    uint sampledTextureValue35;
                                    if (comparisonValue50)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue49 & 31u))) == 0u)
                                        {
                                            intermediateValue183 = 0.0;
                                            intermediateValue185 = 0.0;
                                            intermediateValue187 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue35 = ((((uint(sumValue99 - (floor(sumValue99 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue100 - (floor(sumValue100 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue101 - (floor(sumValue101 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue49)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue35 = ((((uint(sumValue73) << 8u) & 3840u) | (uint(sumValue74) & 15u)) | ((uint(sumValue75) << 4u) & 240u)) + bitwiseValue9;
                                    }
                                    uvec4 sampledTextureValue32 = texelFetch(voxelBuffer, int(sampledTextureValue35));
                                    uint scalarValue50 = sampledTextureValue32.x;
                                    if (scalarValue50 == 0u)
                                    {
                                        intermediateValue183 = 0.0;
                                        intermediateValue185 = 0.0;
                                        intermediateValue187 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue33 = float(scalarValue50 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue183 = bitwiseValue33 * float(scalarValue50 & 255u);
                                    intermediateValue185 = bitwiseValue33 * float((scalarValue50 >> 8u) & 255u);
                                    intermediateValue187 = bitwiseValue33 * float((scalarValue50 >> 16u) & 255u);
                                    break;
                                }
                                float sumValue113 = sumValue56 + productValue116;
                                float sumValue120 = sumValue57 + productValue117;
                                float sumValue121 = sumValue58 + productValue118;
                                uint comparisonValue101 = ((((uint(sumValue56 >= 16.0) << 1u) | uint(sumValue56 < 0.0)) | (uint(sumValue57 < 0.0) << 2u)) | (uint(sumValue57 >= 16.0) << 3u)) | (uint(sumValue58 < 0.0) << 4u);
                                uint comparisonValue102 = comparisonValue101 | (uint(sumValue58 >= 16.0) << 5u);
                                uint sampledTextureValue39;
                                if ((((comparisonValue102 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue101 & 31u))) == 0u)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (intermediateValue[comparisonValue102] & 31u))) == 0u)
                                    {
                                        intermediateValue173 = intermediateValue132;
                                        intermediateValue174 = intermediateValue133;
                                        intermediateValue175 = intermediateValue134;
                                        intermediateValue176 = intermediateValue177;
                                        intermediateValue178 = intermediateValue179;
                                        intermediateValue180 = intermediateValue181;
                                        intermediateValue182 = intermediateValue183;
                                        intermediateValue184 = intermediateValue185;
                                        intermediateValue186 = intermediateValue187;
                                        intermediateValue188 = 0.0;
                                        intermediateValue189 = 0.0;
                                        intermediateValue190 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue39 = ((((uint(sumValue113 - (floor(sumValue113 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue120 - (floor(sumValue120 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue121 - (floor(sumValue121 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue102])).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue39 = ((((uint(sumValue56) << 8u) & 3840u) | (uint(sumValue57) & 15u)) | ((uint(sumValue58) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uvec4 sampledTextureValue34 = texelFetch(voxelBuffer, int(sampledTextureValue39));
                                uint scalarValue51 = sampledTextureValue34.x;
                                if (scalarValue51 == 0u)
                                {
                                    intermediateValue173 = intermediateValue132;
                                    intermediateValue174 = intermediateValue133;
                                    intermediateValue175 = intermediateValue134;
                                    intermediateValue176 = intermediateValue177;
                                    intermediateValue178 = intermediateValue179;
                                    intermediateValue180 = intermediateValue181;
                                    intermediateValue182 = intermediateValue183;
                                    intermediateValue184 = intermediateValue185;
                                    intermediateValue186 = intermediateValue187;
                                    intermediateValue188 = 0.0;
                                    intermediateValue189 = 0.0;
                                    intermediateValue190 = 0.0;
                                    break;
                                }
                                float bitwiseValue34 = float(scalarValue51 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue173 = intermediateValue132;
                                intermediateValue174 = intermediateValue133;
                                intermediateValue175 = intermediateValue134;
                                intermediateValue176 = intermediateValue177;
                                intermediateValue178 = intermediateValue179;
                                intermediateValue180 = intermediateValue181;
                                intermediateValue182 = intermediateValue183;
                                intermediateValue184 = intermediateValue185;
                                intermediateValue186 = intermediateValue187;
                                intermediateValue188 = bitwiseValue34 * float(scalarValue51 & 255u);
                                intermediateValue189 = bitwiseValue34 * float((scalarValue51 >> 8u) & 255u);
                                intermediateValue190 = bitwiseValue34 * float((scalarValue51 >> 16u) & 255u);
                                break;
                            }
#endif
                        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                        float comparisonValue131 = rdSignedBitsToFloat2(comparisonValue114 ? 1u : (clampedValue1 * clampedValue1));
                        float quotientValue39 = intermediateValue180 / comparisonValue131;
                        comparisonValue28 = (quotientValue39 < 1.0) ? spvNMin(spvNMax(quotientValue39, 1.0 - fragmentScalarConstants1.packedValues[587u]), 1.0) : 1.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                        float comparisonValue199 = rdSignedBitsToFloat2(comparisonValue182 ? 1u : (clampedValue3 * clampedValue3));
                        float quotientValue58 = intermediateValue227 / comparisonValue199;
                        comparisonValue33 = (quotientValue58 < 1.0) ? spvNMin(spvNMax(quotientValue58, 1.0 - fragmentScalarConstants1.packedValues[599u]), 1.0) : 1.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        branchMergedValue48 = (((intermediateValue176 * sumValue54) + (intermediateValue173 * sumValue53)) + (intermediateValue182 * sumValue55)) + (intermediateValue188 * intermediateValue85);
                        branchMergedValue50 = (((intermediateValue180 * sumValue54) + (intermediateValue175 * sumValue53)) + (intermediateValue186 * sumValue55)) + (intermediateValue190 * intermediateValue85);
                        branchMergedValue51 = (((intermediateValue178 * sumValue54) + (intermediateValue174 * sumValue53)) + (intermediateValue184 * sumValue55)) + (intermediateValue189 * intermediateValue85);
                    }
                    branchMergedValue9 = branchMergedValue48;
                    branchMergedValue17 = branchMergedValue50;
                    branchMergedValue18 = branchMergedValue51;
                }
                else
                {
                    branchMergedValue9 = 0.0;
                    branchMergedValue17 = 0.0;
                    branchMergedValue18 = 0.0;
                }
                intermediateValue22 = branchMergedValue9;
                intermediateValue23 = branchMergedValue18;
                intermediateValue24 = branchMergedValue17;
            }
            else
            {
                intermediateValue22 = intermediateValue8;
                intermediateValue23 = productValue36;
                intermediateValue24 = productValue37;
            }
            float productValue125 = fragmentVectorConstants1.packedValues[125u].y * fragmentVectorConstants1.packedValues[125u].y;
            float productValue126 = productValue125 * productValue125;
            float productValue127 = (((fragmentVectorConstants1.packedValues[90u].y * (productValue125 - productValue126)) + productValue126) * fragmentVectorConstants1.packedValues[125u].y) * fragmentVectorConstants1.packedValues[157u].w;
            float productValue128 = fragmentVectorConstants1.packedValues[139u].w * sumValue6;
            float dotProductValue13 = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float productValue129 = (fragmentVectorConstants1.packedValues[139u].z * fragmentVectorConstants1.packedValues[128u].y) * fragmentVectorConstants1.packedValues[146u].x;
            productValue42 = (((dotProductValue13 - exponentialValue) * fragmentVectorConstants1.packedValues[146u].y) + exponentialValue) * productValue129;
            productValue43 = (((dotProductValue13 - exponentialValue1) * fragmentVectorConstants1.packedValues[146u].y) + exponentialValue1) * productValue129;
            productValue44 = (((dotProductValue13 - exponentialValue2) * fragmentVectorConstants1.packedValues[146u].y) + exponentialValue2) * productValue129;
            productValue45 = (spvNMax((productValue127 * fragmentVectorConstants1.packedValues[157u].x) + (fragmentVectorConstants1.packedValues[74u].w * intermediateValue22), fragmentVectorConstants1.packedValues[80u].x * fragmentVectorConstants1.packedValues[80u].w) * exponentialValue) * productValue128;
            productValue46 = (spvNMax((productValue127 * fragmentVectorConstants1.packedValues[157u].y) + (fragmentVectorConstants1.packedValues[74u].w * intermediateValue23), fragmentVectorConstants1.packedValues[80u].y * fragmentVectorConstants1.packedValues[80u].w) * exponentialValue1) * productValue128;
            productValue47 = (spvNMax((productValue127 * fragmentVectorConstants1.packedValues[157u].z) + (fragmentVectorConstants1.packedValues[74u].w * intermediateValue24), fragmentVectorConstants1.packedValues[80u].z * fragmentVectorConstants1.packedValues[80u].w) * exponentialValue2) * productValue128;
            intermediateValue10 = intermediateValue11;
            intermediateValue12 = intermediateValue13;
            intermediateValue14 = intermediateValue15;
            intermediateValue16 = intermediateValue17;
            intermediateValue18 = intermediateValue19;
            intermediateValue20 = intermediateValue21;
        }
        else
        {
            productValue42 = 0.0;
            productValue43 = 0.0;
            productValue44 = 0.0;
            productValue45 = 0.0;
            productValue46 = 0.0;
            productValue47 = 0.0;
            intermediateValue10 = 0.0;
            intermediateValue12 = 0.0;
            intermediateValue14 = 0.0;
            intermediateValue16 = 0.0;
            intermediateValue18 = 0.0;
            intermediateValue20 = 0.0;
        }
        float sumValue122 = ((productValue45 + productValue42) + intermediateValue10) + intermediateValue16;
        float sumValue123 = ((productValue46 + productValue43) + intermediateValue12) + intermediateValue18;
        float sumValue124 = ((productValue47 + productValue44) + intermediateValue14) + intermediateValue20;
        float sumValue125 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
        float sumValue126 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
        float sumValue128 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
        float inverseLengthValue9 = inversesqrt(dot(vec3(sumValue125, sumValue126, sumValue128), vec3(sumValue125, sumValue126, sumValue128)));
        float productValue130 = inverseLengthValue9 * sumValue125;
        float productValue144 = inverseLengthValue9 * sumValue126;
        float productValue145 = inverseLengthValue9 * sumValue128;
        bool comparisonValue103 = fragmentVectorConstants1.packedValues[86u].y != 0.0;
        bool comparisonValue104 = fragmentVectorConstants1.packedValues[139u].w != 0.0;
        float productValue51;
        float productValue52;
        float productValue53;
        if ((comparisonValue103 && (fragmentVectorConstants1.packedValues[86u].z != 0.0)) && comparisonValue104)
        {
            productValue51 = spvNMax(fragmentVectorConstants1.packedValues[74u].w + (fragmentVectorConstants1.packedValues[157u].x * fragmentVectorConstants1.packedValues[157u].w), fragmentVectorConstants1.packedValues[80u].x * fragmentVectorConstants1.packedValues[80u].w) * fragmentVectorConstants1.packedValues[86u].z;
            productValue52 = spvNMax(fragmentVectorConstants1.packedValues[74u].w + (fragmentVectorConstants1.packedValues[157u].y * fragmentVectorConstants1.packedValues[157u].w), fragmentVectorConstants1.packedValues[80u].y * fragmentVectorConstants1.packedValues[80u].w) * fragmentVectorConstants1.packedValues[86u].z;
            productValue53 = spvNMax(fragmentVectorConstants1.packedValues[74u].w + (fragmentVectorConstants1.packedValues[157u].z * fragmentVectorConstants1.packedValues[157u].w), fragmentVectorConstants1.packedValues[80u].z * fragmentVectorConstants1.packedValues[80u].w) * fragmentVectorConstants1.packedValues[86u].z;
        }
        else
        {
            productValue51 = 0.0;
            productValue52 = 0.0;
            productValue53 = 0.0;
        }
        bool comparisonValue105 = fragmentVectorConstants1.packedValues[164u].x != 0.0;
        bool comparisonValue106 = fragmentVectorConstants1.packedValues[86u].x != 0.0;
        float intermediateValue29;
        float intermediateValue30;
        float intermediateValue31;
        float intermediateValue32;
        if (comparisonValue106)
        {
            float quotientValue30 = spvNClamp(((fragmentVectorConstants1.packedValues[155u].x - fragmentVectorConstants1.packedValues[82u].x) + (nonlinearValue / fragmentVectorConstants1.packedValues[82u].z)) * fragmentVectorConstants1.packedValues[82u].y, 0.0, 1.0);
            float branchMergedValue10;
            float branchMergedValue19;
            float branchMergedValue20;
            float branchMergedValue21;
            if (quotientValue30 > 0.0)
            {
                float branchMergedValue49;
                float branchMergedValue52;
                float branchMergedValue53;
                float branchMergedValue54;
                if (comparisonValue103)
                {
                    branchMergedValue49 = fragmentVectorConstants1.packedValues[87u].x * spvNMax(productValue51, 1.0);
                    branchMergedValue52 = quotientValue30;
                    branchMergedValue53 = spvNMax(productValue53, 1.0) * fragmentVectorConstants1.packedValues[87u].z;
                    branchMergedValue54 = spvNMax(productValue52, 1.0) * fragmentVectorConstants1.packedValues[87u].y;
                }
                else
                {
                    float quotientValue31 = spvNClamp(((productValue144 - fragmentVectorConstants1.packedValues[148u].x) + fragmentVectorConstants1.packedValues[148u].w) / (fragmentVectorConstants1.packedValues[148u].z - fragmentVectorConstants1.packedValues[148u].x), 0.0, 1.0);
                    float productValue146 = 1.0 - ((quotientValue31 * quotientValue31) * (3.0 - (quotientValue31 * 2.0)));
                    float productValue147 = (productValue146 * productValue146) * productValue146;
                    float dotProductValue14 = dot(vec3(productValue130, productValue144, productValue145), vec3(fragmentVectorConstants1.packedValues[152u].xyz));
                    float dotProductValue15 = dot(vec3(productValue130, productValue144, productValue145), vec3(fragmentVectorConstants1.packedValues[91u].xyz));
                    float sumValue129 = fragmentVectorConstants1.packedValues[148u].x - fragmentVectorConstants1.packedValues[148u].w;
                    float quotientValue32 = spvNClamp((productValue144 - sumValue129) / (fragmentVectorConstants1.packedValues[148u].y - sumValue129), 0.0, 1.0);
                    float productValue148 = 1.0 - ((quotientValue32 * quotientValue32) * (3.0 - (quotientValue32 * 2.0)));
                    float productValue149 = (productValue148 * productValue148) * productValue148;
                    float productValue150 = (fragmentVectorConstants1.packedValues[83u].x * 0.75) * ((((dotProductValue15 * dotProductValue15) + 1.0) * fragmentVectorConstants1.packedValues[150u].w) + (((dotProductValue14 * dotProductValue14) + 1.0) * fragmentVectorConstants1.packedValues[160u].w));
                    float exponentialValue3 = spvNClamp(exp2(log2(spvNMax(dotProductValue14, 0.0)) * fragmentVectorConstants1.packedValues[83u].w), 0.0, 1.0);
                    float exponentialValue4 = spvNClamp(exp2(log2(spvNMax(dotProductValue15, 0.0)) * fragmentVectorConstants1.packedValues[83u].w), 0.0, 1.0);
                    float productValue151 = 1.809999942779541015625 - (exponentialValue3 * 1.7999999523162841796875);
                    float nonlinearValue3 = 0.036100022494792938232421875 / (sqrt(productValue151) * productValue151);
                    float productValue152 = 1.809999942779541015625 - (exponentialValue4 * 1.7999999523162841796875);
                    float nonlinearValue4 = 0.036100022494792938232421875 / (sqrt(productValue152) * productValue152);
                    float productValue153 = exponentialValue3 * (fragmentVectorConstants1.packedValues[83u].y * fragmentVectorConstants1.packedValues[160u].w);
                    float productValue154 = exponentialValue4 * (fragmentVectorConstants1.packedValues[83u].z * fragmentVectorConstants1.packedValues[150u].w);
                    float productValue155 = (((productValue147 * fragmentVectorConstants1.packedValues[158u].x) * (((productValue154 * fragmentVectorConstants1.packedValues[150u].x) * nonlinearValue4) + ((productValue153 * fragmentVectorConstants1.packedValues[160u].x) * nonlinearValue3))) + (((productValue149 * (fragmentVectorConstants1.packedValues[158u].x - fragmentVectorConstants1.packedValues[84u].x)) + fragmentVectorConstants1.packedValues[84u].x) * productValue150)) * 0.079577468335628509521484375;
                    float productValue156 = (((productValue147 * fragmentVectorConstants1.packedValues[158u].y) * (((productValue154 * fragmentVectorConstants1.packedValues[150u].y) * nonlinearValue4) + ((productValue153 * fragmentVectorConstants1.packedValues[160u].y) * nonlinearValue3))) + (((productValue149 * (fragmentVectorConstants1.packedValues[158u].y - fragmentVectorConstants1.packedValues[84u].y)) + fragmentVectorConstants1.packedValues[84u].y) * productValue150)) * 0.079577468335628509521484375;
                    float productValue157 = (((productValue147 * fragmentVectorConstants1.packedValues[158u].z) * (((productValue154 * fragmentVectorConstants1.packedValues[150u].z) * nonlinearValue4) + ((productValue153 * fragmentVectorConstants1.packedValues[160u].z) * nonlinearValue3))) + (((productValue149 * (fragmentVectorConstants1.packedValues[158u].z - fragmentVectorConstants1.packedValues[84u].z)) + fragmentVectorConstants1.packedValues[84u].z) * productValue150)) * 0.079577468335628509521484375;
                    float branchMergedValue55;
                    float branchMergedValue56;
                    float branchMergedValue57;
                    float branchMergedValue58;
                    if (fragmentVectorConstants1.packedValues[86u].w != 0.0)
                    {
                        float scalarValue52 = spvNMax(fragmentVectorConstants1.packedValues[89u].y, fragmentVectorConstants1.packedValues[125u].y);
                        branchMergedValue55 = ((productValue155 - fragmentVectorConstants1.packedValues[161u].x) * scalarValue52) + fragmentVectorConstants1.packedValues[161u].x;
                        branchMergedValue56 = quotientValue30;
                        branchMergedValue57 = ((productValue157 - fragmentVectorConstants1.packedValues[161u].z) * scalarValue52) + fragmentVectorConstants1.packedValues[161u].z;
                        branchMergedValue58 = ((productValue156 - fragmentVectorConstants1.packedValues[161u].y) * scalarValue52) + fragmentVectorConstants1.packedValues[161u].y;
#endif
                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    else
                    {
                        comparisonValue28 = 1.0;
                    }
                    float scalarValue114 = spvNMin(spvNMin(comparisonValue28, intermediateValue152), intermediateValue100);
                    float productValue258 = spvNMax(fragmentScalarConstants1.packedValues[625u] - spvNMin(fragmentScalarConstants1.packedValues[625u] * 0.100000001490116119384765625, 8.0), 0.0);
                    float quotientValue40 = spvNClamp((-(productValue258 + multiplyAddValue68)) * (1.0 / (fragmentScalarConstants1.packedValues[625u] - productValue258)), 0.0, 1.0);
                    multiplyAddValue56 = fma((quotientValue40 * quotientValue40) * fma(quotientValue40, -2.0, 3.0), 1.0 - scalarValue114, scalarValue114);
                    intermediateValue71 = intermediateValue72;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    else
                    {
                        comparisonValue33 = 1.0;
                    }
                    float scalarValue235 = spvNMin(spvNMin(comparisonValue33, intermediateValue188), intermediateValue104);
                    float productValue352 = spvNMax(fragmentScalarConstants1.packedValues[693u] - spvNMin(fragmentScalarConstants1.packedValues[693u] * 0.100000001490116119384765625, 8.0), 0.0);
                    float quotientValue59 = spvNClamp((-(productValue352 + multiplyAddValue68)) * (1.0 / (fragmentScalarConstants1.packedValues[693u] - productValue352)), 0.0, 1.0);
                    multiplyAddValue62 = fma((quotientValue59 * quotientValue59) * fma(quotientValue59, -2.0, 3.0), 1.0 - scalarValue235, scalarValue235);
                    intermediateValue78 = intermediateValue79;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    else
                    {
                        branchMergedValue55 = productValue155;
                        branchMergedValue56 = quotientValue30;
                        branchMergedValue57 = productValue157;
                        branchMergedValue58 = productValue156;
                    }
                    branchMergedValue49 = branchMergedValue55;
                    branchMergedValue52 = branchMergedValue56;
                    branchMergedValue53 = branchMergedValue57;
                    branchMergedValue54 = branchMergedValue58;
                }
                branchMergedValue10 = branchMergedValue49;
                branchMergedValue19 = branchMergedValue52;
                branchMergedValue20 = branchMergedValue53;
                branchMergedValue21 = branchMergedValue54;
            }
            else
            {
                branchMergedValue10 = 0.0;
                branchMergedValue19 = quotientValue30;
                branchMergedValue20 = 0.0;
                branchMergedValue21 = 0.0;
            }
            intermediateValue29 = branchMergedValue19;
            intermediateValue30 = branchMergedValue10;
            intermediateValue31 = branchMergedValue21;
            intermediateValue32 = branchMergedValue20;
        }
        else
        {
            intermediateValue29 = 0.0;
            intermediateValue30 = 0.0;
            intermediateValue31 = 0.0;
            intermediateValue32 = 0.0;
        }
        float productValue101;
        float productValue102;
        float productValue103;
        float productValue104;
        if (comparisonValue105)
        {
            float productValue158 = (multiplyAddValue9 + 1.0) * 0.5;
            float productValue159 = (multiplyAddValue10 + 1.0) * 0.5;
            uint scalarValue53 = uint(int(fragmentVectorConstants1.packedValues[162u].z));
            float multiplyAddValue31 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue11, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue10, multiplyAddValue9 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue11, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue10, multiplyAddValue9 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[163u].x) / (fragmentVectorConstants1.packedValues[163u].y - fragmentVectorConstants1.packedValues[163u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue53))) + (-0.5);
            uint sumValue130 = uint(min(int(uint(max(int(uint(int(multiplyAddValue31))), int(0u)))), int(scalarValue53 + 4294967294u)));
            float scalarValue54 = float(int(sumValue130));
            float sumValue131 = spvNMin(spvNMax(multiplyAddValue31 - scalarValue54, 0.0), 1.0);
            vec4 sampledTextureValue36 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue158, productValue159, scalarValue54), 0.0);
            float scalarValue55 = sampledTextureValue36.x;
            float scalarValue56 = sampledTextureValue36.y;
            float scalarValue57 = sampledTextureValue36.z;
            float scalarValue58 = sampledTextureValue36.w;
            vec4 sampledTextureValue41 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue158, productValue159, float(int(sumValue130 + 1u))), 0.0);
            productValue101 = ((sampledTextureValue41.x - scalarValue55) * sumValue131) + scalarValue55;
            productValue102 = ((sampledTextureValue41.y - scalarValue56) * sumValue131) + scalarValue56;
            productValue103 = ((sampledTextureValue41.z - scalarValue57) * sumValue131) + scalarValue57;
            productValue104 = ((sampledTextureValue41.w - scalarValue58) * sumValue131) + scalarValue58;
        }
        else
        {
            productValue101 = 0.0;
            productValue102 = 0.0;
            productValue103 = 0.0;
            productValue104 = 1.0;
        }
        float intermediateValue72;
        float intermediateValue73;
        float intermediateValue74;
        if (fragmentVectorConstants1.packedValues[149u].x != 0.0)
        {
            bool conditionValue1 = fragmentVectorConstants1.packedValues[153u].x > 0.0;
            float intermediateValue65;
            float intermediateValue66;
            float intermediateValue67;
            float multiplyAddValue32;
            float multiplyAddValue33;
            float multiplyAddValue34;
            if (fragmentVectorConstants1.packedValues[151u].w > 0.0)
            {
                intermediateValue65 = productValue22;
                intermediateValue66 = productValue23;
                intermediateValue67 = productValue24;
                multiplyAddValue32 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue24, fma(fragmentVectorConstants1.packedValues[5u].x, productValue23, productValue22 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x;
                multiplyAddValue33 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue24, fma(fragmentVectorConstants1.packedValues[5u].y, productValue23, productValue22 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y;
                multiplyAddValue34 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue24, fma(fragmentVectorConstants1.packedValues[5u].z, productValue23, productValue22 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z;
            }
            else
            {
                intermediateValue65 = varyingTexCoord3.x;
                intermediateValue66 = varyingTexCoord3.y;
                intermediateValue67 = varyingTexCoord3.z;
                multiplyAddValue32 = multiplyAddValue4;
                multiplyAddValue33 = multiplyAddValue5;
                multiplyAddValue34 = multiplyAddValue6;
            }
            float sumValue132 = intermediateValue65 - fragmentVectorConstants1.packedValues[11u].x;
            float sumValue133 = intermediateValue66 - fragmentVectorConstants1.packedValues[11u].y;
            float sumValue134 = intermediateValue67 - fragmentVectorConstants1.packedValues[11u].z;
            float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue132, sumValue133, sumValue134), vec3(sumValue132, sumValue133, sumValue134)));
            float productValue160 = inverseLengthValue10 * sumValue132;
            float productValue161 = inverseLengthValue10 * sumValue133;
            float productValue162 = inverseLengthValue10 * sumValue134;
            float inverseLengthValue11 = inversesqrt(dot(vec3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34), vec3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34)));
            float dotProductValue16 = dot(vec3(productValue160, productValue161, productValue162), vec3(productValue3, productValue4, productValue5)) * 2.0;
            float productValue163 = productValue160 - (dotProductValue16 * productValue3);
            float productValue164 = productValue161 - (dotProductValue16 * productValue4);
            float productValue165 = productValue162 - (dotProductValue16 * productValue5);
            float sumValue135 = 1.0 - fragmentVectorConstants1.packedValues[128u].z;
            float productValue166 = sumValue135 * sumValue135;
            float productValue169 = productValue166 * productValue166;
            precise float comparisonValue107 = 1.0 - ((uint(int(fragmentVectorConstants1.packedValues[129u].x)) == 1u) ? productValue166 : (productValue169 * productValue169));
            precise float productValue170 = (fragmentVectorConstants1.packedValues[149u].y + (-1.0)) * comparisonValue107;
            uint scalarValue59 = uint(int(fragmentVectorConstants1.packedValues[81u].x));
            vec4 sampledTextureValue43 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue163, productValue164, productValue165, float(int(scalarValue59))), productValue170);
            vec4 sampledTextureValue45 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue163, productValue164, productValue165, float(int(uint(int(scalarValue59 + 2u) - int(3u) * (int(scalarValue59 + 2u) / int(3u)))))), productValue170);
            float scalarValue60 = sampledTextureValue45.x;
            float scalarValue61 = sampledTextureValue45.y;
            float scalarValue62 = sampledTextureValue45.z;
            float productValue172 = ((sampledTextureValue43.x - scalarValue60) * fragmentVectorConstants1.packedValues[149u].w) + scalarValue60;
            float productValue173 = ((sampledTextureValue43.y - scalarValue61) * fragmentVectorConstants1.packedValues[149u].w) + scalarValue61;
            float productValue176 = ((sampledTextureValue43.z - scalarValue62) * fragmentVectorConstants1.packedValues[149u].w) + scalarValue62;
            float productValue177 = (((quotientValue12 * quotientValue12) * quotientValue12) * fragmentVectorConstants1.packedValues[149u].x) * fragmentVectorConstants1.packedValues[149u].z;
            float comparisonValue108 = (conditionValue1 ? (productValue172 * 301.72412109375) : productValue172) * productValue177;
            float comparisonValue109 = (conditionValue1 ? (productValue173 * 301.72412109375) : productValue173) * productValue177;
            float comparisonValue110 = (conditionValue1 ? (productValue176 * 301.72412109375) : productValue176) * productValue177;
            float comparisonValue19;
            float comparisonValue20;
            float comparisonValue21;
            if (comparisonValue104)
            {
                float productValue178 = fragmentVectorConstants1.packedValues[80u].x * fragmentVectorConstants1.packedValues[80u].w;
                float productValue181 = fragmentVectorConstants1.packedValues[80u].y * fragmentVectorConstants1.packedValues[80u].w;
                float productValue182 = fragmentVectorConstants1.packedValues[80u].z * fragmentVectorConstants1.packedValues[80u].w;
                float productValue183 = fragmentVectorConstants1.packedValues[74u].w * fragmentVectorConstants1.packedValues[88u].x;
                float productValue197 = productValue183 * intermediateValue8;
                float productValue198 = productValue183 * productValue36;
                float productValue199 = productValue183 * productValue37;
                float dotProductValue17 = spvNClamp(dot(vec3(productValue197, productValue198, productValue199), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
                float productValue202 = ((dotProductValue17 * (productValue197 - productValue178)) + productValue178) * fragmentVectorConstants1.packedValues[128u].x;
                float productValue203 = ((dotProductValue17 * (productValue198 - productValue181)) + productValue181) * fragmentVectorConstants1.packedValues[128u].x;
                float productValue205 = ((dotProductValue17 * (productValue199 - productValue182)) + productValue182) * fragmentVectorConstants1.packedValues[128u].x;
                float intermediateValue104;
                float intermediateValue105;
                float intermediateValue106;
                bool intermediateValue107;
                if (!(dot(vec3(comparisonValue108, comparisonValue109, comparisonValue110), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= dot(vec3(productValue202, productValue203, productValue205), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))))
                {
                    intermediateValue104 = productValue202;
                    intermediateValue105 = productValue203;
                    intermediateValue106 = productValue205;
                    intermediateValue107 = true;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    intermediateValue61 = intermediateValue62;
                    intermediateValue63 = intermediateValue64;
                    intermediateValue65 = intermediateValue66;
                    intermediateValue67 = intermediateValue68;
                    intermediateValue69 = intermediateValue70;
                    intermediateValue71 = intermediateValue72;
#endif
                }
                else
                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    multiplyAddValue56 = 1.0;
                    intermediateValue71 = 1.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    multiplyAddValue62 = 1.0;
                    intermediateValue78 = 1.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    intermediateValue104 = 0.0;
                    intermediateValue105 = 0.0;
                    intermediateValue106 = 0.0;
                    intermediateValue107 = false;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    intermediateValue61 = 0.0;
                    intermediateValue63 = 0.0;
                    intermediateValue65 = 0.0;
                    intermediateValue67 = 0.0;
                    intermediateValue69 = 0.0;
                    intermediateValue71 = 0.0;
#endif
                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                float multiplyAddValue152 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[295u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[294u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[292u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[293u])));
                float multiplyAddValue153 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[295u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[294u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[292u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[293u])));
                float multiplyAddValue154 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[295u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[294u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[292u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[293u])));
                vec3 vectorValue9 = vec3(multiplyAddValue152, multiplyAddValue153, multiplyAddValue154);
                float scalarValue115 = rdDot3Precise(vectorValue9, vectorValue9);
                float inverseLengthValue20 = inversesqrt(scalarValue115);
                float productValue259 = (exponentialValue * (fragmentScalarConstants1.packedValues[547u] * fragmentVectorConstants1.packedValues[136u].x)) * fragmentScalarConstants1.packedValues[588u];
                float productValue260 = (exponentialValue * (fragmentScalarConstants1.packedValues[547u] * fragmentVectorConstants1.packedValues[136u].y)) * fragmentScalarConstants1.packedValues[588u];
                float productValue261 = (exponentialValue * (fragmentScalarConstants1.packedValues[547u] * fragmentVectorConstants1.packedValues[136u].z)) * fragmentScalarConstants1.packedValues[588u];
                vec3 productValue262 = vec3(inverseLengthValue20 * multiplyAddValue152, inverseLengthValue20 * multiplyAddValue153, inverseLengthValue20 * multiplyAddValue154);
                float scalarValue116 = rdDot3Precise(vectorValue7, productValue262);
                float scalarValue117 = spvNMax(scalarValue116, 0.0);
                float quotientValue41 = -(multiplyAddValue66 / sumValue138);
                float quotientValue42 = -(multiplyAddValue67 / sumValue138);
                float quotientValue43 = -(multiplyAddValue68 / sumValue138);
                vec3 vectorValue10 = vec3(quotientValue41, quotientValue42, quotientValue43);
                float scalarValue118 = rdDot3Precise(vectorValue7, vectorValue10);
                float scalarValue119 = spvNMax(scalarValue118, 0.0);
                float sumValue156 = fragmentScalarConstants1.packedValues[637u] + 1.0;
                float productValue263 = sumValue156 * sumValue156;
                float multiplyAddValue155 = fma(productValue252, spvNMax((scalarValue116 + fragmentScalarConstants1.packedValues[637u]) / productValue263, 0.0) - scalarValue117, scalarValue117);
                float scalarValue120 = rdDot3Precise(vec3(-multiplyAddValue74, -multiplyAddValue78, -multiplyAddValue87), productValue262);
                float quotientValue44 = productValue252 * spvNMax((scalarValue120 + fragmentScalarConstants1.packedValues[637u]) / productValue263, 0.0);
                float multiplyAddValue156 = fma(multiplyAddValue152, inverseLengthValue20, quotientValue41);
                float multiplyAddValue157 = fma(multiplyAddValue153, inverseLengthValue20, quotientValue42);
                float multiplyAddValue158 = fma(multiplyAddValue154, inverseLengthValue20, quotientValue43);
                vec3 vectorValue11 = vec3(multiplyAddValue156, multiplyAddValue157, multiplyAddValue158);
                float scalarValue121 = rdDot3Precise(vectorValue11, vectorValue11);
                float inverseLengthValue21 = inversesqrt(scalarValue121);
                float scalarValue122 = spvNMax(fragmentScalarConstants1.packedValues[514u], 0.0500000007450580596923828125);
                float productValue264 = scalarValue122 * scalarValue122;
                vec3 productValue265 = vec3(inverseLengthValue21 * multiplyAddValue156, inverseLengthValue21 * multiplyAddValue157, inverseLengthValue21 * multiplyAddValue158);
                float scalarValue123 = rdDot3Precise(vectorValue7, productValue265);
                float scalarValue124 = spvNMax(scalarValue123, 0.0);
                float multiplyAddValue159 = fma(scalarValue124 * scalarValue124, fma(productValue264, productValue264, -1.0), 1.0);
                float quotientValue45 = (productValue264 * productValue264) / ((multiplyAddValue159 * multiplyAddValue159) * 3.1415927410125732421875);
                float productValue266 = productValue264 * 0.5;
                float multiplyAddValue160 = fma(-productValue264, 0.5, 1.0);
                float multiplyAddValue161 = (scalarValue117 / (fma(scalarValue117, multiplyAddValue160, productValue266) + 9.9999997473787516355514526367188e-05)) * (scalarValue119 / (fma(scalarValue119, multiplyAddValue160, productValue266) + 9.9999997473787516355514526367188e-05));
                float scalarValue125 = rdDot3Precise(vectorValue10, productValue265);
                float sumValue157 = spvNMax(1.0 - spvNMax(scalarValue125, 0.0), 0.0);
                float productValue267 = sumValue157 * sumValue157;
                float productValue268 = sumValue157 * (productValue267 * productValue267);
                float multiplyAddValue162 = fma(1.0 - multiplyAddValue100, productValue268, multiplyAddValue100);
                float multiplyAddValue163 = fma(1.0 - multiplyAddValue101, productValue268, multiplyAddValue101);
                float multiplyAddValue167 = fma(1.0 - multiplyAddValue102, productValue268, multiplyAddValue102);
                float productValue269 = (multiplyAddValue58 * sumValue137) * 0.3183098733425140380859375;
                float productValue270 = (multiplyAddValue59 * sumValue137) * 0.3183098733425140380859375;
                float productValue271 = (multiplyAddValue60 * sumValue137) * 0.3183098733425140380859375;
                float multiplyAddValue168 = fma(scalarValue117 * scalarValue119, 4.0, 9.9999997473787516355514526367188e-05);
                multiplyAddValue49 = (productValue259 * fma(productValue269 * (multiplyAddValue155 * (1.0 - multiplyAddValue162)), multiplyAddValue56, intermediateValue71 * (quotientValue44 * productValue269))) * fragmentScalarConstants1.packedValues[556u];
                multiplyAddValue48 = (productValue260 * fma(productValue270 * (multiplyAddValue155 * (1.0 - multiplyAddValue163)), multiplyAddValue56, intermediateValue71 * (quotientValue44 * productValue270))) * fragmentScalarConstants1.packedValues[556u];
                multiplyAddValue47 = (productValue261 * fma(productValue271 * (multiplyAddValue155 * (1.0 - multiplyAddValue167)), multiplyAddValue56, intermediateValue71 * (quotientValue44 * productValue271))) * fragmentScalarConstants1.packedValues[556u];
                quotientValue6 = (productValue259 * (multiplyAddValue56 * (scalarValue117 * ((multiplyAddValue161 * (quotientValue45 * multiplyAddValue162)) / multiplyAddValue168)))) * fragmentScalarConstants1.packedValues[557u];
                quotientValue5 = (productValue260 * (multiplyAddValue56 * (scalarValue117 * ((multiplyAddValue161 * (quotientValue45 * multiplyAddValue163)) / multiplyAddValue168)))) * fragmentScalarConstants1.packedValues[557u];
                quotientValue4 = (productValue261 * (multiplyAddValue56 * (scalarValue117 * ((multiplyAddValue161 * (quotientValue45 * multiplyAddValue167)) / multiplyAddValue168)))) * fragmentScalarConstants1.packedValues[557u];
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                float multiplyAddValue152 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[295u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[294u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[292u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[293u])));
                float multiplyAddValue153 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[295u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[294u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[292u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[293u])));
                float multiplyAddValue154 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[295u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[294u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[292u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[293u])));
                vec3 vectorValue9 = vec3(multiplyAddValue152, multiplyAddValue153, multiplyAddValue154);
                float scalarValue115 = rdDot3Precise(vectorValue9, vectorValue9);
                float inverseLengthValue20 = inversesqrt(scalarValue115);
                float productValue353 = (exponentialValue * (fragmentScalarConstants1.packedValues[559u] * fragmentVectorConstants1.packedValues[139u].x)) * fragmentScalarConstants1.packedValues[600u];
                float productValue354 = (exponentialValue * (fragmentScalarConstants1.packedValues[559u] * fragmentVectorConstants1.packedValues[139u].y)) * fragmentScalarConstants1.packedValues[600u];
                float productValue355 = (exponentialValue * (fragmentScalarConstants1.packedValues[559u] * fragmentVectorConstants1.packedValues[139u].z)) * fragmentScalarConstants1.packedValues[600u];
                vec3 productValue262 = vec3(inverseLengthValue20 * multiplyAddValue152, inverseLengthValue20 * multiplyAddValue153, inverseLengthValue20 * multiplyAddValue154);
                float scalarValue116 = rdDot3Precise(vectorValue7, productValue262);
                float scalarValue117 = spvNMax(scalarValue116, 0.0);
                float scalarValue236 = -quotientValue55;
                float scalarValue237 = -quotientValue56;
                float scalarValue238 = -quotientValue57;
                vec3 vectorValue23 = vec3(scalarValue236, scalarValue237, scalarValue238);
                float scalarValue239 = rdDot3Precise(vectorValue7, vectorValue23);
                float scalarValue240 = spvNMax(scalarValue239, 0.0);
                float sumValue229 = fragmentScalarConstants1.packedValues[705u] + 1.0;
                float productValue356 = sumValue229 * sumValue229;
                float multiplyAddValue308 = fma(productValue346, spvNMax((scalarValue116 + fragmentScalarConstants1.packedValues[705u]) / productValue356, 0.0) - scalarValue117, scalarValue117);
                float scalarValue120 = rdDot3Precise(vec3(-multiplyAddValue74, -multiplyAddValue78, -multiplyAddValue87), productValue262);
                float quotientValue60 = productValue346 * spvNMax((scalarValue120 + fragmentScalarConstants1.packedValues[705u]) / productValue356, 0.0);
                float multiplyAddValue309 = fma(multiplyAddValue152, inverseLengthValue20, scalarValue236);
                float multiplyAddValue310 = fma(multiplyAddValue153, inverseLengthValue20, scalarValue237);
                float multiplyAddValue311 = fma(multiplyAddValue154, inverseLengthValue20, scalarValue238);
                vec3 vectorValue24 = vec3(multiplyAddValue309, multiplyAddValue310, multiplyAddValue311);
                float scalarValue241 = rdDot3Precise(vectorValue24, vectorValue24);
                float inverseLengthValue31 = inversesqrt(scalarValue241);
                float scalarValue242 = spvNMax(fragmentScalarConstants1.packedValues[522u], 0.0500000007450580596923828125);
                float productValue357 = scalarValue242 * scalarValue242;
                vec3 productValue358 = vec3(inverseLengthValue31 * multiplyAddValue309, inverseLengthValue31 * multiplyAddValue310, inverseLengthValue31 * multiplyAddValue311);
                float scalarValue243 = rdDot3Precise(vectorValue7, productValue358);
                float scalarValue244 = spvNMax(scalarValue243, 0.0);
                float multiplyAddValue312 = fma(scalarValue244 * scalarValue244, fma(productValue357, productValue357, -1.0), 1.0);
                float quotientValue61 = (productValue357 * productValue357) / ((multiplyAddValue312 * multiplyAddValue312) * 3.1415927410125732421875);
                float productValue359 = productValue357 * 0.5;
                float multiplyAddValue313 = fma(-productValue357, 0.5, 1.0);
                float multiplyAddValue314 = (scalarValue117 / (fma(scalarValue117, multiplyAddValue313, productValue359) + 9.9999997473787516355514526367188e-05)) * (scalarValue240 / (fma(scalarValue240, multiplyAddValue313, productValue359) + 9.9999997473787516355514526367188e-05));
                float scalarValue245 = rdDot3Precise(vectorValue23, productValue358);
                float sumValue230 = spvNMax(1.0 - spvNMax(scalarValue245, 0.0), 0.0);
                float productValue360 = sumValue230 * sumValue230;
                float productValue361 = sumValue230 * (productValue360 * productValue360);
                float multiplyAddValue315 = fma(1.0 - multiplyAddValue268, productValue361, multiplyAddValue268);
                float multiplyAddValue316 = fma(1.0 - multiplyAddValue269, productValue361, multiplyAddValue269);
                float multiplyAddValue317 = fma(1.0 - multiplyAddValue270, productValue361, multiplyAddValue270);
                float productValue362 = (multiplyAddValue253 * sumValue211) * 0.3183098733425140380859375;
                float productValue363 = (multiplyAddValue254 * sumValue211) * 0.3183098733425140380859375;
                float productValue364 = (multiplyAddValue255 * sumValue211) * 0.3183098733425140380859375;
                float multiplyAddValue318 = fma(scalarValue117 * scalarValue240, 4.0, 9.9999997473787516355514526367188e-05);
                multiplyAddValue53 = (productValue353 * fma(productValue362 * (multiplyAddValue308 * (1.0 - multiplyAddValue315)), multiplyAddValue62, intermediateValue78 * (quotientValue60 * productValue362))) * fragmentScalarConstants1.packedValues[568u];
                multiplyAddValue54 = (productValue354 * fma(productValue363 * (multiplyAddValue308 * (1.0 - multiplyAddValue316)), multiplyAddValue62, intermediateValue78 * (quotientValue60 * productValue363))) * fragmentScalarConstants1.packedValues[568u];
                multiplyAddValue55 = (productValue355 * fma(productValue364 * (multiplyAddValue308 * (1.0 - multiplyAddValue317)), multiplyAddValue62, intermediateValue78 * (quotientValue60 * productValue364))) * fragmentScalarConstants1.packedValues[568u];
                quotientValue7 = (productValue353 * (multiplyAddValue62 * (scalarValue117 * ((multiplyAddValue314 * (quotientValue61 * multiplyAddValue315)) / multiplyAddValue318)))) * fragmentScalarConstants1.packedValues[569u];
                quotientValue8 = (productValue354 * (multiplyAddValue62 * (scalarValue117 * ((multiplyAddValue314 * (quotientValue61 * multiplyAddValue316)) / multiplyAddValue318)))) * fragmentScalarConstants1.packedValues[569u];
                quotientValue9 = (productValue355 * (multiplyAddValue62 * (scalarValue117 * ((multiplyAddValue314 * (quotientValue61 * multiplyAddValue317)) / multiplyAddValue318)))) * fragmentScalarConstants1.packedValues[569u];
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                comparisonValue19 = intermediateValue107 ? intermediateValue104 : comparisonValue108;
                comparisonValue20 = intermediateValue107 ? intermediateValue105 : comparisonValue109;
                comparisonValue21 = intermediateValue107 ? intermediateValue106 : comparisonValue110;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float sumValue328 = 1.0 - fragmentVectorConstants1.packedValues[178u].x;
                productValue48 = (sumValue328 * intermediateValue61) + intermediateValue16;
                productValue49 = (sumValue328 * intermediateValue63) + intermediateValue17;
                productValue50 = (sumValue328 * intermediateValue65) + intermediateValue18;
                productValue51 = (sumValue328 * intermediateValue67) + intermediateValue19;
                productValue52 = (sumValue328 * intermediateValue69) + intermediateValue20;
                productValue53 = (sumValue328 * intermediateValue71) + intermediateValue21;
#endif
            }
            else
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                multiplyAddValue49 = 0.0;
                multiplyAddValue48 = 0.0;
                multiplyAddValue47 = 0.0;
                quotientValue6 = 0.0;
                quotientValue5 = 0.0;
                quotientValue4 = 0.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                multiplyAddValue53 = 0.0;
                multiplyAddValue54 = 0.0;
                multiplyAddValue55 = 0.0;
                quotientValue7 = 0.0;
                quotientValue8 = 0.0;
                quotientValue9 = 0.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                comparisonValue19 = comparisonValue108;
                comparisonValue20 = comparisonValue109;
                comparisonValue21 = comparisonValue110;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                productValue48 = intermediateValue16;
                productValue49 = intermediateValue17;
                productValue50 = intermediateValue18;
                productValue51 = intermediateValue19;
                productValue52 = intermediateValue20;
                productValue53 = intermediateValue21;
#endif
            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float intermediateValue88;
            float intermediateValue90;
            float intermediateValue92;
            if (fragmentScalarConstants1.packedValues[591u] != 0.0)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            bool comparisonValue200 = fragmentScalarConstants1.packedValues[314u] != 0.0;
            float multiplyAddValue44;
            float multiplyAddValue45;
            float multiplyAddValue46;
            float multiplyAddValue50;
            float multiplyAddValue51;
            float multiplyAddValue52;
            if (comparisonValue200)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue46 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3((-0.0) - (multiplyAddValue32 * inverseLengthValue11), (-0.0) - (multiplyAddValue33 * inverseLengthValue11), (-0.0) - (multiplyAddValue34 * inverseLengthValue11))), 0.0, 1.0), sumValue135));
            float scalarValue63 = sampledTextureValue46.x;
            float scalarValue64 = sampledTextureValue46.y;
            float quotientValue33 = (fragmentVectorConstants1.packedValues[155u].x - fragmentVectorConstants1.packedValues[82u].x) + (nonlinearValue / fragmentVectorConstants1.packedValues[82u].z);
            float comparisonValue111 = 1.0 - spvNClamp(comparisonValue106 ? (quotientValue33 * fragmentVectorConstants1.packedValues[82u].y) : (quotientValue33 / (fragmentVectorConstants1.packedValues[82u].y - fragmentVectorConstants1.packedValues[82u].x)), 0.0, 1.0);
            float productValue206 = (((scalarValue63 * productValue26) + scalarValue64) * comparisonValue19) * comparisonValue111;
            float productValue210 = (((scalarValue63 * productValue27) + scalarValue64) * comparisonValue20) * comparisonValue111;
            float productValue211 = (((scalarValue63 * productValue28) + scalarValue64) * comparisonValue21) * comparisonValue111;
            float branchMergedValue14;
            float branchMergedValue24;
            float branchMergedValue25;
            if (comparisonValue105)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float intermediateValue32;
            float intermediateValue33;
            float intermediateValue34;
            if ((fragmentVectorConstants1.packedValues[78u].z != 0.0) && (fragmentVectorConstants1.packedValues[150u].w != 0.0))
#endif
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                float multiplyAddValue169 = fma(productValue236, 0.20000000298023223876953125, sumValue - 0.5);
                float multiplyAddValue170 = fma(productValue237, 0.20000000298023223876953125, sumValue1 - 0.5);
                float multiplyAddValue171 = fma(productValue238, 0.20000000298023223876953125, sumValue2 - 0.5);
                uint productValue272 = uint(int(floor(floor(multiplyAddValue169) * 0.0625)));
                uint productValue273 = uint(int(floor(floor(multiplyAddValue170) * 0.0625)));
                uint productValue274 = uint(int(floor(floor(multiplyAddValue171) * 0.0625)));
                uint scalarValue126 = bitfieldInsert(productValue272, productValue273, int(16u), int(16u));
                uint bitwiseValue38 = productValue274 & 65535u;
                uint productValue275 = productValue272 * 1540483477u;
                uint productValue276 = productValue273 * 1540483477u;
                uint productValue277 = productValue274 * 1540483477u;
                uint bitwiseValue39 = (((((productValue276 ^ (productValue276 >> 24u)) * 1540483477u) ^ (((((productValue275 >> 24u) ^ productValue275) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u) ^ ((productValue277 ^ (productValue277 >> 24u)) * 1540483477u)) * 1540483477u;
                uint bitwiseValue40 = ((bitwiseValue39 >> 13u) ^ bitwiseValue39) * 1540483477u;
                uint bitwiseValue41 = (bitwiseValue40 >> 15u) ^ bitwiseValue40;
                uint bitwiseValue42 = (bitwiseValue41 ^ (bitwiseValue41 >> 16u)) & 65535u;
                bool comparisonValue132 = bitwiseValue42 != 0u;
                uint bitwiseValue43 = bitwiseValue42 | 1u;
                uint sumValue158 = uint(fragmentScalarConstants1.packedValues[304u]) - 1u;
                uint comparisonValue133 = (comparisonValue132 ? bitwiseValue42 : bitwiseValue43) & sumValue158;
                uint comparisonValue8;
                uint comparisonValue9;
                uint bitwiseValue7;
                uint sumValue16;
                uint intermediateValue150;
                uint intermediateValue151;
                uint scalarValue127 = 0u;
                uint scalarValue128 = 0u;
                uint scalarValue129 = comparisonValue133;
                uint scalarValue130 = 0u;
                for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                float productValue365 = scalarValue201 * fragmentScalarConstants1.packedValues[366u];
                bool conditionValue23 = scalarValue201 < fragmentVectorConstants1.packedValues[91u].x;
                bool conditionValue24 = scalarValue201 < fragmentVectorConstants1.packedValues[91u].y;
                float nonlinearValue10 = spvNMin(fragmentVectorConstants1.packedValues[138u].z - 1.0, floor(spvNClamp((log2(scalarValue201) - fragmentScalarConstants1.packedValues[646u]) * fragmentScalarConstants1.packedValues[644u], 0.0, 1.0) * (fragmentVectorConstants1.packedValues[138u].z - 2.0)) + 2.0);
                float comparisonValue201 = conditionValue24 ? 1.0 : nonlinearValue10;
                float multiplyAddValue319 = spvNMin(fragmentVectorConstants1.packedValues[138u].x - 1.0, floor(spvNClamp(fma(productValue365, fragmentScalarConstants1.packedValues[367u], multiplyAddValue66) / fma(productValue365, fragmentScalarConstants1.packedValues[367u], productValue365 * fragmentScalarConstants1.packedValues[367u]), 0.0, 1.0) * fragmentScalarConstants1.packedValues[552u]));
                float multiplyAddValue320 = spvNMin(fragmentVectorConstants1.packedValues[138u].y - 1.0, floor(spvNClamp(fma(scalarValue201, fragmentScalarConstants1.packedValues[366u], multiplyAddValue67) / (productValue365 + productValue365), 0.0, 1.0) * fragmentScalarConstants1.packedValues[553u]));
                float intermediateValue122;
                float intermediateValue124;
                float intermediateValue126;
                float intermediateValue128;
                float intermediateValue130;
                float intermediateValue132;
                if (!(((conditionValue23 ? 0.0 : comparisonValue201) >= fragmentScalarConstants1.packedValues[554u]) || ((multiplyAddValue320 >= fragmentScalarConstants1.packedValues[553u]) || ((multiplyAddValue319 >= fragmentScalarConstants1.packedValues[552u]) || (((multiplyAddValue319 < 0.0) || (multiplyAddValue320 < 0.0)) || (((!conditionValue24) && (nonlinearValue10 < 0.0)) && (!conditionValue23)))))))
                {
                    float multiplyAddValue321 = fma(multiplyAddValue320, fragmentScalarConstants1.packedValues[552u], multiplyAddValue319);
                    uint scalarValue246 = uint(int(fragmentScalarConstants1.packedValues[555u]));
                    uint multiplyAddValue322 = uint(int(conditionValue23 ? multiplyAddValue321 : fma(fragmentScalarConstants1.packedValues[553u], fragmentScalarConstants1.packedValues[552u] * comparisonValue201, multiplyAddValue321))) * scalarValue246;
                    uint sumValue231 = scalarValue246 + multiplyAddValue322;
                    float scalarValue247 = -quotientValue55;
                    float scalarValue248 = -quotientValue56;
                    float scalarValue249 = -quotientValue57;
                    vec3 vectorValue25 = vec3(scalarValue247, scalarValue248, scalarValue249);
                    float scalarValue250 = rdDot3Precise(vectorValue7, vectorValue25);
                    float scalarValue251 = spvNMax(scalarValue250, 0.0);
                    float sumValue232 = fragmentScalarConstants1.packedValues[705u] + 1.0;
                    float productValue366 = sumValue232 * sumValue232;
                    float scalarValue252 = spvNMax(fragmentScalarConstants1.packedValues[522u], 0.0500000007450580596923828125);
                    float productValue367 = scalarValue252 * scalarValue252;
                    float productValue368 = productValue367 * productValue367;
                    float multiplyAddValue323 = fma(productValue367, productValue367, -1.0);
                    float productValue369 = productValue367 * 0.5;
                    float multiplyAddValue324 = fma(-productValue367, 0.5, 1.0);
                    float multiplyAddValue325 = scalarValue251 / (fma(scalarValue251, multiplyAddValue324, productValue369) + 9.9999997473787516355514526367188e-05);
                    float sumValue233 = 1.0 - multiplyAddValue268;
                    float sumValue234 = 1.0 - multiplyAddValue269;
                    float sumValue235 = 1.0 - multiplyAddValue270;
                    float productValue370 = (multiplyAddValue253 * sumValue211) * 0.3183098733425140380859375;
                    float productValue371 = (multiplyAddValue254 * sumValue211) * 0.3183098733425140380859375;
                    float productValue372 = (multiplyAddValue255 * sumValue211) * 0.3183098733425140380859375;
                    bool conditionValue25 = fragmentScalarConstants1.packedValues[300u] > 0.0;
                    bool conditionValue26 = fragmentScalarConstants1.packedValues[620u] > 0.0;
                    float scalarValue253 = -fragmentScalarConstants1.packedValues[616u];
                    float quotientValue62 = 0.5 / fragmentVectorConstants1.packedValues[167u].x;
                    float quotientValue63 = 0.5 / fragmentVectorConstants1.packedValues[167u].y;
                    bool conditionValue27 = productValue346 > 0.0;
                    float quotientValue64 = 1.0 / (fragmentScalarConstants1.packedValues[617u] - fragmentScalarConstants1.packedValues[616u]);
                    float intermediateValue123;
                    float intermediateValue125;
                    float intermediateValue127;
                    float intermediateValue129;
                    float intermediateValue131;
                    float intermediateValue133;
                    intermediateValue133 = 0.0;
                    intermediateValue131 = 0.0;
                    intermediateValue129 = 0.0;
                    intermediateValue127 = 0.0;
                    intermediateValue125 = 0.0;
                    intermediateValue123 = 0.0;
                    float multiplyAddValue122;
                    float multiplyAddValue123;
                    float multiplyAddValue124;
                    float multiplyAddValue125;
                    float multiplyAddValue126;
                    float multiplyAddValue127;
                    uint sumValue30;
                    uint scalarValue254 = multiplyAddValue322;
                    for (;;)
                    {
                        if (int(scalarValue254) >= int(sumValue231))
                        {
                            break;
                        }
                        uint reinterpretedBits4 = uint(int(uintBitsToFloat(intermediateValue10.packedValues[scalarValue254])));
                        if (int(reinterpretedBits4) < int(0u))
                        {
                            break;
                        }
                        uint productValue373 = reinterpretedBits4 * 32u;
                        vec3 reinterpretedBits5 = uintBitsToFloat(uvec3(intermediateValue11.packedValues[productValue373], intermediateValue11.packedValues[productValue373 + 1u], intermediateValue11.packedValues[productValue373 + 2u]));
                        float scalarValue255 = reinterpretedBits5.x;
                        float scalarValue256 = reinterpretedBits5.y;
                        float scalarValue257 = reinterpretedBits5.z;
                        float multiplyAddValue326 = (fma(fragmentVectorConstants1.packedValues[6u].x, scalarValue257, fma(fragmentVectorConstants1.packedValues[4u].x, scalarValue255, scalarValue256 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) - multiplyAddValue66;
                        float multiplyAddValue327 = (fma(fragmentVectorConstants1.packedValues[6u].y, scalarValue257, fma(fragmentVectorConstants1.packedValues[4u].y, scalarValue255, scalarValue256 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) - multiplyAddValue67;
                        float multiplyAddValue328 = (fma(fragmentVectorConstants1.packedValues[6u].z, scalarValue257, fma(fragmentVectorConstants1.packedValues[4u].z, scalarValue255, scalarValue256 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) - multiplyAddValue68;
                        vec3 vectorValue26 = vec3(multiplyAddValue326, multiplyAddValue327, multiplyAddValue328);
                        float scalarValue258 = rdDot3Precise(vectorValue26, vectorValue26);
                        float inverseLengthValue32 = inversesqrt(scalarValue258);
                        vec3 productValue374 = vec3(inverseLengthValue32 * multiplyAddValue326, inverseLengthValue32 * multiplyAddValue327, inverseLengthValue32 * multiplyAddValue328);
                        float scalarValue259 = rdDot3Precise(vectorValue7, productValue374);
                        float scalarValue260 = spvNMax(scalarValue259, 0.0);
                        float multiplyAddValue329 = fma(productValue346, spvNMax((scalarValue259 + fragmentScalarConstants1.packedValues[705u]) / productValue366, 0.0) - scalarValue260, scalarValue260);
                        float scalarValue261 = rdDot3Precise(vec3(-multiplyAddValue74, -multiplyAddValue78, -multiplyAddValue87), productValue374);
                        float quotientValue65 = productValue346 * spvNMax((scalarValue261 + fragmentScalarConstants1.packedValues[705u]) / productValue366, 0.0);
                        float multiplyAddValue330 = fma(multiplyAddValue326, inverseLengthValue32, scalarValue247);
                        float multiplyAddValue331 = fma(multiplyAddValue327, inverseLengthValue32, scalarValue248);
                        float multiplyAddValue332 = fma(multiplyAddValue328, inverseLengthValue32, scalarValue249);
                        vec3 vectorValue27 = vec3(multiplyAddValue330, multiplyAddValue331, multiplyAddValue332);
                        float scalarValue262 = rdDot3Precise(vectorValue27, vectorValue27);
                        float inverseLengthValue33 = inversesqrt(scalarValue262);
                        vec3 productValue375 = vec3(inverseLengthValue33 * multiplyAddValue330, inverseLengthValue33 * multiplyAddValue331, inverseLengthValue33 * multiplyAddValue332);
                        float scalarValue263 = rdDot3Precise(vectorValue7, productValue375);
                        float scalarValue264 = spvNMax(scalarValue263, 0.0);
                        float multiplyAddValue333 = fma(scalarValue264 * scalarValue264, multiplyAddValue323, 1.0);
                        float quotientValue66 = productValue368 / ((multiplyAddValue333 * multiplyAddValue333) * 3.1415927410125732421875);
                        float multiplyAddValue334 = multiplyAddValue325 * (scalarValue260 / (fma(scalarValue260, multiplyAddValue324, productValue369) + 9.9999997473787516355514526367188e-05));
                        float scalarValue265 = rdDot3Precise(vectorValue25, productValue375);
                        float sumValue236 = spvNMax(1.0 - spvNMax(scalarValue265, 0.0), 0.0);
                        float productValue376 = sumValue236 * sumValue236;
                        float productValue377 = sumValue236 * (productValue376 * productValue376);
                        float multiplyAddValue335 = fma(sumValue233, productValue377, multiplyAddValue268);
                        float multiplyAddValue336 = fma(sumValue234, productValue377, multiplyAddValue269);
                        float multiplyAddValue337 = fma(sumValue235, productValue377, multiplyAddValue270);
                        float multiplyAddValue338 = fma(scalarValue251 * scalarValue260, 4.0, 9.9999997473787516355514526367188e-05);
                        float intermediateValue214;
                        float intermediateValue215;
                        float intermediateValue216;
                        bool intermediateValue217;
                        float intermediateValue219;
                        if (int(reinterpretedBits4) >= int(0u))
                        {
                            vec4 reinterpretedBits6 = uintBitsToFloat(intermediateValue12.packedValues[reinterpretedBits4 * 8u]);
                            float scalarValue266 = reinterpretedBits6.w;
                            float sumValue237 = reinterpretedBits6.x - varyingTexCoord3.x;
                            float sumValue238 = reinterpretedBits6.y - varyingTexCoord3.y;
                            float sumValue239 = reinterpretedBits6.z - varyingTexCoord3.z;
                            float sumValue240 = abs(sumValue239) + (abs(sumValue238) + abs(sumValue237));
                            vec3 vectorValue28 = vec3(sumValue237, sumValue238, sumValue239);
                            float scalarValue267 = rdDot3Precise(vectorValue28, vectorValue28);
                            float comparisonValue202 = conditionValue25 ? (sumValue240 * sumValue240) : scalarValue267;
                            float productValue94;
                            float productValue95;
                            float productValue96;
                            bool intermediateValue218;
                            float intermediateValue220;
                            if (comparisonValue202 < (scalarValue266 * scalarValue266))
                            {
                                float intermediateValue239;
                                bool intermediateValue240;
                                if (comparisonValue200)
                                {
                                    vec4 reinterpretedBits7 = uintBitsToFloat(intermediateValue12.packedValues[(reinterpretedBits4 * 8u) + 2u]);
                                    vec4 reinterpretedBits8 = uintBitsToFloat(intermediateValue12.packedValues[(reinterpretedBits4 * 8u) + 3u]);
                                    vec4 reinterpretedBits9 = uintBitsToFloat(intermediateValue12.packedValues[(reinterpretedBits4 * 8u) + 4u]);
                                    vec4 reinterpretedBits10 = uintBitsToFloat(intermediateValue12.packedValues[(reinterpretedBits4 * 8u) + 5u]);
                                    vec4 reinterpretedBits11 = uintBitsToFloat(intermediateValue12.packedValues[(reinterpretedBits4 * 8u) + 6u]);
                                    vec4 reinterpretedBits12 = uintBitsToFloat(intermediateValue12.packedValues[(reinterpretedBits4 * 8u) + 7u]);
                                    float sumValue241 = comparisonValue179 - scalarValue255;
                                    float sumValue242 = comparisonValue180 - scalarValue256;
                                    float sumValue243 = comparisonValue181 - scalarValue257;
                                    float scalarValue268 = abs(sumValue241);
                                    float scalarValue269 = abs(sumValue242);
                                    float scalarValue270 = abs(sumValue243);
                                    bool comparisonValue203 = scalarValue269 >= scalarValue270;
                                    bool comparisonValue204 = (scalarValue268 >= scalarValue270) && (scalarValue268 >= scalarValue269);
                                    bool comparisonValue205 = sumValue242 >= 0.0;
                                    bool comparisonValue206 = sumValue243 >= 0.0;
                                    bool conditionValue28 = !comparisonValue204;
                                    bool comparisonValue207 = (!(sumValue241 >= 0.0)) && comparisonValue204;
                                    bool bitwiseValue122 = (comparisonValue205 && comparisonValue203) && conditionValue28;
                                    bool bitwiseValue123 = conditionValue28 && ((!comparisonValue205) && comparisonValue203);
                                    bool bitwiseValue124 = conditionValue28 && ((!comparisonValue203) && comparisonValue206);
                                    bool bitwiseValue125 = comparisonValue204 || (comparisonValue203 || comparisonValue206);
                                    float comparisonValue208 = comparisonValue207 ? reinterpretedBits8.x : (bitwiseValue122 ? reinterpretedBits9.x : (bitwiseValue123 ? reinterpretedBits10.x : (bitwiseValue124 ? reinterpretedBits11.x : (bitwiseValue125 ? reinterpretedBits7.x : reinterpretedBits12.x))));
                                    float comparisonValue209 = comparisonValue207 ? reinterpretedBits8.y : (bitwiseValue122 ? reinterpretedBits9.y : (bitwiseValue123 ? reinterpretedBits10.y : (bitwiseValue124 ? reinterpretedBits11.y : (bitwiseValue125 ? reinterpretedBits7.y : reinterpretedBits12.y))));
                                    float comparisonValue210 = comparisonValue207 ? reinterpretedBits8.z : (bitwiseValue122 ? reinterpretedBits9.z : (bitwiseValue123 ? reinterpretedBits10.z : (bitwiseValue124 ? reinterpretedBits11.z : (bitwiseValue125 ? reinterpretedBits7.z : reinterpretedBits12.z))));
                                    float comparisonValue211 = comparisonValue207 ? reinterpretedBits8.w : (bitwiseValue122 ? reinterpretedBits9.w : (bitwiseValue123 ? reinterpretedBits10.w : (bitwiseValue124 ? reinterpretedBits11.w : (bitwiseValue125 ? reinterpretedBits7.w : reinterpretedBits12.w))));
                                    float multiplyAddValue174;
                                    bool multiplyAddValue175;
                                    if (!((comparisonValue210 == 0.0) && (comparisonValue211 == 0.0)))
                                    {
                                        float scalarValue271 = scalarValue255 - comparisonValue179;
                                        float sumValue244 = scalarValue257 - comparisonValue181;
                                        float sumValue245 = scalarValue256 - comparisonValue180;
                                        float comparisonValue212 = comparisonValue207 ? sumValue244 : (((bitwiseValue124 || bitwiseValue123) || bitwiseValue122) ? scalarValue271 : (bitwiseValue125 ? sumValue243 : sumValue241));
                                        float comparisonValue213 = comparisonValue207 ? sumValue242 : (bitwiseValue122 ? sumValue244 : (bitwiseValue123 ? sumValue243 : sumValue242));
                                        float comparisonValue214 = comparisonValue207 ? sumValue241 : (bitwiseValue122 ? sumValue245 : (bitwiseValue123 ? sumValue242 : (bitwiseValue124 ? sumValue244 : (bitwiseValue125 ? scalarValue271 : sumValue243))));
                                        float multiplyAddValue339 = fma(fragmentVectorConstants1.packedValues[164u].w, comparisonValue214, fma(fragmentVectorConstants1.packedValues[162u].w, comparisonValue212, comparisonValue213 * fragmentVectorConstants1.packedValues[163u].w)) + fragmentVectorConstants1.packedValues[165u].w;
                                        vec3 vectorValue29 = vec3(scalarValue271, sumValue245, sumValue244);
                                        float scalarValue272 = rdDot3Precise(vectorValue29, vectorValue29);
                                        float inverseLengthValue34 = inversesqrt(scalarValue272);
                                        float productValue378 = rdDot3Precise(vec3(inverseLengthValue34 * scalarValue271, inverseLengthValue34 * sumValue245, inverseLengthValue34 * sumValue244), vectorValue21);
                                        float scalarValue273 = spvNMin(spvNMax(productValue378, fragmentScalarConstants1.packedValues[640u]), 1.0);
                                        float sumValue246 = comparisonValue210 - comparisonValue208;
                                        float sumValue247 = comparisonValue211 - comparisonValue209;
                                        float productValue379 = sumValue246 * fragmentVectorConstants1.packedValues[167u].x;
                                        float productValue380 = sumValue247 * fragmentVectorConstants1.packedValues[167u].y;
                                        float multiplyAddValue340 = (fma(fragmentVectorConstants1.packedValues[164u].x, comparisonValue214, fma(fragmentVectorConstants1.packedValues[162u].x, comparisonValue212, comparisonValue213 * fragmentVectorConstants1.packedValues[163u].x)) + fragmentVectorConstants1.packedValues[165u].x) / multiplyAddValue339;
                                        float multiplyAddValue341 = (fma(fragmentVectorConstants1.packedValues[164u].y, comparisonValue214, fma(fragmentVectorConstants1.packedValues[162u].y, comparisonValue212, comparisonValue213 * fragmentVectorConstants1.packedValues[163u].y)) + fragmentVectorConstants1.packedValues[165u].y) / multiplyAddValue339;
                                        vec4 sampledTextureValue71 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(spvNMin(comparisonValue210 - quotientValue62, spvNMax(quotientValue62 + comparisonValue208, fma((floor(productValue379 * fma(multiplyAddValue340, 0.5, 0.5)) + 0.5) / productValue379, sumValue246, comparisonValue208))), spvNMin(comparisonValue211 - quotientValue63, spvNMax(quotientValue63 + comparisonValue209, fma((floor(productValue380 * (1.0 - fma(multiplyAddValue341, 0.5, 0.5))) + 0.5) / productValue380, sumValue247, comparisonValue209)))), 0.0);
                                        float scalarValue274 = sampledTextureValue71.x;
                                        float multiplyAddValue342 = fma(fragmentVectorConstants1.packedValues[158u].w, scalarValue274, fma(fragmentVectorConstants1.packedValues[156u].w, multiplyAddValue340, multiplyAddValue341 * fragmentVectorConstants1.packedValues[157u].w)) + fragmentVectorConstants1.packedValues[159u].w;
                                        vec3 vectorValue30 = vec3(comparisonValue212, comparisonValue213, comparisonValue214);
                                        float scalarValue275 = rdDot3Precise(vectorValue30, vectorValue30);
                                        vec3 multiplyAddValue343 = vec3((fma(fragmentVectorConstants1.packedValues[158u].x, scalarValue274, fma(fragmentVectorConstants1.packedValues[156u].x, multiplyAddValue340, multiplyAddValue341 * fragmentVectorConstants1.packedValues[157u].x)) + fragmentVectorConstants1.packedValues[159u].x) / multiplyAddValue342, (fma(fragmentVectorConstants1.packedValues[158u].y, scalarValue274, fma(fragmentVectorConstants1.packedValues[156u].y, multiplyAddValue340, multiplyAddValue341 * fragmentVectorConstants1.packedValues[157u].y)) + fragmentVectorConstants1.packedValues[159u].y) / multiplyAddValue342, (fma(fragmentVectorConstants1.packedValues[158u].z, scalarValue274, fma(fragmentVectorConstants1.packedValues[156u].z, multiplyAddValue340, multiplyAddValue341 * fragmentVectorConstants1.packedValues[157u].z)) + fragmentVectorConstants1.packedValues[159u].z) / multiplyAddValue342);
                                        float scalarValue276 = rdDot3Precise(multiplyAddValue343, multiplyAddValue343);
                                        float nonlinearValue11 = spvNClamp((sqrt(scalarValue275) - sqrt(scalarValue276)) * fragmentScalarConstants1.packedValues[706u], 0.0, 1.0);
                                        multiplyAddValue174 = conditionValue27 ? fma(-fma(nonlinearValue11, -2.0, 3.0), nonlinearValue11 * nonlinearValue11, 1.0) : 1.0;
                                        multiplyAddValue175 = scalarValue274 >= (fma(-fma(fragmentScalarConstants1.packedValues[677u], sqrt(fma(-scalarValue273, scalarValue273, 1.0)) / scalarValue273, fragmentScalarConstants1.packedValues[676u]), fragmentScalarConstants1.packedValues[670u] / spvNMax(productValue379, 1.0), fma(fragmentVectorConstants1.packedValues[164u].z, comparisonValue214, fma(fragmentVectorConstants1.packedValues[162u].z, comparisonValue212, comparisonValue213 * fragmentVectorConstants1.packedValues[163u].z)) + fragmentVectorConstants1.packedValues[165u].z) / multiplyAddValue339);
                                    }
                                    else
                                    {
                                        multiplyAddValue174 = 1.0;
                                        multiplyAddValue175 = false;
                                    }
                                    intermediateValue239 = multiplyAddValue174;
                                    intermediateValue240 = multiplyAddValue175;
                                }
                                else
                                {
                                    intermediateValue239 = 1.0;
                                    intermediateValue240 = true;
                                }
                                float quotientValue67 = 1.0 / spvNMax(comparisonValue202, 0.100000001490116119384765625);
                                float multiplyAddValue344 = comparisonValue202 / fma(scalarValue266, scalarValue266, 9.9999997473787516355514526367188e-05);
                                float multiplyAddValue345 = spvNMax(fma(-multiplyAddValue344, multiplyAddValue344, 1.0), 0.0);
                                float productValue381 = multiplyAddValue345 * multiplyAddValue345;
                                float productValue382 = productValue381 * quotientValue67;
                                float multiplyAddValue346 = spvNClamp(quotientValue64 * (fma(-quotientValue67, productValue381, scalarValue253) + 1.0), 0.0, 1.0);
                                float multiplyAddValue347 = conditionValue26 ? (spvNClamp(fma((multiplyAddValue346 * multiplyAddValue346) * fma(multiplyAddValue346, -2.0, 3.0), fragmentScalarConstants1.packedValues[618u], fragmentScalarConstants1.packedValues[619u]), 0.0, 1.0) * productValue382) : productValue382;
                                vec4 reinterpretedBits13 = uintBitsToFloat(intermediateValue12.packedValues[(reinterpretedBits4 * 8u) + 1u]);
                                float scalarValue277 = reinterpretedBits13.w;
                                intermediateValue220 = intermediateValue239;
                                intermediateValue218 = intermediateValue240;
                                productValue96 = multiplyAddValue347 * (scalarValue277 * reinterpretedBits13.x);
                                productValue95 = multiplyAddValue347 * (scalarValue277 * reinterpretedBits13.y);
                                productValue94 = multiplyAddValue347 * (scalarValue277 * reinterpretedBits13.z);
                            }
                            else
                            {
                                intermediateValue220 = 1.0;
                                intermediateValue218 = true;
                                productValue96 = 0.0;
                                productValue95 = 0.0;
                                productValue94 = 0.0;
                            }
                            intermediateValue214 = productValue94;
                            intermediateValue215 = productValue95;
                            intermediateValue216 = productValue96;
                            intermediateValue217 = intermediateValue218;
                            intermediateValue219 = intermediateValue220;
                        }
                        else
                        {
                            intermediateValue214 = 0.0;
                            intermediateValue215 = 0.0;
                            intermediateValue216 = 0.0;
                            intermediateValue217 = true;
                            intermediateValue219 = 1.0;
                        }
                        float productValue383 = intermediateValue219 * (productValue370 * quotientValue65);
                        float productValue384 = intermediateValue219 * (productValue371 * quotientValue65);
                        float productValue385 = intermediateValue219 * (productValue372 * quotientValue65);
                        multiplyAddValue122 = fma(intermediateValue216 * (intermediateValue217 ? ((productValue370 * (multiplyAddValue329 * (1.0 - multiplyAddValue335))) + productValue383) : productValue383), fragmentScalarConstants1.packedValues[568u], intermediateValue133);
                        multiplyAddValue123 = fma(intermediateValue215 * (intermediateValue217 ? ((productValue371 * (multiplyAddValue329 * (1.0 - multiplyAddValue336))) + productValue384) : productValue384), fragmentScalarConstants1.packedValues[568u], intermediateValue131);
                        multiplyAddValue124 = fma(intermediateValue214 * (intermediateValue217 ? ((productValue372 * (multiplyAddValue329 * (1.0 - multiplyAddValue337))) + productValue385) : productValue385), fragmentScalarConstants1.packedValues[568u], intermediateValue129);
                        multiplyAddValue125 = intermediateValue217 ? fma(fragmentScalarConstants1.packedValues[569u], intermediateValue216 * (((multiplyAddValue334 * (quotientValue66 * multiplyAddValue335)) / multiplyAddValue338) * scalarValue260), intermediateValue127) : intermediateValue127;
                        multiplyAddValue126 = intermediateValue217 ? fma(fragmentScalarConstants1.packedValues[569u], intermediateValue215 * (((multiplyAddValue334 * (quotientValue66 * multiplyAddValue336)) / multiplyAddValue338) * scalarValue260), intermediateValue125) : intermediateValue125;
                        multiplyAddValue127 = intermediateValue217 ? fma(fragmentScalarConstants1.packedValues[569u], intermediateValue214 * (((multiplyAddValue334 * (quotientValue66 * multiplyAddValue337)) / multiplyAddValue338) * scalarValue260), intermediateValue123) : intermediateValue123;
                        sumValue30 = scalarValue254 + 1u;
                        intermediateValue133 = multiplyAddValue122;
                        intermediateValue131 = multiplyAddValue123;
                        intermediateValue129 = multiplyAddValue124;
                        intermediateValue127 = multiplyAddValue125;
                        intermediateValue125 = multiplyAddValue126;
                        intermediateValue123 = multiplyAddValue127;
                        scalarValue254 = sumValue30;
                        continue;
                    }
                    intermediateValue122 = intermediateValue123;
                    intermediateValue124 = intermediateValue125;
                    intermediateValue126 = intermediateValue127;
                    intermediateValue128 = intermediateValue129;
                    intermediateValue130 = intermediateValue131;
                    intermediateValue132 = intermediateValue133;
                }
                else
                {
                    intermediateValue122 = 0.0;
                    intermediateValue124 = 0.0;
                    intermediateValue126 = 0.0;
                    intermediateValue128 = 0.0;
                    intermediateValue130 = 0.0;
                    intermediateValue132 = 0.0;
                }
                float sumValue248 = 1.0 - fragmentScalarConstants1.packedValues[712u];
                multiplyAddValue52 = fma(sumValue248, intermediateValue132, multiplyAddValue53);
                multiplyAddValue51 = fma(sumValue248, intermediateValue130, multiplyAddValue54);
                multiplyAddValue50 = fma(sumValue248, intermediateValue128, multiplyAddValue55);
                multiplyAddValue46 = fma(sumValue248, intermediateValue126, quotientValue7);
                multiplyAddValue45 = fma(sumValue248, intermediateValue124, quotientValue8);
                multiplyAddValue44 = fma(sumValue248, intermediateValue122, quotientValue9);
            }
            else
            {
                multiplyAddValue52 = multiplyAddValue53;
                multiplyAddValue51 = multiplyAddValue54;
                multiplyAddValue50 = multiplyAddValue55;
                multiplyAddValue46 = quotientValue7;
                multiplyAddValue45 = quotientValue8;
                multiplyAddValue44 = quotientValue9;
            }
            float intermediateValue136;
            float intermediateValue138;
            float intermediateValue140;
            if (comparisonValue200 && (fragmentScalarConstants1.packedValues[603u] != 0.0))
            {
                float multiplyAddValue348 = fma(productValue236, 0.20000000298023223876953125, sumValue208 - 0.5);
                float multiplyAddValue349 = fma(productValue237, 0.20000000298023223876953125, sumValue209 - 0.5);
                float multiplyAddValue350 = fma(productValue238, 0.20000000298023223876953125, sumValue210 - 0.5);
                uint productValue386 = uint(int(floor(floor(multiplyAddValue348) * 0.0625)));
                uint productValue387 = uint(int(floor(floor(multiplyAddValue349) * 0.0625)));
                uint productValue388 = uint(int(floor(floor(multiplyAddValue350) * 0.0625)));
                uint scalarValue278 = bitfieldInsert(productValue386, productValue387, int(16u), int(16u));
                uint scalarValue279 = bitfieldInsert(131072u, productValue388, int(0u), int(16u));
                uint productValue389 = productValue386 * 1540483477u;
                uint productValue390 = productValue387 * 1540483477u;
                uint productValue391 = productValue388 * 1540483477u;
                uint bitwiseValue126 = ((((productValue391 ^ (productValue391 >> 24u)) * 1540483477u) ^ ((((productValue390 ^ (productValue390 >> 24u)) * 1540483477u) ^ ((((productValue389 ^ (productValue389 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u)) * 1540483477u) ^ 2418085729u;
                uint bitwiseValue127 = ((bitwiseValue126 >> 13u) ^ bitwiseValue126) * 1540483477u;
                uint bitwiseValue128 = bitwiseValue127 ^ (bitwiseValue127 >> 15u);
                uint bitwiseValue129 = (bitwiseValue128 ^ (bitwiseValue128 >> 16u)) & 65535u;
                bool comparisonValue215 = bitwiseValue129 != 0u;
                uint bitwiseValue130 = bitwiseValue129 | 1u;
                uint sumValue249 = uint(fragmentScalarConstants1.packedValues[308u]) - 1u;
                uint comparisonValue216 = (comparisonValue215 ? bitwiseValue129 : bitwiseValue130) & sumValue249;
                uint comparisonValue25;
                uint comparisonValue26;
                uint bitwiseValue7;
                uint sumValue31;
                uint intermediateValue202;
                uint intermediateValue203;
                uint scalarValue127 = 0u;
                uint scalarValue128 = 0u;
                uint scalarValue280 = comparisonValue216;
                uint scalarValue130 = 0u;
                for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float productValue212 = (multiplyAddValue9 + 1.0) * 0.5;
                float productValue213 = (multiplyAddValue10 + 1.0) * 0.5;
                uint scalarValue65 = uint(int(fragmentVectorConstants1.packedValues[162u].z));
                float multiplyAddValue57 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue11, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue10, multiplyAddValue9 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue11, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue10, multiplyAddValue9 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[163u].x) / (fragmentVectorConstants1.packedValues[163u].y - fragmentVectorConstants1.packedValues[163u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue65))) + (-0.5);
                uint sumValue136 = uint(min(int(uint(max(int(uint(int(multiplyAddValue57))), int(0u)))), int(scalarValue65 + 4294967294u)));
                float scalarValue66 = float(int(sumValue136));
                vec4 sampledTextureValue48 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue212, productValue213, scalarValue66), 0.0);
                float scalarValue67 = sampledTextureValue48.w;
                float sampledTextureValue50 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue212, productValue213, float(int(sumValue136 + 1u))), 0.0).w - scalarValue67) * spvNMin(spvNMax(multiplyAddValue57 - scalarValue66, 0.0), 1.0)) + scalarValue67;
                branchMergedValue14 = sampledTextureValue50 * productValue206;
                branchMergedValue24 = sampledTextureValue50 * productValue211;
                branchMergedValue25 = sampledTextureValue50 * productValue210;
            }
            else
            {
                branchMergedValue14 = productValue206;
                branchMergedValue24 = productValue211;
                branchMergedValue25 = productValue210;
            }
            intermediateValue72 = branchMergedValue14;
            intermediateValue73 = branchMergedValue25;
            intermediateValue74 = branchMergedValue24;
        }
        else
        {
            float branchMergedValue13;
            float branchMergedValue22;
            float branchMergedValue23;
            if (comparisonValue104)
            {
                float multiplyAddValue38;
                float multiplyAddValue39;
                float multiplyAddValue40;
                if (fragmentVectorConstants1.packedValues[151u].w > 0.0)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float productValue529 = ((varyingTexCoord3.x + (-0.5)) + (productValue3 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[132u].x;
                float productValue530 = ((varyingTexCoord3.y + (-0.5)) + (productValue4 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[132u].y;
                float productValue531 = ((varyingTexCoord3.z + (-0.5)) + (productValue5 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[132u].z;
                float productValue532 = floor(productValue529 * 0.0625) * 16.0;
                float productValue533 = floor(productValue530 * 0.0625) * 16.0;
                float productValue534 = floor(productValue531 * 0.0625) * 16.0;
                uint productValue535 = uint(int(floor(float(int(uint(int(floor(productValue529))))) * 0.0625)));
                uint productValue536 = uint(int(floor(float(int(uint(int(floor(productValue530))))) * 0.0625)));
                uint productValue537 = uint(int(floor(float(int(uint(int(floor(productValue531))))) * 0.0625)));
                float sumValue329 = productValue529 - productValue532;
                float sumValue330 = productValue530 - productValue533;
                float sumValue331 = productValue531 - productValue534;
                uint bitwiseValue207 = (productValue536 << 16u) | (productValue535 & 65535u);
                uint bitwiseValue208 = (productValue537 & 65535u) | 131072u;
                uint productValue538 = productValue535 * 1540483477u;
                uint productValue539 = productValue536 * 1540483477u;
                uint productValue540 = productValue537 * 1540483477u;
                uint bitwiseValue209 = (((((((((productValue538 >> 24u) ^ productValue538) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue539 >> 24u) ^ productValue539) * 1540483477u)) * 1540483477u) ^ (((productValue540 >> 24u) ^ productValue540) * 1540483477u)) * 1540483477u) ^ 2418085729u;
                uint bitwiseValue210 = ((bitwiseValue209 >> 13u) ^ bitwiseValue209) * 1540483477u;
                uint bitwiseValue211 = (bitwiseValue210 >> 15u) ^ bitwiseValue210;
                uint bitwiseValue212 = bitwiseValue211 >> 16u;
                uint bitwiseValue213 = bitwiseValue211 & 65535u;
                uint comparisonValue278 = uint(bitwiseValue213 == bitwiseValue212) | (bitwiseValue213 ^ bitwiseValue212);
                uint sumValue332 = uint(fragmentVectorConstants1.packedValues[77u].x) + 4294967295u;
                bool intermediateValue73;
                uint scalarValue368 = comparisonValue278;
                uint scalarValue25 = 0u;
                uint scalarValue26 = 0u;
                uint sampledTextureValue5;
                uint bitwiseValue7;
                for (;;)
#endif
                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(scalarValue130) >= int(8u))
                    {
                        intermediateValue150 = scalarValue128;
                        intermediateValue151 = scalarValue127;
                        break;
                    }
                    uint bitwiseValue44 = intermediateValue7.packedValues[scalarValue129].z & 65535u;
                    bool comparisonValue134 = (intermediateValue7.packedValues[scalarValue129].y == bitwiseValue38) && ((((!comparisonValue132) && (bitwiseValue43 == bitwiseValue44)) || (comparisonValue132 && (bitwiseValue42 == bitwiseValue44))) && (intermediateValue7.packedValues[scalarValue129].x == scalarValue126));
                    bool comparisonValue135 = scalarValue127 != 0u;
                    comparisonValue9 = (comparisonValue135 || (!comparisonValue134)) ? scalarValue128 : intermediateValue7.packedValues[scalarValue129].w;
                    comparisonValue8 = comparisonValue134 ? 4294967295u : scalarValue127;
                    bitwiseValue7 = sumValue158 & (scalarValue129 + 1u);
                    bool comparisonValue136 = (bitwiseValue44 == 0u) || comparisonValue134;
                    if ((comparisonValue135 && (!comparisonValue136)) || comparisonValue136)
                    {
                        intermediateValue150 = comparisonValue9;
                        intermediateValue151 = comparisonValue8;
                        break;
                    }
                    sumValue16 = scalarValue130 + 1u;
                    scalarValue127 = comparisonValue8;
                    scalarValue128 = comparisonValue9;
                    scalarValue129 = bitwiseValue7;
                    scalarValue130 = sumValue16;
                    continue;
                }
                float intermediateValue89;
                float intermediateValue91;
                float intermediateValue93;
                if (intermediateValue151 != 0u)
                {
                    float productValue278 = floor(multiplyAddValue169 * 0.0625);
                    float productValue279 = floor(multiplyAddValue170 * 0.0625);
                    float productValue280 = floor(multiplyAddValue171 * 0.0625);
                    float multiplyAddValue172 = fma(-productValue278, 16.0, multiplyAddValue169);
                    float multiplyAddValue173 = fma(-productValue279, 16.0, multiplyAddValue170);
                    float multiplyAddValue176 = fma(-productValue280, 16.0, multiplyAddValue171);
                    uint bitwiseValue45 = intermediateValue150 >> 2u;
                    float scalarValue131 = abs(productValue236);
                    float scalarValue132 = abs(productValue237);
                    float scalarValue133 = abs(productValue238);
                    float multiplyAddValue124;
                    float multiplyAddValue125;
                    float multiplyAddValue126;
                    if (((scalarValue131 >= 1.0) || (scalarValue132 >= 1.0)) || (scalarValue133 >= 1.0))
                    {
                        vec3 vectorValue12 = vec3(scalarValue131, scalarValue132, scalarValue133);
                        float scalarValue134 = rdDot3Precise(vec3(multiplyAddValue172, multiplyAddValue173, multiplyAddValue176), vectorValue12);
                        float scalarValue135 = rdDot3Precise(vec3(multiplyAddValue173, multiplyAddValue176, multiplyAddValue172), vectorValue12);
                        float scalarValue136 = rdDot3Precise(vec3(multiplyAddValue176, multiplyAddValue172, multiplyAddValue173), vectorValue12);
                        float multiplyAddValue177 = (fma(varyingNormal0.z, inverseLengthValue13, productValue237 + productValue236) > 0.0) ? ceil(scalarValue134) : floor(scalarValue134);
                        float scalarValue137 = floor(scalarValue135);
                        float scalarValue138 = floor(scalarValue136);
                        float multiplyAddValue178 = fma(scalarValue132, scalarValue138, fma(scalarValue131, multiplyAddValue177, scalarValue133 * scalarValue137));
                        float multiplyAddValue179 = fma(scalarValue133, scalarValue138, fma(scalarValue132, multiplyAddValue177, scalarValue131 * scalarValue137));
                        float multiplyAddValue180 = fma(scalarValue131, scalarValue138, fma(scalarValue133, multiplyAddValue177, scalarValue132 * scalarValue137));
                        float sumValue159 = scalarValue133 + multiplyAddValue178;
                        float sumValue160 = scalarValue131 + multiplyAddValue179;
                        float sumValue161 = scalarValue132 + multiplyAddValue180;
                        float sumValue162 = scalarValue132 + multiplyAddValue178;
                        float sumValue163 = scalarValue133 + multiplyAddValue179;
                        float sumValue164 = scalarValue131 + multiplyAddValue180;
                        float sumValue165 = scalarValue132 + sumValue159;
                        float sumValue166 = scalarValue133 + sumValue160;
                        float sumValue167 = scalarValue131 + sumValue161;
                        float sumValue168 = scalarValue135 - scalarValue137;
                        float sumValue169 = scalarValue136 - scalarValue138;
                        float sumValue170 = (scalarValue137 - scalarValue135) + 1.0;
                        float sumValue171 = (scalarValue138 - scalarValue136) + 1.0;
                        float productValue281 = sumValue170 * sumValue171;
                        float productValue282 = sumValue168 * sumValue171;
                        float productValue283 = sumValue169 * sumValue170;
                        float productValue284 = sumValue168 * sumValue169;
                        float comparisonValue55;
                        float comparisonValue56;
                        float comparisonValue57;
                        float comparisonValue58;
                        float comparisonValue59;
                        float comparisonValue60;
                        float comparisonValue61;
                        float comparisonValue62;
                        float comparisonValue63;
                        float comparisonValue64;
                        float comparisonValue65;
                        float comparisonValue66;
                        if (((sumValue167 < 16.0) && ((sumValue165 < 16.0) && (sumValue166 < 16.0))) && (((multiplyAddValue178 >= 0.0) && (multiplyAddValue179 >= 0.0)) && (multiplyAddValue180 >= 0.0)))
                        {
                            uint bitwiseValue46 = bitwiseValue45 + (((uint(multiplyAddValue180) << 4u) + uint(multiplyAddValue179)) + (uint(multiplyAddValue178) << 8u));
                            float bitwiseValue47 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[bitwiseValue46] & 255u);
                            float bitwiseValue48 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue46] >> 8u) & 255u);
                            float bitwiseValue49 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue46] >> 16u) & 255u);
                            float bitwiseValue50 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue46] >> 24u) & 255u);
                            float productValue285 = bitwiseValue50 * 0.0039215688593685626983642578125;
                            bool comparisonValue137 = intermediateValue8.packedValues[bitwiseValue46] != 0u;
                            uint bitwiseValue51 = bitwiseValue45 + (((uint(sumValue161) << 4u) + uint(sumValue160)) + (uint(sumValue159) << 8u));
                            float bitwiseValue52 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[bitwiseValue51] & 255u);
                            float bitwiseValue53 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue51] >> 8u) & 255u);
                            float bitwiseValue54 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue51] >> 16u) & 255u);
                            float bitwiseValue55 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue51] >> 24u) & 255u);
                            float productValue286 = bitwiseValue55 * 0.0039215688593685626983642578125;
                            bool comparisonValue138 = intermediateValue8.packedValues[bitwiseValue51] != 0u;
                            uint bitwiseValue56 = bitwiseValue45 + (((uint(sumValue164) << 4u) + uint(sumValue163)) + (uint(sumValue162) << 8u));
                            float bitwiseValue57 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[bitwiseValue56] & 255u);
                            float bitwiseValue58 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue56] >> 8u) & 255u);
                            float bitwiseValue59 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue56] >> 16u) & 255u);
                            float bitwiseValue60 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue56] >> 24u) & 255u);
                            float productValue287 = bitwiseValue60 * 0.0039215688593685626983642578125;
                            bool comparisonValue139 = intermediateValue8.packedValues[bitwiseValue56] != 0u;
                            uint bitwiseValue61 = bitwiseValue45 + (((uint(sumValue167) << 4u) + uint(sumValue166)) + (uint(sumValue165) << 8u));
                            float bitwiseValue62 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[bitwiseValue61] & 255u);
                            float bitwiseValue63 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue61] >> 8u) & 255u);
                            float bitwiseValue64 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue61] >> 16u) & 255u);
                            float bitwiseValue65 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue61] >> 24u) & 255u);
                            float productValue288 = bitwiseValue65 * 0.0039215688593685626983642578125;
                            bool comparisonValue140 = intermediateValue8.packedValues[bitwiseValue61] != 0u;
                            comparisonValue55 = comparisonValue140 ? ((productValue288 * (bitwiseValue64 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue56 = comparisonValue140 ? ((productValue288 * (bitwiseValue63 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue57 = comparisonValue140 ? ((productValue288 * (bitwiseValue62 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue58 = comparisonValue139 ? ((productValue287 * (bitwiseValue59 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue59 = comparisonValue139 ? ((productValue287 * (bitwiseValue58 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue60 = comparisonValue139 ? ((productValue287 * (bitwiseValue57 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue61 = comparisonValue137 ? ((productValue285 * (bitwiseValue49 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue62 = comparisonValue137 ? ((productValue285 * (bitwiseValue48 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue63 = comparisonValue137 ? ((productValue285 * (bitwiseValue47 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue64 = comparisonValue138 ? ((productValue286 * (bitwiseValue54 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue65 = comparisonValue138 ? ((productValue286 * (bitwiseValue53 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue66 = comparisonValue138 ? ((productValue286 * (bitwiseValue52 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        }
                        else
                        {
                            float multiplyAddValue181 = fma(productValue278, 16.0, multiplyAddValue178);
                            float multiplyAddValue182 = fma(productValue279, 16.0, multiplyAddValue179);
                            float multiplyAddValue183 = fma(productValue280, 16.0, multiplyAddValue180);
                            uint comparisonValue141 = min(((bitfieldInsert(0u, (multiplyAddValue180 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + ((bitfieldInsert(0u, (multiplyAddValue179 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (multiplyAddValue178 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (multiplyAddValue178 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (multiplyAddValue179 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))) + bitfieldInsert(0u, (multiplyAddValue180 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)))) + 4u), 68u);
                            uint scalarValue139 = intermediateValue18[comparisonValue141].x;
                            bool conditionValue6 = int(scalarValue139) < int(0u);
                            uint sumValue172 = bitwiseValue45 + 4097u;
                            uint sumValue173 = bitwiseValue45 + 4096u;
                            uint multiplyAddValue184 = conditionValue6 ? (bitwiseValue45 + (bitfieldInsert(bitfieldInsert(0u, uint(multiplyAddValue180), int(4u), int(4u)), uint(multiplyAddValue179), int(0u), int(4u)) + bitfieldInsert(0u, uint(multiplyAddValue178), int(8u), int(4u)))) : ((intermediateValue8.packedValues[scalarValue139 + sumValue172] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue183 * 0.0625), 16.0, multiplyAddValue183)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue182 * 0.0625), 16.0, multiplyAddValue182)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue181 * 0.0625), 16.0, multiplyAddValue181)), int(8u), int(4u))));
                            float bitwiseValue66 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[multiplyAddValue184] & 255u);
                            float bitwiseValue67 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue184] >> 8u) & 255u);
                            float bitwiseValue68 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue184] >> 16u) & 255u);
                            float bitwiseValue69 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue184] >> 24u) & 255u);
                            float productValue289 = bitwiseValue69 * 0.0039215688593685626983642578125;
                            bool comparisonValue142 = (conditionValue6 || ((intermediateValue8.packedValues[sumValue173] & (1u << (scalarValue139 & 31u))) != 0u)) && (intermediateValue8.packedValues[multiplyAddValue184] != 0u);
                            float multiplyAddValue185 = fma(productValue278, 16.0, sumValue159);
                            float multiplyAddValue186 = fma(productValue279, 16.0, sumValue160);
                            float multiplyAddValue187 = fma(productValue280, 16.0, sumValue161);
                            uint comparisonValue143 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue159 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue159 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue160 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue160 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue161 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue161 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                            uint scalarValue140 = intermediateValue18[comparisonValue143].x;
                            bool conditionValue7 = int(scalarValue140) < int(0u);
                            uint multiplyAddValue188 = conditionValue7 ? (bitwiseValue45 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue161), int(4u), int(4u)), uint(sumValue160), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue159), int(8u), int(4u)))) : ((intermediateValue8.packedValues[scalarValue140 + sumValue172] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue187 * 0.0625), 16.0, multiplyAddValue187)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue186 * 0.0625), 16.0, multiplyAddValue186)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue185 * 0.0625), 16.0, multiplyAddValue185)), int(8u), int(4u))));
                            float bitwiseValue70 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[multiplyAddValue188] & 255u);
                            float bitwiseValue71 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue188] >> 8u) & 255u);
                            float bitwiseValue72 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue188] >> 16u) & 255u);
                            float bitwiseValue73 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue188] >> 24u) & 255u);
                            float productValue290 = bitwiseValue73 * 0.0039215688593685626983642578125;
                            bool comparisonValue144 = (conditionValue7 || ((intermediateValue8.packedValues[sumValue173] & (1u << (scalarValue140 & 31u))) != 0u)) && (intermediateValue8.packedValues[multiplyAddValue188] != 0u);
                            float multiplyAddValue189 = fma(productValue278, 16.0, sumValue162);
                            float multiplyAddValue190 = fma(productValue279, 16.0, sumValue163);
                            float multiplyAddValue191 = fma(productValue280, 16.0, sumValue164);
                            uint comparisonValue145 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue162 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue162 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue163 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue163 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue164 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue164 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                            uint scalarValue141 = intermediateValue18[comparisonValue145].x;
                            bool conditionValue8 = int(scalarValue141) < int(0u);
                            uint multiplyAddValue192 = conditionValue8 ? (bitwiseValue45 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue164), int(4u), int(4u)), uint(sumValue163), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue162), int(8u), int(4u)))) : ((intermediateValue8.packedValues[scalarValue141 + sumValue172] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue191 * 0.0625), 16.0, multiplyAddValue191)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue190 * 0.0625), 16.0, multiplyAddValue190)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue189 * 0.0625), 16.0, multiplyAddValue189)), int(8u), int(4u))));
                            float bitwiseValue74 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[multiplyAddValue192] & 255u);
                            float bitwiseValue75 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue192] >> 8u) & 255u);
                            float bitwiseValue76 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue192] >> 16u) & 255u);
                            float bitwiseValue77 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue192] >> 24u) & 255u);
                            float productValue291 = bitwiseValue77 * 0.0039215688593685626983642578125;
                            bool comparisonValue146 = (conditionValue8 || ((intermediateValue8.packedValues[sumValue173] & (1u << (scalarValue141 & 31u))) != 0u)) && (intermediateValue8.packedValues[multiplyAddValue192] != 0u);
                            float multiplyAddValue193 = fma(productValue278, 16.0, sumValue165);
                            float multiplyAddValue194 = fma(productValue279, 16.0, sumValue166);
                            float multiplyAddValue195 = fma(productValue280, 16.0, sumValue167);
                            uint comparisonValue147 = min(((bitfieldInsert(0u, (sumValue167 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue167 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue166 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue165 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue165 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue166 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                            uint scalarValue142 = intermediateValue18[comparisonValue147].x;
                            bool conditionValue9 = int(scalarValue142) < int(0u);
                            uint multiplyAddValue196 = conditionValue9 ? (bitwiseValue45 + (bitfieldInsert(0u, uint(sumValue165), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue167), int(4u), int(4u)), uint(sumValue166), int(0u), int(4u)))) : ((intermediateValue8.packedValues[scalarValue142 + sumValue172] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue193 * 0.0625), 16.0, multiplyAddValue193)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue195 * 0.0625), 16.0, multiplyAddValue195)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue194 * 0.0625), 16.0, multiplyAddValue194)), int(0u), int(4u))));
                            float bitwiseValue78 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[multiplyAddValue196] & 255u);
                            float bitwiseValue79 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue196] >> 8u) & 255u);
                            float bitwiseValue80 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue196] >> 16u) & 255u);
                            float bitwiseValue81 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue196] >> 24u) & 255u);
                            float productValue292 = bitwiseValue81 * 0.0039215688593685626983642578125;
                            bool comparisonValue148 = (conditionValue9 || ((intermediateValue8.packedValues[sumValue173] & (1u << (scalarValue142 & 31u))) != 0u)) && (intermediateValue8.packedValues[multiplyAddValue196] != 0u);
                            comparisonValue55 = comparisonValue148 ? ((productValue292 * (bitwiseValue80 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue56 = comparisonValue148 ? ((productValue292 * (bitwiseValue79 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue57 = comparisonValue148 ? ((productValue292 * (bitwiseValue78 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue58 = comparisonValue146 ? ((productValue291 * (bitwiseValue76 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue59 = comparisonValue146 ? ((productValue291 * (bitwiseValue75 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue60 = comparisonValue146 ? ((productValue291 * (bitwiseValue74 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue61 = comparisonValue142 ? ((productValue289 * (bitwiseValue68 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue62 = comparisonValue142 ? ((productValue289 * (bitwiseValue67 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue63 = comparisonValue142 ? ((productValue289 * (bitwiseValue66 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue64 = comparisonValue144 ? ((productValue290 * (bitwiseValue72 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue65 = comparisonValue144 ? ((productValue290 * (bitwiseValue71 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue66 = comparisonValue144 ? ((productValue290 * (bitwiseValue70 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        }
                        multiplyAddValue124 = fma(comparisonValue57, productValue284, fma(comparisonValue60, productValue283, fma(comparisonValue63, productValue281, productValue282 * comparisonValue66)));
                        multiplyAddValue125 = fma(comparisonValue56, productValue284, fma(comparisonValue59, productValue283, fma(comparisonValue62, productValue281, productValue282 * comparisonValue65)));
                        multiplyAddValue126 = fma(comparisonValue55, productValue284, fma(comparisonValue58, productValue283, fma(comparisonValue61, productValue281, productValue282 * comparisonValue64)));
                    }
                    else
                    {
                        float scalarValue143 = floor(multiplyAddValue172);
                        float scalarValue144 = floor(multiplyAddValue173);
                        float scalarValue145 = floor(multiplyAddValue176);
                        float sumValue174 = multiplyAddValue172 - scalarValue143;
                        float sumValue175 = multiplyAddValue173 - scalarValue144;
                        float sumValue176 = multiplyAddValue176 - scalarValue145;
                        uint comparisonValue149 = bitfieldInsert(bitfieldInsert(0u, (sumValue175 >= sumValue176) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue174 >= sumValue175) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue174 >= sumValue176) ? 4294967295u : 0u, int(2u), int(1u));
                        float scalarValue146 = spvNMin(sumValue175, sumValue174);
                        float scalarValue147 = spvNMax(sumValue175, sumValue174);
                        float scalarValue148 = spvNMin(sumValue176, scalarValue146);
                        float scalarValue149 = spvNMax(sumValue176, scalarValue147);
                        float scalarValue150 = spvNMax(scalarValue146, spvNMin(sumValue176, scalarValue147));
                        float sumValue177 = 1.0 - scalarValue149;
                        float sumValue178 = scalarValue149 - scalarValue150;
                        float sumValue179 = scalarValue150 - scalarValue148;
                        float sumValue180 = scalarValue143 + 1.0;
                        float sumValue181 = scalarValue144 + 1.0;
                        float sumValue182 = scalarValue145 + 1.0;
                        float comparisonValue67;
                        float comparisonValue68;
                        float comparisonValue69;
                        float comparisonValue70;
                        float comparisonValue71;
                        float comparisonValue72;
                        float comparisonValue73;
                        float comparisonValue74;
                        float comparisonValue75;
                        float comparisonValue76;
                        float comparisonValue77;
                        float comparisonValue78;
                        if (((sumValue182 < 16.0) && ((sumValue180 < 16.0) && (sumValue181 < 16.0))) && (((scalarValue143 >= 0.0) && (scalarValue144 >= 0.0)) && (scalarValue145 >= 0.0)))
                        {
                            uint scalarValue151 = uint(scalarValue143);
                            uint scalarValue152 = uint(scalarValue144);
                            uint scalarValue153 = uint(scalarValue145);
                            uint sumValue183 = min((comparisonValue149 + 4u), 68u);
                            uint scalarValue154 = intermediateValue18[sumValue183].y;
                            uint scalarValue155 = intermediateValue18[sumValue183].z;
                            uint sumValue184 = min((comparisonValue149 + 12u), 68u);
                            uint scalarValue156 = intermediateValue18[sumValue184].y;
                            uint scalarValue157 = intermediateValue18[sumValue184].z;
                            uint bitwiseValue82 = bitwiseValue45 + (((scalarValue153 << 4u) + scalarValue152) + (scalarValue151 << 8u));
                            float bitwiseValue83 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[bitwiseValue82] & 255u);
                            float bitwiseValue84 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue82] >> 8u) & 255u);
                            float bitwiseValue85 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue82] >> 16u) & 255u);
                            float bitwiseValue86 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue82] >> 24u) & 255u);
                            float productValue293 = bitwiseValue86 * 0.0039215688593685626983642578125;
                            bool comparisonValue150 = intermediateValue8.packedValues[bitwiseValue82] != 0u;
                            uint bitwiseValue87 = bitwiseValue45 + ((((uint(comparisonValue149 < 2u) + scalarValue153) << 4u) + (scalarValue155 + scalarValue152)) + ((scalarValue154 + scalarValue151) << 8u));
                            float bitwiseValue88 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[bitwiseValue87] & 255u);
                            float bitwiseValue89 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue87] >> 8u) & 255u);
                            float bitwiseValue90 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue87] >> 16u) & 255u);
                            float bitwiseValue91 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue87] >> 24u) & 255u);
                            float productValue294 = bitwiseValue91 * 0.0039215688593685626983642578125;
                            bool comparisonValue151 = intermediateValue8.packedValues[bitwiseValue87] != 0u;
                            uint bitwiseValue92 = bitwiseValue45 + ((((uint(comparisonValue149 < 6u) + scalarValue153) << 4u) + (scalarValue157 + scalarValue152)) + ((scalarValue156 + scalarValue151) << 8u));
                            float bitwiseValue93 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[bitwiseValue92] & 255u);
                            float bitwiseValue94 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue92] >> 8u) & 255u);
                            float bitwiseValue95 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue92] >> 16u) & 255u);
                            float bitwiseValue96 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue92] >> 24u) & 255u);
                            float productValue295 = bitwiseValue96 * 0.0039215688593685626983642578125;
                            bool comparisonValue152 = intermediateValue8.packedValues[bitwiseValue92] != 0u;
                            uint bitwiseValue97 = bitwiseValue45 + ((((scalarValue153 + 1u) << 4u) + (scalarValue152 + 1u)) + ((scalarValue151 + 1u) << 8u));
                            float bitwiseValue98 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[bitwiseValue97] & 255u);
                            float bitwiseValue99 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue97] >> 8u) & 255u);
                            float bitwiseValue100 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue97] >> 16u) & 255u);
                            float bitwiseValue101 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[bitwiseValue97] >> 24u) & 255u);
                            float productValue296 = bitwiseValue101 * 0.0039215688593685626983642578125;
                            bool comparisonValue153 = intermediateValue8.packedValues[bitwiseValue97] != 0u;
                            comparisonValue67 = comparisonValue153 ? ((productValue296 * (bitwiseValue100 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue68 = comparisonValue153 ? ((productValue296 * (bitwiseValue99 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue69 = comparisonValue153 ? ((productValue296 * (bitwiseValue98 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue70 = comparisonValue152 ? ((productValue295 * (bitwiseValue95 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue71 = comparisonValue152 ? ((productValue295 * (bitwiseValue94 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue72 = comparisonValue152 ? ((productValue295 * (bitwiseValue93 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue73 = comparisonValue150 ? ((productValue293 * (bitwiseValue85 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue74 = comparisonValue150 ? ((productValue293 * (bitwiseValue84 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue75 = comparisonValue150 ? ((productValue293 * (bitwiseValue83 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue76 = comparisonValue151 ? ((productValue294 * (bitwiseValue90 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue77 = comparisonValue151 ? ((productValue294 * (bitwiseValue89 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue78 = comparisonValue151 ? ((productValue294 * (bitwiseValue88 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        }
                        else
                        {
                            uint sumValue185 = min((comparisonValue149 + 4u), 68u);
                            uint scalarValue158 = intermediateValue18[sumValue185].y;
                            uint scalarValue159 = intermediateValue18[sumValue185].z;
                            float scalarValue160 = rdEvaluateFloatExpression2(scalarValue158);
                            float scalarValue161 = rdEvaluateFloatExpression2(scalarValue159);
                            float scalarValue162 = rdEvaluateFloatExpression2(uint(comparisonValue149 < 2u));
                            float sumValue186 = scalarValue143 + scalarValue160;
                            float sumValue187 = scalarValue144 + scalarValue161;
                            float sumValue188 = scalarValue145 + scalarValue162;
                            uint sumValue189 = min((comparisonValue149 + 12u), 68u);
                            uint scalarValue163 = intermediateValue18[sumValue189].y;
                            uint scalarValue164 = intermediateValue18[sumValue189].z;
                            float scalarValue165 = rdEvaluateFloatExpression2(scalarValue163);
                            float scalarValue166 = rdEvaluateFloatExpression2(scalarValue164);
                            float scalarValue167 = rdEvaluateFloatExpression2(uint(comparisonValue149 < 6u));
                            float sumValue190 = scalarValue143 + scalarValue165;
                            float sumValue191 = scalarValue144 + scalarValue166;
                            float sumValue192 = scalarValue145 + scalarValue167;
                            float multiplyAddValue197 = fma(productValue278, 16.0, scalarValue143);
                            float multiplyAddValue198 = fma(productValue279, 16.0, scalarValue144);
                            float multiplyAddValue199 = fma(productValue280, 16.0, scalarValue145);
                            uint comparisonValue154 = min((((((bitfieldInsert(bitfieldInsert(0u, (scalarValue143 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (scalarValue143 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (scalarValue144 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (scalarValue144 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (scalarValue145 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (scalarValue145 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                            uint scalarValue168 = intermediateValue18[comparisonValue154].x;
                            bool conditionValue10 = int(scalarValue168) < int(0u);
                            uint sumValue193 = bitwiseValue45 + 4097u;
                            uint sumValue194 = bitwiseValue45 + 4096u;
                            uint multiplyAddValue200 = conditionValue10 ? (bitwiseValue45 + (bitfieldInsert(bitfieldInsert(0u, uint(scalarValue145), int(4u), int(4u)), uint(scalarValue144), int(0u), int(4u)) + bitfieldInsert(0u, uint(scalarValue143), int(8u), int(4u)))) : ((intermediateValue8.packedValues[scalarValue168 + sumValue193] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue199 * 0.0625), 16.0, multiplyAddValue199)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue198 * 0.0625), 16.0, multiplyAddValue198)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue197 * 0.0625), 16.0, multiplyAddValue197)), int(8u), int(4u))));
                            float bitwiseValue102 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[multiplyAddValue200] & 255u);
                            float bitwiseValue103 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue200] >> 8u) & 255u);
                            float bitwiseValue104 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue200] >> 16u) & 255u);
                            float bitwiseValue105 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue200] >> 24u) & 255u);
                            float productValue297 = bitwiseValue105 * 0.0039215688593685626983642578125;
                            bool comparisonValue155 = (conditionValue10 || ((intermediateValue8.packedValues[sumValue194] & (1u << (scalarValue168 & 31u))) != 0u)) && (intermediateValue8.packedValues[multiplyAddValue200] != 0u);
                            float multiplyAddValue201 = fma(productValue278, 16.0, sumValue186);
                            float multiplyAddValue202 = fma(productValue279, 16.0, sumValue187);
                            float multiplyAddValue203 = fma(productValue280, 16.0, sumValue188);
                            uint comparisonValue156 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue186 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue186 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue187 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue187 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue188 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue188 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                            uint scalarValue169 = intermediateValue18[comparisonValue156].x;
                            bool conditionValue11 = int(scalarValue169) < int(0u);
                            uint multiplyAddValue204 = conditionValue11 ? (bitwiseValue45 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue188), int(4u), int(4u)), uint(sumValue187), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue186), int(8u), int(4u)))) : ((intermediateValue8.packedValues[scalarValue169 + sumValue193] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue203 * 0.0625), 16.0, multiplyAddValue203)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue202 * 0.0625), 16.0, multiplyAddValue202)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue201 * 0.0625), 16.0, multiplyAddValue201)), int(8u), int(4u))));
                            float bitwiseValue106 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[multiplyAddValue204] & 255u);
                            float bitwiseValue107 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue204] >> 8u) & 255u);
                            float bitwiseValue108 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue204] >> 16u) & 255u);
                            float bitwiseValue109 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue204] >> 24u) & 255u);
                            float productValue298 = bitwiseValue109 * 0.0039215688593685626983642578125;
                            bool comparisonValue157 = (conditionValue11 || ((intermediateValue8.packedValues[sumValue194] & (1u << (scalarValue169 & 31u))) != 0u)) && (intermediateValue8.packedValues[multiplyAddValue204] != 0u);
                            float multiplyAddValue205 = fma(productValue278, 16.0, sumValue190);
                            float multiplyAddValue206 = fma(productValue279, 16.0, sumValue191);
                            float multiplyAddValue207 = fma(productValue280, 16.0, sumValue192);
                            uint comparisonValue158 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue190 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue190 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue191 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue191 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue192 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue192 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                            uint scalarValue170 = intermediateValue18[comparisonValue158].x;
                            bool conditionValue12 = int(scalarValue170) < int(0u);
                            uint multiplyAddValue208 = conditionValue12 ? (bitwiseValue45 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue192), int(4u), int(4u)), uint(sumValue191), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue190), int(8u), int(4u)))) : ((intermediateValue8.packedValues[scalarValue170 + sumValue193] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue205 * 0.0625), 16.0, multiplyAddValue205)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue207 * 0.0625), 16.0, multiplyAddValue207)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue206 * 0.0625), 16.0, multiplyAddValue206)), int(0u), int(4u))));
                            float bitwiseValue110 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[multiplyAddValue208] & 255u);
                            float bitwiseValue111 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue208] >> 8u) & 255u);
                            float bitwiseValue112 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue208] >> 16u) & 255u);
                            float bitwiseValue113 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue208] >> 24u) & 255u);
                            float productValue299 = bitwiseValue113 * 0.0039215688593685626983642578125;
                            bool comparisonValue159 = (conditionValue12 || ((intermediateValue8.packedValues[sumValue194] & (1u << (scalarValue170 & 31u))) != 0u)) && (intermediateValue8.packedValues[multiplyAddValue208] != 0u);
                            float multiplyAddValue209 = fma(productValue278, 16.0, sumValue180);
                            float multiplyAddValue210 = fma(productValue279, 16.0, sumValue181);
                            float multiplyAddValue211 = fma(productValue280, 16.0, sumValue182);
                            uint comparisonValue160 = min(((bitfieldInsert(0u, (sumValue182 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue182 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue181 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue180 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue180 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue181 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                            uint scalarValue171 = intermediateValue18[comparisonValue160].x;
                            bool conditionValue13 = int(scalarValue171) < int(0u);
                            uint multiplyAddValue212 = conditionValue13 ? (bitwiseValue45 + (bitfieldInsert(0u, uint(sumValue180), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue182), int(4u), int(4u)), uint(sumValue181), int(0u), int(4u)))) : ((intermediateValue8.packedValues[scalarValue171 + sumValue193] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue209 * 0.0625), 16.0, multiplyAddValue209)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue211 * 0.0625), 16.0, multiplyAddValue211)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue210 * 0.0625), 16.0, multiplyAddValue210)), int(0u), int(4u))));
                            float bitwiseValue114 = rdEvaluateFloatExpression2(intermediateValue8.packedValues[multiplyAddValue212] & 255u);
                            float bitwiseValue115 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue212] >> 8u) & 255u);
                            float bitwiseValue116 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue212] >> 16u) & 255u);
                            float bitwiseValue117 = rdEvaluateFloatExpression2((intermediateValue8.packedValues[multiplyAddValue212] >> 24u) & 255u);
                            float productValue300 = bitwiseValue117 * 0.0039215688593685626983642578125;
                            bool comparisonValue161 = (conditionValue13 || ((intermediateValue8.packedValues[sumValue194] & (1u << (scalarValue171 & 31u))) != 0u)) && (intermediateValue8.packedValues[multiplyAddValue212] != 0u);
                            comparisonValue67 = comparisonValue161 ? ((productValue300 * (bitwiseValue116 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue68 = comparisonValue161 ? ((productValue300 * (bitwiseValue115 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue69 = comparisonValue161 ? ((productValue300 * (bitwiseValue114 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue70 = comparisonValue159 ? ((productValue299 * (bitwiseValue112 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue71 = comparisonValue159 ? ((productValue299 * (bitwiseValue111 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue72 = comparisonValue159 ? ((productValue299 * (bitwiseValue110 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue73 = comparisonValue155 ? ((productValue297 * (bitwiseValue104 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue74 = comparisonValue155 ? ((productValue297 * (bitwiseValue103 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue75 = comparisonValue155 ? ((productValue297 * (bitwiseValue102 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue76 = comparisonValue157 ? ((productValue298 * (bitwiseValue108 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue77 = comparisonValue157 ? ((productValue298 * (bitwiseValue107 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue78 = comparisonValue157 ? ((productValue298 * (bitwiseValue106 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        }
                        multiplyAddValue124 = fma(comparisonValue69, scalarValue148, fma(comparisonValue72, sumValue179, fma(comparisonValue75, sumValue177, sumValue178 * comparisonValue78)));
                        multiplyAddValue125 = fma(comparisonValue68, scalarValue148, fma(comparisonValue71, sumValue179, fma(comparisonValue74, sumValue177, sumValue178 * comparisonValue77)));
                        multiplyAddValue126 = fma(comparisonValue67, scalarValue148, fma(comparisonValue70, sumValue179, fma(comparisonValue73, sumValue177, sumValue178 * comparisonValue76)));
                    }
                    intermediateValue93 = multiplyAddValue124;
                    intermediateValue91 = multiplyAddValue125;
                    intermediateValue89 = multiplyAddValue126;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(scalarValue130) >= int(8u))
                    {
                        intermediateValue202 = scalarValue128;
                        intermediateValue203 = scalarValue127;
                        break;
                    }
                    uint bitwiseValue131 = intermediateValue8.packedValues[scalarValue280].z & 65535u;
                    bool comparisonValue217 = ((((!comparisonValue215) && (bitwiseValue130 == bitwiseValue131)) || (comparisonValue215 && (bitwiseValue129 == bitwiseValue131))) && (scalarValue278 == intermediateValue8.packedValues[scalarValue280].x)) && (scalarValue279 == intermediateValue8.packedValues[scalarValue280].y);
                    bool comparisonValue135 = scalarValue127 != 0u;
                    comparisonValue26 = ((!comparisonValue217) || comparisonValue135) ? scalarValue128 : intermediateValue8.packedValues[scalarValue280].w;
                    comparisonValue25 = comparisonValue217 ? 4294967295u : scalarValue127;
                    bitwiseValue7 = sumValue249 & (scalarValue280 + 1u);
                    bool comparisonValue218 = (bitwiseValue131 == 0u) || comparisonValue217;
                    if ((comparisonValue135 && (!comparisonValue218)) || comparisonValue218)
                    {
                        intermediateValue202 = comparisonValue26;
                        intermediateValue203 = comparisonValue25;
                        break;
                    }
                    sumValue31 = scalarValue130 + 1u;
                    scalarValue127 = comparisonValue25;
                    scalarValue128 = comparisonValue26;
                    scalarValue280 = bitwiseValue7;
                    scalarValue130 = sumValue31;
                    continue;
                }
                float intermediateValue137;
                float intermediateValue139;
                float intermediateValue141;
                if (intermediateValue203 != 0u)
                {
                    float productValue392 = floor(multiplyAddValue348 * 0.0625);
                    float productValue393 = floor(multiplyAddValue349 * 0.0625);
                    float productValue394 = floor(multiplyAddValue350 * 0.0625);
                    float multiplyAddValue351 = fma(-productValue392, 16.0, multiplyAddValue348);
                    float multiplyAddValue352 = fma(-productValue393, 16.0, multiplyAddValue349);
                    float multiplyAddValue353 = fma(-productValue394, 16.0, multiplyAddValue350);
                    uint bitwiseValue132 = intermediateValue202 >> 2u;
                    float scalarValue131 = abs(productValue236);
                    float scalarValue132 = abs(productValue237);
                    float scalarValue133 = abs(productValue238);
                    float multiplyAddValue164;
                    float multiplyAddValue165;
                    float multiplyAddValue166;
                    if (((scalarValue131 >= 1.0) || (scalarValue132 >= 1.0)) || (scalarValue133 >= 1.0))
                    {
                        vec3 vectorValue12 = vec3(scalarValue131, scalarValue132, scalarValue133);
                        float scalarValue281 = rdDot3Precise(vec3(multiplyAddValue351, multiplyAddValue352, multiplyAddValue353), vectorValue12);
                        float scalarValue282 = rdDot3Precise(vec3(multiplyAddValue352, multiplyAddValue353, multiplyAddValue351), vectorValue12);
                        float scalarValue283 = rdDot3Precise(vec3(multiplyAddValue353, multiplyAddValue351, multiplyAddValue352), vectorValue12);
                        float multiplyAddValue354 = (fma(varyingNormal0.z, inverseLengthValue13, productValue237 + productValue236) > 0.0) ? ceil(scalarValue281) : floor(scalarValue281);
                        float scalarValue284 = floor(scalarValue282);
                        float scalarValue285 = floor(scalarValue283);
                        float multiplyAddValue355 = fma(scalarValue132, scalarValue285, fma(scalarValue131, multiplyAddValue354, scalarValue133 * scalarValue284));
                        float multiplyAddValue356 = fma(scalarValue133, scalarValue285, fma(scalarValue132, multiplyAddValue354, scalarValue131 * scalarValue284));
                        float multiplyAddValue357 = fma(scalarValue131, scalarValue285, fma(scalarValue133, multiplyAddValue354, scalarValue132 * scalarValue284));
                        float sumValue250 = scalarValue133 + multiplyAddValue355;
                        float sumValue251 = scalarValue131 + multiplyAddValue356;
                        float sumValue252 = scalarValue132 + multiplyAddValue357;
                        float sumValue253 = scalarValue132 + multiplyAddValue355;
                        float sumValue254 = scalarValue133 + multiplyAddValue356;
                        float sumValue255 = scalarValue131 + multiplyAddValue357;
                        float sumValue256 = scalarValue132 + sumValue250;
                        float sumValue257 = scalarValue133 + sumValue251;
                        float sumValue258 = scalarValue131 + sumValue252;
                        float sumValue259 = scalarValue282 - scalarValue284;
                        float sumValue260 = scalarValue283 - scalarValue285;
                        float sumValue261 = (scalarValue284 - scalarValue282) + 1.0;
                        float sumValue262 = (scalarValue285 - scalarValue283) + 1.0;
                        float productValue395 = sumValue261 * sumValue262;
                        float productValue396 = sumValue259 * sumValue262;
                        float productValue397 = sumValue260 * sumValue261;
                        float productValue398 = sumValue259 * sumValue260;
                        float comparisonValue73;
                        float comparisonValue74;
                        float comparisonValue75;
                        float comparisonValue76;
                        float comparisonValue77;
                        float comparisonValue78;
                        float comparisonValue79;
                        float comparisonValue80;
                        float comparisonValue81;
                        float comparisonValue82;
                        float comparisonValue83;
                        float comparisonValue84;
                        if (((sumValue258 < 16.0) && ((sumValue256 < 16.0) && (sumValue257 < 16.0))) && (((multiplyAddValue355 >= 0.0) && (multiplyAddValue356 >= 0.0)) && (multiplyAddValue357 >= 0.0)))
                        {
                            uint bitwiseValue133 = bitwiseValue132 + ((uint(multiplyAddValue355) << 8u) + ((uint(multiplyAddValue357) << 4u) + uint(multiplyAddValue356)));
                            float bitwiseValue134 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[bitwiseValue133] & 255u);
                            float bitwiseValue135 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue133] >> 8u) & 255u);
                            float bitwiseValue136 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue133] >> 16u) & 255u);
                            float bitwiseValue137 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue133] >> 24u) & 255u);
                            float productValue399 = bitwiseValue137 * 0.0039215688593685626983642578125;
                            bool comparisonValue219 = intermediateValue9.packedValues[bitwiseValue133] != 0u;
                            uint bitwiseValue138 = bitwiseValue132 + (((uint(sumValue252) << 4u) + uint(sumValue251)) + (uint(sumValue250) << 8u));
                            float bitwiseValue139 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[bitwiseValue138] & 255u);
                            float bitwiseValue140 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue138] >> 8u) & 255u);
                            float bitwiseValue141 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue138] >> 16u) & 255u);
                            float bitwiseValue142 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue138] >> 24u) & 255u);
                            float productValue400 = bitwiseValue142 * 0.0039215688593685626983642578125;
                            bool comparisonValue220 = intermediateValue9.packedValues[bitwiseValue138] != 0u;
                            uint bitwiseValue143 = bitwiseValue132 + (((uint(sumValue255) << 4u) + uint(sumValue254)) + (uint(sumValue253) << 8u));
                            float bitwiseValue144 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[bitwiseValue143] & 255u);
                            float bitwiseValue145 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue143] >> 8u) & 255u);
                            float bitwiseValue146 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue143] >> 16u) & 255u);
                            float bitwiseValue147 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue143] >> 24u) & 255u);
                            float productValue401 = bitwiseValue147 * 0.0039215688593685626983642578125;
                            bool comparisonValue221 = intermediateValue9.packedValues[bitwiseValue143] != 0u;
                            uint bitwiseValue148 = bitwiseValue132 + (((uint(sumValue258) << 4u) + uint(sumValue257)) + (uint(sumValue256) << 8u));
                            float bitwiseValue149 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[bitwiseValue148] & 255u);
                            float bitwiseValue150 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue148] >> 8u) & 255u);
                            float bitwiseValue151 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue148] >> 16u) & 255u);
                            float bitwiseValue152 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue148] >> 24u) & 255u);
                            float productValue402 = bitwiseValue152 * 0.0039215688593685626983642578125;
                            bool comparisonValue222 = intermediateValue9.packedValues[bitwiseValue148] != 0u;
                            comparisonValue73 = comparisonValue222 ? ((productValue402 * (bitwiseValue151 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue74 = comparisonValue222 ? ((productValue402 * (bitwiseValue150 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue75 = comparisonValue222 ? ((productValue402 * (bitwiseValue149 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue76 = comparisonValue221 ? ((productValue401 * (bitwiseValue146 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue77 = comparisonValue221 ? ((productValue401 * (bitwiseValue145 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue78 = comparisonValue221 ? ((productValue401 * (bitwiseValue144 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue79 = comparisonValue219 ? ((productValue399 * (bitwiseValue136 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue80 = comparisonValue219 ? ((productValue399 * (bitwiseValue135 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue81 = comparisonValue219 ? ((productValue399 * (bitwiseValue134 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue82 = comparisonValue220 ? ((productValue400 * (bitwiseValue141 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue83 = comparisonValue220 ? ((productValue400 * (bitwiseValue140 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue84 = comparisonValue220 ? ((productValue400 * (bitwiseValue139 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        }
                        else
                        {
                            float multiplyAddValue358 = fma(productValue392, 16.0, multiplyAddValue355);
                            float multiplyAddValue359 = fma(productValue393, 16.0, multiplyAddValue356);
                            float multiplyAddValue360 = fma(productValue394, 16.0, multiplyAddValue357);
                            uint comparisonValue223 = min((((((bitfieldInsert(bitfieldInsert(0u, (multiplyAddValue355 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (multiplyAddValue355 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (multiplyAddValue356 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue356 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue357 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue357 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                            uint scalarValue286 = intermediateValue23[comparisonValue223].x;
                            bool conditionValue29 = int(scalarValue286) < int(0u);
                            uint sumValue263 = bitwiseValue132 + 4097u;
                            uint sumValue264 = bitwiseValue132 + 4096u;
                            uint multiplyAddValue361 = conditionValue29 ? (bitwiseValue132 + (bitfieldInsert(bitfieldInsert(0u, uint(multiplyAddValue357), int(4u), int(4u)), uint(multiplyAddValue356), int(0u), int(4u)) + bitfieldInsert(0u, uint(multiplyAddValue355), int(8u), int(4u)))) : ((intermediateValue9.packedValues[scalarValue286 + sumValue263] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue360 * 0.0625), 16.0, multiplyAddValue360)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue359 * 0.0625), 16.0, multiplyAddValue359)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue358 * 0.0625), 16.0, multiplyAddValue358)), int(8u), int(4u))));
                            float bitwiseValue153 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[multiplyAddValue361] & 255u);
                            float bitwiseValue154 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue361] >> 8u) & 255u);
                            float bitwiseValue155 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue361] >> 16u) & 255u);
                            float bitwiseValue156 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue361] >> 24u) & 255u);
                            float productValue403 = bitwiseValue156 * 0.0039215688593685626983642578125;
                            bool comparisonValue224 = (conditionValue29 || (((1u << (scalarValue286 & 31u)) & intermediateValue9.packedValues[sumValue264]) != 0u)) && (intermediateValue9.packedValues[multiplyAddValue361] != 0u);
                            float multiplyAddValue362 = fma(productValue392, 16.0, sumValue250);
                            float multiplyAddValue363 = fma(productValue393, 16.0, sumValue251);
                            float multiplyAddValue364 = fma(productValue394, 16.0, sumValue252);
                            uint comparisonValue225 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue250 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue250 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue251 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue251 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue252 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue252 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                            uint scalarValue287 = intermediateValue23[comparisonValue225].x;
                            bool conditionValue30 = int(scalarValue287) < int(0u);
                            uint multiplyAddValue365 = conditionValue30 ? (bitwiseValue132 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue252), int(4u), int(4u)), uint(sumValue251), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue250), int(8u), int(4u)))) : ((intermediateValue9.packedValues[scalarValue287 + sumValue263] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue364 * 0.0625), 16.0, multiplyAddValue364)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue363 * 0.0625), 16.0, multiplyAddValue363)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue362 * 0.0625), 16.0, multiplyAddValue362)), int(8u), int(4u))));
                            float bitwiseValue157 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[multiplyAddValue365] & 255u);
                            float bitwiseValue158 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue365] >> 8u) & 255u);
                            float bitwiseValue159 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue365] >> 16u) & 255u);
                            float bitwiseValue160 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue365] >> 24u) & 255u);
                            float productValue404 = bitwiseValue160 * 0.0039215688593685626983642578125;
                            bool comparisonValue226 = (conditionValue30 || (((1u << (scalarValue287 & 31u)) & intermediateValue9.packedValues[sumValue264]) != 0u)) && (intermediateValue9.packedValues[multiplyAddValue365] != 0u);
                            float multiplyAddValue366 = fma(productValue392, 16.0, sumValue253);
                            float multiplyAddValue367 = fma(productValue393, 16.0, sumValue254);
                            float multiplyAddValue368 = fma(productValue394, 16.0, sumValue255);
                            uint comparisonValue227 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue253 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue253 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue254 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue254 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue255 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue255 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                            uint scalarValue288 = intermediateValue23[comparisonValue227].x;
                            bool conditionValue31 = int(scalarValue288) < int(0u);
                            uint multiplyAddValue369 = conditionValue31 ? (bitwiseValue132 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue255), int(4u), int(4u)), uint(sumValue254), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue253), int(8u), int(4u)))) : ((intermediateValue9.packedValues[scalarValue288 + sumValue263] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue368 * 0.0625), 16.0, multiplyAddValue368)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue367 * 0.0625), 16.0, multiplyAddValue367)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue366 * 0.0625), 16.0, multiplyAddValue366)), int(8u), int(4u))));
                            float bitwiseValue161 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[multiplyAddValue369] & 255u);
                            float bitwiseValue162 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue369] >> 8u) & 255u);
                            float bitwiseValue163 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue369] >> 16u) & 255u);
                            float bitwiseValue164 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue369] >> 24u) & 255u);
                            float productValue405 = bitwiseValue164 * 0.0039215688593685626983642578125;
                            bool comparisonValue228 = (conditionValue31 || (((1u << (scalarValue288 & 31u)) & intermediateValue9.packedValues[sumValue264]) != 0u)) && (intermediateValue9.packedValues[multiplyAddValue369] != 0u);
                            float multiplyAddValue370 = fma(productValue392, 16.0, sumValue256);
                            float multiplyAddValue371 = fma(productValue393, 16.0, sumValue257);
                            float multiplyAddValue372 = fma(productValue394, 16.0, sumValue258);
                            uint comparisonValue229 = min(((bitfieldInsert(0u, (sumValue258 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + ((bitfieldInsert(0u, (sumValue257 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue256 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue256 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue257 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))) + bitfieldInsert(0u, (sumValue258 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)))) + 4u), 68u);
                            uint scalarValue289 = intermediateValue23[comparisonValue229].x;
                            bool conditionValue32 = int(scalarValue289) < int(0u);
                            uint multiplyAddValue373 = conditionValue32 ? (bitwiseValue132 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue258), int(4u), int(4u)), uint(sumValue257), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue256), int(8u), int(4u)))) : ((intermediateValue9.packedValues[scalarValue289 + sumValue263] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue372 * 0.0625), 16.0, multiplyAddValue372)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue371 * 0.0625), 16.0, multiplyAddValue371)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue370 * 0.0625), 16.0, multiplyAddValue370)), int(8u), int(4u))));
                            float bitwiseValue165 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[multiplyAddValue373] & 255u);
                            float bitwiseValue166 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue373] >> 8u) & 255u);
                            float bitwiseValue167 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue373] >> 16u) & 255u);
                            float bitwiseValue168 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue373] >> 24u) & 255u);
                            float productValue406 = bitwiseValue168 * 0.0039215688593685626983642578125;
                            bool comparisonValue230 = (conditionValue32 || (((1u << (scalarValue289 & 31u)) & intermediateValue9.packedValues[sumValue264]) != 0u)) && (intermediateValue9.packedValues[multiplyAddValue373] != 0u);
                            comparisonValue73 = comparisonValue230 ? ((productValue406 * (bitwiseValue167 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue74 = comparisonValue230 ? ((productValue406 * (bitwiseValue166 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue75 = comparisonValue230 ? ((productValue406 * (bitwiseValue165 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue76 = comparisonValue228 ? ((productValue405 * (bitwiseValue163 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue77 = comparisonValue228 ? ((productValue405 * (bitwiseValue162 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue78 = comparisonValue228 ? ((productValue405 * (bitwiseValue161 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue79 = comparisonValue224 ? ((productValue403 * (bitwiseValue155 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue80 = comparisonValue224 ? ((productValue403 * (bitwiseValue154 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue81 = comparisonValue224 ? ((productValue403 * (bitwiseValue153 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue82 = comparisonValue226 ? ((productValue404 * (bitwiseValue159 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue83 = comparisonValue226 ? ((productValue404 * (bitwiseValue158 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue84 = comparisonValue226 ? ((productValue404 * (bitwiseValue157 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        }
                        multiplyAddValue164 = fma(comparisonValue75, productValue398, fma(comparisonValue78, productValue397, fma(comparisonValue81, productValue395, productValue396 * comparisonValue84)));
                        multiplyAddValue165 = fma(comparisonValue74, productValue398, fma(comparisonValue77, productValue397, fma(comparisonValue80, productValue395, productValue396 * comparisonValue83)));
                        multiplyAddValue166 = fma(comparisonValue73, productValue398, fma(comparisonValue76, productValue397, fma(comparisonValue79, productValue395, productValue396 * comparisonValue82)));
                    }
                    else
                    {
                        float scalarValue290 = floor(multiplyAddValue351);
                        float scalarValue291 = floor(multiplyAddValue352);
                        float scalarValue292 = floor(multiplyAddValue353);
                        float sumValue265 = multiplyAddValue351 - scalarValue290;
                        float sumValue266 = multiplyAddValue352 - scalarValue291;
                        float sumValue267 = multiplyAddValue353 - scalarValue292;
                        uint comparisonValue231 = bitfieldInsert(bitfieldInsert(0u, (sumValue266 >= sumValue267) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue265 >= sumValue266) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue265 >= sumValue267) ? 4294967295u : 0u, int(2u), int(1u));
                        float scalarValue293 = spvNMin(sumValue266, sumValue265);
                        float scalarValue294 = spvNMax(sumValue266, sumValue265);
                        float scalarValue295 = spvNMin(sumValue267, scalarValue293);
                        float scalarValue296 = spvNMax(sumValue267, scalarValue294);
                        float scalarValue297 = spvNMax(scalarValue293, spvNMin(sumValue267, scalarValue294));
                        float sumValue268 = 1.0 - scalarValue296;
                        float sumValue269 = scalarValue296 - scalarValue297;
                        float sumValue270 = scalarValue297 - scalarValue295;
                        float sumValue271 = scalarValue290 + 1.0;
                        float sumValue272 = scalarValue291 + 1.0;
                        float sumValue273 = scalarValue292 + 1.0;
                        float comparisonValue85;
                        float comparisonValue86;
                        float comparisonValue87;
                        float comparisonValue88;
                        float comparisonValue89;
                        float comparisonValue90;
                        float comparisonValue91;
                        float comparisonValue92;
                        float comparisonValue93;
                        float comparisonValue94;
                        float comparisonValue95;
                        float comparisonValue96;
                        if ((((sumValue271 < 16.0) && (sumValue272 < 16.0)) && (sumValue273 < 16.0)) && (((scalarValue290 >= 0.0) && (scalarValue291 >= 0.0)) && (scalarValue292 >= 0.0)))
                        {
                            uint scalarValue298 = uint(scalarValue290);
                            uint scalarValue299 = uint(scalarValue291);
                            uint scalarValue300 = uint(scalarValue292);
                            uint sumValue274 = min((comparisonValue231 + 4u), 68u);
                            uint scalarValue301 = intermediateValue23[sumValue274].y;
                            uint scalarValue302 = intermediateValue23[sumValue274].z;
                            uint sumValue275 = min((comparisonValue231 + 12u), 68u);
                            uint scalarValue303 = intermediateValue23[sumValue275].y;
                            uint scalarValue304 = intermediateValue23[sumValue275].z;
                            uint bitwiseValue169 = bitwiseValue132 + (((scalarValue300 << 4u) + scalarValue299) + (scalarValue298 << 8u));
                            float bitwiseValue170 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[bitwiseValue169] & 255u);
                            float bitwiseValue171 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue169] >> 8u) & 255u);
                            float bitwiseValue172 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue169] >> 16u) & 255u);
                            float bitwiseValue173 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue169] >> 24u) & 255u);
                            float productValue407 = bitwiseValue173 * 0.0039215688593685626983642578125;
                            bool comparisonValue232 = intermediateValue9.packedValues[bitwiseValue169] != 0u;
                            uint bitwiseValue174 = bitwiseValue132 + ((((uint(comparisonValue231 < 2u) + scalarValue300) << 4u) + (scalarValue302 + scalarValue299)) + ((scalarValue301 + scalarValue298) << 8u));
                            float bitwiseValue175 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[bitwiseValue174] & 255u);
                            float bitwiseValue176 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue174] >> 8u) & 255u);
                            float bitwiseValue177 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue174] >> 16u) & 255u);
                            float bitwiseValue178 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue174] >> 24u) & 255u);
                            float productValue408 = bitwiseValue178 * 0.0039215688593685626983642578125;
                            bool comparisonValue233 = intermediateValue9.packedValues[bitwiseValue174] != 0u;
                            uint bitwiseValue179 = bitwiseValue132 + ((((scalarValue300 + uint(comparisonValue231 < 6u)) << 4u) + (scalarValue304 + scalarValue299)) + ((scalarValue298 + scalarValue303) << 8u));
                            float bitwiseValue180 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[bitwiseValue179] & 255u);
                            float bitwiseValue181 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue179] >> 8u) & 255u);
                            float bitwiseValue182 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue179] >> 16u) & 255u);
                            float bitwiseValue183 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue179] >> 24u) & 255u);
                            float productValue409 = bitwiseValue183 * 0.0039215688593685626983642578125;
                            bool comparisonValue234 = intermediateValue9.packedValues[bitwiseValue179] != 0u;
                            uint bitwiseValue184 = bitwiseValue132 + ((((scalarValue300 + 1u) << 4u) + (scalarValue299 + 1u)) + ((scalarValue298 + 1u) << 8u));
                            float bitwiseValue185 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[bitwiseValue184] & 255u);
                            float bitwiseValue186 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue184] >> 8u) & 255u);
                            float bitwiseValue187 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue184] >> 16u) & 255u);
                            float bitwiseValue188 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[bitwiseValue184] >> 24u) & 255u);
                            float productValue410 = bitwiseValue188 * 0.0039215688593685626983642578125;
                            bool comparisonValue235 = intermediateValue9.packedValues[bitwiseValue184] != 0u;
                            comparisonValue85 = comparisonValue235 ? ((productValue410 * (bitwiseValue187 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue86 = comparisonValue235 ? ((productValue410 * (bitwiseValue186 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue87 = comparisonValue235 ? ((productValue410 * (bitwiseValue185 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue88 = comparisonValue234 ? ((productValue409 * (bitwiseValue182 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue89 = comparisonValue234 ? ((productValue409 * (bitwiseValue181 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue90 = comparisonValue234 ? ((productValue409 * (bitwiseValue180 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue91 = comparisonValue232 ? ((productValue407 * (bitwiseValue172 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue92 = comparisonValue232 ? ((productValue407 * (bitwiseValue171 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue93 = comparisonValue232 ? ((productValue407 * (bitwiseValue170 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue94 = comparisonValue233 ? ((productValue408 * (bitwiseValue177 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue95 = comparisonValue233 ? ((productValue408 * (bitwiseValue176 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue96 = comparisonValue233 ? ((productValue408 * (bitwiseValue175 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        }
                        else
                        {
                            uint sumValue276 = min((comparisonValue231 + 4u), 68u);
                            uint scalarValue305 = intermediateValue23[sumValue276].y;
                            uint scalarValue306 = intermediateValue23[sumValue276].z;
                            float scalarValue307 = rdEvaluateFloatExpression2(scalarValue305);
                            float scalarValue308 = rdEvaluateFloatExpression2(scalarValue306);
                            float scalarValue309 = rdEvaluateFloatExpression2(uint(comparisonValue231 < 2u));
                            float sumValue277 = scalarValue290 + scalarValue307;
                            float sumValue278 = scalarValue291 + scalarValue308;
                            float sumValue279 = scalarValue292 + scalarValue309;
                            uint sumValue280 = min((comparisonValue231 + 12u), 68u);
                            uint scalarValue310 = intermediateValue23[sumValue280].y;
                            uint scalarValue311 = intermediateValue23[sumValue280].z;
                            float scalarValue312 = rdEvaluateFloatExpression2(scalarValue310);
                            float scalarValue313 = rdEvaluateFloatExpression2(scalarValue311);
                            float scalarValue314 = rdEvaluateFloatExpression2(uint(comparisonValue231 < 6u));
                            float sumValue281 = scalarValue290 + scalarValue312;
                            float sumValue282 = scalarValue291 + scalarValue313;
                            float sumValue283 = scalarValue292 + scalarValue314;
                            float multiplyAddValue374 = fma(productValue392, 16.0, scalarValue290);
                            float multiplyAddValue375 = fma(productValue393, 16.0, scalarValue291);
                            float multiplyAddValue376 = fma(productValue394, 16.0, scalarValue292);
                            uint comparisonValue236 = min(((bitfieldInsert(0u, (scalarValue292 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (scalarValue292 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (scalarValue291 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (scalarValue290 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (scalarValue290 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (scalarValue291 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                            uint scalarValue315 = intermediateValue23[comparisonValue236].x;
                            bool conditionValue33 = int(scalarValue315) < int(0u);
                            uint sumValue284 = bitwiseValue132 + 4097u;
                            uint sumValue285 = bitwiseValue132 + 4096u;
                            uint multiplyAddValue377 = conditionValue33 ? (bitwiseValue132 + (bitfieldInsert(0u, uint(scalarValue290), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(scalarValue292), int(4u), int(4u)), uint(scalarValue291), int(0u), int(4u)))) : ((intermediateValue9.packedValues[sumValue284 + scalarValue315] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue374 * 0.0625), 16.0, multiplyAddValue374)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue376 * 0.0625), 16.0, multiplyAddValue376)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue375 * 0.0625), 16.0, multiplyAddValue375)), int(0u), int(4u))));
                            float bitwiseValue189 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[multiplyAddValue377] & 255u);
                            float bitwiseValue190 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue377] >> 8u) & 255u);
                            float bitwiseValue191 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue377] >> 16u) & 255u);
                            float bitwiseValue192 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue377] >> 24u) & 255u);
                            float productValue411 = bitwiseValue192 * 0.0039215688593685626983642578125;
                            bool comparisonValue237 = (conditionValue33 || ((intermediateValue9.packedValues[sumValue285] & (1u << (scalarValue315 & 31u))) != 0u)) && (intermediateValue9.packedValues[multiplyAddValue377] != 0u);
                            float multiplyAddValue378 = fma(productValue392, 16.0, sumValue277);
                            float multiplyAddValue379 = fma(productValue393, 16.0, sumValue278);
                            float multiplyAddValue380 = fma(productValue394, 16.0, sumValue279);
                            uint comparisonValue238 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue277 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue277 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue278 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue278 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue279 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue279 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                            uint scalarValue316 = intermediateValue23[comparisonValue238].x;
                            bool conditionValue34 = int(scalarValue316) < int(0u);
                            uint multiplyAddValue381 = conditionValue34 ? (bitwiseValue132 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue279), int(4u), int(4u)), uint(sumValue278), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue277), int(8u), int(4u)))) : ((intermediateValue9.packedValues[sumValue284 + scalarValue316] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue380 * 0.0625), 16.0, multiplyAddValue380)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue379 * 0.0625), 16.0, multiplyAddValue379)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue378 * 0.0625), 16.0, multiplyAddValue378)), int(8u), int(4u))));
                            float bitwiseValue193 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[multiplyAddValue381] & 255u);
                            float bitwiseValue194 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue381] >> 8u) & 255u);
                            float bitwiseValue195 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue381] >> 16u) & 255u);
                            float bitwiseValue196 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue381] >> 24u) & 255u);
                            float productValue412 = bitwiseValue196 * 0.0039215688593685626983642578125;
                            bool comparisonValue239 = (conditionValue34 || ((intermediateValue9.packedValues[sumValue285] & (1u << (scalarValue316 & 31u))) != 0u)) && (intermediateValue9.packedValues[multiplyAddValue381] != 0u);
                            float multiplyAddValue382 = fma(productValue392, 16.0, sumValue281);
                            float multiplyAddValue383 = fma(productValue393, 16.0, sumValue282);
                            float multiplyAddValue384 = fma(productValue394, 16.0, sumValue283);
                            uint comparisonValue240 = min(((bitfieldInsert(0u, (sumValue283 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue283 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue282 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue281 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue281 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue282 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                            uint scalarValue317 = intermediateValue23[comparisonValue240].x;
                            bool conditionValue35 = int(scalarValue317) < int(0u);
                            uint multiplyAddValue385 = conditionValue35 ? (bitwiseValue132 + (bitfieldInsert(0u, uint(sumValue281), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue283), int(4u), int(4u)), uint(sumValue282), int(0u), int(4u)))) : ((intermediateValue9.packedValues[sumValue284 + scalarValue317] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue382 * 0.0625), 16.0, multiplyAddValue382)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue384 * 0.0625), 16.0, multiplyAddValue384)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue383 * 0.0625), 16.0, multiplyAddValue383)), int(0u), int(4u))));
                            float bitwiseValue197 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[multiplyAddValue385] & 255u);
                            float bitwiseValue198 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue385] >> 8u) & 255u);
                            float bitwiseValue199 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue385] >> 16u) & 255u);
                            float bitwiseValue200 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue385] >> 24u) & 255u);
                            float productValue413 = bitwiseValue200 * 0.0039215688593685626983642578125;
                            bool comparisonValue241 = (conditionValue35 || ((intermediateValue9.packedValues[sumValue285] & (1u << (scalarValue317 & 31u))) != 0u)) && (intermediateValue9.packedValues[multiplyAddValue385] != 0u);
                            float multiplyAddValue386 = fma(productValue392, 16.0, sumValue271);
                            float multiplyAddValue387 = fma(productValue393, 16.0, sumValue272);
                            float multiplyAddValue388 = fma(productValue394, 16.0, sumValue273);
                            uint comparisonValue242 = min(((bitfieldInsert(0u, (sumValue273 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue273 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue272 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue271 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue271 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue272 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                            uint scalarValue318 = intermediateValue23[comparisonValue242].x;
                            bool conditionValue36 = int(scalarValue318) < int(0u);
                            uint multiplyAddValue389 = conditionValue36 ? (bitwiseValue132 + (bitfieldInsert(0u, uint(sumValue271), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue273), int(4u), int(4u)), uint(sumValue272), int(0u), int(4u)))) : ((intermediateValue9.packedValues[sumValue284 + scalarValue318] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue386 * 0.0625), 16.0, multiplyAddValue386)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue388 * 0.0625), 16.0, multiplyAddValue388)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue387 * 0.0625), 16.0, multiplyAddValue387)), int(0u), int(4u))));
                            float bitwiseValue201 = rdEvaluateFloatExpression2(intermediateValue9.packedValues[multiplyAddValue389] & 255u);
                            float bitwiseValue202 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue389] >> 8u) & 255u);
                            float bitwiseValue203 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue389] >> 16u) & 255u);
                            float bitwiseValue204 = rdEvaluateFloatExpression2((intermediateValue9.packedValues[multiplyAddValue389] >> 24u) & 255u);
                            float productValue414 = bitwiseValue204 * 0.0039215688593685626983642578125;
                            bool comparisonValue243 = (conditionValue36 || ((intermediateValue9.packedValues[sumValue285] & (1u << (scalarValue318 & 31u))) != 0u)) && (intermediateValue9.packedValues[multiplyAddValue389] != 0u);
                            comparisonValue85 = comparisonValue243 ? ((productValue414 * (bitwiseValue203 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue86 = comparisonValue243 ? ((productValue414 * (bitwiseValue202 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue87 = comparisonValue243 ? ((productValue414 * (bitwiseValue201 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue88 = comparisonValue241 ? ((productValue413 * (bitwiseValue199 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue89 = comparisonValue241 ? ((productValue413 * (bitwiseValue198 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue90 = comparisonValue241 ? ((productValue413 * (bitwiseValue197 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue91 = comparisonValue237 ? ((productValue411 * (bitwiseValue191 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue92 = comparisonValue237 ? ((productValue411 * (bitwiseValue190 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue93 = comparisonValue237 ? ((productValue411 * (bitwiseValue189 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue94 = comparisonValue239 ? ((productValue412 * (bitwiseValue195 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue95 = comparisonValue239 ? ((productValue412 * (bitwiseValue194 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                            comparisonValue96 = comparisonValue239 ? ((productValue412 * (bitwiseValue193 * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        }
                        multiplyAddValue164 = fma(comparisonValue87, scalarValue295, fma(comparisonValue90, sumValue270, fma(comparisonValue93, sumValue268, sumValue269 * comparisonValue96)));
                        multiplyAddValue165 = fma(comparisonValue86, scalarValue295, fma(comparisonValue89, sumValue270, fma(comparisonValue92, sumValue268, sumValue269 * comparisonValue95)));
                        multiplyAddValue166 = fma(comparisonValue85, scalarValue295, fma(comparisonValue88, sumValue270, fma(comparisonValue91, sumValue268, sumValue269 * comparisonValue94)));
                    }
                    intermediateValue141 = multiplyAddValue164;
                    intermediateValue139 = multiplyAddValue165;
                    intermediateValue137 = multiplyAddValue166;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue24, fma(fragmentVectorConstants1.packedValues[5u].x, productValue23, productValue22 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x;
                    multiplyAddValue39 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue24, fma(fragmentVectorConstants1.packedValues[5u].y, productValue23, productValue22 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y;
                    multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue24, fma(fragmentVectorConstants1.packedValues[5u].z, productValue23, productValue22 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    bitwiseValue7 = scalarValue368 & sumValue332;
                    uint sampledTextureValue7 = texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 2u)).x & 65535u;
                    bool sampledTextureValue92 = (texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 1u)).x == bitwiseValue208) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue7 * 4u)).x == bitwiseValue207) && (sampledTextureValue7 == comparisonValue278));
                    sampledTextureValue5 = sampledTextureValue92 ? texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 3u)).x : scalarValue25;
                    if ((sampledTextureValue7 == 0u) || sampledTextureValue92)
                    {
                        intermediateValue73 = sampledTextureValue92;
                        break;
                    }
                    else
                    {
                        uint sumValue50 = scalarValue26 + 1u;
                        if (int(sumValue50) < int(8u))
                        {
                            scalarValue368 = bitwiseValue7 + 1u;
                            scalarValue25 = sampledTextureValue5;
                            scalarValue26 = sumValue50;
                            continue;
                        }
                        else
                        {
                            intermediateValue73 = false;
                            break;
                        }
                    }
                }
                uint bitwiseValue214 = sampledTextureValue5 >> 2u;
                float branchMergedValue16;
                float branchMergedValue29;
                float branchMergedValue30;
                if (intermediateValue73)
                {
                    float scalarValue27 = abs(productValue3);
                    float scalarValue28 = abs(productValue4);
                    float scalarValue29 = abs(productValue5);
                    float branchMergedValue65;
                    float branchMergedValue69;
                    float branchMergedValue70;
                    if (((scalarValue27 >= 1.0) || (scalarValue28 >= 1.0)) || (scalarValue29 >= 1.0))
                    {
                        float intermediateValue196;
                        float intermediateValue197;
                        float intermediateValue198;
                        float intermediateValue199;
                        float intermediateValue201;
                        float intermediateValue203;
                        float intermediateValue205;
                        float intermediateValue207;
                        float intermediateValue209;
                        float intermediateValue211;
                        float intermediateValue212;
                        float intermediateValue213;
                        float productValue184;
                        float productValue185;
                        float productValue186;
                        float sumValue58;
                        float sumValue59;
                        float sumValue60;
                        float sumValue61;
                        float sumValue62;
                        float sumValue63;
                        float sumValue64;
                        float sumValue65;
                        float sumValue66;
                        float productValue187;
                        float productValue188;
                        float productValue189;
                        float productValue190;
                        bool comparisonValue23;
                        for (;;)
                        {
                            float dotProductValue32 = dot(vec3(sumValue329, sumValue330, sumValue331), vec3(scalarValue27, scalarValue28, scalarValue29));
                            float dotProductValue33 = dot(vec3(sumValue329, sumValue330, sumValue331), vec3(scalarValue29, scalarValue27, scalarValue28));
                            float dotProductValue34 = dot(vec3(sumValue329, sumValue330, sumValue331), vec3(scalarValue28, scalarValue29, scalarValue27));
                            float comparisonValue279 = ((inverseLengthValue * ((varyingNormal0.y + varyingNormal0.x) + varyingNormal0.z)) > 0.0) ? ceil(dotProductValue32) : floor(dotProductValue32);
                            float scalarValue369 = floor(dotProductValue33);
                            float scalarValue370 = floor(dotProductValue34);
                            productValue184 = ((comparisonValue279 * scalarValue27) + (scalarValue369 * scalarValue29)) + (scalarValue370 * scalarValue28);
                            productValue185 = ((comparisonValue279 * scalarValue28) + (scalarValue369 * scalarValue27)) + (scalarValue370 * scalarValue29);
                            productValue186 = ((comparisonValue279 * scalarValue29) + (scalarValue369 * scalarValue28)) + (scalarValue370 * scalarValue27);
                            sumValue58 = productValue184 + scalarValue29;
                            sumValue59 = productValue185 + scalarValue27;
                            sumValue60 = productValue186 + scalarValue28;
                            sumValue61 = productValue184 + scalarValue28;
                            sumValue62 = productValue185 + scalarValue29;
                            sumValue63 = productValue186 + scalarValue27;
                            sumValue64 = sumValue58 + scalarValue28;
                            sumValue65 = sumValue62 + scalarValue27;
                            sumValue66 = sumValue60 + scalarValue27;
                            float sumValue333 = dotProductValue33 - scalarValue369;
                            float sumValue334 = dotProductValue34 - scalarValue370;
                            float sumValue335 = 1.0 - sumValue333;
                            float sumValue336 = 1.0 - sumValue334;
                            productValue187 = sumValue336 * sumValue335;
                            productValue188 = sumValue336 * sumValue333;
                            productValue189 = sumValue335 * sumValue334;
                            productValue190 = sumValue334 * sumValue333;
                            comparisonValue23 = ((productValue186 >= 0.0) && ((productValue184 >= 0.0) && (productValue185 >= 0.0))) && ((sumValue66 < 16.0) && ((sumValue64 < 16.0) && (sumValue65 < 16.0)));
                            if (comparisonValue23)
                            {
                                uvec4 sampledTextureValue93 = texelFetch(voxelBuffer, int(((uint(productValue185) + bitwiseValue214) + (uint(productValue186) << 4u)) + (uint(productValue184) << 8u)));
                                uint scalarValue371 = sampledTextureValue93.x;
                                float bitwiseValue13;
                                float intermediateValue148;
                                float intermediateValue149;
                                if (scalarValue371 == 0u)
                                {
                                    bitwiseValue13 = 0.0;
                                    intermediateValue148 = 0.0;
                                    intermediateValue149 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue215 = float(scalarValue371 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue13 = bitwiseValue215 * float(scalarValue371 & 255u);
                                    intermediateValue148 = bitwiseValue215 * float((scalarValue371 >> 8u) & 255u);
                                    intermediateValue149 = bitwiseValue215 * float((scalarValue371 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue94 = texelFetch(voxelBuffer, int(((uint(sumValue59) + bitwiseValue214) + (uint(sumValue60) << 4u)) + (uint(sumValue58) << 8u)));
                                uint scalarValue372 = sampledTextureValue94.x;
                                float bitwiseValue17;
                                float intermediateValue165;
                                float intermediateValue166;
                                if (scalarValue372 == 0u)
                                {
                                    bitwiseValue17 = 0.0;
                                    intermediateValue165 = 0.0;
                                    intermediateValue166 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue216 = float(scalarValue372 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue17 = bitwiseValue216 * float(scalarValue372 & 255u);
                                    intermediateValue165 = bitwiseValue216 * float((scalarValue372 >> 8u) & 255u);
                                    intermediateValue166 = bitwiseValue216 * float((scalarValue372 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue95 = texelFetch(voxelBuffer, int(((uint(sumValue62) + bitwiseValue214) + (uint(sumValue63) << 4u)) + (uint(sumValue61) << 8u)));
                                uint scalarValue373 = sampledTextureValue95.x;
                                float bitwiseValue21;
                                float intermediateValue190;
                                float intermediateValue191;
                                if (scalarValue373 == 0u)
                                {
                                    bitwiseValue21 = 0.0;
                                    intermediateValue190 = 0.0;
                                    intermediateValue191 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue217 = float(scalarValue373 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue21 = bitwiseValue217 * float(scalarValue373 & 255u);
                                    intermediateValue190 = bitwiseValue217 * float((scalarValue373 >> 8u) & 255u);
                                    intermediateValue191 = bitwiseValue217 * float((scalarValue373 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue96 = texelFetch(voxelBuffer, int(((uint(sumValue65) + bitwiseValue214) + (uint(sumValue66) << 4u)) + (uint(sumValue64) << 8u)));
                                uint scalarValue374 = sampledTextureValue96.x;
                                float branchMergedValue22;
                                float branchMergedValue36;
                                float branchMergedValue37;
                                float branchMergedValue38;
                                float branchMergedValue39;
                                float branchMergedValue40;
                                float branchMergedValue41;
                                float branchMergedValue42;
                                float branchMergedValue43;
                                float branchMergedValue44;
                                float branchMergedValue60;
                                float branchMergedValue61;
                                if (scalarValue374 == 0u)
                                {
                                    branchMergedValue22 = 0.0;
                                    branchMergedValue36 = 0.0;
                                    branchMergedValue37 = 0.0;
                                    branchMergedValue38 = intermediateValue191;
                                    branchMergedValue39 = intermediateValue190;
                                    branchMergedValue40 = bitwiseValue21;
                                    branchMergedValue41 = intermediateValue166;
                                    branchMergedValue42 = intermediateValue165;
                                    branchMergedValue43 = intermediateValue149;
                                    branchMergedValue44 = intermediateValue148;
                                    branchMergedValue60 = bitwiseValue13;
                                    branchMergedValue61 = bitwiseValue17;
                                }
                                else
                                {
                                    float bitwiseValue218 = float(scalarValue374 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    branchMergedValue22 = bitwiseValue218 * float((scalarValue374 >> 16u) & 255u);
                                    branchMergedValue36 = bitwiseValue218 * float((scalarValue374 >> 8u) & 255u);
                                    branchMergedValue37 = bitwiseValue218 * float(scalarValue374 & 255u);
                                    branchMergedValue38 = intermediateValue191;
                                    branchMergedValue39 = intermediateValue190;
                                    branchMergedValue40 = bitwiseValue21;
                                    branchMergedValue41 = intermediateValue166;
                                    branchMergedValue42 = intermediateValue165;
                                    branchMergedValue43 = intermediateValue149;
                                    branchMergedValue44 = intermediateValue148;
                                    branchMergedValue60 = bitwiseValue13;
                                    branchMergedValue61 = bitwiseValue17;
                                }
                                intermediateValue196 = branchMergedValue60;
                                intermediateValue197 = branchMergedValue44;
                                intermediateValue198 = branchMergedValue43;
                                intermediateValue199 = branchMergedValue61;
                                intermediateValue201 = branchMergedValue42;
                                intermediateValue203 = branchMergedValue41;
                                intermediateValue205 = branchMergedValue40;
                                intermediateValue207 = branchMergedValue39;
                                intermediateValue209 = branchMergedValue38;
                                intermediateValue211 = branchMergedValue37;
                                intermediateValue212 = branchMergedValue36;
                                intermediateValue213 = branchMergedValue22;
                                break;
                            }
                            else
                            {
                                float intermediateValue168;
                                float intermediateValue169;
                                float intermediateValue170;
                                float sumValue87;
                                float sumValue88;
                                float sumValue89;
                                uint comparisonValue29;
                                bool comparisonValue30;
                                for (;;)
                                {
                                    sumValue87 = productValue184 + productValue532;
                                    sumValue88 = productValue185 + productValue533;
                                    sumValue89 = productValue186 + productValue534;
                                    uint comparisonValue280 = ((((uint(productValue184 >= 16.0) << 1u) | uint(productValue184 < 0.0)) | (uint(productValue185 < 0.0) << 2u)) | (uint(productValue185 >= 16.0) << 3u)) | (uint(productValue186 < 0.0) << 4u);
                                    comparisonValue29 = intermediateValue[comparisonValue280 | (uint(productValue186 >= 16.0) << 5u)];
                                    comparisonValue30 = ((((comparisonValue280 | (uint(productValue186 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue280 & 31u))) == 0u;
                                    uint sampledTextureValue23;
                                    if (comparisonValue30)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue214 + 4096u)).x & (1u << (comparisonValue29 & 31u))) == 0u)
                                        {
                                            intermediateValue168 = 0.0;
                                            intermediateValue169 = 0.0;
                                            intermediateValue170 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue23 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue214 + 4097u) + comparisonValue29)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue23 = ((((uint(productValue186) << 4u) & 240u) | (uint(productValue185) & 15u)) | ((uint(productValue184) << 8u) & 3840u)) + bitwiseValue214;
                                    }
                                    uvec4 sampledTextureValue28 = texelFetch(voxelBuffer, int(sampledTextureValue23));
                                    uint scalarValue48 = sampledTextureValue28.x;
                                    if (scalarValue48 == 0u)
                                    {
                                        intermediateValue168 = 0.0;
                                        intermediateValue169 = 0.0;
                                        intermediateValue170 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue31 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue168 = bitwiseValue31 * float(scalarValue48 & 255u);
                                    intermediateValue169 = bitwiseValue31 * float((scalarValue48 >> 8u) & 255u);
                                    intermediateValue170 = bitwiseValue31 * float((scalarValue48 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue200;
                                float intermediateValue202;
                                float intermediateValue204;
                                float sumValue103;
                                float sumValue104;
                                float sumValue105;
                                uint comparisonValue42;
                                bool comparisonValue43;
                                for (;;)
                                {
                                    sumValue103 = sumValue58 + productValue532;
                                    sumValue104 = sumValue59 + productValue533;
                                    sumValue105 = sumValue60 + productValue534;
                                    uint comparisonValue281 = ((((uint(sumValue58 >= 16.0) << 1u) | uint(sumValue58 < 0.0)) | (uint(sumValue59 < 0.0) << 2u)) | (uint(sumValue59 >= 16.0) << 3u)) | (uint(sumValue60 < 0.0) << 4u);
                                    comparisonValue42 = intermediateValue[comparisonValue281 | (uint(sumValue60 >= 16.0) << 5u)];
                                    comparisonValue43 = ((((comparisonValue281 | (uint(sumValue60 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue281 & 31u))) == 0u;
                                    uint sampledTextureValue38;
                                    if (comparisonValue43)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue214 + 4096u)).x & (1u << (comparisonValue42 & 31u))) == 0u)
                                        {
                                            intermediateValue200 = 0.0;
                                            intermediateValue202 = 0.0;
                                            intermediateValue204 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue38 = ((((uint(sumValue103 - (floor(sumValue103 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue104 - (floor(sumValue104 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue105 - (floor(sumValue105 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue214 + 4097u) + comparisonValue42)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue38 = ((((uint(sumValue60) << 4u) & 240u) | (uint(sumValue59) & 15u)) | ((uint(sumValue58) << 8u) & 3840u)) + bitwiseValue214;
                                    }
                                    uvec4 sampledTextureValue97 = texelFetch(voxelBuffer, int(sampledTextureValue38));
                                    uint scalarValue375 = sampledTextureValue97.x;
                                    if (scalarValue375 == 0u)
                                    {
                                        intermediateValue200 = 0.0;
                                        intermediateValue202 = 0.0;
                                        intermediateValue204 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue219 = float(scalarValue375 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue200 = bitwiseValue219 * float(scalarValue375 & 255u);
                                    intermediateValue202 = bitwiseValue219 * float((scalarValue375 >> 8u) & 255u);
                                    intermediateValue204 = bitwiseValue219 * float((scalarValue375 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue206;
                                float intermediateValue208;
                                float intermediateValue210;
                                float sumValue114;
                                float sumValue115;
                                float sumValue116;
                                uint comparisonValue52;
                                bool comparisonValue53;
                                for (;;)
                                {
                                    sumValue114 = sumValue61 + productValue532;
                                    sumValue115 = sumValue62 + productValue533;
                                    sumValue116 = sumValue63 + productValue534;
                                    uint comparisonValue282 = ((((uint(sumValue61 >= 16.0) << 1u) | uint(sumValue61 < 0.0)) | (uint(sumValue62 < 0.0) << 2u)) | (uint(sumValue62 >= 16.0) << 3u)) | (uint(sumValue63 < 0.0) << 4u);
                                    comparisonValue52 = intermediateValue[comparisonValue282 | (uint(sumValue63 >= 16.0) << 5u)];
                                    comparisonValue53 = ((((comparisonValue282 | (uint(sumValue63 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue282 & 31u))) == 0u;
                                    uint sampledTextureValue42;
                                    if (comparisonValue53)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue214 + 4096u)).x & (1u << (comparisonValue52 & 31u))) == 0u)
                                        {
                                            intermediateValue206 = 0.0;
                                            intermediateValue208 = 0.0;
                                            intermediateValue210 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue42 = ((((uint(sumValue114 - (floor(sumValue114 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue115 - (floor(sumValue115 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue116 - (floor(sumValue116 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue214 + 4097u) + comparisonValue52)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue42 = ((((uint(sumValue63) << 4u) & 240u) | (uint(sumValue62) & 15u)) | ((uint(sumValue61) << 8u) & 3840u)) + bitwiseValue214;
                                    }
                                    uvec4 sampledTextureValue98 = texelFetch(voxelBuffer, int(sampledTextureValue42));
                                    uint scalarValue376 = sampledTextureValue98.x;
                                    if (scalarValue376 == 0u)
                                    {
                                        intermediateValue206 = 0.0;
                                        intermediateValue208 = 0.0;
                                        intermediateValue210 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue220 = float(scalarValue376 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue206 = bitwiseValue220 * float(scalarValue376 & 255u);
                                    intermediateValue208 = bitwiseValue220 * float((scalarValue376 >> 8u) & 255u);
                                    intermediateValue210 = bitwiseValue220 * float((scalarValue376 >> 16u) & 255u);
                                    break;
                                }
                                float sumValue337 = sumValue64 + productValue532;
                                float sumValue338 = sumValue65 + productValue533;
                                float sumValue339 = sumValue66 + productValue534;
                                uint comparisonValue283 = ((((uint(sumValue64 >= 16.0) << 1u) | uint(sumValue64 < 0.0)) | (uint(sumValue65 < 0.0) << 2u)) | (uint(sumValue65 >= 16.0) << 3u)) | (uint(sumValue66 < 0.0) << 4u);
                                uint comparisonValue284 = comparisonValue283 | (uint(sumValue66 >= 16.0) << 5u);
                                uint sampledTextureValue47;
                                if ((((comparisonValue284 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue283 & 31u))) == 0u)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue214 + 4096u)).x & (1u << (intermediateValue[comparisonValue284] & 31u))) == 0u)
                                    {
                                        intermediateValue196 = intermediateValue168;
                                        intermediateValue197 = intermediateValue169;
                                        intermediateValue198 = intermediateValue170;
                                        intermediateValue199 = intermediateValue200;
                                        intermediateValue201 = intermediateValue202;
                                        intermediateValue203 = intermediateValue204;
                                        intermediateValue205 = intermediateValue206;
                                        intermediateValue207 = intermediateValue208;
                                        intermediateValue209 = intermediateValue210;
                                        intermediateValue211 = 0.0;
                                        intermediateValue212 = 0.0;
                                        intermediateValue213 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue47 = ((((uint(sumValue337 - (floor(sumValue337 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue338 - (floor(sumValue338 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue339 - (floor(sumValue339 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue214 + 4097u) + intermediateValue[comparisonValue284])).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue47 = ((((uint(sumValue66) << 4u) & 240u) | (uint(sumValue65) & 15u)) | ((uint(sumValue64) << 8u) & 3840u)) + bitwiseValue214;
                                }
                                uvec4 sampledTextureValue99 = texelFetch(voxelBuffer, int(sampledTextureValue47));
                                uint scalarValue377 = sampledTextureValue99.x;
                                if (scalarValue377 == 0u)
                                {
                                    intermediateValue196 = intermediateValue168;
                                    intermediateValue197 = intermediateValue169;
                                    intermediateValue198 = intermediateValue170;
                                    intermediateValue199 = intermediateValue200;
                                    intermediateValue201 = intermediateValue202;
                                    intermediateValue203 = intermediateValue204;
                                    intermediateValue205 = intermediateValue206;
                                    intermediateValue207 = intermediateValue208;
                                    intermediateValue209 = intermediateValue210;
                                    intermediateValue211 = 0.0;
                                    intermediateValue212 = 0.0;
                                    intermediateValue213 = 0.0;
                                    break;
                                }
                                float bitwiseValue221 = float(scalarValue377 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue196 = intermediateValue168;
                                intermediateValue197 = intermediateValue169;
                                intermediateValue198 = intermediateValue170;
                                intermediateValue199 = intermediateValue200;
                                intermediateValue201 = intermediateValue202;
                                intermediateValue203 = intermediateValue204;
                                intermediateValue205 = intermediateValue206;
                                intermediateValue207 = intermediateValue208;
                                intermediateValue209 = intermediateValue210;
                                intermediateValue211 = bitwiseValue221 * float(scalarValue377 & 255u);
                                intermediateValue212 = bitwiseValue221 * float((scalarValue377 >> 8u) & 255u);
                                intermediateValue213 = bitwiseValue221 * float((scalarValue377 >> 16u) & 255u);
                                break;
                            }
                        }
                        branchMergedValue65 = (((intermediateValue203 * productValue188) + (intermediateValue198 * productValue187)) + (intermediateValue209 * productValue189)) + (intermediateValue213 * productValue190);
                        branchMergedValue69 = (((intermediateValue201 * productValue188) + (intermediateValue197 * productValue187)) + (intermediateValue207 * productValue189)) + (intermediateValue212 * productValue190);
                        branchMergedValue70 = (((intermediateValue199 * productValue188) + (intermediateValue196 * productValue187)) + (intermediateValue205 * productValue189)) + (intermediateValue211 * productValue190);
                    }
                    else
                    {
                        float intermediateValue215;
                        float intermediateValue216;
                        float intermediateValue217;
                        float intermediateValue218;
                        float intermediateValue220;
                        float intermediateValue222;
                        float intermediateValue224;
                        float intermediateValue226;
                        float intermediateValue228;
                        float intermediateValue230;
                        float intermediateValue231;
                        float intermediateValue232;
                        float intermediateValue118;
                        float intermediateValue119;
                        float intermediateValue120;
                        uint intermediateValue121;
                        uint intermediateValue122;
                        uint intermediateValue123;
                        float intermediateValue126;
                        float sumValue74;
                        float sumValue75;
                        float sumValue76;
                        float sumValue77;
                        float sumValue78;
                        float sumValue79;
                        bool comparisonValue25;
                        uint productValue191;
                        uint productValue192;
                        uint productValue193;
                        uint productValue194;
                        uint productValue195;
                        uint productValue196;
                        for (;;)
                        {
                            intermediateValue118 = floor(sumValue329);
                            intermediateValue119 = floor(sumValue330);
                            intermediateValue120 = floor(sumValue331);
                            float sumValue340 = sumValue329 - intermediateValue118;
                            float sumValue341 = sumValue330 - intermediateValue119;
                            float sumValue342 = sumValue331 - intermediateValue120;
                            uint comparisonValue285 = ((uint(sumValue341 >= sumValue342) << 1u) | uint(sumValue340 >= sumValue341)) | (uint(sumValue340 >= sumValue342) << 2u);
                            intermediateValue121 = uint(intermediateValue118);
                            intermediateValue122 = uint(intermediateValue119);
                            intermediateValue123 = uint(intermediateValue120);
                            float scalarValue378 = spvNMin(sumValue340, sumValue341);
                            float scalarValue379 = spvNMax(sumValue340, sumValue341);
                            intermediateValue126 = spvNMin(scalarValue378, sumValue342);
                            float scalarValue380 = spvNMax(scalarValue379, sumValue342);
                            float scalarValue381 = spvNMax(spvNMin(scalarValue379, sumValue342), scalarValue378);
                            sumValue74 = 1.0 - scalarValue380;
                            sumValue75 = scalarValue380 - scalarValue381;
                            sumValue76 = scalarValue381 - intermediateValue126;
                            sumValue77 = intermediateValue118 + 1.0;
                            sumValue78 = intermediateValue119 + 1.0;
                            sumValue79 = intermediateValue120 + 1.0;
                            comparisonValue25 = (((intermediateValue118 >= 0.0) && (intermediateValue119 >= 0.0)) && (intermediateValue120 >= 0.0)) && (((sumValue77 < 16.0) && (sumValue78 < 16.0)) && (sumValue79 < 16.0));
                            productValue191 = 0u + (comparisonValue285 * 3u);
                            productValue192 = 1u + (comparisonValue285 * 3u);
                            productValue193 = 2u + (comparisonValue285 * 3u);
                            productValue194 = 0u + (comparisonValue285 * 3u);
                            productValue195 = 1u + (comparisonValue285 * 3u);
                            productValue196 = 2u + (comparisonValue285 * 3u);
                            if (comparisonValue25)
                            {
                                uint bitwiseValue222 = intermediateValue123 << 4u;
                                uint sumValue343 = intermediateValue122 + bitwiseValue214;
                                uint bitwiseValue223 = sumValue343 + (intermediateValue121 << 8u);
                                uvec4 sampledTextureValue100 = texelFetch(voxelBuffer, int(bitwiseValue223 + bitwiseValue222));
                                uint scalarValue382 = sampledTextureValue100.x;
                                float bitwiseValue15;
                                float intermediateValue151;
                                float intermediateValue152;
                                if (scalarValue382 == 0u)
                                {
                                    bitwiseValue15 = 0.0;
                                    intermediateValue151 = 0.0;
                                    intermediateValue152 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue224 = float(scalarValue382 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue15 = bitwiseValue224 * float(scalarValue382 & 255u);
                                    intermediateValue151 = bitwiseValue224 * float((scalarValue382 >> 8u) & 255u);
                                    intermediateValue152 = bitwiseValue224 * float((scalarValue382 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue101 = texelFetch(voxelBuffer, int(((intermediateValue1[productValue192] + sumValue343) + ((intermediateValue1[productValue191] + intermediateValue121) << 8u)) + ((intermediateValue1[productValue193] + intermediateValue123) << 4u)));
                                uint scalarValue383 = sampledTextureValue101.x;
                                float bitwiseValue19;
                                float intermediateValue172;
                                float intermediateValue173;
                                if (scalarValue383 == 0u)
                                {
                                    bitwiseValue19 = 0.0;
                                    intermediateValue172 = 0.0;
                                    intermediateValue173 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue225 = float(scalarValue383 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue19 = bitwiseValue225 * float(scalarValue383 & 255u);
                                    intermediateValue172 = bitwiseValue225 * float((scalarValue383 >> 8u) & 255u);
                                    intermediateValue173 = bitwiseValue225 * float((scalarValue383 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue102 = texelFetch(voxelBuffer, int(((intermediateValue2[productValue195] + sumValue343) + ((intermediateValue2[productValue194] + intermediateValue121) << 8u)) + ((intermediateValue2[productValue196] + intermediateValue123) << 4u)));
                                uint scalarValue384 = sampledTextureValue102.x;
                                float bitwiseValue24;
                                float intermediateValue193;
                                float intermediateValue194;
                                if (scalarValue384 == 0u)
                                {
                                    bitwiseValue24 = 0.0;
                                    intermediateValue193 = 0.0;
                                    intermediateValue194 = 0.0;
                                }
                                else
                                {
                                    float bitwiseValue226 = float(scalarValue384 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    bitwiseValue24 = bitwiseValue226 * float(scalarValue384 & 255u);
                                    intermediateValue193 = bitwiseValue226 * float((scalarValue384 >> 8u) & 255u);
                                    intermediateValue194 = bitwiseValue226 * float((scalarValue384 >> 16u) & 255u);
                                }
                                uvec4 sampledTextureValue103 = texelFetch(voxelBuffer, int((bitwiseValue223 + 273u) + bitwiseValue222));
                                uint scalarValue385 = sampledTextureValue103.x;
                                float branchMergedValue23;
                                float branchMergedValue45;
                                float branchMergedValue46;
                                float branchMergedValue47;
                                float branchMergedValue48;
                                float branchMergedValue49;
                                float branchMergedValue50;
                                float branchMergedValue51;
                                float branchMergedValue52;
                                float branchMergedValue53;
                                float branchMergedValue62;
                                float branchMergedValue63;
                                if (scalarValue385 == 0u)
                                {
                                    branchMergedValue23 = 0.0;
                                    branchMergedValue45 = 0.0;
                                    branchMergedValue46 = 0.0;
                                    branchMergedValue47 = intermediateValue194;
                                    branchMergedValue48 = intermediateValue193;
                                    branchMergedValue49 = bitwiseValue24;
                                    branchMergedValue50 = intermediateValue173;
                                    branchMergedValue51 = intermediateValue172;
                                    branchMergedValue52 = bitwiseValue19;
                                    branchMergedValue53 = intermediateValue152;
                                    branchMergedValue62 = intermediateValue151;
                                    branchMergedValue63 = bitwiseValue15;
                                }
                                else
                                {
                                    float bitwiseValue227 = float(scalarValue385 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    branchMergedValue23 = bitwiseValue227 * float((scalarValue385 >> 16u) & 255u);
                                    branchMergedValue45 = bitwiseValue227 * float((scalarValue385 >> 8u) & 255u);
                                    branchMergedValue46 = bitwiseValue227 * float(scalarValue385 & 255u);
                                    branchMergedValue47 = intermediateValue194;
                                    branchMergedValue48 = intermediateValue193;
                                    branchMergedValue49 = bitwiseValue24;
                                    branchMergedValue50 = intermediateValue173;
                                    branchMergedValue51 = intermediateValue172;
                                    branchMergedValue52 = bitwiseValue19;
                                    branchMergedValue53 = intermediateValue152;
                                    branchMergedValue62 = intermediateValue151;
                                    branchMergedValue63 = bitwiseValue15;
                                }
                                intermediateValue215 = branchMergedValue63;
                                intermediateValue216 = branchMergedValue62;
                                intermediateValue217 = branchMergedValue53;
                                intermediateValue218 = branchMergedValue52;
                                intermediateValue220 = branchMergedValue51;
                                intermediateValue222 = branchMergedValue50;
                                intermediateValue224 = branchMergedValue49;
                                intermediateValue226 = branchMergedValue48;
                                intermediateValue228 = branchMergedValue47;
                                intermediateValue230 = branchMergedValue46;
                                intermediateValue231 = branchMergedValue45;
                                intermediateValue232 = branchMergedValue23;
                                break;
                            }
                            else
                            {
                                float intermediateValue175;
                                float intermediateValue176;
                                float intermediateValue177;
                                float sumValue91;
                                float sumValue92;
                                float sumValue93;
                                float sumValue94;
                                float sumValue95;
                                float sumValue96;
                                float sumValue97;
                                float sumValue98;
                                float sumValue99;
                                uint comparisonValue32;
                                bool comparisonValue33;
                                for (;;)
                                {
                                    sumValue91 = float(intermediateValue1[productValue191]) + intermediateValue118;
                                    sumValue92 = float(intermediateValue1[productValue192]) + intermediateValue119;
                                    sumValue93 = float(intermediateValue1[productValue193]) + intermediateValue120;
                                    sumValue94 = float(intermediateValue2[productValue194]) + intermediateValue118;
                                    sumValue95 = float(intermediateValue2[productValue195]) + intermediateValue119;
                                    sumValue96 = float(intermediateValue2[productValue196]) + intermediateValue120;
                                    sumValue97 = intermediateValue118 + productValue532;
                                    sumValue98 = intermediateValue119 + productValue533;
                                    sumValue99 = intermediateValue120 + productValue534;
                                    uint comparisonValue286 = ((((uint(intermediateValue118 >= 16.0) << 1u) | uint(intermediateValue118 < 0.0)) | (uint(intermediateValue119 < 0.0) << 2u)) | (uint(intermediateValue119 >= 16.0) << 3u)) | (uint(intermediateValue120 < 0.0) << 4u);
                                    comparisonValue32 = intermediateValue[comparisonValue286 | (uint(intermediateValue120 >= 16.0) << 5u)];
                                    comparisonValue33 = ((((comparisonValue286 | (uint(intermediateValue120 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue286 & 31u))) == 0u;
                                    uint sampledTextureValue26;
                                    if (comparisonValue33)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue214 + 4096u)).x & (1u << (comparisonValue32 & 31u))) == 0u)
                                        {
                                            intermediateValue175 = 0.0;
                                            intermediateValue176 = 0.0;
                                            intermediateValue177 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue26 = ((((uint(sumValue97 - (floor(sumValue97 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue98 - (floor(sumValue98 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue99 - (floor(sumValue99 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue214 + 4097u) + comparisonValue32)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue26 = ((((intermediateValue121 << 8u) & 3840u) | (intermediateValue122 & 15u)) | ((intermediateValue123 << 4u) & 240u)) + bitwiseValue214;
                                    }
                                    uvec4 sampledTextureValue104 = texelFetch(voxelBuffer, int(sampledTextureValue26));
                                    uint scalarValue386 = sampledTextureValue104.x;
                                    if (scalarValue386 == 0u)
                                    {
                                        intermediateValue175 = 0.0;
                                        intermediateValue176 = 0.0;
                                        intermediateValue177 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue228 = float(scalarValue386 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue175 = bitwiseValue228 * float(scalarValue386 & 255u);
                                    intermediateValue176 = bitwiseValue228 * float((scalarValue386 >> 8u) & 255u);
                                    intermediateValue177 = bitwiseValue228 * float((scalarValue386 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue219;
                                float intermediateValue221;
                                float intermediateValue223;
                                float sumValue106;
                                float sumValue107;
                                float sumValue108;
                                uint comparisonValue45;
                                bool comparisonValue46;
                                for (;;)
                                {
                                    sumValue106 = sumValue91 + productValue532;
                                    sumValue107 = sumValue92 + productValue533;
                                    sumValue108 = sumValue93 + productValue534;
                                    uint comparisonValue287 = ((((uint(sumValue91 >= 16.0) << 1u) | uint(sumValue91 < 0.0)) | (uint(sumValue92 < 0.0) << 2u)) | (uint(sumValue92 >= 16.0) << 3u)) | (uint(sumValue93 < 0.0) << 4u);
                                    comparisonValue45 = intermediateValue[comparisonValue287 | (uint(sumValue93 >= 16.0) << 5u)];
                                    comparisonValue46 = ((((comparisonValue287 | (uint(sumValue93 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue287 & 31u))) == 0u;
                                    uint sampledTextureValue40;
                                    if (comparisonValue46)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue214 + 4096u)).x & (1u << (comparisonValue45 & 31u))) == 0u)
                                        {
                                            intermediateValue219 = 0.0;
                                            intermediateValue221 = 0.0;
                                            intermediateValue223 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue40 = ((((uint(sumValue106 - (floor(sumValue106 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue107 - (floor(sumValue107 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue108 - (floor(sumValue108 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue214 + 4097u) + comparisonValue45)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue40 = ((((uint(sumValue91) << 8u) & 3840u) | (uint(sumValue92) & 15u)) | ((uint(sumValue93) << 4u) & 240u)) + bitwiseValue214;
                                    }
                                    uvec4 sampledTextureValue105 = texelFetch(voxelBuffer, int(sampledTextureValue40));
                                    uint scalarValue387 = sampledTextureValue105.x;
                                    if (scalarValue387 == 0u)
                                    {
                                        intermediateValue219 = 0.0;
                                        intermediateValue221 = 0.0;
                                        intermediateValue223 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue229 = float(scalarValue387 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue219 = bitwiseValue229 * float(scalarValue387 & 255u);
                                    intermediateValue221 = bitwiseValue229 * float((scalarValue387 >> 8u) & 255u);
                                    intermediateValue223 = bitwiseValue229 * float((scalarValue387 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue225;
                                float intermediateValue227;
                                float intermediateValue229;
                                float sumValue117;
                                float sumValue118;
                                float sumValue119;
                                uint comparisonValue55;
                                bool comparisonValue56;
                                for (;;)
                                {
                                    sumValue117 = sumValue94 + productValue532;
                                    sumValue118 = sumValue95 + productValue533;
                                    sumValue119 = sumValue96 + productValue534;
                                    uint comparisonValue288 = ((((uint(sumValue94 >= 16.0) << 1u) | uint(sumValue94 < 0.0)) | (uint(sumValue95 < 0.0) << 2u)) | (uint(sumValue95 >= 16.0) << 3u)) | (uint(sumValue96 < 0.0) << 4u);
                                    comparisonValue55 = intermediateValue[comparisonValue288 | (uint(sumValue96 >= 16.0) << 5u)];
                                    comparisonValue56 = ((((comparisonValue288 | (uint(sumValue96 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue288 & 31u))) == 0u;
                                    uint sampledTextureValue44;
                                    if (comparisonValue56)
                                    {
                                        if ((texelFetch(voxelBuffer, int(bitwiseValue214 + 4096u)).x & (1u << (comparisonValue55 & 31u))) == 0u)
                                        {
                                            intermediateValue225 = 0.0;
                                            intermediateValue227 = 0.0;
                                            intermediateValue229 = 0.0;
                                            break;
                                        }
                                        sampledTextureValue44 = ((((uint(sumValue117 - (floor(sumValue117 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue118 - (floor(sumValue118 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue119 - (floor(sumValue119 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue214 + 4097u) + comparisonValue55)).x >> 2u);
                                    }
                                    else
                                    {
                                        sampledTextureValue44 = ((((uint(sumValue94) << 8u) & 3840u) | (uint(sumValue95) & 15u)) | ((uint(sumValue96) << 4u) & 240u)) + bitwiseValue214;
                                    }
                                    uvec4 sampledTextureValue106 = texelFetch(voxelBuffer, int(sampledTextureValue44));
                                    uint scalarValue388 = sampledTextureValue106.x;
                                    if (scalarValue388 == 0u)
                                    {
                                        intermediateValue225 = 0.0;
                                        intermediateValue227 = 0.0;
                                        intermediateValue229 = 0.0;
                                        break;
                                    }
                                    float bitwiseValue230 = float(scalarValue388 >> 24u) * 9.2272217443678528070449829101562e-05;
                                    intermediateValue225 = bitwiseValue230 * float(scalarValue388 & 255u);
                                    intermediateValue227 = bitwiseValue230 * float((scalarValue388 >> 8u) & 255u);
                                    intermediateValue229 = bitwiseValue230 * float((scalarValue388 >> 16u) & 255u);
                                    break;
                                }
                                float sumValue344 = sumValue77 + productValue532;
                                float sumValue345 = sumValue78 + productValue533;
                                float sumValue346 = sumValue79 + productValue534;
                                uint comparisonValue289 = ((((uint(sumValue77 >= 16.0) << 1u) | uint(sumValue77 < 0.0)) | (uint(sumValue78 < 0.0) << 2u)) | (uint(sumValue78 >= 16.0) << 3u)) | (uint(sumValue79 < 0.0) << 4u);
                                uint comparisonValue290 = comparisonValue289 | (uint(sumValue79 >= 16.0) << 5u);
                                uint sampledTextureValue49;
                                if ((((comparisonValue290 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue289 & 31u))) == 0u)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue214 + 4096u)).x & (1u << (intermediateValue[comparisonValue290] & 31u))) == 0u)
                                    {
                                        intermediateValue215 = intermediateValue175;
                                        intermediateValue216 = intermediateValue176;
                                        intermediateValue217 = intermediateValue177;
                                        intermediateValue218 = intermediateValue219;
                                        intermediateValue220 = intermediateValue221;
                                        intermediateValue222 = intermediateValue223;
                                        intermediateValue224 = intermediateValue225;
                                        intermediateValue226 = intermediateValue227;
                                        intermediateValue228 = intermediateValue229;
                                        intermediateValue230 = 0.0;
                                        intermediateValue231 = 0.0;
                                        intermediateValue232 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue49 = ((((uint(sumValue344 - (floor(sumValue344 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue345 - (floor(sumValue345 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue346 - (floor(sumValue346 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue214 + 4097u) + intermediateValue[comparisonValue290])).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue49 = ((((uint(sumValue77) << 8u) & 3840u) | (uint(sumValue78) & 15u)) | ((uint(sumValue79) << 4u) & 240u)) + bitwiseValue214;
                                }
                                uvec4 sampledTextureValue107 = texelFetch(voxelBuffer, int(sampledTextureValue49));
                                uint scalarValue389 = sampledTextureValue107.x;
                                if (scalarValue389 == 0u)
                                {
                                    intermediateValue215 = intermediateValue175;
                                    intermediateValue216 = intermediateValue176;
                                    intermediateValue217 = intermediateValue177;
                                    intermediateValue218 = intermediateValue219;
                                    intermediateValue220 = intermediateValue221;
                                    intermediateValue222 = intermediateValue223;
                                    intermediateValue224 = intermediateValue225;
                                    intermediateValue226 = intermediateValue227;
                                    intermediateValue228 = intermediateValue229;
                                    intermediateValue230 = 0.0;
                                    intermediateValue231 = 0.0;
                                    intermediateValue232 = 0.0;
                                    break;
                                }
                                float bitwiseValue231 = float(scalarValue389 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue215 = intermediateValue175;
                                intermediateValue216 = intermediateValue176;
                                intermediateValue217 = intermediateValue177;
                                intermediateValue218 = intermediateValue219;
                                intermediateValue220 = intermediateValue221;
                                intermediateValue222 = intermediateValue223;
                                intermediateValue224 = intermediateValue225;
                                intermediateValue226 = intermediateValue227;
                                intermediateValue228 = intermediateValue229;
                                intermediateValue230 = bitwiseValue231 * float(scalarValue389 & 255u);
                                intermediateValue231 = bitwiseValue231 * float((scalarValue389 >> 8u) & 255u);
                                intermediateValue232 = bitwiseValue231 * float((scalarValue389 >> 16u) & 255u);
                                break;
                            }
                        }
                        branchMergedValue65 = (((intermediateValue222 * sumValue75) + (intermediateValue217 * sumValue74)) + (intermediateValue228 * sumValue76)) + (intermediateValue232 * intermediateValue126);
                        branchMergedValue69 = (((intermediateValue220 * sumValue75) + (intermediateValue216 * sumValue74)) + (intermediateValue226 * sumValue76)) + (intermediateValue231 * intermediateValue126);
                        branchMergedValue70 = (((intermediateValue218 * sumValue75) + (intermediateValue215 * sumValue74)) + (intermediateValue224 * sumValue76)) + (intermediateValue230 * intermediateValue126);
                    }
                    branchMergedValue16 = branchMergedValue65;
                    branchMergedValue29 = branchMergedValue69;
                    branchMergedValue30 = branchMergedValue70;
#endif
                }
                else
                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    intermediateValue93 = 0.0;
                    intermediateValue91 = 0.0;
                    intermediateValue89 = 0.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    intermediateValue141 = 0.0;
                    intermediateValue139 = 0.0;
                    intermediateValue137 = 0.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    multiplyAddValue38 = multiplyAddValue4;
                    multiplyAddValue39 = multiplyAddValue5;
                    multiplyAddValue40 = multiplyAddValue6;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue16 = 0.0;
                    branchMergedValue29 = 0.0;
                    branchMergedValue30 = 0.0;
#endif
                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue88 = intermediateValue89;
                intermediateValue90 = intermediateValue91;
                intermediateValue92 = intermediateValue93;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue136 = intermediateValue137;
                intermediateValue138 = intermediateValue139;
                intermediateValue140 = intermediateValue141;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float inverseLengthValue12 = inversesqrt(dot(vec3(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40), vec3(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40)));
                float productValue214 = fragmentVectorConstants1.packedValues[80u].x * fragmentVectorConstants1.packedValues[80u].w;
                float productValue215 = fragmentVectorConstants1.packedValues[80u].y * fragmentVectorConstants1.packedValues[80u].w;
                float productValue216 = fragmentVectorConstants1.packedValues[80u].z * fragmentVectorConstants1.packedValues[80u].w;
                float productValue217 = fragmentVectorConstants1.packedValues[74u].w * fragmentVectorConstants1.packedValues[88u].x;
                float productValue220 = productValue217 * intermediateValue8;
                float productValue221 = productValue217 * productValue36;
                float productValue222 = productValue217 * productValue37;
                float dotProductValue18 = spvNClamp(dot(vec3(productValue220, productValue221, productValue222), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
                float productValue223 = ((dotProductValue18 * (productValue220 - productValue214)) + productValue214) * fragmentVectorConstants1.packedValues[128u].x;
                float productValue224 = ((dotProductValue18 * (productValue221 - productValue215)) + productValue215) * fragmentVectorConstants1.packedValues[128u].x;
                float productValue225 = ((dotProductValue18 * (productValue222 - productValue216)) + productValue216) * fragmentVectorConstants1.packedValues[128u].x;
                bool dotProductValue20 = dot(vec3(productValue223, productValue224, productValue225), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) <= 0.0;
                vec4 sampledTextureValue51 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3((-0.0) - (multiplyAddValue38 * inverseLengthValue12), (-0.0) - (multiplyAddValue39 * inverseLengthValue12), (-0.0) - (multiplyAddValue40 * inverseLengthValue12))), 0.0, 1.0), 1.0 - fragmentVectorConstants1.packedValues[128u].z));
                float scalarValue68 = sampledTextureValue51.x;
                float scalarValue69 = sampledTextureValue51.y;
                branchMergedValue13 = ((scalarValue68 * productValue26) + scalarValue69) * (dotProductValue20 ? 0.0 : productValue223);
                branchMergedValue22 = ((scalarValue68 * productValue28) + scalarValue69) * (dotProductValue20 ? 0.0 : productValue225);
                branchMergedValue23 = ((scalarValue68 * productValue27) + scalarValue69) * (dotProductValue20 ? 0.0 : productValue224);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                intermediateValue32 = branchMergedValue30;
                intermediateValue33 = branchMergedValue29;
                intermediateValue34 = branchMergedValue16;
#endif
            }
            else
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue88 = multiplyAddValue104;
                intermediateValue90 = multiplyAddValue103;
                intermediateValue92 = comparisonValue113;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue136 = multiplyAddValue272;
                intermediateValue138 = multiplyAddValue271;
                intermediateValue140 = comparisonValue178;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue13 = 0.0;
                branchMergedValue22 = 0.0;
                branchMergedValue23 = 0.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                intermediateValue32 = intermediateValue8;
                intermediateValue33 = productValue36;
                intermediateValue34 = productValue37;
#endif
            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue301 = fragmentScalarConstants1.packedValues[501u] * fragmentScalarConstants1.packedValues[501u];
            float productValue302 = (productValue301 * productValue301) * fragmentScalarConstants1.packedValues[501u];
            float multiplyAddValue213 = fma(fragmentScalarConstants1.packedValues[361u], fma(productValue301, fragmentScalarConstants1.packedValues[501u], -productValue302), productValue302);
            float scalarValue172 = rdDot3Precise(vec3(multiplyAddValue58, multiplyAddValue59, multiplyAddValue60), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            multiplyAddValue41 = ((fma(fragmentScalarConstants1.packedValues[585u], scalarValue172 - multiplyAddValue60, multiplyAddValue60) * fragmentScalarConstants1.packedValues[558u]) * fragmentScalarConstants1.packedValues[513u]) * fragmentScalarConstants1.packedValues[584u];
            multiplyAddValue42 = ((fma(fragmentScalarConstants1.packedValues[585u], scalarValue172 - multiplyAddValue59, multiplyAddValue59) * fragmentScalarConstants1.packedValues[558u]) * fragmentScalarConstants1.packedValues[513u]) * fragmentScalarConstants1.packedValues[584u];
            multiplyAddValue43 = ((fma(fragmentScalarConstants1.packedValues[585u], scalarValue172 - multiplyAddValue58, multiplyAddValue58) * fragmentScalarConstants1.packedValues[558u]) * fragmentScalarConstants1.packedValues[513u]) * fragmentScalarConstants1.packedValues[584u];
            intermediateValue52 = quotientValue4;
            intermediateValue53 = quotientValue5;
            intermediateValue54 = quotientValue6;
            multiplyAddValue44 = ((multiplyAddValue60 * sumValue137) * spvNMax(fma(intermediateValue88, fragmentScalarConstants1.packedValues[299u], (multiplyAddValue213 * fragmentVectorConstants1.packedValues[157u].z) * fragmentScalarConstants1.packedValues[631u]), fragmentScalarConstants1.packedValues[323u] * fragmentVectorConstants1.packedValues[80u].z)) * fragmentScalarConstants1.packedValues[559u];
            multiplyAddValue45 = ((multiplyAddValue59 * sumValue137) * spvNMax(fma(intermediateValue90, fragmentScalarConstants1.packedValues[299u], (multiplyAddValue213 * fragmentVectorConstants1.packedValues[157u].y) * fragmentScalarConstants1.packedValues[631u]), fragmentScalarConstants1.packedValues[323u] * fragmentVectorConstants1.packedValues[80u].y)) * fragmentScalarConstants1.packedValues[559u];
            multiplyAddValue46 = ((multiplyAddValue58 * sumValue137) * spvNMax(fma(intermediateValue92, fragmentScalarConstants1.packedValues[299u], (multiplyAddValue213 * fragmentVectorConstants1.packedValues[157u].x) * fragmentScalarConstants1.packedValues[631u]), fragmentScalarConstants1.packedValues[323u] * fragmentVectorConstants1.packedValues[80u].x)) * fragmentScalarConstants1.packedValues[559u];
            intermediateValue55 = multiplyAddValue47;
            intermediateValue56 = multiplyAddValue48;
            intermediateValue57 = multiplyAddValue49;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue415 = fragmentScalarConstants1.packedValues[509u] * fragmentScalarConstants1.packedValues[509u];
            float productValue416 = (productValue415 * productValue415) * fragmentScalarConstants1.packedValues[509u];
            float multiplyAddValue390 = fma(fragmentScalarConstants1.packedValues[369u], fma(productValue415, fragmentScalarConstants1.packedValues[509u], -productValue416), productValue416);
            float scalarValue319 = rdDot3Precise(vec3(multiplyAddValue253, multiplyAddValue254, multiplyAddValue255), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            multiplyAddValue41 = ((fma(fragmentScalarConstants1.packedValues[597u], scalarValue319 - multiplyAddValue255, multiplyAddValue255) * fragmentScalarConstants1.packedValues[570u]) * fragmentScalarConstants1.packedValues[521u]) * fragmentScalarConstants1.packedValues[596u];
            multiplyAddValue42 = ((fma(fragmentScalarConstants1.packedValues[597u], scalarValue319 - multiplyAddValue254, multiplyAddValue254) * fragmentScalarConstants1.packedValues[570u]) * fragmentScalarConstants1.packedValues[521u]) * fragmentScalarConstants1.packedValues[596u];
            multiplyAddValue43 = ((fma(fragmentScalarConstants1.packedValues[597u], scalarValue319 - multiplyAddValue253, multiplyAddValue253) * fragmentScalarConstants1.packedValues[570u]) * fragmentScalarConstants1.packedValues[521u]) * fragmentScalarConstants1.packedValues[596u];
            intermediateValue60 = multiplyAddValue44;
            intermediateValue61 = multiplyAddValue45;
            intermediateValue62 = multiplyAddValue46;
            multiplyAddValue47 = ((multiplyAddValue255 * sumValue211) * spvNMax(fma(intermediateValue136, fragmentScalarConstants1.packedValues[299u], (multiplyAddValue390 * fragmentVectorConstants1.packedValues[174u].z) * fragmentScalarConstants1.packedValues[699u]), fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].z)) * fragmentScalarConstants1.packedValues[571u];
            multiplyAddValue48 = ((multiplyAddValue254 * sumValue211) * spvNMax(fma(intermediateValue138, fragmentScalarConstants1.packedValues[299u], (multiplyAddValue390 * fragmentVectorConstants1.packedValues[174u].y) * fragmentScalarConstants1.packedValues[699u]), fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].y)) * fragmentScalarConstants1.packedValues[571u];
            multiplyAddValue49 = ((multiplyAddValue253 * sumValue211) * spvNMax(fma(intermediateValue140, fragmentScalarConstants1.packedValues[299u], (multiplyAddValue390 * fragmentVectorConstants1.packedValues[174u].x) * fragmentScalarConstants1.packedValues[699u]), fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].x)) * fragmentScalarConstants1.packedValues[571u];
            intermediateValue63 = multiplyAddValue50;
            intermediateValue64 = multiplyAddValue51;
            intermediateValue65 = multiplyAddValue52;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            intermediateValue72 = branchMergedValue13;
            intermediateValue73 = branchMergedValue23;
            intermediateValue74 = branchMergedValue22;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float productValue541 = fragmentVectorConstants1.packedValues[127u].y * fragmentVectorConstants1.packedValues[127u].y;
            float productValue542 = productValue541 * productValue541;
            float productValue543 = (((fragmentVectorConstants1.packedValues[92u].y * (productValue541 - productValue542)) + productValue542) * fragmentVectorConstants1.packedValues[127u].y) * fragmentVectorConstants1.packedValues[174u].w;
            float productValue544 = fragmentVectorConstants1.packedValues[142u].w * sumValue299;
            float dotProductValue13 = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float productValue545 = (fragmentVectorConstants1.packedValues[142u].z * fragmentVectorConstants1.packedValues[130u].y) * fragmentVectorConstants1.packedValues[149u].x;
            productValue42 = (((dotProductValue13 - exponentialValue) * fragmentVectorConstants1.packedValues[149u].y) + exponentialValue) * productValue545;
            productValue43 = (((dotProductValue13 - exponentialValue1) * fragmentVectorConstants1.packedValues[149u].y) + exponentialValue1) * productValue545;
            productValue44 = (((dotProductValue13 - exponentialValue2) * fragmentVectorConstants1.packedValues[149u].y) + exponentialValue2) * productValue545;
            productValue45 = (spvNMax((productValue543 * fragmentVectorConstants1.packedValues[174u].x) + (fragmentVectorConstants1.packedValues[74u].w * intermediateValue32), fragmentVectorConstants1.packedValues[81u].x * fragmentVectorConstants1.packedValues[81u].w) * exponentialValue) * productValue544;
            productValue46 = (spvNMax((productValue543 * fragmentVectorConstants1.packedValues[174u].y) + (fragmentVectorConstants1.packedValues[74u].w * intermediateValue33), fragmentVectorConstants1.packedValues[81u].y * fragmentVectorConstants1.packedValues[81u].w) * exponentialValue1) * productValue544;
            productValue47 = (spvNMax((productValue543 * fragmentVectorConstants1.packedValues[174u].z) + (fragmentVectorConstants1.packedValues[74u].w * intermediateValue34), fragmentVectorConstants1.packedValues[81u].z * fragmentVectorConstants1.packedValues[81u].w) * exponentialValue2) * productValue544;
            intermediateValue10 = productValue48;
            intermediateValue11 = productValue49;
            intermediateValue12 = productValue50;
            intermediateValue13 = productValue51;
            intermediateValue14 = productValue52;
            intermediateValue15 = productValue53;
#endif
        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        else
        {
            multiplyAddValue41 = 0.0;
            multiplyAddValue42 = 0.0;
            multiplyAddValue43 = 0.0;
            intermediateValue52 = 0.0;
            intermediateValue53 = 0.0;
            intermediateValue54 = 0.0;
            multiplyAddValue44 = 0.0;
            multiplyAddValue45 = 0.0;
            multiplyAddValue46 = 0.0;
            intermediateValue55 = 0.0;
            intermediateValue56 = 0.0;
            intermediateValue57 = 0.0;
        }
        float sumValue195 = multiplyAddValue43 + (intermediateValue54 + (intermediateValue57 + multiplyAddValue46));
        float sumValue196 = multiplyAddValue42 + (intermediateValue53 + (intermediateValue56 + multiplyAddValue45));
        float sumValue197 = multiplyAddValue41 + (intermediateValue52 + (intermediateValue55 + multiplyAddValue44));
        bool comparisonValue162 = fragmentScalarConstants1.packedValues[559u] != 0.0;
        float productValue303 = fragmentScalarConstants1.packedValues[323u] * fragmentVectorConstants1.packedValues[80u].x;
        float productValue304 = fragmentScalarConstants1.packedValues[323u] * fragmentVectorConstants1.packedValues[80u].y;
        float productValue305 = fragmentScalarConstants1.packedValues[323u] * fragmentVectorConstants1.packedValues[80u].z;
        bool comparisonValue163 = fragmentScalarConstants1.packedValues[344u] != 0.0;
        bool comparisonValue164 = fragmentScalarConstants1.packedValues[656u] != 0.0;
        float intermediateValue58;
        float intermediateValue59;
        float intermediateValue61;
        float intermediateValue63;
        if (comparisonValue163)
        {
            float quotientValue46 = spvNClamp((((nonlinearValue5 / fragmentScalarConstants1.packedValues[330u]) + fragmentScalarConstants1.packedValues[620u]) - fragmentScalarConstants1.packedValues[328u]) * fragmentScalarConstants1.packedValues[329u], 0.0, 1.0);
            float intermediateValue60;
            float intermediateValue62;
            float intermediateValue64;
            if (quotientValue46 > 0.0)
            {
                float multiplyAddValue75;
                float multiplyAddValue76;
                float multiplyAddValue77;
                if (fragmentScalarConstants1.packedValues[345u] != 0.0)
                {
                    bool comparisonValue165 = comparisonValue162 && (fragmentScalarConstants1.packedValues[346u] != 0.0);
                    multiplyAddValue75 = spvNMax(comparisonValue165 ? (spvNMax(productValue303, fma(fragmentVectorConstants1.packedValues[157u].x, fragmentScalarConstants1.packedValues[631u], fragmentScalarConstants1.packedValues[299u])) * fragmentScalarConstants1.packedValues[346u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[87u].x;
                    multiplyAddValue76 = spvNMax(comparisonValue165 ? (spvNMax(productValue304, fma(fragmentVectorConstants1.packedValues[157u].y, fragmentScalarConstants1.packedValues[631u], fragmentScalarConstants1.packedValues[299u])) * fragmentScalarConstants1.packedValues[346u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[87u].y;
                    multiplyAddValue77 = spvNMax(comparisonValue165 ? (spvNMax(productValue305, fma(fragmentVectorConstants1.packedValues[157u].z, fragmentScalarConstants1.packedValues[631u], fragmentScalarConstants1.packedValues[299u])) * fragmentScalarConstants1.packedValues[346u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[87u].z;
                }
                else
                {
                    float sumValue125 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
                    float sumValue126 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
                    float sumValue128 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
                    vec3 vectorValue13 = vec3(sumValue125, sumValue126, sumValue128);
                    float scalarValue173 = rdDot3Precise(vectorValue13, vectorValue13);
                    float inverseLengthValue22 = inversesqrt(scalarValue173);
                    float sumValue198 = fragmentScalarConstants1.packedValues[595u] - fragmentScalarConstants1.packedValues[592u];
                    float multiplyAddValue214 = fma(sumValue126, inverseLengthValue22, sumValue198);
                    float quotientValue47 = spvNClamp(multiplyAddValue214 * (1.0 / (sumValue198 + (fragmentScalarConstants1.packedValues[594u] - fragmentScalarConstants1.packedValues[595u]))), 0.0, 1.0);
                    float multiplyAddValue215 = fma(-fma(quotientValue47, -2.0, 3.0), quotientValue47 * quotientValue47, 1.0);
                    float productValue306 = multiplyAddValue215 * (multiplyAddValue215 * multiplyAddValue215);
                    vec3 productValue307 = vec3(inverseLengthValue22 * sumValue125, inverseLengthValue22 * sumValue126, inverseLengthValue22 * sumValue128);
                    float scalarValue174 = rdDot3Precise(productValue307, vec3(fragmentVectorConstants1.packedValues[152u].xyz));
                    float scalarValue175 = rdDot3Precise(productValue307, vec3(fragmentVectorConstants1.packedValues[91u].xyz));
                    float quotientValue48 = spvNClamp(multiplyAddValue214 * (1.0 / (sumValue198 + fragmentScalarConstants1.packedValues[593u])), 0.0, 1.0);
                    float multiplyAddValue216 = fma(-fma(quotientValue48, -2.0, 3.0), quotientValue48 * quotientValue48, 1.0);
                    float productValue308 = multiplyAddValue216 * (multiplyAddValue216 * multiplyAddValue216);
                    float multiplyAddValue219 = fma(fma(scalarValue174, scalarValue174, 1.0) * fragmentScalarConstants1.packedValues[643u], 0.75, (fma(scalarValue175, scalarValue175, 1.0) * fragmentScalarConstants1.packedValues[603u]) * 0.75);
                    float exponentialValue5 = spvNMin(exp2(log2(spvNMax(scalarValue174, 0.0)) * fragmentScalarConstants1.packedValues[335u]), 1.0);
                    float exponentialValue6 = spvNMin(exp2(log2(spvNMax(scalarValue175, 0.0)) * fragmentScalarConstants1.packedValues[335u]), 1.0);
                    float multiplyAddValue220 = fma(-exponentialValue5, 1.7999999523162841796875, 1.809999942779541015625);
                    float nonlinearValue7 = 0.0361000001430511474609375 / (multiplyAddValue220 * sqrt(multiplyAddValue220));
                    float multiplyAddValue221 = fma(-exponentialValue6, 1.7999999523162841796875, 1.809999942779541015625);
                    float nonlinearValue8 = 0.0361000001430511474609375 / (multiplyAddValue221 * sqrt(multiplyAddValue221));
                    float multiplyAddValue222 = fma((fma(productValue308, fragmentVectorConstants1.packedValues[158u].x - fragmentVectorConstants1.packedValues[84u].x, fragmentVectorConstants1.packedValues[84u].x) * fragmentScalarConstants1.packedValues[332u]) * 0.079577468335628509521484375, multiplyAddValue219, fma(exponentialValue5 * ((fragmentVectorConstants1.packedValues[160u].x * fragmentScalarConstants1.packedValues[643u]) * fragmentScalarConstants1.packedValues[333u]), nonlinearValue7, nonlinearValue8 * (exponentialValue6 * ((fragmentVectorConstants1.packedValues[150u].x * fragmentScalarConstants1.packedValues[603u]) * fragmentScalarConstants1.packedValues[334u]))) * ((productValue306 * fragmentVectorConstants1.packedValues[158u].x) * 0.079577468335628509521484375));
                    float multiplyAddValue223 = fma((fma(productValue308, fragmentVectorConstants1.packedValues[158u].y - fragmentVectorConstants1.packedValues[84u].y, fragmentVectorConstants1.packedValues[84u].y) * fragmentScalarConstants1.packedValues[332u]) * 0.079577468335628509521484375, multiplyAddValue219, fma(exponentialValue5 * ((fragmentVectorConstants1.packedValues[160u].y * fragmentScalarConstants1.packedValues[643u]) * fragmentScalarConstants1.packedValues[333u]), nonlinearValue7, nonlinearValue8 * (exponentialValue6 * ((fragmentVectorConstants1.packedValues[150u].y * fragmentScalarConstants1.packedValues[603u]) * fragmentScalarConstants1.packedValues[334u]))) * ((productValue306 * fragmentVectorConstants1.packedValues[158u].y) * 0.079577468335628509521484375));
                    float multiplyAddValue224 = fma((fma(productValue308, fragmentVectorConstants1.packedValues[158u].z - fragmentVectorConstants1.packedValues[84u].z, fragmentVectorConstants1.packedValues[84u].z) * fragmentScalarConstants1.packedValues[332u]) * 0.079577468335628509521484375, multiplyAddValue219, fma(exponentialValue5 * ((fragmentVectorConstants1.packedValues[160u].z * fragmentScalarConstants1.packedValues[643u]) * fragmentScalarConstants1.packedValues[333u]), nonlinearValue7, nonlinearValue8 * (exponentialValue6 * ((fragmentVectorConstants1.packedValues[150u].z * fragmentScalarConstants1.packedValues[603u]) * fragmentScalarConstants1.packedValues[334u]))) * ((productValue306 * fragmentVectorConstants1.packedValues[158u].z) * 0.079577468335628509521484375));
                    bool comparisonValue166 = fragmentScalarConstants1.packedValues[347u] != 0.0;
                    float scalarValue176 = spvNMax(fragmentScalarConstants1.packedValues[357u], fragmentScalarConstants1.packedValues[501u]);
                    multiplyAddValue75 = comparisonValue166 ? fma(scalarValue176, multiplyAddValue222 - fragmentVectorConstants1.packedValues[161u].x, fragmentVectorConstants1.packedValues[161u].x) : multiplyAddValue222;
                    multiplyAddValue76 = comparisonValue166 ? fma(scalarValue176, multiplyAddValue223 - fragmentVectorConstants1.packedValues[161u].y, fragmentVectorConstants1.packedValues[161u].y) : multiplyAddValue223;
                    multiplyAddValue77 = comparisonValue166 ? fma(scalarValue176, multiplyAddValue224 - fragmentVectorConstants1.packedValues[161u].z, fragmentVectorConstants1.packedValues[161u].z) : multiplyAddValue224;
                }
                intermediateValue64 = multiplyAddValue75;
                intermediateValue62 = multiplyAddValue76;
                intermediateValue60 = multiplyAddValue77;
            }
            else
            {
                intermediateValue64 = 0.0;
                intermediateValue62 = 0.0;
                intermediateValue60 = 0.0;
            }
            intermediateValue58 = quotientValue46;
            intermediateValue59 = intermediateValue60;
            intermediateValue61 = intermediateValue62;
            intermediateValue63 = intermediateValue64;
        }
        else
        {
            intermediateValue58 = 0.0;
            intermediateValue59 = 0.0;
            intermediateValue61 = 0.0;
            intermediateValue63 = 0.0;
        }
        float multiplyAddValue79;
        float multiplyAddValue80;
        float multiplyAddValue81;
        float multiplyAddValue82;
        if (comparisonValue164)
        {
            float productValue309 = (multiplyAddValue71 + 1.0) * 0.5;
            float productValue310 = (multiplyAddValue72 + 1.0) * 0.5;
            float multiplyAddValue225 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue73, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue71, multiplyAddValue72 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue73, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue71, multiplyAddValue72 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[652u]) / (fragmentScalarConstants1.packedValues[653u] - fragmentScalarConstants1.packedValues[652u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[650u]), -0.5);
            uint sumValue199 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[650u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue225))), int(0u))))));
            float scalarValue177 = rdSignedBitsToFloat2(sumValue199);
            float sumValue200 = spvNClamp(multiplyAddValue225 - scalarValue177, 0.0, 1.0);
            vec4 sampledTextureValue58 = textureLod(sampler2DArray(materialTexture5, textureSampler5), vec3(productValue309, productValue310, scalarValue177), 0.0);
            float scalarValue178 = sampledTextureValue58.x;
            float scalarValue179 = sampledTextureValue58.y;
            float scalarValue180 = sampledTextureValue58.z;
            float scalarValue181 = sampledTextureValue58.w;
            float sumValue201 = rdSignedBitsToFloat2(sumValue199 + 1u);
            vec4 sampledTextureValue59 = textureLod(sampler2DArray(materialTexture5, textureSampler5), vec3(productValue309, productValue310, sumValue201), 0.0);
            multiplyAddValue79 = fma(sumValue200, sampledTextureValue59.z - scalarValue180, scalarValue180);
            multiplyAddValue80 = fma(sumValue200, sampledTextureValue59.y - scalarValue179, scalarValue179);
            multiplyAddValue81 = fma(sumValue200, sampledTextureValue59.x - scalarValue178, scalarValue178);
            multiplyAddValue82 = fma(sumValue200, sampledTextureValue59.w - scalarValue181, scalarValue181);
        }
        else
        {
            multiplyAddValue79 = 0.0;
            multiplyAddValue80 = 0.0;
            multiplyAddValue81 = 0.0;
            multiplyAddValue82 = 1.0;
        }
        float intermediateValue146;
        float intermediateValue147;
        float intermediateValue148;
        if (fragmentScalarConstants1.packedValues[596u] != 0.0)
        {
            float multiplyAddValue226 = spvNClamp(fma(fragmentScalarConstants1.packedValues[501u], 16.0, -fragmentScalarConstants1.packedValues[341u]) / spvNMax(fragmentScalarConstants1.packedValues[340u] - fragmentScalarConstants1.packedValues[341u], 1.0), 0.0, 1.0);
            float productValue311 = (multiplyAddValue226 * (multiplyAddValue226 * multiplyAddValue226)) * fragmentScalarConstants1.packedValues[596u];
            bool conditionValue14 = fragmentScalarConstants1.packedValues[612u] > 0.0;
            bool conditionValue15 = fragmentScalarConstants1.packedValues[607u] > 0.0;
            float multiplyAddValue227 = conditionValue15 ? (fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue99, fma(fragmentVectorConstants1.packedValues[4u].x, multiplyAddValue97, multiplyAddValue98 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue66;
            float multiplyAddValue228 = conditionValue15 ? (fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue99, fma(fragmentVectorConstants1.packedValues[4u].y, multiplyAddValue97, multiplyAddValue98 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue67;
            float multiplyAddValue229 = conditionValue15 ? (fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue99, fma(fragmentVectorConstants1.packedValues[4u].z, multiplyAddValue97, multiplyAddValue98 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue68;
            float comparisonValue167 = (conditionValue15 ? multiplyAddValue97 : varyingTexCoord3.x) - fragmentVectorConstants1.packedValues[11u].x;
            float comparisonValue168 = (conditionValue15 ? multiplyAddValue98 : varyingTexCoord3.y) - fragmentVectorConstants1.packedValues[11u].y;
            float comparisonValue169 = (conditionValue15 ? multiplyAddValue99 : varyingTexCoord3.z) - fragmentVectorConstants1.packedValues[11u].z;
            vec3 vectorValue14 = vec3(comparisonValue167, comparisonValue168, comparisonValue169);
            float scalarValue182 = rdDot3Precise(vectorValue14, vectorValue14);
            float inverseLengthValue23 = inversesqrt(scalarValue182);
            float productValue312 = inverseLengthValue23 * comparisonValue167;
            float productValue313 = inverseLengthValue23 * comparisonValue168;
            float productValue314 = inverseLengthValue23 * comparisonValue169;
            vec3 vectorValue15 = vec3(multiplyAddValue227, multiplyAddValue228, multiplyAddValue229);
            float scalarValue183 = rdDot3Precise(vectorValue15, vectorValue15);
            float inverseLengthValue24 = inversesqrt(scalarValue183);
            float scalarValue184 = rdDot3Precise(vec3(productValue312, productValue313, productValue314), vec3(productValue236, productValue237, productValue238));
            float sumValue202 = -(scalarValue184 + scalarValue184);
            float multiplyAddValue230 = fma(productValue236, sumValue202, productValue312);
            float multiplyAddValue231 = fma(productValue237, sumValue202, productValue313);
            float multiplyAddValue232 = fma(productValue238, sumValue202, productValue314);
            float sumValue203 = 1.0 - fragmentScalarConstants1.packedValues[514u];
            float productValue315 = sumValue203 * sumValue203;
            float sumValue204 = fragmentScalarConstants1.packedValues[597u] - 1.0;
            float productValue316 = productValue315 * productValue315;
            float multiplyAddValue233 = (uint(int(fragmentScalarConstants1.packedValues[516u])) == 1u) ? (fma(fragmentScalarConstants1.packedValues[514u] - 1.0, sumValue203, 1.0) * sumValue204) : (fma(-productValue316, productValue316, 1.0) * sumValue204);
            uint sumValue205 = uint(int(fragmentScalarConstants1.packedValues[324u])) + 2u;
            uint scalarValue185 = uint(abs(int(sumValue205))) % 3u;
            vec4 sampledTextureValue60 = textureLod(samplerCubeArray(materialTexture7, textureSampler7), vec4(multiplyAddValue230, multiplyAddValue231, multiplyAddValue232, trunc(fragmentScalarConstants1.packedValues[324u])), multiplyAddValue233);
            float comparisonValue170 = rdSignedBitsToFloat2(((sumValue205 & 2147483648u) != 0u) ? (-scalarValue185) : scalarValue185);
            vec4 sampledTextureValue61 = textureLod(samplerCubeArray(materialTexture7, textureSampler7), vec4(multiplyAddValue230, multiplyAddValue231, multiplyAddValue232, comparisonValue170), multiplyAddValue233);
            float scalarValue186 = sampledTextureValue61.x;
            float scalarValue187 = sampledTextureValue61.y;
            float scalarValue188 = sampledTextureValue61.z;
            float multiplyAddValue234 = fma(fragmentScalarConstants1.packedValues[599u], sampledTextureValue60.x - scalarValue186, scalarValue186);
            float multiplyAddValue235 = fma(fragmentScalarConstants1.packedValues[599u], sampledTextureValue60.y - scalarValue187, scalarValue187);
            float multiplyAddValue236 = fma(fragmentScalarConstants1.packedValues[599u], sampledTextureValue60.z - scalarValue188, scalarValue188);
            float comparisonValue171 = (productValue311 * (conditionValue14 ? (multiplyAddValue234 * 301.72412109375) : multiplyAddValue234)) * fragmentScalarConstants1.packedValues[598u];
            float comparisonValue172 = (productValue311 * (conditionValue14 ? (multiplyAddValue235 * 301.72412109375) : multiplyAddValue235)) * fragmentScalarConstants1.packedValues[598u];
            float comparisonValue173 = (productValue311 * (conditionValue14 ? (multiplyAddValue236 * 301.72412109375) : multiplyAddValue236)) * fragmentScalarConstants1.packedValues[598u];
            float productValue317 = comparisonValue113 * fragmentScalarConstants1.packedValues[299u];
            float productValue318 = multiplyAddValue103 * fragmentScalarConstants1.packedValues[299u];
            float productValue319 = multiplyAddValue104 * fragmentScalarConstants1.packedValues[299u];
            float productValue320 = rdDot3Precise(vec3(productValue317 * fragmentScalarConstants1.packedValues[352u], productValue318 * fragmentScalarConstants1.packedValues[352u], productValue319 * fragmentScalarConstants1.packedValues[352u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue189 = spvNClamp(productValue320, 0.0, 1.0);
            float multiplyAddValue237 = fma(scalarValue189, fma(fragmentScalarConstants1.packedValues[352u], productValue317, -productValue303), productValue303) * fragmentScalarConstants1.packedValues[512u];
            float multiplyAddValue238 = fma(scalarValue189, fma(fragmentScalarConstants1.packedValues[352u], productValue318, -productValue304), productValue304) * fragmentScalarConstants1.packedValues[512u];
            float multiplyAddValue239 = fma(scalarValue189, fma(fragmentScalarConstants1.packedValues[352u], productValue319, -productValue305), productValue305) * fragmentScalarConstants1.packedValues[512u];
            float scalarValue190 = rdDot3Precise(vec3(comparisonValue171, comparisonValue172, comparisonValue173), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue191 = rdDot3Precise(vec3(multiplyAddValue237, multiplyAddValue238, multiplyAddValue239), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            bool bitwiseValue118 = comparisonValue162 && (scalarValue190 < scalarValue191);
            float productValue321 = rdDot3Precise(vectorValue7, vec3(-(inverseLengthValue24 * multiplyAddValue227), -(inverseLengthValue24 * multiplyAddValue228), -(inverseLengthValue24 * multiplyAddValue229)));
            vec4 sampledTextureValue62 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(productValue321, 0.0, 1.0), sumValue203));
            float scalarValue192 = sampledTextureValue62.x;
            float scalarValue193 = sampledTextureValue62.y;
            float multiplyAddValue240 = (bitwiseValue118 ? multiplyAddValue237 : comparisonValue171) * fma(multiplyAddValue100, scalarValue192, scalarValue193);
            float multiplyAddValue241 = (bitwiseValue118 ? multiplyAddValue238 : comparisonValue172) * fma(multiplyAddValue101, scalarValue192, scalarValue193);
            float multiplyAddValue242 = (bitwiseValue118 ? multiplyAddValue239 : comparisonValue173) * fma(multiplyAddValue102, scalarValue192, scalarValue193);
            float quotientValue49 = ((nonlinearValue5 / fragmentScalarConstants1.packedValues[330u]) + fragmentScalarConstants1.packedValues[620u]) - fragmentScalarConstants1.packedValues[328u];
            float productValue322 = 1.0 - spvNClamp(quotientValue49 * fragmentScalarConstants1.packedValues[329u], 0.0, 1.0);
            float quotientValue50 = 1.0 - spvNClamp(quotientValue49 / (fragmentScalarConstants1.packedValues[329u] - fragmentScalarConstants1.packedValues[328u]), 0.0, 1.0);
            float comparisonValue174 = comparisonValue163 ? (multiplyAddValue240 * productValue322) : (quotientValue50 * multiplyAddValue240);
            float comparisonValue175 = comparisonValue163 ? (multiplyAddValue241 * productValue322) : (quotientValue50 * multiplyAddValue241);
            float comparisonValue176 = comparisonValue163 ? (multiplyAddValue242 * productValue322) : (quotientValue50 * multiplyAddValue242);
            float productValue69;
            float productValue70;
            float productValue71;
            if (comparisonValue164)
            {
                float productValue323 = (multiplyAddValue71 + 1.0) * 0.5;
                float productValue324 = (multiplyAddValue72 + 1.0) * 0.5;
                float multiplyAddValue243 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue73, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue71, multiplyAddValue72 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue73, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue71, multiplyAddValue72 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[652u]) / (fragmentScalarConstants1.packedValues[653u] - fragmentScalarConstants1.packedValues[652u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[650u]), -0.5);
                uint sumValue206 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[650u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue243))), int(0u))))));
                float scalarValue194 = rdSignedBitsToFloat2(sumValue206);
                vec4 sampledTextureValue63 = textureLod(sampler2DArray(materialTexture5, textureSampler5), vec3(productValue323, productValue324, scalarValue194), 0.0);
                float scalarValue195 = sampledTextureValue63.w;
                float sumValue207 = rdSignedBitsToFloat2(sumValue206 + 1u);
                float sampledTextureValue64 = fma(spvNClamp(multiplyAddValue243 - scalarValue194, 0.0, 1.0), textureLod(sampler2DArray(materialTexture5, textureSampler5), vec3(productValue323, productValue324, sumValue207), 0.0).w - scalarValue195, scalarValue195);
                productValue69 = comparisonValue174 * sampledTextureValue64;
                productValue70 = comparisonValue175 * sampledTextureValue64;
                productValue71 = comparisonValue176 * sampledTextureValue64;
            }
            else
            {
                productValue69 = comparisonValue174;
                productValue70 = comparisonValue175;
                productValue71 = comparisonValue176;
            }
            intermediateValue146 = productValue71;
            intermediateValue147 = productValue70;
            intermediateValue148 = productValue69;
        }
        else
        {
            float multiplyAddValue116;
            float multiplyAddValue117;
            float multiplyAddValue118;
            if (comparisonValue162)
            {
                bool conditionValue16 = fragmentScalarConstants1.packedValues[607u] > 0.0;
                float multiplyAddValue244 = conditionValue16 ? (fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue99, fma(fragmentVectorConstants1.packedValues[4u].x, multiplyAddValue97, multiplyAddValue98 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue66;
                float multiplyAddValue245 = conditionValue16 ? (fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue99, fma(fragmentVectorConstants1.packedValues[4u].y, multiplyAddValue97, multiplyAddValue98 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue67;
                float multiplyAddValue246 = conditionValue16 ? (fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue99, fma(fragmentVectorConstants1.packedValues[4u].z, multiplyAddValue97, multiplyAddValue98 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue68;
                vec3 vectorValue16 = vec3(multiplyAddValue244, multiplyAddValue245, multiplyAddValue246);
                float scalarValue196 = rdDot3Precise(vectorValue16, vectorValue16);
                float inverseLengthValue25 = inversesqrt(scalarValue196);
                float productValue325 = comparisonValue113 * fragmentScalarConstants1.packedValues[299u];
                float productValue326 = multiplyAddValue103 * fragmentScalarConstants1.packedValues[299u];
                float productValue327 = multiplyAddValue104 * fragmentScalarConstants1.packedValues[299u];
                float productValue328 = rdDot3Precise(vec3(productValue325 * fragmentScalarConstants1.packedValues[352u], productValue326 * fragmentScalarConstants1.packedValues[352u], productValue327 * fragmentScalarConstants1.packedValues[352u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                float scalarValue197 = spvNClamp(productValue328, 0.0, 1.0);
                float multiplyAddValue247 = fma(scalarValue197, fma(fragmentScalarConstants1.packedValues[352u], productValue325, -productValue303), productValue303) * fragmentScalarConstants1.packedValues[512u];
                float multiplyAddValue248 = fma(scalarValue197, fma(fragmentScalarConstants1.packedValues[352u], productValue326, -productValue304), productValue304) * fragmentScalarConstants1.packedValues[512u];
                float multiplyAddValue249 = fma(scalarValue197, fma(fragmentScalarConstants1.packedValues[352u], productValue327, -productValue305), productValue305) * fragmentScalarConstants1.packedValues[512u];
                float scalarValue198 = rdDot3Precise(vec3(multiplyAddValue247, multiplyAddValue248, multiplyAddValue249), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool conditionValue17 = scalarValue198 > 0.0;
                float productValue329 = rdDot3Precise(vectorValue7, vec3(-(inverseLengthValue25 * multiplyAddValue244), -(inverseLengthValue25 * multiplyAddValue245), -(inverseLengthValue25 * multiplyAddValue246)));
                vec4 sampledTextureValue65 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(productValue329, 0.0, 1.0), 1.0 - fragmentScalarConstants1.packedValues[514u]));
                float scalarValue199 = sampledTextureValue65.x;
                float scalarValue200 = sampledTextureValue65.y;
                multiplyAddValue116 = conditionValue17 ? (fma(multiplyAddValue100, scalarValue199, scalarValue200) * multiplyAddValue247) : 0.0;
                multiplyAddValue117 = conditionValue17 ? (fma(multiplyAddValue101, scalarValue199, scalarValue200) * multiplyAddValue248) : 0.0;
                multiplyAddValue118 = conditionValue17 ? (fma(multiplyAddValue102, scalarValue199, scalarValue200) * multiplyAddValue249) : 0.0;
            }
            else
            {
                multiplyAddValue116 = 0.0;
                multiplyAddValue117 = 0.0;
                multiplyAddValue118 = 0.0;
            }
            intermediateValue146 = multiplyAddValue118;
            intermediateValue147 = multiplyAddValue117;
            intermediateValue148 = multiplyAddValue116;
        }
        multiplyAddValue35 = intermediateValue146 + fma(multiplyAddValue82, fma(intermediateValue58, intermediateValue59 - sumValue197, sumValue197), multiplyAddValue79);
        multiplyAddValue36 = intermediateValue147 + fma(multiplyAddValue82, fma(intermediateValue58, intermediateValue61 - sumValue196, sumValue196), multiplyAddValue80);
        multiplyAddValue37 = intermediateValue148 + fma(multiplyAddValue82, fma(intermediateValue58, intermediateValue63 - sumValue195, sumValue195), multiplyAddValue81);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        else
        {
            multiplyAddValue41 = 0.0;
            multiplyAddValue42 = 0.0;
            multiplyAddValue43 = 0.0;
            intermediateValue60 = 0.0;
            intermediateValue61 = 0.0;
            intermediateValue62 = 0.0;
            multiplyAddValue47 = 0.0;
            multiplyAddValue48 = 0.0;
            multiplyAddValue49 = 0.0;
            intermediateValue63 = 0.0;
            intermediateValue64 = 0.0;
            intermediateValue65 = 0.0;
        }
        float sumValue286 = multiplyAddValue43 + (intermediateValue62 + (intermediateValue65 + multiplyAddValue49));
        float sumValue287 = multiplyAddValue42 + (intermediateValue61 + (intermediateValue64 + multiplyAddValue48));
        float sumValue288 = multiplyAddValue41 + (intermediateValue60 + (intermediateValue63 + multiplyAddValue47));
        bool comparisonValue244 = fragmentScalarConstants1.packedValues[571u] != 0.0;
        bool comparisonValue245 = fragmentScalarConstants1.packedValues[348u] != 0.0;
        bool comparisonValue246 = fragmentScalarConstants1.packedValues[728u] != 0.0;
        float intermediateValue66;
        float intermediateValue67;
        float intermediateValue69;
        float intermediateValue71;
        if (comparisonValue245)
        {
            float quotientValue68 = spvNClamp((((nonlinearValue5 / fragmentScalarConstants1.packedValues[334u]) + fragmentScalarConstants1.packedValues[688u]) - fragmentScalarConstants1.packedValues[332u]) * fragmentScalarConstants1.packedValues[333u], 0.0, 1.0);
            float intermediateValue68;
            float intermediateValue70;
            float intermediateValue72;
            if (quotientValue68 > 0.0)
            {
                float multiplyAddValue79;
                float multiplyAddValue80;
                float multiplyAddValue81;
                if (fragmentScalarConstants1.packedValues[349u] != 0.0)
                {
                    bool comparisonValue247 = comparisonValue244 && (fragmentScalarConstants1.packedValues[350u] != 0.0);
                    multiplyAddValue79 = spvNMax(comparisonValue247 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[174u].x, fragmentScalarConstants1.packedValues[699u], fragmentScalarConstants1.packedValues[299u]), fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].x) * fragmentScalarConstants1.packedValues[350u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[88u].x;
                    multiplyAddValue80 = spvNMax(comparisonValue247 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[174u].y, fragmentScalarConstants1.packedValues[699u], fragmentScalarConstants1.packedValues[299u]), fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].y) * fragmentScalarConstants1.packedValues[350u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[88u].y;
                    multiplyAddValue81 = spvNMax(comparisonValue247 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[174u].z, fragmentScalarConstants1.packedValues[699u], fragmentScalarConstants1.packedValues[299u]), fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].z) * fragmentScalarConstants1.packedValues[350u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[88u].z;
                }
                else
                {
                    float sumValue125 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
                    float sumValue126 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
                    float sumValue128 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
                    vec3 vectorValue13 = vec3(sumValue125, sumValue126, sumValue128);
                    float scalarValue173 = rdDot3Precise(vectorValue13, vectorValue13);
                    float inverseLengthValue22 = inversesqrt(scalarValue173);
                    float sumValue289 = fragmentScalarConstants1.packedValues[607u] - fragmentScalarConstants1.packedValues[604u];
                    float multiplyAddValue391 = fma(sumValue126, inverseLengthValue22, sumValue289);
                    float quotientValue69 = spvNClamp(multiplyAddValue391 * (1.0 / (sumValue289 + (fragmentScalarConstants1.packedValues[606u] - fragmentScalarConstants1.packedValues[607u]))), 0.0, 1.0);
                    float multiplyAddValue392 = fma(-fma(quotientValue69, -2.0, 3.0), quotientValue69 * quotientValue69, 1.0);
                    float productValue417 = multiplyAddValue392 * (multiplyAddValue392 * multiplyAddValue392);
                    vec3 productValue307 = vec3(inverseLengthValue22 * sumValue125, inverseLengthValue22 * sumValue126, inverseLengthValue22 * sumValue128);
                    float scalarValue320 = rdDot3Precise(productValue307, vec3(fragmentVectorConstants1.packedValues[168u].xyz));
                    float scalarValue321 = rdDot3Precise(productValue307, vec3(fragmentVectorConstants1.packedValues[93u].xyz));
                    float quotientValue70 = spvNClamp(multiplyAddValue391 * (1.0 / (sumValue289 + fragmentScalarConstants1.packedValues[605u])), 0.0, 1.0);
                    float multiplyAddValue393 = fma(-fma(quotientValue70, -2.0, 3.0), quotientValue70 * quotientValue70, 1.0);
                    float productValue418 = multiplyAddValue393 * (multiplyAddValue393 * multiplyAddValue393);
                    float multiplyAddValue394 = fma(fma(scalarValue320, scalarValue320, 1.0) * fragmentScalarConstants1.packedValues[711u], 0.75, (fma(scalarValue321, scalarValue321, 1.0) * fragmentScalarConstants1.packedValues[615u]) * 0.75);
                    float exponentialValue7 = spvNMin(exp2(log2(spvNMax(scalarValue320, 0.0)) * fragmentScalarConstants1.packedValues[339u]), 1.0);
                    float exponentialValue8 = spvNMin(exp2(log2(spvNMax(scalarValue321, 0.0)) * fragmentScalarConstants1.packedValues[339u]), 1.0);
                    float multiplyAddValue395 = fma(-exponentialValue7, 1.7999999523162841796875, 1.809999942779541015625);
                    float nonlinearValue12 = 0.0361000001430511474609375 / (multiplyAddValue395 * sqrt(multiplyAddValue395));
                    float multiplyAddValue396 = fma(-exponentialValue8, 1.7999999523162841796875, 1.809999942779541015625);
                    float nonlinearValue13 = 0.0361000001430511474609375 / (multiplyAddValue396 * sqrt(multiplyAddValue396));
                    float multiplyAddValue397 = fma((fma(productValue418, fragmentVectorConstants1.packedValues[175u].x - fragmentVectorConstants1.packedValues[85u].x, fragmentVectorConstants1.packedValues[85u].x) * fragmentScalarConstants1.packedValues[336u]) * 0.079577468335628509521484375, multiplyAddValue394, fma(exponentialValue7 * ((fragmentVectorConstants1.packedValues[177u].x * fragmentScalarConstants1.packedValues[711u]) * fragmentScalarConstants1.packedValues[337u]), nonlinearValue12, nonlinearValue13 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[153u].x * fragmentScalarConstants1.packedValues[615u]) * fragmentScalarConstants1.packedValues[338u]))) * ((productValue417 * fragmentVectorConstants1.packedValues[175u].x) * 0.079577468335628509521484375));
                    float multiplyAddValue398 = fma((fma(productValue418, fragmentVectorConstants1.packedValues[175u].y - fragmentVectorConstants1.packedValues[85u].y, fragmentVectorConstants1.packedValues[85u].y) * fragmentScalarConstants1.packedValues[336u]) * 0.079577468335628509521484375, multiplyAddValue394, fma(exponentialValue7 * ((fragmentVectorConstants1.packedValues[177u].y * fragmentScalarConstants1.packedValues[711u]) * fragmentScalarConstants1.packedValues[337u]), nonlinearValue12, nonlinearValue13 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[153u].y * fragmentScalarConstants1.packedValues[615u]) * fragmentScalarConstants1.packedValues[338u]))) * ((productValue417 * fragmentVectorConstants1.packedValues[175u].y) * 0.079577468335628509521484375));
                    float multiplyAddValue399 = fma((fma(productValue418, fragmentVectorConstants1.packedValues[175u].z - fragmentVectorConstants1.packedValues[85u].z, fragmentVectorConstants1.packedValues[85u].z) * fragmentScalarConstants1.packedValues[336u]) * 0.079577468335628509521484375, multiplyAddValue394, fma(exponentialValue7 * ((fragmentVectorConstants1.packedValues[177u].z * fragmentScalarConstants1.packedValues[711u]) * fragmentScalarConstants1.packedValues[337u]), nonlinearValue12, nonlinearValue13 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[153u].z * fragmentScalarConstants1.packedValues[615u]) * fragmentScalarConstants1.packedValues[338u]))) * ((productValue417 * fragmentVectorConstants1.packedValues[175u].z) * 0.079577468335628509521484375));
                    bool comparisonValue248 = fragmentScalarConstants1.packedValues[351u] != 0.0;
                    float scalarValue322 = spvNMax(fragmentScalarConstants1.packedValues[361u], fragmentScalarConstants1.packedValues[509u]);
                    multiplyAddValue79 = comparisonValue248 ? fma(scalarValue322, multiplyAddValue397 - fragmentVectorConstants1.packedValues[179u].x, fragmentVectorConstants1.packedValues[179u].x) : multiplyAddValue397;
                    multiplyAddValue80 = comparisonValue248 ? fma(scalarValue322, multiplyAddValue398 - fragmentVectorConstants1.packedValues[179u].y, fragmentVectorConstants1.packedValues[179u].y) : multiplyAddValue398;
                    multiplyAddValue81 = comparisonValue248 ? fma(scalarValue322, multiplyAddValue399 - fragmentVectorConstants1.packedValues[179u].z, fragmentVectorConstants1.packedValues[179u].z) : multiplyAddValue399;
                }
                intermediateValue72 = multiplyAddValue79;
                intermediateValue70 = multiplyAddValue80;
                intermediateValue68 = multiplyAddValue81;
            }
            else
            {
                intermediateValue72 = 0.0;
                intermediateValue70 = 0.0;
                intermediateValue68 = 0.0;
            }
            intermediateValue66 = quotientValue68;
            intermediateValue67 = intermediateValue68;
            intermediateValue69 = intermediateValue70;
            intermediateValue71 = intermediateValue72;
        }
        else
        {
            intermediateValue66 = 0.0;
            intermediateValue67 = 0.0;
            intermediateValue69 = 0.0;
            intermediateValue71 = 0.0;
        }
        float multiplyAddValue83;
        float multiplyAddValue84;
        float multiplyAddValue85;
        float multiplyAddValue86;
        if (comparisonValue246)
        {
            float productValue309 = (multiplyAddValue71 + 1.0) * 0.5;
            float productValue310 = (multiplyAddValue72 + 1.0) * 0.5;
            float multiplyAddValue400 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue73, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue71, multiplyAddValue72 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue73, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue71, multiplyAddValue72 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[724u]) / (fragmentScalarConstants1.packedValues[725u] - fragmentScalarConstants1.packedValues[724u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[722u]), -0.5);
            uint sumValue290 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[722u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue400))), int(0u))))));
            float scalarValue323 = rdSignedBitsToFloat2(sumValue290);
            float sumValue291 = spvNClamp(multiplyAddValue400 - scalarValue323, 0.0, 1.0);
            vec4 sampledTextureValue72 = textureLod(sampler2DArray(materialTexture5, textureSampler5), vec3(productValue309, productValue310, scalarValue323), 0.0);
            float scalarValue324 = sampledTextureValue72.x;
            float scalarValue325 = sampledTextureValue72.y;
            float scalarValue326 = sampledTextureValue72.z;
            float scalarValue327 = sampledTextureValue72.w;
            float sumValue292 = rdSignedBitsToFloat2(sumValue290 + 1u);
            vec4 sampledTextureValue73 = textureLod(sampler2DArray(materialTexture5, textureSampler5), vec3(productValue309, productValue310, sumValue292), 0.0);
            multiplyAddValue83 = fma(sumValue291, sampledTextureValue73.z - scalarValue326, scalarValue326);
            multiplyAddValue84 = fma(sumValue291, sampledTextureValue73.y - scalarValue325, scalarValue325);
            multiplyAddValue85 = fma(sumValue291, sampledTextureValue73.x - scalarValue324, scalarValue324);
            multiplyAddValue86 = fma(sumValue291, sampledTextureValue73.w - scalarValue327, scalarValue327);
        }
        else
        {
            multiplyAddValue83 = 0.0;
            multiplyAddValue84 = 0.0;
            multiplyAddValue85 = 0.0;
            multiplyAddValue86 = 1.0;
        }
        float intermediateValue184;
        float intermediateValue185;
        float intermediateValue186;
        if (fragmentScalarConstants1.packedValues[608u] != 0.0)
        {
            float multiplyAddValue401 = spvNClamp(fma(fragmentScalarConstants1.packedValues[509u], 16.0, -fragmentScalarConstants1.packedValues[345u]) / spvNMax(fragmentScalarConstants1.packedValues[344u] - fragmentScalarConstants1.packedValues[345u], 1.0), 0.0, 1.0);
            float productValue419 = (multiplyAddValue401 * (multiplyAddValue401 * multiplyAddValue401)) * fragmentScalarConstants1.packedValues[608u];
            bool conditionValue37 = fragmentScalarConstants1.packedValues[680u] > 0.0;
            bool conditionValue38 = fragmentScalarConstants1.packedValues[667u] > 0.0;
            float multiplyAddValue402 = conditionValue38 ? (fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue267, fma(fragmentVectorConstants1.packedValues[4u].x, multiplyAddValue265, multiplyAddValue266 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue66;
            float multiplyAddValue403 = conditionValue38 ? (fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue267, fma(fragmentVectorConstants1.packedValues[4u].y, multiplyAddValue265, multiplyAddValue266 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue67;
            float multiplyAddValue404 = conditionValue38 ? (fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue267, fma(fragmentVectorConstants1.packedValues[4u].z, multiplyAddValue265, multiplyAddValue266 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue68;
            float comparisonValue249 = (conditionValue38 ? multiplyAddValue265 : varyingTexCoord3.x) - fragmentVectorConstants1.packedValues[11u].x;
            float comparisonValue250 = (conditionValue38 ? multiplyAddValue266 : varyingTexCoord3.y) - fragmentVectorConstants1.packedValues[11u].y;
            float comparisonValue251 = (conditionValue38 ? multiplyAddValue267 : varyingTexCoord3.z) - fragmentVectorConstants1.packedValues[11u].z;
            vec3 vectorValue31 = vec3(comparisonValue249, comparisonValue250, comparisonValue251);
            float scalarValue328 = rdDot3Precise(vectorValue31, vectorValue31);
            float inverseLengthValue35 = inversesqrt(scalarValue328);
            float productValue420 = inverseLengthValue35 * comparisonValue249;
            float productValue421 = inverseLengthValue35 * comparisonValue250;
            float productValue422 = inverseLengthValue35 * comparisonValue251;
            vec3 vectorValue32 = vec3(multiplyAddValue402, multiplyAddValue403, multiplyAddValue404);
            float scalarValue329 = rdDot3Precise(vectorValue32, vectorValue32);
            float inverseLengthValue36 = inversesqrt(scalarValue329);
            float scalarValue330 = rdDot3Precise(vec3(productValue420, productValue421, productValue422), vectorValue21);
            float sumValue293 = -(scalarValue330 + scalarValue330);
            float multiplyAddValue405 = fma(productValue236, sumValue293, productValue420);
            float multiplyAddValue406 = fma(productValue237, sumValue293, productValue421);
            float multiplyAddValue407 = fma(productValue238, sumValue293, productValue422);
            float sumValue294 = 1.0 - fragmentScalarConstants1.packedValues[522u];
            float productValue423 = sumValue294 * sumValue294;
            float sumValue295 = fragmentScalarConstants1.packedValues[609u] - 1.0;
            float productValue424 = productValue423 * productValue423;
            float multiplyAddValue408 = (uint(int(fragmentScalarConstants1.packedValues[524u])) == 1u) ? (fma(fragmentScalarConstants1.packedValues[522u] - 1.0, sumValue294, 1.0) * sumValue295) : (fma(-productValue424, productValue424, 1.0) * sumValue295);
            uint sumValue296 = uint(int(fragmentScalarConstants1.packedValues[328u])) + 2u;
            uint scalarValue331 = uint(abs(int(sumValue296))) % 3u;
            vec4 sampledTextureValue74 = textureLod(samplerCubeArray(materialTexture7, textureSampler7), vec4(multiplyAddValue405, multiplyAddValue406, multiplyAddValue407, trunc(fragmentScalarConstants1.packedValues[328u])), multiplyAddValue408);
            float comparisonValue252 = rdSignedBitsToFloat2(((sumValue296 & 2147483648u) != 0u) ? (-scalarValue331) : scalarValue331);
            vec4 sampledTextureValue75 = textureLod(samplerCubeArray(materialTexture7, textureSampler7), vec4(multiplyAddValue405, multiplyAddValue406, multiplyAddValue407, comparisonValue252), multiplyAddValue408);
            float scalarValue332 = sampledTextureValue75.x;
            float scalarValue333 = sampledTextureValue75.y;
            float scalarValue334 = sampledTextureValue75.z;
            float multiplyAddValue409 = fma(fragmentScalarConstants1.packedValues[611u], sampledTextureValue74.x - scalarValue332, scalarValue332);
            float multiplyAddValue410 = fma(fragmentScalarConstants1.packedValues[611u], sampledTextureValue74.y - scalarValue333, scalarValue333);
            float multiplyAddValue411 = fma(fragmentScalarConstants1.packedValues[611u], sampledTextureValue74.z - scalarValue334, scalarValue334);
            float comparisonValue253 = (productValue419 * (conditionValue37 ? (multiplyAddValue409 * 301.72412109375) : multiplyAddValue409)) * fragmentScalarConstants1.packedValues[610u];
            float comparisonValue254 = (productValue419 * (conditionValue37 ? (multiplyAddValue410 * 301.72412109375) : multiplyAddValue410)) * fragmentScalarConstants1.packedValues[610u];
            float comparisonValue255 = (productValue419 * (conditionValue37 ? (multiplyAddValue411 * 301.72412109375) : multiplyAddValue411)) * fragmentScalarConstants1.packedValues[610u];
            float productValue425 = fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].x;
            float productValue426 = fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].y;
            float productValue427 = fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].z;
            float productValue428 = comparisonValue178 * fragmentScalarConstants1.packedValues[299u];
            float productValue429 = multiplyAddValue271 * fragmentScalarConstants1.packedValues[299u];
            float productValue430 = multiplyAddValue272 * fragmentScalarConstants1.packedValues[299u];
            float productValue431 = rdDot3Precise(vec3(productValue428 * fragmentScalarConstants1.packedValues[356u], productValue429 * fragmentScalarConstants1.packedValues[356u], productValue430 * fragmentScalarConstants1.packedValues[356u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue335 = spvNClamp(productValue431, 0.0, 1.0);
            float multiplyAddValue412 = fma(scalarValue335, fma(fragmentScalarConstants1.packedValues[356u], productValue428, -productValue425), productValue425) * fragmentScalarConstants1.packedValues[520u];
            float multiplyAddValue413 = fma(scalarValue335, fma(fragmentScalarConstants1.packedValues[356u], productValue429, -productValue426), productValue426) * fragmentScalarConstants1.packedValues[520u];
            float multiplyAddValue414 = fma(scalarValue335, fma(fragmentScalarConstants1.packedValues[356u], productValue430, -productValue427), productValue427) * fragmentScalarConstants1.packedValues[520u];
            float scalarValue336 = rdDot3Precise(vec3(comparisonValue253, comparisonValue254, comparisonValue255), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float scalarValue337 = rdDot3Precise(vec3(multiplyAddValue412, multiplyAddValue413, multiplyAddValue414), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            bool bitwiseValue205 = comparisonValue244 && (scalarValue336 < scalarValue337);
            float productValue432 = rdDot3Precise(vectorValue7, vec3(-(inverseLengthValue36 * multiplyAddValue402), -(inverseLengthValue36 * multiplyAddValue403), -(inverseLengthValue36 * multiplyAddValue404)));
            vec4 sampledTextureValue76 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(productValue432, 0.0, 1.0), sumValue294));
            float scalarValue338 = sampledTextureValue76.x;
            float scalarValue339 = sampledTextureValue76.y;
            float multiplyAddValue415 = (bitwiseValue205 ? multiplyAddValue412 : comparisonValue253) * fma(multiplyAddValue268, scalarValue338, scalarValue339);
            float multiplyAddValue416 = (bitwiseValue205 ? multiplyAddValue413 : comparisonValue254) * fma(multiplyAddValue269, scalarValue338, scalarValue339);
            float multiplyAddValue417 = (bitwiseValue205 ? multiplyAddValue414 : comparisonValue255) * fma(multiplyAddValue270, scalarValue338, scalarValue339);
            float quotientValue71 = ((nonlinearValue5 / fragmentScalarConstants1.packedValues[334u]) + fragmentScalarConstants1.packedValues[688u]) - fragmentScalarConstants1.packedValues[332u];
            float productValue433 = 1.0 - spvNClamp(quotientValue71 * fragmentScalarConstants1.packedValues[333u], 0.0, 1.0);
            float quotientValue72 = 1.0 - spvNClamp(quotientValue71 / (fragmentScalarConstants1.packedValues[333u] - fragmentScalarConstants1.packedValues[332u]), 0.0, 1.0);
            float comparisonValue256 = comparisonValue245 ? (multiplyAddValue415 * productValue433) : (quotientValue72 * multiplyAddValue415);
            float comparisonValue257 = comparisonValue245 ? (multiplyAddValue416 * productValue433) : (quotientValue72 * multiplyAddValue416);
            float comparisonValue258 = comparisonValue245 ? (multiplyAddValue417 * productValue433) : (quotientValue72 * multiplyAddValue417);
            float productValue77;
            float productValue78;
            float productValue79;
            if (comparisonValue246)
            {
                float productValue323 = (multiplyAddValue71 + 1.0) * 0.5;
                float productValue324 = (multiplyAddValue72 + 1.0) * 0.5;
                float multiplyAddValue418 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue73, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue71, multiplyAddValue72 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue73, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue71, multiplyAddValue72 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[724u]) / (fragmentScalarConstants1.packedValues[725u] - fragmentScalarConstants1.packedValues[724u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[722u]), -0.5);
                uint sumValue297 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[722u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue418))), int(0u))))));
                float scalarValue340 = rdSignedBitsToFloat2(sumValue297);
                vec4 sampledTextureValue77 = textureLod(sampler2DArray(materialTexture5, textureSampler5), vec3(productValue323, productValue324, scalarValue340), 0.0);
                float scalarValue341 = sampledTextureValue77.w;
                float sumValue298 = rdSignedBitsToFloat2(sumValue297 + 1u);
                float sampledTextureValue78 = fma(spvNClamp(multiplyAddValue418 - scalarValue340, 0.0, 1.0), textureLod(sampler2DArray(materialTexture5, textureSampler5), vec3(productValue323, productValue324, sumValue298), 0.0).w - scalarValue341, scalarValue341);
                productValue77 = comparisonValue256 * sampledTextureValue78;
                productValue78 = comparisonValue257 * sampledTextureValue78;
                productValue79 = comparisonValue258 * sampledTextureValue78;
            }
            else
            {
                productValue77 = comparisonValue256;
                productValue78 = comparisonValue257;
                productValue79 = comparisonValue258;
            }
            intermediateValue184 = productValue79;
            intermediateValue185 = productValue78;
            intermediateValue186 = productValue77;
        }
        else
        {
            float multiplyAddValue135;
            float multiplyAddValue136;
            float multiplyAddValue137;
            if (comparisonValue244)
            {
                bool conditionValue39 = fragmentScalarConstants1.packedValues[667u] > 0.0;
                float multiplyAddValue419 = conditionValue39 ? (fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue267, fma(fragmentVectorConstants1.packedValues[4u].x, multiplyAddValue265, multiplyAddValue266 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue66;
                float multiplyAddValue420 = conditionValue39 ? (fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue267, fma(fragmentVectorConstants1.packedValues[4u].y, multiplyAddValue265, multiplyAddValue266 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue67;
                float multiplyAddValue421 = conditionValue39 ? (fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue267, fma(fragmentVectorConstants1.packedValues[4u].z, multiplyAddValue265, multiplyAddValue266 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue68;
                vec3 vectorValue33 = vec3(multiplyAddValue419, multiplyAddValue420, multiplyAddValue421);
                float scalarValue342 = rdDot3Precise(vectorValue33, vectorValue33);
                float inverseLengthValue37 = inversesqrt(scalarValue342);
                float productValue434 = fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].x;
                float productValue435 = fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].y;
                float productValue436 = fragmentScalarConstants1.packedValues[327u] * fragmentVectorConstants1.packedValues[81u].z;
                float productValue437 = comparisonValue178 * fragmentScalarConstants1.packedValues[299u];
                float productValue438 = multiplyAddValue271 * fragmentScalarConstants1.packedValues[299u];
                float productValue439 = multiplyAddValue272 * fragmentScalarConstants1.packedValues[299u];
                float productValue440 = rdDot3Precise(vec3(productValue437 * fragmentScalarConstants1.packedValues[356u], productValue438 * fragmentScalarConstants1.packedValues[356u], productValue439 * fragmentScalarConstants1.packedValues[356u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                float scalarValue343 = spvNClamp(productValue440, 0.0, 1.0);
                float multiplyAddValue422 = fma(scalarValue343, fma(fragmentScalarConstants1.packedValues[356u], productValue437, -productValue434), productValue434) * fragmentScalarConstants1.packedValues[520u];
                float multiplyAddValue423 = fma(scalarValue343, fma(fragmentScalarConstants1.packedValues[356u], productValue438, -productValue435), productValue435) * fragmentScalarConstants1.packedValues[520u];
                float multiplyAddValue424 = fma(scalarValue343, fma(fragmentScalarConstants1.packedValues[356u], productValue439, -productValue436), productValue436) * fragmentScalarConstants1.packedValues[520u];
                float scalarValue344 = rdDot3Precise(vec3(multiplyAddValue422, multiplyAddValue423, multiplyAddValue424), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                bool conditionValue40 = scalarValue344 > 0.0;
                float productValue441 = rdDot3Precise(vectorValue7, vec3(-(inverseLengthValue37 * multiplyAddValue419), -(inverseLengthValue37 * multiplyAddValue420), -(inverseLengthValue37 * multiplyAddValue421)));
                vec4 sampledTextureValue79 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(productValue441, 0.0, 1.0), 1.0 - fragmentScalarConstants1.packedValues[522u]));
                float scalarValue345 = sampledTextureValue79.x;
                float scalarValue346 = sampledTextureValue79.y;
                multiplyAddValue135 = conditionValue40 ? (fma(multiplyAddValue268, scalarValue345, scalarValue346) * multiplyAddValue422) : 0.0;
                multiplyAddValue136 = conditionValue40 ? (fma(multiplyAddValue269, scalarValue345, scalarValue346) * multiplyAddValue423) : 0.0;
                multiplyAddValue137 = conditionValue40 ? (fma(multiplyAddValue270, scalarValue345, scalarValue346) * multiplyAddValue424) : 0.0;
            }
            else
            {
                multiplyAddValue135 = 0.0;
                multiplyAddValue136 = 0.0;
                multiplyAddValue137 = 0.0;
            }
            intermediateValue184 = multiplyAddValue137;
            intermediateValue185 = multiplyAddValue136;
            intermediateValue186 = multiplyAddValue135;
        }
        multiplyAddValue35 = intermediateValue184 + fma(multiplyAddValue86, fma(intermediateValue66, intermediateValue67 - sumValue288, sumValue288), multiplyAddValue83);
        multiplyAddValue36 = intermediateValue185 + fma(multiplyAddValue86, fma(intermediateValue66, intermediateValue69 - sumValue287, sumValue287), multiplyAddValue84);
        multiplyAddValue37 = intermediateValue186 + fma(multiplyAddValue86, fma(intermediateValue66, intermediateValue71 - sumValue286, sumValue286), multiplyAddValue85);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue29 = ((productValue104 * (((intermediateValue30 - sumValue122) * intermediateValue29) + sumValue122)) + productValue101) + intermediateValue72;
        productValue30 = ((productValue104 * (((intermediateValue31 - sumValue123) * intermediateValue29) + sumValue123)) + productValue102) + intermediateValue73;
        productValue31 = ((productValue104 * (((intermediateValue32 - sumValue124) * intermediateValue29) + sumValue124)) + productValue103) + intermediateValue74;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            productValue42 = 0.0;
            productValue43 = 0.0;
            productValue44 = 0.0;
            productValue45 = 0.0;
            productValue46 = 0.0;
            productValue47 = 0.0;
            intermediateValue10 = 0.0;
            intermediateValue11 = 0.0;
            intermediateValue12 = 0.0;
            intermediateValue13 = 0.0;
            intermediateValue14 = 0.0;
            intermediateValue15 = 0.0;
        }
        float sumValue347 = ((productValue45 + productValue42) + intermediateValue10) + intermediateValue13;
        float sumValue348 = ((productValue46 + productValue43) + intermediateValue11) + intermediateValue14;
        float sumValue349 = ((productValue47 + productValue44) + intermediateValue12) + intermediateValue15;
        float sumValue125 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
        float sumValue126 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
        float sumValue128 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
        float inverseLengthValue9 = inversesqrt(dot(vec3(sumValue125, sumValue126, sumValue128), vec3(sumValue125, sumValue126, sumValue128)));
        float productValue130 = inverseLengthValue9 * sumValue125;
        float productValue144 = inverseLengthValue9 * sumValue126;
        float productValue145 = inverseLengthValue9 * sumValue128;
        bool comparisonValue291 = fragmentVectorConstants1.packedValues[87u].y != 0.0;
        bool comparisonValue292 = fragmentVectorConstants1.packedValues[142u].w != 0.0;
        float productValue57;
        float productValue58;
        float productValue59;
        if ((comparisonValue291 && (fragmentVectorConstants1.packedValues[87u].z != 0.0)) && comparisonValue292)
        {
            productValue57 = spvNMax(fragmentVectorConstants1.packedValues[74u].w + (fragmentVectorConstants1.packedValues[174u].x * fragmentVectorConstants1.packedValues[174u].w), fragmentVectorConstants1.packedValues[81u].x * fragmentVectorConstants1.packedValues[81u].w) * fragmentVectorConstants1.packedValues[87u].z;
            productValue58 = spvNMax(fragmentVectorConstants1.packedValues[74u].w + (fragmentVectorConstants1.packedValues[174u].y * fragmentVectorConstants1.packedValues[174u].w), fragmentVectorConstants1.packedValues[81u].y * fragmentVectorConstants1.packedValues[81u].w) * fragmentVectorConstants1.packedValues[87u].z;
            productValue59 = spvNMax(fragmentVectorConstants1.packedValues[74u].w + (fragmentVectorConstants1.packedValues[174u].z * fragmentVectorConstants1.packedValues[174u].w), fragmentVectorConstants1.packedValues[81u].z * fragmentVectorConstants1.packedValues[81u].w) * fragmentVectorConstants1.packedValues[87u].z;
        }
        else
        {
            productValue57 = 0.0;
            productValue58 = 0.0;
            productValue59 = 0.0;
        }
        bool comparisonValue293 = fragmentVectorConstants1.packedValues[182u].x != 0.0;
        bool comparisonValue294 = fragmentVectorConstants1.packedValues[87u].x != 0.0;
        float intermediateValue27;
        float intermediateValue28;
        float intermediateValue29;
        float intermediateValue30;
        if (comparisonValue294)
        {
            float quotientValue93 = spvNClamp(((fragmentVectorConstants1.packedValues[172u].x - fragmentVectorConstants1.packedValues[83u].x) + (nonlinearValue / fragmentVectorConstants1.packedValues[83u].z)) * fragmentVectorConstants1.packedValues[83u].y, 0.0, 1.0);
            float branchMergedValue14;
            float branchMergedValue26;
            float branchMergedValue27;
            float branchMergedValue28;
            if (quotientValue93 > 0.0)
            {
                float branchMergedValue64;
                float branchMergedValue66;
                float branchMergedValue67;
                float branchMergedValue68;
                if (comparisonValue291)
                {
                    branchMergedValue64 = spvNMax(productValue59, 1.0) * fragmentVectorConstants1.packedValues[88u].z;
                    branchMergedValue66 = spvNMax(productValue58, 1.0) * fragmentVectorConstants1.packedValues[88u].y;
                    branchMergedValue67 = fragmentVectorConstants1.packedValues[88u].x * spvNMax(productValue57, 1.0);
                    branchMergedValue68 = quotientValue93;
                }
                else
                {
                    float quotientValue94 = spvNClamp(((productValue144 - fragmentVectorConstants1.packedValues[151u].x) + fragmentVectorConstants1.packedValues[151u].w) / (fragmentVectorConstants1.packedValues[151u].z - fragmentVectorConstants1.packedValues[151u].x), 0.0, 1.0);
                    float productValue546 = 1.0 - ((quotientValue94 * quotientValue94) * (3.0 - (quotientValue94 * 2.0)));
                    float productValue547 = (productValue546 * productValue546) * productValue546;
                    float dotProductValue35 = dot(vec3(productValue130, productValue144, productValue145), vec3(fragmentVectorConstants1.packedValues[168u].xyz));
                    float dotProductValue36 = dot(vec3(productValue130, productValue144, productValue145), vec3(fragmentVectorConstants1.packedValues[93u].xyz));
                    float sumValue350 = fragmentVectorConstants1.packedValues[151u].x - fragmentVectorConstants1.packedValues[151u].w;
                    float quotientValue95 = spvNClamp((productValue144 - sumValue350) / (fragmentVectorConstants1.packedValues[151u].y - sumValue350), 0.0, 1.0);
                    float productValue548 = 1.0 - ((quotientValue95 * quotientValue95) * (3.0 - (quotientValue95 * 2.0)));
                    float productValue549 = (productValue548 * productValue548) * productValue548;
                    float productValue550 = (fragmentVectorConstants1.packedValues[84u].x * 0.75) * ((((dotProductValue36 * dotProductValue36) + 1.0) * fragmentVectorConstants1.packedValues[153u].w) + (((dotProductValue35 * dotProductValue35) + 1.0) * fragmentVectorConstants1.packedValues[177u].w));
                    float exponentialValue9 = spvNClamp(exp2(log2(spvNMax(dotProductValue35, 0.0)) * fragmentVectorConstants1.packedValues[84u].w), 0.0, 1.0);
                    float exponentialValue10 = spvNClamp(exp2(log2(spvNMax(dotProductValue36, 0.0)) * fragmentVectorConstants1.packedValues[84u].w), 0.0, 1.0);
                    float productValue551 = 1.809999942779541015625 - (exponentialValue9 * 1.7999999523162841796875);
                    float nonlinearValue17 = 0.036100022494792938232421875 / (sqrt(productValue551) * productValue551);
                    float productValue552 = 1.809999942779541015625 - (exponentialValue10 * 1.7999999523162841796875);
                    float nonlinearValue18 = 0.036100022494792938232421875 / (sqrt(productValue552) * productValue552);
                    float productValue553 = exponentialValue9 * (fragmentVectorConstants1.packedValues[84u].y * fragmentVectorConstants1.packedValues[177u].w);
                    float productValue554 = exponentialValue10 * (fragmentVectorConstants1.packedValues[84u].z * fragmentVectorConstants1.packedValues[153u].w);
                    float productValue555 = (((productValue547 * fragmentVectorConstants1.packedValues[175u].x) * (((productValue554 * fragmentVectorConstants1.packedValues[153u].x) * nonlinearValue18) + ((productValue553 * fragmentVectorConstants1.packedValues[177u].x) * nonlinearValue17))) + (((productValue549 * (fragmentVectorConstants1.packedValues[175u].x - fragmentVectorConstants1.packedValues[85u].x)) + fragmentVectorConstants1.packedValues[85u].x) * productValue550)) * 0.079577468335628509521484375;
                    float productValue556 = (((productValue547 * fragmentVectorConstants1.packedValues[175u].y) * (((productValue554 * fragmentVectorConstants1.packedValues[153u].y) * nonlinearValue18) + ((productValue553 * fragmentVectorConstants1.packedValues[177u].y) * nonlinearValue17))) + (((productValue549 * (fragmentVectorConstants1.packedValues[175u].y - fragmentVectorConstants1.packedValues[85u].y)) + fragmentVectorConstants1.packedValues[85u].y) * productValue550)) * 0.079577468335628509521484375;
                    float productValue557 = (((productValue547 * fragmentVectorConstants1.packedValues[175u].z) * (((productValue554 * fragmentVectorConstants1.packedValues[153u].z) * nonlinearValue18) + ((productValue553 * fragmentVectorConstants1.packedValues[177u].z) * nonlinearValue17))) + (((productValue549 * (fragmentVectorConstants1.packedValues[175u].z - fragmentVectorConstants1.packedValues[85u].z)) + fragmentVectorConstants1.packedValues[85u].z) * productValue550)) * 0.079577468335628509521484375;
                    float branchMergedValue80;
                    float branchMergedValue81;
                    float branchMergedValue82;
                    float branchMergedValue83;
                    if (fragmentVectorConstants1.packedValues[87u].w != 0.0)
                    {
                        float scalarValue390 = spvNMax(fragmentVectorConstants1.packedValues[90u].y, fragmentVectorConstants1.packedValues[127u].y);
                        branchMergedValue80 = ((productValue557 - fragmentVectorConstants1.packedValues[179u].z) * scalarValue390) + fragmentVectorConstants1.packedValues[179u].z;
                        branchMergedValue81 = ((productValue556 - fragmentVectorConstants1.packedValues[179u].y) * scalarValue390) + fragmentVectorConstants1.packedValues[179u].y;
                        branchMergedValue82 = ((productValue555 - fragmentVectorConstants1.packedValues[179u].x) * scalarValue390) + fragmentVectorConstants1.packedValues[179u].x;
                        branchMergedValue83 = quotientValue93;
                    }
                    else
                    {
                        branchMergedValue80 = productValue557;
                        branchMergedValue81 = productValue556;
                        branchMergedValue82 = productValue555;
                        branchMergedValue83 = quotientValue93;
                    }
                    branchMergedValue64 = branchMergedValue80;
                    branchMergedValue66 = branchMergedValue81;
                    branchMergedValue67 = branchMergedValue82;
                    branchMergedValue68 = branchMergedValue83;
                }
                branchMergedValue14 = branchMergedValue64;
                branchMergedValue26 = branchMergedValue66;
                branchMergedValue27 = branchMergedValue67;
                branchMergedValue28 = branchMergedValue68;
            }
            else
            {
                branchMergedValue14 = 0.0;
                branchMergedValue26 = 0.0;
                branchMergedValue27 = 0.0;
                branchMergedValue28 = quotientValue93;
            }
            intermediateValue27 = branchMergedValue28;
            intermediateValue28 = branchMergedValue27;
            intermediateValue29 = branchMergedValue26;
            intermediateValue30 = branchMergedValue14;
        }
        else
        {
            intermediateValue27 = 0.0;
            intermediateValue28 = 0.0;
            intermediateValue29 = 0.0;
            intermediateValue30 = 0.0;
        }
        float productValue109;
        float productValue110;
        float productValue111;
        float productValue112;
        if (comparisonValue293)
        {
            float productValue158 = (multiplyAddValue9 + 1.0) * 0.5;
            float productValue159 = (multiplyAddValue10 + 1.0) * 0.5;
            uint scalarValue391 = uint(int(fragmentVectorConstants1.packedValues[180u].z));
            float multiplyAddValue449 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue11, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue10, multiplyAddValue9 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue11, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue10, multiplyAddValue9 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[181u].x) / (fragmentVectorConstants1.packedValues[181u].y - fragmentVectorConstants1.packedValues[181u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue391))) + (-0.5);
            uint sumValue351 = uint(min(int(uint(max(int(uint(int(multiplyAddValue449))), int(0u)))), int(scalarValue391 + 4294967294u)));
            float scalarValue392 = float(int(sumValue351));
            float sumValue352 = spvNMin(spvNMax(multiplyAddValue449 - scalarValue392, 0.0), 1.0);
            vec4 sampledTextureValue108 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue158, productValue159, scalarValue392), 0.0);
            float scalarValue393 = sampledTextureValue108.x;
            float scalarValue394 = sampledTextureValue108.y;
            float scalarValue395 = sampledTextureValue108.z;
            float scalarValue396 = sampledTextureValue108.w;
            vec4 sampledTextureValue109 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue158, productValue159, float(int(sumValue351 + 1u))), 0.0);
            productValue109 = ((sampledTextureValue109.x - scalarValue393) * sumValue352) + scalarValue393;
            productValue110 = ((sampledTextureValue109.y - scalarValue394) * sumValue352) + scalarValue394;
            productValue111 = ((sampledTextureValue109.z - scalarValue395) * sumValue352) + scalarValue395;
            productValue112 = ((sampledTextureValue109.w - scalarValue396) * sumValue352) + scalarValue396;
        }
        else
        {
            productValue109 = 0.0;
            productValue110 = 0.0;
            productValue111 = 0.0;
            productValue112 = 1.0;
        }
        float intermediateValue88;
        float intermediateValue89;
        float intermediateValue90;
        if (fragmentVectorConstants1.packedValues[152u].x != 0.0)
        {
            bool conditionValue44 = fragmentVectorConstants1.packedValues[170u].x > 0.0;
            float intermediateValue81;
            float intermediateValue82;
            float intermediateValue83;
            float multiplyAddValue32;
            float multiplyAddValue33;
            float multiplyAddValue34;
            if (fragmentVectorConstants1.packedValues[166u].w > 0.0)
            {
                intermediateValue81 = productValue449;
                intermediateValue82 = productValue450;
                intermediateValue83 = productValue451;
                multiplyAddValue32 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue451, fma(fragmentVectorConstants1.packedValues[5u].x, productValue450, productValue449 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x;
                multiplyAddValue33 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue451, fma(fragmentVectorConstants1.packedValues[5u].y, productValue450, productValue449 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y;
                multiplyAddValue34 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue451, fma(fragmentVectorConstants1.packedValues[5u].z, productValue450, productValue449 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z;
            }
            else
            {
                intermediateValue81 = varyingTexCoord3.x;
                intermediateValue82 = varyingTexCoord3.y;
                intermediateValue83 = varyingTexCoord3.z;
                multiplyAddValue32 = multiplyAddValue4;
                multiplyAddValue33 = multiplyAddValue5;
                multiplyAddValue34 = multiplyAddValue6;
            }
            float sumValue353 = intermediateValue81 - fragmentVectorConstants1.packedValues[11u].x;
            float sumValue354 = intermediateValue82 - fragmentVectorConstants1.packedValues[11u].y;
            float sumValue355 = intermediateValue83 - fragmentVectorConstants1.packedValues[11u].z;
            float inverseLengthValue44 = inversesqrt(dot(vec3(sumValue353, sumValue354, sumValue355), vec3(sumValue353, sumValue354, sumValue355)));
            float productValue558 = inverseLengthValue44 * sumValue353;
            float productValue559 = inverseLengthValue44 * sumValue354;
            float productValue560 = inverseLengthValue44 * sumValue355;
            float inverseLengthValue11 = inversesqrt(dot(vec3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34), vec3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34)));
            float dotProductValue37 = dot(vec3(productValue558, productValue559, productValue560), vec3(productValue3, productValue4, productValue5)) * 2.0;
            float productValue561 = productValue558 - (dotProductValue37 * productValue3);
            float productValue562 = productValue559 - (dotProductValue37 * productValue4);
            float productValue563 = productValue560 - (dotProductValue37 * productValue5);
            float sumValue356 = 1.0 - fragmentVectorConstants1.packedValues[130u].z;
            float productValue564 = sumValue356 * sumValue356;
            float productValue565 = productValue564 * productValue564;
            precise float comparisonValue295 = 1.0 - ((uint(int(fragmentVectorConstants1.packedValues[131u].x)) == 1u) ? productValue564 : (productValue565 * productValue565));
            precise float productValue566 = (fragmentVectorConstants1.packedValues[152u].y + (-1.0)) * comparisonValue295;
            uint scalarValue397 = uint(int(fragmentVectorConstants1.packedValues[82u].x));
            vec4 sampledTextureValue110 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue561, productValue562, productValue563, float(int(scalarValue397))), productValue566);
            vec4 sampledTextureValue111 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue561, productValue562, productValue563, float(int(uint(int(scalarValue397 + 2u) - int(3u) * (int(scalarValue397 + 2u) / int(3u)))))), productValue566);
            float scalarValue398 = sampledTextureValue111.x;
            float scalarValue399 = sampledTextureValue111.y;
            float scalarValue400 = sampledTextureValue111.z;
            float productValue567 = ((sampledTextureValue110.x - scalarValue398) * fragmentVectorConstants1.packedValues[152u].w) + scalarValue398;
            float productValue568 = ((sampledTextureValue110.y - scalarValue399) * fragmentVectorConstants1.packedValues[152u].w) + scalarValue399;
            float productValue569 = ((sampledTextureValue110.z - scalarValue400) * fragmentVectorConstants1.packedValues[152u].w) + scalarValue400;
            float productValue570 = (((quotientValue80 * quotientValue80) * quotientValue80) * fragmentVectorConstants1.packedValues[152u].x) * fragmentVectorConstants1.packedValues[152u].z;
            float comparisonValue296 = (conditionValue44 ? (productValue567 * 301.72412109375) : productValue567) * productValue570;
            float comparisonValue297 = (conditionValue44 ? (productValue568 * 301.72412109375) : productValue568) * productValue570;
            float comparisonValue298 = (conditionValue44 ? (productValue569 * 301.72412109375) : productValue569) * productValue570;
            float comparisonValue18;
            float comparisonValue19;
            float comparisonValue20;
            if (comparisonValue292)
            {
                float productValue571 = fragmentVectorConstants1.packedValues[81u].x * fragmentVectorConstants1.packedValues[81u].w;
                float productValue572 = fragmentVectorConstants1.packedValues[81u].y * fragmentVectorConstants1.packedValues[81u].w;
                float productValue573 = fragmentVectorConstants1.packedValues[81u].z * fragmentVectorConstants1.packedValues[81u].w;
                float productValue574 = fragmentVectorConstants1.packedValues[74u].w * fragmentVectorConstants1.packedValues[89u].x;
                float productValue575 = productValue574 * intermediateValue8;
                float productValue576 = productValue574 * productValue36;
                float productValue577 = productValue574 * productValue37;
                float dotProductValue38 = spvNClamp(dot(vec3(productValue575, productValue576, productValue577), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
                float productValue578 = ((dotProductValue38 * (productValue575 - productValue571)) + productValue571) * fragmentVectorConstants1.packedValues[130u].x;
                float productValue579 = ((dotProductValue38 * (productValue576 - productValue572)) + productValue572) * fragmentVectorConstants1.packedValues[130u].x;
                float productValue580 = ((dotProductValue38 * (productValue577 - productValue573)) + productValue573) * fragmentVectorConstants1.packedValues[130u].x;
                float intermediateValue133;
                float intermediateValue134;
                float intermediateValue135;
                bool intermediateValue136;
                if (!(dot(vec3(comparisonValue296, comparisonValue297, comparisonValue298), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= dot(vec3(productValue578, productValue579, productValue580), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))))
                {
                    intermediateValue133 = productValue578;
                    intermediateValue134 = productValue579;
                    intermediateValue135 = productValue580;
                    intermediateValue136 = true;
                }
                else
                {
                    intermediateValue133 = 0.0;
                    intermediateValue134 = 0.0;
                    intermediateValue135 = 0.0;
                    intermediateValue136 = false;
                }
                comparisonValue18 = intermediateValue136 ? intermediateValue133 : comparisonValue296;
                comparisonValue19 = intermediateValue136 ? intermediateValue134 : comparisonValue297;
                comparisonValue20 = intermediateValue136 ? intermediateValue135 : comparisonValue298;
            }
            else
            {
                comparisonValue18 = comparisonValue296;
                comparisonValue19 = comparisonValue297;
                comparisonValue20 = comparisonValue298;
            }
            vec4 sampledTextureValue112 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3((-0.0) - (multiplyAddValue32 * inverseLengthValue11), (-0.0) - (multiplyAddValue33 * inverseLengthValue11), (-0.0) - (multiplyAddValue34 * inverseLengthValue11))), 0.0, 1.0), sumValue356));
            float scalarValue401 = sampledTextureValue112.x;
            float scalarValue402 = sampledTextureValue112.y;
            float quotientValue96 = (fragmentVectorConstants1.packedValues[172u].x - fragmentVectorConstants1.packedValues[83u].x) + (nonlinearValue / fragmentVectorConstants1.packedValues[83u].z);
            float comparisonValue299 = 1.0 - spvNClamp(comparisonValue294 ? (quotientValue96 * fragmentVectorConstants1.packedValues[83u].y) : (quotientValue96 / (fragmentVectorConstants1.packedValues[83u].y - fragmentVectorConstants1.packedValues[83u].x)), 0.0, 1.0);
            float productValue581 = (((scalarValue401 * productValue453) + scalarValue402) * comparisonValue18) * comparisonValue299;
            float productValue582 = (((scalarValue401 * productValue454) + scalarValue402) * comparisonValue19) * comparisonValue299;
            float productValue583 = (((scalarValue401 * productValue455) + scalarValue402) * comparisonValue20) * comparisonValue299;
            float branchMergedValue20;
            float branchMergedValue33;
            float branchMergedValue34;
            if (comparisonValue293)
            {
                float productValue212 = (multiplyAddValue9 + 1.0) * 0.5;
                float productValue213 = (multiplyAddValue10 + 1.0) * 0.5;
                uint scalarValue403 = uint(int(fragmentVectorConstants1.packedValues[180u].z));
                float multiplyAddValue450 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue11, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue10, multiplyAddValue9 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue11, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue10, multiplyAddValue9 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[181u].x) / (fragmentVectorConstants1.packedValues[181u].y - fragmentVectorConstants1.packedValues[181u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue403))) + (-0.5);
                uint sumValue357 = uint(min(int(uint(max(int(uint(int(multiplyAddValue450))), int(0u)))), int(scalarValue403 + 4294967294u)));
                float scalarValue404 = float(int(sumValue357));
                vec4 sampledTextureValue113 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue212, productValue213, scalarValue404), 0.0);
                float scalarValue405 = sampledTextureValue113.w;
                float sampledTextureValue114 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue212, productValue213, float(int(sumValue357 + 1u))), 0.0).w - scalarValue405) * spvNMin(spvNMax(multiplyAddValue450 - scalarValue404, 0.0), 1.0)) + scalarValue405;
                branchMergedValue20 = sampledTextureValue114 * productValue583;
                branchMergedValue33 = sampledTextureValue114 * productValue582;
                branchMergedValue34 = sampledTextureValue114 * productValue581;
            }
            else
            {
                branchMergedValue20 = productValue583;
                branchMergedValue33 = productValue582;
                branchMergedValue34 = productValue581;
            }
            intermediateValue88 = branchMergedValue34;
            intermediateValue89 = branchMergedValue33;
            intermediateValue90 = branchMergedValue20;
        }
        else
        {
            float branchMergedValue19;
            float branchMergedValue31;
            float branchMergedValue32;
            if (comparisonValue292)
            {
                float multiplyAddValue38;
                float multiplyAddValue39;
                float multiplyAddValue40;
                if (fragmentVectorConstants1.packedValues[166u].w > 0.0)
                {
                    multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue451, fma(fragmentVectorConstants1.packedValues[5u].x, productValue450, productValue449 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x;
                    multiplyAddValue39 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue451, fma(fragmentVectorConstants1.packedValues[5u].y, productValue450, productValue449 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y;
                    multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue451, fma(fragmentVectorConstants1.packedValues[5u].z, productValue450, productValue449 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z;
                }
                else
                {
                    multiplyAddValue38 = multiplyAddValue4;
                    multiplyAddValue39 = multiplyAddValue5;
                    multiplyAddValue40 = multiplyAddValue6;
                }
                float inverseLengthValue12 = inversesqrt(dot(vec3(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40), vec3(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40)));
                float productValue584 = fragmentVectorConstants1.packedValues[81u].x * fragmentVectorConstants1.packedValues[81u].w;
                float productValue585 = fragmentVectorConstants1.packedValues[81u].y * fragmentVectorConstants1.packedValues[81u].w;
                float productValue586 = fragmentVectorConstants1.packedValues[81u].z * fragmentVectorConstants1.packedValues[81u].w;
                float productValue587 = fragmentVectorConstants1.packedValues[74u].w * fragmentVectorConstants1.packedValues[89u].x;
                float productValue588 = productValue587 * intermediateValue8;
                float productValue589 = productValue587 * productValue36;
                float productValue590 = productValue587 * productValue37;
                float dotProductValue39 = spvNClamp(dot(vec3(productValue588, productValue589, productValue590), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
                float productValue591 = ((dotProductValue39 * (productValue588 - productValue584)) + productValue584) * fragmentVectorConstants1.packedValues[130u].x;
                float productValue592 = ((dotProductValue39 * (productValue589 - productValue585)) + productValue585) * fragmentVectorConstants1.packedValues[130u].x;
                float productValue593 = ((dotProductValue39 * (productValue590 - productValue586)) + productValue586) * fragmentVectorConstants1.packedValues[130u].x;
                bool dotProductValue40 = dot(vec3(productValue591, productValue592, productValue593), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) <= 0.0;
                vec4 sampledTextureValue115 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3((-0.0) - (multiplyAddValue38 * inverseLengthValue12), (-0.0) - (multiplyAddValue39 * inverseLengthValue12), (-0.0) - (multiplyAddValue40 * inverseLengthValue12))), 0.0, 1.0), 1.0 - fragmentVectorConstants1.packedValues[130u].z));
                float scalarValue406 = sampledTextureValue115.x;
                float scalarValue407 = sampledTextureValue115.y;
                branchMergedValue19 = ((scalarValue406 * productValue455) + scalarValue407) * (dotProductValue40 ? 0.0 : productValue593);
                branchMergedValue31 = ((scalarValue406 * productValue454) + scalarValue407) * (dotProductValue40 ? 0.0 : productValue592);
                branchMergedValue32 = ((scalarValue406 * productValue453) + scalarValue407) * (dotProductValue40 ? 0.0 : productValue591);
            }
            else
            {
                branchMergedValue19 = 0.0;
                branchMergedValue31 = 0.0;
                branchMergedValue32 = 0.0;
            }
            intermediateValue88 = branchMergedValue32;
            intermediateValue89 = branchMergedValue31;
            intermediateValue90 = branchMergedValue19;
        }
        productValue29 = ((productValue112 * (((intermediateValue28 - sumValue347) * intermediateValue27) + sumValue347)) + productValue109) + intermediateValue88;
        productValue30 = ((productValue112 * (((intermediateValue29 - sumValue348) * intermediateValue27) + sumValue348)) + productValue110) + intermediateValue89;
        productValue31 = ((productValue112 * (((intermediateValue30 - sumValue349) * intermediateValue27) + sumValue349)) + productValue111) + intermediateValue90;
#endif
    }
    else
    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        multiplyAddValue35 = multiplyAddValue60;
        multiplyAddValue36 = multiplyAddValue59;
        multiplyAddValue37 = multiplyAddValue58;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        multiplyAddValue35 = multiplyAddValue255;
        multiplyAddValue36 = multiplyAddValue254;
        multiplyAddValue37 = multiplyAddValue253;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue29 = exponentialValue;
        productValue30 = exponentialValue1;
        productValue31 = exponentialValue2;
#endif
    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue66 = (0.180000007152557373046875 / texture(sampler2D(materialTexture3, textureSampler3), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
    float quotientValue51 = fragmentScalarConstants1.packedValues[301u] / sampledTextureValue66;
    float multiplyAddValue250 = fma(multiplyAddValue37, quotientValue51, multiplyAddValue37);
    float multiplyAddValue251 = fma(multiplyAddValue36, quotientValue51, multiplyAddValue36);
    float multiplyAddValue252 = fma(multiplyAddValue35, quotientValue51, multiplyAddValue35);
    bool conditionValue18 = fragmentScalarConstants1.packedValues[612u] > 0.0;
    fragmentColor0.x = conditionValue18 ? (sampledTextureValue66 * multiplyAddValue250) : multiplyAddValue250;
    fragmentColor0.y = conditionValue18 ? (sampledTextureValue66 * multiplyAddValue251) : multiplyAddValue251;
    fragmentColor0.z = conditionValue18 ? (sampledTextureValue66 * multiplyAddValue252) : multiplyAddValue252;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue66 = (0.180000007152557373046875 / texture(sampler2D(materialTexture3, textureSampler3), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
    float quotientValue73 = fragmentScalarConstants1.packedValues[305u] / sampledTextureValue66;
    float multiplyAddValue425 = fma(multiplyAddValue37, quotientValue73, multiplyAddValue37);
    float multiplyAddValue426 = fma(multiplyAddValue36, quotientValue73, multiplyAddValue36);
    float multiplyAddValue427 = fma(multiplyAddValue35, quotientValue73, multiplyAddValue35);
    bool conditionValue41 = fragmentScalarConstants1.packedValues[680u] > 0.0;
    fragmentColor0.x = conditionValue41 ? (sampledTextureValue66 * multiplyAddValue425) : multiplyAddValue425;
    fragmentColor0.y = conditionValue41 ? (sampledTextureValue66 * multiplyAddValue426) : multiplyAddValue426;
    fragmentColor0.z = conditionValue41 ? (sampledTextureValue66 * multiplyAddValue427) : multiplyAddValue427;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue52 = texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5));
    float quotientValue34 = (0.180000007152557373046875 / sampledTextureValue52.x) + 9.9999997473787516355514526367188e-05;
    float quotientValue35 = fragmentVectorConstants1.packedValues[75u].y / quotientValue34;
    float productValue226 = (quotientValue35 * productValue29) + productValue29;
    float productValue227 = (quotientValue35 * productValue30) + productValue30;
    float productValue228 = (quotientValue35 * productValue31) + productValue31;
    float productValue38;
    float productValue39;
    float productValue40;
    if (fragmentVectorConstants1.packedValues[153u].x > 0.0)
    {
        productValue38 = productValue226 * quotientValue34;
        productValue39 = productValue227 * quotientValue34;
        productValue40 = productValue228 * quotientValue34;
    }
    else
    {
        productValue38 = productValue226;
        productValue39 = productValue227;
        productValue40 = productValue228;
    }
    fragmentColor0.x = productValue38;
    fragmentColor0.y = productValue39;
    fragmentColor0.z = productValue40;
    fragmentColor0.w = (scalarValue * varyingColor0.w) * fragmentVectorConstants1.packedValues[138u].w;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue52 = texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5));
    float quotientValue34 = (0.180000007152557373046875 / sampledTextureValue52.x) + 9.9999997473787516355514526367188e-05;
    float quotientValue97 = fragmentVectorConstants1.packedValues[76u].y / quotientValue34;
    float productValue594 = (quotientValue97 * productValue29) + productValue29;
    float productValue595 = (quotientValue97 * productValue30) + productValue30;
    float productValue596 = (quotientValue97 * productValue31) + productValue31;
    float productValue38;
    float productValue39;
    float productValue40;
    if (fragmentVectorConstants1.packedValues[170u].x > 0.0)
    {
        productValue38 = productValue594 * quotientValue34;
        productValue39 = productValue595 * quotientValue34;
        productValue40 = productValue596 * quotientValue34;
    }
    else
    {
        productValue38 = productValue594;
        productValue39 = productValue595;
        productValue40 = productValue596;
    }
    fragmentColor0.x = productValue38;
    fragmentColor0.y = productValue39;
    fragmentColor0.z = productValue40;
    fragmentColor0.w = (scalarValue * varyingColor0.w) * fragmentVectorConstants1.packedValues[141u].w;
#endif
    discardIfRequested();
}
