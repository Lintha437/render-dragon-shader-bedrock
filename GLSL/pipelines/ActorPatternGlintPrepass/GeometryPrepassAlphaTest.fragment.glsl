#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPatternGlintPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_samplerless_texture_functions : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION2_FLOAT_7 1
#endif

#include "../../include/materials/ActorPatternGlintPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[2u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[89u] - fragmentScalarConstants1.packedValues[88u])) * (productValue - fragmentScalarConstants1.packedValues[88u]), 0.0, 1.0);
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentScalarConstants1.packedValues[90u]) * fragmentScalarConstants1.packedValues[90u];
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentScalarConstants1.packedValues[90u]) * fragmentScalarConstants1.packedValues[90u];
    float productValue1 = floor(multiplyAddValue1 * 0.25);
    float productValue2 = floor(multiplyAddValue1 * 0.5);
    float scalarValue1 = floor(multiplyAddValue1);
    if (((sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) < 0.5) || ((fragmentScalarConstants1.packedValues[104u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue1 * productValue1) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue2 * productValue2) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue1 * scalarValue1) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue * quotientValue) * fma(quotientValue, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue22 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue30 = sampledTextureValue22.x;
    float scalarValue31 = sampledTextureValue22.y;
    float scalarValue32 = sampledTextureValue22.z;
    float scalarValue33 = sampledTextureValue22.w;
    bool productValue67 = ((1.0 - scalarValue33) * (scalarValue32 + (scalarValue31 + scalarValue30))) > 0.0;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[2u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[89u] - fragmentScalarConstants1.packedValues[88u])) * (productValue - fragmentScalarConstants1.packedValues[88u]), 0.0, 1.0);
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentScalarConstants1.packedValues[90u]) * fragmentScalarConstants1.packedValues[90u];
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentScalarConstants1.packedValues[90u]) * fragmentScalarConstants1.packedValues[90u];
    float productValue1 = floor(multiplyAddValue1 * 0.25);
    float productValue2 = floor(multiplyAddValue1 * 0.5);
    float scalarValue1 = floor(multiplyAddValue1);
    if (((productValue67 ? (fma(fragmentVectorConstants1.packedValues[30u].w, sampledTextureValue.w, -scalarValue33) + scalarValue33) : scalarValue33) < 0.5) || ((fragmentScalarConstants1.packedValues[104u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue1 * productValue1) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue2 * productValue2) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue1 * scalarValue1) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue * quotientValue) * fma(quotientValue, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue122 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[32u].x;
    float productValue123 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[32u].y;
    float productValue124 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[32u].z;
    float productValue125 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[32u].w;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue126 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[2u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[10u].z));
    float quotientValue9 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[97u] - fragmentScalarConstants1.packedValues[96u])) * (productValue126 - fragmentScalarConstants1.packedValues[96u]), 0.0, 1.0);
    float multiplyAddValue57 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[27u].x) / fragmentScalarConstants1.packedValues[98u]) * fragmentScalarConstants1.packedValues[98u];
    float multiplyAddValue58 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[27u].y) / fragmentScalarConstants1.packedValues[98u]) * fragmentScalarConstants1.packedValues[98u];
    float productValue127 = floor(multiplyAddValue57 * 0.25);
    float productValue128 = floor(multiplyAddValue58 * 0.25);
    float productValue129 = floor(multiplyAddValue57 * 0.5);
    float productValue130 = floor(multiplyAddValue58 * 0.5);
    float scalarValue42 = floor(multiplyAddValue58);
    if ((productValue125 < fragmentScalarConstants1.packedValues[88u]) || ((fragmentScalarConstants1.packedValues[112u] != 0.0) && ((fma(fma(fma(fract(fma(productValue127, 0.5, (productValue128 * productValue128) * 0.75)), 0.25, fract(fma(productValue129, 0.5, (productValue130 * productValue130) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue57), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue9 * quotientValue9) * fma(quotientValue9, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue22 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue30 = sampledTextureValue22.x;
    float scalarValue31 = sampledTextureValue22.y;
    float scalarValue32 = sampledTextureValue22.z;
    float scalarValue33 = sampledTextureValue22.w;
    bool productValue67 = ((1.0 - scalarValue33) * (scalarValue32 + (scalarValue31 + scalarValue30))) > 0.0;
    float multiplyAddValue72 = productValue67 ? (fma(fragmentVectorConstants1.packedValues[32u].x, sampledTextureValue.x, -scalarValue30) + scalarValue30) : scalarValue30;
    float multiplyAddValue73 = productValue67 ? (fma(fragmentVectorConstants1.packedValues[32u].y, sampledTextureValue.y, -scalarValue31) + scalarValue31) : scalarValue31;
    float multiplyAddValue74 = productValue67 ? (fma(fragmentVectorConstants1.packedValues[32u].z, sampledTextureValue.z, -scalarValue32) + scalarValue32) : scalarValue32;
    float multiplyAddValue75 = productValue67 ? (fma(fragmentVectorConstants1.packedValues[32u].w, sampledTextureValue.w, -scalarValue33) + scalarValue33) : scalarValue33;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue126 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[2u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[10u].z));
    float quotientValue9 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[97u] - fragmentScalarConstants1.packedValues[96u])) * (productValue126 - fragmentScalarConstants1.packedValues[96u]), 0.0, 1.0);
    float multiplyAddValue57 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[27u].x) / fragmentScalarConstants1.packedValues[98u]) * fragmentScalarConstants1.packedValues[98u];
    float multiplyAddValue58 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[27u].y) / fragmentScalarConstants1.packedValues[98u]) * fragmentScalarConstants1.packedValues[98u];
    float productValue127 = floor(multiplyAddValue57 * 0.25);
    float productValue128 = floor(multiplyAddValue58 * 0.25);
    float productValue129 = floor(multiplyAddValue57 * 0.5);
    float productValue130 = floor(multiplyAddValue58 * 0.5);
    float scalarValue42 = floor(multiplyAddValue58);
    if ((multiplyAddValue75 < fragmentScalarConstants1.packedValues[88u]) || ((fragmentScalarConstants1.packedValues[112u] != 0.0) && ((fma(fma(fma(fract(fma(productValue127, 0.5, (productValue128 * productValue128) * 0.75)), 0.25, fract(fma(productValue129, 0.5, (productValue130 * productValue130) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue57), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue9 * quotientValue9) * fma(quotientValue9, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue122 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[32u].x;
    float productValue123 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[32u].y;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue126 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[2u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[10u].z));
    float quotientValue9 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[97u] - fragmentScalarConstants1.packedValues[96u])) * (productValue126 - fragmentScalarConstants1.packedValues[96u]), 0.0, 1.0);
    float multiplyAddValue57 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[27u].x) / fragmentScalarConstants1.packedValues[98u]) * fragmentScalarConstants1.packedValues[98u];
    float multiplyAddValue58 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[27u].y) / fragmentScalarConstants1.packedValues[98u]) * fragmentScalarConstants1.packedValues[98u];
    float productValue128 = floor(multiplyAddValue58 * 0.25);
    float productValue130 = floor(multiplyAddValue58 * 0.5);
    float scalarValue42 = floor(multiplyAddValue58);
    if (((sampledTextureValue.w * fragmentScalarConstants1.packedValues[131u]) < fragmentScalarConstants1.packedValues[88u]) || ((fragmentScalarConstants1.packedValues[112u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue57 * 0.25), 0.5, (productValue128 * productValue128) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue57 * 0.5), 0.5, (productValue130 * productValue130) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue57), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue9 * quotientValue9) * fma(quotientValue9, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue22 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue30 = sampledTextureValue22.x;
    float scalarValue31 = sampledTextureValue22.y;
    float scalarValue33 = sampledTextureValue22.w;
    bool productValue179 = ((sampledTextureValue22.z + (scalarValue31 + scalarValue30)) * (1.0 - scalarValue33)) > 0.0;
    float multiplyAddValue88 = productValue179 ? (fma(fragmentVectorConstants1.packedValues[32u].x, sampledTextureValue.x, -scalarValue30) + scalarValue30) : scalarValue30;
    float multiplyAddValue89 = productValue179 ? (fma(fragmentVectorConstants1.packedValues[32u].y, sampledTextureValue.y, -scalarValue31) + scalarValue31) : scalarValue31;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue126 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[2u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[10u].z));
    float quotientValue9 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[97u] - fragmentScalarConstants1.packedValues[96u])) * (productValue126 - fragmentScalarConstants1.packedValues[96u]), 0.0, 1.0);
    float multiplyAddValue57 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[27u].x) / fragmentScalarConstants1.packedValues[98u]) * fragmentScalarConstants1.packedValues[98u];
    float multiplyAddValue58 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[27u].y) / fragmentScalarConstants1.packedValues[98u]) * fragmentScalarConstants1.packedValues[98u];
    float productValue128 = floor(multiplyAddValue58 * 0.25);
    float productValue130 = floor(multiplyAddValue58 * 0.5);
    float scalarValue42 = floor(multiplyAddValue58);
    if (((productValue179 ? (fma(fragmentScalarConstants1.packedValues[131u], sampledTextureValue.w, -scalarValue33) + scalarValue33) : scalarValue33) < fragmentScalarConstants1.packedValues[88u]) || ((fragmentScalarConstants1.packedValues[112u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue57 * 0.25), 0.5, (productValue128 * productValue128) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue57 * 0.5), 0.5, (productValue130 * productValue130) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue57), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue9 * quotientValue9) * fma(quotientValue9, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue22 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    vec4 sampledTextureValue12 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue38 = sampledTextureValue12.x * fragmentVectorConstants1.packedValues[30u].x;
    float productValue39 = sampledTextureValue12.y * fragmentVectorConstants1.packedValues[30u].y;
    float productValue40 = sampledTextureValue12.z * fragmentVectorConstants1.packedValues[30u].z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
    {
        float inverseLengthValue8 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue8)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[22u].x) / (fragmentVectorConstants1.packedValues[22u].y - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
        float quotientValue2 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float quotientValue3 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float productValue41 = floor(quotientValue3 * 0.25);
        float productValue42 = floor(quotientValue3 * 0.5);
        float scalarValue23 = floor(quotientValue3);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue42 * productValue42) * 0.75) + (floor(quotientValue2 * 0.5) * 0.5)) + (fract(((productValue41 * productValue41) * 0.75) + (floor(quotientValue2 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue23 * scalarValue23) * 0.75) + (floor(quotientValue2) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((sampledTextureValue12.w * fragmentVectorConstants1.packedValues[30u].w) < 0.5) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue22 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    vec4 sampledTextureValue12 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue23 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue36 = sampledTextureValue23.x;
    float scalarValue37 = sampledTextureValue23.y;
    float scalarValue38 = sampledTextureValue23.z;
    float scalarValue39 = sampledTextureValue23.w;
    float productValue73 = float((((scalarValue36 + scalarValue37) + scalarValue38) * (1.0 - scalarValue39)) > 0.0);
    float productValue74 = (productValue73 * ((sampledTextureValue12.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue36)) + scalarValue36;
    float productValue75 = (productValue73 * ((sampledTextureValue12.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue37)) + scalarValue37;
    float productValue76 = (productValue73 * ((sampledTextureValue12.z * fragmentVectorConstants1.packedValues[30u].z) - scalarValue38)) + scalarValue38;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
    {
        float inverseLengthValue8 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue8)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[22u].x) / (fragmentVectorConstants1.packedValues[22u].y - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
        float quotientValue2 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float quotientValue3 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float productValue41 = floor(quotientValue3 * 0.25);
        float productValue42 = floor(quotientValue3 * 0.5);
        float scalarValue23 = floor(quotientValue3);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue42 * productValue42) * 0.75) + (floor(quotientValue2 * 0.5) * 0.5)) + (fract(((productValue41 * productValue41) * 0.75) + (floor(quotientValue2 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue23 * scalarValue23) * 0.75) + (floor(quotientValue2) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((((productValue73 * ((sampledTextureValue12.w * fragmentVectorConstants1.packedValues[30u].w) - scalarValue39)) + scalarValue39) < 0.5) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue40 = uint(int(fragmentVectorConstants1.packedValues[6u].x));
    vec4 sampledTextureValue12 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue89 = sampledTextureValue12.x * fragmentVectorConstants1.packedValues[32u].x;
    float productValue90 = sampledTextureValue12.y * fragmentVectorConstants1.packedValues[32u].y;
    float productValue91 = sampledTextureValue12.z * fragmentVectorConstants1.packedValues[32u].z;
    float productValue92 = sampledTextureValue12.w * fragmentVectorConstants1.packedValues[32u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[28u].x != 0.0)
    {
        float inverseLengthValue8 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue8)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[10u].z)) - fragmentVectorConstants1.packedValues[24u].x) / (fragmentVectorConstants1.packedValues[24u].y - fragmentVectorConstants1.packedValues[24u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[27u].x) / fragmentVectorConstants1.packedValues[24u].z) * fragmentVectorConstants1.packedValues[24u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[27u].y) / fragmentVectorConstants1.packedValues[24u].z) * fragmentVectorConstants1.packedValues[24u].z;
        float productValue93 = floor(quotientValue8 * 0.25);
        float productValue94 = floor(quotientValue8 * 0.5);
        float scalarValue41 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue94 * productValue94) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue93 * productValue93) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue41 * scalarValue41) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue92 < fragmentVectorConstants1.packedValues[22u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue40 = uint(int(fragmentVectorConstants1.packedValues[6u].x));
    vec4 sampledTextureValue12 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue23 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue36 = sampledTextureValue23.x;
    float scalarValue37 = sampledTextureValue23.y;
    float scalarValue38 = sampledTextureValue23.z;
    float scalarValue39 = sampledTextureValue23.w;
    float productValue73 = float((((scalarValue36 + scalarValue37) + scalarValue38) * (1.0 - scalarValue39)) > 0.0);
    float productValue109 = (productValue73 * ((sampledTextureValue12.x * fragmentVectorConstants1.packedValues[32u].x) - scalarValue36)) + scalarValue36;
    float productValue110 = (productValue73 * ((sampledTextureValue12.y * fragmentVectorConstants1.packedValues[32u].y) - scalarValue37)) + scalarValue37;
    float productValue111 = (productValue73 * ((sampledTextureValue12.z * fragmentVectorConstants1.packedValues[32u].z) - scalarValue38)) + scalarValue38;
    float productValue112 = (productValue73 * ((sampledTextureValue12.w * fragmentVectorConstants1.packedValues[32u].w) - scalarValue39)) + scalarValue39;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[28u].x != 0.0)
    {
        float inverseLengthValue8 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue8)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[10u].z)) - fragmentVectorConstants1.packedValues[24u].x) / (fragmentVectorConstants1.packedValues[24u].y - fragmentVectorConstants1.packedValues[24u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[27u].x) / fragmentVectorConstants1.packedValues[24u].z) * fragmentVectorConstants1.packedValues[24u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[27u].y) / fragmentVectorConstants1.packedValues[24u].z) * fragmentVectorConstants1.packedValues[24u].z;
        float productValue93 = floor(quotientValue8 * 0.25);
        float productValue94 = floor(quotientValue8 * 0.5);
        float scalarValue41 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue94 * productValue94) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue93 * productValue93) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue41 * scalarValue41) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue112 < fragmentVectorConstants1.packedValues[22u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue40 = uint(int(fragmentVectorConstants1.packedValues[6u].x));
    vec4 sampledTextureValue12 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue89 = sampledTextureValue12.x * fragmentVectorConstants1.packedValues[32u].x;
    float productValue90 = sampledTextureValue12.y * fragmentVectorConstants1.packedValues[32u].y;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[28u].x != 0.0)
    {
        float inverseLengthValue8 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue8)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[10u].z)) - fragmentVectorConstants1.packedValues[24u].x) / (fragmentVectorConstants1.packedValues[24u].y - fragmentVectorConstants1.packedValues[24u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[27u].x) / fragmentVectorConstants1.packedValues[24u].z) * fragmentVectorConstants1.packedValues[24u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[27u].y) / fragmentVectorConstants1.packedValues[24u].z) * fragmentVectorConstants1.packedValues[24u].z;
        float productValue93 = floor(quotientValue8 * 0.25);
        float productValue94 = floor(quotientValue8 * 0.5);
        float scalarValue41 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue94 * productValue94) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue93 * productValue93) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue41 * scalarValue41) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((sampledTextureValue12.w * fragmentVectorConstants1.packedValues[32u].w) < fragmentVectorConstants1.packedValues[22u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue40 = uint(int(fragmentVectorConstants1.packedValues[6u].x));
    vec4 sampledTextureValue12 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue23 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue36 = sampledTextureValue23.x;
    float scalarValue37 = sampledTextureValue23.y;
    float scalarValue39 = sampledTextureValue23.w;
    float productValue167 = float((((scalarValue36 + scalarValue37) + sampledTextureValue23.z) * (1.0 - scalarValue39)) > 0.0);
    float productValue168 = (productValue167 * ((sampledTextureValue12.x * fragmentVectorConstants1.packedValues[32u].x) - scalarValue36)) + scalarValue36;
    float productValue169 = (productValue167 * ((sampledTextureValue12.y * fragmentVectorConstants1.packedValues[32u].y) - scalarValue37)) + scalarValue37;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[28u].x != 0.0)
    {
        float inverseLengthValue8 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue8)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[10u].z)) - fragmentVectorConstants1.packedValues[24u].x) / (fragmentVectorConstants1.packedValues[24u].y - fragmentVectorConstants1.packedValues[24u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[27u].x) / fragmentVectorConstants1.packedValues[24u].z) * fragmentVectorConstants1.packedValues[24u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[27u].y) / fragmentVectorConstants1.packedValues[24u].z) * fragmentVectorConstants1.packedValues[24u].z;
        float productValue93 = floor(quotientValue8 * 0.25);
        float productValue94 = floor(quotientValue8 * 0.5);
        float scalarValue41 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue94 * productValue94) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue93 * productValue93) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue41 * scalarValue41) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((((productValue167 * ((sampledTextureValue12.w * fragmentVectorConstants1.packedValues[32u].w) - scalarValue39)) + scalarValue39) < fragmentVectorConstants1.packedValues[22u].x) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue2 = uint(int(fragmentScalarConstants1.packedValues[20u]));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue20;
    float intermediateValue22;
    float intermediateValue23;
    uint intermediateValue24;
    float productValue4;
    float productValue5;
    float productValue6;
    intermediateValue20 = intermediateValue21;
    intermediateValue22 = intermediateValue21;
    intermediateValue23 = intermediateValue21;
    intermediateValue24 = 4294967295u;
    productValue4 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z;
    productValue5 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y;
    productValue6 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x;
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    uint comparisonValue;
    float multiplyAddValue5;
    float multiplyAddValue6;
    float multiplyAddValue7;
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue2 = uint(int(fragmentScalarConstants1.packedValues[20u]));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue24;
    float intermediateValue26;
    float intermediateValue27;
    uint intermediateValue28;
    float multiplyAddValue5;
    float multiplyAddValue7;
    float multiplyAddValue9;
    intermediateValue24 = intermediateValue25;
    intermediateValue26 = intermediateValue25;
    intermediateValue27 = intermediateValue25;
    intermediateValue28 = 4294967295u;
    multiplyAddValue5 = productValue67 ? (fma(fragmentVectorConstants1.packedValues[30u].z, sampledTextureValue.z, -scalarValue32) + scalarValue32) : scalarValue32;
    multiplyAddValue7 = productValue67 ? (fma(fragmentVectorConstants1.packedValues[30u].y, sampledTextureValue.y, -scalarValue31) + scalarValue31) : scalarValue31;
    multiplyAddValue9 = productValue67 ? (fma(fragmentVectorConstants1.packedValues[30u].x, sampledTextureValue.x, -scalarValue30) + scalarValue30) : scalarValue30;
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    uint comparisonValue;
    float multiplyAddValue6;
    float multiplyAddValue8;
    float multiplyAddValue10;
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue43 = uint(int(fragmentScalarConstants1.packedValues[24u]));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    uint intermediateValue23;
    float multiplyAddValue5;
    float multiplyAddValue7;
    float multiplyAddValue9;
    intermediateValue20 = productValue127;
    intermediateValue21 = productValue128;
    intermediateValue22 = productValue129;
    intermediateValue23 = 4294967295u;
    multiplyAddValue5 = fma(productValue125, fma(productValue124, fragmentVectorConstants1.packedValues[5u].z, -productValue124), productValue124);
    multiplyAddValue7 = fma(productValue125, fma(productValue123, fragmentVectorConstants1.packedValues[5u].y, -productValue123), productValue123);
    multiplyAddValue9 = fma(productValue125, fma(productValue122, fragmentVectorConstants1.packedValues[5u].x, -productValue122), productValue122);
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    uint comparisonValue;
    float multiplyAddValue6;
    float multiplyAddValue8;
    float multiplyAddValue10;
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue43 = uint(int(fragmentScalarConstants1.packedValues[24u]));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue24;
    float intermediateValue25;
    float intermediateValue26;
    uint intermediateValue27;
    float multiplyAddValue9;
    float multiplyAddValue11;
    float multiplyAddValue13;
    intermediateValue24 = productValue127;
    intermediateValue25 = productValue128;
    intermediateValue26 = productValue129;
    intermediateValue27 = 4294967295u;
    multiplyAddValue9 = fma(multiplyAddValue75, fma(multiplyAddValue74, fragmentVectorConstants1.packedValues[5u].z, -multiplyAddValue74), multiplyAddValue74);
    multiplyAddValue11 = fma(multiplyAddValue75, fma(multiplyAddValue73, fragmentVectorConstants1.packedValues[5u].y, -multiplyAddValue73), multiplyAddValue73);
    multiplyAddValue13 = fma(multiplyAddValue75, fma(multiplyAddValue72, fragmentVectorConstants1.packedValues[5u].x, -multiplyAddValue72), multiplyAddValue72);
    float multiplyAddValue6;
    float multiplyAddValue7;
    float multiplyAddValue8;
    uint comparisonValue;
    float multiplyAddValue10;
    float multiplyAddValue12;
    float multiplyAddValue14;
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue159 = productValue122 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue160 = productValue122 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue161 = productValue122 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue48 = ceil(productValue123);
    uint scalarValue43 = uint(int(fragmentScalarConstants1.packedValues[24u]));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue21;
    float intermediateValue23;
    float intermediateValue24;
    uint intermediateValue25;
    float multiplyAddValue5;
    float multiplyAddValue7;
    float multiplyAddValue9;
    intermediateValue21 = intermediateValue22;
    intermediateValue23 = intermediateValue22;
    intermediateValue24 = intermediateValue22;
    intermediateValue25 = 4294967295u;
    multiplyAddValue5 = fma(scalarValue48, fma(productValue123, fragmentVectorConstants1.packedValues[33u].z, -productValue161), productValue161);
    multiplyAddValue7 = fma(scalarValue48, fma(productValue123, fragmentVectorConstants1.packedValues[33u].y, -productValue160), productValue160);
    multiplyAddValue9 = fma(scalarValue48, fma(productValue123, fragmentVectorConstants1.packedValues[33u].x, -productValue159), productValue159);
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    uint comparisonValue;
    float multiplyAddValue6;
    float multiplyAddValue8;
    float multiplyAddValue10;
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue180 = multiplyAddValue88 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue181 = multiplyAddValue88 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue182 = multiplyAddValue88 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue52 = ceil(multiplyAddValue89);
    uint scalarValue43 = uint(int(fragmentScalarConstants1.packedValues[24u]));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue24;
    float intermediateValue26;
    float intermediateValue27;
    uint intermediateValue28;
    float multiplyAddValue7;
    float multiplyAddValue9;
    float multiplyAddValue11;
    intermediateValue24 = intermediateValue25;
    intermediateValue26 = intermediateValue25;
    intermediateValue27 = intermediateValue25;
    intermediateValue28 = 4294967295u;
    multiplyAddValue7 = fma(scalarValue52, fma(multiplyAddValue89, fragmentVectorConstants1.packedValues[33u].z, -productValue182), productValue182);
    multiplyAddValue9 = fma(scalarValue52, fma(multiplyAddValue89, fragmentVectorConstants1.packedValues[33u].y, -productValue181), productValue181);
    multiplyAddValue11 = fma(scalarValue52, fma(multiplyAddValue89, fragmentVectorConstants1.packedValues[33u].x, -productValue180), productValue180);
    float multiplyAddValue4;
    float multiplyAddValue5;
    float multiplyAddValue6;
    uint comparisonValue;
    float multiplyAddValue8;
    float multiplyAddValue10;
    float multiplyAddValue12;
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue1;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (int(uint(int(fragmentVectorConstants1.packedValues[4u].x))) > int(0u))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue1;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if (int(uint(int(fragmentVectorConstants1.packedValues[4u].x))) > int(0u))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue95 = (((fragmentVectorConstants1.packedValues[5u].x * productValue89) - productValue89) * productValue92) + productValue89;
    float productValue96 = (((fragmentVectorConstants1.packedValues[5u].y * productValue90) - productValue90) * productValue92) + productValue90;
    float productValue97 = (((fragmentVectorConstants1.packedValues[5u].z * productValue91) - productValue91) * productValue92) + productValue91;
    bool comparisonValue1;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (int(uint(int(fragmentVectorConstants1.packedValues[4u].x))) > int(0u))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue113 = (((fragmentVectorConstants1.packedValues[5u].x * productValue109) - productValue109) * productValue112) + productValue109;
    float productValue114 = (((fragmentVectorConstants1.packedValues[5u].y * productValue110) - productValue110) * productValue112) + productValue110;
    float productValue115 = (((fragmentVectorConstants1.packedValues[5u].z * productValue111) - productValue111) * productValue112) + productValue111;
    bool comparisonValue1;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if (int(uint(int(fragmentVectorConstants1.packedValues[4u].x))) > int(0u))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue139 = fragmentVectorConstants1.packedValues[5u].x * productValue89;
    float productValue140 = fragmentVectorConstants1.packedValues[5u].y * productValue89;
    float productValue141 = fragmentVectorConstants1.packedValues[5u].z * productValue89;
    float scalarValue47 = ceil(productValue90);
    float productValue142 = (((fragmentVectorConstants1.packedValues[33u].x * productValue90) - productValue139) * scalarValue47) + productValue139;
    float productValue143 = (((fragmentVectorConstants1.packedValues[33u].y * productValue90) - productValue140) * scalarValue47) + productValue140;
    float productValue144 = (((fragmentVectorConstants1.packedValues[33u].z * productValue90) - productValue141) * scalarValue47) + productValue141;
    bool comparisonValue1;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (int(uint(int(fragmentVectorConstants1.packedValues[4u].x))) > int(0u))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue170 = fragmentVectorConstants1.packedValues[5u].x * productValue168;
    float productValue171 = fragmentVectorConstants1.packedValues[5u].y * productValue168;
    float productValue172 = fragmentVectorConstants1.packedValues[5u].z * productValue168;
    float scalarValue51 = ceil(productValue169);
    float productValue173 = (((fragmentVectorConstants1.packedValues[33u].x * productValue169) - productValue170) * scalarValue51) + productValue170;
    float productValue174 = (((fragmentVectorConstants1.packedValues[33u].y * productValue169) - productValue171) * scalarValue51) + productValue171;
    float productValue175 = (((fragmentVectorConstants1.packedValues[33u].z * productValue169) - productValue172) * scalarValue51) + productValue172;
    bool comparisonValue1;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if (int(uint(int(fragmentVectorConstants1.packedValues[4u].x))) > int(0u))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (int(scalarValue3) <= int(scalarValue4))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue6;
        uint intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        intermediateValue6 = 0u;
        intermediateValue7 = 1u;
        intermediateValue8 = productValue38;
        intermediateValue9 = productValue39;
        intermediateValue10 = productValue40;
        float productValue5;
        float productValue6;
        float productValue7;
        uint comparisonValue3;
        for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue10;
        uint intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        intermediateValue10 = 0u;
        intermediateValue11 = 1u;
        intermediateValue12 = productValue74;
        intermediateValue13 = productValue75;
        intermediateValue14 = productValue76;
        float productValue6;
        float productValue7;
        float productValue8;
        uint comparisonValue3;
        for (;;)
        {
            uint sumValue21 = intermediateValue10 + 39u;
            uint sumValue22 = intermediateValue10 + 32u;
            vec4 sampledTextureValue24 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue21].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue21].x, (fragmentVectorConstants1.packedValues[sumValue21].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue21].y));
            float productValue77 = sampledTextureValue24.w * fragmentVectorConstants1.packedValues[sumValue22].w;
            productValue6 = (((sampledTextureValue24.x * fragmentVectorConstants1.packedValues[sumValue22].x) - intermediateValue12) * productValue77) + intermediateValue12;
            productValue7 = (((sampledTextureValue24.y * fragmentVectorConstants1.packedValues[sumValue22].y) - intermediateValue13) * productValue77) + intermediateValue13;
            productValue8 = (((sampledTextureValue24.z * fragmentVectorConstants1.packedValues[sumValue22].z) - intermediateValue14) * productValue77) + intermediateValue14;
            comparisonValue3 = ((intermediateValue11 != 0u) && (productValue77 > 0.5)) ? 0u : intermediateValue11;
            uint sumValue23 = intermediateValue10 + 1u;
            if (int(sumValue23) < int(uint(int(fragmentVectorConstants1.packedValues[4u].x))))
            {
                intermediateValue10 = sumValue23;
                intermediateValue11 = comparisonValue3;
                intermediateValue12 = productValue6;
                intermediateValue13 = productValue7;
                intermediateValue14 = productValue8;
            }
            else
            {
                break;
            }
        }
        comparisonValue1 = comparisonValue3 != 0u;
        intermediateValue7 = productValue6;
        intermediateValue8 = productValue7;
        intermediateValue9 = productValue8;
    }
    else
    {
        comparisonValue1 = true;
        intermediateValue7 = productValue74;
        intermediateValue8 = productValue75;
        intermediateValue9 = productValue76;
    }
    uint comparisonValue27 = comparisonValue1 ? scalarValue22 : (scalarValue22 & 4294967294u);
    float productValue78 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue7;
    float productValue79 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue8;
    float productValue80 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue9;
    vec4 sampledTextureValue14 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue15 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue47 = (fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[48u].x) * (sampledTextureValue15.x + sampledTextureValue14.x);
    float productValue48 = (fragmentVectorConstants1.packedValues[28u].y * fragmentVectorConstants1.packedValues[48u].y) * (sampledTextureValue15.y + sampledTextureValue14.y);
    float productValue49 = (fragmentVectorConstants1.packedValues[28u].z * fragmentVectorConstants1.packedValues[48u].z) * (sampledTextureValue15.z + sampledTextureValue14.z);
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if ((comparisonValue27 & 1u) == 0u)
    {
        intermediateValue15 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue16 = fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue17 = fragmentVectorConstants1.packedValues[46u].x;
        intermediateValue18 = fragmentVectorConstants1.packedValues[47u].x;
    }
    else
    {
        vec4 sampledTextureValue16 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue15 = sampledTextureValue16.x;
        intermediateValue16 = sampledTextureValue16.y;
        intermediateValue17 = sampledTextureValue16.z;
        intermediateValue18 = ((comparisonValue27 & 2u) != 0u) ? sampledTextureValue16.w : fragmentVectorConstants1.packedValues[47u].x;
    }
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    if ((comparisonValue27 & 28u) == 0u)
    {
        intermediateValue19 = varyingNormal0.x;
        intermediateValue20 = varyingNormal0.y;
        intermediateValue21 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
        if ((comparisonValue27 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue6;
        uint intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        intermediateValue6 = 0u;
        intermediateValue7 = 1u;
        intermediateValue8 = productValue95;
        intermediateValue9 = productValue96;
        intermediateValue10 = productValue97;
        float productValue9;
        float productValue10;
        float productValue11;
        uint comparisonValue3;
        for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue10;
        uint intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        intermediateValue10 = 0u;
        intermediateValue11 = 1u;
        intermediateValue12 = productValue113;
        intermediateValue13 = productValue114;
        intermediateValue14 = productValue115;
        float productValue10;
        float productValue11;
        float productValue12;
        uint comparisonValue3;
        for (;;)
        {
            uint sumValue29 = intermediateValue10 + 41u;
            uint sumValue30 = intermediateValue10 + 34u;
            vec4 sampledTextureValue26 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue29].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue29].x, (fragmentVectorConstants1.packedValues[sumValue29].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue29].y));
            float productValue116 = sampledTextureValue26.w * fragmentVectorConstants1.packedValues[sumValue30].w;
            productValue10 = (((sampledTextureValue26.x * fragmentVectorConstants1.packedValues[sumValue30].x) - intermediateValue12) * productValue116) + intermediateValue12;
            productValue11 = (((sampledTextureValue26.y * fragmentVectorConstants1.packedValues[sumValue30].y) - intermediateValue13) * productValue116) + intermediateValue13;
            productValue12 = (((sampledTextureValue26.z * fragmentVectorConstants1.packedValues[sumValue30].z) - intermediateValue14) * productValue116) + intermediateValue14;
            comparisonValue3 = ((intermediateValue11 != 0u) && (productValue116 > 0.5)) ? 0u : intermediateValue11;
            uint sumValue23 = intermediateValue10 + 1u;
            if (int(sumValue23) < int(uint(int(fragmentVectorConstants1.packedValues[4u].x))))
            {
                intermediateValue10 = sumValue23;
                intermediateValue11 = comparisonValue3;
                intermediateValue12 = productValue10;
                intermediateValue13 = productValue11;
                intermediateValue14 = productValue12;
            }
            else
            {
                break;
            }
        }
        comparisonValue1 = comparisonValue3 != 0u;
        intermediateValue7 = productValue10;
        intermediateValue8 = productValue11;
        intermediateValue9 = productValue12;
    }
    else
    {
        comparisonValue1 = true;
        intermediateValue7 = productValue113;
        intermediateValue8 = productValue114;
        intermediateValue9 = productValue115;
    }
    uint comparisonValue37 = comparisonValue1 ? scalarValue40 : (scalarValue40 & 4294967294u);
    float productValue117 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue7;
    float productValue118 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue8;
    float productValue119 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue9;
    vec4 sampledTextureValue14 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue15 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue102 = (fragmentVectorConstants1.packedValues[30u].x * fragmentVectorConstants1.packedValues[50u].x) * (sampledTextureValue15.x + sampledTextureValue14.x);
    float productValue103 = (fragmentVectorConstants1.packedValues[30u].y * fragmentVectorConstants1.packedValues[50u].y) * (sampledTextureValue15.y + sampledTextureValue14.y);
    float productValue104 = (fragmentVectorConstants1.packedValues[30u].z * fragmentVectorConstants1.packedValues[50u].z) * (sampledTextureValue15.z + sampledTextureValue14.z);
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if ((comparisonValue37 & 1u) == 0u)
    {
        intermediateValue15 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue16 = fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue17 = fragmentVectorConstants1.packedValues[48u].x;
        intermediateValue18 = fragmentVectorConstants1.packedValues[49u].x;
    }
    else
    {
        vec4 sampledTextureValue16 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue15 = sampledTextureValue16.x;
        intermediateValue16 = sampledTextureValue16.y;
        intermediateValue17 = sampledTextureValue16.z;
        intermediateValue18 = ((comparisonValue37 & 2u) != 0u) ? sampledTextureValue16.w : fragmentVectorConstants1.packedValues[49u].x;
    }
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    if ((comparisonValue37 & 28u) == 0u)
    {
        intermediateValue19 = varyingNormal0.x;
        intermediateValue20 = varyingNormal0.y;
        intermediateValue21 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
        if ((comparisonValue37 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue7;
        uint intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        intermediateValue7 = 0u;
        intermediateValue8 = 1u;
        intermediateValue9 = productValue142;
        intermediateValue10 = productValue143;
        intermediateValue11 = productValue144;
        float productValue10;
        float productValue11;
        float productValue12;
        uint comparisonValue3;
        for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue10;
        uint intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        intermediateValue10 = 0u;
        intermediateValue11 = 1u;
        intermediateValue12 = productValue173;
        intermediateValue13 = productValue174;
        intermediateValue14 = productValue175;
        float productValue11;
        float productValue12;
        float productValue13;
        uint comparisonValue3;
        for (;;)
        {
            uint sumValue38 = intermediateValue10 + 42u;
            uint sumValue39 = intermediateValue10 + 35u;
            vec4 sampledTextureValue30 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue38].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue38].x, (fragmentVectorConstants1.packedValues[sumValue38].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue38].y));
            float productValue176 = sampledTextureValue30.w * fragmentVectorConstants1.packedValues[sumValue39].w;
            productValue11 = (((sampledTextureValue30.x * fragmentVectorConstants1.packedValues[sumValue39].x) - intermediateValue12) * productValue176) + intermediateValue12;
            productValue12 = (((sampledTextureValue30.y * fragmentVectorConstants1.packedValues[sumValue39].y) - intermediateValue13) * productValue176) + intermediateValue13;
            productValue13 = (((sampledTextureValue30.z * fragmentVectorConstants1.packedValues[sumValue39].z) - intermediateValue14) * productValue176) + intermediateValue14;
            comparisonValue3 = ((intermediateValue11 != 0u) && (productValue176 > 0.5)) ? 0u : intermediateValue11;
            uint sumValue23 = intermediateValue10 + 1u;
            if (int(sumValue23) < int(uint(int(fragmentVectorConstants1.packedValues[4u].x))))
            {
                intermediateValue10 = sumValue23;
                intermediateValue11 = comparisonValue3;
                intermediateValue12 = productValue11;
                intermediateValue13 = productValue12;
                intermediateValue14 = productValue13;
            }
            else
            {
                break;
            }
        }
        comparisonValue1 = comparisonValue3 != 0u;
        intermediateValue7 = productValue11;
        intermediateValue8 = productValue12;
        intermediateValue9 = productValue13;
    }
    else
    {
        comparisonValue1 = true;
        intermediateValue7 = productValue173;
        intermediateValue8 = productValue174;
        intermediateValue9 = productValue175;
    }
    uint comparisonValue37 = comparisonValue1 ? scalarValue40 : (scalarValue40 & 4294967294u);
    float productValue117 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue7;
    float productValue118 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue8;
    float productValue119 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue9;
    vec4 sampledTextureValue14 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue15 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue149 = (fragmentVectorConstants1.packedValues[30u].x * fragmentVectorConstants1.packedValues[51u].x) * (sampledTextureValue15.x + sampledTextureValue14.x);
    float productValue150 = (fragmentVectorConstants1.packedValues[30u].y * fragmentVectorConstants1.packedValues[51u].y) * (sampledTextureValue15.y + sampledTextureValue14.y);
    float productValue151 = (fragmentVectorConstants1.packedValues[30u].z * fragmentVectorConstants1.packedValues[51u].z) * (sampledTextureValue15.z + sampledTextureValue14.z);
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if ((comparisonValue37 & 1u) == 0u)
    {
        intermediateValue15 = fragmentVectorConstants1.packedValues[34u].x;
        intermediateValue16 = fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue17 = fragmentVectorConstants1.packedValues[49u].x;
        intermediateValue18 = fragmentVectorConstants1.packedValues[50u].x;
    }
    else
    {
        vec4 sampledTextureValue16 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue15 = sampledTextureValue16.x;
        intermediateValue16 = sampledTextureValue16.y;
        intermediateValue17 = sampledTextureValue16.z;
        intermediateValue18 = ((comparisonValue37 & 2u) != 0u) ? sampledTextureValue16.w : fragmentVectorConstants1.packedValues[50u].x;
    }
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    if ((comparisonValue37 & 28u) == 0u)
    {
        intermediateValue19 = varyingNormal0.x;
        intermediateValue20 = varyingNormal0.y;
        intermediateValue21 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
        if ((comparisonValue37 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue1 = scalarValue4 + 39u;
        vec4 sampledTextureValue1 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue1].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue1].x), fma(fragmentVectorConstants1.packedValues[sumValue1].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue1].y)));
        uint sumValue2 = scalarValue4 + 32u;
        float bitwiseValue = sampledTextureValue1.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 512u) + 12u) >> 2u];
        multiplyAddValue2 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[sumValue2].x, -productValue6);
        multiplyAddValue3 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[sumValue2].y, -productValue5);
        multiplyAddValue4 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[sumValue2].z, -productValue4);
        multiplyAddValue7 = fma(bitwiseValue, multiplyAddValue2, productValue6);
        multiplyAddValue6 = fma(bitwiseValue, multiplyAddValue3, productValue5);
        multiplyAddValue5 = fma(bitwiseValue, multiplyAddValue4, productValue4);
        comparisonValue = ((bitwiseValue > 0.5) && (intermediateValue24 != 0u)) ? 0u : intermediateValue24;
        sumValue = scalarValue4 + 1u;
        intermediateValue20 = multiplyAddValue2;
        intermediateValue22 = multiplyAddValue3;
        intermediateValue23 = multiplyAddValue4;
        intermediateValue24 = comparisonValue;
        productValue4 = multiplyAddValue5;
        productValue5 = multiplyAddValue6;
        productValue6 = multiplyAddValue7;
        scalarValue4 = sumValue;
        continue;
    }
    uint comparisonValue2 = (intermediateValue24 != 0u) ? scalarValue2 : (scalarValue2 & 4294967294u);
    float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[84u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[84u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[84u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue28 = fma(sampledTextureValue2.x, fragmentVectorConstants1.packedValues[28u].x, sampledTextureValue3.x * fragmentVectorConstants1.packedValues[28u].x) * fragmentVectorConstants1.packedValues[48u].x;
    float multiplyAddValue29 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[28u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[28u].y) * fragmentVectorConstants1.packedValues[48u].y;
    float multiplyAddValue30 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[28u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[28u].z) * fragmentVectorConstants1.packedValues[48u].z;
    fragmentColor1.x = fma(multiplyAddValue28, multiplyAddValue28, fma(fragmentScalarConstants1.packedValues[59u], fma(-productValue6, multiplyAddValue15, fragmentVectorConstants1.packedValues[14u].x), multiplyAddValue15 * productValue6));
    fragmentColor1.y = fma(multiplyAddValue29, multiplyAddValue29, fma(fragmentScalarConstants1.packedValues[59u], fma(-productValue5, multiplyAddValue16, fragmentVectorConstants1.packedValues[14u].y), multiplyAddValue16 * productValue5));
    fragmentColor1.z = fma(multiplyAddValue30, multiplyAddValue30, fma(fragmentScalarConstants1.packedValues[59u], fma(-productValue4, multiplyAddValue17, fragmentVectorConstants1.packedValues[14u].z), multiplyAddValue17 * productValue4));
    bool comparisonValue4 = (comparisonValue2 & 16u) == 16u;
    bool comparisonValue6 = (comparisonValue2 & 4u) == 4u;
    bool comparisonValue7 = (comparisonValue2 & 8u) == 8u;
    float scalarValue5 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue6 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue7 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue8 = dFdxCoarse(varyingTexCoord0.x);
    float comparisonValue5;
    float intermediateValue30;
    float intermediateValue31;
    float intermediateValue32;
    if ((comparisonValue2 & 1u) == 1u)
    {
        vec4 sampledTextureValue4 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
        comparisonValue5 = ((comparisonValue2 & 2u) == 2u) ? sampledTextureValue4.w : fragmentScalarConstants1.packedValues[188u];
        intermediateValue30 = sampledTextureValue4.x;
        intermediateValue31 = sampledTextureValue4.z;
        intermediateValue32 = sampledTextureValue4.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[188u];
        intermediateValue30 = fragmentScalarConstants1.packedValues[124u];
        intermediateValue31 = fragmentScalarConstants1.packedValues[184u];
        intermediateValue32 = fragmentScalarConstants1.packedValues[108u];
    }
    float productValue7;
    float productValue8;
    float productValue9;
    if (comparisonValue4 || (comparisonValue7 || comparisonValue6))
    {
        float multiplyAddValue18;
        float multiplyAddValue19;
        float multiplyAddValue20;
        bool intermediateValue36;
        if (comparisonValue6)
        {
            vec4 sampledTextureValue5 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
            multiplyAddValue18 = fma(sampledTextureValue5.z, 2.0, -1.0);
            multiplyAddValue19 = fma(sampledTextureValue5.y, 2.0, -1.0);
            multiplyAddValue20 = fma(sampledTextureValue5.x, 2.0, -1.0);
            intermediateValue36 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue1 = scalarValue4 + 39u;
        vec4 sampledTextureValue1 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue1].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue1].x), fma(fragmentVectorConstants1.packedValues[sumValue1].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue1].y)));
        uint sumValue2 = scalarValue4 + 32u;
        float bitwiseValue = sampledTextureValue1.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 512u) + 12u) >> 2u];
        multiplyAddValue2 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[sumValue2].x, -multiplyAddValue9);
        multiplyAddValue3 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[sumValue2].y, -multiplyAddValue7);
        multiplyAddValue4 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[sumValue2].z, -multiplyAddValue5);
        multiplyAddValue10 = fma(bitwiseValue, multiplyAddValue2, multiplyAddValue9);
        multiplyAddValue8 = fma(bitwiseValue, multiplyAddValue3, multiplyAddValue7);
        multiplyAddValue6 = fma(bitwiseValue, multiplyAddValue4, multiplyAddValue5);
        comparisonValue = ((bitwiseValue > 0.5) && (intermediateValue28 != 0u)) ? 0u : intermediateValue28;
        sumValue = scalarValue4 + 1u;
        intermediateValue24 = multiplyAddValue2;
        intermediateValue26 = multiplyAddValue3;
        intermediateValue27 = multiplyAddValue4;
        intermediateValue28 = comparisonValue;
        multiplyAddValue5 = multiplyAddValue6;
        multiplyAddValue7 = multiplyAddValue8;
        multiplyAddValue9 = multiplyAddValue10;
        scalarValue4 = sumValue;
        continue;
    }
    uint comparisonValue32 = (intermediateValue28 != 0u) ? scalarValue2 : (scalarValue2 & 4294967294u);
    float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[84u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[84u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[84u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue28 = fma(sampledTextureValue2.x, fragmentVectorConstants1.packedValues[28u].x, sampledTextureValue3.x * fragmentVectorConstants1.packedValues[28u].x) * fragmentVectorConstants1.packedValues[48u].x;
    float multiplyAddValue29 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[28u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[28u].y) * fragmentVectorConstants1.packedValues[48u].y;
    float multiplyAddValue30 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[28u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[28u].z) * fragmentVectorConstants1.packedValues[48u].z;
    fragmentColor1.x = fma(multiplyAddValue28, multiplyAddValue28, fma(fragmentScalarConstants1.packedValues[59u], fma(-multiplyAddValue9, multiplyAddValue15, fragmentVectorConstants1.packedValues[14u].x), multiplyAddValue15 * multiplyAddValue9));
    fragmentColor1.y = fma(multiplyAddValue29, multiplyAddValue29, fma(fragmentScalarConstants1.packedValues[59u], fma(-multiplyAddValue7, multiplyAddValue16, fragmentVectorConstants1.packedValues[14u].y), multiplyAddValue16 * multiplyAddValue7));
    fragmentColor1.z = fma(multiplyAddValue30, multiplyAddValue30, fma(fragmentScalarConstants1.packedValues[59u], fma(-multiplyAddValue5, multiplyAddValue17, fragmentVectorConstants1.packedValues[14u].z), multiplyAddValue17 * multiplyAddValue5));
    bool comparisonValue33 = (comparisonValue32 & 16u) == 16u;
    bool comparisonValue34 = (comparisonValue32 & 4u) == 4u;
    bool comparisonValue35 = (comparisonValue32 & 8u) == 8u;
    float scalarValue7 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue8 = dFdxCoarse(varyingTexCoord0.x);
    float scalarValue6 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue5 = dFdxCoarse(varyingTexCoord0.y);
    float comparisonValue5;
    float intermediateValue34;
    float intermediateValue35;
    float intermediateValue36;
    if ((comparisonValue32 & 1u) == 1u)
    {
        vec4 sampledTextureValue4 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
        comparisonValue5 = ((comparisonValue32 & 2u) == 2u) ? sampledTextureValue4.w : fragmentScalarConstants1.packedValues[188u];
        intermediateValue34 = sampledTextureValue4.x;
        intermediateValue35 = sampledTextureValue4.z;
        intermediateValue36 = sampledTextureValue4.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[188u];
        intermediateValue34 = fragmentScalarConstants1.packedValues[124u];
        intermediateValue35 = fragmentScalarConstants1.packedValues[184u];
        intermediateValue36 = fragmentScalarConstants1.packedValues[108u];
    }
    float productValue5;
    float productValue6;
    float productValue7;
    if (comparisonValue33 || (comparisonValue35 || comparisonValue34))
    {
        float multiplyAddValue21;
        float multiplyAddValue22;
        float multiplyAddValue23;
        bool intermediateValue40;
        if (comparisonValue34)
        {
            vec4 sampledTextureValue5 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
            multiplyAddValue21 = fma(sampledTextureValue5.z, 2.0, -1.0);
            multiplyAddValue22 = fma(sampledTextureValue5.y, 2.0, -1.0);
            multiplyAddValue23 = fma(sampledTextureValue5.x, 2.0, -1.0);
            intermediateValue40 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue31 = scalarValue4 + 41u;
        vec4 sampledTextureValue27 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue31].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue31].x), fma(fragmentVectorConstants1.packedValues[sumValue31].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue31].y)));
        uint sumValue32 = scalarValue4 + 34u;
        float bitwiseValue4 = sampledTextureValue27.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 544u) + 12u) >> 2u];
        multiplyAddValue2 = fma(sampledTextureValue27.x, fragmentVectorConstants1.packedValues[sumValue32].x, -multiplyAddValue9);
        multiplyAddValue3 = fma(sampledTextureValue27.y, fragmentVectorConstants1.packedValues[sumValue32].y, -multiplyAddValue7);
        multiplyAddValue4 = fma(sampledTextureValue27.z, fragmentVectorConstants1.packedValues[sumValue32].z, -multiplyAddValue5);
        multiplyAddValue10 = fma(bitwiseValue4, multiplyAddValue2, multiplyAddValue9);
        multiplyAddValue8 = fma(bitwiseValue4, multiplyAddValue3, multiplyAddValue7);
        multiplyAddValue6 = fma(bitwiseValue4, multiplyAddValue4, multiplyAddValue5);
        comparisonValue = ((bitwiseValue4 > 0.5) && (intermediateValue23 != 0u)) ? 0u : intermediateValue23;
        sumValue = scalarValue4 + 1u;
        intermediateValue20 = multiplyAddValue2;
        intermediateValue21 = multiplyAddValue3;
        intermediateValue22 = multiplyAddValue4;
        intermediateValue23 = comparisonValue;
        multiplyAddValue5 = multiplyAddValue6;
        multiplyAddValue7 = multiplyAddValue8;
        multiplyAddValue9 = multiplyAddValue10;
        scalarValue4 = sumValue;
        continue;
    }
    uint comparisonValue38 = (intermediateValue23 != 0u) ? scalarValue43 : (scalarValue43 & 4294967294u);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue62 = fma(sampledTextureValue2.x, fragmentVectorConstants1.packedValues[30u].x, sampledTextureValue3.x * fragmentVectorConstants1.packedValues[30u].x) * fragmentVectorConstants1.packedValues[50u].x;
    float multiplyAddValue63 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[30u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[30u].y) * fragmentVectorConstants1.packedValues[50u].y;
    float multiplyAddValue64 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[30u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[30u].z) * fragmentVectorConstants1.packedValues[50u].z;
    fragmentColor1.x = fma(multiplyAddValue62, multiplyAddValue62, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue9, multiplyAddValue59, fragmentVectorConstants1.packedValues[15u].x), multiplyAddValue59 * multiplyAddValue9));
    fragmentColor1.y = fma(multiplyAddValue63, multiplyAddValue63, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue7, multiplyAddValue60, fragmentVectorConstants1.packedValues[15u].y), multiplyAddValue60 * multiplyAddValue7));
    fragmentColor1.z = fma(multiplyAddValue64, multiplyAddValue64, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue5, multiplyAddValue61, fragmentVectorConstants1.packedValues[15u].z), multiplyAddValue61 * multiplyAddValue5));
    bool comparisonValue39 = (comparisonValue38 & 16u) == 16u;
    bool comparisonValue40 = (comparisonValue38 & 4u) == 4u;
    bool comparisonValue41 = (comparisonValue38 & 8u) == 8u;
    float scalarValue6 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue7 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue8 = dFdxCoarse(varyingTexCoord0.x);
    float scalarValue5 = dFdxCoarse(varyingTexCoord0.y);
    float comparisonValue5;
    float intermediateValue29;
    float intermediateValue30;
    float intermediateValue31;
    if ((comparisonValue38 & 1u) == 1u)
    {
        vec4 sampledTextureValue4 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
        comparisonValue5 = ((comparisonValue38 & 2u) == 2u) ? sampledTextureValue4.w : fragmentScalarConstants1.packedValues[196u];
        intermediateValue29 = sampledTextureValue4.x;
        intermediateValue30 = sampledTextureValue4.z;
        intermediateValue31 = sampledTextureValue4.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[196u];
        intermediateValue29 = fragmentScalarConstants1.packedValues[132u];
        intermediateValue30 = fragmentScalarConstants1.packedValues[192u];
        intermediateValue31 = fragmentScalarConstants1.packedValues[116u];
    }
    float productValue10;
    float productValue11;
    float productValue12;
    if (comparisonValue39 || (comparisonValue41 || comparisonValue40))
    {
        float multiplyAddValue21;
        float multiplyAddValue22;
        float multiplyAddValue23;
        bool intermediateValue35;
        if (comparisonValue40)
        {
            vec4 sampledTextureValue5 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
            multiplyAddValue21 = fma(sampledTextureValue5.z, 2.0, -1.0);
            multiplyAddValue22 = fma(sampledTextureValue5.y, 2.0, -1.0);
            multiplyAddValue23 = fma(sampledTextureValue5.x, 2.0, -1.0);
            intermediateValue35 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue31 = scalarValue4 + 41u;
        vec4 sampledTextureValue27 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue31].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue31].x), fma(fragmentVectorConstants1.packedValues[sumValue31].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue31].y)));
        uint sumValue32 = scalarValue4 + 34u;
        float bitwiseValue4 = sampledTextureValue27.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 544u) + 12u) >> 2u];
        multiplyAddValue6 = fma(sampledTextureValue27.x, fragmentVectorConstants1.packedValues[sumValue32].x, -multiplyAddValue13);
        multiplyAddValue7 = fma(sampledTextureValue27.y, fragmentVectorConstants1.packedValues[sumValue32].y, -multiplyAddValue11);
        multiplyAddValue8 = fma(sampledTextureValue27.z, fragmentVectorConstants1.packedValues[sumValue32].z, -multiplyAddValue9);
        multiplyAddValue14 = fma(bitwiseValue4, multiplyAddValue6, multiplyAddValue13);
        multiplyAddValue12 = fma(bitwiseValue4, multiplyAddValue7, multiplyAddValue11);
        multiplyAddValue10 = fma(bitwiseValue4, multiplyAddValue8, multiplyAddValue9);
        comparisonValue = ((bitwiseValue4 > 0.5) && (intermediateValue27 != 0u)) ? 0u : intermediateValue27;
        sumValue = scalarValue4 + 1u;
        intermediateValue24 = multiplyAddValue6;
        intermediateValue25 = multiplyAddValue7;
        intermediateValue26 = multiplyAddValue8;
        intermediateValue27 = comparisonValue;
        multiplyAddValue9 = multiplyAddValue10;
        multiplyAddValue11 = multiplyAddValue12;
        multiplyAddValue13 = multiplyAddValue14;
        scalarValue4 = sumValue;
        continue;
    }
    uint comparisonValue44 = (intermediateValue27 != 0u) ? scalarValue43 : (scalarValue43 & 4294967294u);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue62 = fma(sampledTextureValue2.x, fragmentVectorConstants1.packedValues[30u].x, sampledTextureValue3.x * fragmentVectorConstants1.packedValues[30u].x) * fragmentVectorConstants1.packedValues[50u].x;
    float multiplyAddValue63 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[30u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[30u].y) * fragmentVectorConstants1.packedValues[50u].y;
    float multiplyAddValue64 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[30u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[30u].z) * fragmentVectorConstants1.packedValues[50u].z;
    fragmentColor1.x = fma(multiplyAddValue62, multiplyAddValue62, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue13, multiplyAddValue59, fragmentVectorConstants1.packedValues[15u].x), multiplyAddValue59 * multiplyAddValue13));
    fragmentColor1.y = fma(multiplyAddValue63, multiplyAddValue63, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue11, multiplyAddValue60, fragmentVectorConstants1.packedValues[15u].y), multiplyAddValue60 * multiplyAddValue11));
    fragmentColor1.z = fma(multiplyAddValue64, multiplyAddValue64, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue9, multiplyAddValue61, fragmentVectorConstants1.packedValues[15u].z), multiplyAddValue61 * multiplyAddValue9));
    bool comparisonValue45 = (comparisonValue44 & 16u) == 16u;
    bool comparisonValue46 = (comparisonValue44 & 4u) == 4u;
    bool comparisonValue47 = (comparisonValue44 & 8u) == 8u;
    float scalarValue7 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue5 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue6 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue8 = dFdxCoarse(varyingTexCoord0.x);
    float comparisonValue5;
    float intermediateValue33;
    float intermediateValue34;
    float intermediateValue35;
    if ((comparisonValue44 & 1u) == 1u)
    {
        vec4 sampledTextureValue4 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
        comparisonValue5 = ((comparisonValue44 & 2u) == 2u) ? sampledTextureValue4.w : fragmentScalarConstants1.packedValues[196u];
        intermediateValue33 = sampledTextureValue4.x;
        intermediateValue34 = sampledTextureValue4.z;
        intermediateValue35 = sampledTextureValue4.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[196u];
        intermediateValue33 = fragmentScalarConstants1.packedValues[132u];
        intermediateValue34 = fragmentScalarConstants1.packedValues[192u];
        intermediateValue35 = fragmentScalarConstants1.packedValues[116u];
    }
    float productValue7;
    float productValue8;
    float productValue9;
    if (comparisonValue45 || (comparisonValue47 || comparisonValue46))
    {
        float multiplyAddValue25;
        float multiplyAddValue26;
        float multiplyAddValue27;
        bool intermediateValue39;
        if (comparisonValue46)
        {
            vec4 sampledTextureValue5 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
            multiplyAddValue25 = fma(sampledTextureValue5.z, 2.0, -1.0);
            multiplyAddValue26 = fma(sampledTextureValue5.y, 2.0, -1.0);
            multiplyAddValue27 = fma(sampledTextureValue5.x, 2.0, -1.0);
            intermediateValue39 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue36 = scalarValue4 + 42u;
        vec4 sampledTextureValue29 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue36].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue36].x), fma(fragmentVectorConstants1.packedValues[sumValue36].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue36].y)));
        uint sumValue37 = scalarValue4 + 35u;
        float bitwiseValue6 = sampledTextureValue29.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 560u) + 12u) >> 2u];
        multiplyAddValue2 = fma(sampledTextureValue29.x, fragmentVectorConstants1.packedValues[sumValue37].x, -multiplyAddValue9);
        multiplyAddValue3 = fma(sampledTextureValue29.y, fragmentVectorConstants1.packedValues[sumValue37].y, -multiplyAddValue7);
        multiplyAddValue4 = fma(sampledTextureValue29.z, fragmentVectorConstants1.packedValues[sumValue37].z, -multiplyAddValue5);
        multiplyAddValue10 = fma(bitwiseValue6, multiplyAddValue2, multiplyAddValue9);
        multiplyAddValue8 = fma(bitwiseValue6, multiplyAddValue3, multiplyAddValue7);
        multiplyAddValue6 = fma(bitwiseValue6, multiplyAddValue4, multiplyAddValue5);
        comparisonValue = ((bitwiseValue6 > 0.5) && (intermediateValue25 != 0u)) ? 0u : intermediateValue25;
        sumValue = scalarValue4 + 1u;
        intermediateValue21 = multiplyAddValue2;
        intermediateValue23 = multiplyAddValue3;
        intermediateValue24 = multiplyAddValue4;
        intermediateValue25 = comparisonValue;
        multiplyAddValue5 = multiplyAddValue6;
        multiplyAddValue7 = multiplyAddValue8;
        multiplyAddValue9 = multiplyAddValue10;
        scalarValue4 = sumValue;
        continue;
    }
    uint comparisonValue49 = (intermediateValue25 != 0u) ? scalarValue43 : (scalarValue43 & 4294967294u);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue82 = fma(sampledTextureValue2.x, fragmentVectorConstants1.packedValues[30u].x, sampledTextureValue3.x * fragmentVectorConstants1.packedValues[30u].x) * fragmentVectorConstants1.packedValues[51u].x;
    float multiplyAddValue83 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[30u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[30u].y) * fragmentVectorConstants1.packedValues[51u].y;
    float multiplyAddValue84 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[30u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[30u].z) * fragmentVectorConstants1.packedValues[51u].z;
    fragmentColor1.x = fma(multiplyAddValue82, multiplyAddValue82, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue9, multiplyAddValue59, fragmentVectorConstants1.packedValues[15u].x), multiplyAddValue59 * multiplyAddValue9));
    fragmentColor1.y = fma(multiplyAddValue83, multiplyAddValue83, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue7, multiplyAddValue60, fragmentVectorConstants1.packedValues[15u].y), multiplyAddValue60 * multiplyAddValue7));
    fragmentColor1.z = fma(multiplyAddValue84, multiplyAddValue84, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue5, multiplyAddValue61, fragmentVectorConstants1.packedValues[15u].z), multiplyAddValue61 * multiplyAddValue5));
    bool comparisonValue50 = (comparisonValue49 & 16u) == 16u;
    bool comparisonValue51 = (comparisonValue49 & 4u) == 4u;
    bool comparisonValue52 = (comparisonValue49 & 8u) == 8u;
    float scalarValue6 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue5 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue7 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue8 = dFdxCoarse(varyingTexCoord0.x);
    float comparisonValue5;
    float intermediateValue31;
    float intermediateValue32;
    float intermediateValue33;
    if ((comparisonValue49 & 1u) == 1u)
    {
        vec4 sampledTextureValue4 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
        comparisonValue5 = ((comparisonValue49 & 2u) == 2u) ? sampledTextureValue4.w : fragmentScalarConstants1.packedValues[200u];
        intermediateValue31 = sampledTextureValue4.x;
        intermediateValue32 = sampledTextureValue4.z;
        intermediateValue33 = sampledTextureValue4.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[200u];
        intermediateValue31 = fragmentScalarConstants1.packedValues[136u];
        intermediateValue32 = fragmentScalarConstants1.packedValues[196u];
        intermediateValue33 = fragmentScalarConstants1.packedValues[116u];
    }
    float productValue9;
    float productValue10;
    float productValue11;
    if (comparisonValue50 || (comparisonValue52 || comparisonValue51))
    {
        float multiplyAddValue21;
        float multiplyAddValue22;
        float multiplyAddValue23;
        bool intermediateValue37;
        if (comparisonValue51)
        {
            vec4 sampledTextureValue5 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
            multiplyAddValue21 = fma(sampledTextureValue5.z, 2.0, -1.0);
            multiplyAddValue22 = fma(sampledTextureValue5.y, 2.0, -1.0);
            multiplyAddValue23 = fma(sampledTextureValue5.x, 2.0, -1.0);
            intermediateValue37 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue36 = scalarValue4 + 42u;
        vec4 sampledTextureValue29 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue36].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue36].x), fma(fragmentVectorConstants1.packedValues[sumValue36].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue36].y)));
        uint sumValue37 = scalarValue4 + 35u;
        float bitwiseValue6 = sampledTextureValue29.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 560u) + 12u) >> 2u];
        multiplyAddValue4 = fma(sampledTextureValue29.x, fragmentVectorConstants1.packedValues[sumValue37].x, -multiplyAddValue11);
        multiplyAddValue5 = fma(sampledTextureValue29.y, fragmentVectorConstants1.packedValues[sumValue37].y, -multiplyAddValue9);
        multiplyAddValue6 = fma(sampledTextureValue29.z, fragmentVectorConstants1.packedValues[sumValue37].z, -multiplyAddValue7);
        multiplyAddValue12 = fma(bitwiseValue6, multiplyAddValue4, multiplyAddValue11);
        multiplyAddValue10 = fma(bitwiseValue6, multiplyAddValue5, multiplyAddValue9);
        multiplyAddValue8 = fma(bitwiseValue6, multiplyAddValue6, multiplyAddValue7);
        comparisonValue = ((bitwiseValue6 > 0.5) && (intermediateValue28 != 0u)) ? 0u : intermediateValue28;
        sumValue = scalarValue4 + 1u;
        intermediateValue24 = multiplyAddValue4;
        intermediateValue26 = multiplyAddValue5;
        intermediateValue27 = multiplyAddValue6;
        intermediateValue28 = comparisonValue;
        multiplyAddValue7 = multiplyAddValue8;
        multiplyAddValue9 = multiplyAddValue10;
        multiplyAddValue11 = multiplyAddValue12;
        scalarValue4 = sumValue;
        continue;
    }
    uint comparisonValue54 = (intermediateValue28 != 0u) ? scalarValue43 : (scalarValue43 & 4294967294u);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[92u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue82 = fma(sampledTextureValue2.x, fragmentVectorConstants1.packedValues[30u].x, sampledTextureValue3.x * fragmentVectorConstants1.packedValues[30u].x) * fragmentVectorConstants1.packedValues[51u].x;
    float multiplyAddValue83 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[30u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[30u].y) * fragmentVectorConstants1.packedValues[51u].y;
    float multiplyAddValue84 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[30u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[30u].z) * fragmentVectorConstants1.packedValues[51u].z;
    fragmentColor1.x = fma(multiplyAddValue82, multiplyAddValue82, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue11, multiplyAddValue59, fragmentVectorConstants1.packedValues[15u].x), multiplyAddValue59 * multiplyAddValue11));
    fragmentColor1.y = fma(multiplyAddValue83, multiplyAddValue83, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue9, multiplyAddValue60, fragmentVectorConstants1.packedValues[15u].y), multiplyAddValue60 * multiplyAddValue9));
    fragmentColor1.z = fma(multiplyAddValue84, multiplyAddValue84, fma(fragmentScalarConstants1.packedValues[63u], fma(-multiplyAddValue7, multiplyAddValue61, fragmentVectorConstants1.packedValues[15u].z), multiplyAddValue61 * multiplyAddValue7));
    bool comparisonValue55 = (comparisonValue54 & 16u) == 16u;
    bool comparisonValue56 = (comparisonValue54 & 4u) == 4u;
    bool comparisonValue57 = (comparisonValue54 & 8u) == 8u;
    float scalarValue7 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue8 = dFdxCoarse(varyingTexCoord0.x);
    float scalarValue6 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue5 = dFdxCoarse(varyingTexCoord0.y);
    float comparisonValue5;
    float intermediateValue34;
    float intermediateValue35;
    float intermediateValue36;
    if ((comparisonValue54 & 1u) == 1u)
    {
        vec4 sampledTextureValue4 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
        comparisonValue5 = ((comparisonValue54 & 2u) == 2u) ? sampledTextureValue4.w : fragmentScalarConstants1.packedValues[200u];
        intermediateValue34 = sampledTextureValue4.x;
        intermediateValue35 = sampledTextureValue4.z;
        intermediateValue36 = sampledTextureValue4.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[200u];
        intermediateValue34 = fragmentScalarConstants1.packedValues[136u];
        intermediateValue35 = fragmentScalarConstants1.packedValues[196u];
        intermediateValue36 = fragmentScalarConstants1.packedValues[116u];
    }
    float productValue8;
    float productValue9;
    float productValue10;
    if (comparisonValue55 || (comparisonValue57 || comparisonValue56))
    {
        float multiplyAddValue23;
        float multiplyAddValue24;
        float multiplyAddValue25;
        bool intermediateValue40;
        if (comparisonValue56)
        {
            vec4 sampledTextureValue5 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue8, scalarValue5), vec2(scalarValue7, scalarValue6));
            multiplyAddValue23 = fma(sampledTextureValue5.z, 2.0, -1.0);
            multiplyAddValue24 = fma(sampledTextureValue5.y, 2.0, -1.0);
            multiplyAddValue25 = fma(sampledTextureValue5.x, 2.0, -1.0);
            intermediateValue40 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            uint sumValue15 = intermediateValue6 + 39u;
            uint sumValue16 = intermediateValue6 + 32u;
            vec4 sampledTextureValue13 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue15].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue15].x, (fragmentVectorConstants1.packedValues[sumValue15].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue15].y));
            float productValue43 = sampledTextureValue13.w * fragmentVectorConstants1.packedValues[sumValue16].w;
            productValue5 = (((sampledTextureValue13.x * fragmentVectorConstants1.packedValues[sumValue16].x) - intermediateValue8) * productValue43) + intermediateValue8;
            productValue6 = (((sampledTextureValue13.y * fragmentVectorConstants1.packedValues[sumValue16].y) - intermediateValue9) * productValue43) + intermediateValue9;
            productValue7 = (((sampledTextureValue13.z * fragmentVectorConstants1.packedValues[sumValue16].z) - intermediateValue10) * productValue43) + intermediateValue10;
            comparisonValue3 = ((intermediateValue7 != 0u) && (productValue43 > 0.5)) ? 0u : intermediateValue7;
            uint sumValue17 = intermediateValue6 + 1u;
            if (int(sumValue17) < int(uint(int(fragmentVectorConstants1.packedValues[4u].x))))
            {
                intermediateValue6 = sumValue17;
                intermediateValue7 = comparisonValue3;
                intermediateValue8 = productValue5;
                intermediateValue9 = productValue6;
                intermediateValue10 = productValue7;
            }
            else
            {
                break;
            }
        }
        comparisonValue1 = comparisonValue3 != 0u;
        intermediateValue3 = productValue5;
        intermediateValue4 = productValue6;
        intermediateValue5 = productValue7;
    }
    else
    {
        comparisonValue1 = true;
        intermediateValue3 = productValue38;
        intermediateValue4 = productValue39;
        intermediateValue5 = productValue40;
    }
    uint comparisonValue27 = comparisonValue1 ? scalarValue22 : (scalarValue22 & 4294967294u);
    float productValue44 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue3;
    float productValue45 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue4;
    float productValue46 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue5;
    vec4 sampledTextureValue14 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue15 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue47 = (fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[48u].x) * (sampledTextureValue15.x + sampledTextureValue14.x);
    float productValue48 = (fragmentVectorConstants1.packedValues[28u].y * fragmentVectorConstants1.packedValues[48u].y) * (sampledTextureValue15.y + sampledTextureValue14.y);
    float productValue49 = (fragmentVectorConstants1.packedValues[28u].z * fragmentVectorConstants1.packedValues[48u].z) * (sampledTextureValue15.z + sampledTextureValue14.z);
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((comparisonValue27 & 1u) == 0u)
    {
        intermediateValue11 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[46u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[47u].x;
    }
    else
    {
        vec4 sampledTextureValue16 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue11 = sampledTextureValue16.x;
        intermediateValue12 = sampledTextureValue16.y;
        intermediateValue13 = sampledTextureValue16.z;
        intermediateValue14 = ((comparisonValue27 & 2u) != 0u) ? sampledTextureValue16.w : fragmentVectorConstants1.packedValues[47u].x;
    }
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if ((comparisonValue27 & 28u) == 0u)
    {
        intermediateValue15 = varyingNormal0.x;
        intermediateValue16 = varyingNormal0.y;
        intermediateValue17 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
        if ((comparisonValue27 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue27 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue27 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue17 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue18 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue50 = fract(float(int(uint(int(float(int(sampledTextureValue17.x)))))) * varyingTexCoord0.x);
                    float productValue51 = fract(float(int(uint(int(float(int(sampledTextureValue17.y)))))) * varyingTexCoord0.y);
                    float comparisonValue28 = (((productValue50 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue18.y * 2.0) + (-1.0))) - (((sampledTextureValue18.w * 2.0) + (-1.0)) * ((productValue50 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue29 = (((productValue51 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue18.z * 2.0) + (-1.0))) - (((productValue51 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue18.x * 2.0) + (-1.0)));
                    float comparisonValue30 = ((abs(comparisonValue28) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue28;
                    float comparisonValue31 = ((abs(comparisonValue29) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue29;
                    float inverseLengthValue9 = inversesqrt(dot(vec3(comparisonValue30, comparisonValue31, 0.25), vec3(comparisonValue30, comparisonValue31, 0.25)));
                    branchMergedValue3 = comparisonValue30 * inverseLengthValue9;
                    branchMergedValue4 = comparisonValue31 * inverseLengthValue9;
                    branchMergedValue5 = inverseLengthValue9 * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue19 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue52 = float(int(uint(int(float(int(sampledTextureValue19.x)))))) * varyingTexCoord0.x;
                float productValue53 = float(int(uint(int(float(int(sampledTextureValue19.y)))))) * varyingTexCoord0.y;
                float scalarValue24 = fract(productValue52);
                float scalarValue25 = fract(productValue53);
                float comparisonValue8;
                if (abs(scalarValue24 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue24 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.x;
                }
                float comparisonValue9;
                if (abs(scalarValue25 + (-0.5)) < 0.0625)
                {
                    comparisonValue9 = ((scalarValue25 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue9 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue20 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue8, comparisonValue9));
                float scalarValue26 = sampledTextureValue20.x;
                float scalarValue27 = sampledTextureValue20.y;
                float scalarValue28 = sampledTextureValue20.z;
                float scalarValue29 = sampledTextureValue20.w;
                float sumValue18 = fract(productValue52 + 0.5);
                float sumValue19 = fract(productValue53 + 0.5);
                bool conditionValue3 = sumValue19 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue3 ? scalarValue26 : scalarValue29;
                intermediateValue[1u] = conditionValue3 ? scalarValue27 : scalarValue28;
                float productValue54 = intermediateValue[uint(int(spvNClamp((sumValue18 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue55 = intermediateValue[uint(int(spvNClamp((sumValue18 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue20 = productValue54 - productValue55;
                bool conditionValue4 = sumValue18 > 0.5;
                intermediateValue[0u] = conditionValue4 ? scalarValue28 : scalarValue29;
                intermediateValue[1u] = conditionValue4 ? scalarValue27 : scalarValue26;
                float productValue56 = intermediateValue[uint(int(spvNClamp((sumValue19 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue19 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue20, productValue56, 0.25), vec3(sumValue20, productValue56, 0.25)));
                branchMergedValue = inverseLengthValue10 * sumValue20;
                branchMergedValue1 = inverseLengthValue10 * productValue56;
                branchMergedValue2 = inverseLengthValue10 * 0.25;
            }
            intermediateValue22 = branchMergedValue;
            intermediateValue23 = branchMergedValue1;
            intermediateValue24 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue27 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue27 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue17 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue18 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue50 = fract(float(int(uint(int(float(int(sampledTextureValue17.x)))))) * varyingTexCoord0.x);
                    float productValue51 = fract(float(int(uint(int(float(int(sampledTextureValue17.y)))))) * varyingTexCoord0.y);
                    float comparisonValue28 = (((productValue50 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue18.y * 2.0) + (-1.0))) - (((sampledTextureValue18.w * 2.0) + (-1.0)) * ((productValue50 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue29 = (((productValue51 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue18.z * 2.0) + (-1.0))) - (((productValue51 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue18.x * 2.0) + (-1.0)));
                    float comparisonValue30 = ((abs(comparisonValue28) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue28;
                    float comparisonValue31 = ((abs(comparisonValue29) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue29;
                    float inverseLengthValue9 = inversesqrt(dot(vec3(comparisonValue30, comparisonValue31, 0.25), vec3(comparisonValue30, comparisonValue31, 0.25)));
                    branchMergedValue3 = comparisonValue30 * inverseLengthValue9;
                    branchMergedValue4 = comparisonValue31 * inverseLengthValue9;
                    branchMergedValue5 = inverseLengthValue9 * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue19 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue52 = float(int(uint(int(float(int(sampledTextureValue19.x)))))) * varyingTexCoord0.x;
                float productValue53 = float(int(uint(int(float(int(sampledTextureValue19.y)))))) * varyingTexCoord0.y;
                float scalarValue24 = fract(productValue52);
                float scalarValue25 = fract(productValue53);
                float comparisonValue8;
                if (abs(scalarValue24 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue24 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.x;
                }
                float comparisonValue9;
                if (abs(scalarValue25 + (-0.5)) < 0.0625)
                {
                    comparisonValue9 = ((scalarValue25 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue9 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue20 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue8, comparisonValue9));
                float scalarValue26 = sampledTextureValue20.x;
                float scalarValue27 = sampledTextureValue20.y;
                float scalarValue28 = sampledTextureValue20.z;
                float scalarValue29 = sampledTextureValue20.w;
                float sumValue18 = fract(productValue52 + 0.5);
                float sumValue19 = fract(productValue53 + 0.5);
                bool conditionValue3 = sumValue19 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue3 ? scalarValue26 : scalarValue29;
                intermediateValue[1u] = conditionValue3 ? scalarValue27 : scalarValue28;
                float productValue54 = intermediateValue[uint(int(spvNClamp((sumValue18 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue55 = intermediateValue[uint(int(spvNClamp((sumValue18 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue20 = productValue54 - productValue55;
                bool conditionValue4 = sumValue18 > 0.5;
                intermediateValue[0u] = conditionValue4 ? scalarValue28 : scalarValue29;
                intermediateValue[1u] = conditionValue4 ? scalarValue27 : scalarValue26;
                float productValue56 = intermediateValue[uint(int(spvNClamp((sumValue19 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue19 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue20, productValue56, 0.25), vec3(sumValue20, productValue56, 0.25)));
                branchMergedValue = inverseLengthValue10 * sumValue20;
                branchMergedValue1 = inverseLengthValue10 * productValue56;
                branchMergedValue2 = inverseLengthValue10 * 0.25;
            }
            intermediateValue26 = branchMergedValue;
            intermediateValue27 = branchMergedValue1;
            intermediateValue28 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            uint sumValue24 = intermediateValue6 + 41u;
            uint sumValue25 = intermediateValue6 + 34u;
            vec4 sampledTextureValue25 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue24].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue24].x, (fragmentVectorConstants1.packedValues[sumValue24].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue24].y));
            float productValue98 = sampledTextureValue25.w * fragmentVectorConstants1.packedValues[sumValue25].w;
            productValue9 = (((sampledTextureValue25.x * fragmentVectorConstants1.packedValues[sumValue25].x) - intermediateValue8) * productValue98) + intermediateValue8;
            productValue10 = (((sampledTextureValue25.y * fragmentVectorConstants1.packedValues[sumValue25].y) - intermediateValue9) * productValue98) + intermediateValue9;
            productValue11 = (((sampledTextureValue25.z * fragmentVectorConstants1.packedValues[sumValue25].z) - intermediateValue10) * productValue98) + intermediateValue10;
            comparisonValue3 = ((intermediateValue7 != 0u) && (productValue98 > 0.5)) ? 0u : intermediateValue7;
            uint sumValue17 = intermediateValue6 + 1u;
            if (int(sumValue17) < int(uint(int(fragmentVectorConstants1.packedValues[4u].x))))
            {
                intermediateValue6 = sumValue17;
                intermediateValue7 = comparisonValue3;
                intermediateValue8 = productValue9;
                intermediateValue9 = productValue10;
                intermediateValue10 = productValue11;
            }
            else
            {
                break;
            }
        }
        comparisonValue1 = comparisonValue3 != 0u;
        intermediateValue3 = productValue9;
        intermediateValue4 = productValue10;
        intermediateValue5 = productValue11;
    }
    else
    {
        comparisonValue1 = true;
        intermediateValue3 = productValue95;
        intermediateValue4 = productValue96;
        intermediateValue5 = productValue97;
    }
    uint comparisonValue37 = comparisonValue1 ? scalarValue40 : (scalarValue40 & 4294967294u);
    float productValue99 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue3;
    float productValue100 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue4;
    float productValue101 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue5;
    vec4 sampledTextureValue14 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue15 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue102 = (fragmentVectorConstants1.packedValues[30u].x * fragmentVectorConstants1.packedValues[50u].x) * (sampledTextureValue15.x + sampledTextureValue14.x);
    float productValue103 = (fragmentVectorConstants1.packedValues[30u].y * fragmentVectorConstants1.packedValues[50u].y) * (sampledTextureValue15.y + sampledTextureValue14.y);
    float productValue104 = (fragmentVectorConstants1.packedValues[30u].z * fragmentVectorConstants1.packedValues[50u].z) * (sampledTextureValue15.z + sampledTextureValue14.z);
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((comparisonValue37 & 1u) == 0u)
    {
        intermediateValue11 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[48u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[49u].x;
    }
    else
    {
        vec4 sampledTextureValue16 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue11 = sampledTextureValue16.x;
        intermediateValue12 = sampledTextureValue16.y;
        intermediateValue13 = sampledTextureValue16.z;
        intermediateValue14 = ((comparisonValue37 & 2u) != 0u) ? sampledTextureValue16.w : fragmentVectorConstants1.packedValues[49u].x;
    }
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if ((comparisonValue37 & 28u) == 0u)
    {
        intermediateValue15 = varyingNormal0.x;
        intermediateValue16 = varyingNormal0.y;
        intermediateValue17 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
        if ((comparisonValue37 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue37 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue37 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue17 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue18 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue50 = fract(float(int(uint(int(float(int(sampledTextureValue17.x)))))) * varyingTexCoord0.x);
                    float productValue51 = fract(float(int(uint(int(float(int(sampledTextureValue17.y)))))) * varyingTexCoord0.y);
                    float comparisonValue28 = (((productValue50 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue18.y * 2.0) + (-1.0))) - (((sampledTextureValue18.w * 2.0) + (-1.0)) * ((productValue50 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue29 = (((productValue51 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue18.z * 2.0) + (-1.0))) - (((productValue51 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue18.x * 2.0) + (-1.0)));
                    float comparisonValue30 = ((abs(comparisonValue28) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue28;
                    float comparisonValue31 = ((abs(comparisonValue29) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue29;
                    float inverseLengthValue9 = inversesqrt(dot(vec3(comparisonValue30, comparisonValue31, 0.25), vec3(comparisonValue30, comparisonValue31, 0.25)));
                    branchMergedValue3 = comparisonValue30 * inverseLengthValue9;
                    branchMergedValue4 = comparisonValue31 * inverseLengthValue9;
                    branchMergedValue5 = inverseLengthValue9 * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue19 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue52 = float(int(uint(int(float(int(sampledTextureValue19.x)))))) * varyingTexCoord0.x;
                float productValue53 = float(int(uint(int(float(int(sampledTextureValue19.y)))))) * varyingTexCoord0.y;
                float scalarValue24 = fract(productValue52);
                float scalarValue25 = fract(productValue53);
                float comparisonValue8;
                if (abs(scalarValue24 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue24 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.x;
                }
                float comparisonValue9;
                if (abs(scalarValue25 + (-0.5)) < 0.0625)
                {
                    comparisonValue9 = ((scalarValue25 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue9 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue20 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue8, comparisonValue9));
                float scalarValue26 = sampledTextureValue20.x;
                float scalarValue27 = sampledTextureValue20.y;
                float scalarValue28 = sampledTextureValue20.z;
                float scalarValue29 = sampledTextureValue20.w;
                float sumValue18 = fract(productValue52 + 0.5);
                float sumValue19 = fract(productValue53 + 0.5);
                bool conditionValue3 = sumValue19 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue3 ? scalarValue26 : scalarValue29;
                intermediateValue[1u] = conditionValue3 ? scalarValue27 : scalarValue28;
                float productValue54 = intermediateValue[uint(int(spvNClamp((sumValue18 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue55 = intermediateValue[uint(int(spvNClamp((sumValue18 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue20 = productValue54 - productValue55;
                bool conditionValue4 = sumValue18 > 0.5;
                intermediateValue[0u] = conditionValue4 ? scalarValue28 : scalarValue29;
                intermediateValue[1u] = conditionValue4 ? scalarValue27 : scalarValue26;
                float productValue56 = intermediateValue[uint(int(spvNClamp((sumValue19 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue19 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue20, productValue56, 0.25), vec3(sumValue20, productValue56, 0.25)));
                branchMergedValue = inverseLengthValue10 * sumValue20;
                branchMergedValue1 = inverseLengthValue10 * productValue56;
                branchMergedValue2 = inverseLengthValue10 * 0.25;
            }
            intermediateValue22 = branchMergedValue;
            intermediateValue23 = branchMergedValue1;
            intermediateValue24 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue37 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue37 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue17 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue18 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue50 = fract(float(int(uint(int(float(int(sampledTextureValue17.x)))))) * varyingTexCoord0.x);
                    float productValue51 = fract(float(int(uint(int(float(int(sampledTextureValue17.y)))))) * varyingTexCoord0.y);
                    float comparisonValue28 = (((productValue50 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue18.y * 2.0) + (-1.0))) - (((sampledTextureValue18.w * 2.0) + (-1.0)) * ((productValue50 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue29 = (((productValue51 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue18.z * 2.0) + (-1.0))) - (((productValue51 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue18.x * 2.0) + (-1.0)));
                    float comparisonValue30 = ((abs(comparisonValue28) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue28;
                    float comparisonValue31 = ((abs(comparisonValue29) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue29;
                    float inverseLengthValue9 = inversesqrt(dot(vec3(comparisonValue30, comparisonValue31, 0.25), vec3(comparisonValue30, comparisonValue31, 0.25)));
                    branchMergedValue3 = comparisonValue30 * inverseLengthValue9;
                    branchMergedValue4 = comparisonValue31 * inverseLengthValue9;
                    branchMergedValue5 = inverseLengthValue9 * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue19 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue52 = float(int(uint(int(float(int(sampledTextureValue19.x)))))) * varyingTexCoord0.x;
                float productValue53 = float(int(uint(int(float(int(sampledTextureValue19.y)))))) * varyingTexCoord0.y;
                float scalarValue24 = fract(productValue52);
                float scalarValue25 = fract(productValue53);
                float comparisonValue8;
                if (abs(scalarValue24 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue24 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.x;
                }
                float comparisonValue9;
                if (abs(scalarValue25 + (-0.5)) < 0.0625)
                {
                    comparisonValue9 = ((scalarValue25 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue9 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue20 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue8, comparisonValue9));
                float scalarValue26 = sampledTextureValue20.x;
                float scalarValue27 = sampledTextureValue20.y;
                float scalarValue28 = sampledTextureValue20.z;
                float scalarValue29 = sampledTextureValue20.w;
                float sumValue18 = fract(productValue52 + 0.5);
                float sumValue19 = fract(productValue53 + 0.5);
                bool conditionValue3 = sumValue19 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue3 ? scalarValue26 : scalarValue29;
                intermediateValue[1u] = conditionValue3 ? scalarValue27 : scalarValue28;
                float productValue54 = intermediateValue[uint(int(spvNClamp((sumValue18 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue55 = intermediateValue[uint(int(spvNClamp((sumValue18 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue20 = productValue54 - productValue55;
                bool conditionValue4 = sumValue18 > 0.5;
                intermediateValue[0u] = conditionValue4 ? scalarValue28 : scalarValue29;
                intermediateValue[1u] = conditionValue4 ? scalarValue27 : scalarValue26;
                float productValue56 = intermediateValue[uint(int(spvNClamp((sumValue19 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue19 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue20, productValue56, 0.25), vec3(sumValue20, productValue56, 0.25)));
                branchMergedValue = inverseLengthValue10 * sumValue20;
                branchMergedValue1 = inverseLengthValue10 * productValue56;
                branchMergedValue2 = inverseLengthValue10 * 0.25;
            }
            intermediateValue26 = branchMergedValue;
            intermediateValue27 = branchMergedValue1;
            intermediateValue28 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            uint sumValue33 = intermediateValue7 + 42u;
            uint sumValue34 = intermediateValue7 + 35u;
            vec4 sampledTextureValue28 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue33].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue33].x, (fragmentVectorConstants1.packedValues[sumValue33].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue33].y));
            float productValue145 = sampledTextureValue28.w * fragmentVectorConstants1.packedValues[sumValue34].w;
            productValue10 = (((sampledTextureValue28.x * fragmentVectorConstants1.packedValues[sumValue34].x) - intermediateValue9) * productValue145) + intermediateValue9;
            productValue11 = (((sampledTextureValue28.y * fragmentVectorConstants1.packedValues[sumValue34].y) - intermediateValue10) * productValue145) + intermediateValue10;
            productValue12 = (((sampledTextureValue28.z * fragmentVectorConstants1.packedValues[sumValue34].z) - intermediateValue11) * productValue145) + intermediateValue11;
            comparisonValue3 = ((intermediateValue8 != 0u) && (productValue145 > 0.5)) ? 0u : intermediateValue8;
            uint sumValue35 = intermediateValue7 + 1u;
            if (int(sumValue35) < int(uint(int(fragmentVectorConstants1.packedValues[4u].x))))
            {
                intermediateValue7 = sumValue35;
                intermediateValue8 = comparisonValue3;
                intermediateValue9 = productValue10;
                intermediateValue10 = productValue11;
                intermediateValue11 = productValue12;
            }
            else
            {
                break;
            }
        }
        comparisonValue1 = comparisonValue3 != 0u;
        intermediateValue4 = productValue10;
        intermediateValue5 = productValue11;
        intermediateValue6 = productValue12;
    }
    else
    {
        comparisonValue1 = true;
        intermediateValue4 = productValue142;
        intermediateValue5 = productValue143;
        intermediateValue6 = productValue144;
    }
    uint comparisonValue37 = comparisonValue1 ? scalarValue40 : (scalarValue40 & 4294967294u);
    float productValue146 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue4;
    float productValue147 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue5;
    float productValue148 = ((fragmentVectorConstants1.packedValues[23u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue6;
    vec4 sampledTextureValue14 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue15 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue149 = (fragmentVectorConstants1.packedValues[30u].x * fragmentVectorConstants1.packedValues[51u].x) * (sampledTextureValue15.x + sampledTextureValue14.x);
    float productValue150 = (fragmentVectorConstants1.packedValues[30u].y * fragmentVectorConstants1.packedValues[51u].y) * (sampledTextureValue15.y + sampledTextureValue14.y);
    float productValue151 = (fragmentVectorConstants1.packedValues[30u].z * fragmentVectorConstants1.packedValues[51u].z) * (sampledTextureValue15.z + sampledTextureValue14.z);
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if ((comparisonValue37 & 1u) == 0u)
    {
        intermediateValue12 = fragmentVectorConstants1.packedValues[34u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[49u].x;
        intermediateValue15 = fragmentVectorConstants1.packedValues[50u].x;
    }
    else
    {
        vec4 sampledTextureValue16 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue12 = sampledTextureValue16.x;
        intermediateValue13 = sampledTextureValue16.y;
        intermediateValue14 = sampledTextureValue16.z;
        intermediateValue15 = ((comparisonValue37 & 2u) != 0u) ? sampledTextureValue16.w : fragmentVectorConstants1.packedValues[50u].x;
    }
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if ((comparisonValue37 & 28u) == 0u)
    {
        intermediateValue16 = varyingNormal0.x;
        intermediateValue17 = varyingNormal0.y;
        intermediateValue18 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue23;
        float intermediateValue24;
        float intermediateValue25;
        if ((comparisonValue37 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue37 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue37 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue17 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue18 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue50 = fract(float(int(uint(int(float(int(sampledTextureValue17.x)))))) * varyingTexCoord0.x);
                    float productValue51 = fract(float(int(uint(int(float(int(sampledTextureValue17.y)))))) * varyingTexCoord0.y);
                    float comparisonValue28 = (((productValue50 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue18.y * 2.0) + (-1.0))) - (((sampledTextureValue18.w * 2.0) + (-1.0)) * ((productValue50 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue29 = (((productValue51 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue18.z * 2.0) + (-1.0))) - (((productValue51 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue18.x * 2.0) + (-1.0)));
                    float comparisonValue30 = ((abs(comparisonValue28) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue28;
                    float comparisonValue31 = ((abs(comparisonValue29) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue29;
                    float inverseLengthValue9 = inversesqrt(dot(vec3(comparisonValue30, comparisonValue31, 0.25), vec3(comparisonValue30, comparisonValue31, 0.25)));
                    branchMergedValue3 = comparisonValue30 * inverseLengthValue9;
                    branchMergedValue4 = comparisonValue31 * inverseLengthValue9;
                    branchMergedValue5 = inverseLengthValue9 * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue19 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue52 = float(int(uint(int(float(int(sampledTextureValue19.x)))))) * varyingTexCoord0.x;
                float productValue53 = float(int(uint(int(float(int(sampledTextureValue19.y)))))) * varyingTexCoord0.y;
                float scalarValue24 = fract(productValue52);
                float scalarValue25 = fract(productValue53);
                float comparisonValue8;
                if (abs(scalarValue24 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue24 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.x;
                }
                float comparisonValue9;
                if (abs(scalarValue25 + (-0.5)) < 0.0625)
                {
                    comparisonValue9 = ((scalarValue25 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue9 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue20 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue8, comparisonValue9));
                float scalarValue26 = sampledTextureValue20.x;
                float scalarValue27 = sampledTextureValue20.y;
                float scalarValue28 = sampledTextureValue20.z;
                float scalarValue29 = sampledTextureValue20.w;
                float sumValue18 = fract(productValue52 + 0.5);
                float sumValue19 = fract(productValue53 + 0.5);
                bool conditionValue3 = sumValue19 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue3 ? scalarValue26 : scalarValue29;
                intermediateValue[1u] = conditionValue3 ? scalarValue27 : scalarValue28;
                float productValue54 = intermediateValue[uint(int(spvNClamp((sumValue18 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue55 = intermediateValue[uint(int(spvNClamp((sumValue18 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue20 = productValue54 - productValue55;
                bool conditionValue4 = sumValue18 > 0.5;
                intermediateValue[0u] = conditionValue4 ? scalarValue28 : scalarValue29;
                intermediateValue[1u] = conditionValue4 ? scalarValue27 : scalarValue26;
                float productValue56 = intermediateValue[uint(int(spvNClamp((sumValue19 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue19 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue20, productValue56, 0.25), vec3(sumValue20, productValue56, 0.25)));
                branchMergedValue = inverseLengthValue10 * sumValue20;
                branchMergedValue1 = inverseLengthValue10 * productValue56;
                branchMergedValue2 = inverseLengthValue10 * 0.25;
            }
            intermediateValue23 = branchMergedValue;
            intermediateValue24 = branchMergedValue1;
            intermediateValue25 = branchMergedValue2;
#endif
        }
        else
        {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue18;
            float productValue19;
            float productValue20;
            bool intermediateValue37;
            if (comparisonValue7)
            {
                bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue9 = sampledTextureValue7.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue6 ? scalarValue9 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                float productValue3 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue14 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue8 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue3 - 0.5) < 0.0625) ? (((productValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue14 - 0.5) < 0.0625) ? (((productValue14 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue10 = sampledTextureValue8.x;
                float scalarValue11 = sampledTextureValue8.y;
                float scalarValue12 = sampledTextureValue8.z;
                float scalarValue13 = sampledTextureValue8.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue = multiplyAddValue32 > 0.5;
                bool conditionValue1 = multiplyAddValue31 > 0.5;
                float comparisonValue12 = conditionValue ? scalarValue10 : scalarValue13;
                float comparisonValue13 = conditionValue ? scalarValue11 : scalarValue12;
                float comparisonValue14 = conditionValue1 ? scalarValue12 : scalarValue13;
                float comparisonValue15 = conditionValue1 ? scalarValue11 : scalarValue10;
                float sumValue3 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue4 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue5 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue6 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                uint sumValue9 = uint(int(spvNClamp(sumValue5 + sumValue5, 0.0, 1.0)));
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue7 == 1u) ? comparisonValue13 : ((sumValue7 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue13 : ((sumValue8 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue9 == 1u) ? comparisonValue15 : ((sumValue9 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue14 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue1 = inversesqrt(scalarValue14);
                intermediateValue37 = true;
                productValue20 = inverseLengthValue1 * comparisonValue18;
                productValue19 = inverseLengthValue1 * comparisonValue19;
                productValue18 = inverseLengthValue1 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue23;
                if (comparisonValue4)
                {
                    bool sampledTextureValue9 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue10 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue15 = sampledTextureValue10.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue9 ? scalarValue15 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue9 ? sampledTextureValue10.y : 0u);
                    vec4 sampledTextureValue11 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue15 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue29 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue33 = (productValue15 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (productValue29 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue35 = (productValue15 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.y, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    float multiplyAddValue36 = (productValue29 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.z, 2.0, -1.0) + multiplyAddValue34) : multiplyAddValue34;
                    bool comparisonValue22 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue36) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue35 : 0.0, comparisonValue23 ? multiplyAddValue36 : 0.0, 0.25);
                    float scalarValue16 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue2 = inversesqrt(scalarValue16);
                    comparisonValue16 = comparisonValue22 ? (inverseLengthValue2 * multiplyAddValue35) : 0.0;
                    comparisonValue17 = comparisonValue23 ? (inverseLengthValue2 * multiplyAddValue36) : 0.0;
                    productValue23 = inverseLengthValue2 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue20;
                    comparisonValue17 = intermediateValue22;
                    productValue23 = intermediateValue23;
                }
                intermediateValue37 = comparisonValue4;
                productValue20 = comparisonValue16;
                productValue19 = comparisonValue17;
                productValue18 = productValue23;
            }
            multiplyAddValue18 = productValue18;
            multiplyAddValue19 = productValue19;
            multiplyAddValue20 = productValue20;
            intermediateValue36 = intermediateValue37;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue41;
            if (comparisonValue35)
            {
                bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue9 = sampledTextureValue7.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue6 ? scalarValue9 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                float productValue3 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue14 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue8 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue3 - 0.5) < 0.0625) ? (((productValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue14 - 0.5) < 0.0625) ? (((productValue14 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue10 = sampledTextureValue8.x;
                float scalarValue11 = sampledTextureValue8.y;
                float scalarValue12 = sampledTextureValue8.z;
                float scalarValue13 = sampledTextureValue8.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue = multiplyAddValue32 > 0.5;
                bool conditionValue1 = multiplyAddValue31 > 0.5;
                float comparisonValue12 = conditionValue ? scalarValue10 : scalarValue13;
                float comparisonValue13 = conditionValue ? scalarValue11 : scalarValue12;
                float comparisonValue14 = conditionValue1 ? scalarValue12 : scalarValue13;
                float comparisonValue15 = conditionValue1 ? scalarValue11 : scalarValue10;
                float sumValue3 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue4 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue5 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue6 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                uint sumValue9 = uint(int(spvNClamp(sumValue5 + sumValue5, 0.0, 1.0)));
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue7 == 1u) ? comparisonValue13 : ((sumValue7 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue13 : ((sumValue8 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue9 == 1u) ? comparisonValue15 : ((sumValue9 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue14 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue1 = inversesqrt(scalarValue14);
                intermediateValue41 = true;
                productValue18 = inverseLengthValue1 * comparisonValue18;
                productValue17 = inverseLengthValue1 * comparisonValue19;
                productValue16 = inverseLengthValue1 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue21;
                if (comparisonValue33)
                {
                    bool sampledTextureValue9 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue10 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue15 = sampledTextureValue10.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue9 ? scalarValue15 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue9 ? sampledTextureValue10.y : 0u);
                    vec4 sampledTextureValue11 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue15 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue29 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue33 = (productValue15 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (productValue29 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue35 = (productValue15 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.y, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    float multiplyAddValue36 = (productValue29 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.z, 2.0, -1.0) + multiplyAddValue34) : multiplyAddValue34;
                    bool comparisonValue22 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue36) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue35 : 0.0, comparisonValue23 ? multiplyAddValue36 : 0.0, 0.25);
                    float scalarValue16 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue2 = inversesqrt(scalarValue16);
                    comparisonValue16 = comparisonValue22 ? (inverseLengthValue2 * multiplyAddValue35) : 0.0;
                    comparisonValue17 = comparisonValue23 ? (inverseLengthValue2 * multiplyAddValue36) : 0.0;
                    productValue21 = inverseLengthValue2 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue24;
                    comparisonValue17 = intermediateValue26;
                    productValue21 = intermediateValue27;
                }
                intermediateValue41 = comparisonValue33;
                productValue18 = comparisonValue16;
                productValue17 = comparisonValue17;
                productValue16 = productValue21;
            }
            multiplyAddValue21 = productValue16;
            multiplyAddValue22 = productValue17;
            multiplyAddValue23 = productValue18;
            intermediateValue40 = intermediateValue41;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue21;
            float productValue22;
            float productValue23;
            bool intermediateValue36;
            if (comparisonValue41)
            {
                bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue9 = sampledTextureValue7.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue6 ? scalarValue9 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                float productValue3 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue14 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue8 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue3 - 0.5) < 0.0625) ? (((productValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue14 - 0.5) < 0.0625) ? (((productValue14 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue10 = sampledTextureValue8.x;
                float scalarValue11 = sampledTextureValue8.y;
                float scalarValue12 = sampledTextureValue8.z;
                float scalarValue13 = sampledTextureValue8.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue = multiplyAddValue32 > 0.5;
                bool conditionValue1 = multiplyAddValue31 > 0.5;
                float comparisonValue12 = conditionValue ? scalarValue10 : scalarValue13;
                float comparisonValue13 = conditionValue ? scalarValue11 : scalarValue12;
                float comparisonValue14 = conditionValue1 ? scalarValue12 : scalarValue13;
                float comparisonValue15 = conditionValue1 ? scalarValue11 : scalarValue10;
                float sumValue3 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue4 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue5 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue6 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                uint sumValue9 = uint(int(spvNClamp(sumValue5 + sumValue5, 0.0, 1.0)));
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue7 == 1u) ? comparisonValue13 : ((sumValue7 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue13 : ((sumValue8 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue9 == 1u) ? comparisonValue15 : ((sumValue9 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue14 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue1 = inversesqrt(scalarValue14);
                intermediateValue36 = true;
                productValue23 = inverseLengthValue1 * comparisonValue18;
                productValue22 = inverseLengthValue1 * comparisonValue19;
                productValue21 = inverseLengthValue1 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue26;
                if (comparisonValue39)
                {
                    bool sampledTextureValue9 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue10 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue15 = sampledTextureValue10.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue9 ? scalarValue15 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue9 ? sampledTextureValue10.y : 0u);
                    vec4 sampledTextureValue11 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue15 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue29 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue33 = (productValue15 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (productValue29 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue35 = (productValue15 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.y, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    float multiplyAddValue36 = (productValue29 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.z, 2.0, -1.0) + multiplyAddValue34) : multiplyAddValue34;
                    bool comparisonValue22 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue36) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue35 : 0.0, comparisonValue23 ? multiplyAddValue36 : 0.0, 0.25);
                    float scalarValue16 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue2 = inversesqrt(scalarValue16);
                    comparisonValue16 = comparisonValue22 ? (inverseLengthValue2 * multiplyAddValue35) : 0.0;
                    comparisonValue17 = comparisonValue23 ? (inverseLengthValue2 * multiplyAddValue36) : 0.0;
                    productValue26 = inverseLengthValue2 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue20;
                    comparisonValue17 = intermediateValue21;
                    productValue26 = intermediateValue22;
                }
                intermediateValue36 = comparisonValue39;
                productValue23 = comparisonValue16;
                productValue22 = comparisonValue17;
                productValue21 = productValue26;
            }
            multiplyAddValue21 = productValue21;
            multiplyAddValue22 = productValue22;
            multiplyAddValue23 = productValue23;
            intermediateValue35 = intermediateValue36;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue18;
            float productValue19;
            float productValue20;
            bool intermediateValue40;
            if (comparisonValue47)
            {
                bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue9 = sampledTextureValue7.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue6 ? scalarValue9 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                float productValue3 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue14 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue8 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue3 - 0.5) < 0.0625) ? (((productValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue14 - 0.5) < 0.0625) ? (((productValue14 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue10 = sampledTextureValue8.x;
                float scalarValue11 = sampledTextureValue8.y;
                float scalarValue12 = sampledTextureValue8.z;
                float scalarValue13 = sampledTextureValue8.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue = multiplyAddValue32 > 0.5;
                bool conditionValue1 = multiplyAddValue31 > 0.5;
                float comparisonValue12 = conditionValue ? scalarValue10 : scalarValue13;
                float comparisonValue13 = conditionValue ? scalarValue11 : scalarValue12;
                float comparisonValue14 = conditionValue1 ? scalarValue12 : scalarValue13;
                float comparisonValue15 = conditionValue1 ? scalarValue11 : scalarValue10;
                float sumValue3 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue4 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue5 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue6 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                uint sumValue9 = uint(int(spvNClamp(sumValue5 + sumValue5, 0.0, 1.0)));
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue7 == 1u) ? comparisonValue13 : ((sumValue7 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue13 : ((sumValue8 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue9 == 1u) ? comparisonValue15 : ((sumValue9 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue14 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue1 = inversesqrt(scalarValue14);
                intermediateValue40 = true;
                productValue20 = inverseLengthValue1 * comparisonValue18;
                productValue19 = inverseLengthValue1 * comparisonValue19;
                productValue18 = inverseLengthValue1 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue23;
                if (comparisonValue45)
                {
                    bool sampledTextureValue9 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue10 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue15 = sampledTextureValue10.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue9 ? scalarValue15 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue9 ? sampledTextureValue10.y : 0u);
                    vec4 sampledTextureValue11 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue15 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue29 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue33 = (productValue15 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (productValue29 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue35 = (productValue15 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.y, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    float multiplyAddValue36 = (productValue29 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.z, 2.0, -1.0) + multiplyAddValue34) : multiplyAddValue34;
                    bool comparisonValue22 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue36) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue35 : 0.0, comparisonValue23 ? multiplyAddValue36 : 0.0, 0.25);
                    float scalarValue16 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue2 = inversesqrt(scalarValue16);
                    comparisonValue16 = comparisonValue22 ? (inverseLengthValue2 * multiplyAddValue35) : 0.0;
                    comparisonValue17 = comparisonValue23 ? (inverseLengthValue2 * multiplyAddValue36) : 0.0;
                    productValue23 = inverseLengthValue2 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue24;
                    comparisonValue17 = intermediateValue25;
                    productValue23 = intermediateValue26;
                }
                intermediateValue40 = comparisonValue45;
                productValue20 = comparisonValue16;
                productValue19 = comparisonValue17;
                productValue18 = productValue23;
            }
            multiplyAddValue25 = productValue18;
            multiplyAddValue26 = productValue19;
            multiplyAddValue27 = productValue20;
            intermediateValue39 = intermediateValue40;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue20;
            float productValue21;
            float productValue22;
            bool intermediateValue38;
            if (comparisonValue52)
            {
                bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue9 = sampledTextureValue7.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue6 ? scalarValue9 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                float productValue3 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue14 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue8 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue3 - 0.5) < 0.0625) ? (((productValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue14 - 0.5) < 0.0625) ? (((productValue14 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue10 = sampledTextureValue8.x;
                float scalarValue11 = sampledTextureValue8.y;
                float scalarValue12 = sampledTextureValue8.z;
                float scalarValue13 = sampledTextureValue8.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue = multiplyAddValue32 > 0.5;
                bool conditionValue1 = multiplyAddValue31 > 0.5;
                float comparisonValue12 = conditionValue ? scalarValue10 : scalarValue13;
                float comparisonValue13 = conditionValue ? scalarValue11 : scalarValue12;
                float comparisonValue14 = conditionValue1 ? scalarValue12 : scalarValue13;
                float comparisonValue15 = conditionValue1 ? scalarValue11 : scalarValue10;
                float sumValue3 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue4 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue5 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue6 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                uint sumValue9 = uint(int(spvNClamp(sumValue5 + sumValue5, 0.0, 1.0)));
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue7 == 1u) ? comparisonValue13 : ((sumValue7 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue13 : ((sumValue8 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue9 == 1u) ? comparisonValue15 : ((sumValue9 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue14 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue1 = inversesqrt(scalarValue14);
                intermediateValue38 = true;
                productValue22 = inverseLengthValue1 * comparisonValue18;
                productValue21 = inverseLengthValue1 * comparisonValue19;
                productValue20 = inverseLengthValue1 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue25;
                if (comparisonValue50)
                {
                    bool sampledTextureValue9 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue10 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue15 = sampledTextureValue10.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue9 ? scalarValue15 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue9 ? sampledTextureValue10.y : 0u);
                    vec4 sampledTextureValue11 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue15 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue29 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue33 = (productValue15 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (productValue29 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue35 = (productValue15 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.y, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    float multiplyAddValue36 = (productValue29 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.z, 2.0, -1.0) + multiplyAddValue34) : multiplyAddValue34;
                    bool comparisonValue22 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue36) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue35 : 0.0, comparisonValue23 ? multiplyAddValue36 : 0.0, 0.25);
                    float scalarValue16 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue2 = inversesqrt(scalarValue16);
                    comparisonValue16 = comparisonValue22 ? (inverseLengthValue2 * multiplyAddValue35) : 0.0;
                    comparisonValue17 = comparisonValue23 ? (inverseLengthValue2 * multiplyAddValue36) : 0.0;
                    productValue25 = inverseLengthValue2 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue21;
                    comparisonValue17 = intermediateValue23;
                    productValue25 = intermediateValue24;
                }
                intermediateValue38 = comparisonValue50;
                productValue22 = comparisonValue16;
                productValue21 = comparisonValue17;
                productValue20 = productValue25;
            }
            multiplyAddValue21 = productValue20;
            multiplyAddValue22 = productValue21;
            multiplyAddValue23 = productValue22;
            intermediateValue37 = intermediateValue38;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue19;
            float productValue20;
            float productValue21;
            bool intermediateValue41;
            if (comparisonValue57)
            {
                bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue9 = sampledTextureValue7.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue6 ? scalarValue9 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                float productValue3 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue14 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue8 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue3 - 0.5) < 0.0625) ? (((productValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue14 - 0.5) < 0.0625) ? (((productValue14 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue10 = sampledTextureValue8.x;
                float scalarValue11 = sampledTextureValue8.y;
                float scalarValue12 = sampledTextureValue8.z;
                float scalarValue13 = sampledTextureValue8.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue = multiplyAddValue32 > 0.5;
                bool conditionValue1 = multiplyAddValue31 > 0.5;
                float comparisonValue12 = conditionValue ? scalarValue10 : scalarValue13;
                float comparisonValue13 = conditionValue ? scalarValue11 : scalarValue12;
                float comparisonValue14 = conditionValue1 ? scalarValue12 : scalarValue13;
                float comparisonValue15 = conditionValue1 ? scalarValue11 : scalarValue10;
                float sumValue3 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue4 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue5 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue6 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                uint sumValue9 = uint(int(spvNClamp(sumValue5 + sumValue5, 0.0, 1.0)));
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue7 == 1u) ? comparisonValue13 : ((sumValue7 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue13 : ((sumValue8 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue9 == 1u) ? comparisonValue15 : ((sumValue9 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue14 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue1 = inversesqrt(scalarValue14);
                intermediateValue41 = true;
                productValue21 = inverseLengthValue1 * comparisonValue18;
                productValue20 = inverseLengthValue1 * comparisonValue19;
                productValue19 = inverseLengthValue1 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue24;
                if (comparisonValue55)
                {
                    bool sampledTextureValue9 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue10 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue15 = sampledTextureValue10.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue9 ? scalarValue15 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue9 ? sampledTextureValue10.y : 0u);
                    vec4 sampledTextureValue11 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue15 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue29 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue33 = (productValue15 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (productValue29 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue11.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue35 = (productValue15 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.y, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    float multiplyAddValue36 = (productValue29 >= 0.916666686534881591796875) ? (fma(sampledTextureValue11.z, 2.0, -1.0) + multiplyAddValue34) : multiplyAddValue34;
                    bool comparisonValue22 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue36) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue35 : 0.0, comparisonValue23 ? multiplyAddValue36 : 0.0, 0.25);
                    float scalarValue16 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue2 = inversesqrt(scalarValue16);
                    comparisonValue16 = comparisonValue22 ? (inverseLengthValue2 * multiplyAddValue35) : 0.0;
                    comparisonValue17 = comparisonValue23 ? (inverseLengthValue2 * multiplyAddValue36) : 0.0;
                    productValue24 = inverseLengthValue2 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue24;
                    comparisonValue17 = intermediateValue26;
                    productValue24 = intermediateValue27;
                }
                intermediateValue41 = comparisonValue55;
                productValue21 = comparisonValue16;
                productValue20 = comparisonValue17;
                productValue19 = productValue24;
            }
            multiplyAddValue23 = productValue19;
            multiplyAddValue24 = productValue20;
            multiplyAddValue25 = productValue21;
            intermediateValue40 = intermediateValue41;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue21 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue22 = (sampledTextureValue21.x * 2.0) + (-1.0);
            intermediateValue23 = (sampledTextureValue21.y * 2.0) + (-1.0);
            intermediateValue24 = (sampledTextureValue21.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue21 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue26 = (sampledTextureValue21.x * 2.0) + (-1.0);
            intermediateValue27 = (sampledTextureValue21.y * 2.0) + (-1.0);
            intermediateValue28 = (sampledTextureValue21.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue21 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue23 = (sampledTextureValue21.x * 2.0) + (-1.0);
            intermediateValue24 = (sampledTextureValue21.y * 2.0) + (-1.0);
            intermediateValue25 = (sampledTextureValue21.z * 2.0) + (-1.0);
#endif
        }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue25 = intermediateValue36 ? multiplyAddValue18 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue17 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue3 = inversesqrt(scalarValue17);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue18);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue19 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue19);
        float multiplyAddValue37 = fma(inverseLengthValue5 * varyingNormal0.x, comparisonValue25, intermediateValue36 ? fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue20, intermediateValue36 ? ((inverseLengthValue4 * varyingBitangent0.x) * multiplyAddValue19) : 0.0) : 0.0);
        float multiplyAddValue38 = fma(inverseLengthValue5 * varyingNormal0.y, comparisonValue25, intermediateValue36 ? fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue20, intermediateValue36 ? ((inverseLengthValue4 * varyingBitangent0.y) * multiplyAddValue19) : 0.0) : 0.0);
        float multiplyAddValue39 = fma(inverseLengthValue5 * varyingNormal0.z, comparisonValue25, intermediateValue36 ? fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue20, intermediateValue36 ? ((inverseLengthValue4 * varyingBitangent0.z) * multiplyAddValue19) : 0.0) : 0.0);
        vec3 vectorValue5 = vec3(multiplyAddValue37, multiplyAddValue38, multiplyAddValue39);
        float scalarValue20 = rdDot3Precise(vectorValue5, vectorValue5);
        float inverseLengthValue6 = inversesqrt(scalarValue20);
        productValue7 = inverseLengthValue6 * multiplyAddValue39;
        productValue8 = inverseLengthValue6 * multiplyAddValue38;
        productValue9 = inverseLengthValue6 * multiplyAddValue37;
    }
    else
    {
        productValue7 = varyingNormal0.z;
        productValue8 = varyingNormal0.y;
        productValue9 = varyingNormal0.x;
    }
    float sumValue11 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue12 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue13 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue30) ? fma(intermediateValue30, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue9, productValue8, productValue7);
    float scalarValue21 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue7 = inversesqrt(scalarValue21);
    float productValue30 = inverseLengthValue7 * productValue9;
    float productValue31 = inverseLengthValue7 * productValue8;
    float productValue32 = inverseLengthValue7 * productValue7;
    float quotientValue1 = 1.0 / (abs(productValue32) + (abs(productValue31) + abs(productValue30)));
    float productValue33 = quotientValue1 * productValue30;
    float productValue34 = quotientValue1 * productValue31;
    bool conditionValue2 = productValue32 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue2 ? (((productValue33 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue34))) : productValue33;
    fragmentColor2.y = conditionValue2 ? (((productValue34 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue33))) : productValue34;
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[51u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[43u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[47u])) + fragmentScalarConstants1.packedValues[55u];
    float multiplyAddValue41 = fma(fragmentScalarConstants1.packedValues[71u], sumValue13, fma(fragmentScalarConstants1.packedValues[63u], sumValue11, sumValue12 * fragmentScalarConstants1.packedValues[67u])) + fragmentScalarConstants1.packedValues[75u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[11u].x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue40, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue13, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue11, sumValue12 * fragmentVectorConstants1.packedValues[16u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue41, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[11u].y)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue40, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue13, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue11, sumValue12 * fragmentVectorConstants1.packedValues[16u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue41, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[77u] + fragmentScalarConstants1.packedValues[76u]) + fragmentScalarConstants1.packedValues[78u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[116u] > 9.9999997473787516355514526367188e-05);
    float productValue35 = fragmentScalarConstants1.packedValues[116u] * fragmentScalarConstants1.packedValues[116u];
    float comparisonValue26 = (bitwiseValue1 ? spvNMin(productValue35, 1.0) : fragmentVectorConstants1.packedValues[19u].x) * 0.16666667163372039794921875;
    float multiplyAddValue42 = (bitwiseValue1 ? spvNMin(fma(fma(productValue35, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue35, 1.0) : fragmentVectorConstants1.packedValues[19u].y) * 0.16666667163372039794921875;
    float multiplyAddValue43 = (bitwiseValue1 ? spvNMin(fma(productValue35 * productValue35, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue35, 1.0) : fragmentVectorConstants1.packedValues[19u].z) * 0.16666667163372039794921875;
    float productValue36 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue42, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue43, comparisonValue26)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue42 / productValue36, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue26 / productValue36, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue43 / productValue36, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue36, 0.0, 1.0) * 255.0);
    uint productValue37 = uint(floor(fragmentScalarConstants1.packedValues[79u] * 255.0));
    fragmentColor0.w = (((productValue37 & 2u) != 0u) ? 512u : 0u) + ((((productValue37 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[117u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue32, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue31, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue36 = intermediateValue40 ? multiplyAddValue21 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue17 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue3 = inversesqrt(scalarValue17);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue18);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue19 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue19);
        float multiplyAddValue49 = fma(inverseLengthValue5 * varyingNormal0.x, comparisonValue36, intermediateValue40 ? fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue23, intermediateValue40 ? ((inverseLengthValue4 * varyingBitangent0.x) * multiplyAddValue22) : 0.0) : 0.0);
        float multiplyAddValue50 = fma(inverseLengthValue5 * varyingNormal0.y, comparisonValue36, intermediateValue40 ? fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue23, intermediateValue40 ? ((inverseLengthValue4 * varyingBitangent0.y) * multiplyAddValue22) : 0.0) : 0.0);
        float multiplyAddValue51 = fma(inverseLengthValue5 * varyingNormal0.z, comparisonValue36, intermediateValue40 ? fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue23, intermediateValue40 ? ((inverseLengthValue4 * varyingBitangent0.z) * multiplyAddValue22) : 0.0) : 0.0);
        vec3 vectorValue7 = vec3(multiplyAddValue49, multiplyAddValue50, multiplyAddValue51);
        float scalarValue34 = rdDot3Precise(vectorValue7, vectorValue7);
        float inverseLengthValue16 = inversesqrt(scalarValue34);
        productValue5 = inverseLengthValue16 * multiplyAddValue51;
        productValue6 = inverseLengthValue16 * multiplyAddValue50;
        productValue7 = inverseLengthValue16 * multiplyAddValue49;
    }
    else
    {
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
    }
    float sumValue11 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue12 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue13 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue34) ? fma(intermediateValue34, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue8 = vec3(productValue7, productValue6, productValue5);
    float scalarValue35 = rdDot3Precise(vectorValue8, vectorValue8);
    float inverseLengthValue17 = inversesqrt(scalarValue35);
    float productValue68 = inverseLengthValue17 * productValue7;
    float productValue69 = inverseLengthValue17 * productValue6;
    float productValue70 = inverseLengthValue17 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue70) + (abs(productValue69) + abs(productValue68)));
    float productValue71 = quotientValue5 * productValue68;
    float productValue72 = quotientValue5 * productValue69;
    bool conditionValue6 = productValue70 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue6 ? (((productValue71 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue72))) : productValue71;
    fragmentColor2.y = conditionValue6 ? (((productValue72 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue71))) : productValue72;
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[51u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[43u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[47u])) + fragmentScalarConstants1.packedValues[55u];
    float multiplyAddValue41 = fma(fragmentScalarConstants1.packedValues[71u], sumValue13, fma(fragmentScalarConstants1.packedValues[63u], sumValue11, sumValue12 * fragmentScalarConstants1.packedValues[67u])) + fragmentScalarConstants1.packedValues[75u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[11u].x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue40, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue13, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue11, sumValue12 * fragmentVectorConstants1.packedValues[16u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue41, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[11u].y)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue40, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue13, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue11, sumValue12 * fragmentVectorConstants1.packedValues[16u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue41, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[77u] + fragmentScalarConstants1.packedValues[76u]) + fragmentScalarConstants1.packedValues[78u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[116u] > 9.9999997473787516355514526367188e-05);
    float productValue35 = fragmentScalarConstants1.packedValues[116u] * fragmentScalarConstants1.packedValues[116u];
    float comparisonValue26 = (bitwiseValue1 ? spvNMin(productValue35, 1.0) : fragmentVectorConstants1.packedValues[19u].x) * 0.16666667163372039794921875;
    float multiplyAddValue42 = (bitwiseValue1 ? spvNMin(fma(fma(productValue35, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue35, 1.0) : fragmentVectorConstants1.packedValues[19u].y) * 0.16666667163372039794921875;
    float multiplyAddValue43 = (bitwiseValue1 ? spvNMin(fma(productValue35 * productValue35, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue35, 1.0) : fragmentVectorConstants1.packedValues[19u].z) * 0.16666667163372039794921875;
    float productValue36 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue42, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue43, comparisonValue26)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue42 / productValue36, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue26 / productValue36, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue43 / productValue36, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue36, 0.0, 1.0) * 255.0);
    uint productValue37 = uint(floor(fragmentScalarConstants1.packedValues[79u] * 255.0));
    fragmentColor0.w = (((productValue37 & 2u) != 0u) ? 512u : 0u) + ((((productValue37 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[117u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue36, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue35, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue42 = intermediateValue35 ? multiplyAddValue21 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue17 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue3 = inversesqrt(scalarValue17);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue18);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue19 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue19);
        float multiplyAddValue65 = fma(inverseLengthValue5 * varyingNormal0.x, comparisonValue42, intermediateValue35 ? fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue23, intermediateValue35 ? ((inverseLengthValue4 * varyingBitangent0.x) * multiplyAddValue22) : 0.0) : 0.0);
        float multiplyAddValue66 = fma(inverseLengthValue5 * varyingNormal0.y, comparisonValue42, intermediateValue35 ? fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue23, intermediateValue35 ? ((inverseLengthValue4 * varyingBitangent0.y) * multiplyAddValue22) : 0.0) : 0.0);
        float multiplyAddValue67 = fma(inverseLengthValue5 * varyingNormal0.z, comparisonValue42, intermediateValue35 ? fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue23, intermediateValue35 ? ((inverseLengthValue4 * varyingBitangent0.z) * multiplyAddValue22) : 0.0) : 0.0);
        vec3 vectorValue9 = vec3(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67);
        float scalarValue44 = rdDot3Precise(vectorValue9, vectorValue9);
        float inverseLengthValue21 = inversesqrt(scalarValue44);
        productValue10 = inverseLengthValue21 * multiplyAddValue67;
        productValue11 = inverseLengthValue21 * multiplyAddValue66;
        productValue12 = inverseLengthValue21 * multiplyAddValue65;
    }
    else
    {
        productValue10 = varyingNormal0.z;
        productValue11 = varyingNormal0.y;
        productValue12 = varyingNormal0.x;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[21u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[21u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[21u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue29) ? fma(intermediateValue29, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue10 = vec3(productValue12, productValue11, productValue10);
    float scalarValue45 = rdDot3Precise(vectorValue10, vectorValue10);
    float inverseLengthValue22 = inversesqrt(scalarValue45);
    float productValue131 = inverseLengthValue22 * productValue12;
    float productValue132 = inverseLengthValue22 * productValue11;
    float productValue133 = inverseLengthValue22 * productValue10;
    float quotientValue10 = 1.0 / (abs(productValue133) + (abs(productValue132) + abs(productValue131)));
    float productValue134 = quotientValue10 * productValue131;
    float productValue135 = quotientValue10 * productValue132;
    bool conditionValue8 = productValue133 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue134 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue135))) : productValue134;
    fragmentColor2.y = conditionValue8 ? (((productValue135 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue134))) : productValue135;
    float multiplyAddValue68 = fma(fragmentScalarConstants1.packedValues[55u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[47u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[51u])) + fragmentScalarConstants1.packedValues[59u];
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[75u], sumValue28, fma(fragmentScalarConstants1.packedValues[67u], sumValue26, sumValue27 * fragmentScalarConstants1.packedValues[71u])) + fragmentScalarConstants1.packedValues[79u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[12u].x)) + fragmentVectorConstants1.packedValues[14u].x) / multiplyAddValue68, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[18u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[17u].x)) + fragmentVectorConstants1.packedValues[19u].x) / multiplyAddValue69, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[12u].y)) + fragmentVectorConstants1.packedValues[14u].y) / multiplyAddValue68, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[18u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[17u].y)) + fragmentVectorConstants1.packedValues[19u].y) / multiplyAddValue69, 0.5, 0.5);
    bool bitwiseValue5 = (((fragmentScalarConstants1.packedValues[81u] + fragmentScalarConstants1.packedValues[80u]) + fragmentScalarConstants1.packedValues[82u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[124u] > 9.9999997473787516355514526367188e-05);
    float productValue136 = fragmentScalarConstants1.packedValues[124u] * fragmentScalarConstants1.packedValues[124u];
    float comparisonValue43 = (bitwiseValue5 ? spvNMin(productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].x) * 0.16666667163372039794921875;
    float multiplyAddValue70 = (bitwiseValue5 ? spvNMin(fma(fma(productValue136, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].y) * 0.16666667163372039794921875;
    float multiplyAddValue71 = (bitwiseValue5 ? spvNMin(fma(productValue136 * productValue136, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].z) * 0.16666667163372039794921875;
    float productValue137 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue70, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue71, comparisonValue43)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue70 / productValue137, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue43 / productValue137, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue71 / productValue137, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue137, 0.0, 1.0) * 255.0);
    uint productValue138 = uint(floor(fragmentScalarConstants1.packedValues[83u] * 255.0));
    fragmentColor0.w = (((productValue138 & 2u) != 0u) ? 512u : 0u) + ((((productValue138 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[125u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue31, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue30, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue48 = intermediateValue39 ? multiplyAddValue25 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue17 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue3 = inversesqrt(scalarValue17);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue18);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue19 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue19);
        float multiplyAddValue76 = fma(inverseLengthValue5 * varyingNormal0.x, comparisonValue48, intermediateValue39 ? fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue27, intermediateValue39 ? ((inverseLengthValue4 * varyingBitangent0.x) * multiplyAddValue26) : 0.0) : 0.0);
        float multiplyAddValue77 = fma(inverseLengthValue5 * varyingNormal0.y, comparisonValue48, intermediateValue39 ? fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue27, intermediateValue39 ? ((inverseLengthValue4 * varyingBitangent0.y) * multiplyAddValue26) : 0.0) : 0.0);
        float multiplyAddValue78 = fma(inverseLengthValue5 * varyingNormal0.z, comparisonValue48, intermediateValue39 ? fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue27, intermediateValue39 ? ((inverseLengthValue4 * varyingBitangent0.z) * multiplyAddValue26) : 0.0) : 0.0);
        vec3 vectorValue11 = vec3(multiplyAddValue76, multiplyAddValue77, multiplyAddValue78);
        float scalarValue46 = rdDot3Precise(vectorValue11, vectorValue11);
        float inverseLengthValue23 = inversesqrt(scalarValue46);
        productValue7 = inverseLengthValue23 * multiplyAddValue78;
        productValue8 = inverseLengthValue23 * multiplyAddValue77;
        productValue9 = inverseLengthValue23 * multiplyAddValue76;
    }
    else
    {
        productValue7 = varyingNormal0.z;
        productValue8 = varyingNormal0.y;
        productValue9 = varyingNormal0.x;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[21u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[21u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[21u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue33) ? fma(intermediateValue33, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue9, productValue8, productValue7);
    float scalarValue21 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue7 = inversesqrt(scalarValue21);
    float productValue30 = inverseLengthValue7 * productValue9;
    float productValue31 = inverseLengthValue7 * productValue8;
    float productValue32 = inverseLengthValue7 * productValue7;
    float quotientValue1 = 1.0 / (abs(productValue32) + (abs(productValue31) + abs(productValue30)));
    float productValue33 = quotientValue1 * productValue30;
    float productValue34 = quotientValue1 * productValue31;
    bool conditionValue2 = productValue32 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue2 ? (((productValue33 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue34))) : productValue33;
    fragmentColor2.y = conditionValue2 ? (((productValue34 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue33))) : productValue34;
    float multiplyAddValue68 = fma(fragmentScalarConstants1.packedValues[55u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[47u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[51u])) + fragmentScalarConstants1.packedValues[59u];
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[75u], sumValue28, fma(fragmentScalarConstants1.packedValues[67u], sumValue26, sumValue27 * fragmentScalarConstants1.packedValues[71u])) + fragmentScalarConstants1.packedValues[79u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[12u].x)) + fragmentVectorConstants1.packedValues[14u].x) / multiplyAddValue68, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[18u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[17u].x)) + fragmentVectorConstants1.packedValues[19u].x) / multiplyAddValue69, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[12u].y)) + fragmentVectorConstants1.packedValues[14u].y) / multiplyAddValue68, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[18u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[17u].y)) + fragmentVectorConstants1.packedValues[19u].y) / multiplyAddValue69, 0.5, 0.5);
    bool bitwiseValue5 = (((fragmentScalarConstants1.packedValues[81u] + fragmentScalarConstants1.packedValues[80u]) + fragmentScalarConstants1.packedValues[82u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[124u] > 9.9999997473787516355514526367188e-05);
    float productValue136 = fragmentScalarConstants1.packedValues[124u] * fragmentScalarConstants1.packedValues[124u];
    float comparisonValue43 = (bitwiseValue5 ? spvNMin(productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].x) * 0.16666667163372039794921875;
    float multiplyAddValue70 = (bitwiseValue5 ? spvNMin(fma(fma(productValue136, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].y) * 0.16666667163372039794921875;
    float multiplyAddValue71 = (bitwiseValue5 ? spvNMin(fma(productValue136 * productValue136, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].z) * 0.16666667163372039794921875;
    float productValue137 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue70, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue71, comparisonValue43)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue70 / productValue137, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue43 / productValue137, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue71 / productValue137, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue137, 0.0, 1.0) * 255.0);
    uint productValue138 = uint(floor(fragmentScalarConstants1.packedValues[83u] * 255.0));
    fragmentColor0.w = (((productValue138 & 2u) != 0u) ? 512u : 0u) + ((((productValue138 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[125u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue35, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue34, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue53 = intermediateValue37 ? multiplyAddValue21 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue17 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue3 = inversesqrt(scalarValue17);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue18);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue19 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue19);
        float multiplyAddValue85 = fma(inverseLengthValue5 * varyingNormal0.x, comparisonValue53, intermediateValue37 ? fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue23, intermediateValue37 ? ((inverseLengthValue4 * varyingBitangent0.x) * multiplyAddValue22) : 0.0) : 0.0);
        float multiplyAddValue86 = fma(inverseLengthValue5 * varyingNormal0.y, comparisonValue53, intermediateValue37 ? fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue23, intermediateValue37 ? ((inverseLengthValue4 * varyingBitangent0.y) * multiplyAddValue22) : 0.0) : 0.0);
        float multiplyAddValue87 = fma(inverseLengthValue5 * varyingNormal0.z, comparisonValue53, intermediateValue37 ? fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue23, intermediateValue37 ? ((inverseLengthValue4 * varyingBitangent0.z) * multiplyAddValue22) : 0.0) : 0.0);
        vec3 vectorValue12 = vec3(multiplyAddValue85, multiplyAddValue86, multiplyAddValue87);
        float scalarValue49 = rdDot3Precise(vectorValue12, vectorValue12);
        float inverseLengthValue27 = inversesqrt(scalarValue49);
        productValue9 = inverseLengthValue27 * multiplyAddValue87;
        productValue10 = inverseLengthValue27 * multiplyAddValue86;
        productValue11 = inverseLengthValue27 * multiplyAddValue85;
    }
    else
    {
        productValue9 = varyingNormal0.z;
        productValue10 = varyingNormal0.y;
        productValue11 = varyingNormal0.x;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[21u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[21u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[21u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue31) ? fma(intermediateValue31, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue13 = vec3(productValue11, productValue10, productValue9);
    float scalarValue50 = rdDot3Precise(vectorValue13, vectorValue13);
    float inverseLengthValue28 = inversesqrt(scalarValue50);
    float productValue162 = inverseLengthValue28 * productValue11;
    float productValue163 = inverseLengthValue28 * productValue10;
    float productValue164 = inverseLengthValue28 * productValue9;
    float quotientValue12 = 1.0 / (abs(productValue164) + (abs(productValue163) + abs(productValue162)));
    float productValue165 = quotientValue12 * productValue162;
    float productValue166 = quotientValue12 * productValue163;
    bool conditionValue10 = productValue164 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue10 ? (((productValue165 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue166))) : productValue165;
    fragmentColor2.y = conditionValue10 ? (((productValue166 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue165))) : productValue166;
    float multiplyAddValue68 = fma(fragmentScalarConstants1.packedValues[55u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[47u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[51u])) + fragmentScalarConstants1.packedValues[59u];
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[75u], sumValue28, fma(fragmentScalarConstants1.packedValues[67u], sumValue26, sumValue27 * fragmentScalarConstants1.packedValues[71u])) + fragmentScalarConstants1.packedValues[79u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[12u].x)) + fragmentVectorConstants1.packedValues[14u].x) / multiplyAddValue68, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[18u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[17u].x)) + fragmentVectorConstants1.packedValues[19u].x) / multiplyAddValue69, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[12u].y)) + fragmentVectorConstants1.packedValues[14u].y) / multiplyAddValue68, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[18u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[17u].y)) + fragmentVectorConstants1.packedValues[19u].y) / multiplyAddValue69, 0.5, 0.5);
    bool bitwiseValue5 = (((fragmentScalarConstants1.packedValues[81u] + fragmentScalarConstants1.packedValues[80u]) + fragmentScalarConstants1.packedValues[82u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[124u] > 9.9999997473787516355514526367188e-05);
    float productValue136 = fragmentScalarConstants1.packedValues[124u] * fragmentScalarConstants1.packedValues[124u];
    float comparisonValue43 = (bitwiseValue5 ? spvNMin(productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].x) * 0.16666667163372039794921875;
    float multiplyAddValue70 = (bitwiseValue5 ? spvNMin(fma(fma(productValue136, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].y) * 0.16666667163372039794921875;
    float multiplyAddValue71 = (bitwiseValue5 ? spvNMin(fma(productValue136 * productValue136, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].z) * 0.16666667163372039794921875;
    float productValue137 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue70, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue71, comparisonValue43)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue70 / productValue137, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue43 / productValue137, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue71 / productValue137, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue137, 0.0, 1.0) * 255.0);
    uint productValue138 = uint(floor(fragmentScalarConstants1.packedValues[83u] * 255.0));
    fragmentColor0.w = (((productValue138 & 2u) != 0u) ? 512u : 0u) + ((((productValue138 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[125u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue33, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue32, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue58 = intermediateValue40 ? multiplyAddValue23 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue17 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue3 = inversesqrt(scalarValue17);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue18);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue19 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue19);
        float multiplyAddValue90 = fma(inverseLengthValue5 * varyingNormal0.x, comparisonValue58, intermediateValue40 ? fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue25, intermediateValue40 ? ((inverseLengthValue4 * varyingBitangent0.x) * multiplyAddValue24) : 0.0) : 0.0);
        float multiplyAddValue91 = fma(inverseLengthValue5 * varyingNormal0.y, comparisonValue58, intermediateValue40 ? fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue25, intermediateValue40 ? ((inverseLengthValue4 * varyingBitangent0.y) * multiplyAddValue24) : 0.0) : 0.0);
        float multiplyAddValue92 = fma(inverseLengthValue5 * varyingNormal0.z, comparisonValue58, intermediateValue40 ? fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue25, intermediateValue40 ? ((inverseLengthValue4 * varyingBitangent0.z) * multiplyAddValue24) : 0.0) : 0.0);
        vec3 vectorValue14 = vec3(multiplyAddValue90, multiplyAddValue91, multiplyAddValue92);
        float scalarValue53 = rdDot3Precise(vectorValue14, vectorValue14);
        float inverseLengthValue29 = inversesqrt(scalarValue53);
        productValue8 = inverseLengthValue29 * multiplyAddValue92;
        productValue9 = inverseLengthValue29 * multiplyAddValue91;
        productValue10 = inverseLengthValue29 * multiplyAddValue90;
    }
    else
    {
        productValue8 = varyingNormal0.z;
        productValue9 = varyingNormal0.y;
        productValue10 = varyingNormal0.x;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[21u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[21u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[21u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue34) ? fma(intermediateValue34, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue15 = vec3(productValue10, productValue9, productValue8);
    float scalarValue54 = rdDot3Precise(vectorValue15, vectorValue15);
    float inverseLengthValue30 = inversesqrt(scalarValue54);
    float productValue183 = inverseLengthValue30 * productValue10;
    float productValue184 = inverseLengthValue30 * productValue9;
    float productValue185 = inverseLengthValue30 * productValue8;
    float quotientValue13 = 1.0 / (abs(productValue185) + (abs(productValue184) + abs(productValue183)));
    float productValue186 = quotientValue13 * productValue183;
    float productValue187 = quotientValue13 * productValue184;
    bool conditionValue11 = productValue185 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? (((productValue186 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue187))) : productValue186;
    fragmentColor2.y = conditionValue11 ? (((productValue187 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue186))) : productValue187;
    float multiplyAddValue68 = fma(fragmentScalarConstants1.packedValues[55u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[47u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[51u])) + fragmentScalarConstants1.packedValues[59u];
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[75u], sumValue28, fma(fragmentScalarConstants1.packedValues[67u], sumValue26, sumValue27 * fragmentScalarConstants1.packedValues[71u])) + fragmentScalarConstants1.packedValues[79u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[12u].x)) + fragmentVectorConstants1.packedValues[14u].x) / multiplyAddValue68, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[18u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[17u].x)) + fragmentVectorConstants1.packedValues[19u].x) / multiplyAddValue69, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[12u].y)) + fragmentVectorConstants1.packedValues[14u].y) / multiplyAddValue68, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[18u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[17u].y)) + fragmentVectorConstants1.packedValues[19u].y) / multiplyAddValue69, 0.5, 0.5);
    bool bitwiseValue5 = (((fragmentScalarConstants1.packedValues[81u] + fragmentScalarConstants1.packedValues[80u]) + fragmentScalarConstants1.packedValues[82u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[124u] > 9.9999997473787516355514526367188e-05);
    float productValue136 = fragmentScalarConstants1.packedValues[124u] * fragmentScalarConstants1.packedValues[124u];
    float comparisonValue43 = (bitwiseValue5 ? spvNMin(productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].x) * 0.16666667163372039794921875;
    float multiplyAddValue70 = (bitwiseValue5 ? spvNMin(fma(fma(productValue136, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].y) * 0.16666667163372039794921875;
    float multiplyAddValue71 = (bitwiseValue5 ? spvNMin(fma(productValue136 * productValue136, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue136, 1.0) : fragmentVectorConstants1.packedValues[20u].z) * 0.16666667163372039794921875;
    float productValue137 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue70, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue71, comparisonValue43)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue70 / productValue137, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue43 / productValue137, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue71 / productValue137, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue137, 0.0, 1.0) * 255.0);
    uint productValue138 = uint(floor(fragmentScalarConstants1.packedValues[83u] * 255.0));
    fragmentColor0.w = (((productValue138 & 2u) != 0u) ? 512u : 0u) + ((((productValue138 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[125u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue36, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue35, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue12 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue13 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        float multiplyAddValue44 = fma(inverseLengthValue11 * varyingNormal0.x, intermediateValue24, fma(inverseLengthValue12 * varyingBitangent0.x, intermediateValue23, inverseLengthValue13 * varyingTangent0.x));
        float multiplyAddValue45 = fma(inverseLengthValue11 * varyingNormal0.y, intermediateValue24, fma(inverseLengthValue12 * varyingBitangent0.y, intermediateValue23, inverseLengthValue13 * varyingTangent0.y));
        float multiplyAddValue46 = fma(inverseLengthValue11 * varyingNormal0.z, intermediateValue24, fma(inverseLengthValue12 * varyingBitangent0.z, intermediateValue23, inverseLengthValue13 * varyingTangent0.z));
        float inverseLengthValue14 = inversesqrt(dot(vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46), vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46)));
        intermediateValue15 = inverseLengthValue14 * multiplyAddValue44;
        intermediateValue16 = inverseLengthValue14 * multiplyAddValue45;
        intermediateValue17 = inverseLengthValue14 * multiplyAddValue46;
    }
    float sumValue11 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue12 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue13 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue15 = inversesqrt(dot(vec3(intermediateValue15, intermediateValue16, intermediateValue17), vec3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue57 = inverseLengthValue15 * intermediateValue15;
    float productValue58 = inverseLengthValue15 * intermediateValue16;
    float productValue59 = inverseLengthValue15 * intermediateValue17;
    float quotientValue4 = 1.0 / ((abs(productValue58) + abs(productValue57)) + abs(productValue59));
    float productValue60 = quotientValue4 * productValue57;
    float productValue61 = quotientValue4 * productValue58;
    bool conditionValue5 = productValue59 < 0.0;
    float multiplyAddValue47 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue48 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue13, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue12, sumValue11 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue19;
    float productValue21;
    float productValue22;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue62 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue19 = spvNClamp(productValue62, 0.0, 1.0);
        productValue21 = spvNClamp(((productValue62 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue62, 0.0, 1.0);
        productValue22 = spvNClamp((((productValue62 * productValue62) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue62, 0.0, 1.0);
    }
    else
    {
        intermediateValue19 = fragmentVectorConstants1.packedValues[19u].x;
        productValue21 = fragmentVectorConstants1.packedValues[19u].y;
        productValue22 = fragmentVectorConstants1.packedValues[19u].z;
    }
    float productValue63 = intermediateValue19 * 0.16666667163372039794921875;
    float productValue64 = productValue21 * 0.16666667163372039794921875;
    float productValue65 = productValue22 * 0.16666667163372039794921875;
    float productValue66 = ceil(spvNClamp(spvNMax(spvNMax(productValue63, productValue65), spvNMax(productValue64, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue63 / productValue66, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue64 / productValue66, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue65 / productValue66, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue66, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[14u].x - productValue44) * fragmentVectorConstants1.packedValues[14u].w) + productValue44) + (productValue47 * productValue47);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[14u].y - productValue45) * fragmentVectorConstants1.packedValues[14u].w) + productValue45) + (productValue48 * productValue48);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[14u].z - productValue46) * fragmentVectorConstants1.packedValues[14u].w) + productValue46) + (productValue49 * productValue49);
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue14 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue5 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue47) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue13, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue12, sumValue11 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue48)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue47) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue13, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue12, sumValue11 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue48)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue12 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue18 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue26;
        float multiplyAddValue52 = fma(inverseLengthValue11 * varyingNormal0.x, intermediateValue28, fma(inverseLengthValue12 * varyingBitangent0.x, intermediateValue27, inverseLengthValue18 * varyingTangent0.x));
        float multiplyAddValue53 = fma(inverseLengthValue11 * varyingNormal0.y, intermediateValue28, fma(inverseLengthValue12 * varyingBitangent0.y, intermediateValue27, inverseLengthValue18 * varyingTangent0.y));
        float multiplyAddValue54 = fma(inverseLengthValue11 * varyingNormal0.z, intermediateValue28, fma(inverseLengthValue12 * varyingBitangent0.z, intermediateValue27, inverseLengthValue18 * varyingTangent0.z));
        float inverseLengthValue19 = inversesqrt(dot(vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54), vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54)));
        intermediateValue19 = inverseLengthValue19 * multiplyAddValue52;
        intermediateValue20 = inverseLengthValue19 * multiplyAddValue53;
        intermediateValue21 = inverseLengthValue19 * multiplyAddValue54;
    }
    float sumValue11 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue12 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue13 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue20 = inversesqrt(dot(vec3(intermediateValue19, intermediateValue20, intermediateValue21), vec3(intermediateValue19, intermediateValue20, intermediateValue21)));
    float productValue81 = inverseLengthValue20 * intermediateValue19;
    float productValue82 = inverseLengthValue20 * intermediateValue20;
    float productValue83 = inverseLengthValue20 * intermediateValue21;
    float quotientValue6 = 1.0 / ((abs(productValue82) + abs(productValue81)) + abs(productValue83));
    float productValue84 = quotientValue6 * productValue81;
    float productValue85 = quotientValue6 * productValue82;
    bool conditionValue7 = productValue83 < 0.0;
    float multiplyAddValue47 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue48 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue13, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue12, sumValue11 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue23;
    float productValue22;
    float productValue23;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue62 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue23 = spvNClamp(productValue62, 0.0, 1.0);
        productValue22 = spvNClamp(((productValue62 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue62, 0.0, 1.0);
        productValue23 = spvNClamp((((productValue62 * productValue62) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue62, 0.0, 1.0);
    }
    else
    {
        intermediateValue23 = fragmentVectorConstants1.packedValues[19u].x;
        productValue22 = fragmentVectorConstants1.packedValues[19u].y;
        productValue23 = fragmentVectorConstants1.packedValues[19u].z;
    }
    float productValue86 = intermediateValue23 * 0.16666667163372039794921875;
    float productValue65 = productValue22 * 0.16666667163372039794921875;
    float productValue87 = productValue23 * 0.16666667163372039794921875;
    float productValue88 = ceil(spvNClamp(spvNMax(spvNMax(productValue86, productValue87), spvNMax(productValue65, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue17, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue86 / productValue88, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue65 / productValue88, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue87 / productValue88, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue88, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[14u].x - productValue78) * fragmentVectorConstants1.packedValues[14u].w) + productValue78) + (productValue47 * productValue47);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[14u].y - productValue79) * fragmentVectorConstants1.packedValues[14u].w) + productValue79) + (productValue48 * productValue48);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[14u].z - productValue80) * fragmentVectorConstants1.packedValues[14u].w) + productValue80) + (productValue49 * productValue49);
    fragmentColor1.w = (intermediateValue15 > intermediateValue18) ? ((intermediateValue15 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue18 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue7 ? (((productValue84 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue85))) : productValue84;
    fragmentColor2.y = conditionValue7 ? ((1.0 - abs(productValue84)) * ((productValue85 < 0.0) ? (-1.0) : 1.0)) : productValue85;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue47) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue13, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue12, sumValue11 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue48)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue47) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue13, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue12, sumValue11 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue48)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue12 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue13 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        float multiplyAddValue44 = fma(inverseLengthValue11 * varyingNormal0.x, intermediateValue24, fma(inverseLengthValue12 * varyingBitangent0.x, intermediateValue23, inverseLengthValue13 * varyingTangent0.x));
        float multiplyAddValue45 = fma(inverseLengthValue11 * varyingNormal0.y, intermediateValue24, fma(inverseLengthValue12 * varyingBitangent0.y, intermediateValue23, inverseLengthValue13 * varyingTangent0.y));
        float multiplyAddValue46 = fma(inverseLengthValue11 * varyingNormal0.z, intermediateValue24, fma(inverseLengthValue12 * varyingBitangent0.z, intermediateValue23, inverseLengthValue13 * varyingTangent0.z));
        float inverseLengthValue14 = inversesqrt(dot(vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46), vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46)));
        intermediateValue15 = inverseLengthValue14 * multiplyAddValue44;
        intermediateValue16 = inverseLengthValue14 * multiplyAddValue45;
        intermediateValue17 = inverseLengthValue14 * multiplyAddValue46;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[21u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[21u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[21u].z;
    float inverseLengthValue15 = inversesqrt(dot(vec3(intermediateValue15, intermediateValue16, intermediateValue17), vec3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue57 = inverseLengthValue15 * intermediateValue15;
    float productValue58 = inverseLengthValue15 * intermediateValue16;
    float productValue59 = inverseLengthValue15 * intermediateValue17;
    float quotientValue4 = 1.0 / ((abs(productValue58) + abs(productValue57)) + abs(productValue59));
    float productValue60 = quotientValue4 * productValue57;
    float productValue61 = quotientValue4 * productValue58;
    bool conditionValue5 = productValue59 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[13u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[18u].w, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].w, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].w)) + fragmentVectorConstants1.packedValues[19u].w;
    float intermediateValue19;
    float productValue25;
    float productValue26;
    if ((fragmentVectorConstants1.packedValues[31u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[20u].x + fragmentVectorConstants1.packedValues[20u].y) + fragmentVectorConstants1.packedValues[20u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue105 = fragmentVectorConstants1.packedValues[31u].x * fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue19 = spvNClamp(productValue105, 0.0, 1.0);
        productValue25 = spvNClamp(((productValue105 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue105, 0.0, 1.0);
        productValue26 = spvNClamp((((productValue105 * productValue105) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue105, 0.0, 1.0);
    }
    else
    {
        intermediateValue19 = fragmentVectorConstants1.packedValues[20u].x;
        productValue25 = fragmentVectorConstants1.packedValues[20u].y;
        productValue26 = fragmentVectorConstants1.packedValues[20u].z;
    }
    float productValue63 = intermediateValue19 * 0.16666667163372039794921875;
    float productValue106 = productValue25 * 0.16666667163372039794921875;
    float productValue107 = productValue26 * 0.16666667163372039794921875;
    float productValue108 = ceil(spvNClamp(spvNMax(spvNMax(productValue63, productValue107), spvNMax(productValue106, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue3 = uint(floor(fragmentVectorConstants1.packedValues[20u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue63 / productValue108, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue106 / productValue108, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue107 / productValue108, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue108, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[31u].y, 0.0, 1.0) * 255.0) | (bitwiseValue3 & 256u)) | (bitwiseValue3 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[15u].x - productValue99) * fragmentVectorConstants1.packedValues[15u].w) + productValue99) + (productValue102 * productValue102);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[15u].y - productValue100) * fragmentVectorConstants1.packedValues[15u].w) + productValue100) + (productValue103 * productValue103);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[15u].z - productValue101) * fragmentVectorConstants1.packedValues[15u].w) + productValue101) + (productValue104 * productValue104);
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue14 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue5 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[18u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].x, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].x)) + fragmentVectorConstants1.packedValues[19u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[18u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].y, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].y)) + fragmentVectorConstants1.packedValues[19u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue12 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue18 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue26;
        float multiplyAddValue52 = fma(inverseLengthValue11 * varyingNormal0.x, intermediateValue28, fma(inverseLengthValue12 * varyingBitangent0.x, intermediateValue27, inverseLengthValue18 * varyingTangent0.x));
        float multiplyAddValue53 = fma(inverseLengthValue11 * varyingNormal0.y, intermediateValue28, fma(inverseLengthValue12 * varyingBitangent0.y, intermediateValue27, inverseLengthValue18 * varyingTangent0.y));
        float multiplyAddValue54 = fma(inverseLengthValue11 * varyingNormal0.z, intermediateValue28, fma(inverseLengthValue12 * varyingBitangent0.z, intermediateValue27, inverseLengthValue18 * varyingTangent0.z));
        float inverseLengthValue19 = inversesqrt(dot(vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54), vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54)));
        intermediateValue19 = inverseLengthValue19 * multiplyAddValue52;
        intermediateValue20 = inverseLengthValue19 * multiplyAddValue53;
        intermediateValue21 = inverseLengthValue19 * multiplyAddValue54;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[21u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[21u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[21u].z;
    float inverseLengthValue20 = inversesqrt(dot(vec3(intermediateValue19, intermediateValue20, intermediateValue21), vec3(intermediateValue19, intermediateValue20, intermediateValue21)));
    float productValue81 = inverseLengthValue20 * intermediateValue19;
    float productValue82 = inverseLengthValue20 * intermediateValue20;
    float productValue83 = inverseLengthValue20 * intermediateValue21;
    float quotientValue6 = 1.0 / ((abs(productValue82) + abs(productValue81)) + abs(productValue83));
    float productValue84 = quotientValue6 * productValue81;
    float productValue85 = quotientValue6 * productValue82;
    bool conditionValue7 = productValue83 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[13u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[18u].w, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].w, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].w)) + fragmentVectorConstants1.packedValues[19u].w;
    float intermediateValue23;
    float productValue26;
    float productValue27;
    if ((fragmentVectorConstants1.packedValues[31u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[20u].x + fragmentVectorConstants1.packedValues[20u].y) + fragmentVectorConstants1.packedValues[20u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue105 = fragmentVectorConstants1.packedValues[31u].x * fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue23 = spvNClamp(productValue105, 0.0, 1.0);
        productValue26 = spvNClamp(((productValue105 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue105, 0.0, 1.0);
        productValue27 = spvNClamp((((productValue105 * productValue105) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue105, 0.0, 1.0);
    }
    else
    {
        intermediateValue23 = fragmentVectorConstants1.packedValues[20u].x;
        productValue26 = fragmentVectorConstants1.packedValues[20u].y;
        productValue27 = fragmentVectorConstants1.packedValues[20u].z;
    }
    float productValue86 = intermediateValue23 * 0.16666667163372039794921875;
    float productValue107 = productValue26 * 0.16666667163372039794921875;
    float productValue120 = productValue27 * 0.16666667163372039794921875;
    float productValue121 = ceil(spvNClamp(spvNMax(spvNMax(productValue86, productValue120), spvNMax(productValue107, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue3 = uint(floor(fragmentVectorConstants1.packedValues[20u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue17, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue86 / productValue121, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue107 / productValue121, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue120 / productValue121, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue121, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[31u].y, 0.0, 1.0) * 255.0) | (bitwiseValue3 & 256u)) | (bitwiseValue3 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[15u].x - productValue117) * fragmentVectorConstants1.packedValues[15u].w) + productValue117) + (productValue102 * productValue102);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[15u].y - productValue118) * fragmentVectorConstants1.packedValues[15u].w) + productValue118) + (productValue103 * productValue103);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[15u].z - productValue119) * fragmentVectorConstants1.packedValues[15u].w) + productValue119) + (productValue104 * productValue104);
    fragmentColor1.w = (intermediateValue15 > intermediateValue18) ? ((intermediateValue15 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue18 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue7 ? (((productValue84 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue85))) : productValue84;
    fragmentColor2.y = conditionValue7 ? ((1.0 - abs(productValue84)) * ((productValue85 < 0.0) ? (-1.0) : 1.0)) : productValue85;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[18u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].x, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].x)) + fragmentVectorConstants1.packedValues[19u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[18u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].y, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].y)) + fragmentVectorConstants1.packedValues[19u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue12 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue24 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue23;
        float multiplyAddValue79 = fma(inverseLengthValue11 * varyingNormal0.x, intermediateValue25, fma(inverseLengthValue12 * varyingBitangent0.x, intermediateValue24, inverseLengthValue24 * varyingTangent0.x));
        float multiplyAddValue80 = fma(inverseLengthValue11 * varyingNormal0.y, intermediateValue25, fma(inverseLengthValue12 * varyingBitangent0.y, intermediateValue24, inverseLengthValue24 * varyingTangent0.y));
        float multiplyAddValue81 = fma(inverseLengthValue11 * varyingNormal0.z, intermediateValue25, fma(inverseLengthValue12 * varyingBitangent0.z, intermediateValue24, inverseLengthValue24 * varyingTangent0.z));
        float inverseLengthValue25 = inversesqrt(dot(vec3(multiplyAddValue79, multiplyAddValue80, multiplyAddValue81), vec3(multiplyAddValue79, multiplyAddValue80, multiplyAddValue81)));
        intermediateValue16 = inverseLengthValue25 * multiplyAddValue79;
        intermediateValue17 = inverseLengthValue25 * multiplyAddValue80;
        intermediateValue18 = inverseLengthValue25 * multiplyAddValue81;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[21u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[21u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[21u].z;
    float inverseLengthValue26 = inversesqrt(dot(vec3(intermediateValue16, intermediateValue17, intermediateValue18), vec3(intermediateValue16, intermediateValue17, intermediateValue18)));
    float productValue152 = inverseLengthValue26 * intermediateValue16;
    float productValue153 = inverseLengthValue26 * intermediateValue17;
    float productValue154 = inverseLengthValue26 * intermediateValue18;
    float quotientValue11 = 1.0 / ((abs(productValue153) + abs(productValue152)) + abs(productValue154));
    float productValue155 = quotientValue11 * productValue152;
    float productValue156 = quotientValue11 * productValue153;
    bool conditionValue9 = productValue154 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[13u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[18u].w, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].w, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].w)) + fragmentVectorConstants1.packedValues[19u].w;
    float intermediateValue20;
    float productValue26;
    float productValue27;
    if ((fragmentVectorConstants1.packedValues[31u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[20u].x + fragmentVectorConstants1.packedValues[20u].y) + fragmentVectorConstants1.packedValues[20u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue105 = fragmentVectorConstants1.packedValues[31u].x * fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue20 = spvNClamp(productValue105, 0.0, 1.0);
        productValue26 = spvNClamp(((productValue105 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue105, 0.0, 1.0);
        productValue27 = spvNClamp((((productValue105 * productValue105) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue105, 0.0, 1.0);
    }
    else
    {
        intermediateValue20 = fragmentVectorConstants1.packedValues[20u].x;
        productValue26 = fragmentVectorConstants1.packedValues[20u].y;
        productValue27 = fragmentVectorConstants1.packedValues[20u].z;
    }
    float productValue157 = intermediateValue20 * 0.16666667163372039794921875;
    float productValue107 = productValue26 * 0.16666667163372039794921875;
    float productValue120 = productValue27 * 0.16666667163372039794921875;
    float productValue158 = ceil(spvNClamp(spvNMax(spvNMax(productValue157, productValue120), spvNMax(productValue107, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue3 = uint(floor(fragmentVectorConstants1.packedValues[20u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue157 / productValue158, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue107 / productValue158, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue120 / productValue158, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue158, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[31u].y, 0.0, 1.0) * 255.0) | (bitwiseValue3 & 256u)) | (bitwiseValue3 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[15u].x - productValue146) * fragmentVectorConstants1.packedValues[15u].w) + productValue146) + (productValue149 * productValue149);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[15u].y - productValue147) * fragmentVectorConstants1.packedValues[15u].w) + productValue147) + (productValue150 * productValue150);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[15u].z - productValue148) * fragmentVectorConstants1.packedValues[15u].w) + productValue148) + (productValue151 * productValue151);
    fragmentColor1.w = (intermediateValue12 > intermediateValue15) ? ((intermediateValue12 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue15 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue9 ? (((productValue155 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue156))) : productValue155;
    fragmentColor2.y = conditionValue9 ? ((1.0 - abs(productValue155)) * ((productValue156 < 0.0) ? (-1.0) : 1.0)) : productValue156;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[18u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].x, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].x)) + fragmentVectorConstants1.packedValues[19u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[18u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].y, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].y)) + fragmentVectorConstants1.packedValues[19u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue12 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue18 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue26;
        float multiplyAddValue52 = fma(inverseLengthValue11 * varyingNormal0.x, intermediateValue28, fma(inverseLengthValue12 * varyingBitangent0.x, intermediateValue27, inverseLengthValue18 * varyingTangent0.x));
        float multiplyAddValue53 = fma(inverseLengthValue11 * varyingNormal0.y, intermediateValue28, fma(inverseLengthValue12 * varyingBitangent0.y, intermediateValue27, inverseLengthValue18 * varyingTangent0.y));
        float multiplyAddValue54 = fma(inverseLengthValue11 * varyingNormal0.z, intermediateValue28, fma(inverseLengthValue12 * varyingBitangent0.z, intermediateValue27, inverseLengthValue18 * varyingTangent0.z));
        float inverseLengthValue19 = inversesqrt(dot(vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54), vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54)));
        intermediateValue19 = inverseLengthValue19 * multiplyAddValue52;
        intermediateValue20 = inverseLengthValue19 * multiplyAddValue53;
        intermediateValue21 = inverseLengthValue19 * multiplyAddValue54;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[21u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[21u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[21u].z;
    float inverseLengthValue20 = inversesqrt(dot(vec3(intermediateValue19, intermediateValue20, intermediateValue21), vec3(intermediateValue19, intermediateValue20, intermediateValue21)));
    float productValue81 = inverseLengthValue20 * intermediateValue19;
    float productValue82 = inverseLengthValue20 * intermediateValue20;
    float productValue83 = inverseLengthValue20 * intermediateValue21;
    float quotientValue6 = 1.0 / ((abs(productValue82) + abs(productValue81)) + abs(productValue83));
    float productValue84 = quotientValue6 * productValue81;
    float productValue85 = quotientValue6 * productValue82;
    bool conditionValue7 = productValue83 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[13u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[18u].w, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].w, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].w)) + fragmentVectorConstants1.packedValues[19u].w;
    float intermediateValue23;
    float productValue27;
    float productValue28;
    if ((fragmentVectorConstants1.packedValues[31u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[20u].x + fragmentVectorConstants1.packedValues[20u].y) + fragmentVectorConstants1.packedValues[20u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue105 = fragmentVectorConstants1.packedValues[31u].x * fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue23 = spvNClamp(productValue105, 0.0, 1.0);
        productValue27 = spvNClamp(((productValue105 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue105, 0.0, 1.0);
        productValue28 = spvNClamp((((productValue105 * productValue105) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue105, 0.0, 1.0);
    }
    else
    {
        intermediateValue23 = fragmentVectorConstants1.packedValues[20u].x;
        productValue27 = fragmentVectorConstants1.packedValues[20u].y;
        productValue28 = fragmentVectorConstants1.packedValues[20u].z;
    }
    float productValue86 = intermediateValue23 * 0.16666667163372039794921875;
    float productValue120 = productValue27 * 0.16666667163372039794921875;
    float productValue177 = productValue28 * 0.16666667163372039794921875;
    float productValue178 = ceil(spvNClamp(spvNMax(spvNMax(productValue86, productValue177), spvNMax(productValue120, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue3 = uint(floor(fragmentVectorConstants1.packedValues[20u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue17, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue86 / productValue178, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue120 / productValue178, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue177 / productValue178, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue178, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[31u].y, 0.0, 1.0) * 255.0) | (bitwiseValue3 & 256u)) | (bitwiseValue3 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[15u].x - productValue117) * fragmentVectorConstants1.packedValues[15u].w) + productValue117) + (productValue149 * productValue149);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[15u].y - productValue118) * fragmentVectorConstants1.packedValues[15u].w) + productValue118) + (productValue150 * productValue150);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[15u].z - productValue119) * fragmentVectorConstants1.packedValues[15u].w) + productValue119) + (productValue151 * productValue151);
    fragmentColor1.w = (intermediateValue15 > intermediateValue18) ? ((intermediateValue15 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue18 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue7 ? (((productValue84 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue85))) : productValue84;
    fragmentColor2.y = conditionValue7 ? ((1.0 - abs(productValue84)) * ((productValue85 < 0.0) ? (-1.0) : 1.0)) : productValue85;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[18u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].x, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].x)) + fragmentVectorConstants1.packedValues[19u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[11u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[14u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[18u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[17u].y, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[16u].y)) + fragmentVectorConstants1.packedValues[19u].y) / multiplyAddValue56)) * 0.5;
#endif
    discardIfRequested();
}
