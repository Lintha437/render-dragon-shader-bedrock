#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPrepass / GeometryPrepass / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 0
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

#include "../../include/materials/ActorPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue40 = sampledTextureValue7.x * fragmentVectorConstants1.packedValues[15u].x;
    float productValue41 = sampledTextureValue7.y * fragmentVectorConstants1.packedValues[15u].y;
    float productValue42 = sampledTextureValue7.z * fragmentVectorConstants1.packedValues[15u].z;
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fma(-productValue40, multiplyAddValue5, fragmentVectorConstants1.packedValues[5u].x), productValue40 * multiplyAddValue5);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fma(-productValue41, multiplyAddValue6, fragmentVectorConstants1.packedValues[5u].y), productValue41 * multiplyAddValue6);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fma(-productValue42, multiplyAddValue17, fragmentVectorConstants1.packedValues[5u].z), productValue42 * multiplyAddValue17);
    uint scalarValue7 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    bool comparisonValue7 = (scalarValue7 & 16u) == 16u;
    bool comparisonValue8 = (scalarValue7 & 4u) == 4u;
    bool comparisonValue9 = (scalarValue7 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((scalarValue7 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue17 = sampledTextureValue17.x;
    float scalarValue18 = sampledTextureValue17.y;
    float scalarValue19 = sampledTextureValue17.z;
    bool productValue65 = ((scalarValue19 + (scalarValue18 + scalarValue17)) * (1.0 - sampledTextureValue17.w)) > 0.0;
    float multiplyAddValue34 = productValue65 ? (fma(fragmentVectorConstants1.packedValues[15u].x, sampledTextureValue7.x, -scalarValue17) + scalarValue17) : scalarValue17;
    float multiplyAddValue35 = productValue65 ? (fma(fragmentVectorConstants1.packedValues[15u].y, sampledTextureValue7.y, -scalarValue18) + scalarValue18) : scalarValue18;
    float multiplyAddValue36 = productValue65 ? (fma(fragmentVectorConstants1.packedValues[15u].z, sampledTextureValue7.z, -scalarValue19) + scalarValue19) : scalarValue19;
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue34, multiplyAddValue5, fragmentVectorConstants1.packedValues[5u].x), multiplyAddValue34 * multiplyAddValue5);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue35, multiplyAddValue6, fragmentVectorConstants1.packedValues[5u].y), multiplyAddValue35 * multiplyAddValue6);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue36, multiplyAddValue17, fragmentVectorConstants1.packedValues[5u].z), multiplyAddValue36 * multiplyAddValue17);
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
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue82 = sampledTextureValue7.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue83 = sampledTextureValue7.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue84 = sampledTextureValue7.z * fragmentVectorConstants1.packedValues[16u].z;
    float productValue85 = sampledTextureValue7.w * fragmentVectorConstants1.packedValues[16u].w;
    float multiplyAddValue42 = fma(productValue85, fma(productValue82, fragmentVectorConstants1.packedValues[0u].x, -productValue82), productValue82);
    float multiplyAddValue43 = fma(productValue85, fma(productValue83, fragmentVectorConstants1.packedValues[0u].y, -productValue83), productValue83);
    float multiplyAddValue44 = fma(productValue85, fma(productValue84, fragmentVectorConstants1.packedValues[0u].z, -productValue84), productValue84);
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue46 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue47 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue42, multiplyAddValue45, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue42 * multiplyAddValue45);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue43, multiplyAddValue46, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue43 * multiplyAddValue46);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue44, multiplyAddValue47, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue44 * multiplyAddValue47);
    uint scalarValue21 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue21 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue21 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue21 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((scalarValue21 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue17 = sampledTextureValue17.x;
    float scalarValue18 = sampledTextureValue17.y;
    float scalarValue19 = sampledTextureValue17.z;
    float scalarValue23 = sampledTextureValue17.w;
    bool productValue110 = ((1.0 - scalarValue23) * (scalarValue19 + (scalarValue18 + scalarValue17))) > 0.0;
    float multiplyAddValue58 = productValue110 ? (fma(fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue7.x, -scalarValue17) + scalarValue17) : scalarValue17;
    float multiplyAddValue59 = productValue110 ? (fma(fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue7.y, -scalarValue18) + scalarValue18) : scalarValue18;
    float multiplyAddValue60 = productValue110 ? (fma(fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue7.z, -scalarValue19) + scalarValue19) : scalarValue19;
    float multiplyAddValue61 = productValue110 ? (fma(fragmentVectorConstants1.packedValues[16u].w, sampledTextureValue7.w, -scalarValue23) + scalarValue23) : scalarValue23;
    float multiplyAddValue62 = fma(multiplyAddValue61, fma(multiplyAddValue58, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue58), multiplyAddValue58);
    float multiplyAddValue63 = fma(multiplyAddValue61, fma(multiplyAddValue59, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue59), multiplyAddValue59);
    float multiplyAddValue64 = fma(multiplyAddValue61, fma(multiplyAddValue60, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue60), multiplyAddValue60);
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue46 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue47 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue62, multiplyAddValue45, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue62 * multiplyAddValue45);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue63, multiplyAddValue46, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue63 * multiplyAddValue46);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue64, multiplyAddValue47, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue64 * multiplyAddValue47);
    uint scalarValue21 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue21 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue21 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue21 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
    if ((scalarValue21 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue82 = sampledTextureValue7.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue83 = sampledTextureValue7.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue124 = productValue82 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue125 = productValue82 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue126 = productValue82 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue25 = ceil(productValue83);
    float multiplyAddValue71 = fma(scalarValue25, fma(productValue83, fragmentVectorConstants1.packedValues[17u].x, -productValue124), productValue124);
    float multiplyAddValue72 = fma(scalarValue25, fma(productValue83, fragmentVectorConstants1.packedValues[17u].y, -productValue125), productValue125);
    float multiplyAddValue73 = fma(scalarValue25, fma(productValue83, fragmentVectorConstants1.packedValues[17u].z, -productValue126), productValue126);
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue46 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue47 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue71, multiplyAddValue45, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue71 * multiplyAddValue45);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue72, multiplyAddValue46, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue72 * multiplyAddValue46);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue73, multiplyAddValue47, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue73 * multiplyAddValue47);
    uint scalarValue21 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue21 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue21 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue21 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if ((scalarValue21 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue17 = sampledTextureValue17.x;
    float scalarValue18 = sampledTextureValue17.y;
    bool productValue143 = ((1.0 - sampledTextureValue17.w) * (sampledTextureValue17.z + (scalarValue18 + scalarValue17))) > 0.0;
    float multiplyAddValue77 = productValue143 ? (fma(fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue7.x, -scalarValue17) + scalarValue17) : scalarValue17;
    float multiplyAddValue78 = productValue143 ? (fma(fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue7.y, -scalarValue18) + scalarValue18) : scalarValue18;
    float productValue144 = multiplyAddValue77 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue145 = multiplyAddValue77 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue146 = multiplyAddValue77 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue27 = ceil(multiplyAddValue78);
    float multiplyAddValue79 = fma(scalarValue27, fma(multiplyAddValue78, fragmentVectorConstants1.packedValues[17u].x, -productValue144), productValue144);
    float multiplyAddValue80 = fma(scalarValue27, fma(multiplyAddValue78, fragmentVectorConstants1.packedValues[17u].y, -productValue145), productValue145);
    float multiplyAddValue81 = fma(scalarValue27, fma(multiplyAddValue78, fragmentVectorConstants1.packedValues[17u].z, -productValue146), productValue146);
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue46 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue47 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue79, multiplyAddValue45, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue79 * multiplyAddValue45);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue80, multiplyAddValue46, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue80 * multiplyAddValue46);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue81, multiplyAddValue47, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue81 * multiplyAddValue47);
    uint scalarValue21 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue21 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue21 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue21 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if ((scalarValue21 & 1u) == 1u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = (sampledTextureValue.x * fragmentVectorConstants1.packedValues[15u].x) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue1 = (sampledTextureValue.y * fragmentVectorConstants1.packedValues[15u].y) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue12 = (sampledTextureValue.z * fragmentVectorConstants1.packedValues[15u].z) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[0u].x));
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if ((scalarValue & 1u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue16.x;
    float scalarValue15 = sampledTextureValue16.y;
    float scalarValue16 = sampledTextureValue16.z;
    float productValue53 = float((((scalarValue14 + scalarValue15) + scalarValue16) * (1.0 - sampledTextureValue16.w)) > 0.0);
    float productValue54 = ((productValue53 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[15u].x) - scalarValue14)) + scalarValue14) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue55 = ((productValue53 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[15u].y) - scalarValue15)) + scalarValue15) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue56 = ((productValue53 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[15u].z) - scalarValue16)) + scalarValue16) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[0u].x));
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if ((scalarValue & 1u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue71 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue72 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue73 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[16u].z;
    float productValue74 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[16u].w;
    float productValue75 = ((((productValue71 * fragmentVectorConstants1.packedValues[0u].x) - productValue71) * productValue74) + productValue71) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue76 = ((((productValue72 * fragmentVectorConstants1.packedValues[0u].y) - productValue72) * productValue74) + productValue72) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue77 = ((((productValue73 * fragmentVectorConstants1.packedValues[0u].z) - productValue73) * productValue74) + productValue73) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue20 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if ((scalarValue20 & 1u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue16.x;
    float scalarValue15 = sampledTextureValue16.y;
    float scalarValue16 = sampledTextureValue16.z;
    float scalarValue22 = sampledTextureValue16.w;
    float productValue94 = float((((scalarValue14 + scalarValue15) + scalarValue16) * (1.0 - scalarValue22)) > 0.0);
    float productValue95 = (productValue94 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x) - scalarValue14)) + scalarValue14;
    float productValue96 = (productValue94 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y) - scalarValue15)) + scalarValue15;
    float productValue97 = (productValue94 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[16u].z) - scalarValue16)) + scalarValue16;
    float productValue98 = (productValue94 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[16u].w) - scalarValue22)) + scalarValue22;
    float productValue99 = ((((productValue95 * fragmentVectorConstants1.packedValues[0u].x) - productValue95) * productValue98) + productValue95) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue100 = ((((productValue96 * fragmentVectorConstants1.packedValues[0u].y) - productValue96) * productValue98) + productValue96) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue101 = ((((productValue97 * fragmentVectorConstants1.packedValues[0u].z) - productValue97) * productValue98) + productValue97) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue20 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if ((scalarValue20 & 1u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue71 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue72 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue111 = fragmentVectorConstants1.packedValues[0u].x * productValue71;
    float productValue112 = fragmentVectorConstants1.packedValues[0u].y * productValue71;
    float productValue113 = fragmentVectorConstants1.packedValues[0u].z * productValue71;
    float scalarValue24 = ceil(productValue72);
    float productValue114 = ((((productValue72 * fragmentVectorConstants1.packedValues[17u].x) - productValue111) * scalarValue24) + productValue111) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue115 = ((((productValue72 * fragmentVectorConstants1.packedValues[17u].y) - productValue112) * scalarValue24) + productValue112) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue116 = ((((productValue72 * fragmentVectorConstants1.packedValues[17u].z) - productValue113) * scalarValue24) + productValue113) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue20 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if ((scalarValue20 & 1u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue16.x;
    float scalarValue15 = sampledTextureValue16.y;
    float productValue132 = float((((scalarValue14 + scalarValue15) + sampledTextureValue16.z) * (1.0 - sampledTextureValue16.w)) > 0.0);
    float productValue133 = (productValue132 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x) - scalarValue14)) + scalarValue14;
    float productValue134 = (productValue132 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y) - scalarValue15)) + scalarValue15;
    float productValue135 = productValue133 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue136 = productValue133 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue137 = productValue133 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue26 = ceil(productValue134);
    float productValue138 = ((((productValue134 * fragmentVectorConstants1.packedValues[17u].x) - productValue135) * scalarValue26) + productValue135) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue139 = ((((productValue134 * fragmentVectorConstants1.packedValues[17u].y) - productValue136) * scalarValue26) + productValue136) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue140 = ((((productValue134 * fragmentVectorConstants1.packedValues[17u].z) - productValue137) * scalarValue26) + productValue137) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue20 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if ((scalarValue20 & 1u) == 0u)
