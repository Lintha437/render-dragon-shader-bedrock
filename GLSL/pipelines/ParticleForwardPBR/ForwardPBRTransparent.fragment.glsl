#version 460
#extension GL_GOOGLE_include_directive : require
// ParticleForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
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
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/ParticleForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue44 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue67 = sampledTextureValue44.x;
    float scalarValue68 = sampledTextureValue44.y;
    float scalarValue69 = sampledTextureValue44.z;
    float multiplyAddValue47 = fma(varyingColor1.w, fma(-scalarValue67, varyingColor0.x, varyingColor1.x), scalarValue67 * varyingColor0.x);
    float multiplyAddValue48 = fma(varyingColor1.w, fma(-scalarValue68, varyingColor0.y, varyingColor1.y), scalarValue68 * varyingColor0.y);
    float multiplyAddValue49 = fma(varyingColor1.w, fma(-scalarValue69, varyingColor0.z, varyingColor1.z), scalarValue69 * varyingColor0.z);
    bool comparisonValue86 = fragmentScalarConstants1.packedValues[540u] != 0.0;
    float exponentialValue6 = comparisonValue86 ? exp2(log2(spvNMax(multiplyAddValue47, 0.0)) * 2.2000000476837158203125) : ((multiplyAddValue47 <= 0.040449999272823333740234375) ? (multiplyAddValue47 * 0.077399380505084991455078125) : exp2(log2((multiplyAddValue47 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue7 = comparisonValue86 ? exp2(log2(spvNMax(multiplyAddValue48, 0.0)) * 2.2000000476837158203125) : ((multiplyAddValue48 <= 0.040449999272823333740234375) ? (multiplyAddValue48 * 0.077399380505084991455078125) : exp2(log2((multiplyAddValue48 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue8 = comparisonValue86 ? exp2(log2(spvNMax(multiplyAddValue49, 0.0)) * 2.2000000476837158203125) : ((multiplyAddValue49 <= 0.040449999272823333740234375) ? (multiplyAddValue49 * 0.077399380505084991455078125) : exp2(log2((multiplyAddValue49 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    uint scalarValue70 = uint(int(fragmentScalarConstants1.packedValues[32u]));
    float intermediateValue33;
    float comparisonValue1;
    float intermediateValue34;
    float intermediateValue35;
    if ((scalarValue70 & 1u) == 1u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(particleTextureTexture, particleTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    float productValue3 = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    float productValue4 = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    float productValue5 = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[135u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue45 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue33 = sampledTextureValue45.x;
        comparisonValue1 = ((scalarValue70 & 2u) == 2u) ? sampledTextureValue45.w : fragmentScalarConstants1.packedValues[507u];
        intermediateValue34 = sampledTextureValue45.y;
        intermediateValue35 = sampledTextureValue45.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue = exp2(log2(spvNMax(productValue3, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(productValue4, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(productValue5, 0.0)) * 2.2000000476837158203125);
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue33 = fragmentVectorConstants1.packedValues[126u].x;
        comparisonValue1 = fragmentScalarConstants1.packedValues[507u];
        intermediateValue34 = fragmentVectorConstants1.packedValues[126u].y;
        intermediateValue35 = fragmentVectorConstants1.packedValues[126u].z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue = (productValue3 <= 0.040449999272823333740234375) ? (productValue3 * 0.077399380505084991455078125) : exp2(log2((productValue3 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (productValue4 <= 0.040449999272823333740234375) ? (productValue4 * 0.077399380505084991455078125) : exp2(log2((productValue4 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (productValue5 <= 0.040449999272823333740234375) ? (productValue5 * 0.077399380505084991455078125) : exp2(log2((productValue5 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue6;
    float multiplyAddValue7;
    float multiplyAddValue8;
    if ((scalarValue70 & 4u) == 4u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[8u].x));
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if ((scalarValue & 1u) == 0u)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue46 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        float multiplyAddValue50 = fma(sampledTextureValue46.x, 2.0, -1.0);
        float multiplyAddValue51 = fma(sampledTextureValue46.y, 2.0, -1.0);
        float multiplyAddValue53 = fma(sampledTextureValue46.z, 2.0, -1.0);
        multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[60u].z, multiplyAddValue53, fma(fragmentVectorConstants1.packedValues[58u].z, multiplyAddValue50, multiplyAddValue51 * fragmentVectorConstants1.packedValues[59u].z));
        multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[60u].y, multiplyAddValue53, fma(fragmentVectorConstants1.packedValues[58u].y, multiplyAddValue50, multiplyAddValue51 * fragmentVectorConstants1.packedValues[59u].y));
        multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[60u].x, multiplyAddValue53, fma(fragmentVectorConstants1.packedValues[58u].x, multiplyAddValue50, multiplyAddValue51 * fragmentVectorConstants1.packedValues[59u].x));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue4 = fragmentVectorConstants1.packedValues[126u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[126u].y;
        intermediateValue6 = fragmentVectorConstants1.packedValues[126u].z;
        intermediateValue7 = fragmentVectorConstants1.packedValues[126u].w;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue6 = varyingNormal0.z;
        multiplyAddValue7 = varyingNormal0.y;
        multiplyAddValue8 = varyingNormal0.x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue4 = sampledTextureValue1.x;
        intermediateValue5 = sampledTextureValue1.y;
        intermediateValue6 = sampledTextureValue1.z;
        intermediateValue7 = ((scalarValue & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[126u].w;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue57 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue58 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue57, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue56, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue54, multiplyAddValue55 * fragmentVectorConstants1.packedValues[1u].w)));
    float multiplyAddValue59 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue57, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue56, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue54, multiplyAddValue55 * fragmentVectorConstants1.packedValues[1u].x))) / multiplyAddValue58;
    float multiplyAddValue60 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue57, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue56, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue54, multiplyAddValue55 * fragmentVectorConstants1.packedValues[1u].y))) / multiplyAddValue58;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue57, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue56, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue54, multiplyAddValue55 * fragmentVectorConstants1.packedValues[1u].z))) / multiplyAddValue58;
    vec3 vectorValue = vec3(multiplyAddValue8, multiplyAddValue7, multiplyAddValue6);
    float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue187 = inverseLengthValue12 * multiplyAddValue8;
    float productValue188 = inverseLengthValue12 * multiplyAddValue7;
    float productValue189 = inverseLengthValue12 * multiplyAddValue6;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue189, fma(fragmentVectorConstants1.packedValues[4u].x, productValue187, productValue188 * fragmentVectorConstants1.packedValues[5u].x));
    float multiplyAddValue63 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue189, fma(fragmentVectorConstants1.packedValues[4u].y, productValue187, productValue188 * fragmentVectorConstants1.packedValues[5u].y));
    float multiplyAddValue64 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue189, fma(fragmentVectorConstants1.packedValues[4u].z, productValue187, productValue188 * fragmentVectorConstants1.packedValues[5u].z));
    bool conditionValue2 = fragmentScalarConstants1.packedValues[595u] > 0.0;
    bool bitwiseValue36 = (fragmentScalarConstants1.packedValues[593u] > 0.0) || conditionValue2;
    float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[128u].x;
    float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[128u].y;
    float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[128u].z;
    float scalarValue71 = dFdxCoarse(multiplyAddValue56);
    float scalarValue72 = dFdxCoarse(multiplyAddValue54);
    float scalarValue73 = dFdxCoarse(multiplyAddValue55);
    vec3 vectorValue1 = vec3(scalarValue71, scalarValue72, scalarValue73);
    float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    float productValue190 = inverseLengthValue13 * scalarValue71;
    float productValue191 = inverseLengthValue13 * scalarValue72;
    float productValue192 = inverseLengthValue13 * scalarValue73;
    float scalarValue74 = dFdyCoarse(-multiplyAddValue55);
    float scalarValue75 = dFdyCoarse(-multiplyAddValue56);
    float scalarValue76 = dFdyCoarse(-multiplyAddValue54);
    vec3 vectorValue2 = vec3(scalarValue74, scalarValue75, scalarValue76);
    float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    float productValue193 = inverseLengthValue14 * scalarValue74;
    float productValue194 = inverseLengthValue14 * scalarValue75;
    float productValue195 = inverseLengthValue14 * scalarValue76;
    float multiplyAddValue65 = fma(productValue192, productValue194, -(productValue190 * productValue193));
    float multiplyAddValue66 = fma(productValue190, productValue195, -(productValue191 * productValue194));
    float multiplyAddValue67 = fma(productValue191, productValue193, -(productValue192 * productValue195));
    vec3 vectorValue3 = vec3(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67);
    float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    float productValue196 = inverseLengthValue15 * multiplyAddValue65;
    float productValue197 = inverseLengthValue15 * multiplyAddValue66;
    float productValue198 = inverseLengthValue15 * multiplyAddValue67;
    float multiplyAddValue68 = fma(fragmentVectorConstants1.packedValues[11u].x, productValue198, fma(fragmentVectorConstants1.packedValues[9u].x, productValue196, productValue197 * fragmentVectorConstants1.packedValues[10u].x));
    float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[11u].y, productValue198, fma(fragmentVectorConstants1.packedValues[9u].y, productValue196, productValue197 * fragmentVectorConstants1.packedValues[10u].y));
    float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[11u].z, productValue198, fma(fragmentVectorConstants1.packedValues[9u].z, productValue196, productValue197 * fragmentVectorConstants1.packedValues[10u].z));
    vec3 vectorValue4 = vec3(multiplyAddValue68, multiplyAddValue69, multiplyAddValue70);
    float inverseLengthValue16 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
    float quotientValue25 = roundEven((inverseLengthValue16 * multiplyAddValue68) / fragmentScalarConstants1.packedValues[604u]) * fragmentScalarConstants1.packedValues[604u];
    float quotientValue26 = roundEven((inverseLengthValue16 * multiplyAddValue69) / fragmentScalarConstants1.packedValues[604u]) * fragmentScalarConstants1.packedValues[604u];
    float quotientValue27 = roundEven((inverseLengthValue16 * multiplyAddValue70) / fragmentScalarConstants1.packedValues[604u]) * fragmentScalarConstants1.packedValues[604u];
    vec3 vectorValue5 = vec3(quotientValue25, quotientValue26, quotientValue27);
    float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue199 = inverseLengthValue17 * quotientValue25;
    float productValue200 = inverseLengthValue17 * quotientValue26;
    float productValue201 = inverseLengthValue17 * quotientValue27;
    float scalarValue77 = -fragmentScalarConstants1.packedValues[594u];
    float multiplyAddValue74 = fma(fragmentScalarConstants1.packedValues[594u], 0.5, -fma(scalarValue77, floor(sumValue / fragmentScalarConstants1.packedValues[594u]), sumValue));
    float multiplyAddValue79 = fma(fragmentScalarConstants1.packedValues[594u], 0.5, -fma(scalarValue77, floor(sumValue1 / fragmentScalarConstants1.packedValues[594u]), sumValue1));
    float multiplyAddValue80 = fma(fragmentScalarConstants1.packedValues[594u], 0.5, -fma(scalarValue77, floor(sumValue2 / fragmentScalarConstants1.packedValues[594u]), sumValue2));
    float scalarValue78 = -rdDot3Precise2(vec3(multiplyAddValue74, multiplyAddValue79, multiplyAddValue80), vec3(productValue199, productValue200, productValue201));
    float multiplyAddValue81 = (sumValue + fma(scalarValue78, productValue199, multiplyAddValue74)) + fragmentVectorConstants1.packedValues[128u].x;
    float multiplyAddValue82 = (sumValue1 + fma(scalarValue78, productValue200, multiplyAddValue79)) + fragmentVectorConstants1.packedValues[128u].y;
    float multiplyAddValue83 = (sumValue2 + fma(scalarValue78, productValue201, multiplyAddValue80)) + fragmentVectorConstants1.packedValues[128u].z;
    float comparisonValue87 = bitwiseValue36 ? multiplyAddValue81 : varyingTexCoord3.x;
    float comparisonValue88 = bitwiseValue36 ? multiplyAddValue82 : varyingTexCoord3.y;
    float comparisonValue89 = bitwiseValue36 ? multiplyAddValue83 : varyingTexCoord3.z;
    bool bitwiseValue37 = (((varyingTexCoord2.y + varyingTexCoord2.x) + varyingTexCoord2.z) < 9.9999997473787516355514526367188e-05) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05);
    float productValue31 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue90 = bitwiseValue37 ? spvNMin(productValue31, 1.0) : varyingTexCoord2.x;
    float multiplyAddValue84 = bitwiseValue37 ? spvNMin(fma(fma(productValue31, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue31, 1.0) : varyingTexCoord2.y;
    float multiplyAddValue85 = bitwiseValue37 ? spvNMin(fma(productValue31 * productValue31, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue31, 1.0) : varyingTexCoord2.z;
    float sumValue112 = 1.0 - intermediateValue33;
    float multiplyAddValue86 = fma(sumValue112, 0.039999999105930328369140625, exponentialValue6 * intermediateValue33);
    float multiplyAddValue87 = fma(sumValue112, 0.039999999105930328369140625, exponentialValue7 * intermediateValue33);
    float multiplyAddValue88 = fma(sumValue112, 0.039999999105930328369140625, exponentialValue8 * intermediateValue33);
    float exponentialValue3;
    if ((fragmentScalarConstants1.packedValues[496u] != 0.0) && (fragmentScalarConstants1.packedValues[499u] != 0.0))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue & 4u) == 0u)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue47 = texture(sampler2DArray(materialTexture6, textureSampler6), vec3((varyingTexCoord3.x - fragmentScalarConstants1.packedValues[512u]) * fragmentScalarConstants1.packedValues[497u], (varyingTexCoord3.z - fragmentScalarConstants1.packedValues[514u]) * fragmentScalarConstants1.packedValues[497u], fragmentScalarConstants1.packedValues[501u]));
        float scalarValue79 = sampledTextureValue47.x;
        exponentialValue3 = exp2(log2((scalarValue79 + scalarValue79) * spvNClamp(productValue188, 0.0, 1.0)) * fragmentScalarConstants1.packedValues[498u]) * (fragmentScalarConstants1.packedValues[498u] + 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue8 = varyingNormal0.x;
        intermediateValue9 = varyingNormal0.y;
        intermediateValue10 = varyingNormal0.z;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        exponentialValue3 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue2 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        float productValue6 = (sampledTextureValue2.x * 2.0) + (-1.0);
        float productValue7 = (sampledTextureValue2.y * 2.0) + (-1.0);
        float productValue8 = (sampledTextureValue2.z * 2.0) + (-1.0);
        intermediateValue8 = fma(fragmentVectorConstants1.packedValues[60u].x, productValue8, fma(fragmentVectorConstants1.packedValues[59u].x, productValue7, productValue6 * fragmentVectorConstants1.packedValues[58u].x));
        intermediateValue9 = fma(fragmentVectorConstants1.packedValues[60u].y, productValue8, fma(fragmentVectorConstants1.packedValues[59u].y, productValue7, productValue6 * fragmentVectorConstants1.packedValues[58u].y));
        intermediateValue10 = fma(fragmentVectorConstants1.packedValues[60u].z, productValue8, fma(fragmentVectorConstants1.packedValues[59u].z, productValue7, productValue6 * fragmentVectorConstants1.packedValues[58u].z));
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec3 vectorValue6 = vec3(multiplyAddValue54, multiplyAddValue55, multiplyAddValue56);
    float nonlinearValue5 = sqrt(rdDot3Precise2(vectorValue6, vectorValue6));
    vec3 vectorValue7 = vec3(multiplyAddValue62, multiplyAddValue63, multiplyAddValue64);
    float multiplyAddValue37;
    float multiplyAddValue38;
    float multiplyAddValue39;
    float intermediateValue54;
    float intermediateValue55;
    float intermediateValue56;
    float multiplyAddValue40;
    float multiplyAddValue41;
    float multiplyAddValue42;
    float intermediateValue57;
    float intermediateValue58;
    float intermediateValue59;
    if (multiplyAddValue61 != 1.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[0u].w)));
    float multiplyAddValue5 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[0u].x))) / multiplyAddValue4;
    float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[0u].y))) / multiplyAddValue4;
    float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[0u].z))) / multiplyAddValue4;
    float inverseLengthValue = inversesqrt(dot(vec3(intermediateValue8, intermediateValue9, intermediateValue10), vec3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue9 = inverseLengthValue * intermediateValue8;
    float productValue10 = inverseLengthValue * intermediateValue9;
    float productValue11 = inverseLengthValue * intermediateValue10;
    float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue11, fma(fragmentVectorConstants1.packedValues[5u].x, productValue10, productValue9 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue11, fma(fragmentVectorConstants1.packedValues[5u].y, productValue10, productValue9 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue11, fma(fragmentVectorConstants1.packedValues[5u].z, productValue10, productValue9 * fragmentVectorConstants1.packedValues[4u].z));
    float productValue28;
    float productValue29;
    float productValue30;
    if ((fragmentVectorConstants1.packedValues[148u].y > 0.0) || (fragmentVectorConstants1.packedValues[148u].w > 0.0))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float quotientValue3;
        float quotientValue4;
        float quotientValue5;
        float multiplyAddValue43;
        float multiplyAddValue44;
        float multiplyAddValue45;
        if (!((fragmentScalarConstants1.packedValues[548u] != 0.0) && (abs(varyingTexCoord1.y) < 9.9999997473787516355514526367188e-05)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[128u].x;
        float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[128u].y;
        float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[128u].z;
        float scalarValue1 = dFdxCoarse(multiplyAddValue);
        float scalarValue2 = dFdxCoarse(multiplyAddValue1);
        float scalarValue3 = dFdxCoarse(multiplyAddValue2);
        float inverseLengthValue1 = inversesqrt(dot(vec3(scalarValue1, scalarValue2, scalarValue3), vec3(scalarValue1, scalarValue2, scalarValue3)));
        float productValue12 = inverseLengthValue1 * scalarValue1;
        float productValue13 = inverseLengthValue1 * scalarValue2;
        float productValue14 = inverseLengthValue1 * scalarValue3;
        float sumValue3 = dFdyCoarse((-0.0) - multiplyAddValue);
        float sumValue4 = dFdyCoarse((-0.0) - multiplyAddValue1);
        float sumValue5 = dFdyCoarse((-0.0) - multiplyAddValue2);
        float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue3, sumValue4, sumValue5), vec3(sumValue3, sumValue4, sumValue5)));
        float productValue15 = inverseLengthValue2 * sumValue3;
        float productValue16 = inverseLengthValue2 * sumValue4;
        float productValue17 = inverseLengthValue2 * sumValue5;
        float productValue18 = (productValue17 * productValue13) - (productValue16 * productValue14);
        float productValue19 = (productValue15 * productValue14) - (productValue17 * productValue12);
        float productValue20 = (productValue16 * productValue12) - (productValue15 * productValue13);
        float inverseLengthValue3 = inversesqrt(dot(vec3(productValue18, productValue19, productValue20), vec3(productValue18, productValue19, productValue20)));
        float productValue21 = productValue18 * inverseLengthValue3;
        float productValue22 = productValue19 * inverseLengthValue3;
        float productValue23 = productValue20 * inverseLengthValue3;
        float multiplyAddValue14 = fma(fragmentVectorConstants1.packedValues[11u].x, productValue23, fma(fragmentVectorConstants1.packedValues[10u].x, productValue22, productValue21 * fragmentVectorConstants1.packedValues[9u].x));
        float multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[11u].y, productValue23, fma(fragmentVectorConstants1.packedValues[10u].y, productValue22, productValue21 * fragmentVectorConstants1.packedValues[9u].y));
        float multiplyAddValue16 = fma(fragmentVectorConstants1.packedValues[11u].z, productValue23, fma(fragmentVectorConstants1.packedValues[10u].z, productValue22, productValue21 * fragmentVectorConstants1.packedValues[9u].z));
        float inverseLengthValue4 = inversesqrt(dot(vec3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16), vec3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16)));
        float quotientValue = roundEven((inverseLengthValue4 * multiplyAddValue14) / fragmentVectorConstants1.packedValues[151u].x) * fragmentVectorConstants1.packedValues[151u].x;
        float quotientValue1 = roundEven((inverseLengthValue4 * multiplyAddValue15) / fragmentVectorConstants1.packedValues[151u].x) * fragmentVectorConstants1.packedValues[151u].x;
        float quotientValue2 = roundEven((inverseLengthValue4 * multiplyAddValue16) / fragmentVectorConstants1.packedValues[151u].x) * fragmentVectorConstants1.packedValues[151u].x;
        float inverseLengthValue5 = inversesqrt(dot(vec3(quotientValue, quotientValue1, quotientValue2), vec3(quotientValue, quotientValue1, quotientValue2)));
        float productValue24 = inverseLengthValue5 * quotientValue;
        float productValue25 = inverseLengthValue5 * quotientValue1;
        float productValue26 = inverseLengthValue5 * quotientValue2;
        float productValue27 = fragmentVectorConstants1.packedValues[148u].z * 0.5;
        float quotientValue6 = productValue27 - (sumValue - (floor(sumValue / fragmentVectorConstants1.packedValues[148u].z) * fragmentVectorConstants1.packedValues[148u].z));
        float quotientValue7 = productValue27 - (sumValue1 - (floor(sumValue1 / fragmentVectorConstants1.packedValues[148u].z) * fragmentVectorConstants1.packedValues[148u].z));
        float quotientValue8 = productValue27 - (sumValue2 - (floor(sumValue2 / fragmentVectorConstants1.packedValues[148u].z) * fragmentVectorConstants1.packedValues[148u].z));
        float dotProductValue = dot(vec3(quotientValue6, quotientValue7, quotientValue8), vec3(productValue24, productValue25, productValue26));
        productValue28 = (varyingTexCoord3.x + quotientValue6) - (dotProductValue * productValue24);
        productValue29 = (varyingTexCoord3.y - (dotProductValue * productValue25)) + quotientValue7;
        productValue30 = (varyingTexCoord3.z - (dotProductValue * productValue26)) + quotientValue8;
    }
    else
    {
        productValue28 = varyingTexCoord3.x;
        productValue29 = varyingTexCoord3.y;
        productValue30 = varyingTexCoord3.z;
    }
    float intermediateValue14;
    float productValue32;
    float productValue33;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05) && (((varyingTexCoord2.y + varyingTexCoord2.x) + varyingTexCoord2.z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue31 = varyingTexCoord1.x * varyingTexCoord1.x;
        intermediateValue14 = spvNClamp(productValue31, 0.0, 1.0);
        productValue32 = spvNClamp(((productValue31 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue31, 0.0, 1.0);
        productValue33 = spvNClamp((((productValue31 * productValue31) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue31, 0.0, 1.0);
    }
    else
    {
        intermediateValue14 = varyingTexCoord2.x;
        productValue32 = varyingTexCoord2.y;
        productValue33 = varyingTexCoord2.z;
    }
    float sumValue6 = 1.0 - intermediateValue4;
    float productValue34 = sumValue6 * 0.039999999105930328369140625;
    float productValue35 = productValue34 + (intermediateValue4 * exponentialValue);
    float productValue36 = productValue34 + (intermediateValue4 * exponentialValue1);
    float productValue37 = productValue34 + (intermediateValue4 * exponentialValue2);
    float sampledTextureValue3;
    if ((fragmentVectorConstants1.packedValues[124u].x != 0.0) && (fragmentVectorConstants1.packedValues[124u].w != 0.0))
    {
        sampledTextureValue3 = exp2(log2((texture(sampler2DArray(causticsTextureTexture, causticsTextureSampler), vec3((varyingTexCoord3.x - fragmentVectorConstants1.packedValues[128u].x) * fragmentVectorConstants1.packedValues[124u].y, (varyingTexCoord3.z - fragmentVectorConstants1.packedValues[128u].z) * fragmentVectorConstants1.packedValues[124u].y, fragmentVectorConstants1.packedValues[125u].y)).x * 2.0) * spvNClamp(dot(vec3(0.0, 1.0, 0.0), vec3(productValue9, productValue10, productValue11)), 0.0, 1.0)) * fragmentVectorConstants1.packedValues[124u].z) * (fragmentVectorConstants1.packedValues[124u].z + 1.0);
    }
    else
    {
        sampledTextureValue3 = 1.0;
    }
    float quotientValue9 = spvNClamp(((varyingTexCoord1.y * 16.0) - fragmentVectorConstants1.packedValues[84u].y) / spvNMax(fragmentVectorConstants1.packedValues[84u].x - fragmentVectorConstants1.packedValues[84u].y, 1.0), 0.0, 1.0);
    float nonlinearValue = sqrt(((multiplyAddValue1 * multiplyAddValue1) + (multiplyAddValue * multiplyAddValue)) + (multiplyAddValue2 * multiplyAddValue2));
    float productValue39;
    float productValue40;
    float productValue41;
    float productValue42;
    float productValue43;
    float productValue44;
    float intermediateValue16;
    float intermediateValue18;
    float intermediateValue20;
    float intermediateValue22;
    float intermediateValue24;
    float intermediateValue26;
    if (multiplyAddValue10 != 1.0)
    {
        float sumValue7 = nonlinearValue + 9.9999997473787516355514526367188e-05;
        float quotientValue10 = multiplyAddValue / sumValue7;
        float quotientValue11 = multiplyAddValue1 / sumValue7;
        float quotientValue12 = multiplyAddValue2 / sumValue7;
        float sumValue8 = (-0.0) - quotientValue10;
        float sumValue9 = (-0.0) - quotientValue11;
        float sumValue10 = (-0.0) - quotientValue12;
        float productValue38 = fragmentVectorConstants1.packedValues[156u].x * intermediateValue7;
        bool conditionValue = int(uint(int(fragmentVectorConstants1.packedValues[148u].y))) > int(0u);
        float intermediateValue17;
        float intermediateValue19;
        float intermediateValue21;
        float intermediateValue23;
        float intermediateValue25;
        float intermediateValue27;
        if ((fragmentVectorConstants1.packedValues[137u].x != 0.0) && (abs(varyingTexCoord1.y) < 9.9999997473787516355514526367188e-05))
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float sumValue113 = nonlinearValue5 + 9.9999997473787516355514526367188e-05;
            float productValue202 = comparisonValue1 * fragmentScalarConstants1.packedValues[624u];
            float multiplyAddValue52;
            float intermediateValue69;
            if (uint(int(fragmentScalarConstants1.packedValues[308u])) == 1u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue17 = 0.0;
            intermediateValue19 = 0.0;
            intermediateValue21 = 0.0;
            intermediateValue23 = 0.0;
            intermediateValue25 = 0.0;
            intermediateValue27 = 0.0;
        }
        else
        {
            float productValue69;
            float intermediateValue31;
            if (uint(int(fragmentVectorConstants1.packedValues[77u].x)) == 1u)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                bool bitwiseValue38 = bitwiseValue36 && (int(uint(int(fragmentScalarConstants1.packedValues[593u]))) > int(0u));
                float multiplyAddValue89 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[571u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[570u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[568u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[569u])));
                float multiplyAddValue90 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[571u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[570u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[568u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[569u])));
                float multiplyAddValue91 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[571u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[570u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[568u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[569u])));
                vec3 vectorValue8 = vec3(multiplyAddValue89, multiplyAddValue90, multiplyAddValue91);
                float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
                float productValue203 = spvNMax(rdDot3Precise2(vectorValue7, vec3(inverseLengthValue18 * multiplyAddValue89, inverseLengthValue18 * multiplyAddValue90, inverseLengthValue18 * multiplyAddValue91)), 0.0);
                float sumValue114 = spvNMax(1.0 - productValue203, 0.0);
                float multiplyAddValue92 = fma(productValue187 * fragmentScalarConstants1.packedValues[615u], sumValue114, bitwiseValue38 ? multiplyAddValue81 : varyingTexCoord3.x);
                float multiplyAddValue93 = fma(productValue188 * fragmentScalarConstants1.packedValues[615u], sumValue114, bitwiseValue38 ? multiplyAddValue82 : varyingTexCoord3.y);
                float multiplyAddValue94 = fma(productValue189 * fragmentScalarConstants1.packedValues[615u], sumValue114, bitwiseValue38 ? multiplyAddValue83 : varyingTexCoord3.z);
                uint scalarValue80 = uint(int(rdDot4Precise(vec4(spvNClamp(fragmentVectorConstants1.packedValues[91u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[91u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[91u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[91u].w, 0.0, 1.0)), vec4(1.0))));
                bool comparisonValue91 = fragmentScalarConstants1.packedValues[592u] != 0.0;
                float intermediateValue70;
                float intermediateValue92;
                intermediateValue92 = 1.0;
                intermediateValue70 = 1.0;
                uint sumValue14;
                float intermediateValue93;
                float intermediateValue94;
                uint intermediateValue96;
                uint scalarValue6 = 0u;
                uint scalarValue7 = 0u;
                for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float multiplyAddValue17 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[142u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[142u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[142u].y, fragmentVectorConstants1.packedValues[142u].x * fragmentVectorConstants1.packedValues[4u].x)));
                float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[142u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[142u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[142u].y, fragmentVectorConstants1.packedValues[142u].x * fragmentVectorConstants1.packedValues[4u].y)));
                float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[142u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[142u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[142u].y, fragmentVectorConstants1.packedValues[142u].x * fragmentVectorConstants1.packedValues[4u].z)));
                float inverseLengthValue6 = inversesqrt(dot(vec3(multiplyAddValue17, multiplyAddValue18, multiplyAddValue19), vec3(multiplyAddValue17, multiplyAddValue18, multiplyAddValue19)));
                float dotProductValue1 = spvNMax(dot(vec3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), vec3(inverseLengthValue6 * multiplyAddValue17, inverseLengthValue6 * multiplyAddValue18, inverseLengthValue6 * multiplyAddValue19)), 0.0);
                float productValue45 = spvNClamp(1.0 - dotProductValue1, 0.0, 1.0) * fragmentVectorConstants1.packedValues[153u].w;
                float comparisonValue = (productValue45 * productValue9) + (conditionValue ? productValue28 : varyingTexCoord3.x);
                float comparisonValue2 = (productValue45 * productValue10) + (conditionValue ? productValue29 : varyingTexCoord3.y);
                float comparisonValue3 = (productValue45 * productValue11) + (conditionValue ? productValue30 : varyingTexCoord3.z);
                uint dotProductValue2 = uint(int(dot(vec4(spvNClamp(fragmentVectorConstants1.packedValues[91u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[91u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[91u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[91u].w, 0.0, 1.0)), vec4(1.0))));
                float intermediateValue32;
                float intermediateValue43;
                if (int(dotProductValue2) > int(0u))
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    if (int(scalarValue80) <= int(scalarValue7))
                    {
                        break;
                    }
                    uint scalarValue81 = min(scalarValue7, 68u);
                    uint reinterpretedBits = uint(min(int(uint(int(rdDot4Precise(fragmentVectorConstants1.packedValues[91u], vec4(uintBitsToFloat(intermediateValue22[scalarValue81].x), uintBitsToFloat(intermediateValue22[scalarValue81].y), uintBitsToFloat(intermediateValue22[scalarValue81].z), uintBitsToFloat(intermediateValue22[scalarValue81].w))))) + scalarValue6), int(8u)));
                    intermediateValue93 = intermediateValue92;
                    intermediateValue94 = intermediateValue70;
                    intermediateValue96 = scalarValue6;
                    float quotientValue16;
                    float quotientValue17;
                    uint intermediateValue122;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float intermediateValue42;
                    float intermediateValue44;
                    uint intermediateValue55;
                    float scalarValue4 = 1.0;
                    float scalarValue5 = 1.0;
                    uint scalarValue6 = 0u;
                    uint scalarValue7 = 0u;
                    uint sumValue31;
                    bool intermediateValue57;
#endif
                    for (;;)
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        if (int(reinterpretedBits) <= int(intermediateValue96))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        sumValue31 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[scalarValue7 + 364u])) + scalarValue6), int(8u)));
                        intermediateValue57 = int(scalarValue6) < int(sumValue31);
                        uint branchMergedValue;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (intermediateValue57)
                        {
                            float intermediateValue67;
                            float intermediateValue68;
                            uint intermediateValue69;
                            float scalarValue8 = scalarValue4;
                            float scalarValue9 = scalarValue5;
                            uint scalarValue10 = scalarValue6;
                            uint bitwiseValue10;
                            float multiplyAddValue31;
                            float multiplyAddValue32;
                            float multiplyAddValue33;
                            bool comparisonValue18;
                            for (;;)
                            {
                                bitwiseValue10 = scalarValue10 << 2u;
                                uint sumValue11 = bitwiseValue10 + 92u;
                                uint sumValue12 = bitwiseValue10 + 93u;
                                uint sumValue13 = bitwiseValue10 + 94u;
                                uint sumValue16 = bitwiseValue10 + 95u;
                                multiplyAddValue31 = fma(fragmentVectorConstants1.packedValues[sumValue13].x, comparisonValue3, fma(fragmentVectorConstants1.packedValues[sumValue12].x, comparisonValue2, fragmentVectorConstants1.packedValues[sumValue11].x * comparisonValue)) + fragmentVectorConstants1.packedValues[sumValue16].x;
                                multiplyAddValue32 = fma(fragmentVectorConstants1.packedValues[sumValue13].y, comparisonValue3, fma(fragmentVectorConstants1.packedValues[sumValue12].y, comparisonValue2, fragmentVectorConstants1.packedValues[sumValue11].y * comparisonValue)) + fragmentVectorConstants1.packedValues[sumValue16].y;
                                multiplyAddValue33 = fma(fragmentVectorConstants1.packedValues[sumValue13].z, comparisonValue3, fma(fragmentVectorConstants1.packedValues[sumValue12].z, comparisonValue2, fragmentVectorConstants1.packedValues[sumValue11].z * comparisonValue)) + fragmentVectorConstants1.packedValues[sumValue16].z;
                                comparisonValue18 = ((abs(multiplyAddValue31) <= 1.0) && (abs(multiplyAddValue32) <= 1.0)) && (abs(multiplyAddValue33) <= 1.0);
                                float branchMergedValue1;
                                uint branchMergedValue7;
                                float branchMergedValue8;
                                if (comparisonValue18)
                                {
                                    uint sumValue17 = scalarValue10 + 49u;
                                    float sumValue18 = spvNMin(spvNMax(dotProductValue1, fragmentScalarConstants1.packedValues[scalarValue10 + 312u]), 1.0);
                                    float nonlinearValue1 = (sqrt(1.0 - (sumValue18 * sumValue18)) / sumValue18) * fragmentVectorConstants1.packedValues[sumValue17].z;
                                    float productValue46 = (multiplyAddValue31 * 0.5) + 0.5;
                                    float productValue47 = 0.5 - (multiplyAddValue32 * 0.5);
                                    uint sumValue19 = bitwiseValue10 + 19u;
                                    float nonlinearValue2 = sqrt((((fragmentVectorConstants1.packedValues[sumValue19].x * fragmentVectorConstants1.packedValues[sumValue19].x) + (fragmentVectorConstants1.packedValues[sumValue19].y * fragmentVectorConstants1.packedValues[sumValue19].y)) + (fragmentVectorConstants1.packedValues[sumValue19].z * fragmentVectorConstants1.packedValues[sumValue19].z)) + (fragmentVectorConstants1.packedValues[sumValue19].w * fragmentVectorConstants1.packedValues[sumValue19].w)) * fragmentVectorConstants1.packedValues[156u].z;
                                    uint comparisonValue4 = (fragmentVectorConstants1.packedValues[148u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[sumValue17].w + 0.5))), int(1u)))), int(9u)));
                                    uint quotientValue13 = uint(int(comparisonValue4) / int(2u));
                                    float intermediateValue121;
                                    float intermediateValue122;
                                    if (int(comparisonValue4) > int(0u))
                                    {
                                        float sumValue85;
                                        float productValue164;
                                        float intermediateValue150;
                                        float intermediateValue151;
                                        uint intermediateValue152;
                                        float scalarValue11 = 0.0;
                                        float scalarValue12 = 0.0;
                                        uint scalarValue13 = 0u;
                                        for (;;)
                                        {
                                            intermediateValue150 = scalarValue11;
                                            intermediateValue151 = scalarValue12;
                                            intermediateValue152 = 0u;
                                            float intermediateValue196;
                                            float intermediateValue153;
                                            float intermediateValue154;
                                            float intermediateValue155;
                                            float intermediateValue156;
                                            float productValue172;
                                            float productValue173;
                                            bool comparisonValue44;
                                            float sumValue95;
                                            for (;;)
                                            {
                                                float productValue51 = (productValue46 + ((float(int(intermediateValue152 - quotientValue13)) + 0.5) * fragmentVectorConstants1.packedValues[153u].x)) * fragmentVectorConstants1.packedValues[sumValue17].x;
                                                float productValue52 = (productValue47 + (fragmentVectorConstants1.packedValues[153u].x * (float(int(scalarValue13 - quotientValue13)) + 0.5))) * fragmentVectorConstants1.packedValues[sumValue17].x;
                                                vec4 sampledTextureValue5 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue51, productValue52, float(int(scalarValue10))));
                                                intermediateValue153 = sampledTextureValue5.x;
                                                intermediateValue154 = sampledTextureValue5.y;
                                                intermediateValue155 = sampledTextureValue5.z;
                                                intermediateValue156 = sampledTextureValue5.w;
                                                productValue172 = fract((productValue51 * fragmentVectorConstants1.packedValues[153u].z) + 0.5);
                                                productValue173 = fract((productValue52 * fragmentVectorConstants1.packedValues[153u].z) + 0.5);
                                                float productValue53 = spvNClamp((multiplyAddValue33 - intermediateValue153) * nonlinearValue2, 0.0, 1.0);
                                                float productValue54 = spvNClamp((multiplyAddValue33 - intermediateValue154) * nonlinearValue2, 0.0, 1.0);
                                                float productValue55 = spvNClamp((multiplyAddValue33 - intermediateValue155) * nonlinearValue2, 0.0, 1.0);
                                                float productValue56 = spvNClamp((multiplyAddValue33 - intermediateValue156) * nonlinearValue2, 0.0, 1.0);
                                                float productValue57 = 1.0 - ((productValue53 * productValue53) * (3.0 - (productValue53 * 2.0)));
                                                float productValue58 = 1.0 - ((productValue56 * productValue56) * (3.0 - (productValue56 * 2.0)));
                                                float productValue59 = (((1.0 - ((productValue55 * productValue55) * (3.0 - (productValue55 * 2.0)))) - productValue58) * productValue172) + productValue58;
                                                productValue164 = (productValue59 + intermediateValue151) + ((((((1.0 - ((productValue54 * productValue54) * (3.0 - (productValue54 * 2.0)))) - productValue57) * productValue172) + productValue57) - productValue59) * productValue173);
                                                comparisonValue44 = fragmentVectorConstants1.packedValues[148u].x != 0.0;
                                                sumValue95 = (multiplyAddValue33 - fragmentVectorConstants1.packedValues[sumValue17].y) - nonlinearValue1;
                                                float branchMergedValue4;
                                                if (comparisonValue44)
                                                {
                                                    branchMergedValue4 = float(intermediateValue156 >= sumValue95);
                                                }
                                                else
                                                {
                                                    float comparisonValue5 = (intermediateValue153 < sumValue95) ? 0.0 : 1.0;
                                                    float comparisonValue6 = (intermediateValue156 < sumValue95) ? 0.0 : 1.0;
                                                    float comparisonValue7 = ((((intermediateValue155 < sumValue95) ? 0.0 : 1.0) - comparisonValue6) * productValue172) + comparisonValue6;
                                                    branchMergedValue4 = (((((((intermediateValue154 < sumValue95) ? 0.0 : 1.0) - comparisonValue5) * productValue172) + comparisonValue5) - comparisonValue7) * productValue173) + comparisonValue7;
                                                }
                                                intermediateValue196 = branchMergedValue4;
                                                sumValue85 = intermediateValue196 + intermediateValue150;
                                                uint sumValue20 = intermediateValue152 + 1u;
                                                if (sumValue20 == comparisonValue4)
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    intermediateValue150 = sumValue85;
                                                    intermediateValue151 = productValue164;
                                                    intermediateValue152 = sumValue20;
                                                    continue;
                                                }
                                            }
                                            uint sumValue21 = scalarValue13 + 1u;
                                            if (sumValue21 == comparisonValue4)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                scalarValue11 = sumValue85;
                                                scalarValue12 = productValue164;
                                                scalarValue13 = sumValue21;
                                                continue;
                                            }
                                        }
                                        intermediateValue121 = sumValue85;
                                        intermediateValue122 = productValue164;
                                    }
                                    else
                                    {
                                        intermediateValue121 = 0.0;
                                        intermediateValue122 = 0.0;
                                    }
                                    float productValue63 = float(int(comparisonValue4 * comparisonValue4));
                                    branchMergedValue1 = spvNMin(scalarValue9, intermediateValue121 / productValue63);
                                    branchMergedValue7 = sumValue31;
                                    branchMergedValue8 = spvNMin(scalarValue8, intermediateValue122 / productValue63);
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue9;
                                    branchMergedValue7 = scalarValue10 + 1u;
                                    branchMergedValue8 = scalarValue8;
                                }
                                intermediateValue68 = branchMergedValue1;
                                intermediateValue69 = branchMergedValue7;
                                intermediateValue67 = branchMergedValue8;
                                if (int(intermediateValue69) < int(sumValue31))
                                {
                                    scalarValue8 = intermediateValue67;
                                    scalarValue9 = intermediateValue68;
                                    scalarValue10 = intermediateValue69;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            branchMergedValue = intermediateValue69;
                            branchMergedValue5 = intermediateValue68;
                            branchMergedValue6 = intermediateValue67;
                        }
                        else
                        {
                            branchMergedValue = scalarValue6;
                            branchMergedValue5 = scalarValue5;
                            branchMergedValue6 = scalarValue4;
                        }
                        intermediateValue55 = branchMergedValue;
                        intermediateValue44 = branchMergedValue5;
                        intermediateValue42 = branchMergedValue6;
                        uint sumValue22 = scalarValue7 + 1u;
                        if (sumValue22 == dotProductValue2)
