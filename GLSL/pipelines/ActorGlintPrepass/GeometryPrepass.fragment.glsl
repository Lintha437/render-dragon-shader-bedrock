#version 460
#extension GL_GOOGLE_include_directive : require
// ActorGlintPrepass / GeometryPrepass / fragment forward pipeline.
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
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/ActorGlintPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue41 = sampledTextureValue9.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue42 = sampledTextureValue9.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue43 = sampledTextureValue9.z * fragmentVectorConstants1.packedValues[16u].z;
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue8 = fma(sampledTextureValue10.x, fragmentVectorConstants1.packedValues[14u].x, sampledTextureValue11.x * fragmentVectorConstants1.packedValues[14u].x) * fragmentVectorConstants1.packedValues[20u].x;
    float multiplyAddValue9 = fma(sampledTextureValue10.y, fragmentVectorConstants1.packedValues[14u].y, sampledTextureValue11.y * fragmentVectorConstants1.packedValues[14u].y) * fragmentVectorConstants1.packedValues[20u].y;
    float multiplyAddValue20 = fma(sampledTextureValue10.z, fragmentVectorConstants1.packedValues[14u].z, sampledTextureValue11.z * fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[20u].z;
    fragmentColor1.x = fma(multiplyAddValue8, multiplyAddValue8, fma(fragmentScalarConstants1.packedValues[23u], fma(-productValue41, multiplyAddValue5, fragmentVectorConstants1.packedValues[5u].x), productValue41 * multiplyAddValue5));
    fragmentColor1.y = fma(multiplyAddValue9, multiplyAddValue9, fma(fragmentScalarConstants1.packedValues[23u], fma(-productValue42, multiplyAddValue6, fragmentVectorConstants1.packedValues[5u].y), productValue42 * multiplyAddValue6));
    fragmentColor1.z = fma(multiplyAddValue20, multiplyAddValue20, fma(fragmentScalarConstants1.packedValues[23u], fma(-productValue43, multiplyAddValue7, fragmentVectorConstants1.packedValues[5u].z), productValue43 * multiplyAddValue7));
    uint scalarValue7 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    bool comparisonValue7 = (scalarValue7 & 16u) == 16u;
    bool comparisonValue8 = (scalarValue7 & 4u) == 4u;
    bool comparisonValue9 = (scalarValue7 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((scalarValue7 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue17 = sampledTextureValue21.x;
    float scalarValue18 = sampledTextureValue21.y;
    float scalarValue19 = sampledTextureValue21.z;
    bool productValue66 = ((scalarValue19 + (scalarValue18 + scalarValue17)) * (1.0 - sampledTextureValue21.w)) > 0.0;
    float multiplyAddValue37 = productValue66 ? (fma(fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue9.x, -scalarValue17) + scalarValue17) : scalarValue17;
    float multiplyAddValue38 = productValue66 ? (fma(fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue9.y, -scalarValue18) + scalarValue18) : scalarValue18;
    float multiplyAddValue39 = productValue66 ? (fma(fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue9.z, -scalarValue19) + scalarValue19) : scalarValue19;
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue8 = fma(sampledTextureValue10.x, fragmentVectorConstants1.packedValues[14u].x, sampledTextureValue11.x * fragmentVectorConstants1.packedValues[14u].x) * fragmentVectorConstants1.packedValues[20u].x;
    float multiplyAddValue9 = fma(sampledTextureValue10.y, fragmentVectorConstants1.packedValues[14u].y, sampledTextureValue11.y * fragmentVectorConstants1.packedValues[14u].y) * fragmentVectorConstants1.packedValues[20u].y;
    float multiplyAddValue20 = fma(sampledTextureValue10.z, fragmentVectorConstants1.packedValues[14u].z, sampledTextureValue11.z * fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[20u].z;
    fragmentColor1.x = fma(multiplyAddValue8, multiplyAddValue8, fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue37, multiplyAddValue5, fragmentVectorConstants1.packedValues[5u].x), multiplyAddValue37 * multiplyAddValue5));
    fragmentColor1.y = fma(multiplyAddValue9, multiplyAddValue9, fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue38, multiplyAddValue6, fragmentVectorConstants1.packedValues[5u].y), multiplyAddValue38 * multiplyAddValue6));
    fragmentColor1.z = fma(multiplyAddValue20, multiplyAddValue20, fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue39, multiplyAddValue7, fragmentVectorConstants1.packedValues[5u].z), multiplyAddValue39 * multiplyAddValue7));
    uint scalarValue7 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    bool comparisonValue7 = (scalarValue7 & 16u) == 16u;
    bool comparisonValue8 = (scalarValue7 & 4u) == 4u;
    bool comparisonValue9 = (scalarValue7 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if ((scalarValue7 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue102 = sampledTextureValue9.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue103 = sampledTextureValue9.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue104 = sampledTextureValue9.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue105 = sampledTextureValue9.w * fragmentVectorConstants1.packedValues[17u].w;
    float multiplyAddValue48 = fma(productValue105, fma(productValue102, fragmentVectorConstants1.packedValues[0u].x, -productValue102), productValue102);
    float multiplyAddValue49 = fma(productValue105, fma(productValue103, fragmentVectorConstants1.packedValues[0u].y, -productValue103), productValue103);
    float multiplyAddValue50 = fma(productValue105, fma(productValue104, fragmentVectorConstants1.packedValues[0u].z, -productValue104), productValue104);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue54 = fma(sampledTextureValue10.x, fragmentVectorConstants1.packedValues[15u].x, sampledTextureValue11.x * fragmentVectorConstants1.packedValues[15u].x) * fragmentVectorConstants1.packedValues[21u].x;
    float multiplyAddValue55 = fma(sampledTextureValue10.y, fragmentVectorConstants1.packedValues[15u].y, sampledTextureValue11.y * fragmentVectorConstants1.packedValues[15u].y) * fragmentVectorConstants1.packedValues[21u].y;
    float multiplyAddValue56 = fma(sampledTextureValue10.z, fragmentVectorConstants1.packedValues[15u].z, sampledTextureValue11.z * fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[21u].z;
    fragmentColor1.x = fma(multiplyAddValue54, multiplyAddValue54, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue48, multiplyAddValue51, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue48 * multiplyAddValue51));
    fragmentColor1.y = fma(multiplyAddValue55, multiplyAddValue55, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue49, multiplyAddValue52, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue49 * multiplyAddValue52));
    fragmentColor1.z = fma(multiplyAddValue56, multiplyAddValue56, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue50, multiplyAddValue53, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue50 * multiplyAddValue53));
    uint scalarValue22 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue22 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue22 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue22 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((scalarValue22 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue17 = sampledTextureValue21.x;
    float scalarValue18 = sampledTextureValue21.y;
    float scalarValue19 = sampledTextureValue21.z;
    float scalarValue23 = sampledTextureValue21.w;
    bool productValue114 = ((1.0 - scalarValue23) * (scalarValue19 + (scalarValue18 + scalarValue17))) > 0.0;
    float multiplyAddValue64 = productValue114 ? (fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue9.x, -scalarValue17) + scalarValue17) : scalarValue17;
    float multiplyAddValue65 = productValue114 ? (fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue9.y, -scalarValue18) + scalarValue18) : scalarValue18;
    float multiplyAddValue66 = productValue114 ? (fma(fragmentVectorConstants1.packedValues[17u].z, sampledTextureValue9.z, -scalarValue19) + scalarValue19) : scalarValue19;
    float multiplyAddValue67 = productValue114 ? (fma(fragmentVectorConstants1.packedValues[17u].w, sampledTextureValue9.w, -scalarValue23) + scalarValue23) : scalarValue23;
    float multiplyAddValue68 = fma(multiplyAddValue67, fma(multiplyAddValue64, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue64), multiplyAddValue64);
    float multiplyAddValue69 = fma(multiplyAddValue67, fma(multiplyAddValue65, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue65), multiplyAddValue65);
    float multiplyAddValue70 = fma(multiplyAddValue67, fma(multiplyAddValue66, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue66), multiplyAddValue66);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue54 = fma(sampledTextureValue10.x, fragmentVectorConstants1.packedValues[15u].x, sampledTextureValue11.x * fragmentVectorConstants1.packedValues[15u].x) * fragmentVectorConstants1.packedValues[21u].x;
    float multiplyAddValue55 = fma(sampledTextureValue10.y, fragmentVectorConstants1.packedValues[15u].y, sampledTextureValue11.y * fragmentVectorConstants1.packedValues[15u].y) * fragmentVectorConstants1.packedValues[21u].y;
    float multiplyAddValue56 = fma(sampledTextureValue10.z, fragmentVectorConstants1.packedValues[15u].z, sampledTextureValue11.z * fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[21u].z;
    fragmentColor1.x = fma(multiplyAddValue54, multiplyAddValue54, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue68, multiplyAddValue51, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue68 * multiplyAddValue51));
    fragmentColor1.y = fma(multiplyAddValue55, multiplyAddValue55, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue69, multiplyAddValue52, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue69 * multiplyAddValue52));
    fragmentColor1.z = fma(multiplyAddValue56, multiplyAddValue56, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue70, multiplyAddValue53, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue70 * multiplyAddValue53));
    uint scalarValue22 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue22 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue22 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue22 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
    if ((scalarValue22 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue102 = sampledTextureValue9.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue103 = sampledTextureValue9.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue131 = productValue102 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue132 = productValue102 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue133 = productValue102 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue25 = ceil(productValue103);
    float multiplyAddValue77 = fma(scalarValue25, fma(productValue103, fragmentVectorConstants1.packedValues[18u].x, -productValue131), productValue131);
    float multiplyAddValue78 = fma(scalarValue25, fma(productValue103, fragmentVectorConstants1.packedValues[18u].y, -productValue132), productValue132);
    float multiplyAddValue79 = fma(scalarValue25, fma(productValue103, fragmentVectorConstants1.packedValues[18u].z, -productValue133), productValue133);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue80 = fma(sampledTextureValue10.x, fragmentVectorConstants1.packedValues[15u].x, sampledTextureValue11.x * fragmentVectorConstants1.packedValues[15u].x) * fragmentVectorConstants1.packedValues[22u].x;
    float multiplyAddValue81 = fma(sampledTextureValue10.y, fragmentVectorConstants1.packedValues[15u].y, sampledTextureValue11.y * fragmentVectorConstants1.packedValues[15u].y) * fragmentVectorConstants1.packedValues[22u].y;
    float multiplyAddValue82 = fma(sampledTextureValue10.z, fragmentVectorConstants1.packedValues[15u].z, sampledTextureValue11.z * fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[22u].z;
    fragmentColor1.x = fma(multiplyAddValue80, multiplyAddValue80, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue77, multiplyAddValue51, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue77 * multiplyAddValue51));
    fragmentColor1.y = fma(multiplyAddValue81, multiplyAddValue81, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue78, multiplyAddValue52, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue78 * multiplyAddValue52));
    fragmentColor1.z = fma(multiplyAddValue82, multiplyAddValue82, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue79, multiplyAddValue53, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue79 * multiplyAddValue53));
    uint scalarValue22 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue22 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue22 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue22 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if ((scalarValue22 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue17 = sampledTextureValue21.x;
    float scalarValue18 = sampledTextureValue21.y;
    bool productValue150 = ((1.0 - sampledTextureValue21.w) * (sampledTextureValue21.z + (scalarValue18 + scalarValue17))) > 0.0;
    float multiplyAddValue86 = productValue150 ? (fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue9.x, -scalarValue17) + scalarValue17) : scalarValue17;
    float multiplyAddValue87 = productValue150 ? (fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue9.y, -scalarValue18) + scalarValue18) : scalarValue18;
    float productValue151 = multiplyAddValue86 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue152 = multiplyAddValue86 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue153 = multiplyAddValue86 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue27 = ceil(multiplyAddValue87);
    float multiplyAddValue88 = fma(scalarValue27, fma(multiplyAddValue87, fragmentVectorConstants1.packedValues[18u].x, -productValue151), productValue151);
    float multiplyAddValue89 = fma(scalarValue27, fma(multiplyAddValue87, fragmentVectorConstants1.packedValues[18u].y, -productValue152), productValue152);
    float multiplyAddValue90 = fma(scalarValue27, fma(multiplyAddValue87, fragmentVectorConstants1.packedValues[18u].z, -productValue153), productValue153);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue80 = fma(sampledTextureValue10.x, fragmentVectorConstants1.packedValues[15u].x, sampledTextureValue11.x * fragmentVectorConstants1.packedValues[15u].x) * fragmentVectorConstants1.packedValues[22u].x;
    float multiplyAddValue81 = fma(sampledTextureValue10.y, fragmentVectorConstants1.packedValues[15u].y, sampledTextureValue11.y * fragmentVectorConstants1.packedValues[15u].y) * fragmentVectorConstants1.packedValues[22u].y;
    float multiplyAddValue82 = fma(sampledTextureValue10.z, fragmentVectorConstants1.packedValues[15u].z, sampledTextureValue11.z * fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[22u].z;
    fragmentColor1.x = fma(multiplyAddValue80, multiplyAddValue80, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue88, multiplyAddValue51, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue88 * multiplyAddValue51));
    fragmentColor1.y = fma(multiplyAddValue81, multiplyAddValue81, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue89, multiplyAddValue52, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue89 * multiplyAddValue52));
    fragmentColor1.z = fma(multiplyAddValue82, multiplyAddValue82, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue90, multiplyAddValue53, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue90 * multiplyAddValue53));
    uint scalarValue22 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue22 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue22 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue22 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if ((scalarValue22 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = (sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue1 = (sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue9 = (sampledTextureValue.z * fragmentVectorConstants1.packedValues[16u].z) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue10 = (fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[20u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue11 = (fragmentVectorConstants1.packedValues[14u].y * fragmentVectorConstants1.packedValues[20u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue23 = (fragmentVectorConstants1.packedValues[14u].z * fragmentVectorConstants1.packedValues[20u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[0u].x));
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if ((scalarValue & 1u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue20 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue20.x;
    float scalarValue15 = sampledTextureValue20.y;
    float scalarValue16 = sampledTextureValue20.z;
    float productValue54 = float((((scalarValue14 + scalarValue15) + scalarValue16) * (1.0 - sampledTextureValue20.w)) > 0.0);
    float productValue55 = ((productValue54 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x) - scalarValue14)) + scalarValue14) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue56 = ((productValue54 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y) - scalarValue15)) + scalarValue15) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue57 = ((productValue54 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[16u].z) - scalarValue16)) + scalarValue16) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue10 = (fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[20u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue11 = (fragmentVectorConstants1.packedValues[14u].y * fragmentVectorConstants1.packedValues[20u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue23 = (fragmentVectorConstants1.packedValues[14u].z * fragmentVectorConstants1.packedValues[20u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[0u].x));
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if ((scalarValue & 1u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue72 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue73 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue74 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue75 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[17u].w;
    float productValue76 = ((((productValue72 * fragmentVectorConstants1.packedValues[0u].x) - productValue72) * productValue75) + productValue72) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue77 = ((((productValue73 * fragmentVectorConstants1.packedValues[0u].y) - productValue73) * productValue75) + productValue73) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue78 = ((((productValue74 * fragmentVectorConstants1.packedValues[0u].z) - productValue74) * productValue75) + productValue74) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue79 = (fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[21u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue80 = (fragmentVectorConstants1.packedValues[15u].y * fragmentVectorConstants1.packedValues[21u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue81 = (fragmentVectorConstants1.packedValues[15u].z * fragmentVectorConstants1.packedValues[21u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue20 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if ((scalarValue20 & 1u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue20 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue20.x;
    float scalarValue15 = sampledTextureValue20.y;
    float scalarValue16 = sampledTextureValue20.z;
    float scalarValue21 = sampledTextureValue20.w;
    float productValue86 = float((((scalarValue14 + scalarValue15) + scalarValue16) * (1.0 - scalarValue21)) > 0.0);
    float productValue87 = (productValue86 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue14)) + scalarValue14;
    float productValue88 = (productValue86 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue15)) + scalarValue15;
    float productValue89 = (productValue86 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue16)) + scalarValue16;
    float productValue90 = (productValue86 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue21)) + scalarValue21;
    float productValue91 = ((((productValue87 * fragmentVectorConstants1.packedValues[0u].x) - productValue87) * productValue90) + productValue87) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue92 = ((((productValue88 * fragmentVectorConstants1.packedValues[0u].y) - productValue88) * productValue90) + productValue88) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue93 = ((((productValue89 * fragmentVectorConstants1.packedValues[0u].z) - productValue89) * productValue90) + productValue89) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue79 = (fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[21u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue80 = (fragmentVectorConstants1.packedValues[15u].y * fragmentVectorConstants1.packedValues[21u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue81 = (fragmentVectorConstants1.packedValues[15u].z * fragmentVectorConstants1.packedValues[21u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue20 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if ((scalarValue20 & 1u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue72 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue73 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue115 = fragmentVectorConstants1.packedValues[0u].x * productValue72;
    float productValue116 = fragmentVectorConstants1.packedValues[0u].y * productValue72;
    float productValue117 = fragmentVectorConstants1.packedValues[0u].z * productValue72;
    float scalarValue24 = ceil(productValue73);
    float productValue118 = ((((productValue73 * fragmentVectorConstants1.packedValues[18u].x) - productValue115) * scalarValue24) + productValue115) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue119 = ((((productValue73 * fragmentVectorConstants1.packedValues[18u].y) - productValue116) * scalarValue24) + productValue116) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue120 = ((((productValue73 * fragmentVectorConstants1.packedValues[18u].z) - productValue117) * scalarValue24) + productValue117) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue121 = (fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[22u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue122 = (fragmentVectorConstants1.packedValues[15u].y * fragmentVectorConstants1.packedValues[22u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue123 = (fragmentVectorConstants1.packedValues[15u].z * fragmentVectorConstants1.packedValues[22u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue20 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if ((scalarValue20 & 1u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue20 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue20.x;
    float scalarValue15 = sampledTextureValue20.y;
    float productValue139 = float((((scalarValue14 + scalarValue15) + sampledTextureValue20.z) * (1.0 - sampledTextureValue20.w)) > 0.0);
    float productValue140 = (productValue139 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue14)) + scalarValue14;
    float productValue141 = (productValue139 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue15)) + scalarValue15;
    float productValue142 = productValue140 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue143 = productValue140 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue144 = productValue140 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue26 = ceil(productValue141);
    float productValue145 = ((((productValue141 * fragmentVectorConstants1.packedValues[18u].x) - productValue142) * scalarValue26) + productValue142) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue146 = ((((productValue141 * fragmentVectorConstants1.packedValues[18u].y) - productValue143) * scalarValue26) + productValue143) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue147 = ((((productValue141 * fragmentVectorConstants1.packedValues[18u].z) - productValue144) * scalarValue26) + productValue144) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue121 = (fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[22u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue122 = (fragmentVectorConstants1.packedValues[15u].y * fragmentVectorConstants1.packedValues[22u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue123 = (fragmentVectorConstants1.packedValues[15u].z * fragmentVectorConstants1.packedValues[22u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue20 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if ((scalarValue20 & 1u) == 0u)
#endif
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue7 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[76u];
        intermediateValue14 = sampledTextureValue12.x;
        intermediateValue15 = sampledTextureValue12.z;
        intermediateValue16 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue7 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[76u];
        intermediateValue17 = sampledTextureValue12.x;
        intermediateValue18 = sampledTextureValue12.z;
        intermediateValue19 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue22 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[80u];
        intermediateValue14 = sampledTextureValue12.x;
        intermediateValue15 = sampledTextureValue12.z;
        intermediateValue16 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue22 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[80u];
        intermediateValue18 = sampledTextureValue12.x;
        intermediateValue19 = sampledTextureValue12.z;
        intermediateValue20 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue22 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[84u];
        intermediateValue15 = sampledTextureValue12.x;
        intermediateValue16 = sampledTextureValue12.z;
        intermediateValue17 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue22 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[84u];
        intermediateValue17 = sampledTextureValue12.x;
        intermediateValue18 = sampledTextureValue12.z;
        intermediateValue19 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue2 = fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue3 = fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue5 = fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue2 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue3 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue6 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue3 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[20u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[21u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue5 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[20u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[21u].x;
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue14 = fragmentScalarConstants1.packedValues[68u];
        intermediateValue15 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue16 = fragmentScalarConstants1.packedValues[52u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue17 = fragmentScalarConstants1.packedValues[68u];
        intermediateValue18 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue19 = fragmentScalarConstants1.packedValues[52u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue14 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue15 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue16 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue18 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue19 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue20 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[84u];
        intermediateValue15 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue16 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue17 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[84u];
        intermediateValue17 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue18 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue19 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue2 = sampledTextureValue3.x;
        intermediateValue3 = sampledTextureValue3.y;
        intermediateValue4 = sampledTextureValue3.z;
        intermediateValue5 = ((scalarValue & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue5 = sampledTextureValue3.x;
        intermediateValue6 = sampledTextureValue3.y;
        intermediateValue7 = sampledTextureValue3.z;
        intermediateValue8 = ((scalarValue & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue2 = sampledTextureValue3.x;
        intermediateValue3 = sampledTextureValue3.y;
        intermediateValue4 = sampledTextureValue3.z;
        intermediateValue5 = ((scalarValue20 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue6 = sampledTextureValue3.x;
        intermediateValue7 = sampledTextureValue3.y;
        intermediateValue8 = sampledTextureValue3.z;
        intermediateValue9 = ((scalarValue20 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue3 = sampledTextureValue3.x;
        intermediateValue4 = sampledTextureValue3.y;
        intermediateValue5 = sampledTextureValue3.z;
        intermediateValue6 = ((scalarValue20 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[21u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue5 = sampledTextureValue3.x;
        intermediateValue6 = sampledTextureValue3.y;
        intermediateValue7 = sampledTextureValue3.z;
        intermediateValue8 = ((scalarValue20 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[21u].x;
#endif
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue4;
    float productValue5;
    float productValue6;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue2;
    float productValue3;
    float productValue4;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue5;
    float productValue6;
    float productValue7;
    if (comparisonValue28 || (comparisonValue30 || comparisonValue29))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue2;
    float productValue3;
    float productValue4;
    if (comparisonValue28 || (comparisonValue30 || comparisonValue29))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue6;
    float productValue7;
    float productValue8;
    if (comparisonValue28 || (comparisonValue30 || comparisonValue29))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if ((scalarValue & 28u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue & 28u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if ((scalarValue20 & 28u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    if ((scalarValue20 & 28u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if ((scalarValue20 & 28u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue20 & 28u) == 0u)
#endif
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue10;
        float multiplyAddValue11;
        float multiplyAddValue12;
        bool intermediateValue19;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue22;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue19;
        if (comparisonValue29)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue17;
        float multiplyAddValue18;
        float multiplyAddValue19;
        bool intermediateValue23;
        if (comparisonValue29)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue20;
        if (comparisonValue29)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        bool intermediateValue22;
        if (comparisonValue29)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue6 = varyingNormal0.x;
        intermediateValue7 = varyingNormal0.y;
        intermediateValue8 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
        if ((scalarValue & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue9 = varyingNormal0.x;
        intermediateValue10 = varyingNormal0.y;
        intermediateValue11 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        if ((scalarValue & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue6 = varyingNormal0.x;
        intermediateValue7 = varyingNormal0.y;
        intermediateValue8 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
        if ((scalarValue20 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue10 = varyingNormal0.x;
        intermediateValue11 = varyingNormal0.y;
        intermediateValue12 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        if ((scalarValue20 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue7 = varyingNormal0.x;
        intermediateValue8 = varyingNormal0.y;
        intermediateValue9 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        if ((scalarValue20 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue9 = varyingNormal0.x;
        intermediateValue10 = varyingNormal0.y;
        intermediateValue11 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        if ((scalarValue20 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue10 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue12 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue19 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue22 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue19 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue17 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue19 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue23 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue20 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue15 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue22 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue5 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x);
                    float productValue25 = fract(float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.y * 2.0) + (-1.0))) - (((sampledTextureValue5.w * 2.0) + (-1.0)) * ((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue25 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.z * 2.0) + (-1.0))) - (((productValue25 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue5.x * 2.0) + (-1.0)));
                    float comparisonValue2 = ((abs(comparisonValue) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue;
                    float comparisonValue6 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue2, comparisonValue6, 0.25), vec3(comparisonValue2, comparisonValue6, 0.25)));
                    branchMergedValue3 = comparisonValue2 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue27 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue26);
                float scalarValue2 = fract(productValue27);
                float comparisonValue4;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue7.x;
                float scalarValue4 = sampledTextureValue7.y;
                float scalarValue5 = sampledTextureValue7.z;
                float scalarValue6 = sampledTextureValue7.w;
                float sumValue = fract(productValue26 + 0.5);
                float sumValue1 = fract(productValue27 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue28 - productValue29;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue30 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue30, 0.25), vec3(sumValue2, productValue30, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue30;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue13 = branchMergedValue;
            intermediateValue14 = branchMergedValue1;
            intermediateValue15 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue5 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x);
                    float productValue25 = fract(float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.y * 2.0) + (-1.0))) - (((sampledTextureValue5.w * 2.0) + (-1.0)) * ((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue25 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.z * 2.0) + (-1.0))) - (((productValue25 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue5.x * 2.0) + (-1.0)));
                    float comparisonValue2 = ((abs(comparisonValue) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue;
                    float comparisonValue6 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue2, comparisonValue6, 0.25), vec3(comparisonValue2, comparisonValue6, 0.25)));
                    branchMergedValue3 = comparisonValue2 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue27 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue26);
                float scalarValue2 = fract(productValue27);
                float comparisonValue4;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue7.x;
                float scalarValue4 = sampledTextureValue7.y;
                float scalarValue5 = sampledTextureValue7.z;
                float scalarValue6 = sampledTextureValue7.w;
                float sumValue = fract(productValue26 + 0.5);
                float sumValue1 = fract(productValue27 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue28 - productValue29;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue30 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue30, 0.25), vec3(sumValue2, productValue30, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue30;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue16 = branchMergedValue;
            intermediateValue17 = branchMergedValue1;
            intermediateValue18 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue20 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue20 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue5 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x);
                    float productValue25 = fract(float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.y * 2.0) + (-1.0))) - (((sampledTextureValue5.w * 2.0) + (-1.0)) * ((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue25 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.z * 2.0) + (-1.0))) - (((productValue25 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue5.x * 2.0) + (-1.0)));
                    float comparisonValue2 = ((abs(comparisonValue) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue;
                    float comparisonValue6 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue2, comparisonValue6, 0.25), vec3(comparisonValue2, comparisonValue6, 0.25)));
                    branchMergedValue3 = comparisonValue2 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue27 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue26);
                float scalarValue2 = fract(productValue27);
                float comparisonValue4;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue7.x;
                float scalarValue4 = sampledTextureValue7.y;
                float scalarValue5 = sampledTextureValue7.z;
                float scalarValue6 = sampledTextureValue7.w;
                float sumValue = fract(productValue26 + 0.5);
                float sumValue1 = fract(productValue27 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue28 - productValue29;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue30 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue30, 0.25), vec3(sumValue2, productValue30, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue30;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue13 = branchMergedValue;
            intermediateValue14 = branchMergedValue1;
            intermediateValue15 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue20 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue20 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue5 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x);
                    float productValue25 = fract(float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.y * 2.0) + (-1.0))) - (((sampledTextureValue5.w * 2.0) + (-1.0)) * ((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue25 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.z * 2.0) + (-1.0))) - (((productValue25 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue5.x * 2.0) + (-1.0)));
                    float comparisonValue2 = ((abs(comparisonValue) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue;
                    float comparisonValue6 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue2, comparisonValue6, 0.25), vec3(comparisonValue2, comparisonValue6, 0.25)));
                    branchMergedValue3 = comparisonValue2 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue27 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue26);
                float scalarValue2 = fract(productValue27);
                float comparisonValue4;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue7.x;
                float scalarValue4 = sampledTextureValue7.y;
                float scalarValue5 = sampledTextureValue7.z;
                float scalarValue6 = sampledTextureValue7.w;
                float sumValue = fract(productValue26 + 0.5);
                float sumValue1 = fract(productValue27 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue28 - productValue29;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue30 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue30, 0.25), vec3(sumValue2, productValue30, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue30;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue17 = branchMergedValue;
            intermediateValue18 = branchMergedValue1;
            intermediateValue19 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue20 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue20 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue5 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x);
                    float productValue25 = fract(float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.y * 2.0) + (-1.0))) - (((sampledTextureValue5.w * 2.0) + (-1.0)) * ((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue25 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.z * 2.0) + (-1.0))) - (((productValue25 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue5.x * 2.0) + (-1.0)));
                    float comparisonValue2 = ((abs(comparisonValue) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue;
                    float comparisonValue6 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue2, comparisonValue6, 0.25), vec3(comparisonValue2, comparisonValue6, 0.25)));
                    branchMergedValue3 = comparisonValue2 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue27 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue26);
                float scalarValue2 = fract(productValue27);
                float comparisonValue4;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue7.x;
                float scalarValue4 = sampledTextureValue7.y;
                float scalarValue5 = sampledTextureValue7.z;
                float scalarValue6 = sampledTextureValue7.w;
                float sumValue = fract(productValue26 + 0.5);
                float sumValue1 = fract(productValue27 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue28 - productValue29;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue30 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue30, 0.25), vec3(sumValue2, productValue30, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue30;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue14 = branchMergedValue;
            intermediateValue15 = branchMergedValue1;
            intermediateValue16 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue20 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue20 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue5 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x);
                    float productValue25 = fract(float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.y * 2.0) + (-1.0))) - (((sampledTextureValue5.w * 2.0) + (-1.0)) * ((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue25 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.z * 2.0) + (-1.0))) - (((productValue25 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue5.x * 2.0) + (-1.0)));
                    float comparisonValue2 = ((abs(comparisonValue) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue;
                    float comparisonValue6 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue2, comparisonValue6, 0.25), vec3(comparisonValue2, comparisonValue6, 0.25)));
                    branchMergedValue3 = comparisonValue2 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue27 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue26);
                float scalarValue2 = fract(productValue27);
                float comparisonValue4;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue7.x;
                float scalarValue4 = sampledTextureValue7.y;
                float scalarValue5 = sampledTextureValue7.z;
                float scalarValue6 = sampledTextureValue7.w;
                float sumValue = fract(productValue26 + 0.5);
                float sumValue1 = fract(productValue27 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue28 - productValue29;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue30 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue30, 0.25), vec3(sumValue2, productValue30, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue30;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue16 = branchMergedValue;
            intermediateValue17 = branchMergedValue1;
            intermediateValue18 = branchMergedValue2;
#endif
        }
        else
        {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue20;
            if (comparisonValue9)
            {
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue44 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue45 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue45 - 0.5) < 0.0625) ? (((productValue45 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue16.x;
                float scalarValue10 = sampledTextureValue16.y;
                float scalarValue11 = sampledTextureValue16.z;
                float scalarValue12 = sampledTextureValue16.w;
                float multiplyAddValue21 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue22 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue22 > 0.5;
                bool conditionValue4 = multiplyAddValue21 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue21 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue21 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue22 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue22 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue20 = true;
                productValue17 = inverseLengthValue7 * comparisonValue18;
                productValue16 = inverseLengthValue7 * comparisonValue19;
                productValue15 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue20;
                if (comparisonValue7)
                {
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue18.x;
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? sampledTextureValue18.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue23 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue24 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue25 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue23) : multiplyAddValue23;
                    float multiplyAddValue26 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                    bool comparisonValue22 = abs(multiplyAddValue25) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue25 : 0.0, comparisonValue23 ? multiplyAddValue26 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue25) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue26) : 0.0;
                    productValue20 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue14 = intermediateValue34;
                    comparisonValue15 = intermediateValue34;
                    productValue20 = intermediateValue34;
                }
                intermediateValue20 = comparisonValue7;
                productValue17 = comparisonValue14;
                productValue16 = comparisonValue15;
                productValue15 = productValue20;
            }
            multiplyAddValue10 = productValue15;
            multiplyAddValue11 = productValue16;
            multiplyAddValue12 = productValue17;
            intermediateValue19 = intermediateValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue23;
            if (comparisonValue9)
            {
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue44 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue45 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue45 - 0.5) < 0.0625) ? (((productValue45 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue16.x;
                float scalarValue10 = sampledTextureValue16.y;
                float scalarValue11 = sampledTextureValue16.z;
                float scalarValue12 = sampledTextureValue16.w;
                float multiplyAddValue21 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue22 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue22 > 0.5;
                bool conditionValue4 = multiplyAddValue21 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue21 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue21 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue22 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue22 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue23 = true;
                productValue15 = inverseLengthValue7 * comparisonValue18;
                productValue14 = inverseLengthValue7 * comparisonValue19;
                productValue13 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue18;
                if (comparisonValue7)
                {
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue18.x;
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? sampledTextureValue18.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue23 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue24 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue25 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue23) : multiplyAddValue23;
                    float multiplyAddValue26 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                    bool comparisonValue22 = abs(multiplyAddValue25) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue25 : 0.0, comparisonValue23 ? multiplyAddValue26 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue25) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue26) : 0.0;
                    productValue18 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue14 = intermediateValue37;
                    comparisonValue15 = intermediateValue37;
                    productValue18 = intermediateValue37;
                }
                intermediateValue23 = comparisonValue7;
                productValue15 = comparisonValue14;
                productValue14 = comparisonValue15;
                productValue13 = productValue18;
            }
            multiplyAddValue13 = productValue13;
            multiplyAddValue14 = productValue14;
            multiplyAddValue15 = productValue15;
            intermediateValue22 = intermediateValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue20;
            if (comparisonValue30)
            {
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue44 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue45 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue45 - 0.5) < 0.0625) ? (((productValue45 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue16.x;
                float scalarValue10 = sampledTextureValue16.y;
                float scalarValue11 = sampledTextureValue16.z;
                float scalarValue12 = sampledTextureValue16.w;
                float multiplyAddValue21 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue22 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue22 > 0.5;
                bool conditionValue4 = multiplyAddValue21 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue21 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue21 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue22 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue22 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue20 = true;
                productValue18 = inverseLengthValue7 * comparisonValue18;
                productValue17 = inverseLengthValue7 * comparisonValue19;
                productValue16 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue21;
                if (comparisonValue28)
                {
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue18.x;
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? sampledTextureValue18.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue23 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue24 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue25 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue23) : multiplyAddValue23;
                    float multiplyAddValue26 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                    bool comparisonValue22 = abs(multiplyAddValue25) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue25 : 0.0, comparisonValue23 ? multiplyAddValue26 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue25) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue26) : 0.0;
                    productValue21 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue14 = intermediateValue34;
                    comparisonValue15 = intermediateValue34;
                    productValue21 = intermediateValue34;
                }
                intermediateValue20 = comparisonValue28;
                productValue18 = comparisonValue14;
                productValue17 = comparisonValue15;
                productValue16 = productValue21;
            }
            multiplyAddValue13 = productValue16;
            multiplyAddValue14 = productValue17;
            multiplyAddValue15 = productValue18;
            intermediateValue19 = intermediateValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue24;
            if (comparisonValue30)
            {
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue44 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue45 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue45 - 0.5) < 0.0625) ? (((productValue45 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue16.x;
                float scalarValue10 = sampledTextureValue16.y;
                float scalarValue11 = sampledTextureValue16.z;
                float scalarValue12 = sampledTextureValue16.w;
                float multiplyAddValue21 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue22 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue22 > 0.5;
                bool conditionValue4 = multiplyAddValue21 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue21 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue21 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue22 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue22 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue24 = true;
                productValue15 = inverseLengthValue7 * comparisonValue18;
                productValue14 = inverseLengthValue7 * comparisonValue19;
                productValue13 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue18;
                if (comparisonValue28)
                {
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue18.x;
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? sampledTextureValue18.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue23 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue24 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue25 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue23) : multiplyAddValue23;
                    float multiplyAddValue26 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                    bool comparisonValue22 = abs(multiplyAddValue25) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue25 : 0.0, comparisonValue23 ? multiplyAddValue26 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue25) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue26) : 0.0;
                    productValue18 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue14 = intermediateValue38;
                    comparisonValue15 = intermediateValue38;
                    productValue18 = intermediateValue38;
                }
                intermediateValue24 = comparisonValue28;
                productValue15 = comparisonValue14;
                productValue14 = comparisonValue15;
                productValue13 = productValue18;
            }
            multiplyAddValue17 = productValue13;
            multiplyAddValue18 = productValue14;
            multiplyAddValue19 = productValue15;
            intermediateValue23 = intermediateValue24;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue17;
            float productValue18;
            float productValue19;
            bool intermediateValue21;
            if (comparisonValue30)
            {
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue44 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue45 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue45 - 0.5) < 0.0625) ? (((productValue45 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue16.x;
                float scalarValue10 = sampledTextureValue16.y;
                float scalarValue11 = sampledTextureValue16.z;
                float scalarValue12 = sampledTextureValue16.w;
                float multiplyAddValue21 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue22 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue22 > 0.5;
                bool conditionValue4 = multiplyAddValue21 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue21 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue21 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue22 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue22 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue21 = true;
                productValue19 = inverseLengthValue7 * comparisonValue18;
                productValue18 = inverseLengthValue7 * comparisonValue19;
                productValue17 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue22;
                if (comparisonValue28)
                {
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue18.x;
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? sampledTextureValue18.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue23 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue24 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue25 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue23) : multiplyAddValue23;
                    float multiplyAddValue26 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                    bool comparisonValue22 = abs(multiplyAddValue25) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue25 : 0.0, comparisonValue23 ? multiplyAddValue26 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue25) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue26) : 0.0;
                    productValue22 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue14 = intermediateValue35;
                    comparisonValue15 = intermediateValue35;
                    productValue22 = intermediateValue35;
                }
                intermediateValue21 = comparisonValue28;
                productValue19 = comparisonValue14;
                productValue18 = comparisonValue15;
                productValue17 = productValue22;
            }
            multiplyAddValue13 = productValue17;
            multiplyAddValue14 = productValue18;
            multiplyAddValue15 = productValue19;
            intermediateValue20 = intermediateValue21;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue23;
            if (comparisonValue30)
            {
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue44 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue45 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue45 - 0.5) < 0.0625) ? (((productValue45 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue16.x;
                float scalarValue10 = sampledTextureValue16.y;
                float scalarValue11 = sampledTextureValue16.z;
                float scalarValue12 = sampledTextureValue16.w;
                float multiplyAddValue21 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue22 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue22 > 0.5;
                bool conditionValue4 = multiplyAddValue21 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue21 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue21 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue22 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue22 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue23 = true;
                productValue18 = inverseLengthValue7 * comparisonValue18;
                productValue17 = inverseLengthValue7 * comparisonValue19;
                productValue16 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue21;
                if (comparisonValue28)
                {
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue18.x;
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? sampledTextureValue18.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue23 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue24 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue25 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue23) : multiplyAddValue23;
                    float multiplyAddValue26 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                    bool comparisonValue22 = abs(multiplyAddValue25) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue25 : 0.0, comparisonValue23 ? multiplyAddValue26 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue25) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue26) : 0.0;
                    productValue21 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue14 = intermediateValue37;
                    comparisonValue15 = intermediateValue37;
                    productValue21 = intermediateValue37;
                }
                intermediateValue23 = comparisonValue28;
                productValue18 = comparisonValue14;
                productValue17 = comparisonValue15;
                productValue16 = productValue21;
            }
            multiplyAddValue15 = productValue16;
            multiplyAddValue16 = productValue17;
            multiplyAddValue17 = productValue18;
            intermediateValue22 = intermediateValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue13 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue14 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue8.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue16 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue18 = (sampledTextureValue8.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue17 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue18 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue8.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue14 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue8.z * 2.0) + (-1.0);
#endif
        }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue25 = intermediateValue19 ? multiplyAddValue10 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue27 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue25, intermediateValue19 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue12, intermediateValue19 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue28 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue25, intermediateValue19 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue12, intermediateValue19 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue29 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue25, intermediateValue19 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue12, intermediateValue19 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue11) : 0.0) : 0.0);
        vec3 vectorValue4 = vec3(multiplyAddValue27, multiplyAddValue28, multiplyAddValue29);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        productValue4 = inverseLengthValue12 * multiplyAddValue29;
        productValue5 = inverseLengthValue12 * multiplyAddValue28;
        productValue6 = inverseLengthValue12 * multiplyAddValue27;
    }
    else
    {
        productValue4 = varyingNormal0.z;
        productValue5 = varyingNormal0.y;
        productValue6 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue27 = intermediateValue22 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue40 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue27, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue15, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue41 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue27, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue15, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue42 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue27, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue15, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue6 = vec3(multiplyAddValue40, multiplyAddValue41, multiplyAddValue42);
        float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
        productValue2 = inverseLengthValue17 * multiplyAddValue42;
        productValue3 = inverseLengthValue17 * multiplyAddValue41;
        productValue4 = inverseLengthValue17 * multiplyAddValue40;
    }
    else
    {
        productValue2 = varyingNormal0.z;
        productValue3 = varyingNormal0.y;
        productValue4 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue31 = intermediateValue19 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue57 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue31, intermediateValue19 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue15, intermediateValue19 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue58 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue31, intermediateValue19 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue15, intermediateValue19 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue59 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue31, intermediateValue19 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue15, intermediateValue19 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue8 = vec3(multiplyAddValue57, multiplyAddValue58, multiplyAddValue59);
        float inverseLengthValue22 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
        productValue5 = inverseLengthValue22 * multiplyAddValue59;
        productValue6 = inverseLengthValue22 * multiplyAddValue58;
        productValue7 = inverseLengthValue22 * multiplyAddValue57;
    }
    else
    {
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue33 = intermediateValue23 ? multiplyAddValue17 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue71 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue33, intermediateValue23 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue19, intermediateValue23 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue72 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue33, intermediateValue23 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue19, intermediateValue23 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue73 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue33, intermediateValue23 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue19, intermediateValue23 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue18) : 0.0) : 0.0);
        vec3 vectorValue10 = vec3(multiplyAddValue71, multiplyAddValue72, multiplyAddValue73);
        float inverseLengthValue24 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
        productValue2 = inverseLengthValue24 * multiplyAddValue73;
        productValue3 = inverseLengthValue24 * multiplyAddValue72;
        productValue4 = inverseLengthValue24 * multiplyAddValue71;
    }
    else
    {
        productValue2 = varyingNormal0.z;
        productValue3 = varyingNormal0.y;
        productValue4 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue34 = intermediateValue20 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue83 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue34, intermediateValue20 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue15, intermediateValue20 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue84 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue34, intermediateValue20 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue15, intermediateValue20 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue85 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue34, intermediateValue20 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue15, intermediateValue20 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue11 = vec3(multiplyAddValue83, multiplyAddValue84, multiplyAddValue85);
        float inverseLengthValue28 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
        productValue6 = inverseLengthValue28 * multiplyAddValue85;
        productValue7 = inverseLengthValue28 * multiplyAddValue84;
        productValue8 = inverseLengthValue28 * multiplyAddValue83;
    }
    else
    {
        productValue6 = varyingNormal0.z;
        productValue7 = varyingNormal0.y;
        productValue8 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue35 = intermediateValue22 ? multiplyAddValue15 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue91 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue35, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue17, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue92 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue35, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue17, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue93 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue35, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue17, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue16) : 0.0) : 0.0);
        vec3 vectorValue13 = vec3(multiplyAddValue91, multiplyAddValue92, multiplyAddValue93);
        float inverseLengthValue30 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
        productValue5 = inverseLengthValue30 * multiplyAddValue93;
        productValue6 = inverseLengthValue30 * multiplyAddValue92;
        productValue7 = inverseLengthValue30 * multiplyAddValue91;
    }
    else
    {
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue13;
        float multiplyAddValue = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue15, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue14, inverseLengthValue4 * varyingTangent0.x));
        float multiplyAddValue1 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue15, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue14, inverseLengthValue4 * varyingTangent0.y));
        float multiplyAddValue2 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue15, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue14, inverseLengthValue4 * varyingTangent0.z));
        float inverseLengthValue5 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue6 = inverseLengthValue5 * multiplyAddValue;
        intermediateValue7 = inverseLengthValue5 * multiplyAddValue1;
        intermediateValue8 = inverseLengthValue5 * multiplyAddValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue14 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue16;
        float multiplyAddValue34 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue17, inverseLengthValue14 * varyingTangent0.x));
        float multiplyAddValue35 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue17, inverseLengthValue14 * varyingTangent0.y));
        float multiplyAddValue36 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue17, inverseLengthValue14 * varyingTangent0.z));
        float inverseLengthValue15 = inversesqrt(dot(vec3(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36), vec3(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36)));
        intermediateValue9 = inverseLengthValue15 * multiplyAddValue34;
        intermediateValue10 = inverseLengthValue15 * multiplyAddValue35;
        intermediateValue11 = inverseLengthValue15 * multiplyAddValue36;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue13;
        float multiplyAddValue = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue15, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue14, inverseLengthValue4 * varyingTangent0.x));
        float multiplyAddValue1 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue15, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue14, inverseLengthValue4 * varyingTangent0.y));
        float multiplyAddValue2 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue15, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue14, inverseLengthValue4 * varyingTangent0.z));
        float inverseLengthValue5 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue6 = inverseLengthValue5 * multiplyAddValue;
        intermediateValue7 = inverseLengthValue5 * multiplyAddValue1;
        intermediateValue8 = inverseLengthValue5 * multiplyAddValue2;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(intermediateValue6, intermediateValue7, intermediateValue8), vec3(intermediateValue6, intermediateValue7, intermediateValue8)));
    float productValue31 = inverseLengthValue6 * intermediateValue6;
    float productValue32 = inverseLengthValue6 * intermediateValue7;
    float productValue33 = inverseLengthValue6 * intermediateValue8;
    float quotientValue = 1.0 / ((abs(productValue32) + abs(productValue31)) + abs(productValue33));
    float productValue34 = quotientValue * productValue31;
    float productValue35 = quotientValue * productValue32;
    bool conditionValue2 = productValue33 < 0.0;
    float multiplyAddValue43 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue44 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue10;
    float productValue16;
    float productValue17;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue82 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue10 = spvNClamp(productValue82, 0.0, 1.0);
        productValue16 = spvNClamp(((productValue82 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue82, 0.0, 1.0);
        productValue17 = spvNClamp((((productValue82 * productValue82) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue82, 0.0, 1.0);
    }
    else
    {
        intermediateValue10 = fragmentVectorConstants1.packedValues[11u].x;
        productValue16 = fragmentVectorConstants1.packedValues[11u].y;
        productValue17 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue19 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue17;
        float multiplyAddValue45 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue19, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue18, inverseLengthValue19 * varyingTangent0.x));
        float multiplyAddValue46 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue19, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue18, inverseLengthValue19 * varyingTangent0.y));
        float multiplyAddValue47 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue19, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue18, inverseLengthValue19 * varyingTangent0.z));
        float inverseLengthValue20 = inversesqrt(dot(vec3(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47), vec3(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47)));
        intermediateValue10 = inverseLengthValue20 * multiplyAddValue45;
        intermediateValue11 = inverseLengthValue20 * multiplyAddValue46;
        intermediateValue12 = inverseLengthValue20 * multiplyAddValue47;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue21 = inversesqrt(dot(vec3(intermediateValue10, intermediateValue11, intermediateValue12), vec3(intermediateValue10, intermediateValue11, intermediateValue12)));
    float productValue94 = inverseLengthValue21 * intermediateValue10;
    float productValue95 = inverseLengthValue21 * intermediateValue11;
    float productValue96 = inverseLengthValue21 * intermediateValue12;
    float quotientValue4 = 1.0 / ((abs(productValue95) + abs(productValue94)) + abs(productValue96));
    float productValue97 = quotientValue4 * productValue94;
    float productValue98 = quotientValue4 * productValue95;
    bool conditionValue8 = productValue96 < 0.0;
    float multiplyAddValue43 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue44 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue14;
    float productValue17;
    float productValue18;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue82 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue14 = spvNClamp(productValue82, 0.0, 1.0);
        productValue17 = spvNClamp(((productValue82 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue82, 0.0, 1.0);
        productValue18 = spvNClamp((((productValue82 * productValue82) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue82, 0.0, 1.0);
    }
    else
    {
        intermediateValue14 = fragmentVectorConstants1.packedValues[11u].x;
        productValue17 = fragmentVectorConstants1.packedValues[11u].y;
        productValue18 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue25 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue14;
        float multiplyAddValue74 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue16, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue15, inverseLengthValue25 * varyingTangent0.x));
        float multiplyAddValue75 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue16, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue15, inverseLengthValue25 * varyingTangent0.y));
        float multiplyAddValue76 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue16, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue15, inverseLengthValue25 * varyingTangent0.z));
        float inverseLengthValue26 = inversesqrt(dot(vec3(multiplyAddValue74, multiplyAddValue75, multiplyAddValue76), vec3(multiplyAddValue74, multiplyAddValue75, multiplyAddValue76)));
        intermediateValue7 = inverseLengthValue26 * multiplyAddValue74;
        intermediateValue8 = inverseLengthValue26 * multiplyAddValue75;
        intermediateValue9 = inverseLengthValue26 * multiplyAddValue76;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue27 = inversesqrt(dot(vec3(intermediateValue7, intermediateValue8, intermediateValue9), vec3(intermediateValue7, intermediateValue8, intermediateValue9)));
    float productValue124 = inverseLengthValue27 * intermediateValue7;
    float productValue125 = inverseLengthValue27 * intermediateValue8;
    float productValue126 = inverseLengthValue27 * intermediateValue9;
    float quotientValue6 = 1.0 / ((abs(productValue125) + abs(productValue124)) + abs(productValue126));
    float productValue127 = quotientValue6 * productValue124;
    float productValue128 = quotientValue6 * productValue125;
    bool conditionValue10 = productValue126 < 0.0;
    float multiplyAddValue43 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue44 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue11;
    float productValue17;
    float productValue18;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue82 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue11 = spvNClamp(productValue82, 0.0, 1.0);
        productValue17 = spvNClamp(((productValue82 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue82, 0.0, 1.0);
        productValue18 = spvNClamp((((productValue82 * productValue82) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue82, 0.0, 1.0);
    }
    else
    {
        intermediateValue11 = fragmentVectorConstants1.packedValues[11u].x;
        productValue17 = fragmentVectorConstants1.packedValues[11u].y;
        productValue18 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue14 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue16;
        float multiplyAddValue34 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue17, inverseLengthValue14 * varyingTangent0.x));
        float multiplyAddValue35 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue17, inverseLengthValue14 * varyingTangent0.y));
        float multiplyAddValue36 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue17, inverseLengthValue14 * varyingTangent0.z));
        float inverseLengthValue15 = inversesqrt(dot(vec3(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36), vec3(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36)));
        intermediateValue9 = inverseLengthValue15 * multiplyAddValue34;
        intermediateValue10 = inverseLengthValue15 * multiplyAddValue35;
        intermediateValue11 = inverseLengthValue15 * multiplyAddValue36;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue16 = inversesqrt(dot(vec3(intermediateValue9, intermediateValue10, intermediateValue11), vec3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue58 = inverseLengthValue16 * intermediateValue9;
    float productValue59 = inverseLengthValue16 * intermediateValue10;
    float productValue60 = inverseLengthValue16 * intermediateValue11;
    float quotientValue2 = 1.0 / ((abs(productValue59) + abs(productValue58)) + abs(productValue60));
    float productValue61 = quotientValue2 * productValue58;
    float productValue62 = quotientValue2 * productValue59;
    bool conditionValue6 = productValue60 < 0.0;
    float multiplyAddValue43 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue44 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue13;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue82 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue13 = spvNClamp(productValue82, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue82 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue82, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue82 * productValue82) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue82, 0.0, 1.0);
    }
    else
    {
        intermediateValue13 = fragmentVectorConstants1.packedValues[11u].x;
        productValue18 = fragmentVectorConstants1.packedValues[11u].y;
        productValue19 = fragmentVectorConstants1.packedValues[11u].z;
#endif
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue14) ? fma(intermediateValue14, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(productValue6, productValue5, productValue4);
    float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue46 = inverseLengthValue13 * productValue6;
    float productValue47 = inverseLengthValue13 * productValue5;
    float productValue48 = inverseLengthValue13 * productValue4;
    float quotientValue1 = 1.0 / (abs(productValue48) + (abs(productValue47) + abs(productValue46)));
    float productValue49 = quotientValue1 * productValue46;
    float productValue50 = quotientValue1 * productValue47;
    bool conditionValue5 = productValue48 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue49 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue50))) : productValue49;
    fragmentColor2.y = conditionValue5 ? (((productValue50 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue49))) : productValue50;
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[35u], sumValue5, fma(fragmentScalarConstants1.packedValues[27u], sumValue3, sumValue4 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue30, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue31, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue30, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue31, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float productValue51 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    float comparisonValue26 = (bitwiseValue1 ? spvNMin(productValue51, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue32 = (bitwiseValue1 ? spvNMin(fma(fma(productValue51, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue51, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue33 = (bitwiseValue1 ? spvNMin(fma(productValue51 * productValue51, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue51, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue52 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue32, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue33, comparisonValue26)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue32 / productValue52, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue26 / productValue52, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue33 / productValue52, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue52, 0.0, 1.0) * 255.0);
    uint productValue53 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = (((productValue53 & 2u) != 0u) ? 512u : 0u) + ((((productValue53 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue17) ? fma(intermediateValue17, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(productValue4, productValue3, productValue2);
    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue67 = inverseLengthValue18 * productValue4;
    float productValue68 = inverseLengthValue18 * productValue3;
    float productValue69 = inverseLengthValue18 * productValue2;
    float quotientValue3 = 1.0 / (abs(productValue69) + (abs(productValue68) + abs(productValue67)));
    float productValue70 = quotientValue3 * productValue67;
    float productValue71 = quotientValue3 * productValue68;
    bool conditionValue7 = productValue69 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue70 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue71))) : productValue70;
    fragmentColor2.y = conditionValue7 ? (((productValue71 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue70))) : productValue71;
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[35u], sumValue5, fma(fragmentScalarConstants1.packedValues[27u], sumValue3, sumValue4 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue30, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue31, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue30, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue31, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float productValue51 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    float comparisonValue26 = (bitwiseValue1 ? spvNMin(productValue51, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue32 = (bitwiseValue1 ? spvNMin(fma(fma(productValue51, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue51, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue33 = (bitwiseValue1 ? spvNMin(fma(productValue51 * productValue51, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue51, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue52 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue32, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue33, comparisonValue26)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue32 / productValue52, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue26 / productValue52, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue33 / productValue52, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue52, 0.0, 1.0) * 255.0);
    uint productValue53 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = (((productValue53 & 2u) != 0u) ? 512u : 0u) + ((((productValue53 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue18, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue14) ? fma(intermediateValue14, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue9 = vec3(productValue7, productValue6, productValue5);
    float inverseLengthValue23 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
    float productValue106 = inverseLengthValue23 * productValue7;
    float productValue107 = inverseLengthValue23 * productValue6;
    float productValue108 = inverseLengthValue23 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue108) + (abs(productValue107) + abs(productValue106)));
    float productValue109 = quotientValue5 * productValue106;
    float productValue110 = quotientValue5 * productValue107;
    bool conditionValue9 = productValue108 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue9 ? (((productValue109 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue110))) : productValue109;
    fragmentColor2.y = conditionValue9 ? (((productValue110 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue109))) : productValue110;
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue60, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue61, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue60, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue61, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue111 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue62 = (bitwiseValue3 ? spvNMin(fma(fma(productValue111, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue63 = (bitwiseValue3 ? spvNMin(fma(productValue111 * productValue111, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue112 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue62, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue63, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue62 / productValue112, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue112, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue63 / productValue112, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue112, 0.0, 1.0) * 255.0);
    uint productValue113 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue113 & 2u) != 0u) ? 512u : 0u) + ((((productValue113 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue18) ? fma(intermediateValue18, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(productValue4, productValue3, productValue2);
    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue67 = inverseLengthValue18 * productValue4;
    float productValue68 = inverseLengthValue18 * productValue3;
    float productValue69 = inverseLengthValue18 * productValue2;
    float quotientValue3 = 1.0 / (abs(productValue69) + (abs(productValue68) + abs(productValue67)));
    float productValue70 = quotientValue3 * productValue67;
    float productValue71 = quotientValue3 * productValue68;
    bool conditionValue7 = productValue69 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue70 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue71))) : productValue70;
    fragmentColor2.y = conditionValue7 ? (((productValue71 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue70))) : productValue71;
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue60, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue61, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue60, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue61, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue111 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue62 = (bitwiseValue3 ? spvNMin(fma(fma(productValue111, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue63 = (bitwiseValue3 ? spvNMin(fma(productValue111 * productValue111, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue112 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue62, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue63, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue62 / productValue112, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue112, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue63 / productValue112, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue112, 0.0, 1.0) * 255.0);
    uint productValue113 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue113 & 2u) != 0u) ? 512u : 0u) + ((((productValue113 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue20, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue15) ? fma(intermediateValue15, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue12 = vec3(productValue8, productValue7, productValue6);
    float inverseLengthValue29 = inversesqrt(rdDot3Precise2(vectorValue12, vectorValue12));
    float productValue134 = inverseLengthValue29 * productValue8;
    float productValue135 = inverseLengthValue29 * productValue7;
    float productValue136 = inverseLengthValue29 * productValue6;
    float quotientValue7 = 1.0 / (abs(productValue136) + (abs(productValue135) + abs(productValue134)));
    float productValue137 = quotientValue7 * productValue134;
    float productValue138 = quotientValue7 * productValue135;
    bool conditionValue11 = productValue136 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? (((productValue137 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue138))) : productValue137;
    fragmentColor2.y = conditionValue11 ? (((productValue138 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue137))) : productValue138;
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue60, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue61, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue60, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue61, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue111 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue62 = (bitwiseValue3 ? spvNMin(fma(fma(productValue111, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue63 = (bitwiseValue3 ? spvNMin(fma(productValue111 * productValue111, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue112 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue62, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue63, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue62 / productValue112, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue112, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue63 / productValue112, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue112, 0.0, 1.0) * 255.0);
    uint productValue113 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue113 & 2u) != 0u) ? 512u : 0u) + ((((productValue113 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue17, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue17) ? fma(intermediateValue17, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue9 = vec3(productValue7, productValue6, productValue5);
    float inverseLengthValue23 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
    float productValue106 = inverseLengthValue23 * productValue7;
    float productValue107 = inverseLengthValue23 * productValue6;
    float productValue108 = inverseLengthValue23 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue108) + (abs(productValue107) + abs(productValue106)));
    float productValue109 = quotientValue5 * productValue106;
    float productValue110 = quotientValue5 * productValue107;
    bool conditionValue9 = productValue108 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue9 ? (((productValue109 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue110))) : productValue109;
    fragmentColor2.y = conditionValue9 ? (((productValue110 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue109))) : productValue110;
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue60, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue61, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue60, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue61, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue111 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue62 = (bitwiseValue3 ? spvNMin(fma(fma(productValue111, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue63 = (bitwiseValue3 ? spvNMin(fma(productValue111 * productValue111, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue112 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue62, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue63, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue62 / productValue112, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue112, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue63 / productValue112, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue112, 0.0, 1.0) * 255.0);
    uint productValue113 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue113 & 2u) != 0u) ? 512u : 0u) + ((((productValue113 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue18, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(intermediateValue6, intermediateValue7, intermediateValue8), vec3(intermediateValue6, intermediateValue7, intermediateValue8)));
    float productValue31 = inverseLengthValue6 * intermediateValue6;
    float productValue32 = inverseLengthValue6 * intermediateValue7;
    float productValue33 = inverseLengthValue6 * intermediateValue8;
    float quotientValue = 1.0 / ((abs(productValue32) + abs(productValue31)) + abs(productValue33));
    float productValue34 = quotientValue * productValue31;
    float productValue35 = quotientValue * productValue32;
    bool conditionValue2 = productValue33 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue10;
    float productValue12;
    float productValue13;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue36 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue10 = spvNClamp(productValue36, 0.0, 1.0);
        productValue12 = spvNClamp(((productValue36 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue36, 0.0, 1.0);
        productValue13 = spvNClamp((((productValue36 * productValue36) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue36, 0.0, 1.0);
    }
    else
    {
        intermediateValue10 = fragmentVectorConstants1.packedValues[10u].x;
        productValue12 = fragmentVectorConstants1.packedValues[10u].y;
        productValue13 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue37 = intermediateValue10 * 0.16666667163372039794921875;
    float productValue38 = productValue12 * 0.16666667163372039794921875;
    float productValue39 = productValue13 * 0.16666667163372039794921875;
    float productValue40 = ceil(spvNClamp(spvNMax(spvNMax(productValue37, productValue39), spvNMax(productValue38, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue3, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue37 / productValue40, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue38 / productValue40, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue39 / productValue40, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue40, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[5u].x - productValue) * fragmentVectorConstants1.packedValues[5u].w) + productValue) + (productValue10 * productValue10);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[5u].y - productValue1) * fragmentVectorConstants1.packedValues[5u].w) + productValue1) + (productValue11 * productValue11);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[5u].z - productValue9) * fragmentVectorConstants1.packedValues[5u].w) + productValue9) + (productValue23 * productValue23);
    fragmentColor1.w = (intermediateValue2 > intermediateValue5) ? ((intermediateValue2 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue5 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue34 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue35))) : productValue34;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue34)) * ((productValue35 < 0.0) ? (-1.0) : 1.0)) : productValue35;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue16 = inversesqrt(dot(vec3(intermediateValue9, intermediateValue10, intermediateValue11), vec3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue58 = inverseLengthValue16 * intermediateValue9;
    float productValue59 = inverseLengthValue16 * intermediateValue10;
    float productValue60 = inverseLengthValue16 * intermediateValue11;
    float quotientValue2 = 1.0 / ((abs(productValue59) + abs(productValue58)) + abs(productValue60));
    float productValue61 = quotientValue2 * productValue58;
    float productValue62 = quotientValue2 * productValue59;
    bool conditionValue6 = productValue60 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue13;
    float productValue13;
    float productValue14;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue36 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue13 = spvNClamp(productValue36, 0.0, 1.0);
        productValue13 = spvNClamp(((productValue36 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue36, 0.0, 1.0);
        productValue14 = spvNClamp((((productValue36 * productValue36) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue36, 0.0, 1.0);
    }
    else
    {
        intermediateValue13 = fragmentVectorConstants1.packedValues[10u].x;
        productValue13 = fragmentVectorConstants1.packedValues[10u].y;
        productValue14 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue63 = intermediateValue13 * 0.16666667163372039794921875;
    float productValue39 = productValue13 * 0.16666667163372039794921875;
    float productValue64 = productValue14 * 0.16666667163372039794921875;
    float productValue65 = ceil(spvNClamp(spvNMax(spvNMax(productValue63, productValue64), spvNMax(productValue39, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue63 / productValue65, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue39 / productValue65, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue64 / productValue65, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue65, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[5u].x - productValue55) * fragmentVectorConstants1.packedValues[5u].w) + productValue55) + (productValue10 * productValue10);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[5u].y - productValue56) * fragmentVectorConstants1.packedValues[5u].w) + productValue56) + (productValue11 * productValue11);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[5u].z - productValue57) * fragmentVectorConstants1.packedValues[5u].w) + productValue57) + (productValue23 * productValue23);
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue8 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue61 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue62))) : productValue61;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue61)) * ((productValue62 < 0.0) ? (-1.0) : 1.0)) : productValue62;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue37 = intermediateValue10 * 0.16666667163372039794921875;
    float productValue83 = productValue16 * 0.16666667163372039794921875;
    float productValue84 = productValue17 * 0.16666667163372039794921875;
    float productValue85 = ceil(spvNClamp(spvNMax(spvNMax(productValue37, productValue84), spvNMax(productValue83, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue3, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue37 / productValue85, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue83 / productValue85, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue84 / productValue85, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue85, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[6u].x - productValue76) * fragmentVectorConstants1.packedValues[6u].w) + productValue76) + (productValue79 * productValue79);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[6u].y - productValue77) * fragmentVectorConstants1.packedValues[6u].w) + productValue77) + (productValue80 * productValue80);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[6u].z - productValue78) * fragmentVectorConstants1.packedValues[6u].w) + productValue78) + (productValue81 * productValue81);
    fragmentColor1.w = (intermediateValue2 > intermediateValue5) ? ((intermediateValue2 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue5 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue34 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue35))) : productValue34;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue34)) * ((productValue35 < 0.0) ? (-1.0) : 1.0)) : productValue35;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue43) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue44)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue43) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue44)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue99 = intermediateValue14 * 0.16666667163372039794921875;
    float productValue84 = productValue17 * 0.16666667163372039794921875;
    float productValue100 = productValue18 * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNClamp(spvNMax(spvNMax(productValue99, productValue100), spvNMax(productValue84, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue99 / productValue101, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue84 / productValue101, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue100 / productValue101, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[6u].x - productValue91) * fragmentVectorConstants1.packedValues[6u].w) + productValue91) + (productValue79 * productValue79);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[6u].y - productValue92) * fragmentVectorConstants1.packedValues[6u].w) + productValue92) + (productValue80 * productValue80);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[6u].z - productValue93) * fragmentVectorConstants1.packedValues[6u].w) + productValue93) + (productValue81 * productValue81);
    fragmentColor1.w = (intermediateValue6 > intermediateValue9) ? ((intermediateValue6 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue9 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue8 ? (((productValue97 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue98))) : productValue97;
    fragmentColor2.y = conditionValue8 ? ((1.0 - abs(productValue97)) * ((productValue98 < 0.0) ? (-1.0) : 1.0)) : productValue98;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue43) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue44)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue43) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue44)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue129 = intermediateValue11 * 0.16666667163372039794921875;
    float productValue84 = productValue17 * 0.16666667163372039794921875;
    float productValue100 = productValue18 * 0.16666667163372039794921875;
    float productValue130 = ceil(spvNClamp(spvNMax(spvNMax(productValue129, productValue100), spvNMax(productValue84, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue129 / productValue130, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue84 / productValue130, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue100 / productValue130, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue130, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[6u].x - productValue118) * fragmentVectorConstants1.packedValues[6u].w) + productValue118) + (productValue121 * productValue121);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[6u].y - productValue119) * fragmentVectorConstants1.packedValues[6u].w) + productValue119) + (productValue122 * productValue122);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[6u].z - productValue120) * fragmentVectorConstants1.packedValues[6u].w) + productValue120) + (productValue123 * productValue123);
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue10 ? (((productValue127 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue128))) : productValue127;
    fragmentColor2.y = conditionValue10 ? ((1.0 - abs(productValue127)) * ((productValue128 < 0.0) ? (-1.0) : 1.0)) : productValue128;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue43) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue44)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue43) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue44)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue63 = intermediateValue13 * 0.16666667163372039794921875;
    float productValue100 = productValue18 * 0.16666667163372039794921875;
    float productValue148 = productValue19 * 0.16666667163372039794921875;
    float productValue149 = ceil(spvNClamp(spvNMax(spvNMax(productValue63, productValue148), spvNMax(productValue100, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue63 / productValue149, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue100 / productValue149, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue148 / productValue149, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue149, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[6u].x - productValue145) * fragmentVectorConstants1.packedValues[6u].w) + productValue145) + (productValue121 * productValue121);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[6u].y - productValue146) * fragmentVectorConstants1.packedValues[6u].w) + productValue146) + (productValue122 * productValue122);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[6u].z - productValue147) * fragmentVectorConstants1.packedValues[6u].w) + productValue147) + (productValue123 * productValue123);
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue8 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue61 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue62))) : productValue61;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue61)) * ((productValue62 < 0.0) ? (-1.0) : 1.0)) : productValue62;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue43) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue44)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue43) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue44)) * 0.5;
#endif
}