#endif
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue7 & 2u) == 2u) ? sampledTextureValue8.w : fragmentScalarConstants1.packedValues[72u];
        intermediateValue12 = sampledTextureValue8.x;
        intermediateValue13 = sampledTextureValue8.z;
        intermediateValue14 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue7 & 2u) == 2u) ? sampledTextureValue8.w : fragmentScalarConstants1.packedValues[72u];
        intermediateValue17 = sampledTextureValue8.x;
        intermediateValue18 = sampledTextureValue8.z;
        intermediateValue19 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue21 & 2u) == 2u) ? sampledTextureValue8.w : fragmentScalarConstants1.packedValues[76u];
        intermediateValue12 = sampledTextureValue8.x;
        intermediateValue13 = sampledTextureValue8.z;
        intermediateValue14 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue21 & 2u) == 2u) ? sampledTextureValue8.w : fragmentScalarConstants1.packedValues[76u];
        intermediateValue18 = sampledTextureValue8.x;
        intermediateValue19 = sampledTextureValue8.z;
        intermediateValue20 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue21 & 2u) == 2u) ? sampledTextureValue8.w : fragmentScalarConstants1.packedValues[80u];
        intermediateValue13 = sampledTextureValue8.x;
        intermediateValue14 = sampledTextureValue8.z;
        intermediateValue15 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue21 & 2u) == 2u) ? sampledTextureValue8.w : fragmentScalarConstants1.packedValues[80u];
        intermediateValue17 = sampledTextureValue8.x;
        intermediateValue18 = sampledTextureValue8.z;
        intermediateValue19 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue2 = fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue3 = fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[18u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue5 = fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[18u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue2 = fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue3 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue6 = fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue3 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue5 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[20u].x;
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue12 = fragmentScalarConstants1.packedValues[64u];
        intermediateValue13 = fragmentScalarConstants1.packedValues[68u];
        intermediateValue14 = fragmentScalarConstants1.packedValues[52u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue17 = fragmentScalarConstants1.packedValues[64u];
        intermediateValue18 = fragmentScalarConstants1.packedValues[68u];
        intermediateValue19 = fragmentScalarConstants1.packedValues[52u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue12 = fragmentScalarConstants1.packedValues[68u];
        intermediateValue13 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue14 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue18 = fragmentScalarConstants1.packedValues[68u];
        intermediateValue19 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue20 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue13 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue14 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue15 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue17 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue18 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue19 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue2 = sampledTextureValue1.x;
        intermediateValue3 = sampledTextureValue1.y;
        intermediateValue4 = sampledTextureValue1.z;
        intermediateValue5 = ((scalarValue & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[18u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue5 = sampledTextureValue1.x;
        intermediateValue6 = sampledTextureValue1.y;
        intermediateValue7 = sampledTextureValue1.z;
        intermediateValue8 = ((scalarValue & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[18u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue2 = sampledTextureValue1.x;
        intermediateValue3 = sampledTextureValue1.y;
        intermediateValue4 = sampledTextureValue1.z;
        intermediateValue5 = ((scalarValue20 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue6 = sampledTextureValue1.x;
        intermediateValue7 = sampledTextureValue1.y;
        intermediateValue8 = sampledTextureValue1.z;
        intermediateValue9 = ((scalarValue20 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue3 = sampledTextureValue1.x;
        intermediateValue4 = sampledTextureValue1.y;
        intermediateValue5 = sampledTextureValue1.z;
        intermediateValue6 = ((scalarValue20 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue5 = sampledTextureValue1.x;
        intermediateValue6 = sampledTextureValue1.y;
        intermediateValue7 = sampledTextureValue1.z;
        intermediateValue8 = ((scalarValue20 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[20u].x;
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
        float multiplyAddValue7;
        float multiplyAddValue8;
        float multiplyAddValue9;
        bool intermediateValue17;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue10;
        float multiplyAddValue11;
        float multiplyAddValue12;
        bool intermediateValue22;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue10;
        float multiplyAddValue11;
        float multiplyAddValue12;
        bool intermediateValue17;
        if (comparisonValue29)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue14;
        float multiplyAddValue15;
        float multiplyAddValue16;
        bool intermediateValue23;
        if (comparisonValue29)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue10;
        float multiplyAddValue11;
        float multiplyAddValue12;
        bool intermediateValue18;
        if (comparisonValue29)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue12;
        float multiplyAddValue13;
        float multiplyAddValue14;
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
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue7 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue8 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue9 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue17 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue10 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue12 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue22 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue10 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue12 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue17 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue14 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue23 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue10 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue12 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue18 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue12 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue13 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue9.x, 2.0, -1.0);
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
                    uvec2 sampledTextureValue2 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue3 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue23 = fract(float(int(uint(int(float(int(sampledTextureValue2.x)))))) * varyingTexCoord0.x);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue2.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue23 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.y * 2.0) + (-1.0))) - (((sampledTextureValue3.w * 2.0) + (-1.0)) * ((productValue23 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.z * 2.0) + (-1.0))) - (((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue3.x * 2.0) + (-1.0)));
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
                uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x;
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue25);
                float scalarValue2 = fract(productValue26);
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
                vec4 sampledTextureValue5 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue5.x;
                float scalarValue4 = sampledTextureValue5.y;
                float scalarValue5 = sampledTextureValue5.z;
                float scalarValue6 = sampledTextureValue5.w;
                float sumValue = fract(productValue25 + 0.5);
                float sumValue1 = fract(productValue26 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue27 - productValue28;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue29, 0.25), vec3(sumValue2, productValue29, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue29;
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
                    uvec2 sampledTextureValue2 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue3 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue23 = fract(float(int(uint(int(float(int(sampledTextureValue2.x)))))) * varyingTexCoord0.x);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue2.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue23 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.y * 2.0) + (-1.0))) - (((sampledTextureValue3.w * 2.0) + (-1.0)) * ((productValue23 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.z * 2.0) + (-1.0))) - (((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue3.x * 2.0) + (-1.0)));
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
                uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x;
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue25);
                float scalarValue2 = fract(productValue26);
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
                vec4 sampledTextureValue5 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue5.x;
                float scalarValue4 = sampledTextureValue5.y;
                float scalarValue5 = sampledTextureValue5.z;
                float scalarValue6 = sampledTextureValue5.w;
                float sumValue = fract(productValue25 + 0.5);
                float sumValue1 = fract(productValue26 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue27 - productValue28;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue29, 0.25), vec3(sumValue2, productValue29, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue29;
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
                    uvec2 sampledTextureValue2 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue3 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue23 = fract(float(int(uint(int(float(int(sampledTextureValue2.x)))))) * varyingTexCoord0.x);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue2.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue23 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.y * 2.0) + (-1.0))) - (((sampledTextureValue3.w * 2.0) + (-1.0)) * ((productValue23 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.z * 2.0) + (-1.0))) - (((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue3.x * 2.0) + (-1.0)));
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
                uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x;
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue25);
                float scalarValue2 = fract(productValue26);
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
                vec4 sampledTextureValue5 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue5.x;
                float scalarValue4 = sampledTextureValue5.y;
                float scalarValue5 = sampledTextureValue5.z;
                float scalarValue6 = sampledTextureValue5.w;
                float sumValue = fract(productValue25 + 0.5);
                float sumValue1 = fract(productValue26 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue27 - productValue28;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue29, 0.25), vec3(sumValue2, productValue29, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue29;
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
                    uvec2 sampledTextureValue2 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue3 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue23 = fract(float(int(uint(int(float(int(sampledTextureValue2.x)))))) * varyingTexCoord0.x);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue2.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue23 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.y * 2.0) + (-1.0))) - (((sampledTextureValue3.w * 2.0) + (-1.0)) * ((productValue23 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.z * 2.0) + (-1.0))) - (((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue3.x * 2.0) + (-1.0)));
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
                uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x;
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue25);
                float scalarValue2 = fract(productValue26);
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
                vec4 sampledTextureValue5 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue5.x;
                float scalarValue4 = sampledTextureValue5.y;
                float scalarValue5 = sampledTextureValue5.z;
                float scalarValue6 = sampledTextureValue5.w;
                float sumValue = fract(productValue25 + 0.5);
                float sumValue1 = fract(productValue26 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue27 - productValue28;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue29, 0.25), vec3(sumValue2, productValue29, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue29;
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
                    uvec2 sampledTextureValue2 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue3 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue23 = fract(float(int(uint(int(float(int(sampledTextureValue2.x)))))) * varyingTexCoord0.x);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue2.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue23 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.y * 2.0) + (-1.0))) - (((sampledTextureValue3.w * 2.0) + (-1.0)) * ((productValue23 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.z * 2.0) + (-1.0))) - (((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue3.x * 2.0) + (-1.0)));
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
                uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x;
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue25);
                float scalarValue2 = fract(productValue26);
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
                vec4 sampledTextureValue5 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue5.x;
                float scalarValue4 = sampledTextureValue5.y;
                float scalarValue5 = sampledTextureValue5.z;
                float scalarValue6 = sampledTextureValue5.w;
                float sumValue = fract(productValue25 + 0.5);
                float sumValue1 = fract(productValue26 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue27 - productValue28;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue29, 0.25), vec3(sumValue2, productValue29, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue29;
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
                    uvec2 sampledTextureValue2 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue3 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue23 = fract(float(int(uint(int(float(int(sampledTextureValue2.x)))))) * varyingTexCoord0.x);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue2.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue23 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.y * 2.0) + (-1.0))) - (((sampledTextureValue3.w * 2.0) + (-1.0)) * ((productValue23 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.z * 2.0) + (-1.0))) - (((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue3.x * 2.0) + (-1.0)));
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
                uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x;
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue25);
                float scalarValue2 = fract(productValue26);
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
                vec4 sampledTextureValue5 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue3 = sampledTextureValue5.x;
                float scalarValue4 = sampledTextureValue5.y;
                float scalarValue5 = sampledTextureValue5.z;
                float scalarValue6 = sampledTextureValue5.w;
                float sumValue = fract(productValue25 + 0.5);
                float sumValue1 = fract(productValue26 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue27 - productValue28;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue29, 0.25), vec3(sumValue2, productValue29, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue29;
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
            bool intermediateValue18;
            if (comparisonValue9)
            {
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue43 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue44 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue12.x;
                float scalarValue10 = sampledTextureValue12.y;
                float scalarValue11 = sampledTextureValue12.z;
                float scalarValue12 = sampledTextureValue12.w;
                float multiplyAddValue18 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue19 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue19 > 0.5;
                bool conditionValue4 = multiplyAddValue18 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue18 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue18 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue19 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue19 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue18 = true;
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
                    bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue14.x;
                    vec4 sampledTextureValue15 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? sampledTextureValue14.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue20 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue21 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue22 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.y, 2.0, -1.0) + multiplyAddValue20) : multiplyAddValue20;
                    float multiplyAddValue23 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.z, 2.0, -1.0) + multiplyAddValue21) : multiplyAddValue21;
                    bool comparisonValue22 = abs(multiplyAddValue22) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue23) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue22 : 0.0, comparisonValue23 ? multiplyAddValue23 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue22) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue23) : 0.0;
                    productValue20 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue14 = intermediateValue32;
                    comparisonValue15 = intermediateValue32;
                    productValue20 = intermediateValue32;
                }
                intermediateValue18 = comparisonValue7;
                productValue17 = comparisonValue14;
                productValue16 = comparisonValue15;
                productValue15 = productValue20;
            }
            multiplyAddValue7 = productValue15;
            multiplyAddValue8 = productValue16;
            multiplyAddValue9 = productValue17;
            intermediateValue17 = intermediateValue18;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue23;
            if (comparisonValue9)
            {
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue43 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue44 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue12.x;
                float scalarValue10 = sampledTextureValue12.y;
                float scalarValue11 = sampledTextureValue12.z;
                float scalarValue12 = sampledTextureValue12.w;
                float multiplyAddValue18 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue19 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue19 > 0.5;
                bool conditionValue4 = multiplyAddValue18 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue18 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue18 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue19 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue19 + 0.083333335816860198974609375;
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
                    bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue14.x;
                    vec4 sampledTextureValue15 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? sampledTextureValue14.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue20 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue21 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue22 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.y, 2.0, -1.0) + multiplyAddValue20) : multiplyAddValue20;
                    float multiplyAddValue23 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.z, 2.0, -1.0) + multiplyAddValue21) : multiplyAddValue21;
                    bool comparisonValue22 = abs(multiplyAddValue22) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue23) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue22 : 0.0, comparisonValue23 ? multiplyAddValue23 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue22) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue23) : 0.0;
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
            multiplyAddValue10 = productValue13;
            multiplyAddValue11 = productValue14;
            multiplyAddValue12 = productValue15;
            intermediateValue22 = intermediateValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue18;
            if (comparisonValue30)
            {
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue43 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue44 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue12.x;
                float scalarValue10 = sampledTextureValue12.y;
                float scalarValue11 = sampledTextureValue12.z;
                float scalarValue12 = sampledTextureValue12.w;
                float multiplyAddValue18 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue19 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue19 > 0.5;
                bool conditionValue4 = multiplyAddValue18 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue18 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue18 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue19 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue19 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue18 = true;
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
                    bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue14.x;
                    vec4 sampledTextureValue15 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? sampledTextureValue14.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue20 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue21 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue22 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.y, 2.0, -1.0) + multiplyAddValue20) : multiplyAddValue20;
                    float multiplyAddValue23 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.z, 2.0, -1.0) + multiplyAddValue21) : multiplyAddValue21;
                    bool comparisonValue22 = abs(multiplyAddValue22) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue23) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue22 : 0.0, comparisonValue23 ? multiplyAddValue23 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue22) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue23) : 0.0;
                    productValue21 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue14 = intermediateValue32;
                    comparisonValue15 = intermediateValue32;
                    productValue21 = intermediateValue32;
                }
                intermediateValue18 = comparisonValue28;
                productValue18 = comparisonValue14;
                productValue17 = comparisonValue15;
                productValue16 = productValue21;
            }
            multiplyAddValue10 = productValue16;
            multiplyAddValue11 = productValue17;
            multiplyAddValue12 = productValue18;
            intermediateValue17 = intermediateValue18;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue24;
            if (comparisonValue30)
            {
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue43 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue44 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue12.x;
                float scalarValue10 = sampledTextureValue12.y;
                float scalarValue11 = sampledTextureValue12.z;
                float scalarValue12 = sampledTextureValue12.w;
                float multiplyAddValue18 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue19 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue19 > 0.5;
                bool conditionValue4 = multiplyAddValue18 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue18 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue18 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue19 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue19 + 0.083333335816860198974609375;
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
                    bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue14.x;
                    vec4 sampledTextureValue15 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? sampledTextureValue14.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue20 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue21 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue22 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.y, 2.0, -1.0) + multiplyAddValue20) : multiplyAddValue20;
                    float multiplyAddValue23 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.z, 2.0, -1.0) + multiplyAddValue21) : multiplyAddValue21;
                    bool comparisonValue22 = abs(multiplyAddValue22) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue23) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue22 : 0.0, comparisonValue23 ? multiplyAddValue23 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue22) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue23) : 0.0;
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
            multiplyAddValue14 = productValue13;
            multiplyAddValue15 = productValue14;
            multiplyAddValue16 = productValue15;
            intermediateValue23 = intermediateValue24;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue17;
            float productValue18;
            float productValue19;
            bool intermediateValue19;
            if (comparisonValue30)
            {
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue43 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue44 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue12.x;
                float scalarValue10 = sampledTextureValue12.y;
                float scalarValue11 = sampledTextureValue12.z;
                float scalarValue12 = sampledTextureValue12.w;
                float multiplyAddValue18 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue19 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue19 > 0.5;
                bool conditionValue4 = multiplyAddValue18 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue18 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue18 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue19 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue19 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue19 = true;
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
                    bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue14.x;
                    vec4 sampledTextureValue15 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? sampledTextureValue14.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue20 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue21 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue22 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.y, 2.0, -1.0) + multiplyAddValue20) : multiplyAddValue20;
                    float multiplyAddValue23 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.z, 2.0, -1.0) + multiplyAddValue21) : multiplyAddValue21;
                    bool comparisonValue22 = abs(multiplyAddValue22) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue23) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue22 : 0.0, comparisonValue23 ? multiplyAddValue23 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue22) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue23) : 0.0;
                    productValue22 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue14 = intermediateValue33;
                    comparisonValue15 = intermediateValue33;
                    productValue22 = intermediateValue33;
                }
                intermediateValue19 = comparisonValue28;
                productValue19 = comparisonValue14;
                productValue18 = comparisonValue15;
                productValue17 = productValue22;
            }
            multiplyAddValue10 = productValue17;
            multiplyAddValue11 = productValue18;
            multiplyAddValue12 = productValue19;
            intermediateValue18 = intermediateValue19;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue23;
            if (comparisonValue30)
            {
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue8 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue8 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue43 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue44 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue44 - 0.5) < 0.0625) ? (((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue9 = sampledTextureValue12.x;
                float scalarValue10 = sampledTextureValue12.y;
                float scalarValue11 = sampledTextureValue12.z;
                float scalarValue12 = sampledTextureValue12.w;
                float multiplyAddValue18 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue19 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue19 > 0.5;
                bool conditionValue4 = multiplyAddValue18 > 0.5;
                float comparisonValue12 = conditionValue3 ? scalarValue9 : scalarValue12;
                float comparisonValue13 = conditionValue3 ? scalarValue10 : scalarValue11;
                float comparisonValue16 = conditionValue4 ? scalarValue11 : scalarValue12;
                float comparisonValue17 = conditionValue4 ? scalarValue10 : scalarValue9;
                float sumValue6 = multiplyAddValue18 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue18 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue19 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue19 + 0.083333335816860198974609375;
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
                    bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue13 = sampledTextureValue14.x;
                    vec4 sampledTextureValue15 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? scalarValue13 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue13 ? sampledTextureValue14.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue20 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue21 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue22 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.y, 2.0, -1.0) + multiplyAddValue20) : multiplyAddValue20;
                    float multiplyAddValue23 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.z, 2.0, -1.0) + multiplyAddValue21) : multiplyAddValue21;
                    bool comparisonValue22 = abs(multiplyAddValue22) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue23) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue22 : 0.0, comparisonValue23 ? multiplyAddValue23 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue8 * multiplyAddValue22) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue8 * multiplyAddValue23) : 0.0;
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
            multiplyAddValue12 = productValue16;
            multiplyAddValue13 = productValue17;
            multiplyAddValue14 = productValue18;
            intermediateValue22 = intermediateValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue13 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue14 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue6.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue16 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue18 = (sampledTextureValue6.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue17 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue18 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue6.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue14 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue6.z * 2.0) + (-1.0);