#endif
                        {
                            break;
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        uint bitwiseValue39 = intermediateValue96 << 2u;
                        uint sumValue115 = bitwiseValue39 + 93u;
                        uint sumValue116 = bitwiseValue39 + 92u;
                        uint sumValue117 = bitwiseValue39 + 94u;
                        uint sumValue118 = bitwiseValue39 + 95u;
                        float multiplyAddValue95 = fma(fragmentVectorConstants1.packedValues[sumValue117].x, multiplyAddValue94, fma(fragmentVectorConstants1.packedValues[sumValue116].x, multiplyAddValue92, multiplyAddValue93 * fragmentVectorConstants1.packedValues[sumValue115].x)) + fragmentVectorConstants1.packedValues[sumValue118].x;
                        float multiplyAddValue96 = fma(fragmentVectorConstants1.packedValues[sumValue117].y, multiplyAddValue94, fma(fragmentVectorConstants1.packedValues[sumValue116].y, multiplyAddValue92, multiplyAddValue93 * fragmentVectorConstants1.packedValues[sumValue115].y)) + fragmentVectorConstants1.packedValues[sumValue118].y;
                        float multiplyAddValue97 = fma(fragmentVectorConstants1.packedValues[sumValue117].z, multiplyAddValue94, fma(fragmentVectorConstants1.packedValues[sumValue116].z, multiplyAddValue92, multiplyAddValue93 * fragmentVectorConstants1.packedValues[sumValue115].z)) + fragmentVectorConstants1.packedValues[sumValue118].z;
                        if (((abs(multiplyAddValue95) <= 1.0) && (abs(multiplyAddValue96) <= 1.0)) && (abs(multiplyAddValue97) <= 1.0))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        else
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            uint scalarValue82 = min(intermediateValue96, 68u);
                            float reinterpretedBits1 = spvNMin(spvNMax(productValue203, rdDot4Precise(fragmentVectorConstants1.packedValues[78u], vec4(uintBitsToFloat(intermediateValue22[scalarValue82].x), uintBitsToFloat(intermediateValue22[scalarValue82].y), uintBitsToFloat(intermediateValue22[scalarValue82].z), uintBitsToFloat(intermediateValue22[scalarValue82].w)))), 1.0);
                            float multiplyAddValue98 = fma(multiplyAddValue95, 0.5, 0.5);
                            uint sumValue119 = bitwiseValue39 + 19u;
                            float nonlinearValue6 = sqrt(rdDot4Precise(fragmentVectorConstants1.packedValues[sumValue119], fragmentVectorConstants1.packedValues[sumValue119])) * fragmentScalarConstants1.packedValues[626u];
                            uint clampedValue = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[(((16u * intermediateValue96) + 784u) + 12u) >> 2u] + 0.5))), int(1u), int(9u)));
                            bool conditionValue3 = !comparisonValue91;
                            uint comparisonValue92 = (comparisonValue91 ? 1u : clampedValue) >> 1u;
                            float multiplyAddValue99 = 1.0 - fma(multiplyAddValue96, 0.5, 0.5);
                            float scalarValue83 = rdSignedBitsToFloat(intermediateValue96);
                            float multiplyAddValue100 = multiplyAddValue97 - fma(fragmentScalarConstants1.packedValues[(((16u * intermediateValue96) + 784u) + 8u) >> 2u], sqrt(fma(-reinterpretedBits1, reinterpretedBits1, 1.0)) / reinterpretedBits1, fragmentScalarConstants1.packedValues[(((16u * intermediateValue96) + 784u) + 4u) >> 2u]);
                            float intermediateValue169;
                            float intermediateValue171;
                            intermediateValue169 = 0.0;
                            intermediateValue171 = 0.0;
                            uint sumValue69;
                            float intermediateValue170;
                            float intermediateValue172;
                            uint scalarValue13 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            scalarValue4 = intermediateValue42;
                            scalarValue5 = intermediateValue44;
                            scalarValue6 = intermediateValue55;
                            scalarValue7 = sumValue22;
                            continue;
                        }
                    }
                    intermediateValue32 = intermediateValue42;
                    intermediateValue43 = intermediateValue44;
                }
                else
                {
                    intermediateValue32 = 1.0;
                    intermediateValue43 = 1.0;
                }
                float intermediateValue59;
                if (int(uint(int(fragmentVectorConstants1.packedValues[57u].x))) > int(0u))
                {
                    float scalarValue14 = spvNMin(spvNMax(dotProductValue1, fragmentVectorConstants1.packedValues[78u].x), 1.0);
                    float multiplyAddValue20 = spvNMin(((fragmentVectorConstants1.packedValues[141u].z - fragmentVectorConstants1.packedValues[49u].y) + fma(fragmentVectorConstants1.packedValues[140u].z, comparisonValue3, fma(fragmentVectorConstants1.packedValues[139u].z, comparisonValue2, fragmentVectorConstants1.packedValues[138u].z * comparisonValue))) - ((sqrt(1.0 - (scalarValue14 * scalarValue14)) / scalarValue14) * fragmentVectorConstants1.packedValues[49u].z), 1.0);
                    float multiplyAddValue21 = (((fma(fragmentVectorConstants1.packedValues[140u].x, comparisonValue3, fma(fragmentVectorConstants1.packedValues[139u].x, comparisonValue2, fragmentVectorConstants1.packedValues[138u].x * comparisonValue)) + fragmentVectorConstants1.packedValues[141u].x) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[57u].y;
                    float multiplyAddValue22 = (0.5 - ((fma(fragmentVectorConstants1.packedValues[140u].y, comparisonValue3, fma(fragmentVectorConstants1.packedValues[139u].y, comparisonValue2, fragmentVectorConstants1.packedValues[138u].y * comparisonValue)) + fragmentVectorConstants1.packedValues[141u].y) * 0.5)) * fragmentVectorConstants1.packedValues[57u].y;
                    uint comparisonValue8 = (fragmentVectorConstants1.packedValues[148u].x != 0.0) ? 1u : 2u;
                    uint bitwiseValue = comparisonValue8 >> 1u;
                    float branchMergedValue11;
                    if ((multiplyAddValue22 < fragmentVectorConstants1.packedValues[57u].y) && (((multiplyAddValue21 >= 0.0) && (multiplyAddValue21 < fragmentVectorConstants1.packedValues[57u].y)) && (multiplyAddValue22 >= 0.0)))
                    {
                        float dotProductValue3 = dot(vec4(fragmentVectorConstants1.packedValues[91u]), vec4(1.0)) + 1.0;
                        float sumValue63;
                        float intermediateValue104;
                        uint intermediateValue105;
                        float scalarValue15 = 0.0;
                        uint scalarValue16 = 0u;
                        for (;;)
                        {
                            intermediateValue104 = scalarValue15;
                            intermediateValue105 = 0u;
                            float intermediateValue143;
                            float productValue160;
                            float productValue161;
                            bool comparisonValue30;
#endif
                            for (;;)
                            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                                if ((comparisonValue91 && (int(scalarValue13) >= int(1u))) || ((int(clampedValue) <= int(scalarValue13)) && conditionValue3))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float productValue64 = fragmentVectorConstants1.packedValues[57u].y * fragmentVectorConstants1.packedValues[57u].z;
                                productValue160 = (productValue64 * (float(int(intermediateValue105 - bitwiseValue)) + 0.5)) + multiplyAddValue21;
                                productValue161 = (productValue64 * (float(int(scalarValue16 - bitwiseValue)) + 0.5)) + multiplyAddValue22;
                                comparisonValue30 = fragmentVectorConstants1.packedValues[148u].x != 0.0;
                                float branchMergedValue2;
                                if (comparisonValue30)
                                {
                                    branchMergedValue2 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue160, productValue161, dotProductValue3), 0.0).x >= multiplyAddValue20);
                                }
                                else
                                {
                                    vec4 sampledTextureValue6 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue160, productValue161, dotProductValue3));
                                    float productValue68 = fract((fragmentVectorConstants1.packedValues[153u].z * productValue160) + 0.5);
                                    float comparisonValue9 = (sampledTextureValue6.x < multiplyAddValue20) ? 0.0 : 1.0;
                                    float comparisonValue10 = (sampledTextureValue6.w < multiplyAddValue20) ? 0.0 : 1.0;
                                    float comparisonValue11 = ((((sampledTextureValue6.z < multiplyAddValue20) ? 0.0 : 1.0) - comparisonValue10) * productValue68) + comparisonValue10;
                                    branchMergedValue2 = (((((((sampledTextureValue6.y < multiplyAddValue20) ? 0.0 : 1.0) - comparisonValue9) * productValue68) + comparisonValue9) - comparisonValue11) * fract((fragmentVectorConstants1.packedValues[153u].z * productValue161) + 0.5)) + comparisonValue11;
                                }
                                intermediateValue143 = branchMergedValue2;
                                sumValue63 = intermediateValue143 + intermediateValue104;
                                uint sumValue23 = intermediateValue105 + 1u;
                                if (int(sumValue23) < int(comparisonValue8))
                                {
                                    intermediateValue104 = sumValue63;
                                    intermediateValue105 = sumValue23;
                                    continue;
                                }
                                else
#endif
                                {
                                    break;
                                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                                float sumValue120 = rdSignedBitsToFloat(scalarValue13 - comparisonValue92) + 0.5;
                                intermediateValue170 = intermediateValue169;
                                intermediateValue172 = intermediateValue171;
                                float multiplyAddValue164;
                                float multiplyAddValue165;
                                uint sumValue75;
                                uint scalarValue16 = 0u;
                                for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            }
                            uint sumValue24 = scalarValue16 + 1u;
                            if (int(sumValue24) < int(comparisonValue8))
                            {
                                scalarValue15 = sumValue63;
                                scalarValue16 = sumValue24;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                        branchMergedValue11 = sumValue63 / float(int(comparisonValue8 * comparisonValue8));
                    }
                    else
                    {
                        branchMergedValue11 = 1.0;
                    }
                    intermediateValue59 = branchMergedValue11;
                }
                else
                {
                    intermediateValue59 = 1.0;
                }
                float intermediateValue71;
                if ((int(uint(int(fragmentVectorConstants1.packedValues[77u].y))) > int(0u)) && (int(uint(int(fragmentVectorConstants1.packedValues[133u].x))) > int(0u)))
                {
                    float multiplyAddValue23 = fma(fragmentVectorConstants1.packedValues[131u].w, comparisonValue3, fma(fragmentVectorConstants1.packedValues[130u].w, comparisonValue2, fragmentVectorConstants1.packedValues[129u].w * comparisonValue)) + fragmentVectorConstants1.packedValues[132u].w;
                    float scalarValue17 = spvNMin(spvNMax(dotProductValue1, fragmentVectorConstants1.packedValues[78u].x), 1.0);
                    float multiplyAddValue24 = (((fma(fragmentVectorConstants1.packedValues[131u].z, comparisonValue3, fma(fragmentVectorConstants1.packedValues[130u].z, comparisonValue2, fragmentVectorConstants1.packedValues[129u].z * comparisonValue)) + fragmentVectorConstants1.packedValues[132u].z) / multiplyAddValue23) - fragmentVectorConstants1.packedValues[49u].y) - ((sqrt(1.0 - (scalarValue17 * scalarValue17)) / scalarValue17) * fragmentVectorConstants1.packedValues[49u].z);
                    float multiplyAddValue25 = (((fma(fragmentVectorConstants1.packedValues[131u].x, comparisonValue3, fma(fragmentVectorConstants1.packedValues[130u].x, comparisonValue2, fragmentVectorConstants1.packedValues[129u].x * comparisonValue)) + fragmentVectorConstants1.packedValues[132u].x) / multiplyAddValue23) * 0.5) + 0.5;
                    float multiplyAddValue26 = 0.5 - (((fma(fragmentVectorConstants1.packedValues[131u].y, comparisonValue3, fma(fragmentVectorConstants1.packedValues[130u].y, comparisonValue2, fragmentVectorConstants1.packedValues[129u].y * comparisonValue)) + fragmentVectorConstants1.packedValues[132u].y) / multiplyAddValue23) * 0.5);
                    uint comparisonValue14 = (fragmentVectorConstants1.packedValues[148u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[143u].z + 0.5))), int(1u)))), int(9u)));
                    uint quotientValue14 = uint(int(comparisonValue14) / int(2u));
                    float dotProductValue4 = dot(vec4(fragmentVectorConstants1.packedValues[91u]), vec4(1.0));
                    float intermediateValue99;
                    if (int(comparisonValue14) > int(0u))
                    {
                        float sumValue65;
                        float intermediateValue123;
                        uint intermediateValue124;
                        float scalarValue18 = 0.0;
                        uint scalarValue19 = 0u;
                        for (;;)
                        {
                            intermediateValue123 = scalarValue18;
                            intermediateValue124 = 0u;
                            float intermediateValue157;
                            vec4 intermediateValue125;
                            float productValue167;
                            float productValue168;
                            bool comparisonValue34;
                            for (;;)
                            {
                                intermediateValue125 = fragmentVectorConstants1.packedValues[153u];
                                productValue167 = (multiplyAddValue25 + ((float(int(intermediateValue124 - quotientValue14)) + 0.5) * intermediateValue125.x)) * fragmentVectorConstants1.packedValues[49u].x;
                                productValue168 = (multiplyAddValue26 + (intermediateValue125.x * (float(int(scalarValue19 - quotientValue14)) + 0.5))) * fragmentVectorConstants1.packedValues[49u].x;
                                comparisonValue34 = fragmentVectorConstants1.packedValues[148u].x != 0.0;
                                float branchMergedValue3;
                                if (comparisonValue34)
#endif
                                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                                    if (((int(clampedValue) <= int(scalarValue16)) && conditionValue3) || (comparisonValue91 && (int(scalarValue16) >= int(1u))))
                                    {
                                        break;
                                    }
                                    uint bitwiseValue40 = (((16u * intermediateValue96) + 784u) + 0u) >> 2u;
                                    float multiplyAddValue101 = fma(multiplyAddValue98, fragmentScalarConstants1.packedValues[bitwiseValue40], ((rdSignedBitsToFloat(scalarValue16 - comparisonValue92) + 0.5) * fragmentScalarConstants1.packedValues[612u]) * fragmentScalarConstants1.packedValues[bitwiseValue40]);
                                    float multiplyAddValue102 = fma(multiplyAddValue99, fragmentScalarConstants1.packedValues[bitwiseValue40], (sumValue120 * fragmentScalarConstants1.packedValues[612u]) * fragmentScalarConstants1.packedValues[bitwiseValue40]);
                                    vec4 sampledTextureValue48 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue101, multiplyAddValue102, scalarValue83));
                                    float scalarValue84 = sampledTextureValue48.x;
                                    float scalarValue85 = sampledTextureValue48.y;
                                    float scalarValue86 = sampledTextureValue48.z;
                                    float scalarValue87 = sampledTextureValue48.w;
                                    float multiplyAddValue103 = fract(fma(multiplyAddValue101, fragmentScalarConstants1.packedValues[614u], 0.5));
                                    float multiplyAddValue104 = fract(fma(multiplyAddValue102, fragmentScalarConstants1.packedValues[614u], 0.5));
                                    float productValue204 = spvNClamp(nonlinearValue6 * (multiplyAddValue97 - scalarValue84), 0.0, 1.0);
                                    float productValue205 = spvNClamp(nonlinearValue6 * (multiplyAddValue97 - scalarValue85), 0.0, 1.0);
                                    float productValue206 = spvNClamp(nonlinearValue6 * (multiplyAddValue97 - scalarValue86), 0.0, 1.0);
                                    float productValue207 = spvNClamp(nonlinearValue6 * (multiplyAddValue97 - scalarValue87), 0.0, 1.0);
                                    float multiplyAddValue105 = fma(-fma(productValue204, -2.0, 3.0), productValue204 * productValue204, 1.0);
                                    float multiplyAddValue106 = fma(-fma(productValue207, -2.0, 3.0), productValue207 * productValue207, 1.0);
                                    float multiplyAddValue107 = fma(multiplyAddValue103, fma(-fma(productValue206, -2.0, 3.0), productValue206 * productValue206, 1.0) - multiplyAddValue106, multiplyAddValue106);
                                    multiplyAddValue165 = intermediateValue172 + fma(multiplyAddValue104, fma(multiplyAddValue103, fma(-fma(productValue205, -2.0, 3.0), productValue205 * productValue205, 1.0) - multiplyAddValue105, multiplyAddValue105) - multiplyAddValue107, multiplyAddValue107);
                                    bool comparisonValue93 = scalarValue87 >= multiplyAddValue100;
                                    bool comparisonValue94 = scalarValue84 >= multiplyAddValue100;
                                    float comparisonValue95 = float(scalarValue85 >= multiplyAddValue100);
                                    float comparisonValue96 = float(scalarValue86 >= multiplyAddValue100);
                                    float multiplyAddValue108 = fma(multiplyAddValue103, comparisonValue93 ? (comparisonValue96 - 1.0) : comparisonValue96, float(comparisonValue93));
                                    multiplyAddValue164 = comparisonValue91 ? (comparisonValue93 ? (intermediateValue170 + 1.0) : intermediateValue170) : (intermediateValue170 + fma(multiplyAddValue104, fma(multiplyAddValue103, comparisonValue94 ? (comparisonValue95 - 1.0) : comparisonValue95, float(comparisonValue94)) - multiplyAddValue108, multiplyAddValue108));
                                    sumValue75 = scalarValue16 + 1u;
                                    intermediateValue170 = multiplyAddValue164;
                                    intermediateValue172 = multiplyAddValue165;
                                    scalarValue16 = sumValue75;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    branchMergedValue3 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue167, productValue168, dotProductValue4), 0.0).x >= multiplyAddValue24);
                                }
                                else
                                {
                                    vec4 sampledTextureValue7 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue167, productValue168, dotProductValue4));
                                    float productValue70 = fract((productValue167 * intermediateValue125.z) + 0.5);
                                    float comparisonValue16 = (sampledTextureValue7.x < multiplyAddValue24) ? 0.0 : 1.0;
                                    float comparisonValue22 = (sampledTextureValue7.w < multiplyAddValue24) ? 0.0 : 1.0;
                                    float comparisonValue23 = ((((sampledTextureValue7.z < multiplyAddValue24) ? 0.0 : 1.0) - comparisonValue22) * productValue70) + comparisonValue22;
                                    branchMergedValue3 = (((((((sampledTextureValue7.y < multiplyAddValue24) ? 0.0 : 1.0) - comparisonValue16) * productValue70) + comparisonValue16) - comparisonValue23) * fract((productValue168 * intermediateValue125.z) + 0.5)) + comparisonValue23;
                                }
                                intermediateValue157 = branchMergedValue3;
                                sumValue65 = intermediateValue157 + intermediateValue123;
                                uint sumValue25 = intermediateValue124 + 1u;
                                if (sumValue25 == comparisonValue14)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue123 = sumValue65;
                                    intermediateValue124 = sumValue25;
#endif
                                    continue;
                                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                                sumValue69 = scalarValue13 + 1u;
                                intermediateValue169 = intermediateValue170;
                                intermediateValue171 = intermediateValue172;
                                scalarValue13 = sumValue69;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            }
                            uint sumValue26 = scalarValue19 + 1u;
                            if (sumValue26 == comparisonValue14)
                            {
                                break;
                            }
                            else
                            {
                                scalarValue18 = sumValue65;
                                scalarValue19 = sumValue26;
#endif
                                continue;
                            }