#endif
        }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue25 = intermediateValue17 ? multiplyAddValue7 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue24 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue25, intermediateValue17 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue9, intermediateValue17 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue8) : 0.0) : 0.0);
        float multiplyAddValue25 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue25, intermediateValue17 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue9, intermediateValue17 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue8) : 0.0) : 0.0);
        float multiplyAddValue26 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue25, intermediateValue17 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue9, intermediateValue17 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue8) : 0.0) : 0.0);
        vec3 vectorValue4 = vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        productValue4 = inverseLengthValue12 * multiplyAddValue26;
        productValue5 = inverseLengthValue12 * multiplyAddValue25;
        productValue6 = inverseLengthValue12 * multiplyAddValue24;
    }
    else
    {
        productValue4 = varyingNormal0.z;
        productValue5 = varyingNormal0.y;
        productValue6 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue27 = intermediateValue22 ? multiplyAddValue10 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue37 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue27, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue12, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue38 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue27, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue12, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue39 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue27, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue12, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue11) : 0.0) : 0.0);
        vec3 vectorValue6 = vec3(multiplyAddValue37, multiplyAddValue38, multiplyAddValue39);
        float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
        productValue2 = inverseLengthValue17 * multiplyAddValue39;
        productValue3 = inverseLengthValue17 * multiplyAddValue38;
        productValue4 = inverseLengthValue17 * multiplyAddValue37;
    }
    else
    {
        productValue2 = varyingNormal0.z;
        productValue3 = varyingNormal0.y;
        productValue4 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue31 = intermediateValue17 ? multiplyAddValue10 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue48 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue31, intermediateValue17 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue12, intermediateValue17 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue49 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue31, intermediateValue17 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue12, intermediateValue17 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue50 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue31, intermediateValue17 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue12, intermediateValue17 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue11) : 0.0) : 0.0);
        vec3 vectorValue8 = vec3(multiplyAddValue48, multiplyAddValue49, multiplyAddValue50);
        float inverseLengthValue19 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
        productValue5 = inverseLengthValue19 * multiplyAddValue50;
        productValue6 = inverseLengthValue19 * multiplyAddValue49;
        productValue7 = inverseLengthValue19 * multiplyAddValue48;
    }
    else
    {
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue33 = intermediateValue23 ? multiplyAddValue14 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue65 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue33, intermediateValue23 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue16, intermediateValue23 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue15) : 0.0) : 0.0);
        float multiplyAddValue66 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue33, intermediateValue23 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue16, intermediateValue23 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue15) : 0.0) : 0.0);
        float multiplyAddValue67 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue33, intermediateValue23 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue16, intermediateValue23 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue15) : 0.0) : 0.0);
        vec3 vectorValue10 = vec3(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67);
        float inverseLengthValue24 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
        productValue2 = inverseLengthValue24 * multiplyAddValue67;
        productValue3 = inverseLengthValue24 * multiplyAddValue66;
        productValue4 = inverseLengthValue24 * multiplyAddValue65;
    }
    else
    {
        productValue2 = varyingNormal0.z;
        productValue3 = varyingNormal0.y;
        productValue4 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue34 = intermediateValue18 ? multiplyAddValue10 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue74 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue34, intermediateValue18 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue12, intermediateValue18 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue75 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue34, intermediateValue18 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue12, intermediateValue18 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue76 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue34, intermediateValue18 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue12, intermediateValue18 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue11) : 0.0) : 0.0);
        vec3 vectorValue11 = vec3(multiplyAddValue74, multiplyAddValue75, multiplyAddValue76);
        float inverseLengthValue28 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
        productValue6 = inverseLengthValue28 * multiplyAddValue76;
        productValue7 = inverseLengthValue28 * multiplyAddValue75;
        productValue8 = inverseLengthValue28 * multiplyAddValue74;
    }
    else
    {
        productValue6 = varyingNormal0.z;
        productValue7 = varyingNormal0.y;
        productValue8 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue35 = intermediateValue22 ? multiplyAddValue12 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue82 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue35, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue14, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue13) : 0.0) : 0.0);
        float multiplyAddValue83 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue35, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue14, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue13) : 0.0) : 0.0);
        float multiplyAddValue84 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue35, intermediateValue22 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue14, intermediateValue22 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue13) : 0.0) : 0.0);
        vec3 vectorValue13 = vec3(multiplyAddValue82, multiplyAddValue83, multiplyAddValue84);
        float inverseLengthValue30 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
        productValue5 = inverseLengthValue30 * multiplyAddValue84;
        productValue6 = inverseLengthValue30 * multiplyAddValue83;
        productValue7 = inverseLengthValue30 * multiplyAddValue82;
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
        float multiplyAddValue31 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue17, inverseLengthValue14 * varyingTangent0.x));
        float multiplyAddValue32 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue17, inverseLengthValue14 * varyingTangent0.y));
        float multiplyAddValue33 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue17, inverseLengthValue14 * varyingTangent0.z));
        float inverseLengthValue15 = inversesqrt(dot(vec3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33), vec3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33)));
        intermediateValue9 = inverseLengthValue15 * multiplyAddValue31;
        intermediateValue10 = inverseLengthValue15 * multiplyAddValue32;
        intermediateValue11 = inverseLengthValue15 * multiplyAddValue33;
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
    float productValue30 = inverseLengthValue6 * intermediateValue6;
    float productValue31 = inverseLengthValue6 * intermediateValue7;
    float productValue32 = inverseLengthValue6 * intermediateValue8;
    float quotientValue = 1.0 / ((abs(productValue31) + abs(productValue30)) + abs(productValue32));
    float productValue33 = quotientValue * productValue30;
    float productValue34 = quotientValue * productValue31;
    bool conditionValue2 = productValue32 < 0.0;
    float multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue41 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue10;
    float productValue13;
    float productValue14;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue78 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue10 = spvNClamp(productValue78, 0.0, 1.0);
        productValue13 = spvNClamp(((productValue78 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue78, 0.0, 1.0);
        productValue14 = spvNClamp((((productValue78 * productValue78) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue78, 0.0, 1.0);
    }
    else
    {
        intermediateValue10 = fragmentVectorConstants1.packedValues[11u].x;
        productValue13 = fragmentVectorConstants1.packedValues[11u].y;
        productValue14 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue21 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue17;
        float multiplyAddValue55 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue19, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue18, inverseLengthValue21 * varyingTangent0.x));
        float multiplyAddValue56 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue19, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue18, inverseLengthValue21 * varyingTangent0.y));
        float multiplyAddValue57 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue19, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue18, inverseLengthValue21 * varyingTangent0.z));
        float inverseLengthValue22 = inversesqrt(dot(vec3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57), vec3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57)));
        intermediateValue10 = inverseLengthValue22 * multiplyAddValue55;
        intermediateValue11 = inverseLengthValue22 * multiplyAddValue56;
        intermediateValue12 = inverseLengthValue22 * multiplyAddValue57;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue23 = inversesqrt(dot(vec3(intermediateValue10, intermediateValue11, intermediateValue12), vec3(intermediateValue10, intermediateValue11, intermediateValue12)));
    float productValue102 = inverseLengthValue23 * intermediateValue10;
    float productValue103 = inverseLengthValue23 * intermediateValue11;
    float productValue104 = inverseLengthValue23 * intermediateValue12;
    float quotientValue5 = 1.0 / ((abs(productValue103) + abs(productValue102)) + abs(productValue104));
    float productValue105 = quotientValue5 * productValue102;
    float productValue106 = quotientValue5 * productValue103;
    bool conditionValue9 = productValue104 < 0.0;
    float multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue41 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue14;
    float productValue14;
    float productValue15;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue78 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue14 = spvNClamp(productValue78, 0.0, 1.0);
        productValue14 = spvNClamp(((productValue78 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue78, 0.0, 1.0);
        productValue15 = spvNClamp((((productValue78 * productValue78) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue78, 0.0, 1.0);
    }
    else
    {
        intermediateValue14 = fragmentVectorConstants1.packedValues[11u].x;
        productValue14 = fragmentVectorConstants1.packedValues[11u].y;
        productValue15 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue25 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue14;
        float multiplyAddValue68 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue16, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue15, inverseLengthValue25 * varyingTangent0.x));
        float multiplyAddValue69 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue16, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue15, inverseLengthValue25 * varyingTangent0.y));
        float multiplyAddValue70 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue16, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue15, inverseLengthValue25 * varyingTangent0.z));
        float inverseLengthValue26 = inversesqrt(dot(vec3(multiplyAddValue68, multiplyAddValue69, multiplyAddValue70), vec3(multiplyAddValue68, multiplyAddValue69, multiplyAddValue70)));
        intermediateValue7 = inverseLengthValue26 * multiplyAddValue68;
        intermediateValue8 = inverseLengthValue26 * multiplyAddValue69;
        intermediateValue9 = inverseLengthValue26 * multiplyAddValue70;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue27 = inversesqrt(dot(vec3(intermediateValue7, intermediateValue8, intermediateValue9), vec3(intermediateValue7, intermediateValue8, intermediateValue9)));
    float productValue117 = inverseLengthValue27 * intermediateValue7;
    float productValue118 = inverseLengthValue27 * intermediateValue8;
    float productValue119 = inverseLengthValue27 * intermediateValue9;
    float quotientValue6 = 1.0 / ((abs(productValue118) + abs(productValue117)) + abs(productValue119));
    float productValue120 = quotientValue6 * productValue117;
    float productValue121 = quotientValue6 * productValue118;
    bool conditionValue10 = productValue119 < 0.0;
    float multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue41 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue11;
    float productValue14;
    float productValue15;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue78 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue11 = spvNClamp(productValue78, 0.0, 1.0);
        productValue14 = spvNClamp(((productValue78 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue78, 0.0, 1.0);
        productValue15 = spvNClamp((((productValue78 * productValue78) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue78, 0.0, 1.0);
    }
    else
    {
        intermediateValue11 = fragmentVectorConstants1.packedValues[11u].x;
        productValue14 = fragmentVectorConstants1.packedValues[11u].y;
        productValue15 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue14 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue16;
        float multiplyAddValue31 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue17, inverseLengthValue14 * varyingTangent0.x));
        float multiplyAddValue32 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue17, inverseLengthValue14 * varyingTangent0.y));
        float multiplyAddValue33 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue17, inverseLengthValue14 * varyingTangent0.z));
        float inverseLengthValue15 = inversesqrt(dot(vec3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33), vec3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33)));
        intermediateValue9 = inverseLengthValue15 * multiplyAddValue31;
        intermediateValue10 = inverseLengthValue15 * multiplyAddValue32;
        intermediateValue11 = inverseLengthValue15 * multiplyAddValue33;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue16 = inversesqrt(dot(vec3(intermediateValue9, intermediateValue10, intermediateValue11), vec3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue57 = inverseLengthValue16 * intermediateValue9;
    float productValue58 = inverseLengthValue16 * intermediateValue10;
    float productValue59 = inverseLengthValue16 * intermediateValue11;
    float quotientValue2 = 1.0 / ((abs(productValue58) + abs(productValue57)) + abs(productValue59));
    float productValue60 = quotientValue2 * productValue57;
    float productValue61 = quotientValue2 * productValue58;
    bool conditionValue6 = productValue59 < 0.0;
    float multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue41 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue13;
    float productValue15;
    float productValue16;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue78 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue13 = spvNClamp(productValue78, 0.0, 1.0);
        productValue15 = spvNClamp(((productValue78 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue78, 0.0, 1.0);
        productValue16 = spvNClamp((((productValue78 * productValue78) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue78, 0.0, 1.0);
    }
    else
    {
        intermediateValue13 = fragmentVectorConstants1.packedValues[11u].x;
        productValue15 = fragmentVectorConstants1.packedValues[11u].y;
        productValue16 = fragmentVectorConstants1.packedValues[11u].z;
#endif
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue12) ? fma(intermediateValue12, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(productValue6, productValue5, productValue4);
    float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue45 = inverseLengthValue13 * productValue6;
    float productValue46 = inverseLengthValue13 * productValue5;
    float productValue47 = inverseLengthValue13 * productValue4;
    float quotientValue1 = 1.0 / (abs(productValue47) + (abs(productValue46) + abs(productValue45)));
    float productValue48 = quotientValue1 * productValue45;
    float productValue49 = quotientValue1 * productValue46;
    bool conditionValue5 = productValue47 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue48 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue49))) : productValue48;
    fragmentColor2.y = conditionValue5 ? (((productValue49 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue48))) : productValue49;
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[35u], sumValue5, fma(fragmentScalarConstants1.packedValues[27u], sumValue3, sumValue4 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue27, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue28, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue27, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue28, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[56u] > 9.9999997473787516355514526367188e-05);
    float productValue50 = fragmentScalarConstants1.packedValues[56u] * fragmentScalarConstants1.packedValues[56u];
    float comparisonValue26 = (bitwiseValue1 ? spvNMin(productValue50, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue29 = (bitwiseValue1 ? spvNMin(fma(fma(productValue50, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue30 = (bitwiseValue1 ? spvNMin(fma(productValue50 * productValue50, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue51 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue29, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue30, comparisonValue26)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue29 / productValue51, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue26 / productValue51, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue30 / productValue51, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue51, 0.0, 1.0) * 255.0);
    uint productValue52 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = (((productValue52 & 2u) != 0u) ? 512u : 0u) + ((((productValue52 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[57u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue17) ? fma(intermediateValue17, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(productValue4, productValue3, productValue2);
    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue66 = inverseLengthValue18 * productValue4;
    float productValue67 = inverseLengthValue18 * productValue3;
    float productValue68 = inverseLengthValue18 * productValue2;
    float quotientValue3 = 1.0 / (abs(productValue68) + (abs(productValue67) + abs(productValue66)));
    float productValue69 = quotientValue3 * productValue66;
    float productValue70 = quotientValue3 * productValue67;
    bool conditionValue7 = productValue68 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue69 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue70))) : productValue69;
    fragmentColor2.y = conditionValue7 ? (((productValue70 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue69))) : productValue70;
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[35u], sumValue5, fma(fragmentScalarConstants1.packedValues[27u], sumValue3, sumValue4 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue27, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue28, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue27, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue28, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[56u] > 9.9999997473787516355514526367188e-05);
    float productValue50 = fragmentScalarConstants1.packedValues[56u] * fragmentScalarConstants1.packedValues[56u];
    float comparisonValue26 = (bitwiseValue1 ? spvNMin(productValue50, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue29 = (bitwiseValue1 ? spvNMin(fma(fma(productValue50, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue30 = (bitwiseValue1 ? spvNMin(fma(productValue50 * productValue50, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue51 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue29, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue30, comparisonValue26)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue29 / productValue51, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue26 / productValue51, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue30 / productValue51, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue51, 0.0, 1.0) * 255.0);
    uint productValue52 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = (((productValue52 & 2u) != 0u) ? 512u : 0u) + ((((productValue52 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[57u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue18, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue12) ? fma(intermediateValue12, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue9 = vec3(productValue7, productValue6, productValue5);
    float inverseLengthValue20 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
    float productValue86 = inverseLengthValue20 * productValue7;
    float productValue87 = inverseLengthValue20 * productValue6;
    float productValue88 = inverseLengthValue20 * productValue5;
    float quotientValue4 = 1.0 / (abs(productValue88) + (abs(productValue87) + abs(productValue86)));
    float productValue89 = quotientValue4 * productValue86;
    float productValue90 = quotientValue4 * productValue87;
    bool conditionValue8 = productValue88 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue89 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue90))) : productValue89;
    fragmentColor2.y = conditionValue8 ? (((productValue90 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue89))) : productValue90;
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue51, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue52, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue51, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue52, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float productValue91 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue53 = (bitwiseValue3 ? spvNMin(fma(fma(productValue91, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue54 = (bitwiseValue3 ? spvNMin(fma(productValue91 * productValue91, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue92 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue53, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue54, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue53 / productValue92, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue92, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue54 / productValue92, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue92, 0.0, 1.0) * 255.0);
    uint productValue93 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue93 & 2u) != 0u) ? 512u : 0u) + ((((productValue93 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue18) ? fma(intermediateValue18, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(productValue4, productValue3, productValue2);
    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue66 = inverseLengthValue18 * productValue4;
    float productValue67 = inverseLengthValue18 * productValue3;
    float productValue68 = inverseLengthValue18 * productValue2;
    float quotientValue3 = 1.0 / (abs(productValue68) + (abs(productValue67) + abs(productValue66)));
    float productValue69 = quotientValue3 * productValue66;
    float productValue70 = quotientValue3 * productValue67;
    bool conditionValue7 = productValue68 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue69 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue70))) : productValue69;
    fragmentColor2.y = conditionValue7 ? (((productValue70 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue69))) : productValue70;
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue51, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue52, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue51, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue52, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float productValue91 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue53 = (bitwiseValue3 ? spvNMin(fma(fma(productValue91, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue54 = (bitwiseValue3 ? spvNMin(fma(productValue91 * productValue91, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue92 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue53, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue54, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue53 / productValue92, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue92, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue54 / productValue92, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue92, 0.0, 1.0) * 255.0);
    uint productValue93 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue93 & 2u) != 0u) ? 512u : 0u) + ((((productValue93 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue20, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue13) ? fma(intermediateValue13, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue12 = vec3(productValue8, productValue7, productValue6);
    float inverseLengthValue29 = inversesqrt(rdDot3Precise2(vectorValue12, vectorValue12));
    float productValue127 = inverseLengthValue29 * productValue8;
    float productValue128 = inverseLengthValue29 * productValue7;
    float productValue129 = inverseLengthValue29 * productValue6;
    float quotientValue7 = 1.0 / (abs(productValue129) + (abs(productValue128) + abs(productValue127)));
    float productValue130 = quotientValue7 * productValue127;
    float productValue131 = quotientValue7 * productValue128;
    bool conditionValue11 = productValue129 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? (((productValue130 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue131))) : productValue130;
    fragmentColor2.y = conditionValue11 ? (((productValue131 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue130))) : productValue131;
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue51, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue52, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue51, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue52, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float productValue91 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue53 = (bitwiseValue3 ? spvNMin(fma(fma(productValue91, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue54 = (bitwiseValue3 ? spvNMin(fma(productValue91 * productValue91, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue92 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue53, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue54, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue53 / productValue92, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue92, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue54 / productValue92, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue92, 0.0, 1.0) * 255.0);
    uint productValue93 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue93 & 2u) != 0u) ? 512u : 0u) + ((((productValue93 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue17) ? fma(intermediateValue17, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue9 = vec3(productValue7, productValue6, productValue5);
    float inverseLengthValue20 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
    float productValue86 = inverseLengthValue20 * productValue7;
    float productValue87 = inverseLengthValue20 * productValue6;
    float productValue88 = inverseLengthValue20 * productValue5;
    float quotientValue4 = 1.0 / (abs(productValue88) + (abs(productValue87) + abs(productValue86)));
    float productValue89 = quotientValue4 * productValue86;
    float productValue90 = quotientValue4 * productValue87;
    bool conditionValue8 = productValue88 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue89 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue90))) : productValue89;
    fragmentColor2.y = conditionValue8 ? (((productValue90 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue89))) : productValue90;
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue51, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue52, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue51, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue52, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float productValue91 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue53 = (bitwiseValue3 ? spvNMin(fma(fma(productValue91, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue54 = (bitwiseValue3 ? spvNMin(fma(productValue91 * productValue91, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue91, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue92 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue53, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue54, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue53 / productValue92, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue92, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue54 / productValue92, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue92, 0.0, 1.0) * 255.0);
    uint productValue93 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue93 & 2u) != 0u) ? 512u : 0u) + ((((productValue93 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue18, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(intermediateValue6, intermediateValue7, intermediateValue8), vec3(intermediateValue6, intermediateValue7, intermediateValue8)));
    float productValue30 = inverseLengthValue6 * intermediateValue6;
    float productValue31 = inverseLengthValue6 * intermediateValue7;
    float productValue32 = inverseLengthValue6 * intermediateValue8;
    float quotientValue = 1.0 / ((abs(productValue31) + abs(productValue30)) + abs(productValue32));
    float productValue33 = quotientValue * productValue30;
    float productValue34 = quotientValue * productValue31;
    bool conditionValue2 = productValue32 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue10;
    float productValue9;
    float productValue10;
    if ((fragmentVectorConstants1.packedValues[14u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue35 = fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue10 = spvNClamp(productValue35, 0.0, 1.0);
        productValue9 = spvNClamp(((productValue35 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue35, 0.0, 1.0);
        productValue10 = spvNClamp((((productValue35 * productValue35) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue35, 0.0, 1.0);
    }
    else
    {
        intermediateValue10 = fragmentVectorConstants1.packedValues[10u].x;
        productValue9 = fragmentVectorConstants1.packedValues[10u].y;
        productValue10 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue36 = intermediateValue10 * 0.16666667163372039794921875;
    float productValue37 = productValue9 * 0.16666667163372039794921875;
    float productValue38 = productValue10 * 0.16666667163372039794921875;
    float productValue39 = ceil(spvNClamp(spvNMax(spvNMax(productValue36, productValue38), spvNMax(productValue37, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue3, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue36 / productValue39, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue37 / productValue39, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue38 / productValue39, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue39, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[14u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue) * fragmentVectorConstants1.packedValues[5u].w) + productValue;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue1) * fragmentVectorConstants1.packedValues[5u].w) + productValue1;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue12) * fragmentVectorConstants1.packedValues[5u].w) + productValue12;
    fragmentColor1.w = (intermediateValue2 > intermediateValue5) ? ((intermediateValue2 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue5 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue33 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue34))) : productValue33;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue33)) * ((productValue34 < 0.0) ? (-1.0) : 1.0)) : productValue34;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue16 = inversesqrt(dot(vec3(intermediateValue9, intermediateValue10, intermediateValue11), vec3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue57 = inverseLengthValue16 * intermediateValue9;
    float productValue58 = inverseLengthValue16 * intermediateValue10;
    float productValue59 = inverseLengthValue16 * intermediateValue11;
    float quotientValue2 = 1.0 / ((abs(productValue58) + abs(productValue57)) + abs(productValue59));
    float productValue60 = quotientValue2 * productValue57;
    float productValue61 = quotientValue2 * productValue58;
    bool conditionValue6 = productValue59 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue13;
    float productValue10;
    float productValue11;
    if ((fragmentVectorConstants1.packedValues[14u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue35 = fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue13 = spvNClamp(productValue35, 0.0, 1.0);
        productValue10 = spvNClamp(((productValue35 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue35, 0.0, 1.0);
        productValue11 = spvNClamp((((productValue35 * productValue35) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue35, 0.0, 1.0);
    }
    else
    {
        intermediateValue13 = fragmentVectorConstants1.packedValues[10u].x;
        productValue10 = fragmentVectorConstants1.packedValues[10u].y;
        productValue11 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue62 = intermediateValue13 * 0.16666667163372039794921875;
    float productValue38 = productValue10 * 0.16666667163372039794921875;
    float productValue63 = productValue11 * 0.16666667163372039794921875;
    float productValue64 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue63), spvNMax(productValue38, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue64, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue38 / productValue64, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue63 / productValue64, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue64, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[14u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue54) * fragmentVectorConstants1.packedValues[5u].w) + productValue54;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue55) * fragmentVectorConstants1.packedValues[5u].w) + productValue55;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue56) * fragmentVectorConstants1.packedValues[5u].w) + productValue56;
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue8 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue36 = intermediateValue10 * 0.16666667163372039794921875;
    float productValue79 = productValue13 * 0.16666667163372039794921875;
    float productValue80 = productValue14 * 0.16666667163372039794921875;
    float productValue81 = ceil(spvNClamp(spvNMax(spvNMax(productValue36, productValue80), spvNMax(productValue79, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue3, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue36 / productValue81, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue79 / productValue81, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue80 / productValue81, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue81, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue75) * fragmentVectorConstants1.packedValues[6u].w) + productValue75;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue76) * fragmentVectorConstants1.packedValues[6u].w) + productValue76;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue77) * fragmentVectorConstants1.packedValues[6u].w) + productValue77;
    fragmentColor1.w = (intermediateValue2 > intermediateValue5) ? ((intermediateValue2 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue5 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue33 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue34))) : productValue33;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue33)) * ((productValue34 < 0.0) ? (-1.0) : 1.0)) : productValue34;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue40) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue41)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue40) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue41)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue107 = intermediateValue14 * 0.16666667163372039794921875;
    float productValue80 = productValue14 * 0.16666667163372039794921875;
    float productValue108 = productValue15 * 0.16666667163372039794921875;
    float productValue109 = ceil(spvNClamp(spvNMax(spvNMax(productValue107, productValue108), spvNMax(productValue80, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue107 / productValue109, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue80 / productValue109, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue108 / productValue109, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue109, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue99) * fragmentVectorConstants1.packedValues[6u].w) + productValue99;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue100) * fragmentVectorConstants1.packedValues[6u].w) + productValue100;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue101) * fragmentVectorConstants1.packedValues[6u].w) + productValue101;
    fragmentColor1.w = (intermediateValue6 > intermediateValue9) ? ((intermediateValue6 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue9 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue9 ? (((productValue105 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue106))) : productValue105;
    fragmentColor2.y = conditionValue9 ? ((1.0 - abs(productValue105)) * ((productValue106 < 0.0) ? (-1.0) : 1.0)) : productValue106;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue40) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue41)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue40) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue41)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue122 = intermediateValue11 * 0.16666667163372039794921875;
    float productValue80 = productValue14 * 0.16666667163372039794921875;
    float productValue108 = productValue15 * 0.16666667163372039794921875;
    float productValue123 = ceil(spvNClamp(spvNMax(spvNMax(productValue122, productValue108), spvNMax(productValue80, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue122 / productValue123, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue80 / productValue123, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue108 / productValue123, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue123, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue114) * fragmentVectorConstants1.packedValues[6u].w) + productValue114;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue115) * fragmentVectorConstants1.packedValues[6u].w) + productValue115;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue116) * fragmentVectorConstants1.packedValues[6u].w) + productValue116;
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue10 ? (((productValue120 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue121))) : productValue120;
    fragmentColor2.y = conditionValue10 ? ((1.0 - abs(productValue120)) * ((productValue121 < 0.0) ? (-1.0) : 1.0)) : productValue121;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue40) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue41)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue40) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue41)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue13 * 0.16666667163372039794921875;
    float productValue108 = productValue15 * 0.16666667163372039794921875;
    float productValue141 = productValue16 * 0.16666667163372039794921875;
    float productValue142 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue141), spvNMax(productValue108, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue142, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue108 / productValue142, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue141 / productValue142, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue142, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue138) * fragmentVectorConstants1.packedValues[6u].w) + productValue138;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue139) * fragmentVectorConstants1.packedValues[6u].w) + productValue139;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue140) * fragmentVectorConstants1.packedValues[6u].w) + productValue140;
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue8 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue40) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue41)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue40) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue41)) * 0.5;
#endif
}