#if RD_PLATFORM == RD_PLATFORM_SM50
                            float comparisonValue97 = rdSignedBitsToFloat(comparisonValue91 ? 1u : (clampedValue * clampedValue));
                            intermediateValue122 = reinterpretedBits;
                            quotientValue17 = spvNMin(intermediateValue94, intermediateValue171 / comparisonValue97);
                            quotientValue16 = spvNMin(intermediateValue93, intermediateValue169 / comparisonValue97);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        }
                        intermediateValue99 = sumValue65;
                    }
                    else
                    {
                        intermediateValue99 = 0.0;
                    }
                    float quotientValue15 = intermediateValue99 / float(int(comparisonValue14 * comparisonValue14));
                    float branchMergedValue13;
                    if (quotientValue15 < 1.0)
                    {
                        branchMergedValue13 = spvNMin(1.0, spvNMax(quotientValue15, 1.0 - fragmentVectorConstants1.packedValues[143u].w));
                    }
                    else
                    {
                        branchMergedValue13 = 1.0;
                    }
                    intermediateValue71 = branchMergedValue13;
                }
                else
                {
                    intermediateValue71 = 1.0;
                }
                float scalarValue20 = spvNMin(intermediateValue43, spvNMin(intermediateValue59, intermediateValue71));
                float productValue71 = spvNMax(0.0, fragmentVectorConstants1.packedValues[153u].y - spvNMin(fragmentVectorConstants1.packedValues[153u].y * 0.100000001490116119384765625, 8.0));
                float quotientValue18 = spvNClamp((((-0.0) - multiplyAddValue2) - productValue71) / (fragmentVectorConstants1.packedValues[153u].y - productValue71), 0.0, 1.0);
                productValue69 = (((quotientValue18 * quotientValue18) * (1.0 - scalarValue20)) * (3.0 - (quotientValue18 * 2.0))) + scalarValue20;
                intermediateValue31 = intermediateValue32;
            }
            else
            {
                productValue69 = 1.0;
                intermediateValue31 = 1.0;
            }
            float multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[74u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[74u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[74u].y, fragmentVectorConstants1.packedValues[74u].x * fragmentVectorConstants1.packedValues[4u].x)));
            float multiplyAddValue34 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[74u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[74u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[74u].y, fragmentVectorConstants1.packedValues[74u].x * fragmentVectorConstants1.packedValues[4u].y)));
            float multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[74u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[74u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[74u].y, fragmentVectorConstants1.packedValues[74u].x * fragmentVectorConstants1.packedValues[4u].z)));
            float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue27, multiplyAddValue34, multiplyAddValue35), vec3(multiplyAddValue27, multiplyAddValue34, multiplyAddValue35)));
            float productValue72 = inverseLengthValue7 * multiplyAddValue27;
            float productValue73 = inverseLengthValue7 * multiplyAddValue34;
            float productValue74 = inverseLengthValue7 * multiplyAddValue35;
            float productValue75 = fragmentVectorConstants1.packedValues[144u].x * (fragmentVectorConstants1.packedValues[134u].w * sampledTextureValue3);
            float productValue76 = productValue75 * fragmentVectorConstants1.packedValues[134u].x;
            float productValue77 = productValue75 * fragmentVectorConstants1.packedValues[134u].y;
            float productValue78 = productValue75 * fragmentVectorConstants1.packedValues[134u].z;
            float dotProductValue5 = dot(vec3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), vec3(productValue72, productValue73, productValue74));
            float scalarValue21 = spvNMax(dotProductValue5, 0.0);
            float dotProductValue6 = spvNMax(dot(vec3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), vec3(sumValue8, sumValue9, sumValue10)), 0.0);
            float sumValue27 = fragmentVectorConstants1.packedValues[156u].y + 1.0;
            float productValue79 = sumValue27 * sumValue27;
            float sumValue28 = productValue72 - quotientValue10;
            float sumValue29 = productValue73 - quotientValue11;
            float sumValue30 = productValue74 - quotientValue12;
            float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue28, sumValue29, sumValue30), vec3(sumValue28, sumValue29, sumValue30)));
            float productValue80 = inverseLengthValue8 * sumValue28;
            float productValue81 = inverseLengthValue8 * sumValue29;
            float productValue82 = inverseLengthValue8 * sumValue30;
            float scalarValue22 = spvNMax(intermediateValue6, 0.0500000007450580596923828125);
            float productValue83 = scalarValue22 * scalarValue22;
            float productValue84 = productValue83 * productValue83;
            float dotProductValue7 = spvNMax(dot(vec3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), vec3(productValue80, productValue81, productValue82)), 0.0);
            float productValue85 = ((dotProductValue7 * dotProductValue7) * (productValue84 + (-1.0))) + 1.0;
            float productValue86 = productValue83 * 0.5;
            float sumValue32 = 1.0 - productValue86;
            float sumValue33 = productValue86 + 9.9999997473787516355514526367188e-05;
            float dotProductValue8 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue8, sumValue9, sumValue10), vec3(productValue80, productValue81, productValue82)), 0.0), 0.0, 1.0);
            float productValue87 = dotProductValue8 * dotProductValue8;
            float productValue88 = (productValue87 * productValue87) * dotProductValue8;
            float productValue89 = (productValue88 * (1.0 - productValue35)) + productValue35;
            float productValue90 = (productValue88 * (1.0 - productValue36)) + productValue36;
            float productValue91 = (productValue88 * (1.0 - productValue37)) + productValue37;
            float quotientValue19 = ((dotProductValue6 / ((sumValue32 * dotProductValue6) + sumValue33)) * (productValue84 / ((productValue85 * productValue85) * 3.1415927410125732421875))) * (scalarValue21 / ((sumValue32 * scalarValue21) + sumValue33));
            float productValue92 = ((scalarValue21 * 4.0) * dotProductValue6) + 9.9999997473787516355514526367188e-05;
            float quotientValue20 = (((spvNMax((dotProductValue5 + fragmentVectorConstants1.packedValues[156u].y) / productValue79, 0.0) - scalarValue21) * productValue38) + scalarValue21) * productValue69;
            float dotProductValue9 = (intermediateValue31 * productValue38) * spvNMax((dot(vec3((-0.0) - multiplyAddValue11, (-0.0) - multiplyAddValue12, (-0.0) - multiplyAddValue13), vec3(productValue72, productValue73, productValue74)) + fragmentVectorConstants1.packedValues[156u].y) / productValue79, 0.0);
            float productValue93 = sumValue6 * 0.3183098733425140380859375;
            float productValue94 = fragmentVectorConstants1.packedValues[136u].y * (scalarValue21 * productValue69);
            intermediateValue17 = (productValue94 * productValue76) * ((productValue89 * quotientValue19) / productValue92);
            intermediateValue19 = (productValue94 * productValue77) * ((productValue90 * quotientValue19) / productValue92);
            intermediateValue21 = (productValue94 * productValue78) * ((productValue91 * quotientValue19) / productValue92);
            intermediateValue23 = (((productValue93 * exponentialValue) * productValue76) * fragmentVectorConstants1.packedValues[136u].x) * (((1.0 - productValue89) * quotientValue20) + dotProductValue9);
            intermediateValue25 = (((productValue93 * exponentialValue1) * productValue77) * fragmentVectorConstants1.packedValues[136u].x) * (((1.0 - productValue90) * quotientValue20) + dotProductValue9);
            intermediateValue27 = (((productValue93 * exponentialValue2) * productValue78) * fragmentVectorConstants1.packedValues[136u].x) * (((1.0 - productValue91) * quotientValue20) + dotProductValue9);
        }
        float intermediateValue28;
        float intermediateValue29;
        float intermediateValue30;
        if (fragmentVectorConstants1.packedValues[144u].w != 0.0)
        {
            float productValue95 = ((varyingTexCoord3.x + (-0.5)) + (productValue9 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[128u].x;
            float productValue96 = ((varyingTexCoord3.y + (-0.5)) + (productValue10 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[128u].y;
            float productValue97 = ((varyingTexCoord3.z + (-0.5)) + (productValue11 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[128u].z;
            float productValue102 = floor(productValue95 * 0.0625) * 16.0;
            float productValue103 = floor(productValue96 * 0.0625) * 16.0;
            float productValue104 = floor(productValue97 * 0.0625) * 16.0;
            uint productValue105 = uint(int(floor(float(int(uint(int(floor(productValue95))))) * 0.0625)));
            uint productValue106 = uint(int(floor(float(int(uint(int(floor(productValue96))))) * 0.0625)));
            uint productValue107 = uint(int(floor(float(int(uint(int(floor(productValue97))))) * 0.0625)));
            float sumValue34 = productValue95 - productValue102;
            float sumValue35 = productValue96 - productValue103;
            float sumValue36 = productValue97 - productValue104;
            uint bitwiseValue1 = (productValue106 << 16u) | (productValue105 & 65535u);
            uint bitwiseValue2 = productValue107 & 65535u;
            uint productValue108 = productValue105 * 1540483477u;
            uint productValue109 = productValue106 * 1540483477u;
            uint productValue110 = productValue107 * 1540483477u;
            uint bitwiseValue3 = ((((((((productValue108 >> 24u) ^ productValue108) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue109 >> 24u) ^ productValue109) * 1540483477u)) * 1540483477u) ^ (((productValue110 >> 24u) ^ productValue110) * 1540483477u)) * 1540483477u;
            uint bitwiseValue4 = ((bitwiseValue3 >> 13u) ^ bitwiseValue3) * 1540483477u;
            uint bitwiseValue5 = (bitwiseValue4 >> 15u) ^ bitwiseValue4;
            uint bitwiseValue6 = bitwiseValue5 >> 16u;
            uint bitwiseValue8 = bitwiseValue5 & 65535u;
            uint comparisonValue26 = uint(bitwiseValue8 == bitwiseValue6) | (bitwiseValue8 ^ bitwiseValue6);
            uint sumValue46 = uint(fragmentVectorConstants1.packedValues[76u].x) + 4294967295u;
            bool intermediateValue51;
            uint scalarValue23 = comparisonValue26;
            uint scalarValue24 = 0u;
            uint scalarValue25 = 0u;
            uint sampledTextureValue4;
            uint bitwiseValue7;
            for (;;)
            {
                bitwiseValue7 = scalarValue23 & sumValue46;
                uint sampledTextureValue8 = texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 2u)).x & 65535u;
                bool sampledTextureValue9 = (texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 1u)).x == bitwiseValue2) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue7 * 4u)).x == bitwiseValue1) && (sampledTextureValue8 == comparisonValue26));
                sampledTextureValue4 = sampledTextureValue9 ? texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 3u)).x : scalarValue24;
                if ((sampledTextureValue8 == 0u) || sampledTextureValue9)
                {
                    intermediateValue51 = sampledTextureValue9;
                    break;
                }
                else
                {
                    uint sumValue47 = scalarValue25 + 1u;
                    if (int(sumValue47) < int(8u))
                    {
                        scalarValue23 = bitwiseValue7 + 1u;
                        scalarValue24 = sampledTextureValue4;
                        scalarValue25 = sumValue47;
                        continue;
                    }
                    else
                    {
                        intermediateValue51 = false;
                        break;
                    }
                }
            }
            uint bitwiseValue11 = sampledTextureValue4 >> 2u;
            float branchMergedValue9;
            float branchMergedValue16;
            float branchMergedValue17;
            if (intermediateValue51)
            {
                float scalarValue26 = abs(productValue9);
                float scalarValue27 = abs(productValue10);
                float scalarValue28 = abs(productValue11);
                float branchMergedValue45;
                float branchMergedValue47;
                float branchMergedValue48;
                if (((scalarValue26 >= 1.0) || (scalarValue27 >= 1.0)) || (scalarValue28 >= 1.0))
                {
                    float intermediateValue158;
                    float intermediateValue159;
                    float intermediateValue160;
                    float intermediateValue161;
                    float intermediateValue163;
                    float intermediateValue165;
                    float intermediateValue167;
                    float intermediateValue169;
                    float intermediateValue171;
                    float intermediateValue173;
                    float intermediateValue174;
                    float intermediateValue175;
                    float productValue134;
                    float productValue135;
                    float productValue136;
                    float sumValue37;
                    float sumValue38;
                    float sumValue39;
                    float sumValue40;
                    float sumValue41;
                    float sumValue42;
                    float sumValue43;
                    float sumValue44;
                    float sumValue45;
                    float productValue137;
                    float productValue138;
                    float productValue139;
                    float productValue140;
                    bool comparisonValue15;
                    for (;;)
                    {
                        float dotProductValue10 = dot(vec3(sumValue34, sumValue35, sumValue36), vec3(scalarValue26, scalarValue27, scalarValue28));
                        float dotProductValue11 = dot(vec3(sumValue34, sumValue35, sumValue36), vec3(scalarValue28, scalarValue26, scalarValue27));
                        float dotProductValue12 = dot(vec3(sumValue34, sumValue35, sumValue36), vec3(scalarValue27, scalarValue28, scalarValue26));
                        float comparisonValue29 = ((inverseLengthValue * ((intermediateValue9 + intermediateValue8) + intermediateValue10)) > 0.0) ? ceil(dotProductValue10) : floor(dotProductValue10);
                        float scalarValue29 = floor(dotProductValue11);
                        float scalarValue30 = floor(dotProductValue12);
                        productValue134 = ((comparisonValue29 * scalarValue26) + (scalarValue29 * scalarValue28)) + (scalarValue30 * scalarValue27);
                        productValue135 = ((comparisonValue29 * scalarValue27) + (scalarValue29 * scalarValue26)) + (scalarValue30 * scalarValue28);
                        productValue136 = ((comparisonValue29 * scalarValue28) + (scalarValue29 * scalarValue27)) + (scalarValue30 * scalarValue26);
                        sumValue37 = productValue134 + scalarValue28;
                        sumValue38 = productValue135 + scalarValue26;
                        sumValue39 = productValue136 + scalarValue27;
                        sumValue40 = productValue134 + scalarValue27;
                        sumValue41 = productValue135 + scalarValue28;
                        sumValue42 = productValue136 + scalarValue26;
                        sumValue43 = sumValue37 + scalarValue27;
                        sumValue44 = sumValue41 + scalarValue26;
                        sumValue45 = sumValue39 + scalarValue26;
                        float sumValue48 = dotProductValue11 - scalarValue29;
                        float sumValue49 = dotProductValue12 - scalarValue30;
                        float sumValue50 = 1.0 - sumValue48;
                        float sumValue51 = 1.0 - sumValue49;
                        productValue137 = sumValue51 * sumValue50;
                        productValue138 = sumValue51 * sumValue48;
                        productValue139 = sumValue50 * sumValue49;
                        productValue140 = sumValue49 * sumValue48;
                        comparisonValue15 = ((productValue136 >= 0.0) && ((productValue134 >= 0.0) && (productValue135 >= 0.0))) && ((sumValue45 < 16.0) && ((sumValue43 < 16.0) && (sumValue44 < 16.0)));
                        if (comparisonValue15)
                        {
                            uvec4 sampledTextureValue10 = texelFetch(voxelBuffer, int(((uint(productValue135) + bitwiseValue11) + (uint(productValue136) << 4u)) + (uint(productValue134) << 8u)));
                            uint scalarValue31 = sampledTextureValue10.x;
                            float bitwiseValue13;
                            float intermediateValue115;
                            float intermediateValue116;
                            if (scalarValue31 == 0u)
                            {
                                bitwiseValue13 = 0.0;
                                intermediateValue115 = 0.0;
                                intermediateValue116 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue12 = float(scalarValue31 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue13 = bitwiseValue12 * float(scalarValue31 & 255u);
                                intermediateValue115 = bitwiseValue12 * float((scalarValue31 >> 8u) & 255u);
                                intermediateValue116 = bitwiseValue12 * float((scalarValue31 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue11 = texelFetch(voxelBuffer, int(((uint(sumValue38) + bitwiseValue11) + (uint(sumValue39) << 4u)) + (uint(sumValue37) << 8u)));
                            uint scalarValue32 = sampledTextureValue11.x;
                            float bitwiseValue17;
                            float intermediateValue126;
                            float intermediateValue127;
                            if (scalarValue32 == 0u)
                            {
                                bitwiseValue17 = 0.0;
                                intermediateValue126 = 0.0;
                                intermediateValue127 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue14 = float(scalarValue32 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue17 = bitwiseValue14 * float(scalarValue32 & 255u);
                                intermediateValue126 = bitwiseValue14 * float((scalarValue32 >> 8u) & 255u);
                                intermediateValue127 = bitwiseValue14 * float((scalarValue32 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue14 = texelFetch(voxelBuffer, int(((uint(sumValue41) + bitwiseValue11) + (uint(sumValue42) << 4u)) + (uint(sumValue40) << 8u)));
                            uint scalarValue33 = sampledTextureValue14.x;
                            float bitwiseValue21;
                            float intermediateValue144;
                            float intermediateValue145;
                            if (scalarValue33 == 0u)
                            {
                                bitwiseValue21 = 0.0;
                                intermediateValue144 = 0.0;
                                intermediateValue145 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue16 = float(scalarValue33 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue21 = bitwiseValue16 * float(scalarValue33 & 255u);
                                intermediateValue144 = bitwiseValue16 * float((scalarValue33 >> 8u) & 255u);
                                intermediateValue145 = bitwiseValue16 * float((scalarValue33 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue15 = texelFetch(voxelBuffer, int(((uint(sumValue44) + bitwiseValue11) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u)));
                            uint scalarValue34 = sampledTextureValue15.x;
                            float branchMergedValue14;
                            float branchMergedValue23;
                            float branchMergedValue24;
                            float branchMergedValue25;
                            float branchMergedValue26;
                            float branchMergedValue27;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            float branchMergedValue30;
                            float branchMergedValue31;
                            float branchMergedValue41;
                            float branchMergedValue42;
                            if (scalarValue34 == 0u)
                            {
                                branchMergedValue14 = bitwiseValue21;
                                branchMergedValue23 = intermediateValue127;
                                branchMergedValue24 = intermediateValue126;
                                branchMergedValue25 = bitwiseValue17;
                                branchMergedValue26 = intermediateValue116;
                                branchMergedValue27 = intermediateValue115;
                                branchMergedValue28 = bitwiseValue13;
                                branchMergedValue29 = intermediateValue145;
                                branchMergedValue30 = 0.0;
                                branchMergedValue31 = 0.0;
                                branchMergedValue41 = 0.0;
                                branchMergedValue42 = intermediateValue144;
                            }
                            else
                            {
                                float bitwiseValue18 = float(scalarValue34 >> 24u) * 9.2272217443678528070449829101562e-05;
                                branchMergedValue14 = bitwiseValue21;
                                branchMergedValue23 = intermediateValue127;
                                branchMergedValue24 = intermediateValue126;
                                branchMergedValue25 = bitwiseValue17;
                                branchMergedValue26 = intermediateValue116;
                                branchMergedValue27 = intermediateValue115;
                                branchMergedValue28 = bitwiseValue13;
                                branchMergedValue29 = intermediateValue145;
                                branchMergedValue30 = bitwiseValue18 * float(scalarValue34 & 255u);
                                branchMergedValue31 = bitwiseValue18 * float((scalarValue34 >> 8u) & 255u);
                                branchMergedValue41 = bitwiseValue18 * float((scalarValue34 >> 16u) & 255u);
                                branchMergedValue42 = intermediateValue144;
                            }
                            intermediateValue158 = branchMergedValue28;
                            intermediateValue159 = branchMergedValue27;
                            intermediateValue160 = branchMergedValue26;
                            intermediateValue161 = branchMergedValue25;
                            intermediateValue163 = branchMergedValue24;
                            intermediateValue165 = branchMergedValue23;
                            intermediateValue167 = branchMergedValue14;
                            intermediateValue169 = branchMergedValue42;
                            intermediateValue171 = branchMergedValue29;
                            intermediateValue173 = branchMergedValue30;
                            intermediateValue174 = branchMergedValue31;
                            intermediateValue175 = branchMergedValue41;
                            break;
#endif
                        }
                        else
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            intermediateValue122 = intermediateValue96 + 1u;
                            quotientValue17 = intermediateValue94;
                            quotientValue16 = intermediateValue93;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            float intermediateValue129;
                            float intermediateValue130;
                            float intermediateValue131;
                            float sumValue66;
                            float sumValue67;
                            float sumValue68;
                            uint comparisonValue24;
                            bool comparisonValue25;
                            for (;;)
                            {
                                sumValue66 = productValue134 + productValue102;
                                sumValue67 = productValue135 + productValue103;
                                sumValue68 = productValue136 + productValue104;
                                uint comparisonValue32 = ((((uint(productValue134 >= 16.0) << 1u) | uint(productValue134 < 0.0)) | (uint(productValue135 < 0.0) << 2u)) | (uint(productValue135 >= 16.0) << 3u)) | (uint(productValue136 < 0.0) << 4u);
                                comparisonValue24 = intermediateValue[comparisonValue32 | (uint(productValue136 >= 16.0) << 5u)];
                                comparisonValue25 = ((((comparisonValue32 | (uint(productValue136 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue32 & 31u))) == 0u;
                                uint sampledTextureValue21;
                                if (comparisonValue25)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue11 + 4096u)).x & (1u << (comparisonValue24 & 31u))) == 0u)
                                    {
                                        intermediateValue129 = 0.0;
                                        intermediateValue130 = 0.0;
                                        intermediateValue131 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue21 = ((((uint(sumValue66 - (floor(sumValue66 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue67 - (floor(sumValue67 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue68 - (floor(sumValue68 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue11 + 4097u) + comparisonValue24)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue21 = ((((uint(productValue136) << 4u) & 240u) | (uint(productValue135) & 15u)) | ((uint(productValue134) << 8u) & 3840u)) + bitwiseValue11;
                                }
                                uvec4 sampledTextureValue16 = texelFetch(voxelBuffer, int(sampledTextureValue21));
                                uint scalarValue35 = sampledTextureValue16.x;
                                if (scalarValue35 == 0u)
                                {
                                    intermediateValue129 = 0.0;
                                    intermediateValue130 = 0.0;
                                    intermediateValue131 = 0.0;
                                    break;
                                }
                                float bitwiseValue20 = float(scalarValue35 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue129 = bitwiseValue20 * float(scalarValue35 & 255u);
                                intermediateValue130 = bitwiseValue20 * float((scalarValue35 >> 8u) & 255u);
                                intermediateValue131 = bitwiseValue20 * float((scalarValue35 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue162;
                            float intermediateValue164;
                            float intermediateValue166;
                            float sumValue87;
                            float sumValue88;
                            float sumValue89;
                            uint comparisonValue36;
                            bool comparisonValue37;
                            for (;;)
                            {
                                sumValue87 = sumValue37 + productValue102;
                                sumValue88 = sumValue38 + productValue103;
                                sumValue89 = sumValue39 + productValue104;
                                uint comparisonValue33 = ((((uint(sumValue37 >= 16.0) << 1u) | uint(sumValue37 < 0.0)) | (uint(sumValue38 < 0.0) << 2u)) | (uint(sumValue38 >= 16.0) << 3u)) | (uint(sumValue39 < 0.0) << 4u);
                                comparisonValue36 = intermediateValue[comparisonValue33 | (uint(sumValue39 >= 16.0) << 5u)];
                                comparisonValue37 = ((((comparisonValue33 | (uint(sumValue39 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue33 & 31u))) == 0u;
                                uint sampledTextureValue30;
                                if (comparisonValue37)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue11 + 4096u)).x & (1u << (comparisonValue36 & 31u))) == 0u)
                                    {
                                        intermediateValue162 = 0.0;
                                        intermediateValue164 = 0.0;
                                        intermediateValue166 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue30 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue11 + 4097u) + comparisonValue36)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue30 = ((((uint(sumValue39) << 4u) & 240u) | (uint(sumValue38) & 15u)) | ((uint(sumValue37) << 8u) & 3840u)) + bitwiseValue11;
                                }
                                uvec4 sampledTextureValue17 = texelFetch(voxelBuffer, int(sampledTextureValue30));
                                uint scalarValue36 = sampledTextureValue17.x;
                                if (scalarValue36 == 0u)
                                {
                                    intermediateValue162 = 0.0;
                                    intermediateValue164 = 0.0;
                                    intermediateValue166 = 0.0;
                                    break;
                                }
                                float bitwiseValue22 = float(scalarValue36 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue162 = bitwiseValue22 * float(scalarValue36 & 255u);
                                intermediateValue164 = bitwiseValue22 * float((scalarValue36 >> 8u) & 255u);
                                intermediateValue166 = bitwiseValue22 * float((scalarValue36 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue168;
                            float intermediateValue170;
                            float intermediateValue172;
                            float sumValue96;
                            float sumValue97;
                            float sumValue98;
                            uint comparisonValue46;
                            bool comparisonValue47;
                            for (;;)
                            {
                                sumValue96 = sumValue40 + productValue102;
                                sumValue97 = sumValue41 + productValue103;
                                sumValue98 = sumValue42 + productValue104;
                                uint comparisonValue35 = ((((uint(sumValue40 >= 16.0) << 1u) | uint(sumValue40 < 0.0)) | (uint(sumValue41 < 0.0) << 2u)) | (uint(sumValue41 >= 16.0) << 3u)) | (uint(sumValue42 < 0.0) << 4u);
                                comparisonValue46 = intermediateValue[comparisonValue35 | (uint(sumValue42 >= 16.0) << 5u)];
                                comparisonValue47 = ((((comparisonValue35 | (uint(sumValue42 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue35 & 31u))) == 0u;
                                uint sampledTextureValue34;
                                if (comparisonValue47)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue11 + 4096u)).x & (1u << (comparisonValue46 & 31u))) == 0u)
                                    {
                                        intermediateValue168 = 0.0;
                                        intermediateValue170 = 0.0;
                                        intermediateValue172 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue34 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue11 + 4097u) + comparisonValue46)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue34 = ((((uint(sumValue42) << 4u) & 240u) | (uint(sumValue41) & 15u)) | ((uint(sumValue40) << 8u) & 3840u)) + bitwiseValue11;
                                }
                                uvec4 sampledTextureValue18 = texelFetch(voxelBuffer, int(sampledTextureValue34));
                                uint scalarValue37 = sampledTextureValue18.x;
                                if (scalarValue37 == 0u)
                                {
                                    intermediateValue168 = 0.0;
                                    intermediateValue170 = 0.0;
                                    intermediateValue172 = 0.0;
                                    break;
                                }
                                float bitwiseValue23 = float(scalarValue37 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue168 = bitwiseValue23 * float(scalarValue37 & 255u);
                                intermediateValue170 = bitwiseValue23 * float((scalarValue37 >> 8u) & 255u);
                                intermediateValue172 = bitwiseValue23 * float((scalarValue37 >> 16u) & 255u);
                                break;
                            }
                            float sumValue59 = sumValue43 + productValue102;
                            float sumValue60 = sumValue44 + productValue103;
                            float sumValue61 = sumValue45 + productValue104;
                            uint comparisonValue38 = ((((uint(sumValue43 >= 16.0) << 1u) | uint(sumValue43 < 0.0)) | (uint(sumValue44 < 0.0) << 2u)) | (uint(sumValue44 >= 16.0) << 3u)) | (uint(sumValue45 < 0.0) << 4u);
                            uint comparisonValue41 = comparisonValue38 | (uint(sumValue45 >= 16.0) << 5u);
                            uint sampledTextureValue38;
                            if ((((comparisonValue41 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue38 & 31u))) == 0u)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue11 + 4096u)).x & (1u << (intermediateValue[comparisonValue41] & 31u))) == 0u)
                                {
                                    intermediateValue158 = intermediateValue129;
                                    intermediateValue159 = intermediateValue130;
                                    intermediateValue160 = intermediateValue131;
                                    intermediateValue161 = intermediateValue162;
                                    intermediateValue163 = intermediateValue164;
                                    intermediateValue165 = intermediateValue166;
                                    intermediateValue167 = intermediateValue168;
                                    intermediateValue169 = intermediateValue170;
                                    intermediateValue171 = intermediateValue172;
                                    intermediateValue173 = 0.0;
                                    intermediateValue174 = 0.0;
                                    intermediateValue175 = 0.0;
                                    break;
                                }
                                sampledTextureValue38 = ((((uint(sumValue59 - (floor(sumValue59 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue60 - (floor(sumValue60 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue61 - (floor(sumValue61 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue11 + 4097u) + intermediateValue[comparisonValue41])).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue38 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue11;
                            }
                            uvec4 sampledTextureValue19 = texelFetch(voxelBuffer, int(sampledTextureValue38));
                            uint scalarValue38 = sampledTextureValue19.x;
                            if (scalarValue38 == 0u)
                            {
                                intermediateValue158 = intermediateValue129;
                                intermediateValue159 = intermediateValue130;
                                intermediateValue160 = intermediateValue131;
                                intermediateValue161 = intermediateValue162;
                                intermediateValue163 = intermediateValue164;
                                intermediateValue165 = intermediateValue166;
                                intermediateValue167 = intermediateValue168;
                                intermediateValue169 = intermediateValue170;
                                intermediateValue171 = intermediateValue172;
                                intermediateValue173 = 0.0;
                                intermediateValue174 = 0.0;
                                intermediateValue175 = 0.0;
                                break;
                            }
                            float bitwiseValue25 = float(scalarValue38 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue158 = intermediateValue129;
                            intermediateValue159 = intermediateValue130;
                            intermediateValue160 = intermediateValue131;
                            intermediateValue161 = intermediateValue162;
                            intermediateValue163 = intermediateValue164;
                            intermediateValue165 = intermediateValue166;
                            intermediateValue167 = intermediateValue168;
                            intermediateValue169 = intermediateValue170;
                            intermediateValue171 = intermediateValue172;
                            intermediateValue173 = bitwiseValue25 * float(scalarValue38 & 255u);
                            intermediateValue174 = bitwiseValue25 * float((scalarValue38 >> 8u) & 255u);
                            intermediateValue175 = bitwiseValue25 * float((scalarValue38 >> 16u) & 255u);
                            break;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        intermediateValue93 = quotientValue16;
                        intermediateValue94 = quotientValue17;
                        intermediateValue96 = intermediateValue122;
                        continue;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    sumValue14 = scalarValue7 + 1u;
                    intermediateValue92 = intermediateValue93;
                    intermediateValue70 = intermediateValue94;
                    scalarValue6 = intermediateValue96;
                    scalarValue7 = sumValue14;
                    continue;
                }
                float intermediateValue125;
                if (int(uint(int(fragmentScalarConstants1.packedValues[228u]))) > int(0u))
                {
                    float multiplyAddValue109 = fma(fma(fragmentVectorConstants1.packedValues[140u].x, multiplyAddValue94, fma(fragmentVectorConstants1.packedValues[138u].x, multiplyAddValue92, multiplyAddValue93 * fragmentVectorConstants1.packedValues[139u].x)) + fragmentVectorConstants1.packedValues[141u].x, 0.5, 0.5) * fragmentScalarConstants1.packedValues[229u];
                    float multiplyAddValue110 = (1.0 - fma(fma(fragmentVectorConstants1.packedValues[140u].y, multiplyAddValue94, fma(fragmentVectorConstants1.packedValues[138u].y, multiplyAddValue92, multiplyAddValue93 * fragmentVectorConstants1.packedValues[139u].y)) + fragmentVectorConstants1.packedValues[141u].y, 0.5, 0.5)) * fragmentScalarConstants1.packedValues[229u];
                    float comparisonValue28;
                    if ((((multiplyAddValue109 >= 0.0) && (multiplyAddValue109 < fragmentScalarConstants1.packedValues[229u])) && (multiplyAddValue110 >= 0.0)) && (multiplyAddValue110 < fragmentScalarConstants1.packedValues[229u]))
                    {
                        float scalarValue88 = spvNMin(spvNMax(productValue203, fragmentScalarConstants1.packedValues[312u]), 1.0);
                        float multiplyAddValue111 = spvNMin((fma(fragmentVectorConstants1.packedValues[140u].z, multiplyAddValue94, fma(fragmentVectorConstants1.packedValues[138u].z, multiplyAddValue92, multiplyAddValue93 * fragmentVectorConstants1.packedValues[139u].z)) + fragmentVectorConstants1.packedValues[141u].z) - fma(fragmentScalarConstants1.packedValues[198u], sqrt(fma(-scalarValue88, scalarValue88, 1.0)) / scalarValue88, fragmentScalarConstants1.packedValues[197u]), 1.0);
                        bool conditionValue4 = !comparisonValue91;
                        float sumValue121 = rdDot4Precise(fragmentVectorConstants1.packedValues[91u], vec4(1.0)) + 1.0;
                        uint comparisonValue98 = comparisonValue91 ? 0u : 4294967295u;
                        float intermediateValue149;
                        intermediateValue149 = 0.0;
                        uint sumValue52;
                        float intermediateValue150;
                        uint scalarValue19 = 0u;
                        for (;;)
                        {
                            if ((comparisonValue91 && (int(scalarValue19) >= int(1u))) || ((int(scalarValue19) >= int(2u)) && conditionValue4))
                            {
                                break;
                            }
                            float sumValue122 = rdSignedBitsToFloat(comparisonValue98 + scalarValue19) + 0.5;
                            intermediateValue150 = intermediateValue149;
                            uint sumValue72;
                            float sampledTextureValue12;
                            uint scalarValue24 = 0u;
                            for (;;)
                            {
                                if ((comparisonValue91 && (int(scalarValue24) >= int(1u))) || (conditionValue4 && (int(scalarValue24) >= int(2u))))
                                {
                                    break;
                                }
                                float multiplyAddValue112 = fma((rdSignedBitsToFloat(comparisonValue98 + scalarValue24) + 0.5) * fragmentScalarConstants1.packedValues[230u], fragmentScalarConstants1.packedValues[229u], multiplyAddValue109);
                                float multiplyAddValue113 = fma(sumValue122 * fragmentScalarConstants1.packedValues[230u], fragmentScalarConstants1.packedValues[229u], multiplyAddValue110);
                                if (comparisonValue91)
                                {
                                    sampledTextureValue12 = (textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue112, multiplyAddValue113, sumValue121), 0.0).x >= multiplyAddValue111) ? (intermediateValue150 + 1.0) : intermediateValue150;
                                }
                                else
                                {
                                    vec4 sampledTextureValue49 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue112, multiplyAddValue113, sumValue121));
                                    float multiplyAddValue117 = fract(fma(multiplyAddValue112, fragmentScalarConstants1.packedValues[614u], 0.5));
                                    bool comparisonValue99 = sampledTextureValue49.x >= multiplyAddValue111;
                                    bool comparisonValue100 = sampledTextureValue49.w >= multiplyAddValue111;
                                    float comparisonValue101 = float(sampledTextureValue49.y >= multiplyAddValue111);
                                    float comparisonValue102 = float(sampledTextureValue49.z >= multiplyAddValue111);
                                    float multiplyAddValue118 = fma(multiplyAddValue117, comparisonValue100 ? (comparisonValue102 - 1.0) : comparisonValue102, float(comparisonValue100));
                                    sampledTextureValue12 = intermediateValue150 + fma(fract(fma(multiplyAddValue113, fragmentScalarConstants1.packedValues[614u], 0.5)), fma(multiplyAddValue117, comparisonValue99 ? (comparisonValue101 - 1.0) : comparisonValue101, float(comparisonValue99)) - multiplyAddValue118, multiplyAddValue118);
                                }
                                sumValue72 = scalarValue24 + 1u;
                                intermediateValue150 = sampledTextureValue12;
                                scalarValue24 = sumValue72;
                                continue;
                            }
                            sumValue52 = scalarValue19 + 1u;
                            intermediateValue149 = intermediateValue150;
                            scalarValue19 = sumValue52;
                            continue;
                        }
                        comparisonValue28 = intermediateValue149 / (comparisonValue91 ? 1.0 : 4.0);
                    }
                    else
                    {
                        comparisonValue28 = 1.0;
                    }
                    intermediateValue125 = comparisonValue28;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue45 = (((intermediateValue165 * productValue138) + (intermediateValue160 * productValue137)) + (intermediateValue171 * productValue139)) + (intermediateValue175 * productValue140);
                    branchMergedValue47 = (((intermediateValue163 * productValue138) + (intermediateValue159 * productValue137)) + (intermediateValue169 * productValue139)) + (intermediateValue174 * productValue140);
                    branchMergedValue48 = (((intermediateValue161 * productValue138) + (intermediateValue158 * productValue137)) + (intermediateValue167 * productValue139)) + (intermediateValue173 * productValue140);
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue125 = 1.0;
                }
                float comparisonValue31;
                if ((int(uint(int(fragmentScalarConstants1.packedValues[532u]))) > int(0u)) && (int(uint(int(fragmentScalarConstants1.packedValues[309u]))) > int(0u)))
                {
                    float multiplyAddValue119 = fma(fragmentVectorConstants1.packedValues[131u].w, multiplyAddValue94, fma(fragmentVectorConstants1.packedValues[129u].w, multiplyAddValue92, multiplyAddValue93 * fragmentVectorConstants1.packedValues[130u].w)) + fragmentVectorConstants1.packedValues[132u].w;
                    float scalarValue89 = spvNMin(spvNMax(productValue203, fragmentScalarConstants1.packedValues[312u]), 1.0);
                    float multiplyAddValue120 = ((fma(fragmentVectorConstants1.packedValues[131u].z, multiplyAddValue94, fma(fragmentVectorConstants1.packedValues[129u].z, multiplyAddValue92, multiplyAddValue93 * fragmentVectorConstants1.packedValues[130u].z)) + fragmentVectorConstants1.packedValues[132u].z) / multiplyAddValue119) - (fma(fragmentScalarConstants1.packedValues[198u], sqrt(fma(-scalarValue89, scalarValue89, 1.0)) / scalarValue89, fragmentScalarConstants1.packedValues[197u]) / (multiplyAddValue119 / multiplyAddValue119));
                    float multiplyAddValue121 = fma((fma(fragmentVectorConstants1.packedValues[131u].x, multiplyAddValue94, fma(fragmentVectorConstants1.packedValues[129u].x, multiplyAddValue92, multiplyAddValue93 * fragmentVectorConstants1.packedValues[130u].x)) + fragmentVectorConstants1.packedValues[132u].x) / multiplyAddValue119, 0.5, 0.5);
                    float multiplyAddValue122 = 1.0 - fma((fma(fragmentVectorConstants1.packedValues[131u].y, multiplyAddValue94, fma(fragmentVectorConstants1.packedValues[129u].y, multiplyAddValue92, multiplyAddValue93 * fragmentVectorConstants1.packedValues[130u].y)) + fragmentVectorConstants1.packedValues[132u].y) / multiplyAddValue119, 0.5, 0.5);
                    uint clampedValue1 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[574u] + 0.5))), int(1u), int(9u)));
                    bool conditionValue5 = !comparisonValue91;
                    uint comparisonValue103 = (comparisonValue91 ? 1u : clampedValue1) >> 1u;
                    float scalarValue90 = rdDot4Precise(fragmentVectorConstants1.packedValues[91u], vec4(1.0));
                    float intermediateValue152;
                    intermediateValue152 = 0.0;
                    uint sumValue53;
                    float intermediateValue153;
                    uint scalarValue25 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float intermediateValue177;
                    float intermediateValue178;
                    float intermediateValue179;
                    float intermediateValue180;
                    float intermediateValue182;
                    float intermediateValue184;
                    float intermediateValue186;
                    float intermediateValue188;
                    float intermediateValue190;
                    float intermediateValue192;
                    float intermediateValue193;
                    float intermediateValue194;
                    float intermediateValue83;
                    float intermediateValue84;
                    float intermediateValue85;
                    uint intermediateValue86;
                    uint intermediateValue87;
                    uint intermediateValue88;
                    float intermediateValue91;
                    float sumValue53;
                    float sumValue54;
                    float sumValue55;
                    float sumValue56;
                    float sumValue57;
                    float sumValue58;
                    bool comparisonValue17;
                    uint productValue141;
                    uint productValue142;
                    uint productValue143;
                    uint productValue144;
                    uint productValue145;
                    uint productValue146;
#endif
                    for (;;)
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        if ((comparisonValue91 && (int(scalarValue25) >= int(1u))) || (conditionValue5 && (int(clampedValue1) <= int(scalarValue25))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        intermediateValue83 = floor(sumValue34);
                        intermediateValue84 = floor(sumValue35);
                        intermediateValue85 = floor(sumValue36);
                        float sumValue62 = sumValue34 - intermediateValue83;
                        float sumValue64 = sumValue35 - intermediateValue84;
                        float sumValue79 = sumValue36 - intermediateValue85;
                        uint comparisonValue42 = ((uint(sumValue64 >= sumValue79) << 1u) | uint(sumValue62 >= sumValue64)) | (uint(sumValue62 >= sumValue79) << 2u);
                        intermediateValue86 = uint(intermediateValue83);
                        intermediateValue87 = uint(intermediateValue84);
                        intermediateValue88 = uint(intermediateValue85);
                        float scalarValue39 = spvNMin(sumValue62, sumValue64);
                        float scalarValue40 = spvNMax(sumValue62, sumValue64);
                        intermediateValue91 = spvNMin(scalarValue39, sumValue79);
                        float scalarValue41 = spvNMax(scalarValue40, sumValue79);
                        float scalarValue42 = spvNMax(spvNMin(scalarValue40, sumValue79), scalarValue39);
                        sumValue53 = 1.0 - scalarValue41;
                        sumValue54 = scalarValue41 - scalarValue42;
                        sumValue55 = scalarValue42 - intermediateValue91;
                        sumValue56 = intermediateValue83 + 1.0;
                        sumValue57 = intermediateValue84 + 1.0;
                        sumValue58 = intermediateValue85 + 1.0;
                        comparisonValue17 = (((intermediateValue83 >= 0.0) && (intermediateValue84 >= 0.0)) && (intermediateValue85 >= 0.0)) && (((sumValue56 < 16.0) && (sumValue57 < 16.0)) && (sumValue58 < 16.0));
                        productValue141 = 0u + (comparisonValue42 * 3u);
                        productValue142 = 1u + (comparisonValue42 * 3u);
                        productValue143 = 2u + (comparisonValue42 * 3u);
                        productValue144 = 0u + (comparisonValue42 * 3u);
                        productValue145 = 1u + (comparisonValue42 * 3u);
                        productValue146 = 2u + (comparisonValue42 * 3u);
                        if (comparisonValue17)
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            uint bitwiseValue26 = intermediateValue88 << 4u;
                            uint sumValue80 = intermediateValue87 + bitwiseValue11;
                            uint bitwiseValue27 = sumValue80 + (intermediateValue86 << 8u);
                            uvec4 sampledTextureValue20 = texelFetch(voxelBuffer, int(bitwiseValue27 + bitwiseValue26));
                            uint scalarValue43 = sampledTextureValue20.x;
                            float bitwiseValue15;
                            float intermediateValue118;
                            float intermediateValue119;
                            if (scalarValue43 == 0u)
                            {
                                bitwiseValue15 = 0.0;
                                intermediateValue118 = 0.0;
                                intermediateValue119 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue28 = float(scalarValue43 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue15 = bitwiseValue28 * float(scalarValue43 & 255u);
                                intermediateValue118 = bitwiseValue28 * float((scalarValue43 >> 8u) & 255u);
                                intermediateValue119 = bitwiseValue28 * float((scalarValue43 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue22 = texelFetch(voxelBuffer, int(((intermediateValue1[productValue142] + sumValue80) + ((intermediateValue1[productValue141] + intermediateValue86) << 8u)) + ((intermediateValue1[productValue143] + intermediateValue88) << 4u)));
                            uint scalarValue44 = sampledTextureValue22.x;
                            float bitwiseValue19;
                            float intermediateValue133;
                            float intermediateValue134;
                            if (scalarValue44 == 0u)
                            {
                                bitwiseValue19 = 0.0;
                                intermediateValue133 = 0.0;
                                intermediateValue134 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue29 = float(scalarValue44 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue19 = bitwiseValue29 * float(scalarValue44 & 255u);
                                intermediateValue133 = bitwiseValue29 * float((scalarValue44 >> 8u) & 255u);
                                intermediateValue134 = bitwiseValue29 * float((scalarValue44 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue23 = texelFetch(voxelBuffer, int(((intermediateValue2[productValue145] + sumValue80) + ((intermediateValue2[productValue144] + intermediateValue86) << 8u)) + ((intermediateValue2[productValue146] + intermediateValue88) << 4u)));
                            uint scalarValue45 = sampledTextureValue23.x;
                            float bitwiseValue24;
                            float intermediateValue147;
                            float intermediateValue148;
                            if (scalarValue45 == 0u)
                            {
                                bitwiseValue24 = 0.0;
                                intermediateValue147 = 0.0;
                                intermediateValue148 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue30 = float(scalarValue45 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue24 = bitwiseValue30 * float(scalarValue45 & 255u);
                                intermediateValue147 = bitwiseValue30 * float((scalarValue45 >> 8u) & 255u);
                                intermediateValue148 = bitwiseValue30 * float((scalarValue45 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue25 = texelFetch(voxelBuffer, int((bitwiseValue27 + 273u) + bitwiseValue26));
                            uint scalarValue46 = sampledTextureValue25.x;
                            float branchMergedValue15;
                            float branchMergedValue32;
                            float branchMergedValue33;
                            float branchMergedValue34;
                            float branchMergedValue35;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            float branchMergedValue38;
                            float branchMergedValue39;
                            float branchMergedValue40;
                            float branchMergedValue43;
                            float branchMergedValue44;
                            if (scalarValue46 == 0u)
                            {
                                branchMergedValue15 = 0.0;
                                branchMergedValue32 = 0.0;
                                branchMergedValue33 = 0.0;
                                branchMergedValue34 = bitwiseValue15;
                                branchMergedValue35 = intermediateValue118;
                                branchMergedValue36 = intermediateValue119;
                                branchMergedValue37 = bitwiseValue19;
                                branchMergedValue38 = intermediateValue133;
                                branchMergedValue39 = intermediateValue134;
                                branchMergedValue40 = bitwiseValue24;
                                branchMergedValue43 = intermediateValue147;
                                branchMergedValue44 = intermediateValue148;
                            }
                            else
                            {
                                float bitwiseValue31 = float(scalarValue46 >> 24u) * 9.2272217443678528070449829101562e-05;
                                branchMergedValue15 = bitwiseValue31 * float(scalarValue46 & 255u);
                                branchMergedValue32 = bitwiseValue31 * float((scalarValue46 >> 8u) & 255u);
                                branchMergedValue33 = bitwiseValue31 * float((scalarValue46 >> 16u) & 255u);
                                branchMergedValue34 = bitwiseValue15;
                                branchMergedValue35 = intermediateValue118;
                                branchMergedValue36 = intermediateValue119;
                                branchMergedValue37 = bitwiseValue19;
                                branchMergedValue38 = intermediateValue133;
                                branchMergedValue39 = intermediateValue134;
                                branchMergedValue40 = bitwiseValue24;
                                branchMergedValue43 = intermediateValue147;
                                branchMergedValue44 = intermediateValue148;
                            }
                            intermediateValue177 = branchMergedValue34;
                            intermediateValue178 = branchMergedValue35;
                            intermediateValue179 = branchMergedValue36;
                            intermediateValue180 = branchMergedValue37;
                            intermediateValue182 = branchMergedValue38;
                            intermediateValue184 = branchMergedValue39;
                            intermediateValue186 = branchMergedValue40;
                            intermediateValue188 = branchMergedValue43;
                            intermediateValue190 = branchMergedValue44;
                            intermediateValue192 = branchMergedValue15;
                            intermediateValue193 = branchMergedValue32;
                            intermediateValue194 = branchMergedValue33;
#endif
                            break;
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        float sumValue123 = rdSignedBitsToFloat(scalarValue25 - comparisonValue103) + 0.5;
                        intermediateValue153 = intermediateValue152;
                        uint sumValue73;
                        float sampledTextureValue13;
                        uint scalarValue91 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        else
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            if ((comparisonValue91 && (int(scalarValue91) >= int(1u))) || (conditionValue5 && (int(clampedValue1) <= int(scalarValue91))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            float intermediateValue136;
                            float intermediateValue137;
                            float intermediateValue138;
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
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                sumValue70 = float(intermediateValue1[productValue141]) + intermediateValue83;
                                sumValue71 = float(intermediateValue1[productValue142]) + intermediateValue84;
                                sumValue72 = float(intermediateValue1[productValue143]) + intermediateValue85;
                                sumValue73 = float(intermediateValue2[productValue144]) + intermediateValue83;
                                sumValue74 = float(intermediateValue2[productValue145]) + intermediateValue84;
                                sumValue75 = float(intermediateValue2[productValue146]) + intermediateValue85;
                                sumValue76 = intermediateValue83 + productValue102;
                                sumValue77 = intermediateValue84 + productValue103;
                                sumValue78 = intermediateValue85 + productValue104;
                                uint comparisonValue43 = ((((uint(intermediateValue83 >= 16.0) << 1u) | uint(intermediateValue83 < 0.0)) | (uint(intermediateValue84 < 0.0) << 2u)) | (uint(intermediateValue84 >= 16.0) << 3u)) | (uint(intermediateValue85 < 0.0) << 4u);
                                comparisonValue27 = intermediateValue[comparisonValue43 | (uint(intermediateValue85 >= 16.0) << 5u)];
                                comparisonValue28 = ((((comparisonValue43 | (uint(intermediateValue85 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue43 & 31u))) == 0u;
                                uint sampledTextureValue24;
                                if (comparisonValue28)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue11 + 4096u)).x & (1u << (comparisonValue27 & 31u))) == 0u)
                                    {
                                        intermediateValue136 = 0.0;
                                        intermediateValue137 = 0.0;
                                        intermediateValue138 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue24 = ((((uint(sumValue76 - (floor(sumValue76 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue77 - (floor(sumValue77 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue78 - (floor(sumValue78 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue11 + 4097u) + comparisonValue27)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue24 = ((((intermediateValue86 << 8u) & 3840u) | (intermediateValue87 & 15u)) | ((intermediateValue88 << 4u) & 240u)) + bitwiseValue11;
                                }
                                uvec4 sampledTextureValue26 = texelFetch(voxelBuffer, int(sampledTextureValue24));
                                uint scalarValue47 = sampledTextureValue26.x;
                                if (scalarValue47 == 0u)
                                {
                                    intermediateValue136 = 0.0;
                                    intermediateValue137 = 0.0;
                                    intermediateValue138 = 0.0;
                                    break;
                                }
                                float bitwiseValue32 = float(scalarValue47 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue136 = bitwiseValue32 * float(scalarValue47 & 255u);
                                intermediateValue137 = bitwiseValue32 * float((scalarValue47 >> 8u) & 255u);
                                intermediateValue138 = bitwiseValue32 * float((scalarValue47 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_PLATFORM == RD_PLATFORM_SM50
                            float multiplyAddValue123 = fma(multiplyAddValue121, fragmentScalarConstants1.packedValues[196u], ((rdSignedBitsToFloat(scalarValue91 - comparisonValue103) + 0.5) * fragmentScalarConstants1.packedValues[612u]) * fragmentScalarConstants1.packedValues[196u]);
                            float multiplyAddValue124 = fma(multiplyAddValue122, fragmentScalarConstants1.packedValues[196u], (sumValue123 * fragmentScalarConstants1.packedValues[612u]) * fragmentScalarConstants1.packedValues[196u]);
                            if (comparisonValue91)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            float intermediateValue181;
                            float intermediateValue183;
                            float intermediateValue185;
                            float sumValue90;
                            float sumValue91;
                            float sumValue92;
                            uint comparisonValue39;
                            bool comparisonValue40;
                            for (;;)
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                                sampledTextureValue13 = (textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue123, multiplyAddValue124, scalarValue90), 0.0).x >= multiplyAddValue120) ? (intermediateValue153 + 1.0) : intermediateValue153;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                sumValue90 = sumValue70 + productValue102;
                                sumValue91 = sumValue71 + productValue103;
                                sumValue92 = sumValue72 + productValue104;
                                uint comparisonValue45 = ((((uint(sumValue70 >= 16.0) << 1u) | uint(sumValue70 < 0.0)) | (uint(sumValue71 < 0.0) << 2u)) | (uint(sumValue71 >= 16.0) << 3u)) | (uint(sumValue72 < 0.0) << 4u);
                                comparisonValue39 = intermediateValue[comparisonValue45 | (uint(sumValue72 >= 16.0) << 5u)];
                                comparisonValue40 = ((((comparisonValue45 | (uint(sumValue72 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue45 & 31u))) == 0u;
                                uint sampledTextureValue32;
                                if (comparisonValue40)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue11 + 4096u)).x & (1u << (comparisonValue39 & 31u))) == 0u)
                                    {
                                        intermediateValue181 = 0.0;
                                        intermediateValue183 = 0.0;
                                        intermediateValue185 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue32 = ((((uint(sumValue90 - (floor(sumValue90 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue91 - (floor(sumValue91 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue92 - (floor(sumValue92 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue11 + 4097u) + comparisonValue39)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue32 = ((((uint(sumValue70) << 8u) & 3840u) | (uint(sumValue71) & 15u)) | ((uint(sumValue72) << 4u) & 240u)) + bitwiseValue11;
                                }
                                uvec4 sampledTextureValue27 = texelFetch(voxelBuffer, int(sampledTextureValue32));
                                uint scalarValue48 = sampledTextureValue27.x;
                                if (scalarValue48 == 0u)
                                {
                                    intermediateValue181 = 0.0;
                                    intermediateValue183 = 0.0;
                                    intermediateValue185 = 0.0;
                                    break;
                                }
                                float bitwiseValue33 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue181 = bitwiseValue33 * float(scalarValue48 & 255u);
                                intermediateValue183 = bitwiseValue33 * float((scalarValue48 >> 8u) & 255u);
                                intermediateValue185 = bitwiseValue33 * float((scalarValue48 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue187;
                            float intermediateValue189;
                            float intermediateValue191;
                            float sumValue99;
                            float sumValue100;
                            float sumValue101;
                            uint comparisonValue49;
                            bool comparisonValue50;
                            for (;;)
                            {
                                sumValue99 = sumValue73 + productValue102;
                                sumValue100 = sumValue74 + productValue103;
                                sumValue101 = sumValue75 + productValue104;
                                uint comparisonValue48 = ((((uint(sumValue73 >= 16.0) << 1u) | uint(sumValue73 < 0.0)) | (uint(sumValue74 < 0.0) << 2u)) | (uint(sumValue74 >= 16.0) << 3u)) | (uint(sumValue75 < 0.0) << 4u);
                                comparisonValue49 = intermediateValue[comparisonValue48 | (uint(sumValue75 >= 16.0) << 5u)];
                                comparisonValue50 = ((((comparisonValue48 | (uint(sumValue75 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue48 & 31u))) == 0u;
                                uint sampledTextureValue36;
                                if (comparisonValue50)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue11 + 4096u)).x & (1u << (comparisonValue49 & 31u))) == 0u)
                                    {
                                        intermediateValue187 = 0.0;
                                        intermediateValue189 = 0.0;
                                        intermediateValue191 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue36 = ((((uint(sumValue99 - (floor(sumValue99 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue100 - (floor(sumValue100 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue101 - (floor(sumValue101 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue11 + 4097u) + comparisonValue49)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue36 = ((((uint(sumValue73) << 8u) & 3840u) | (uint(sumValue74) & 15u)) | ((uint(sumValue75) << 4u) & 240u)) + bitwiseValue11;
                                }
                                uvec4 sampledTextureValue28 = texelFetch(voxelBuffer, int(sampledTextureValue36));
                                uint scalarValue49 = sampledTextureValue28.x;
                                if (scalarValue49 == 0u)
                                {
                                    intermediateValue187 = 0.0;
                                    intermediateValue189 = 0.0;
                                    intermediateValue191 = 0.0;
                                    break;
                                }
                                float bitwiseValue34 = float(scalarValue49 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue187 = bitwiseValue34 * float(scalarValue49 & 255u);
                                intermediateValue189 = bitwiseValue34 * float((scalarValue49 >> 8u) & 255u);
                                intermediateValue191 = bitwiseValue34 * float((scalarValue49 >> 16u) & 255u);
                                break;
                            }
                            float sumValue81 = sumValue56 + productValue102;
                            float sumValue82 = sumValue57 + productValue103;
                            float sumValue83 = sumValue58 + productValue104;
                            uint comparisonValue51 = ((((uint(sumValue56 >= 16.0) << 1u) | uint(sumValue56 < 0.0)) | (uint(sumValue57 < 0.0) << 2u)) | (uint(sumValue57 >= 16.0) << 3u)) | (uint(sumValue58 < 0.0) << 4u);
                            uint comparisonValue52 = comparisonValue51 | (uint(sumValue58 >= 16.0) << 5u);
                            uint sampledTextureValue40;
                            if ((((comparisonValue52 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue51 & 31u))) == 0u)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue11 + 4096u)).x & (1u << (intermediateValue[comparisonValue52] & 31u))) == 0u)
                                {
                                    intermediateValue177 = intermediateValue136;
                                    intermediateValue178 = intermediateValue137;
                                    intermediateValue179 = intermediateValue138;
                                    intermediateValue180 = intermediateValue181;
                                    intermediateValue182 = intermediateValue183;
                                    intermediateValue184 = intermediateValue185;
                                    intermediateValue186 = intermediateValue187;
                                    intermediateValue188 = intermediateValue189;
                                    intermediateValue190 = intermediateValue191;
                                    intermediateValue192 = 0.0;
                                    intermediateValue193 = 0.0;
                                    intermediateValue194 = 0.0;
                                    break;
                                }
                                sampledTextureValue40 = ((((uint(sumValue81 - (floor(sumValue81 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue82 - (floor(sumValue82 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue83 - (floor(sumValue83 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue11 + 4097u) + intermediateValue[comparisonValue52])).x >> 2u);
#endif
                            }
                            else
                            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                                vec4 sampledTextureValue50 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue123, multiplyAddValue124, scalarValue90));
                                float multiplyAddValue125 = fract(fma(multiplyAddValue123, fragmentScalarConstants1.packedValues[614u], 0.5));
                                bool comparisonValue104 = sampledTextureValue50.x >= multiplyAddValue120;
                                bool comparisonValue105 = sampledTextureValue50.w >= multiplyAddValue120;
                                float comparisonValue106 = float(sampledTextureValue50.y >= multiplyAddValue120);
                                float comparisonValue107 = float(sampledTextureValue50.z >= multiplyAddValue120);
                                float multiplyAddValue126 = fma(multiplyAddValue125, comparisonValue105 ? (comparisonValue107 - 1.0) : comparisonValue107, float(comparisonValue105));
                                sampledTextureValue13 = intermediateValue153 + fma(fract(fma(multiplyAddValue124, fragmentScalarConstants1.packedValues[614u], 0.5)), fma(multiplyAddValue125, comparisonValue104 ? (comparisonValue106 - 1.0) : comparisonValue106, float(comparisonValue104)) - multiplyAddValue126, multiplyAddValue126);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                sampledTextureValue40 = ((((uint(sumValue56) << 8u) & 3840u) | (uint(sumValue57) & 15u)) | ((uint(sumValue58) << 4u) & 240u)) + bitwiseValue11;
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM50
                            sumValue73 = scalarValue91 + 1u;
                            intermediateValue153 = sampledTextureValue13;
                            scalarValue91 = sumValue73;
                            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            uvec4 sampledTextureValue29 = texelFetch(voxelBuffer, int(sampledTextureValue40));
                            uint scalarValue50 = sampledTextureValue29.x;
                            if (scalarValue50 == 0u)
                            {
                                intermediateValue177 = intermediateValue136;
                                intermediateValue178 = intermediateValue137;
                                intermediateValue179 = intermediateValue138;
                                intermediateValue180 = intermediateValue181;
                                intermediateValue182 = intermediateValue183;
                                intermediateValue184 = intermediateValue185;
                                intermediateValue186 = intermediateValue187;
                                intermediateValue188 = intermediateValue189;
                                intermediateValue190 = intermediateValue191;
                                intermediateValue192 = 0.0;
                                intermediateValue193 = 0.0;
                                intermediateValue194 = 0.0;
                                break;
                            }
                            float bitwiseValue35 = float(scalarValue50 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue177 = intermediateValue136;
                            intermediateValue178 = intermediateValue137;
                            intermediateValue179 = intermediateValue138;
                            intermediateValue180 = intermediateValue181;
                            intermediateValue182 = intermediateValue183;
                            intermediateValue184 = intermediateValue185;
                            intermediateValue186 = intermediateValue187;
                            intermediateValue188 = intermediateValue189;
                            intermediateValue190 = intermediateValue191;
                            intermediateValue192 = bitwiseValue35 * float(scalarValue50 & 255u);
                            intermediateValue193 = bitwiseValue35 * float((scalarValue50 >> 8u) & 255u);
                            intermediateValue194 = bitwiseValue35 * float((scalarValue50 >> 16u) & 255u);
                            break;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        sumValue53 = scalarValue25 + 1u;
                        intermediateValue152 = intermediateValue153;
                        scalarValue25 = sumValue53;
                        continue;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    float comparisonValue108 = intermediateValue152 / rdSignedBitsToFloat(comparisonValue91 ? 1u : (clampedValue1 * clampedValue1));
                    comparisonValue31 = (comparisonValue108 < 1.0) ? spvNMin(spvNMax(comparisonValue108, 1.0 - fragmentScalarConstants1.packedValues[575u]), 1.0) : 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue45 = (((intermediateValue184 * sumValue54) + (intermediateValue179 * sumValue53)) + (intermediateValue190 * sumValue55)) + (intermediateValue194 * intermediateValue91);
                    branchMergedValue47 = (((intermediateValue182 * sumValue54) + (intermediateValue178 * sumValue53)) + (intermediateValue188 * sumValue55)) + (intermediateValue193 * intermediateValue91);
                    branchMergedValue48 = (((intermediateValue180 * sumValue54) + (intermediateValue177 * sumValue53)) + (intermediateValue186 * sumValue55)) + (intermediateValue192 * intermediateValue91);
                }
                branchMergedValue9 = branchMergedValue45;
                branchMergedValue16 = branchMergedValue47;
                branchMergedValue17 = branchMergedValue48;
            }
            else
            {
                branchMergedValue9 = 0.0;
                branchMergedValue16 = 0.0;
                branchMergedValue17 = 0.0;
            }
            intermediateValue28 = branchMergedValue17;
            intermediateValue29 = branchMergedValue16;
            intermediateValue30 = branchMergedValue9;
        }
        else
        {
            intermediateValue28 = intermediateValue14;
            intermediateValue29 = productValue32;
            intermediateValue30 = productValue33;
        }
        float productValue111 = varyingTexCoord1.y * varyingTexCoord1.y;
        float productValue112 = productValue111 * productValue111;
        float productValue113 = (((fragmentVectorConstants1.packedValues[89u].y * (productValue111 - productValue112)) + productValue112) * varyingTexCoord1.y) * fragmentVectorConstants1.packedValues[154u].w;
        float productValue114 = fragmentVectorConstants1.packedValues[136u].w * sumValue6;
        float dotProductValue13 = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float productValue115 = (fragmentVectorConstants1.packedValues[136u].z * intermediateValue5) * fragmentVectorConstants1.packedValues[143u].x;
        productValue39 = (((dotProductValue13 - exponentialValue) * fragmentVectorConstants1.packedValues[143u].y) + exponentialValue) * productValue115;
        productValue40 = (((dotProductValue13 - exponentialValue1) * fragmentVectorConstants1.packedValues[143u].y) + exponentialValue1) * productValue115;
        productValue41 = (((dotProductValue13 - exponentialValue2) * fragmentVectorConstants1.packedValues[143u].y) + exponentialValue2) * productValue115;
        productValue42 = (spvNMax((productValue113 * fragmentVectorConstants1.packedValues[154u].x) + (fragmentVectorConstants1.packedValues[75u].w * intermediateValue28), fragmentVectorConstants1.packedValues[79u].x * fragmentVectorConstants1.packedValues[79u].w) * exponentialValue) * productValue114;
        productValue43 = (spvNMax((productValue113 * fragmentVectorConstants1.packedValues[154u].y) + (fragmentVectorConstants1.packedValues[75u].w * intermediateValue29), fragmentVectorConstants1.packedValues[79u].y * fragmentVectorConstants1.packedValues[79u].w) * exponentialValue1) * productValue114;
        productValue44 = (spvNMax((productValue113 * fragmentVectorConstants1.packedValues[154u].z) + (fragmentVectorConstants1.packedValues[75u].w * intermediateValue30), fragmentVectorConstants1.packedValues[79u].z * fragmentVectorConstants1.packedValues[79u].w) * exponentialValue2) * productValue114;
        intermediateValue16 = intermediateValue17;
        intermediateValue18 = intermediateValue19;
        intermediateValue20 = intermediateValue21;
        intermediateValue22 = intermediateValue23;
        intermediateValue24 = intermediateValue25;
        intermediateValue26 = intermediateValue27;
    }
    else
    {
        productValue39 = 0.0;
        productValue40 = 0.0;
        productValue41 = 0.0;
        productValue42 = 0.0;
        productValue43 = 0.0;
        productValue44 = 0.0;
        intermediateValue16 = 0.0;
        intermediateValue18 = 0.0;
        intermediateValue20 = 0.0;
        intermediateValue22 = 0.0;
        intermediateValue24 = 0.0;
        intermediateValue26 = 0.0;
    }
    float sumValue84 = ((productValue42 + productValue39) + intermediateValue16) + intermediateValue22;
    float sumValue86 = ((productValue43 + productValue40) + intermediateValue18) + intermediateValue24;
    float sumValue93 = ((productValue44 + productValue41) + intermediateValue20) + intermediateValue26;
    float sumValue94 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue102 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue103 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue9 = inversesqrt(dot(vec3(sumValue94, sumValue102, sumValue103), vec3(sumValue94, sumValue102, sumValue103)));
    float productValue116 = inverseLengthValue9 * sumValue94;
    float productValue117 = inverseLengthValue9 * sumValue102;
    float productValue118 = inverseLengthValue9 * sumValue103;
    bool comparisonValue53 = fragmentVectorConstants1.packedValues[85u].y != 0.0;
    bool comparisonValue54 = fragmentVectorConstants1.packedValues[136u].w != 0.0;
    float productValue48;
    float productValue49;
    float productValue50;
    if ((comparisonValue53 && (fragmentVectorConstants1.packedValues[85u].z != 0.0)) && comparisonValue54)
    {
        productValue48 = spvNMax(fragmentVectorConstants1.packedValues[75u].w + (fragmentVectorConstants1.packedValues[154u].x * fragmentVectorConstants1.packedValues[154u].w), fragmentVectorConstants1.packedValues[79u].x * fragmentVectorConstants1.packedValues[79u].w) * fragmentVectorConstants1.packedValues[85u].z;
        productValue49 = spvNMax(fragmentVectorConstants1.packedValues[75u].w + (fragmentVectorConstants1.packedValues[154u].y * fragmentVectorConstants1.packedValues[154u].w), fragmentVectorConstants1.packedValues[79u].y * fragmentVectorConstants1.packedValues[79u].w) * fragmentVectorConstants1.packedValues[85u].z;
        productValue50 = spvNMax(fragmentVectorConstants1.packedValues[75u].w + (fragmentVectorConstants1.packedValues[154u].z * fragmentVectorConstants1.packedValues[154u].w), fragmentVectorConstants1.packedValues[79u].z * fragmentVectorConstants1.packedValues[79u].w) * fragmentVectorConstants1.packedValues[85u].z;
    }
    else
    {
        productValue48 = 0.0;
        productValue49 = 0.0;
        productValue50 = 0.0;
    }
    bool comparisonValue55 = fragmentVectorConstants1.packedValues[161u].x != 0.0;
    bool comparisonValue56 = fragmentVectorConstants1.packedValues[85u].x != 0.0;
    float intermediateValue35;
    float intermediateValue36;
    float intermediateValue37;
    float intermediateValue38;
    if (comparisonValue56)
    {
        float quotientValue21 = spvNClamp(((fragmentVectorConstants1.packedValues[152u].x - fragmentVectorConstants1.packedValues[81u].x) + (nonlinearValue / fragmentVectorConstants1.packedValues[81u].z)) * fragmentVectorConstants1.packedValues[81u].y, 0.0, 1.0);
        float branchMergedValue10;
        float branchMergedValue18;
        float branchMergedValue19;
        float branchMergedValue20;
        if (quotientValue21 > 0.0)
        {
            float branchMergedValue46;
            float branchMergedValue49;
            float branchMergedValue50;
            float branchMergedValue51;
            if (comparisonValue53)
            {
                branchMergedValue46 = spvNMax(productValue50, 1.0) * fragmentVectorConstants1.packedValues[86u].z;
                branchMergedValue49 = spvNMax(productValue49, 1.0) * fragmentVectorConstants1.packedValues[86u].y;
                branchMergedValue50 = fragmentVectorConstants1.packedValues[86u].x * spvNMax(productValue48, 1.0);
                branchMergedValue51 = quotientValue21;
            }
            else
            {
                float quotientValue22 = spvNClamp(((productValue117 - fragmentVectorConstants1.packedValues[145u].x) + fragmentVectorConstants1.packedValues[145u].w) / (fragmentVectorConstants1.packedValues[145u].z - fragmentVectorConstants1.packedValues[145u].x), 0.0, 1.0);
                float productValue119 = 1.0 - ((quotientValue22 * quotientValue22) * (3.0 - (quotientValue22 * 2.0)));
                float productValue120 = (productValue119 * productValue119) * productValue119;
                float dotProductValue14 = dot(vec3(productValue116, productValue117, productValue118), vec3(fragmentVectorConstants1.packedValues[149u].xyz));
                float dotProductValue15 = dot(vec3(productValue116, productValue117, productValue118), vec3(fragmentVectorConstants1.packedValues[90u].xyz));
                float sumValue104 = fragmentVectorConstants1.packedValues[145u].x - fragmentVectorConstants1.packedValues[145u].w;
                float quotientValue23 = spvNClamp((productValue117 - sumValue104) / (fragmentVectorConstants1.packedValues[145u].y - sumValue104), 0.0, 1.0);
                float productValue121 = 1.0 - ((quotientValue23 * quotientValue23) * (3.0 - (quotientValue23 * 2.0)));
                float productValue122 = (productValue121 * productValue121) * productValue121;
                float productValue123 = (fragmentVectorConstants1.packedValues[82u].x * 0.75) * ((((dotProductValue15 * dotProductValue15) + 1.0) * fragmentVectorConstants1.packedValues[147u].w) + (((dotProductValue14 * dotProductValue14) + 1.0) * fragmentVectorConstants1.packedValues[157u].w));
                float exponentialValue4 = spvNClamp(exp2(log2(spvNMax(dotProductValue14, 0.0)) * fragmentVectorConstants1.packedValues[82u].w), 0.0, 1.0);
                float exponentialValue5 = spvNClamp(exp2(log2(spvNMax(dotProductValue15, 0.0)) * fragmentVectorConstants1.packedValues[82u].w), 0.0, 1.0);
                float productValue124 = 1.809999942779541015625 - (exponentialValue4 * 1.7999999523162841796875);
                float nonlinearValue3 = 0.036100022494792938232421875 / (sqrt(productValue124) * productValue124);
                float productValue125 = 1.809999942779541015625 - (exponentialValue5 * 1.7999999523162841796875);
                float nonlinearValue4 = 0.036100022494792938232421875 / (sqrt(productValue125) * productValue125);
                float productValue126 = exponentialValue4 * (fragmentVectorConstants1.packedValues[82u].y * fragmentVectorConstants1.packedValues[157u].w);
                float productValue127 = exponentialValue5 * (fragmentVectorConstants1.packedValues[82u].z * fragmentVectorConstants1.packedValues[147u].w);
                float productValue128 = (((productValue120 * fragmentVectorConstants1.packedValues[155u].x) * (((productValue127 * fragmentVectorConstants1.packedValues[147u].x) * nonlinearValue4) + ((productValue126 * fragmentVectorConstants1.packedValues[157u].x) * nonlinearValue3))) + (((productValue122 * (fragmentVectorConstants1.packedValues[155u].x - fragmentVectorConstants1.packedValues[83u].x)) + fragmentVectorConstants1.packedValues[83u].x) * productValue123)) * 0.079577468335628509521484375;
                float productValue129 = (((productValue120 * fragmentVectorConstants1.packedValues[155u].y) * (((productValue127 * fragmentVectorConstants1.packedValues[147u].y) * nonlinearValue4) + ((productValue126 * fragmentVectorConstants1.packedValues[157u].y) * nonlinearValue3))) + (((productValue122 * (fragmentVectorConstants1.packedValues[155u].y - fragmentVectorConstants1.packedValues[83u].y)) + fragmentVectorConstants1.packedValues[83u].y) * productValue123)) * 0.079577468335628509521484375;
                float productValue130 = (((productValue120 * fragmentVectorConstants1.packedValues[155u].z) * (((productValue127 * fragmentVectorConstants1.packedValues[147u].z) * nonlinearValue4) + ((productValue126 * fragmentVectorConstants1.packedValues[157u].z) * nonlinearValue3))) + (((productValue122 * (fragmentVectorConstants1.packedValues[155u].z - fragmentVectorConstants1.packedValues[83u].z)) + fragmentVectorConstants1.packedValues[83u].z) * productValue123)) * 0.079577468335628509521484375;
                float branchMergedValue52;
                float branchMergedValue53;
                float branchMergedValue54;
                float branchMergedValue55;
                if (fragmentVectorConstants1.packedValues[85u].w != 0.0)
                {
                    float scalarValue51 = spvNMax(fragmentVectorConstants1.packedValues[88u].y, varyingTexCoord1.y);
                    branchMergedValue52 = ((productValue130 - fragmentVectorConstants1.packedValues[158u].z) * scalarValue51) + fragmentVectorConstants1.packedValues[158u].z;
                    branchMergedValue53 = ((productValue129 - fragmentVectorConstants1.packedValues[158u].y) * scalarValue51) + fragmentVectorConstants1.packedValues[158u].y;
                    branchMergedValue54 = ((productValue128 - fragmentVectorConstants1.packedValues[158u].x) * scalarValue51) + fragmentVectorConstants1.packedValues[158u].x;
                    branchMergedValue55 = quotientValue21;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    comparisonValue31 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue52 = productValue130;
                    branchMergedValue53 = productValue129;
                    branchMergedValue54 = productValue128;
                    branchMergedValue55 = quotientValue21;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue92 = spvNMin(spvNMin(comparisonValue31, intermediateValue125), intermediateValue92);
                float productValue208 = spvNMax(fragmentScalarConstants1.packedValues[613u] - spvNMin(fragmentScalarConstants1.packedValues[613u] * 0.100000001490116119384765625, 8.0), 0.0);
                float quotientValue28 = spvNClamp((-(productValue208 + multiplyAddValue56)) * (1.0 / (fragmentScalarConstants1.packedValues[613u] - productValue208)), 0.0, 1.0);
                multiplyAddValue52 = fma((quotientValue28 * quotientValue28) * fma(quotientValue28, -2.0, 3.0), 1.0 - scalarValue92, scalarValue92);
                intermediateValue69 = intermediateValue70;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue46 = branchMergedValue52;
                branchMergedValue49 = branchMergedValue53;
                branchMergedValue50 = branchMergedValue54;
                branchMergedValue51 = branchMergedValue55;
            }
            branchMergedValue10 = branchMergedValue46;
            branchMergedValue18 = branchMergedValue49;
            branchMergedValue19 = branchMergedValue50;
            branchMergedValue20 = branchMergedValue51;
        }
        else
        {
            branchMergedValue10 = 0.0;
            branchMergedValue18 = 0.0;
            branchMergedValue19 = 0.0;
            branchMergedValue20 = quotientValue21;
        }
        intermediateValue35 = branchMergedValue20;
        intermediateValue36 = branchMergedValue19;
        intermediateValue37 = branchMergedValue18;
        intermediateValue38 = branchMergedValue10;
    }
    else
    {
        intermediateValue35 = 0.0;
        intermediateValue36 = 0.0;
        intermediateValue37 = 0.0;
        intermediateValue38 = 0.0;
    }
    float productValue98;
    float productValue99;
    float productValue100;
    float productValue101;
    if (comparisonValue55)
    {
        float productValue147 = (multiplyAddValue5 + 1.0) * 0.5;
        float productValue148 = (multiplyAddValue9 + 1.0) * 0.5;
        uint scalarValue52 = uint(int(fragmentVectorConstants1.packedValues[159u].z));
        float multiplyAddValue36 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[16u].z + fma(fragmentVectorConstants1.packedValues[15u].z, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue9, multiplyAddValue5 * fragmentVectorConstants1.packedValues[13u].z)))) / (fma(fragmentVectorConstants1.packedValues[15u].w, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue9, multiplyAddValue5 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[16u].w)) - fragmentVectorConstants1.packedValues[160u].x) / (fragmentVectorConstants1.packedValues[160u].y - fragmentVectorConstants1.packedValues[160u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue52))) + (-0.5);
        uint sumValue105 = uint(min(int(uint(max(int(uint(int(multiplyAddValue36))), int(0u)))), int(scalarValue52 + 4294967294u)));
        float scalarValue53 = float(int(sumValue105));
        float sumValue106 = spvNMin(spvNMax(multiplyAddValue36 - scalarValue53, 0.0), 1.0);
        vec4 sampledTextureValue31 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue147, productValue148, scalarValue53), 0.0);
        float scalarValue54 = sampledTextureValue31.x;
        float scalarValue55 = sampledTextureValue31.y;
        float scalarValue56 = sampledTextureValue31.z;
        float scalarValue57 = sampledTextureValue31.w;
        vec4 sampledTextureValue33 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue147, productValue148, float(int(sumValue105 + 1u))), 0.0);
        productValue98 = ((sampledTextureValue33.x - scalarValue54) * sumValue106) + scalarValue54;
        productValue99 = ((sampledTextureValue33.y - scalarValue55) * sumValue106) + scalarValue55;
        productValue100 = ((sampledTextureValue33.z - scalarValue56) * sumValue106) + scalarValue56;
        productValue101 = ((sampledTextureValue33.w - scalarValue57) * sumValue106) + scalarValue57;
    }
    else
    {
        productValue98 = 0.0;
        productValue99 = 0.0;
        productValue100 = 0.0;
        productValue101 = 1.0;
    }
    float intermediateValue61;
    float intermediateValue62;
    float intermediateValue63;
    if (fragmentVectorConstants1.packedValues[146u].x != 0.0)
    {
        bool conditionValue1 = fragmentVectorConstants1.packedValues[150u].x > 0.0;
        float intermediateValue74;
        float intermediateValue75;
        float intermediateValue76;
        float multiplyAddValue28;
        float multiplyAddValue29;
        float multiplyAddValue30;
        if (fragmentVectorConstants1.packedValues[148u].w > 0.0)
        {
            intermediateValue74 = productValue28;
            intermediateValue75 = productValue29;
            intermediateValue76 = productValue30;
            multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue30, fma(fragmentVectorConstants1.packedValues[5u].x, productValue29, productValue28 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x;
            multiplyAddValue29 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue30, fma(fragmentVectorConstants1.packedValues[5u].y, productValue29, productValue28 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y;
            multiplyAddValue30 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue30, fma(fragmentVectorConstants1.packedValues[5u].z, productValue29, productValue28 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z;
        }
        else
        {
            intermediateValue74 = varyingTexCoord3.x;
            intermediateValue75 = varyingTexCoord3.y;
            intermediateValue76 = varyingTexCoord3.z;
            multiplyAddValue28 = multiplyAddValue;
            multiplyAddValue29 = multiplyAddValue1;
            multiplyAddValue30 = multiplyAddValue2;
        }
        float sumValue107 = intermediateValue74 - fragmentVectorConstants1.packedValues[12u].x;
        float sumValue108 = intermediateValue75 - fragmentVectorConstants1.packedValues[12u].y;
        float sumValue109 = intermediateValue76 - fragmentVectorConstants1.packedValues[12u].z;
        float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue107, sumValue108, sumValue109), vec3(sumValue107, sumValue108, sumValue109)));
        float productValue149 = inverseLengthValue10 * sumValue107;
        float productValue150 = inverseLengthValue10 * sumValue108;
        float productValue151 = inverseLengthValue10 * sumValue109;
        float inverseLengthValue11 = inversesqrt(dot(vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30), vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30)));
        float dotProductValue16 = dot(vec3(productValue149, productValue150, productValue151), vec3(productValue9, productValue10, productValue11)) * 2.0;
        float productValue152 = productValue149 - (dotProductValue16 * productValue9);
        float productValue153 = productValue150 - (dotProductValue16 * productValue10);
        float productValue154 = productValue151 - (dotProductValue16 * productValue11);
        float sumValue110 = 1.0 - intermediateValue6;
        float productValue155 = sumValue110 * sumValue110;
        float productValue156 = productValue155 * productValue155;
        precise float comparisonValue57 = 1.0 - ((uint(int(fragmentVectorConstants1.packedValues[127u].x)) == 1u) ? productValue155 : (productValue156 * productValue156));
        precise float productValue157 = (fragmentVectorConstants1.packedValues[146u].y + (-1.0)) * comparisonValue57;
        uint scalarValue58 = uint(int(fragmentVectorConstants1.packedValues[80u].x));
        vec4 sampledTextureValue35 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue152, productValue153, productValue154, float(int(scalarValue58))), productValue157);
        vec4 sampledTextureValue37 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue152, productValue153, productValue154, float(int(uint(int(scalarValue58 + 2u) - int(3u) * (int(scalarValue58 + 2u) / int(3u)))))), productValue157);
        float scalarValue59 = sampledTextureValue37.x;
        float scalarValue60 = sampledTextureValue37.y;
        float scalarValue61 = sampledTextureValue37.z;
        float productValue158 = ((sampledTextureValue35.x - scalarValue59) * fragmentVectorConstants1.packedValues[146u].w) + scalarValue59;
        float productValue159 = ((sampledTextureValue35.y - scalarValue60) * fragmentVectorConstants1.packedValues[146u].w) + scalarValue60;
        float productValue162 = ((sampledTextureValue35.z - scalarValue61) * fragmentVectorConstants1.packedValues[146u].w) + scalarValue61;
        float productValue163 = (((quotientValue9 * quotientValue9) * quotientValue9) * fragmentVectorConstants1.packedValues[146u].x) * fragmentVectorConstants1.packedValues[146u].z;
        float comparisonValue82 = (conditionValue1 ? (productValue158 * 301.72412109375) : productValue158) * productValue163;
        float comparisonValue83 = (conditionValue1 ? (productValue159 * 301.72412109375) : productValue159) * productValue163;
        float comparisonValue84 = (conditionValue1 ? (productValue162 * 301.72412109375) : productValue162) * productValue163;
        float comparisonValue19;
        float comparisonValue20;
        float comparisonValue21;
        if (comparisonValue54)
        {
            float productValue165 = fragmentVectorConstants1.packedValues[79u].x * fragmentVectorConstants1.packedValues[79u].w;
            float productValue166 = fragmentVectorConstants1.packedValues[79u].y * fragmentVectorConstants1.packedValues[79u].w;
            float productValue169 = fragmentVectorConstants1.packedValues[79u].z * fragmentVectorConstants1.packedValues[79u].w;
            float productValue170 = fragmentVectorConstants1.packedValues[75u].w * fragmentVectorConstants1.packedValues[87u].x;
            float productValue171 = productValue170 * intermediateValue14;
            float productValue174 = productValue170 * productValue32;
            float productValue175 = productValue170 * productValue33;
            float dotProductValue17 = spvNClamp(dot(vec3(productValue171, productValue174, productValue175), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
            float productValue176 = ((dotProductValue17 * (productValue171 - productValue165)) + productValue165) * intermediateValue4;
            float productValue177 = ((dotProductValue17 * (productValue174 - productValue166)) + productValue166) * intermediateValue4;
            float productValue178 = ((dotProductValue17 * (productValue175 - productValue169)) + productValue169) * intermediateValue4;
            float intermediateValue108;
            float intermediateValue109;
            float intermediateValue110;
            bool intermediateValue111;
            if (!(dot(vec3(comparisonValue82, comparisonValue83, comparisonValue84), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= dot(vec3(productValue176, productValue177, productValue178), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))))
            {
                intermediateValue108 = productValue176;
                intermediateValue109 = productValue177;
                intermediateValue110 = productValue178;
                intermediateValue111 = true;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                multiplyAddValue52 = 1.0;
                intermediateValue69 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue108 = 0.0;
                intermediateValue109 = 0.0;
                intermediateValue110 = 0.0;
                intermediateValue111 = false;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue127 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[299u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[298u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[296u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[297u])));
            float multiplyAddValue128 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[299u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[298u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[296u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[297u])));
            float multiplyAddValue129 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[299u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[298u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[296u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[297u])));
            vec3 vectorValue9 = vec3(multiplyAddValue127, multiplyAddValue128, multiplyAddValue129);
            float inverseLengthValue19 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
            float productValue209 = (exponentialValue3 * (fragmentScalarConstants1.packedValues[539u] * fragmentVectorConstants1.packedValues[134u].x)) * fragmentScalarConstants1.packedValues[576u];
            float productValue210 = (exponentialValue3 * (fragmentScalarConstants1.packedValues[539u] * fragmentVectorConstants1.packedValues[134u].y)) * fragmentScalarConstants1.packedValues[576u];
            float productValue211 = (exponentialValue3 * (fragmentScalarConstants1.packedValues[539u] * fragmentVectorConstants1.packedValues[134u].z)) * fragmentScalarConstants1.packedValues[576u];
            vec3 productValue212 = vec3(inverseLengthValue19 * multiplyAddValue127, inverseLengthValue19 * multiplyAddValue128, inverseLengthValue19 * multiplyAddValue129);
            float scalarValue93 = rdDot3Precise2(vectorValue7, productValue212);
            float scalarValue94 = spvNMax(scalarValue93, 0.0);
            float quotientValue29 = -(multiplyAddValue54 / sumValue113);
            float quotientValue30 = -(multiplyAddValue55 / sumValue113);
            float quotientValue31 = -(multiplyAddValue56 / sumValue113);
            vec3 vectorValue10 = vec3(quotientValue29, quotientValue30, quotientValue31);
            float scalarValue95 = spvNMax(rdDot3Precise2(vectorValue7, vectorValue10), 0.0);
            float sumValue124 = fragmentScalarConstants1.packedValues[625u] + 1.0;
            float productValue213 = sumValue124 * sumValue124;
            float multiplyAddValue130 = fma(productValue202, spvNMax((scalarValue93 + fragmentScalarConstants1.packedValues[625u]) / productValue213, 0.0) - scalarValue94, scalarValue94);
            float quotientValue32 = productValue202 * spvNMax((rdDot3Precise2(vec3(-multiplyAddValue62, -multiplyAddValue63, -multiplyAddValue64), productValue212) + fragmentScalarConstants1.packedValues[625u]) / productValue213, 0.0);
            float multiplyAddValue131 = fma(multiplyAddValue127, inverseLengthValue19, quotientValue29);
            float multiplyAddValue132 = fma(multiplyAddValue128, inverseLengthValue19, quotientValue30);
            float multiplyAddValue133 = fma(multiplyAddValue129, inverseLengthValue19, quotientValue31);
            vec3 vectorValue11 = vec3(multiplyAddValue131, multiplyAddValue132, multiplyAddValue133);
            float inverseLengthValue20 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
            float scalarValue96 = spvNMax(intermediateValue35, 0.0500000007450580596923828125);
            float productValue214 = scalarValue96 * scalarValue96;
            vec3 productValue215 = vec3(inverseLengthValue20 * multiplyAddValue131, inverseLengthValue20 * multiplyAddValue132, inverseLengthValue20 * multiplyAddValue133);
            float scalarValue97 = spvNMax(rdDot3Precise2(vectorValue7, productValue215), 0.0);
            float multiplyAddValue134 = fma(scalarValue97 * scalarValue97, fma(productValue214, productValue214, -1.0), 1.0);
            float quotientValue33 = (productValue214 * productValue214) / ((multiplyAddValue134 * multiplyAddValue134) * 3.1415927410125732421875);
            float productValue216 = productValue214 * 0.5;
            float multiplyAddValue135 = fma(-productValue214, 0.5, 1.0);
            float multiplyAddValue136 = (scalarValue94 / (fma(scalarValue94, multiplyAddValue135, productValue216) + 9.9999997473787516355514526367188e-05)) * (scalarValue95 / (fma(scalarValue95, multiplyAddValue135, productValue216) + 9.9999997473787516355514526367188e-05));
            float sumValue125 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue10, productValue215), 0.0), 0.0);
            float productValue217 = sumValue125 * sumValue125;
            float productValue218 = sumValue125 * (productValue217 * productValue217);
            float multiplyAddValue137 = fma(1.0 - multiplyAddValue86, productValue218, multiplyAddValue86);
            float multiplyAddValue138 = fma(1.0 - multiplyAddValue87, productValue218, multiplyAddValue87);
            float multiplyAddValue139 = fma(1.0 - multiplyAddValue88, productValue218, multiplyAddValue88);
            float productValue219 = (exponentialValue6 * sumValue112) * 0.3183098733425140380859375;
            float productValue220 = (exponentialValue7 * sumValue112) * 0.3183098733425140380859375;
            float productValue221 = (exponentialValue8 * sumValue112) * 0.3183098733425140380859375;
            float multiplyAddValue140 = fma(scalarValue94 * scalarValue95, 4.0, 9.9999997473787516355514526367188e-05);
            multiplyAddValue45 = (productValue209 * fma(productValue219 * (multiplyAddValue130 * (1.0 - multiplyAddValue137)), multiplyAddValue52, intermediateValue69 * (quotientValue32 * productValue219))) * fragmentScalarConstants1.packedValues[544u];
            multiplyAddValue44 = (productValue210 * fma(productValue220 * (multiplyAddValue130 * (1.0 - multiplyAddValue138)), multiplyAddValue52, intermediateValue69 * (quotientValue32 * productValue220))) * fragmentScalarConstants1.packedValues[544u];
            multiplyAddValue43 = (productValue211 * fma(productValue221 * (multiplyAddValue130 * (1.0 - multiplyAddValue139)), multiplyAddValue52, intermediateValue69 * (quotientValue32 * productValue221))) * fragmentScalarConstants1.packedValues[544u];
            quotientValue5 = (productValue209 * (multiplyAddValue52 * (scalarValue94 * ((multiplyAddValue136 * (quotientValue33 * multiplyAddValue137)) / multiplyAddValue140)))) * fragmentScalarConstants1.packedValues[545u];
            quotientValue4 = (productValue210 * (multiplyAddValue52 * (scalarValue94 * ((multiplyAddValue136 * (quotientValue33 * multiplyAddValue138)) / multiplyAddValue140)))) * fragmentScalarConstants1.packedValues[545u];
            quotientValue3 = (productValue211 * (multiplyAddValue52 * (scalarValue94 * ((multiplyAddValue136 * (quotientValue33 * multiplyAddValue139)) / multiplyAddValue140)))) * fragmentScalarConstants1.packedValues[545u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            comparisonValue19 = intermediateValue111 ? intermediateValue108 : comparisonValue82;
            comparisonValue20 = intermediateValue111 ? intermediateValue109 : comparisonValue83;
            comparisonValue21 = intermediateValue111 ? intermediateValue110 : comparisonValue84;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue45 = 0.0;
            multiplyAddValue44 = 0.0;
            multiplyAddValue43 = 0.0;
            quotientValue5 = 0.0;
            quotientValue4 = 0.0;
            quotientValue3 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            comparisonValue19 = comparisonValue82;
            comparisonValue20 = comparisonValue83;
            comparisonValue21 = comparisonValue84;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float intermediateValue80;
        float intermediateValue82;
        float intermediateValue84;
        if (fragmentScalarConstants1.packedValues[579u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue39 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), vec3((-0.0) - (multiplyAddValue28 * inverseLengthValue11), (-0.0) - (multiplyAddValue29 * inverseLengthValue11), (-0.0) - (multiplyAddValue30 * inverseLengthValue11))), 0.0, 1.0), sumValue110));
        float scalarValue62 = sampledTextureValue39.x;
        float scalarValue63 = sampledTextureValue39.y;
        float quotientValue24 = (fragmentVectorConstants1.packedValues[152u].x - fragmentVectorConstants1.packedValues[81u].x) + (nonlinearValue / fragmentVectorConstants1.packedValues[81u].z);
        float comparisonValue85 = 1.0 - spvNClamp(comparisonValue56 ? (quotientValue24 * fragmentVectorConstants1.packedValues[81u].y) : (quotientValue24 / (fragmentVectorConstants1.packedValues[81u].y - fragmentVectorConstants1.packedValues[81u].x)), 0.0, 1.0);
        float productValue179 = (((scalarValue62 * productValue35) + scalarValue63) * comparisonValue19) * comparisonValue85;
        float productValue180 = (((scalarValue62 * productValue36) + scalarValue63) * comparisonValue20) * comparisonValue85;
        float productValue181 = (((scalarValue62 * productValue37) + scalarValue63) * comparisonValue21) * comparisonValue85;
        float branchMergedValue12;
        float branchMergedValue21;
        float branchMergedValue22;
        if (comparisonValue55)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue141 = fma(productValue187, 0.20000000298023223876953125, sumValue - 0.5);
            float multiplyAddValue142 = fma(productValue188, 0.20000000298023223876953125, sumValue1 - 0.5);
            float multiplyAddValue143 = fma(productValue189, 0.20000000298023223876953125, sumValue2 - 0.5);
            uint productValue222 = uint(int(floor(floor(multiplyAddValue141) * 0.0625)));
            uint productValue223 = uint(int(floor(floor(multiplyAddValue142) * 0.0625)));
            uint productValue224 = uint(int(floor(floor(multiplyAddValue143) * 0.0625)));
            uint scalarValue98 = bitfieldInsert(productValue222, productValue223, int(16u), int(16u));
            uint bitwiseValue41 = productValue224 & 65535u;
            uint productValue225 = productValue222 * 1540483477u;
            uint productValue226 = productValue223 * 1540483477u;
            uint productValue227 = productValue224 * 1540483477u;
            uint bitwiseValue42 = (((((productValue226 ^ (productValue226 >> 24u)) * 1540483477u) ^ ((((productValue225 ^ (productValue225 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u) ^ ((productValue227 ^ (productValue227 >> 24u)) * 1540483477u)) * 1540483477u;
            uint bitwiseValue43 = ((bitwiseValue42 >> 13u) ^ bitwiseValue42) * 1540483477u;
            uint bitwiseValue44 = bitwiseValue43 ^ (bitwiseValue43 >> 15u);
            uint bitwiseValue45 = (bitwiseValue44 ^ (bitwiseValue44 >> 16u)) & 65535u;
            bool comparisonValue109 = bitwiseValue45 != 0u;
            uint bitwiseValue46 = bitwiseValue45 | 1u;
            uint sumValue126 = uint(fragmentScalarConstants1.packedValues[304u]) - 1u;
            uint comparisonValue110 = (comparisonValue109 ? bitwiseValue45 : bitwiseValue46) & sumValue126;
            uint comparisonValue12;
            uint comparisonValue13;
            uint bitwiseValue9;
            uint sumValue15;
            uint intermediateValue123;
            uint intermediateValue124;
            uint scalarValue99 = 0u;
            uint scalarValue100 = 0u;
            uint scalarValue101 = comparisonValue110;
            uint scalarValue102 = 0u;
            for (;;)
            {
                if (int(scalarValue102) >= int(8u))
                {
                    intermediateValue123 = scalarValue100;
                    intermediateValue124 = scalarValue99;
                    break;
                }
                uint bitwiseValue47 = intermediateValue9.packedValues[scalarValue101].z & 65535u;
                bool comparisonValue111 = (bitwiseValue41 == intermediateValue9.packedValues[scalarValue101].y) && (((comparisonValue109 && (bitwiseValue45 == bitwiseValue47)) || ((!comparisonValue109) && (bitwiseValue46 == bitwiseValue47))) && (scalarValue98 == intermediateValue9.packedValues[scalarValue101].x));
                bool comparisonValue112 = scalarValue99 != 0u;
                comparisonValue13 = (comparisonValue112 || (!comparisonValue111)) ? scalarValue100 : intermediateValue9.packedValues[scalarValue101].w;
                comparisonValue12 = comparisonValue111 ? 4294967295u : scalarValue99;
                bitwiseValue9 = sumValue126 & (scalarValue101 + 1u);
                bool comparisonValue113 = (bitwiseValue47 == 0u) || comparisonValue111;
                if (comparisonValue113 || (comparisonValue112 && (!comparisonValue113)))
                {
                    intermediateValue123 = comparisonValue13;
                    intermediateValue124 = comparisonValue12;
                    break;
                }
                sumValue15 = scalarValue102 + 1u;
                scalarValue99 = comparisonValue12;
                scalarValue100 = comparisonValue13;
                scalarValue101 = bitwiseValue9;
                scalarValue102 = sumValue15;
                continue;
            }
            float intermediateValue81;
            float intermediateValue83;
            float intermediateValue85;
            if (intermediateValue124 != 0u)
            {
                float productValue228 = floor(multiplyAddValue141 * 0.0625);
                float productValue229 = floor(multiplyAddValue142 * 0.0625);
                float productValue230 = floor(multiplyAddValue143 * 0.0625);
                float multiplyAddValue144 = fma(-productValue228, 16.0, multiplyAddValue141);
                float multiplyAddValue145 = fma(-productValue229, 16.0, multiplyAddValue142);
                float multiplyAddValue146 = fma(-productValue230, 16.0, multiplyAddValue143);
                uint bitwiseValue48 = intermediateValue123 >> 2u;
                float scalarValue103 = abs(productValue187);
                float scalarValue104 = abs(productValue188);
                float scalarValue105 = abs(productValue189);
                float multiplyAddValue114;
                float multiplyAddValue115;
                float multiplyAddValue116;
                if (((scalarValue103 >= 1.0) || (scalarValue104 >= 1.0)) || (scalarValue105 >= 1.0))
                {
                    vec3 vectorValue12 = vec3(scalarValue103, scalarValue104, scalarValue105);
                    float scalarValue106 = rdDot3Precise2(vec3(multiplyAddValue144, multiplyAddValue145, multiplyAddValue146), vectorValue12);
                    float scalarValue107 = rdDot3Precise2(vec3(multiplyAddValue145, multiplyAddValue146, multiplyAddValue144), vectorValue12);
                    float scalarValue108 = rdDot3Precise2(vec3(multiplyAddValue146, multiplyAddValue144, multiplyAddValue145), vectorValue12);
                    float multiplyAddValue147 = (fma(multiplyAddValue6, inverseLengthValue12, productValue188 + productValue187) > 0.0) ? ceil(scalarValue106) : floor(scalarValue106);
                    float scalarValue109 = floor(scalarValue107);
                    float scalarValue110 = floor(scalarValue108);
                    float multiplyAddValue148 = fma(scalarValue104, scalarValue110, fma(scalarValue103, multiplyAddValue147, scalarValue109 * scalarValue105));
                    float multiplyAddValue149 = fma(scalarValue105, scalarValue110, fma(scalarValue104, multiplyAddValue147, scalarValue109 * scalarValue103));
                    float multiplyAddValue150 = fma(scalarValue103, scalarValue110, fma(scalarValue105, multiplyAddValue147, scalarValue109 * scalarValue104));
                    float sumValue127 = scalarValue105 + multiplyAddValue148;
                    float sumValue128 = scalarValue103 + multiplyAddValue149;
                    float sumValue129 = scalarValue104 + multiplyAddValue150;
                    float sumValue130 = scalarValue104 + multiplyAddValue148;
                    float sumValue131 = scalarValue105 + multiplyAddValue149;
                    float sumValue132 = scalarValue103 + multiplyAddValue150;
                    float sumValue133 = scalarValue104 + sumValue127;
                    float sumValue134 = scalarValue105 + sumValue128;
                    float sumValue135 = scalarValue103 + sumValue129;
                    float sumValue136 = scalarValue107 - scalarValue109;
                    float sumValue137 = scalarValue108 - scalarValue110;
                    float sumValue138 = (scalarValue109 - scalarValue107) + 1.0;
                    float sumValue139 = (scalarValue110 - scalarValue108) + 1.0;
                    float productValue231 = sumValue138 * sumValue139;
                    float productValue232 = sumValue136 * sumValue139;
                    float productValue233 = sumValue137 * sumValue138;
                    float productValue234 = sumValue137 * sumValue136;
                    float comparisonValue58;
                    float comparisonValue59;
                    float comparisonValue60;
                    float comparisonValue61;
                    float comparisonValue62;
                    float comparisonValue63;
                    float comparisonValue64;
                    float comparisonValue65;
                    float comparisonValue66;
                    float comparisonValue67;
                    float comparisonValue68;
                    float comparisonValue69;
                    if (((sumValue135 < 16.0) && ((sumValue133 < 16.0) && (sumValue134 < 16.0))) && (((multiplyAddValue149 >= 0.0) && (multiplyAddValue148 >= 0.0)) && (multiplyAddValue150 >= 0.0)))
                    {
                        uint bitwiseValue49 = bitwiseValue48 + ((uint(multiplyAddValue149) + (uint(multiplyAddValue150) << 4u)) + (uint(multiplyAddValue148) << 8u));
                        float bitwiseValue50 = rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue49] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue114 = intermediateValue10.packedValues[bitwiseValue49] != 0u;
                        uint bitwiseValue51 = bitwiseValue48 + (((uint(sumValue129) << 4u) + uint(sumValue128)) + (uint(sumValue127) << 8u));
                        float bitwiseValue52 = rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue51] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue115 = intermediateValue10.packedValues[bitwiseValue51] != 0u;
                        uint bitwiseValue53 = bitwiseValue48 + (((uint(sumValue132) << 4u) + uint(sumValue131)) + (uint(sumValue130) << 8u));
                        float bitwiseValue54 = rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue53] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue116 = intermediateValue10.packedValues[bitwiseValue53] != 0u;
                        uint bitwiseValue55 = bitwiseValue48 + (((uint(sumValue135) << 4u) + uint(sumValue134)) + (uint(sumValue133) << 8u));
                        float bitwiseValue56 = rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue55] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue117 = intermediateValue10.packedValues[bitwiseValue55] != 0u;
                        comparisonValue58 = comparisonValue117 ? ((bitwiseValue56 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue55] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue59 = comparisonValue117 ? ((bitwiseValue56 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue55] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue60 = comparisonValue117 ? ((bitwiseValue56 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[bitwiseValue55] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue61 = comparisonValue116 ? ((bitwiseValue54 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue53] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue62 = comparisonValue116 ? ((bitwiseValue54 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue53] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue63 = comparisonValue116 ? ((bitwiseValue54 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[bitwiseValue53] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue64 = comparisonValue114 ? ((bitwiseValue50 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue49] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue65 = comparisonValue114 ? ((bitwiseValue50 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue49] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue66 = comparisonValue114 ? ((bitwiseValue50 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[bitwiseValue49] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue67 = comparisonValue115 ? ((bitwiseValue52 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue51] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue68 = comparisonValue115 ? ((bitwiseValue52 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue51] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue69 = comparisonValue115 ? ((bitwiseValue52 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[bitwiseValue51] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    else
                    {
                        float multiplyAddValue151 = fma(productValue228, 16.0, multiplyAddValue148);
                        float multiplyAddValue152 = fma(productValue229, 16.0, multiplyAddValue149);
                        float multiplyAddValue153 = fma(productValue230, 16.0, multiplyAddValue150);
                        uint comparisonValue118 = min((((((bitfieldInsert(bitfieldInsert(0u, (multiplyAddValue148 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (multiplyAddValue148 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (multiplyAddValue149 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue149 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue150 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue150 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue6 = int(intermediateValue22[comparisonValue118].x) < int(0u);
                        uint sumValue140 = bitwiseValue48 + 4097u;
                        uint sumValue141 = bitwiseValue48 + 4096u;
                        uint multiplyAddValue154 = conditionValue6 ? (bitwiseValue48 + (bitfieldInsert(bitfieldInsert(0u, uint(multiplyAddValue150), int(4u), int(4u)), uint(multiplyAddValue149), int(0u), int(4u)) + bitfieldInsert(0u, uint(multiplyAddValue148), int(8u), int(4u)))) : ((intermediateValue10.packedValues[intermediateValue22[comparisonValue118].x + sumValue140] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue153 * 0.0625), 16.0, multiplyAddValue153)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue152 * 0.0625), 16.0, multiplyAddValue152)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue151 * 0.0625), 16.0, multiplyAddValue151)), int(8u), int(4u))));
                        float bitwiseValue57 = rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue154] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue119 = (conditionValue6 || ((intermediateValue10.packedValues[sumValue141] & (1u << (intermediateValue22[comparisonValue118].x & 31u))) != 0u)) && (intermediateValue10.packedValues[multiplyAddValue154] != 0u);
                        float multiplyAddValue155 = fma(productValue228, 16.0, sumValue127);
                        float multiplyAddValue156 = fma(productValue229, 16.0, sumValue128);
                        float multiplyAddValue157 = fma(productValue230, 16.0, sumValue129);
                        uint comparisonValue120 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue127 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue127 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue128 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue128 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue129 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue129 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue7 = int(intermediateValue22[comparisonValue120].x) < int(0u);
                        uint multiplyAddValue158 = conditionValue7 ? (bitwiseValue48 + (bitfieldInsert(0u, uint(sumValue127), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue129), int(4u), int(4u)), uint(sumValue128), int(0u), int(4u)))) : ((intermediateValue10.packedValues[intermediateValue22[comparisonValue120].x + sumValue140] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue157 * 0.0625), 16.0, multiplyAddValue157)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue156 * 0.0625), 16.0, multiplyAddValue156)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue155 * 0.0625), 16.0, multiplyAddValue155)), int(8u), int(4u))));
                        float bitwiseValue58 = rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue158] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue121 = (conditionValue7 || ((intermediateValue10.packedValues[sumValue141] & (1u << (intermediateValue22[comparisonValue120].x & 31u))) != 0u)) && (intermediateValue10.packedValues[multiplyAddValue158] != 0u);
                        float multiplyAddValue159 = fma(productValue228, 16.0, sumValue130);
                        float multiplyAddValue160 = fma(productValue229, 16.0, sumValue131);
                        float multiplyAddValue161 = fma(productValue230, 16.0, sumValue132);
                        uint comparisonValue122 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue130 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue130 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue131 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue131 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue132 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue132 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue8 = int(intermediateValue22[comparisonValue122].x) < int(0u);
                        uint multiplyAddValue162 = conditionValue8 ? (bitwiseValue48 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue132), int(4u), int(4u)), uint(sumValue131), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue130), int(8u), int(4u)))) : ((intermediateValue10.packedValues[intermediateValue22[comparisonValue122].x + sumValue140] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue161 * 0.0625), 16.0, multiplyAddValue161)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue160 * 0.0625), 16.0, multiplyAddValue160)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue159 * 0.0625), 16.0, multiplyAddValue159)), int(8u), int(4u))));
                        float bitwiseValue59 = rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue162] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue123 = (conditionValue8 || ((intermediateValue10.packedValues[sumValue141] & (1u << (intermediateValue22[comparisonValue122].x & 31u))) != 0u)) && (intermediateValue10.packedValues[multiplyAddValue162] != 0u);
                        float multiplyAddValue163 = fma(productValue228, 16.0, sumValue133);
                        float multiplyAddValue166 = fma(productValue229, 16.0, sumValue134);
                        float multiplyAddValue167 = fma(productValue230, 16.0, sumValue135);
                        uint comparisonValue124 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue133 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue133 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue134 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue134 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue135 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue135 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue9 = int(intermediateValue22[comparisonValue124].x) < int(0u);
                        uint multiplyAddValue168 = conditionValue9 ? (bitwiseValue48 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue135), int(4u), int(4u)), uint(sumValue134), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue133), int(8u), int(4u)))) : ((intermediateValue10.packedValues[intermediateValue22[comparisonValue124].x + sumValue140] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue167 * 0.0625), 16.0, multiplyAddValue167)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue166 * 0.0625), 16.0, multiplyAddValue166)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue163 * 0.0625), 16.0, multiplyAddValue163)), int(8u), int(4u))));
                        float bitwiseValue60 = rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue168] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue125 = (conditionValue9 || ((intermediateValue10.packedValues[sumValue141] & (1u << (intermediateValue22[comparisonValue124].x & 31u))) != 0u)) && (intermediateValue10.packedValues[multiplyAddValue168] != 0u);
                        comparisonValue58 = comparisonValue125 ? ((bitwiseValue60 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue168] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue59 = comparisonValue125 ? ((bitwiseValue60 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue168] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue60 = comparisonValue125 ? ((bitwiseValue60 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[multiplyAddValue168] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue61 = comparisonValue123 ? ((bitwiseValue59 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue162] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue62 = comparisonValue123 ? ((bitwiseValue59 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue162] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue63 = comparisonValue123 ? ((bitwiseValue59 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[multiplyAddValue162] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue64 = comparisonValue119 ? ((bitwiseValue57 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue154] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue65 = comparisonValue119 ? ((bitwiseValue57 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue154] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue66 = comparisonValue119 ? ((bitwiseValue57 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[multiplyAddValue154] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue67 = comparisonValue121 ? ((bitwiseValue58 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue158] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue68 = comparisonValue121 ? ((bitwiseValue58 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue158] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue69 = comparisonValue121 ? ((bitwiseValue58 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[multiplyAddValue158] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    multiplyAddValue114 = fma(comparisonValue60, productValue234, fma(comparisonValue63, productValue233, fma(comparisonValue66, productValue231, productValue232 * comparisonValue69)));
                    multiplyAddValue115 = fma(comparisonValue59, productValue234, fma(comparisonValue62, productValue233, fma(comparisonValue65, productValue231, productValue232 * comparisonValue68)));
                    multiplyAddValue116 = fma(comparisonValue58, productValue234, fma(comparisonValue61, productValue233, fma(comparisonValue64, productValue231, productValue232 * comparisonValue67)));
                }
                else
                {
                    float scalarValue111 = floor(multiplyAddValue144);
                    float scalarValue112 = floor(multiplyAddValue145);
                    float scalarValue113 = floor(multiplyAddValue146);
                    float sumValue142 = multiplyAddValue144 - scalarValue111;
                    float sumValue143 = multiplyAddValue145 - scalarValue112;
                    float sumValue144 = multiplyAddValue146 - scalarValue113;
                    uint comparisonValue126 = bitfieldInsert(bitfieldInsert(0u, (sumValue143 >= sumValue144) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue142 >= sumValue143) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue142 >= sumValue144) ? 4294967295u : 0u, int(2u), int(1u));
                    float scalarValue114 = spvNMin(sumValue143, sumValue142);
                    float scalarValue115 = spvNMax(sumValue143, sumValue142);
                    float scalarValue116 = spvNMin(sumValue144, scalarValue114);
                    float scalarValue117 = spvNMax(sumValue144, scalarValue115);
                    float scalarValue118 = spvNMax(scalarValue114, spvNMin(sumValue144, scalarValue115));
                    float sumValue145 = 1.0 - scalarValue117;
                    float sumValue146 = scalarValue117 - scalarValue118;
                    float sumValue147 = scalarValue118 - scalarValue116;
                    float sumValue148 = scalarValue111 + 1.0;
                    float sumValue149 = scalarValue112 + 1.0;
                    float sumValue150 = scalarValue113 + 1.0;
                    float comparisonValue70;
                    float comparisonValue71;
                    float comparisonValue72;
                    float comparisonValue73;
                    float comparisonValue74;
                    float comparisonValue75;
                    float comparisonValue76;
                    float comparisonValue77;
                    float comparisonValue78;
                    float comparisonValue79;
                    float comparisonValue80;
                    float comparisonValue81;
                    if (((sumValue150 < 16.0) && ((sumValue148 < 16.0) && (sumValue149 < 16.0))) && (((scalarValue111 >= 0.0) && (scalarValue112 >= 0.0)) && (scalarValue113 >= 0.0)))
                    {
                        uint scalarValue119 = uint(scalarValue111);
                        uint scalarValue120 = uint(scalarValue112);
                        uint scalarValue121 = uint(scalarValue113);
                        uint sumValue151 = min((comparisonValue126 + 4u), 68u);
                        uint sumValue152 = min((comparisonValue126 + 12u), 68u);
                        uint bitwiseValue61 = bitwiseValue48 + ((scalarValue119 << 8u) + ((scalarValue121 << 4u) + scalarValue120));
                        float bitwiseValue62 = rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue61] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue127 = intermediateValue10.packedValues[bitwiseValue61] != 0u;
                        uint bitwiseValue63 = bitwiseValue48 + (((scalarValue119 + intermediateValue22[sumValue151].y) << 8u) + (((uint(comparisonValue126 < 2u) + scalarValue121) << 4u) + (intermediateValue22[sumValue151].z + scalarValue120)));
                        float bitwiseValue64 = rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue63] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue128 = intermediateValue10.packedValues[bitwiseValue63] != 0u;
                        uint bitwiseValue65 = bitwiseValue48 + (((intermediateValue22[sumValue152].y + scalarValue119) << 8u) + (((scalarValue121 + uint(comparisonValue126 < 6u)) << 4u) + (intermediateValue22[sumValue152].z + scalarValue120)));
                        float bitwiseValue66 = rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue65] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue129 = intermediateValue10.packedValues[bitwiseValue65] != 0u;
                        uint bitwiseValue67 = bitwiseValue48 + (((scalarValue120 + 1u) + ((scalarValue121 + 1u) << 4u)) + ((scalarValue119 + 1u) << 8u));
                        float bitwiseValue68 = rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue67] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue130 = intermediateValue10.packedValues[bitwiseValue67] != 0u;
                        comparisonValue70 = comparisonValue130 ? ((bitwiseValue68 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue67] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue71 = comparisonValue130 ? ((bitwiseValue68 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue67] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue72 = comparisonValue130 ? ((bitwiseValue68 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[bitwiseValue67] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue73 = comparisonValue129 ? ((bitwiseValue66 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue65] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue74 = comparisonValue129 ? ((bitwiseValue66 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue65] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue75 = comparisonValue129 ? ((bitwiseValue66 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[bitwiseValue65] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue76 = comparisonValue127 ? ((bitwiseValue62 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue61] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue77 = comparisonValue127 ? ((bitwiseValue62 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue61] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue78 = comparisonValue127 ? ((bitwiseValue62 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[bitwiseValue61] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue79 = comparisonValue128 ? ((bitwiseValue64 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue63] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue80 = comparisonValue128 ? ((bitwiseValue64 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[bitwiseValue63] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue81 = comparisonValue128 ? ((bitwiseValue64 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[bitwiseValue63] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    else
                    {
                        uint sumValue153 = min((comparisonValue126 + 4u), 68u);
                        float sumValue154 = scalarValue111 + rdEvaluateFloatExpression(intermediateValue22[sumValue153].y);
                        float sumValue155 = scalarValue112 + rdEvaluateFloatExpression(intermediateValue22[sumValue153].z);
                        float sumValue156 = scalarValue113 + rdEvaluateFloatExpression(uint(comparisonValue126 < 2u));
                        uint sumValue157 = min((comparisonValue126 + 12u), 68u);
                        float sumValue158 = scalarValue111 + rdEvaluateFloatExpression(intermediateValue22[sumValue157].y);
                        float sumValue159 = scalarValue112 + rdEvaluateFloatExpression(intermediateValue22[sumValue157].z);
                        float sumValue160 = scalarValue113 + rdEvaluateFloatExpression(uint(comparisonValue126 < 6u));
                        float multiplyAddValue169 = fma(productValue228, 16.0, scalarValue111);
                        float multiplyAddValue170 = fma(productValue229, 16.0, scalarValue112);
                        float multiplyAddValue171 = fma(productValue230, 16.0, scalarValue113);
                        uint comparisonValue131 = min((((((bitfieldInsert(bitfieldInsert(0u, (scalarValue111 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (scalarValue111 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (scalarValue112 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (scalarValue112 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (scalarValue113 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (scalarValue113 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue10 = int(intermediateValue22[comparisonValue131].x) < int(0u);
                        uint sumValue161 = bitwiseValue48 + 4097u;
                        uint sumValue162 = bitwiseValue48 + 4096u;
                        uint multiplyAddValue172 = conditionValue10 ? (bitwiseValue48 + (bitfieldInsert(bitfieldInsert(0u, uint(scalarValue113), int(4u), int(4u)), uint(scalarValue112), int(0u), int(4u)) + bitfieldInsert(0u, uint(scalarValue111), int(8u), int(4u)))) : ((intermediateValue10.packedValues[intermediateValue22[comparisonValue131].x + sumValue161] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue171 * 0.0625), 16.0, multiplyAddValue171)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue170 * 0.0625), 16.0, multiplyAddValue170)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue169 * 0.0625), 16.0, multiplyAddValue169)), int(8u), int(4u))));
                        float bitwiseValue69 = rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue172] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue132 = (conditionValue10 || ((intermediateValue10.packedValues[sumValue162] & (1u << (intermediateValue22[comparisonValue131].x & 31u))) != 0u)) && (intermediateValue10.packedValues[multiplyAddValue172] != 0u);
                        float multiplyAddValue173 = fma(productValue228, 16.0, sumValue154);
                        float multiplyAddValue174 = fma(productValue229, 16.0, sumValue155);
                        float multiplyAddValue175 = fma(productValue230, 16.0, sumValue156);
                        uint comparisonValue133 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue154 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue154 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue155 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue155 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue156 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue156 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue11 = int(intermediateValue22[comparisonValue133].x) < int(0u);
                        uint multiplyAddValue176 = conditionValue11 ? (bitwiseValue48 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue156), int(4u), int(4u)), uint(sumValue155), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue154), int(8u), int(4u)))) : ((intermediateValue10.packedValues[intermediateValue22[comparisonValue133].x + sumValue161] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue175 * 0.0625), 16.0, multiplyAddValue175)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue174 * 0.0625), 16.0, multiplyAddValue174)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue173 * 0.0625), 16.0, multiplyAddValue173)), int(8u), int(4u))));
                        float bitwiseValue70 = rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue176] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue134 = (conditionValue11 || ((intermediateValue10.packedValues[sumValue162] & (1u << (intermediateValue22[comparisonValue133].x & 31u))) != 0u)) && (intermediateValue10.packedValues[multiplyAddValue176] != 0u);
                        float multiplyAddValue177 = fma(productValue228, 16.0, sumValue158);
                        float multiplyAddValue178 = fma(productValue229, 16.0, sumValue159);
                        float multiplyAddValue179 = fma(productValue230, 16.0, sumValue160);
                        uint comparisonValue135 = min(((bitfieldInsert(0u, (sumValue160 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue160 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue159 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue158 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue158 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue159 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue12 = int(intermediateValue22[comparisonValue135].x) < int(0u);
                        uint multiplyAddValue180 = conditionValue12 ? (bitwiseValue48 + (bitfieldInsert(0u, uint(sumValue158), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue160), int(4u), int(4u)), uint(sumValue159), int(0u), int(4u)))) : ((intermediateValue10.packedValues[intermediateValue22[comparisonValue135].x + sumValue161] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue177 * 0.0625), 16.0, multiplyAddValue177)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue179 * 0.0625), 16.0, multiplyAddValue179)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue178 * 0.0625), 16.0, multiplyAddValue178)), int(0u), int(4u))));
                        float bitwiseValue71 = rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue180] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue136 = (conditionValue12 || ((intermediateValue10.packedValues[sumValue162] & (1u << (intermediateValue22[comparisonValue135].x & 31u))) != 0u)) && (intermediateValue10.packedValues[multiplyAddValue180] != 0u);
                        float multiplyAddValue181 = fma(productValue228, 16.0, sumValue148);
                        float multiplyAddValue182 = fma(productValue229, 16.0, sumValue149);
                        float multiplyAddValue183 = fma(productValue230, 16.0, sumValue150);
                        uint comparisonValue137 = min(((bitfieldInsert(0u, (sumValue150 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue150 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue149 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue148 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue148 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue149 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue13 = int(intermediateValue22[comparisonValue137].x) < int(0u);
                        uint multiplyAddValue184 = conditionValue13 ? (bitwiseValue48 + (bitfieldInsert(0u, uint(sumValue148), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue150), int(4u), int(4u)), uint(sumValue149), int(0u), int(4u)))) : ((intermediateValue10.packedValues[intermediateValue22[comparisonValue137].x + sumValue161] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue181 * 0.0625), 16.0, multiplyAddValue181)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue183 * 0.0625), 16.0, multiplyAddValue183)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue182 * 0.0625), 16.0, multiplyAddValue182)), int(0u), int(4u))));
                        float bitwiseValue72 = rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue184] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue138 = (conditionValue13 || ((intermediateValue10.packedValues[sumValue162] & (1u << (intermediateValue22[comparisonValue137].x & 31u))) != 0u)) && (intermediateValue10.packedValues[multiplyAddValue184] != 0u);
                        comparisonValue70 = comparisonValue138 ? ((bitwiseValue72 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue184] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue71 = comparisonValue138 ? ((bitwiseValue72 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue184] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue72 = comparisonValue138 ? ((bitwiseValue72 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[multiplyAddValue184] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue73 = comparisonValue136 ? ((bitwiseValue71 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue180] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue74 = comparisonValue136 ? ((bitwiseValue71 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue180] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue75 = comparisonValue136 ? ((bitwiseValue71 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[multiplyAddValue180] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue76 = comparisonValue132 ? ((bitwiseValue69 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue172] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue77 = comparisonValue132 ? ((bitwiseValue69 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue172] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue78 = comparisonValue132 ? ((bitwiseValue69 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[multiplyAddValue172] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue79 = comparisonValue134 ? ((bitwiseValue70 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue176] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue80 = comparisonValue134 ? ((bitwiseValue70 * (rdEvaluateFloatExpression((intermediateValue10.packedValues[multiplyAddValue176] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue81 = comparisonValue134 ? ((bitwiseValue70 * (rdEvaluateFloatExpression(intermediateValue10.packedValues[multiplyAddValue176] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    multiplyAddValue114 = fma(comparisonValue72, scalarValue116, fma(comparisonValue75, sumValue147, fma(comparisonValue78, sumValue145, sumValue146 * comparisonValue81)));
                    multiplyAddValue115 = fma(comparisonValue71, scalarValue116, fma(comparisonValue74, sumValue147, fma(comparisonValue77, sumValue145, sumValue146 * comparisonValue80)));
                    multiplyAddValue116 = fma(comparisonValue70, scalarValue116, fma(comparisonValue73, sumValue147, fma(comparisonValue76, sumValue145, sumValue146 * comparisonValue79)));
                }
                intermediateValue85 = multiplyAddValue114;
                intermediateValue83 = multiplyAddValue115;
                intermediateValue81 = multiplyAddValue116;
            }
            else
            {
                intermediateValue85 = 0.0;
                intermediateValue83 = 0.0;
                intermediateValue81 = 0.0;
            }
            intermediateValue80 = intermediateValue81;
            intermediateValue82 = intermediateValue83;
            intermediateValue84 = intermediateValue85;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue182 = (multiplyAddValue5 + 1.0) * 0.5;
            float productValue183 = (multiplyAddValue9 + 1.0) * 0.5;
            uint scalarValue64 = uint(int(fragmentVectorConstants1.packedValues[159u].z));
            float multiplyAddValue46 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[16u].z + fma(fragmentVectorConstants1.packedValues[15u].z, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue9, multiplyAddValue5 * fragmentVectorConstants1.packedValues[13u].z)))) / (fma(fragmentVectorConstants1.packedValues[15u].w, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue9, multiplyAddValue5 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[16u].w)) - fragmentVectorConstants1.packedValues[160u].x) / (fragmentVectorConstants1.packedValues[160u].y - fragmentVectorConstants1.packedValues[160u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue64))) + (-0.5);
            uint sumValue111 = uint(min(int(uint(max(int(uint(int(multiplyAddValue46))), int(0u)))), int(scalarValue64 + 4294967294u)));
            float scalarValue65 = float(int(sumValue111));
            vec4 sampledTextureValue41 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue182, productValue183, scalarValue65), 0.0);
            float scalarValue66 = sampledTextureValue41.w;
            float sampledTextureValue42 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue182, productValue183, float(int(sumValue111 + 1u))), 0.0).w - scalarValue66) * spvNMin(spvNMax(multiplyAddValue46 - scalarValue65, 0.0), 1.0)) + scalarValue66;
            branchMergedValue12 = sampledTextureValue42 * productValue181;
            branchMergedValue21 = sampledTextureValue42 * productValue180;
            branchMergedValue22 = sampledTextureValue42 * productValue179;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue80 = multiplyAddValue85;
            intermediateValue82 = multiplyAddValue84;
            intermediateValue84 = comparisonValue90;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue12 = productValue181;
            branchMergedValue21 = productValue180;
            branchMergedValue22 = productValue179;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float productValue111 = varyingTexCoord1.y * varyingTexCoord1.y;
        float productValue235 = (productValue111 * productValue111) * varyingTexCoord1.y;
        float multiplyAddValue185 = fma(fragmentScalarConstants1.packedValues[357u], fma(productValue111, varyingTexCoord1.y, -productValue235), productValue235);
        float scalarValue122 = rdDot3Precise2(vec3(exponentialValue6, exponentialValue7, exponentialValue8), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        multiplyAddValue37 = (intermediateValue34 * (fma(fragmentScalarConstants1.packedValues[573u], scalarValue122 - exponentialValue8, exponentialValue8) * fragmentScalarConstants1.packedValues[546u])) * fragmentScalarConstants1.packedValues[572u];
        multiplyAddValue38 = (intermediateValue34 * (fma(fragmentScalarConstants1.packedValues[573u], scalarValue122 - exponentialValue7, exponentialValue7) * fragmentScalarConstants1.packedValues[546u])) * fragmentScalarConstants1.packedValues[572u];
        multiplyAddValue39 = (intermediateValue34 * (fma(fragmentScalarConstants1.packedValues[573u], scalarValue122 - exponentialValue6, exponentialValue6) * fragmentScalarConstants1.packedValues[546u])) * fragmentScalarConstants1.packedValues[572u];
        intermediateValue54 = quotientValue3;
        intermediateValue55 = quotientValue4;
        intermediateValue56 = quotientValue5;
        multiplyAddValue40 = ((exponentialValue8 * sumValue112) * spvNMax(fma(intermediateValue80, fragmentScalarConstants1.packedValues[303u], (multiplyAddValue185 * fragmentVectorConstants1.packedValues[154u].z) * fragmentScalarConstants1.packedValues[619u]), fragmentScalarConstants1.packedValues[319u] * fragmentVectorConstants1.packedValues[79u].z)) * fragmentScalarConstants1.packedValues[547u];
        multiplyAddValue41 = ((exponentialValue7 * sumValue112) * spvNMax(fma(intermediateValue82, fragmentScalarConstants1.packedValues[303u], (multiplyAddValue185 * fragmentVectorConstants1.packedValues[154u].y) * fragmentScalarConstants1.packedValues[619u]), fragmentScalarConstants1.packedValues[319u] * fragmentVectorConstants1.packedValues[79u].y)) * fragmentScalarConstants1.packedValues[547u];
        multiplyAddValue42 = ((exponentialValue6 * sumValue112) * spvNMax(fma(intermediateValue84, fragmentScalarConstants1.packedValues[303u], (multiplyAddValue185 * fragmentVectorConstants1.packedValues[154u].x) * fragmentScalarConstants1.packedValues[619u]), fragmentScalarConstants1.packedValues[319u] * fragmentVectorConstants1.packedValues[79u].x)) * fragmentScalarConstants1.packedValues[547u];
        intermediateValue57 = multiplyAddValue43;
        intermediateValue58 = multiplyAddValue44;
        intermediateValue59 = multiplyAddValue45;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue61 = branchMergedValue22;
        intermediateValue62 = branchMergedValue21;
        intermediateValue63 = branchMergedValue12;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue37 = 0.0;
        multiplyAddValue38 = 0.0;
        multiplyAddValue39 = 0.0;
        intermediateValue54 = 0.0;
        intermediateValue55 = 0.0;
        intermediateValue56 = 0.0;
        multiplyAddValue40 = 0.0;
        multiplyAddValue41 = 0.0;
        multiplyAddValue42 = 0.0;
        intermediateValue57 = 0.0;
        intermediateValue58 = 0.0;
        intermediateValue59 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue61 = 0.0;
        intermediateValue62 = 0.0;
        intermediateValue63 = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float sumValue163 = multiplyAddValue39 + (intermediateValue56 + (intermediateValue59 + multiplyAddValue42));
    float sumValue164 = multiplyAddValue38 + (intermediateValue55 + (intermediateValue58 + multiplyAddValue41));
    float sumValue165 = multiplyAddValue37 + (intermediateValue54 + (intermediateValue57 + multiplyAddValue40));
    bool comparisonValue139 = fragmentScalarConstants1.packedValues[547u] != 0.0;
    float productValue236 = fragmentScalarConstants1.packedValues[319u] * fragmentVectorConstants1.packedValues[79u].x;
    float productValue237 = fragmentScalarConstants1.packedValues[319u] * fragmentVectorConstants1.packedValues[79u].y;
    float productValue238 = fragmentScalarConstants1.packedValues[319u] * fragmentVectorConstants1.packedValues[79u].z;
    bool comparisonValue140 = fragmentScalarConstants1.packedValues[340u] != 0.0;
    bool comparisonValue141 = fragmentScalarConstants1.packedValues[644u] != 0.0;
    float intermediateValue60;
    float intermediateValue61;
    float intermediateValue63;
    float intermediateValue65;
    if (comparisonValue140)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue184 = ((productValue101 * (((intermediateValue36 - sumValue84) * intermediateValue35) + sumValue84)) + productValue98) + intermediateValue61;
    float productValue185 = ((productValue101 * (((intermediateValue37 - sumValue86) * intermediateValue35) + sumValue86)) + productValue99) + intermediateValue62;
    float productValue186 = ((productValue101 * (((intermediateValue38 - sumValue93) * intermediateValue35) + sumValue93)) + productValue100) + intermediateValue63;
    float productValue131;
    float productValue132;
    float productValue133;
    if (fragmentVectorConstants1.packedValues[150u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float quotientValue34 = spvNClamp((((nonlinearValue5 / fragmentScalarConstants1.packedValues[326u]) + fragmentScalarConstants1.packedValues[608u]) - fragmentScalarConstants1.packedValues[324u]) * fragmentScalarConstants1.packedValues[325u], 0.0, 1.0);
        float intermediateValue62;
        float intermediateValue64;
        float intermediateValue66;
        if (quotientValue34 > 0.0)
        {
            float multiplyAddValue71;
            float multiplyAddValue72;
            float multiplyAddValue73;
            if (fragmentScalarConstants1.packedValues[341u] != 0.0)
            {
                bool comparisonValue142 = comparisonValue139 && (fragmentScalarConstants1.packedValues[342u] != 0.0);
                multiplyAddValue71 = spvNMax(comparisonValue142 ? (spvNMax(productValue236, fma(fragmentVectorConstants1.packedValues[154u].x, fragmentScalarConstants1.packedValues[619u], fragmentScalarConstants1.packedValues[303u])) * fragmentScalarConstants1.packedValues[342u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[86u].x;
                multiplyAddValue72 = spvNMax(comparisonValue142 ? (spvNMax(productValue237, fma(fragmentVectorConstants1.packedValues[154u].y, fragmentScalarConstants1.packedValues[619u], fragmentScalarConstants1.packedValues[303u])) * fragmentScalarConstants1.packedValues[342u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[86u].y;
                multiplyAddValue73 = spvNMax(comparisonValue142 ? (spvNMax(productValue238, fma(fragmentVectorConstants1.packedValues[154u].z, fragmentScalarConstants1.packedValues[619u], fragmentScalarConstants1.packedValues[303u])) * fragmentScalarConstants1.packedValues[342u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[86u].z;
            }
            else
            {
                float sumValue94 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[12u].x;
                float sumValue102 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[12u].y;
                float sumValue103 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[12u].z;
                vec3 vectorValue13 = vec3(sumValue94, sumValue102, sumValue103);
                float inverseLengthValue21 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
                float sumValue166 = fragmentScalarConstants1.packedValues[583u] - fragmentScalarConstants1.packedValues[580u];
                float multiplyAddValue186 = fma(sumValue102, inverseLengthValue21, sumValue166);
                float quotientValue35 = spvNClamp(multiplyAddValue186 * (1.0 / (sumValue166 + (fragmentScalarConstants1.packedValues[582u] - fragmentScalarConstants1.packedValues[583u]))), 0.0, 1.0);
                float multiplyAddValue187 = fma(-fma(quotientValue35, -2.0, 3.0), quotientValue35 * quotientValue35, 1.0);
                float productValue239 = multiplyAddValue187 * (multiplyAddValue187 * multiplyAddValue187);
                vec3 productValue240 = vec3(inverseLengthValue21 * sumValue94, inverseLengthValue21 * sumValue102, inverseLengthValue21 * sumValue103);
                float scalarValue123 = rdDot3Precise2(productValue240, vec3(fragmentVectorConstants1.packedValues[149u].xyz));
                float scalarValue124 = rdDot3Precise2(productValue240, vec3(fragmentVectorConstants1.packedValues[90u].xyz));
                float quotientValue36 = spvNClamp(multiplyAddValue186 * (1.0 / (sumValue166 + fragmentScalarConstants1.packedValues[581u])), 0.0, 1.0);
                float multiplyAddValue188 = fma(-fma(quotientValue36, -2.0, 3.0), quotientValue36 * quotientValue36, 1.0);
                float productValue241 = multiplyAddValue188 * (multiplyAddValue188 * multiplyAddValue188);
                float multiplyAddValue189 = fma(fma(scalarValue123, scalarValue123, 1.0) * fragmentScalarConstants1.packedValues[631u], 0.75, (fma(scalarValue124, scalarValue124, 1.0) * fragmentScalarConstants1.packedValues[591u]) * 0.75);
                float exponentialValue9 = spvNMin(exp2(log2(spvNMax(scalarValue123, 0.0)) * fragmentScalarConstants1.packedValues[331u]), 1.0);
                float exponentialValue10 = spvNMin(exp2(log2(spvNMax(scalarValue124, 0.0)) * fragmentScalarConstants1.packedValues[331u]), 1.0);
                float multiplyAddValue190 = fma(-exponentialValue9, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue7 = 0.0361000001430511474609375 / (multiplyAddValue190 * sqrt(multiplyAddValue190));
                float multiplyAddValue191 = fma(-exponentialValue10, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue8 = 0.0361000001430511474609375 / (multiplyAddValue191 * sqrt(multiplyAddValue191));
                float multiplyAddValue192 = fma((fma(productValue241, fragmentVectorConstants1.packedValues[155u].x - fragmentVectorConstants1.packedValues[83u].x, fragmentVectorConstants1.packedValues[83u].x) * fragmentScalarConstants1.packedValues[328u]) * 0.079577468335628509521484375, multiplyAddValue189, fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[157u].x * fragmentScalarConstants1.packedValues[631u]) * fragmentScalarConstants1.packedValues[329u]), nonlinearValue7, nonlinearValue8 * (exponentialValue10 * ((fragmentVectorConstants1.packedValues[147u].x * fragmentScalarConstants1.packedValues[591u]) * fragmentScalarConstants1.packedValues[330u]))) * ((productValue239 * fragmentVectorConstants1.packedValues[155u].x) * 0.079577468335628509521484375));
                float multiplyAddValue193 = fma((fma(productValue241, fragmentVectorConstants1.packedValues[155u].y - fragmentVectorConstants1.packedValues[83u].y, fragmentVectorConstants1.packedValues[83u].y) * fragmentScalarConstants1.packedValues[328u]) * 0.079577468335628509521484375, multiplyAddValue189, fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[157u].y * fragmentScalarConstants1.packedValues[631u]) * fragmentScalarConstants1.packedValues[329u]), nonlinearValue7, nonlinearValue8 * (exponentialValue10 * ((fragmentVectorConstants1.packedValues[147u].y * fragmentScalarConstants1.packedValues[591u]) * fragmentScalarConstants1.packedValues[330u]))) * ((productValue239 * fragmentVectorConstants1.packedValues[155u].y) * 0.079577468335628509521484375));
                float multiplyAddValue194 = fma((fma(productValue241, fragmentVectorConstants1.packedValues[155u].z - fragmentVectorConstants1.packedValues[83u].z, fragmentVectorConstants1.packedValues[83u].z) * fragmentScalarConstants1.packedValues[328u]) * 0.079577468335628509521484375, multiplyAddValue189, fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[157u].z * fragmentScalarConstants1.packedValues[631u]) * fragmentScalarConstants1.packedValues[329u]), nonlinearValue7, nonlinearValue8 * (exponentialValue10 * ((fragmentVectorConstants1.packedValues[147u].z * fragmentScalarConstants1.packedValues[591u]) * fragmentScalarConstants1.packedValues[330u]))) * ((productValue239 * fragmentVectorConstants1.packedValues[155u].z) * 0.079577468335628509521484375));
                bool comparisonValue143 = fragmentScalarConstants1.packedValues[343u] != 0.0;
                float scalarValue125 = spvNMax(varyingTexCoord1.y, fragmentScalarConstants1.packedValues[353u]);
                multiplyAddValue71 = comparisonValue143 ? fma(scalarValue125, multiplyAddValue192 - fragmentVectorConstants1.packedValues[158u].x, fragmentVectorConstants1.packedValues[158u].x) : multiplyAddValue192;
                multiplyAddValue72 = comparisonValue143 ? fma(scalarValue125, multiplyAddValue193 - fragmentVectorConstants1.packedValues[158u].y, fragmentVectorConstants1.packedValues[158u].y) : multiplyAddValue193;
                multiplyAddValue73 = comparisonValue143 ? fma(scalarValue125, multiplyAddValue194 - fragmentVectorConstants1.packedValues[158u].z, fragmentVectorConstants1.packedValues[158u].z) : multiplyAddValue194;
            }
            intermediateValue66 = multiplyAddValue71;
            intermediateValue64 = multiplyAddValue72;
            intermediateValue62 = multiplyAddValue73;
        }
        else
        {
            intermediateValue66 = 0.0;
            intermediateValue64 = 0.0;
            intermediateValue62 = 0.0;
        }
        intermediateValue60 = quotientValue34;
        intermediateValue61 = intermediateValue62;
        intermediateValue63 = intermediateValue64;
        intermediateValue65 = intermediateValue66;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue43 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue131 = sampledTextureValue43 * productValue184;
        productValue132 = sampledTextureValue43 * productValue185;
        productValue133 = sampledTextureValue43 * productValue186;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue60 = 0.0;
        intermediateValue61 = 0.0;
        intermediateValue63 = 0.0;
        intermediateValue65 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue131 = productValue184;
        productValue132 = productValue185;
        productValue133 = productValue186;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue75;
    float multiplyAddValue76;
    float multiplyAddValue77;
    float multiplyAddValue78;
    if (comparisonValue141)
    {
        float productValue242 = (multiplyAddValue59 + 1.0) * 0.5;
        float productValue243 = (multiplyAddValue60 + 1.0) * 0.5;
        float multiplyAddValue195 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[15u].z, multiplyAddValue61, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue59, multiplyAddValue60 * fragmentVectorConstants1.packedValues[14u].z)) + fragmentVectorConstants1.packedValues[16u].z)) / (fma(fragmentVectorConstants1.packedValues[15u].w, multiplyAddValue61, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue59, multiplyAddValue60 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[16u].w)) - fragmentScalarConstants1.packedValues[640u]) / (fragmentScalarConstants1.packedValues[641u] - fragmentScalarConstants1.packedValues[640u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[638u]), -0.5);
        uint sumValue167 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[638u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue195))), int(0u))))));
        float scalarValue126 = rdSignedBitsToFloat(sumValue167);
        float sumValue168 = spvNClamp(multiplyAddValue195 - scalarValue126, 0.0, 1.0);
        vec4 sampledTextureValue51 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue242, productValue243, scalarValue126), 0.0);
        float scalarValue127 = sampledTextureValue51.x;
        float scalarValue128 = sampledTextureValue51.y;
        float scalarValue129 = sampledTextureValue51.z;
        float scalarValue130 = sampledTextureValue51.w;
        vec4 sampledTextureValue52 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue242, productValue243, rdSignedBitsToFloat(sumValue167 + 1u)), 0.0);
        multiplyAddValue75 = fma(sumValue168, sampledTextureValue52.z - scalarValue129, scalarValue129);
        multiplyAddValue76 = fma(sumValue168, sampledTextureValue52.y - scalarValue128, scalarValue128);
        multiplyAddValue77 = fma(sumValue168, sampledTextureValue52.x - scalarValue127, scalarValue127);
        multiplyAddValue78 = fma(sumValue168, sampledTextureValue52.w - scalarValue130, scalarValue130);
    }
    else
    {
        multiplyAddValue75 = 0.0;
        multiplyAddValue76 = 0.0;
        multiplyAddValue77 = 0.0;
        multiplyAddValue78 = 1.0;
    }
    float intermediateValue116;
    float intermediateValue117;
    float intermediateValue118;
    if (fragmentScalarConstants1.packedValues[584u] != 0.0)
    {
        float multiplyAddValue196 = spvNClamp(fma(varyingTexCoord1.y, 16.0, -fragmentScalarConstants1.packedValues[337u]) / spvNMax(fragmentScalarConstants1.packedValues[336u] - fragmentScalarConstants1.packedValues[337u], 1.0), 0.0, 1.0);
        float productValue244 = (multiplyAddValue196 * (multiplyAddValue196 * multiplyAddValue196)) * fragmentScalarConstants1.packedValues[584u];
        bool conditionValue14 = fragmentScalarConstants1.packedValues[600u] > 0.0;
        bool bitwiseValue73 = bitwiseValue36 && conditionValue2;
        float multiplyAddValue197 = conditionValue2 ? (fma(fragmentVectorConstants1.packedValues[6u].x, comparisonValue89, fma(fragmentVectorConstants1.packedValues[4u].x, comparisonValue87, comparisonValue88 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue54;
        float multiplyAddValue198 = conditionValue2 ? (fma(fragmentVectorConstants1.packedValues[6u].y, comparisonValue89, fma(fragmentVectorConstants1.packedValues[4u].y, comparisonValue87, comparisonValue88 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue55;
        float multiplyAddValue199 = conditionValue2 ? (fma(fragmentVectorConstants1.packedValues[6u].z, comparisonValue89, fma(fragmentVectorConstants1.packedValues[4u].z, comparisonValue87, comparisonValue88 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue56;
        float comparisonValue144 = (bitwiseValue73 ? multiplyAddValue81 : varyingTexCoord3.x) - fragmentVectorConstants1.packedValues[12u].x;
        float comparisonValue145 = (bitwiseValue73 ? multiplyAddValue82 : varyingTexCoord3.y) - fragmentVectorConstants1.packedValues[12u].y;
        float comparisonValue146 = (bitwiseValue73 ? multiplyAddValue83 : varyingTexCoord3.z) - fragmentVectorConstants1.packedValues[12u].z;
        vec3 vectorValue14 = vec3(comparisonValue144, comparisonValue145, comparisonValue146);
        float inverseLengthValue22 = inversesqrt(rdDot3Precise2(vectorValue14, vectorValue14));
        float productValue245 = inverseLengthValue22 * comparisonValue144;
        float productValue246 = inverseLengthValue22 * comparisonValue145;
        float productValue247 = inverseLengthValue22 * comparisonValue146;
        vec3 vectorValue15 = vec3(multiplyAddValue197, multiplyAddValue198, multiplyAddValue199);
        float inverseLengthValue23 = inversesqrt(rdDot3Precise2(vectorValue15, vectorValue15));
        float scalarValue131 = rdDot3Precise2(vec3(productValue245, productValue246, productValue247), vec3(productValue187, productValue188, productValue189));
        float sumValue169 = -(scalarValue131 + scalarValue131);
        float multiplyAddValue200 = fma(productValue187, sumValue169, productValue245);
        float multiplyAddValue201 = fma(productValue188, sumValue169, productValue246);
        float multiplyAddValue202 = fma(productValue189, sumValue169, productValue247);
        float sumValue170 = 1.0 - intermediateValue35;
        float productValue248 = sumValue170 * sumValue170;
        float sumValue171 = fragmentScalarConstants1.packedValues[585u] - 1.0;
        float productValue249 = productValue248 * productValue248;
        float multiplyAddValue203 = (uint(int(fragmentScalarConstants1.packedValues[508u])) == 1u) ? (fma(intermediateValue35 - 1.0, sumValue170, 1.0) * sumValue171) : (sumValue171 * fma(-productValue249, productValue249, 1.0));
        uint sumValue172 = uint(int(fragmentScalarConstants1.packedValues[320u])) + 2u;
        uint scalarValue132 = uint(abs(int(sumValue172))) % 3u;
        vec4 sampledTextureValue53 = textureLod(samplerCubeArray(materialTexture9, textureSampler9), vec4(multiplyAddValue200, multiplyAddValue201, multiplyAddValue202, trunc(fragmentScalarConstants1.packedValues[320u])), multiplyAddValue203);
        vec4 sampledTextureValue54 = textureLod(samplerCubeArray(materialTexture9, textureSampler9), vec4(multiplyAddValue200, multiplyAddValue201, multiplyAddValue202, rdSignedBitsToFloat(((sumValue172 & 2147483648u) != 0u) ? (-scalarValue132) : scalarValue132)), multiplyAddValue203);
        float scalarValue133 = sampledTextureValue54.x;
        float scalarValue134 = sampledTextureValue54.y;
        float scalarValue135 = sampledTextureValue54.z;
        float multiplyAddValue204 = fma(fragmentScalarConstants1.packedValues[587u], sampledTextureValue53.x - scalarValue133, scalarValue133);
        float multiplyAddValue205 = fma(fragmentScalarConstants1.packedValues[587u], sampledTextureValue53.y - scalarValue134, scalarValue134);
        float multiplyAddValue206 = fma(fragmentScalarConstants1.packedValues[587u], sampledTextureValue53.z - scalarValue135, scalarValue135);
        float comparisonValue147 = (productValue244 * (conditionValue14 ? (multiplyAddValue204 * 301.72412109375) : multiplyAddValue204)) * fragmentScalarConstants1.packedValues[586u];
        float comparisonValue148 = (productValue244 * (conditionValue14 ? (multiplyAddValue205 * 301.72412109375) : multiplyAddValue205)) * fragmentScalarConstants1.packedValues[586u];
        float comparisonValue149 = (productValue244 * (conditionValue14 ? (multiplyAddValue206 * 301.72412109375) : multiplyAddValue206)) * fragmentScalarConstants1.packedValues[586u];
        float productValue250 = comparisonValue90 * fragmentScalarConstants1.packedValues[303u];
        float productValue251 = multiplyAddValue84 * fragmentScalarConstants1.packedValues[303u];
        float productValue252 = multiplyAddValue85 * fragmentScalarConstants1.packedValues[303u];
        float productValue253 = spvNClamp(rdDot3Precise2(vec3(productValue250 * fragmentScalarConstants1.packedValues[348u], productValue251 * fragmentScalarConstants1.packedValues[348u], productValue252 * fragmentScalarConstants1.packedValues[348u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
        float multiplyAddValue207 = intermediateValue33 * fma(productValue253, fma(fragmentScalarConstants1.packedValues[348u], productValue250, -productValue236), productValue236);
        float multiplyAddValue208 = intermediateValue33 * fma(productValue253, fma(fragmentScalarConstants1.packedValues[348u], productValue251, -productValue237), productValue237);
        float multiplyAddValue209 = intermediateValue33 * fma(productValue253, fma(fragmentScalarConstants1.packedValues[348u], productValue252, -productValue238), productValue238);
        bool bitwiseValue74 = comparisonValue139 && (rdDot3Precise2(vec3(comparisonValue147, comparisonValue148, comparisonValue149), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < rdDot3Precise2(vec3(multiplyAddValue207, multiplyAddValue208, multiplyAddValue209), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)));
        vec4 sampledTextureValue55 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(vectorValue7, vec3(-(inverseLengthValue23 * multiplyAddValue197), -(inverseLengthValue23 * multiplyAddValue198), -(inverseLengthValue23 * multiplyAddValue199))), 0.0, 1.0), sumValue170));
        float scalarValue136 = sampledTextureValue55.x;
        float scalarValue137 = sampledTextureValue55.y;
        float multiplyAddValue210 = (bitwiseValue74 ? multiplyAddValue207 : comparisonValue147) * fma(multiplyAddValue86, scalarValue136, scalarValue137);
        float multiplyAddValue211 = (bitwiseValue74 ? multiplyAddValue208 : comparisonValue148) * fma(multiplyAddValue87, scalarValue136, scalarValue137);
        float multiplyAddValue212 = (bitwiseValue74 ? multiplyAddValue209 : comparisonValue149) * fma(multiplyAddValue88, scalarValue136, scalarValue137);
        float quotientValue37 = ((nonlinearValue5 / fragmentScalarConstants1.packedValues[326u]) + fragmentScalarConstants1.packedValues[608u]) - fragmentScalarConstants1.packedValues[324u];
        float productValue254 = 1.0 - spvNClamp(quotientValue37 * fragmentScalarConstants1.packedValues[325u], 0.0, 1.0);
        float quotientValue38 = 1.0 - spvNClamp(quotientValue37 / (fragmentScalarConstants1.packedValues[325u] - fragmentScalarConstants1.packedValues[324u]), 0.0, 1.0);
        float comparisonValue150 = comparisonValue140 ? (productValue254 * multiplyAddValue210) : (quotientValue38 * multiplyAddValue210);
        float comparisonValue151 = comparisonValue140 ? (productValue254 * multiplyAddValue211) : (quotientValue38 * multiplyAddValue211);
        float comparisonValue152 = comparisonValue140 ? (productValue254 * multiplyAddValue212) : (quotientValue38 * multiplyAddValue212);
        float productValue60;
        float productValue61;
        float productValue62;
        if (comparisonValue141)
        {
            float productValue255 = (multiplyAddValue59 + 1.0) * 0.5;
            float productValue256 = (multiplyAddValue60 + 1.0) * 0.5;
            float multiplyAddValue213 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[15u].z, multiplyAddValue61, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue59, multiplyAddValue60 * fragmentVectorConstants1.packedValues[14u].z)) + fragmentVectorConstants1.packedValues[16u].z)) / (fma(fragmentVectorConstants1.packedValues[15u].w, multiplyAddValue61, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue59, multiplyAddValue60 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[16u].w)) - fragmentScalarConstants1.packedValues[640u]) / (fragmentScalarConstants1.packedValues[641u] - fragmentScalarConstants1.packedValues[640u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[638u]), -0.5);
            uint sumValue173 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[638u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue213))), int(0u))))));
            float scalarValue138 = rdSignedBitsToFloat(sumValue173);
            vec4 sampledTextureValue56 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue255, productValue256, scalarValue138), 0.0);
            float scalarValue139 = sampledTextureValue56.w;
            float sampledTextureValue57 = fma(spvNClamp(multiplyAddValue213 - scalarValue138, 0.0, 1.0), textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue255, productValue256, rdSignedBitsToFloat(sumValue173 + 1u)), 0.0).w - scalarValue139, scalarValue139);
            productValue62 = comparisonValue150 * sampledTextureValue57;
            productValue61 = comparisonValue151 * sampledTextureValue57;
            productValue60 = comparisonValue152 * sampledTextureValue57;
        }
        else
        {
            productValue62 = comparisonValue150;
            productValue61 = comparisonValue151;
            productValue60 = comparisonValue152;
        }
        intermediateValue116 = productValue60;
        intermediateValue117 = productValue61;
        intermediateValue118 = productValue62;
    }
    else
    {
        intermediateValue116 = 0.0;
        intermediateValue117 = 0.0;
        intermediateValue118 = 0.0;
    }
    float multiplyAddValue214 = fma(multiplyAddValue78, fma(intermediateValue60, intermediateValue65 - sumValue163, sumValue163), multiplyAddValue77) + intermediateValue118;
    float multiplyAddValue215 = fma(multiplyAddValue78, fma(intermediateValue60, intermediateValue63 - sumValue164, sumValue164), multiplyAddValue76) + intermediateValue117;
    float multiplyAddValue216 = fma(multiplyAddValue78, fma(intermediateValue60, intermediateValue61 - sumValue165, sumValue165), multiplyAddValue75) + intermediateValue116;
    float productValue65;
    float productValue66;
    float productValue67;
    if (fragmentScalarConstants1.packedValues[600u] > 0.0)
    {
        float sampledTextureValue58 = (0.180000007152557373046875 / texture(sampler2D(materialTexture5, textureSampler5), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue65 = sampledTextureValue58 * multiplyAddValue216;
        productValue66 = sampledTextureValue58 * multiplyAddValue215;
        productValue67 = sampledTextureValue58 * multiplyAddValue214;
    }
    else
    {
        productValue65 = multiplyAddValue216;
        productValue66 = multiplyAddValue215;
        productValue67 = multiplyAddValue214;
    }
    fragmentColor0.x = productValue67;
    fragmentColor0.y = productValue66;
    fragmentColor0.z = productValue65;
    fragmentColor0.w = sampledTextureValue44.w * varyingColor0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue131;
    fragmentColor0.y = productValue132;
    fragmentColor0.z = productValue133;
    fragmentColor0.w = sampledTextureValue.w * varyingColor0.w;
#endif
}
