#version 460
#extension GL_GOOGLE_include_directive : require
// ActorMultiTexturePrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 24
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_FEATURE_COLOR_SECOND_TEXTURE
#define RD_FEATURE_COLOR_SECOND_TEXTURE RD_OFF
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

#include "../../include/materials/ActorMultiTexturePrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue9.x;
    float scalarValue13 = sampledTextureValue9.y;
    float scalarValue14 = sampledTextureValue9.z;
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue10.w;
    float multiplyAddValue8 = fma(scalarValue15, fma(-fragmentVectorConstants1.packedValues[15u].x, scalarValue12, sampledTextureValue10.x), scalarValue12 * fragmentVectorConstants1.packedValues[15u].x);
    float multiplyAddValue9 = fma(scalarValue15, fma(-fragmentVectorConstants1.packedValues[15u].y, scalarValue13, sampledTextureValue10.y), scalarValue13 * fragmentVectorConstants1.packedValues[15u].y);
    float multiplyAddValue23 = fma(scalarValue15, fma(-fragmentVectorConstants1.packedValues[15u].z, scalarValue14, sampledTextureValue10.z), scalarValue14 * fragmentVectorConstants1.packedValues[15u].z);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue24 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue8, multiplyAddValue8);
    float multiplyAddValue25 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue9, multiplyAddValue9);
    float multiplyAddValue26 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue23, multiplyAddValue23);
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue24, multiplyAddValue27, fragmentVectorConstants1.packedValues[5u].x), multiplyAddValue24 * multiplyAddValue27);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue25, multiplyAddValue28, fragmentVectorConstants1.packedValues[5u].y), multiplyAddValue25 * multiplyAddValue28);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue26, multiplyAddValue29, fragmentVectorConstants1.packedValues[5u].z), multiplyAddValue26 * multiplyAddValue29);
    uint scalarValue17 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    bool comparisonValue7 = (scalarValue17 & 16u) == 16u;
    bool comparisonValue8 = (scalarValue17 & 4u) == 4u;
    bool comparisonValue9 = (scalarValue17 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    if ((scalarValue17 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue10.x;
    float scalarValue25 = sampledTextureValue10.y;
    float scalarValue26 = sampledTextureValue10.z;
    float scalarValue15 = sampledTextureValue10.w;
    bool productValue76 = ((scalarValue26 + (scalarValue25 + scalarValue24)) * (1.0 - scalarValue15)) > 0.0;
    float multiplyAddValue43 = productValue76 ? (fma(fragmentVectorConstants1.packedValues[15u].x, sampledTextureValue9.x, -scalarValue24) + scalarValue24) : scalarValue24;
    float multiplyAddValue44 = productValue76 ? (fma(fragmentVectorConstants1.packedValues[15u].y, sampledTextureValue9.y, -scalarValue25) + scalarValue25) : scalarValue25;
    float multiplyAddValue45 = productValue76 ? (fma(fragmentVectorConstants1.packedValues[15u].z, sampledTextureValue9.z, -scalarValue26) + scalarValue26) : scalarValue26;
    float multiplyAddValue46 = fma(scalarValue15, scalarValue24 - multiplyAddValue43, multiplyAddValue43);
    float multiplyAddValue47 = fma(scalarValue15, scalarValue25 - multiplyAddValue44, multiplyAddValue44);
    float multiplyAddValue48 = fma(scalarValue15, scalarValue26 - multiplyAddValue45, multiplyAddValue45);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue49 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue46, multiplyAddValue46);
    float multiplyAddValue50 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue47, multiplyAddValue47);
    float multiplyAddValue51 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue48, multiplyAddValue48);
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue49, multiplyAddValue27, fragmentVectorConstants1.packedValues[5u].x), multiplyAddValue49 * multiplyAddValue27);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue50, multiplyAddValue28, fragmentVectorConstants1.packedValues[5u].y), multiplyAddValue50 * multiplyAddValue28);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue51, multiplyAddValue29, fragmentVectorConstants1.packedValues[5u].z), multiplyAddValue51 * multiplyAddValue29);
    uint scalarValue17 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    bool comparisonValue7 = (scalarValue17 & 16u) == 16u;
    bool comparisonValue8 = (scalarValue17 & 4u) == 4u;
    bool comparisonValue9 = (scalarValue17 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    if ((scalarValue17 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue9.x;
    float scalarValue13 = sampledTextureValue9.y;
    float scalarValue14 = sampledTextureValue9.z;
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue10.w;
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue31 = sampledTextureValue11.x;
    float scalarValue32 = sampledTextureValue11.y;
    float scalarValue33 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = fragmentScalarConstants1.packedValues[52u] < scalarValue16;
    float multiplyAddValue60 = conditionValue9 ? fma(scalarValue16, fma(scalarValue31, fragmentVectorConstants1.packedValues[0u].x, -scalarValue31), scalarValue31) : fma(scalarValue15, fma(-fragmentVectorConstants1.packedValues[17u].x, scalarValue12, sampledTextureValue10.x), scalarValue12 * fragmentVectorConstants1.packedValues[17u].x);
    float multiplyAddValue61 = conditionValue9 ? fma(scalarValue16, fma(scalarValue32, fragmentVectorConstants1.packedValues[0u].y, -scalarValue32), scalarValue32) : fma(scalarValue15, fma(-fragmentVectorConstants1.packedValues[17u].y, scalarValue13, sampledTextureValue10.y), scalarValue13 * fragmentVectorConstants1.packedValues[17u].y);
    float multiplyAddValue62 = conditionValue9 ? fma(scalarValue16, fma(scalarValue33, fragmentVectorConstants1.packedValues[0u].z, -scalarValue33), scalarValue33) : fma(scalarValue15, fma(-fragmentVectorConstants1.packedValues[17u].z, scalarValue14, sampledTextureValue10.z), scalarValue14 * fragmentVectorConstants1.packedValues[17u].z);
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue60, multiplyAddValue63, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue60 * multiplyAddValue63);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue61, multiplyAddValue64, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue61 * multiplyAddValue64);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue62, multiplyAddValue65, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue62 * multiplyAddValue65);
    uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue34 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue34 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue34 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    if ((scalarValue34 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue10.x;
    float scalarValue25 = sampledTextureValue10.y;
    float scalarValue26 = sampledTextureValue10.z;
    float scalarValue15 = sampledTextureValue10.w;
    bool productValue76 = ((scalarValue26 + (scalarValue25 + scalarValue24)) * (1.0 - scalarValue15)) > 0.0;
    float multiplyAddValue73 = productValue76 ? (fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue9.x, -scalarValue24) + scalarValue24) : scalarValue24;
    float multiplyAddValue74 = productValue76 ? (fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue9.y, -scalarValue25) + scalarValue25) : scalarValue25;
    float multiplyAddValue75 = productValue76 ? (fma(fragmentVectorConstants1.packedValues[17u].z, sampledTextureValue9.z, -scalarValue26) + scalarValue26) : scalarValue26;
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue31 = sampledTextureValue11.x;
    float scalarValue32 = sampledTextureValue11.y;
    float scalarValue33 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = fragmentScalarConstants1.packedValues[52u] < scalarValue16;
    float multiplyAddValue76 = conditionValue9 ? fma(scalarValue16, fma(scalarValue31, fragmentVectorConstants1.packedValues[0u].x, -scalarValue31), scalarValue31) : fma(scalarValue15, scalarValue24 - multiplyAddValue73, multiplyAddValue73);
    float multiplyAddValue77 = conditionValue9 ? fma(scalarValue16, fma(scalarValue32, fragmentVectorConstants1.packedValues[0u].y, -scalarValue32), scalarValue32) : fma(scalarValue15, scalarValue25 - multiplyAddValue74, multiplyAddValue74);
    float multiplyAddValue78 = conditionValue9 ? fma(scalarValue16, fma(scalarValue33, fragmentVectorConstants1.packedValues[0u].z, -scalarValue33), scalarValue33) : fma(scalarValue15, scalarValue26 - multiplyAddValue75, multiplyAddValue75);
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue76, multiplyAddValue63, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue76 * multiplyAddValue63);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue77, multiplyAddValue64, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue77 * multiplyAddValue64);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue78, multiplyAddValue65, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue78 * multiplyAddValue65);
    uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue34 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue34 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue34 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    if ((scalarValue34 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue138 = sampledTextureValue9.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue139 = sampledTextureValue9.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue140 = sampledTextureValue9.z * fragmentVectorConstants1.packedValues[16u].z;
    float productValue141 = sampledTextureValue9.w * fragmentVectorConstants1.packedValues[16u].w;
    float multiplyAddValue82 = fma(productValue141, fma(productValue138, fragmentVectorConstants1.packedValues[0u].x, -productValue138), productValue138);
    float multiplyAddValue83 = fma(productValue141, fma(productValue139, fragmentVectorConstants1.packedValues[0u].y, -productValue139), productValue139);
    float multiplyAddValue84 = fma(productValue141, fma(productValue140, fragmentVectorConstants1.packedValues[0u].z, -productValue140), productValue140);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue10.w;
    float multiplyAddValue85 = fma(scalarValue15, sampledTextureValue10.x - multiplyAddValue82, multiplyAddValue82);
    float multiplyAddValue86 = fma(scalarValue15, sampledTextureValue10.y - multiplyAddValue83, multiplyAddValue83);
    float multiplyAddValue87 = fma(scalarValue15, sampledTextureValue10.z - multiplyAddValue84, multiplyAddValue84);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue88 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue85, multiplyAddValue85);
    float multiplyAddValue89 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue86, multiplyAddValue86);
    float multiplyAddValue90 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue87, multiplyAddValue87);
    float multiplyAddValue91 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue92 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue93 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue88, multiplyAddValue91, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue88 * multiplyAddValue91);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue89, multiplyAddValue92, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue89 * multiplyAddValue92);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue90, multiplyAddValue93, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue90 * multiplyAddValue93);
    uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue34 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue34 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue34 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
    if ((scalarValue34 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue10.x;
    float scalarValue25 = sampledTextureValue10.y;
    float scalarValue26 = sampledTextureValue10.z;
    float scalarValue15 = sampledTextureValue10.w;
    bool productValue149 = ((1.0 - scalarValue15) * (scalarValue26 + (scalarValue25 + scalarValue24))) > 0.0;
    float multiplyAddValue99 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue9.x, -scalarValue24) + scalarValue24) : scalarValue24;
    float multiplyAddValue100 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue9.y, -scalarValue25) + scalarValue25) : scalarValue25;
    float multiplyAddValue101 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue9.z, -scalarValue26) + scalarValue26) : scalarValue26;
    float multiplyAddValue102 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[16u].w, sampledTextureValue9.w, -scalarValue15) + scalarValue15) : scalarValue15;
    float multiplyAddValue103 = fma(multiplyAddValue102, fma(multiplyAddValue99, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue99), multiplyAddValue99);
    float multiplyAddValue104 = fma(multiplyAddValue102, fma(multiplyAddValue100, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue100), multiplyAddValue100);
    float multiplyAddValue105 = fma(multiplyAddValue102, fma(multiplyAddValue101, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue101), multiplyAddValue101);
    float multiplyAddValue106 = fma(scalarValue15, scalarValue24 - multiplyAddValue103, multiplyAddValue103);
    float multiplyAddValue107 = fma(scalarValue15, scalarValue25 - multiplyAddValue104, multiplyAddValue104);
    float multiplyAddValue108 = fma(scalarValue15, scalarValue26 - multiplyAddValue105, multiplyAddValue105);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue109 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue106, multiplyAddValue106);
    float multiplyAddValue110 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue107, multiplyAddValue107);
    float multiplyAddValue111 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue108, multiplyAddValue108);
    float multiplyAddValue91 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue92 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue93 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue109, multiplyAddValue91, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue109 * multiplyAddValue91);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue110, multiplyAddValue92, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue110 * multiplyAddValue92);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue111, multiplyAddValue93, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue111 * multiplyAddValue93);
    uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue34 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue34 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue34 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    if ((scalarValue34 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue158 = sampledTextureValue9.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue159 = sampledTextureValue9.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue160 = sampledTextureValue9.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue161 = sampledTextureValue9.w * fragmentVectorConstants1.packedValues[17u].w;
    float multiplyAddValue115 = fma(productValue161, fma(productValue158, fragmentVectorConstants1.packedValues[0u].x, -productValue158), productValue158);
    float multiplyAddValue116 = fma(productValue161, fma(productValue159, fragmentVectorConstants1.packedValues[0u].y, -productValue159), productValue159);
    float multiplyAddValue117 = fma(productValue161, fma(productValue160, fragmentVectorConstants1.packedValues[0u].z, -productValue160), productValue160);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue10.w;
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue31 = sampledTextureValue11.x;
    float scalarValue32 = sampledTextureValue11.y;
    float scalarValue33 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = fragmentScalarConstants1.packedValues[52u] < scalarValue16;
    float multiplyAddValue118 = conditionValue9 ? fma(scalarValue16, fma(scalarValue31, fragmentVectorConstants1.packedValues[0u].x, -scalarValue31), scalarValue31) : fma(scalarValue15, sampledTextureValue10.x - multiplyAddValue115, multiplyAddValue115);
    float multiplyAddValue119 = conditionValue9 ? fma(scalarValue16, fma(scalarValue32, fragmentVectorConstants1.packedValues[0u].y, -scalarValue32), scalarValue32) : fma(scalarValue15, sampledTextureValue10.y - multiplyAddValue116, multiplyAddValue116);
    float multiplyAddValue120 = conditionValue9 ? fma(scalarValue16, fma(scalarValue33, fragmentVectorConstants1.packedValues[0u].z, -scalarValue33), scalarValue33) : fma(scalarValue15, sampledTextureValue10.z - multiplyAddValue117, multiplyAddValue117);
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue118, multiplyAddValue63, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue118 * multiplyAddValue63);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue119, multiplyAddValue64, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue119 * multiplyAddValue64);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue120, multiplyAddValue65, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue120 * multiplyAddValue65);
    uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue34 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue34 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue34 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue22;
    float intermediateValue23;
    float intermediateValue24;
    if ((scalarValue34 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue10.x;
    float scalarValue25 = sampledTextureValue10.y;
    float scalarValue26 = sampledTextureValue10.z;
    float scalarValue15 = sampledTextureValue10.w;
    bool productValue149 = ((1.0 - scalarValue15) * (scalarValue26 + (scalarValue25 + scalarValue24))) > 0.0;
    float multiplyAddValue124 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue9.x, -scalarValue24) + scalarValue24) : scalarValue24;
    float multiplyAddValue125 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue9.y, -scalarValue25) + scalarValue25) : scalarValue25;
    float multiplyAddValue126 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[17u].z, sampledTextureValue9.z, -scalarValue26) + scalarValue26) : scalarValue26;
    float multiplyAddValue127 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[17u].w, sampledTextureValue9.w, -scalarValue15) + scalarValue15) : scalarValue15;
    float multiplyAddValue128 = fma(multiplyAddValue127, fma(multiplyAddValue124, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue124), multiplyAddValue124);
    float multiplyAddValue129 = fma(multiplyAddValue127, fma(multiplyAddValue125, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue125), multiplyAddValue125);
    float multiplyAddValue130 = fma(multiplyAddValue127, fma(multiplyAddValue126, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue126), multiplyAddValue126);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue31 = sampledTextureValue11.x;
    float scalarValue32 = sampledTextureValue11.y;
    float scalarValue33 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = fragmentScalarConstants1.packedValues[52u] < scalarValue16;
    float multiplyAddValue131 = conditionValue9 ? fma(scalarValue16, fma(scalarValue31, fragmentVectorConstants1.packedValues[0u].x, -scalarValue31), scalarValue31) : fma(scalarValue15, scalarValue24 - multiplyAddValue128, multiplyAddValue128);
    float multiplyAddValue132 = conditionValue9 ? fma(scalarValue16, fma(scalarValue32, fragmentVectorConstants1.packedValues[0u].y, -scalarValue32), scalarValue32) : fma(scalarValue15, scalarValue25 - multiplyAddValue129, multiplyAddValue129);
    float multiplyAddValue133 = conditionValue9 ? fma(scalarValue16, fma(scalarValue33, fragmentVectorConstants1.packedValues[0u].z, -scalarValue33), scalarValue33) : fma(scalarValue15, scalarValue26 - multiplyAddValue130, multiplyAddValue130);
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue131, multiplyAddValue63, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue131 * multiplyAddValue63);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue132, multiplyAddValue64, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue132 * multiplyAddValue64);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue133, multiplyAddValue65, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue133 * multiplyAddValue65);
    uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue34 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue34 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue34 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    if ((scalarValue34 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue138 = sampledTextureValue9.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue139 = sampledTextureValue9.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue192 = productValue138 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue193 = productValue138 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue194 = productValue138 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue36 = ceil(productValue139);
    float multiplyAddValue140 = fma(scalarValue36, fma(productValue139, fragmentVectorConstants1.packedValues[17u].x, -productValue192), productValue192);
    float multiplyAddValue141 = fma(scalarValue36, fma(productValue139, fragmentVectorConstants1.packedValues[17u].y, -productValue193), productValue193);
    float multiplyAddValue142 = fma(scalarValue36, fma(productValue139, fragmentVectorConstants1.packedValues[17u].z, -productValue194), productValue194);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue10.w;
    float multiplyAddValue143 = fma(scalarValue15, sampledTextureValue10.x - multiplyAddValue140, multiplyAddValue140);
    float multiplyAddValue144 = fma(scalarValue15, sampledTextureValue10.y - multiplyAddValue141, multiplyAddValue141);
    float multiplyAddValue145 = fma(scalarValue15, sampledTextureValue10.z - multiplyAddValue142, multiplyAddValue142);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue146 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue143, multiplyAddValue143);
    float multiplyAddValue147 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue144, multiplyAddValue144);
    float multiplyAddValue148 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue145, multiplyAddValue145);
    float multiplyAddValue91 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue92 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue93 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue146, multiplyAddValue91, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue146 * multiplyAddValue91);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue147, multiplyAddValue92, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue147 * multiplyAddValue92);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue148, multiplyAddValue93, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue148 * multiplyAddValue93);
    uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue34 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue34 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue34 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    if ((scalarValue34 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue10.x;
    float scalarValue25 = sampledTextureValue10.y;
    float scalarValue26 = sampledTextureValue10.z;
    float scalarValue15 = sampledTextureValue10.w;
    bool productValue149 = ((1.0 - scalarValue15) * (scalarValue26 + (scalarValue25 + scalarValue24))) > 0.0;
    float multiplyAddValue99 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue9.x, -scalarValue24) + scalarValue24) : scalarValue24;
    float multiplyAddValue100 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue9.y, -scalarValue25) + scalarValue25) : scalarValue25;
    float productValue220 = multiplyAddValue99 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue221 = multiplyAddValue99 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue222 = multiplyAddValue99 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue38 = ceil(multiplyAddValue100);
    float multiplyAddValue155 = fma(scalarValue38, fma(multiplyAddValue100, fragmentVectorConstants1.packedValues[17u].x, -productValue220), productValue220);
    float multiplyAddValue156 = fma(scalarValue38, fma(multiplyAddValue100, fragmentVectorConstants1.packedValues[17u].y, -productValue221), productValue221);
    float multiplyAddValue157 = fma(scalarValue38, fma(multiplyAddValue100, fragmentVectorConstants1.packedValues[17u].z, -productValue222), productValue222);
    float multiplyAddValue158 = fma(scalarValue15, scalarValue24 - multiplyAddValue155, multiplyAddValue155);
    float multiplyAddValue159 = fma(scalarValue15, scalarValue25 - multiplyAddValue156, multiplyAddValue156);
    float multiplyAddValue160 = fma(scalarValue15, scalarValue26 - multiplyAddValue157, multiplyAddValue157);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue161 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue158, multiplyAddValue158);
    float multiplyAddValue162 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue159, multiplyAddValue159);
    float multiplyAddValue163 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue160, multiplyAddValue160);
    float multiplyAddValue91 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue92 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue93 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue161, multiplyAddValue91, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue161 * multiplyAddValue91);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue162, multiplyAddValue92, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue162 * multiplyAddValue92);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue163, multiplyAddValue93, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue163 * multiplyAddValue93);
    uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue34 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue34 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue34 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue22;
    float intermediateValue23;
    float intermediateValue24;
    if ((scalarValue34 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue158 = sampledTextureValue9.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue159 = sampledTextureValue9.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue230 = productValue158 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue231 = productValue158 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue232 = productValue158 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue40 = ceil(productValue159);
    float multiplyAddValue167 = fma(scalarValue40, fma(productValue159, fragmentVectorConstants1.packedValues[18u].x, -productValue230), productValue230);
    float multiplyAddValue168 = fma(scalarValue40, fma(productValue159, fragmentVectorConstants1.packedValues[18u].y, -productValue231), productValue231);
    float multiplyAddValue169 = fma(scalarValue40, fma(productValue159, fragmentVectorConstants1.packedValues[18u].z, -productValue232), productValue232);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue10.w;
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue31 = sampledTextureValue11.x;
    float scalarValue32 = sampledTextureValue11.y;
    float scalarValue33 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = fragmentScalarConstants1.packedValues[52u] < scalarValue16;
    float multiplyAddValue170 = conditionValue9 ? fma(scalarValue16, fma(scalarValue31, fragmentVectorConstants1.packedValues[0u].x, -scalarValue31), scalarValue31) : fma(scalarValue15, sampledTextureValue10.x - multiplyAddValue167, multiplyAddValue167);
    float multiplyAddValue171 = conditionValue9 ? fma(scalarValue16, fma(scalarValue32, fragmentVectorConstants1.packedValues[0u].y, -scalarValue32), scalarValue32) : fma(scalarValue15, sampledTextureValue10.y - multiplyAddValue168, multiplyAddValue168);
    float multiplyAddValue172 = conditionValue9 ? fma(scalarValue16, fma(scalarValue33, fragmentVectorConstants1.packedValues[0u].z, -scalarValue33), scalarValue33) : fma(scalarValue15, sampledTextureValue10.z - multiplyAddValue169, multiplyAddValue169);
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue170, multiplyAddValue63, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue170 * multiplyAddValue63);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue171, multiplyAddValue64, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue171 * multiplyAddValue64);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue172, multiplyAddValue65, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue172 * multiplyAddValue65);
    uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue34 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue34 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue34 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue23;
    float intermediateValue24;
    float intermediateValue25;
    if ((scalarValue34 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue10.x;
    float scalarValue25 = sampledTextureValue10.y;
    float scalarValue26 = sampledTextureValue10.z;
    float scalarValue15 = sampledTextureValue10.w;
    bool productValue149 = ((1.0 - scalarValue15) * (scalarValue26 + (scalarValue25 + scalarValue24))) > 0.0;
    float multiplyAddValue124 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue9.x, -scalarValue24) + scalarValue24) : scalarValue24;
    float multiplyAddValue125 = productValue149 ? (fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue9.y, -scalarValue25) + scalarValue25) : scalarValue25;
    float productValue249 = multiplyAddValue124 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue250 = multiplyAddValue124 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue251 = multiplyAddValue124 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue42 = ceil(multiplyAddValue125);
    float multiplyAddValue179 = fma(scalarValue42, fma(multiplyAddValue125, fragmentVectorConstants1.packedValues[18u].x, -productValue249), productValue249);
    float multiplyAddValue180 = fma(scalarValue42, fma(multiplyAddValue125, fragmentVectorConstants1.packedValues[18u].y, -productValue250), productValue250);
    float multiplyAddValue181 = fma(scalarValue42, fma(multiplyAddValue125, fragmentVectorConstants1.packedValues[18u].z, -productValue251), productValue251);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue31 = sampledTextureValue11.x;
    float scalarValue32 = sampledTextureValue11.y;
    float scalarValue33 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = fragmentScalarConstants1.packedValues[52u] < scalarValue16;
    float multiplyAddValue182 = conditionValue9 ? fma(scalarValue16, fma(scalarValue31, fragmentVectorConstants1.packedValues[0u].x, -scalarValue31), scalarValue31) : fma(scalarValue15, scalarValue24 - multiplyAddValue179, multiplyAddValue179);
    float multiplyAddValue183 = conditionValue9 ? fma(scalarValue16, fma(scalarValue32, fragmentVectorConstants1.packedValues[0u].y, -scalarValue32), scalarValue32) : fma(scalarValue15, scalarValue25 - multiplyAddValue180, multiplyAddValue180);
    float multiplyAddValue184 = conditionValue9 ? fma(scalarValue16, fma(scalarValue33, fragmentVectorConstants1.packedValues[0u].z, -scalarValue33), scalarValue33) : fma(scalarValue15, scalarValue26 - multiplyAddValue181, multiplyAddValue181);
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue182, multiplyAddValue63, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue182 * multiplyAddValue63);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue183, multiplyAddValue64, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue183 * multiplyAddValue64);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue184, multiplyAddValue65, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue184 * multiplyAddValue65);
    uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    bool comparisonValue28 = (scalarValue34 & 16u) == 16u;
    bool comparisonValue29 = (scalarValue34 & 4u) == 4u;
    bool comparisonValue30 = (scalarValue34 & 8u) == 8u;
    float comparisonValue3;
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
    if ((scalarValue34 & 1u) == 1u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * fragmentVectorConstants1.packedValues[15u].x;
    float productValue23 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[15u].y;
    float productValue24 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[15u].z;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue25 = ((sampledTextureValue1.x - productValue) * scalarValue) + productValue;
    float productValue26 = ((sampledTextureValue1.y - productValue23) * scalarValue) + productValue23;
    float productValue27 = ((sampledTextureValue1.z - productValue24) * scalarValue) + productValue24;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue28 = (((sampledTextureValue2.x - productValue25) * scalarValue1) + productValue25) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue29 = (((sampledTextureValue2.y - productValue26) * scalarValue1) + productValue26) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue30 = (((sampledTextureValue2.z - productValue27) * scalarValue1) + productValue27) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue2 = uint(int(fragmentVectorConstants1.packedValues[0u].x));
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if ((scalarValue2 & 1u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue48 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0 - scalarValue)) > 0.0);
    float productValue49 = productValue48 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[15u].x) - scalarValue9);
    float productValue50 = productValue48 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[15u].y) - scalarValue10);
    float productValue51 = productValue48 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[15u].z) - scalarValue11);
    float productValue52 = (productValue49 + scalarValue9) - (productValue49 * scalarValue);
    float productValue53 = (productValue50 + scalarValue10) - (productValue50 * scalarValue);
    float productValue54 = (productValue51 + scalarValue11) - (productValue51 * scalarValue);
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue55 = (((sampledTextureValue2.x - productValue52) * scalarValue1) + productValue52) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue56 = (((sampledTextureValue2.y - productValue53) * scalarValue1) + productValue53) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue57 = (((sampledTextureValue2.z - productValue54) * scalarValue1) + productValue54) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue2 = uint(int(fragmentVectorConstants1.packedValues[0u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue2 & 1u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue82 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue83 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue84 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue2.x;
    float scalarValue28 = sampledTextureValue2.y;
    float scalarValue29 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue3;
    float productValue4;
    float productValue5;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[13u].x)
    {
        productValue3 = (((fragmentVectorConstants1.packedValues[0u].x * scalarValue27) - scalarValue27) * scalarValue1) + scalarValue27;
        productValue4 = (((fragmentVectorConstants1.packedValues[0u].y * scalarValue28) - scalarValue28) * scalarValue1) + scalarValue28;
        productValue5 = (((fragmentVectorConstants1.packedValues[0u].z * scalarValue29) - scalarValue29) * scalarValue1) + scalarValue29;
    }
    else
    {
        productValue3 = ((sampledTextureValue1.x - productValue82) * scalarValue) + productValue82;
        productValue4 = ((sampledTextureValue1.y - productValue83) * scalarValue) + productValue83;
        productValue5 = ((sampledTextureValue1.z - productValue84) * scalarValue) + productValue84;
    }
    float productValue85 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue3;
    float productValue86 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue4;
    float productValue87 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue5;
    uint scalarValue30 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue30 & 1u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue48 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0 - scalarValue)) > 0.0);
    float productValue90 = productValue48 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue9);
    float productValue91 = productValue48 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue10);
    float productValue92 = productValue48 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue11);
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue2.x;
    float scalarValue28 = sampledTextureValue2.y;
    float scalarValue29 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue4;
    float productValue5;
    float productValue6;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[13u].x)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue106 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue107 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue108 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[16u].z;
    float productValue109 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[16u].w;
    float productValue110 = (((productValue106 * fragmentVectorConstants1.packedValues[0u].x) - productValue106) * productValue109) + productValue106;
    float productValue111 = (((productValue107 * fragmentVectorConstants1.packedValues[0u].y) - productValue107) * productValue109) + productValue107;
    float productValue112 = (((productValue108 * fragmentVectorConstants1.packedValues[0u].z) - productValue108) * productValue109) + productValue108;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue113 = ((sampledTextureValue1.x - productValue110) * scalarValue) + productValue110;
    float productValue114 = ((sampledTextureValue1.y - productValue111) * scalarValue) + productValue111;
    float productValue115 = ((sampledTextureValue1.z - productValue112) * scalarValue) + productValue112;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue116 = (((sampledTextureValue2.x - productValue113) * scalarValue1) + productValue113) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue117 = (((sampledTextureValue2.y - productValue114) * scalarValue1) + productValue114) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue118 = (((sampledTextureValue2.z - productValue115) * scalarValue1) + productValue115) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue30 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if ((scalarValue30 & 1u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue48 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0 - scalarValue)) > 0.0);
    float productValue123 = (productValue48 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x) - scalarValue9)) + scalarValue9;
    float productValue124 = (productValue48 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y) - scalarValue10)) + scalarValue10;
    float productValue125 = (productValue48 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[16u].z) - scalarValue11)) + scalarValue11;
    float productValue126 = (productValue48 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[16u].w) - scalarValue)) + scalarValue;
    float productValue127 = (((productValue123 * fragmentVectorConstants1.packedValues[0u].x) - productValue123) * productValue126) + productValue123;
    float productValue128 = (((productValue124 * fragmentVectorConstants1.packedValues[0u].y) - productValue124) * productValue126) + productValue124;
    float productValue129 = (((productValue125 * fragmentVectorConstants1.packedValues[0u].z) - productValue125) * productValue126) + productValue125;
    float productValue130 = ((scalarValue9 - productValue127) * scalarValue) + productValue127;
    float productValue131 = ((scalarValue10 - productValue128) * scalarValue) + productValue128;
    float productValue132 = ((scalarValue11 - productValue129) * scalarValue) + productValue129;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue133 = (((sampledTextureValue2.x - productValue130) * scalarValue1) + productValue130) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue134 = (((sampledTextureValue2.y - productValue131) * scalarValue1) + productValue131) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue135 = (((sampledTextureValue2.z - productValue132) * scalarValue1) + productValue132) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue30 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue30 & 1u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue82 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue83 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue84 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue150 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[17u].w;
    float productValue151 = (((productValue82 * fragmentVectorConstants1.packedValues[0u].x) - productValue82) * productValue150) + productValue82;
    float productValue152 = (((productValue83 * fragmentVectorConstants1.packedValues[0u].y) - productValue83) * productValue150) + productValue83;
    float productValue153 = (((productValue84 * fragmentVectorConstants1.packedValues[0u].z) - productValue84) * productValue150) + productValue84;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue2.x;
    float scalarValue28 = sampledTextureValue2.y;
    float scalarValue29 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue7;
    float productValue8;
    float productValue9;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[13u].x)
    {
        productValue7 = (((scalarValue27 * fragmentVectorConstants1.packedValues[0u].x) - scalarValue27) * scalarValue1) + scalarValue27;
        productValue8 = (((scalarValue28 * fragmentVectorConstants1.packedValues[0u].y) - scalarValue28) * scalarValue1) + scalarValue28;
        productValue9 = (((scalarValue29 * fragmentVectorConstants1.packedValues[0u].z) - scalarValue29) * scalarValue1) + scalarValue29;
    }
    else
    {
        productValue7 = ((sampledTextureValue1.x - productValue151) * scalarValue) + productValue151;
        productValue8 = ((sampledTextureValue1.y - productValue152) * scalarValue) + productValue152;
        productValue9 = ((sampledTextureValue1.z - productValue153) * scalarValue) + productValue153;
    }
    float productValue154 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue7;
    float productValue155 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue8;
    float productValue156 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue9;
    uint scalarValue30 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue30 & 1u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue48 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0 - scalarValue)) > 0.0);
    float productValue162 = (productValue48 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue9)) + scalarValue9;
    float productValue163 = (productValue48 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue10)) + scalarValue10;
    float productValue164 = (productValue48 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue11)) + scalarValue11;
    float productValue165 = (productValue48 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue)) + scalarValue;
    float productValue166 = (((productValue162 * fragmentVectorConstants1.packedValues[0u].x) - productValue162) * productValue165) + productValue162;
    float productValue167 = (((productValue163 * fragmentVectorConstants1.packedValues[0u].y) - productValue163) * productValue165) + productValue163;
    float productValue168 = (((productValue164 * fragmentVectorConstants1.packedValues[0u].z) - productValue164) * productValue165) + productValue164;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue2.x;
    float scalarValue28 = sampledTextureValue2.y;
    float scalarValue29 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[13u].x)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue106 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue107 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue173 = fragmentVectorConstants1.packedValues[0u].x * productValue106;
    float productValue174 = fragmentVectorConstants1.packedValues[0u].y * productValue106;
    float productValue175 = fragmentVectorConstants1.packedValues[0u].z * productValue106;
    float scalarValue35 = ceil(productValue107);
    float productValue176 = (((productValue107 * fragmentVectorConstants1.packedValues[17u].x) - productValue173) * scalarValue35) + productValue173;
    float productValue177 = (((productValue107 * fragmentVectorConstants1.packedValues[17u].y) - productValue174) * scalarValue35) + productValue174;
    float productValue178 = (((productValue107 * fragmentVectorConstants1.packedValues[17u].z) - productValue175) * scalarValue35) + productValue175;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue179 = ((sampledTextureValue1.x - productValue176) * scalarValue) + productValue176;
    float productValue180 = ((sampledTextureValue1.y - productValue177) * scalarValue) + productValue177;
    float productValue181 = ((sampledTextureValue1.z - productValue178) * scalarValue) + productValue178;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue182 = (((sampledTextureValue2.x - productValue179) * scalarValue1) + productValue179) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue183 = (((sampledTextureValue2.y - productValue180) * scalarValue1) + productValue180) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue184 = (((sampledTextureValue2.z - productValue181) * scalarValue1) + productValue181) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue30 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if ((scalarValue30 & 1u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue48 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0 - scalarValue)) > 0.0);
    float productValue123 = (productValue48 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x) - scalarValue9)) + scalarValue9;
    float productValue124 = (productValue48 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y) - scalarValue10)) + scalarValue10;
    float productValue200 = productValue123 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue201 = productValue123 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue202 = productValue123 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue37 = ceil(productValue124);
    float productValue203 = (((productValue124 * fragmentVectorConstants1.packedValues[17u].x) - productValue200) * scalarValue37) + productValue200;
    float productValue204 = (((productValue124 * fragmentVectorConstants1.packedValues[17u].y) - productValue201) * scalarValue37) + productValue201;
    float productValue205 = (((productValue124 * fragmentVectorConstants1.packedValues[17u].z) - productValue202) * scalarValue37) + productValue202;
    float productValue206 = ((scalarValue9 - productValue203) * scalarValue) + productValue203;
    float productValue207 = ((scalarValue10 - productValue204) * scalarValue) + productValue204;
    float productValue208 = ((scalarValue11 - productValue205) * scalarValue) + productValue205;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue209 = (((sampledTextureValue2.x - productValue206) * scalarValue1) + productValue206) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue210 = (((sampledTextureValue2.y - productValue207) * scalarValue1) + productValue207) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue211 = (((sampledTextureValue2.z - productValue208) * scalarValue1) + productValue208) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue30 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue30 & 1u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue82 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue83 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue223 = fragmentVectorConstants1.packedValues[0u].x * productValue82;
    float productValue224 = fragmentVectorConstants1.packedValues[0u].y * productValue82;
    float productValue225 = fragmentVectorConstants1.packedValues[0u].z * productValue82;
    float scalarValue39 = ceil(productValue83);
    float productValue226 = (((productValue83 * fragmentVectorConstants1.packedValues[18u].x) - productValue223) * scalarValue39) + productValue223;
    float productValue227 = (((productValue83 * fragmentVectorConstants1.packedValues[18u].y) - productValue224) * scalarValue39) + productValue224;
    float productValue228 = (((productValue83 * fragmentVectorConstants1.packedValues[18u].z) - productValue225) * scalarValue39) + productValue225;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue2.x;
    float scalarValue28 = sampledTextureValue2.y;
    float scalarValue29 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[13u].x)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue48 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0 - scalarValue)) > 0.0);
    float productValue162 = (productValue48 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue9)) + scalarValue9;
    float productValue163 = (productValue48 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue10)) + scalarValue10;
    float productValue233 = productValue162 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue234 = productValue162 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue235 = productValue162 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue41 = ceil(productValue163);
    float productValue236 = (((productValue163 * fragmentVectorConstants1.packedValues[18u].x) - productValue233) * scalarValue41) + productValue233;
    float productValue237 = (((productValue163 * fragmentVectorConstants1.packedValues[18u].y) - productValue234) * scalarValue41) + productValue234;
    float productValue238 = (((productValue163 * fragmentVectorConstants1.packedValues[18u].z) - productValue235) * scalarValue41) + productValue235;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue2.x;
    float scalarValue28 = sampledTextureValue2.y;
    float scalarValue29 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue9;
    float productValue10;
    float productValue11;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[13u].x)
#endif
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue17 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[72u];
        intermediateValue21 = sampledTextureValue12.x;
        intermediateValue22 = sampledTextureValue12.z;
        intermediateValue23 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue34 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[80u];
        intermediateValue25 = sampledTextureValue12.x;
        intermediateValue26 = sampledTextureValue12.z;
        intermediateValue27 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue34 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[76u];
        intermediateValue18 = sampledTextureValue12.x;
        intermediateValue19 = sampledTextureValue12.z;
        intermediateValue20 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue34 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[76u];
        intermediateValue21 = sampledTextureValue12.x;
        intermediateValue22 = sampledTextureValue12.z;
        intermediateValue23 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue34 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[80u];
        intermediateValue22 = sampledTextureValue12.x;
        intermediateValue23 = sampledTextureValue12.z;
        intermediateValue24 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue34 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[80u];
        intermediateValue19 = sampledTextureValue12.x;
        intermediateValue20 = sampledTextureValue12.z;
        intermediateValue21 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue34 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[84u];
        intermediateValue23 = sampledTextureValue12.x;
        intermediateValue24 = sampledTextureValue12.z;
        intermediateValue25 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue3 = ((scalarValue34 & 2u) == 2u) ? sampledTextureValue12.w : fragmentScalarConstants1.packedValues[84u];
        intermediateValue26 = sampledTextureValue12.x;
        intermediateValue27 = sampledTextureValue12.z;
        intermediateValue28 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue4 = fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[18u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue7 = fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[18u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue7 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue4 = (((fragmentVectorConstants1.packedValues[0u].x * scalarValue27) - scalarValue27) * scalarValue1) + scalarValue27;
        productValue5 = (((fragmentVectorConstants1.packedValues[0u].y * scalarValue28) - scalarValue28) * scalarValue1) + scalarValue28;
        productValue6 = (((fragmentVectorConstants1.packedValues[0u].z * scalarValue29) - scalarValue29) * scalarValue1) + scalarValue29;
    }
    else
    {
        productValue4 = (productValue90 + scalarValue9) - (productValue90 * scalarValue);
        productValue5 = (productValue91 + scalarValue10) - (productValue91 * scalarValue);
        productValue6 = (productValue92 + scalarValue11) - (productValue92 * scalarValue);
    }
    float productValue93 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue4;
    float productValue94 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue5;
    float productValue95 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue6;
    uint scalarValue30 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue30 & 1u) == 0u)
    {
        intermediateValue10 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue11 = fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue4 = fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue7 = fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue8 = (((scalarValue27 * fragmentVectorConstants1.packedValues[0u].x) - scalarValue27) * scalarValue1) + scalarValue27;
        productValue9 = (((scalarValue28 * fragmentVectorConstants1.packedValues[0u].y) - scalarValue28) * scalarValue1) + scalarValue28;
        productValue10 = (((scalarValue29 * fragmentVectorConstants1.packedValues[0u].z) - scalarValue29) * scalarValue1) + scalarValue29;
    }
    else
    {
        productValue8 = ((scalarValue9 - productValue166) * scalarValue) + productValue166;
        productValue9 = ((scalarValue10 - productValue167) * scalarValue) + productValue167;
        productValue10 = ((scalarValue11 - productValue168) * scalarValue) + productValue168;
    }
    float productValue169 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue8;
    float productValue170 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue9;
    float productValue171 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue10;
    uint scalarValue30 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue30 & 1u) == 0u)
    {
        intermediateValue10 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue11 = fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue5 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue8 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue11 = fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue8 = (((scalarValue27 * fragmentVectorConstants1.packedValues[0u].x) - scalarValue27) * scalarValue1) + scalarValue27;
        productValue9 = (((scalarValue28 * fragmentVectorConstants1.packedValues[0u].y) - scalarValue28) * scalarValue1) + scalarValue28;
        productValue10 = (((scalarValue29 * fragmentVectorConstants1.packedValues[0u].z) - scalarValue29) * scalarValue1) + scalarValue29;
    }
    else
    {
        productValue8 = ((sampledTextureValue1.x - productValue226) * scalarValue) + productValue226;
        productValue9 = ((sampledTextureValue1.y - productValue227) * scalarValue) + productValue227;
        productValue10 = ((sampledTextureValue1.z - productValue228) * scalarValue) + productValue228;
    }
    float productValue169 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue8;
    float productValue170 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue9;
    float productValue171 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue10;
    uint scalarValue30 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue30 & 1u) == 0u)
    {
        intermediateValue8 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[20u].x;
        intermediateValue11 = fragmentVectorConstants1.packedValues[21u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue9 = (((scalarValue27 * fragmentVectorConstants1.packedValues[0u].x) - scalarValue27) * scalarValue1) + scalarValue27;
        productValue10 = (((scalarValue28 * fragmentVectorConstants1.packedValues[0u].y) - scalarValue28) * scalarValue1) + scalarValue28;
        productValue11 = (((scalarValue29 * fragmentVectorConstants1.packedValues[0u].z) - scalarValue29) * scalarValue1) + scalarValue29;
    }
    else
    {
        productValue9 = ((scalarValue9 - productValue236) * scalarValue) + productValue236;
        productValue10 = ((scalarValue10 - productValue237) * scalarValue) + productValue237;
        productValue11 = ((scalarValue11 - productValue238) * scalarValue) + productValue238;
    }
    float productValue239 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue9;
    float productValue240 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue10;
    float productValue241 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue11;
    uint scalarValue30 = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((scalarValue30 & 1u) == 0u)
    {
        intermediateValue11 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[20u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[21u].x;
#endif
    }
    else
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue21 = fragmentScalarConstants1.packedValues[64u];
        intermediateValue22 = fragmentScalarConstants1.packedValues[68u];
        intermediateValue23 = fragmentScalarConstants1.packedValues[52u];
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue25 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue26 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue27 = fragmentScalarConstants1.packedValues[60u];
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue18 = fragmentScalarConstants1.packedValues[68u];
        intermediateValue19 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue20 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue21 = fragmentScalarConstants1.packedValues[68u];
        intermediateValue22 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue23 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue22 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue23 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue24 = fragmentScalarConstants1.packedValues[60u];
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue19 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue20 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue21 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue22 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue23 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue24 = fragmentScalarConstants1.packedValues[56u];
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[84u];
        intermediateValue23 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue24 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue25 = fragmentScalarConstants1.packedValues[60u];
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        comparisonValue3 = fragmentScalarConstants1.packedValues[84u];
        intermediateValue26 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue27 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue28 = fragmentScalarConstants1.packedValues[60u];
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue4 = sampledTextureValue3.x;
        intermediateValue5 = sampledTextureValue3.y;
        intermediateValue6 = sampledTextureValue3.z;
        intermediateValue7 = ((scalarValue2 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[18u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue3.x;
        intermediateValue8 = sampledTextureValue3.y;
        intermediateValue9 = sampledTextureValue3.z;
        intermediateValue10 = ((scalarValue2 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[18u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue3.x;
        intermediateValue8 = sampledTextureValue3.y;
        intermediateValue9 = sampledTextureValue3.z;
        intermediateValue10 = ((scalarValue30 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue10 = sampledTextureValue3.x;
        intermediateValue11 = sampledTextureValue3.y;
        intermediateValue12 = sampledTextureValue3.z;
        intermediateValue13 = ((scalarValue30 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue4 = sampledTextureValue3.x;
        intermediateValue5 = sampledTextureValue3.y;
        intermediateValue6 = sampledTextureValue3.z;
        intermediateValue7 = ((scalarValue30 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue3.x;
        intermediateValue8 = sampledTextureValue3.y;
        intermediateValue9 = sampledTextureValue3.z;
        intermediateValue10 = ((scalarValue30 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[19u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue5 = sampledTextureValue3.x;
        intermediateValue6 = sampledTextureValue3.y;
        intermediateValue7 = sampledTextureValue3.z;
        intermediateValue8 = ((scalarValue30 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue8 = sampledTextureValue3.x;
        intermediateValue9 = sampledTextureValue3.y;
        intermediateValue10 = sampledTextureValue3.z;
        intermediateValue11 = ((scalarValue30 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[20u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue8 = sampledTextureValue3.x;
        intermediateValue9 = sampledTextureValue3.y;
        intermediateValue10 = sampledTextureValue3.z;
        intermediateValue11 = ((scalarValue30 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[21u].x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue11 = sampledTextureValue3.x;
        intermediateValue12 = sampledTextureValue3.y;
        intermediateValue13 = sampledTextureValue3.z;
        intermediateValue14 = ((scalarValue30 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[21u].x;
#endif
    }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue1;
    float productValue2;
    float productValue3;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue2;
    float productValue3;
    float productValue4;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue1;
    float productValue2;
    float productValue3;
    if (comparisonValue28 || (comparisonValue30 || comparisonValue29))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue2;
    float productValue3;
    float productValue4;
    if (comparisonValue28 || (comparisonValue30 || comparisonValue29))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue5;
    float productValue6;
    float productValue7;
    if (comparisonValue28 || (comparisonValue30 || comparisonValue29))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue6;
    float productValue7;
    float productValue8;
    if (comparisonValue28 || (comparisonValue30 || comparisonValue29))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue2 & 28u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue2 & 28u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue30 & 28u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((scalarValue30 & 28u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue30 & 28u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue30 & 28u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((scalarValue30 & 28u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if ((scalarValue30 & 28u) == 0u)
#endif
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue26;
        if (comparisonValue8)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue16;
        float multiplyAddValue17;
        float multiplyAddValue18;
        bool intermediateValue26;
        if (comparisonValue8)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue10;
        float multiplyAddValue11;
        float multiplyAddValue12;
        bool intermediateValue30;
        if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue30;
        if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue16;
        float multiplyAddValue17;
        float multiplyAddValue18;
        bool intermediateValue23;
        if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue20;
        float multiplyAddValue21;
        float multiplyAddValue22;
        bool intermediateValue26;
        if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue27;
        if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue17;
        float multiplyAddValue18;
        float multiplyAddValue19;
        bool intermediateValue30;
        if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue16;
        float multiplyAddValue17;
        float multiplyAddValue18;
        bool intermediateValue24;
        if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue18;
        float multiplyAddValue19;
        float multiplyAddValue20;
        bool intermediateValue27;
        if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue28;
        if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        bool intermediateValue31;
        if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue8 = varyingNormal0.x;
        intermediateValue9 = varyingNormal0.y;
        intermediateValue10 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        if ((scalarValue2 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = varyingNormal0.x;
        intermediateValue12 = varyingNormal0.y;
        intermediateValue13 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue2 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = varyingNormal0.x;
        intermediateValue12 = varyingNormal0.y;
        intermediateValue13 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue30 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue14 = varyingNormal0.x;
        intermediateValue15 = varyingNormal0.y;
        intermediateValue16 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
        if ((scalarValue30 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue8 = varyingNormal0.x;
        intermediateValue9 = varyingNormal0.y;
        intermediateValue10 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        if ((scalarValue30 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue9 = varyingNormal0.x;
        intermediateValue10 = varyingNormal0.y;
        intermediateValue11 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        if ((scalarValue30 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue12 = varyingNormal0.x;
        intermediateValue13 = varyingNormal0.y;
        intermediateValue14 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
        if ((scalarValue30 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = varyingNormal0.x;
        intermediateValue16 = varyingNormal0.y;
        intermediateValue17 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
        if ((scalarValue30 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue12;
            float productValue13;
            float productValue14;
            bool intermediateValue27;
            if (comparisonValue9)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue16 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue27;
            if (comparisonValue9)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue10 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue12 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue30 = true;
        }
        else
        {
            float productValue12;
            float productValue13;
            float productValue14;
            bool intermediateValue31;
            if (comparisonValue30)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue30 = true;
        }
        else
        {
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue31;
            if (comparisonValue30)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue16 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue23 = true;
        }
        else
        {
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue24;
            if (comparisonValue30)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue20 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue21 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue22 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue27;
            if (comparisonValue30)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue27 = true;
        }
        else
        {
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue28;
            if (comparisonValue30)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue17 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue19 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue30 = true;
        }
        else
        {
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue31;
            if (comparisonValue30)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue16 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue24 = true;
        }
        else
        {
            float productValue17;
            float productValue18;
            float productValue19;
            bool intermediateValue25;
            if (comparisonValue30)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue18 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue19 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue20 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue27 = true;
        }
        else
        {
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue28;
            if (comparisonValue30)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue28 = true;
        }
        else
        {
            float productValue17;
            float productValue18;
            float productValue19;
            bool intermediateValue29;
            if (comparisonValue30)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue15 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue31 = true;
        }
        else
        {
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue32;
            if (comparisonValue30)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue2 & 8u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue30 & 8u) == 0u)
#endif
            {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue18 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue18 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue66 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue67 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue66 - 0.5) < 0.0625) ? (((productValue66 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue67 - 0.5) < 0.0625) ? (((productValue67 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue19 = sampledTextureValue16.x;
                float scalarValue20 = sampledTextureValue16.y;
                float scalarValue21 = sampledTextureValue16.z;
                float scalarValue22 = sampledTextureValue16.w;
                float multiplyAddValue30 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                bool conditionValue5 = multiplyAddValue30 > 0.5;
                float comparisonValue12 = conditionValue4 ? scalarValue19 : scalarValue22;
                float comparisonValue13 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue16 = conditionValue5 ? scalarValue21 : scalarValue22;
                float comparisonValue17 = conditionValue5 ? scalarValue20 : scalarValue19;
                float sumValue6 = multiplyAddValue30 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue30 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue31 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue27 = true;
                productValue14 = inverseLengthValue10 * comparisonValue18;
                productValue13 = inverseLengthValue10 * comparisonValue19;
                productValue12 = inverseLengthValue10 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue17;
                if (comparisonValue7)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue18 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue18 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue66 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue67 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue66 - 0.5) < 0.0625) ? (((productValue66 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue67 - 0.5) < 0.0625) ? (((productValue67 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue19 = sampledTextureValue16.x;
                float scalarValue20 = sampledTextureValue16.y;
                float scalarValue21 = sampledTextureValue16.z;
                float scalarValue22 = sampledTextureValue16.w;
                float multiplyAddValue30 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                bool conditionValue5 = multiplyAddValue30 > 0.5;
                float comparisonValue12 = conditionValue4 ? scalarValue19 : scalarValue22;
                float comparisonValue13 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue16 = conditionValue5 ? scalarValue21 : scalarValue22;
                float comparisonValue17 = conditionValue5 ? scalarValue20 : scalarValue19;
                float sumValue6 = multiplyAddValue30 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue30 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue31 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue27 = true;
                productValue15 = inverseLengthValue10 * comparisonValue18;
                productValue14 = inverseLengthValue10 * comparisonValue19;
                productValue13 = inverseLengthValue10 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue18;
                if (comparisonValue7)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue18 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue18 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue66 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue67 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue66 - 0.5) < 0.0625) ? (((productValue66 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue67 - 0.5) < 0.0625) ? (((productValue67 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue19 = sampledTextureValue16.x;
                float scalarValue20 = sampledTextureValue16.y;
                float scalarValue21 = sampledTextureValue16.z;
                float scalarValue22 = sampledTextureValue16.w;
                float multiplyAddValue30 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                bool conditionValue5 = multiplyAddValue30 > 0.5;
                float comparisonValue12 = conditionValue4 ? scalarValue19 : scalarValue22;
                float comparisonValue13 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue16 = conditionValue5 ? scalarValue21 : scalarValue22;
                float comparisonValue17 = conditionValue5 ? scalarValue20 : scalarValue19;
                float sumValue6 = multiplyAddValue30 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue30 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue31 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue31 = true;
                productValue14 = inverseLengthValue10 * comparisonValue18;
                productValue13 = inverseLengthValue10 * comparisonValue19;
                productValue12 = inverseLengthValue10 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue17;
                if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue18 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue18 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue66 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue67 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue66 - 0.5) < 0.0625) ? (((productValue66 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue67 - 0.5) < 0.0625) ? (((productValue67 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue19 = sampledTextureValue16.x;
                float scalarValue20 = sampledTextureValue16.y;
                float scalarValue21 = sampledTextureValue16.z;
                float scalarValue22 = sampledTextureValue16.w;
                float multiplyAddValue30 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                bool conditionValue5 = multiplyAddValue30 > 0.5;
                float comparisonValue12 = conditionValue4 ? scalarValue19 : scalarValue22;
                float comparisonValue13 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue16 = conditionValue5 ? scalarValue21 : scalarValue22;
                float comparisonValue17 = conditionValue5 ? scalarValue20 : scalarValue19;
                float sumValue6 = multiplyAddValue30 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue30 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue31 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue31 = true;
                productValue15 = inverseLengthValue10 * comparisonValue18;
                productValue14 = inverseLengthValue10 * comparisonValue19;
                productValue13 = inverseLengthValue10 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue18;
                if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue18 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue18 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue66 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue67 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue66 - 0.5) < 0.0625) ? (((productValue66 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue67 - 0.5) < 0.0625) ? (((productValue67 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue19 = sampledTextureValue16.x;
                float scalarValue20 = sampledTextureValue16.y;
                float scalarValue21 = sampledTextureValue16.z;
                float scalarValue22 = sampledTextureValue16.w;
                float multiplyAddValue30 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                bool conditionValue5 = multiplyAddValue30 > 0.5;
                float comparisonValue12 = conditionValue4 ? scalarValue19 : scalarValue22;
                float comparisonValue13 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue16 = conditionValue5 ? scalarValue21 : scalarValue22;
                float comparisonValue17 = conditionValue5 ? scalarValue20 : scalarValue19;
                float sumValue6 = multiplyAddValue30 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue30 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue31 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue24 = true;
                productValue18 = inverseLengthValue10 * comparisonValue18;
                productValue17 = inverseLengthValue10 * comparisonValue19;
                productValue16 = inverseLengthValue10 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue21;
                if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue18 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue18 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue66 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue67 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue66 - 0.5) < 0.0625) ? (((productValue66 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue67 - 0.5) < 0.0625) ? (((productValue67 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue19 = sampledTextureValue16.x;
                float scalarValue20 = sampledTextureValue16.y;
                float scalarValue21 = sampledTextureValue16.z;
                float scalarValue22 = sampledTextureValue16.w;
                float multiplyAddValue30 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                bool conditionValue5 = multiplyAddValue30 > 0.5;
                float comparisonValue12 = conditionValue4 ? scalarValue19 : scalarValue22;
                float comparisonValue13 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue16 = conditionValue5 ? scalarValue21 : scalarValue22;
                float comparisonValue17 = conditionValue5 ? scalarValue20 : scalarValue19;
                float sumValue6 = multiplyAddValue30 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue30 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue31 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue27 = true;
                productValue15 = inverseLengthValue10 * comparisonValue18;
                productValue14 = inverseLengthValue10 * comparisonValue19;
                productValue13 = inverseLengthValue10 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue18;
                if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue18 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue18 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue66 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue67 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue66 - 0.5) < 0.0625) ? (((productValue66 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue67 - 0.5) < 0.0625) ? (((productValue67 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue19 = sampledTextureValue16.x;
                float scalarValue20 = sampledTextureValue16.y;
                float scalarValue21 = sampledTextureValue16.z;
                float scalarValue22 = sampledTextureValue16.w;
                float multiplyAddValue30 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                bool conditionValue5 = multiplyAddValue30 > 0.5;
                float comparisonValue12 = conditionValue4 ? scalarValue19 : scalarValue22;
                float comparisonValue13 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue16 = conditionValue5 ? scalarValue21 : scalarValue22;
                float comparisonValue17 = conditionValue5 ? scalarValue20 : scalarValue19;
                float sumValue6 = multiplyAddValue30 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue30 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue31 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue28 = true;
                productValue18 = inverseLengthValue10 * comparisonValue18;
                productValue17 = inverseLengthValue10 * comparisonValue19;
                productValue16 = inverseLengthValue10 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue21;
                if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue18 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue18 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue66 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue67 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue66 - 0.5) < 0.0625) ? (((productValue66 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue67 - 0.5) < 0.0625) ? (((productValue67 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue19 = sampledTextureValue16.x;
                float scalarValue20 = sampledTextureValue16.y;
                float scalarValue21 = sampledTextureValue16.z;
                float scalarValue22 = sampledTextureValue16.w;
                float multiplyAddValue30 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                bool conditionValue5 = multiplyAddValue30 > 0.5;
                float comparisonValue12 = conditionValue4 ? scalarValue19 : scalarValue22;
                float comparisonValue13 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue16 = conditionValue5 ? scalarValue21 : scalarValue22;
                float comparisonValue17 = conditionValue5 ? scalarValue20 : scalarValue19;
                float sumValue6 = multiplyAddValue30 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue30 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue31 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue25 = true;
                productValue19 = inverseLengthValue10 * comparisonValue18;
                productValue18 = inverseLengthValue10 * comparisonValue19;
                productValue17 = inverseLengthValue10 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue22;
                if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue18 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue18 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue66 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue67 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue66 - 0.5) < 0.0625) ? (((productValue66 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue67 - 0.5) < 0.0625) ? (((productValue67 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue19 = sampledTextureValue16.x;
                float scalarValue20 = sampledTextureValue16.y;
                float scalarValue21 = sampledTextureValue16.z;
                float scalarValue22 = sampledTextureValue16.w;
                float multiplyAddValue30 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                bool conditionValue5 = multiplyAddValue30 > 0.5;
                float comparisonValue12 = conditionValue4 ? scalarValue19 : scalarValue22;
                float comparisonValue13 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue16 = conditionValue5 ? scalarValue21 : scalarValue22;
                float comparisonValue17 = conditionValue5 ? scalarValue20 : scalarValue19;
                float sumValue6 = multiplyAddValue30 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue30 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue31 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue29 = true;
                productValue19 = inverseLengthValue10 * comparisonValue18;
                productValue18 = inverseLengthValue10 * comparisonValue19;
                productValue17 = inverseLengthValue10 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue22;
                if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue18 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue14 ? scalarValue18 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue66 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue67 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue66 - 0.5) < 0.0625) ? (((productValue66 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue67 - 0.5) < 0.0625) ? (((productValue67 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue19 = sampledTextureValue16.x;
                float scalarValue20 = sampledTextureValue16.y;
                float scalarValue21 = sampledTextureValue16.z;
                float scalarValue22 = sampledTextureValue16.w;
                float multiplyAddValue30 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                bool conditionValue5 = multiplyAddValue30 > 0.5;
                float comparisonValue12 = conditionValue4 ? scalarValue19 : scalarValue22;
                float comparisonValue13 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue16 = conditionValue5 ? scalarValue21 : scalarValue22;
                float comparisonValue17 = conditionValue5 ? scalarValue20 : scalarValue19;
                float sumValue6 = multiplyAddValue30 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue30 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue31 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue13 : ((sumValue10 == 0u) ? comparisonValue12 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue13 : ((sumValue11 == 0u) ? comparisonValue12 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue = vec3(comparisonValue18, comparisonValue19, 0.25);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue32 = true;
                productValue18 = inverseLengthValue10 * comparisonValue18;
                productValue17 = inverseLengthValue10 * comparisonValue19;
                productValue16 = inverseLengthValue10 * 0.25;
            }
            else
            {
                float comparisonValue14;
                float comparisonValue15;
                float productValue21;
                if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue2 & 16u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue30 & 16u) == 0u)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue23 = sampledTextureValue18.x;
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? scalarValue23 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? sampledTextureValue18.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue32 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue33 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue32) : multiplyAddValue32;
                    float multiplyAddValue35 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    bool comparisonValue22 = abs(multiplyAddValue34) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue34 : 0.0, comparisonValue23 ? multiplyAddValue35 : 0.0, 0.25);
                    float inverseLengthValue11 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue11 * multiplyAddValue34) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue11 * multiplyAddValue35) : 0.0;
                    productValue17 = inverseLengthValue11 * 0.25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue23 = sampledTextureValue18.x;
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? scalarValue23 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? sampledTextureValue18.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue32 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue33 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue32) : multiplyAddValue32;
                    float multiplyAddValue35 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    bool comparisonValue22 = abs(multiplyAddValue34) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue34 : 0.0, comparisonValue23 ? multiplyAddValue35 : 0.0, 0.25);
                    float inverseLengthValue11 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue11 * multiplyAddValue34) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue11 * multiplyAddValue35) : 0.0;
                    productValue18 = inverseLengthValue11 * 0.25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue23 = sampledTextureValue18.x;
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? scalarValue23 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? sampledTextureValue18.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue32 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue33 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue32) : multiplyAddValue32;
                    float multiplyAddValue35 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    bool comparisonValue22 = abs(multiplyAddValue34) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue34 : 0.0, comparisonValue23 ? multiplyAddValue35 : 0.0, 0.25);
                    float inverseLengthValue11 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue11 * multiplyAddValue34) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue11 * multiplyAddValue35) : 0.0;
                    productValue21 = inverseLengthValue11 * 0.25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue23 = sampledTextureValue18.x;
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue20 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? scalarValue23 : 0u) * varyingTexCoord0.x);
                    float comparisonValue21 = fract(rdEvaluateFloatExpression(sampledTextureValue17 ? sampledTextureValue18.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue32 = (comparisonValue20 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue33 = (comparisonValue21 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (comparisonValue20 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue32) : multiplyAddValue32;
                    float multiplyAddValue35 = (comparisonValue21 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    bool comparisonValue22 = abs(multiplyAddValue34) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue34 : 0.0, comparisonValue23 ? multiplyAddValue35 : 0.0, 0.25);
                    float inverseLengthValue11 = inversesqrt(rdDot3Precise2(comparisonValue24, comparisonValue24));
                    comparisonValue14 = comparisonValue22 ? (inverseLengthValue11 * multiplyAddValue34) : 0.0;
                    comparisonValue15 = comparisonValue23 ? (inverseLengthValue11 * multiplyAddValue35) : 0.0;
                    productValue22 = inverseLengthValue11 * 0.25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
#endif
                }
                else
                {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue14 = intermediateValue41;
                    comparisonValue15 = intermediateValue41;
                    productValue17 = intermediateValue41;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue14 = intermediateValue41;
                    comparisonValue15 = intermediateValue41;
                    productValue18 = intermediateValue41;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue14 = intermediateValue45;
                    comparisonValue15 = intermediateValue45;
                    productValue17 = intermediateValue45;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue14 = intermediateValue45;
                    comparisonValue15 = intermediateValue45;
                    productValue18 = intermediateValue45;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue14 = intermediateValue38;
                    comparisonValue15 = intermediateValue38;
                    productValue21 = intermediateValue38;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue14 = intermediateValue42;
                    comparisonValue15 = intermediateValue42;
                    productValue21 = intermediateValue42;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue14 = intermediateValue39;
                    comparisonValue15 = intermediateValue39;
                    productValue22 = intermediateValue39;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue14 = intermediateValue43;
                    comparisonValue15 = intermediateValue43;
                    productValue22 = intermediateValue43;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue14 = intermediateValue46;
                    comparisonValue15 = intermediateValue46;
                    productValue21 = intermediateValue46;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue5 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue31 = fract(float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x);
                    float productValue32 = fract(float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue31 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.y * 2.0) + (-1.0))) - (((sampledTextureValue5.w * 2.0) + (-1.0)) * ((productValue31 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue1 = (((productValue32 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.z * 2.0) + (-1.0))) - (((productValue32 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue5.x * 2.0) + (-1.0)));
                    float comparisonValue2 = ((abs(comparisonValue) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue;
                    float comparisonValue6 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue2, comparisonValue6, 0.25), vec3(comparisonValue2, comparisonValue6, 0.25)));
                    branchMergedValue3 = comparisonValue2 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
#endif
                }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = comparisonValue7;
                productValue14 = comparisonValue14;
                productValue13 = comparisonValue15;
                productValue12 = productValue17;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = comparisonValue7;
                productValue15 = comparisonValue14;
                productValue14 = comparisonValue15;
                productValue13 = productValue18;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue31 = comparisonValue28;
                productValue14 = comparisonValue14;
                productValue13 = comparisonValue15;
                productValue12 = productValue17;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue31 = comparisonValue28;
                productValue15 = comparisonValue14;
                productValue14 = comparisonValue15;
                productValue13 = productValue18;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue24 = comparisonValue28;
                productValue18 = comparisonValue14;
                productValue17 = comparisonValue15;
                productValue16 = productValue21;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = comparisonValue28;
                productValue15 = comparisonValue14;
                productValue14 = comparisonValue15;
                productValue13 = productValue18;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue28 = comparisonValue28;
                productValue18 = comparisonValue14;
                productValue17 = comparisonValue15;
                productValue16 = productValue21;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue25 = comparisonValue28;
                productValue19 = comparisonValue14;
                productValue18 = comparisonValue15;
                productValue17 = productValue22;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue29 = comparisonValue28;
                productValue19 = comparisonValue14;
                productValue18 = comparisonValue15;
                productValue17 = productValue22;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue32 = comparisonValue28;
                productValue18 = comparisonValue14;
                productValue17 = comparisonValue15;
                productValue16 = productValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
#endif
            }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue13 = productValue12;
            multiplyAddValue14 = productValue13;
            multiplyAddValue15 = productValue14;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue16 = productValue13;
            multiplyAddValue17 = productValue14;
            multiplyAddValue18 = productValue15;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue10 = productValue12;
            multiplyAddValue11 = productValue13;
            multiplyAddValue12 = productValue14;
            intermediateValue30 = intermediateValue31;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue13 = productValue13;
            multiplyAddValue14 = productValue14;
            multiplyAddValue15 = productValue15;
            intermediateValue30 = intermediateValue31;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue16 = productValue16;
            multiplyAddValue17 = productValue17;
            multiplyAddValue18 = productValue18;
            intermediateValue23 = intermediateValue24;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue20 = productValue13;
            multiplyAddValue21 = productValue14;
            multiplyAddValue22 = productValue15;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue13 = productValue16;
            multiplyAddValue14 = productValue17;
            multiplyAddValue15 = productValue18;
            intermediateValue27 = intermediateValue28;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue17 = productValue13;
            multiplyAddValue18 = productValue14;
            multiplyAddValue19 = productValue15;
            intermediateValue30 = intermediateValue31;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue16 = productValue17;
            multiplyAddValue17 = productValue18;
            multiplyAddValue18 = productValue19;
            intermediateValue24 = intermediateValue25;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue18 = productValue16;
            multiplyAddValue19 = productValue17;
            multiplyAddValue20 = productValue18;
            intermediateValue27 = intermediateValue28;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue13 = productValue17;
            multiplyAddValue14 = productValue18;
            multiplyAddValue15 = productValue19;
            intermediateValue28 = intermediateValue29;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue15 = productValue16;
            multiplyAddValue16 = productValue17;
            multiplyAddValue17 = productValue18;
            intermediateValue31 = intermediateValue32;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue3 = fract(productValue33);
                float scalarValue4 = fract(productValue34);
                float comparisonValue4;
                if (abs(scalarValue3 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue5 = sampledTextureValue7.x;
                float scalarValue6 = sampledTextureValue7.y;
                float scalarValue7 = sampledTextureValue7.z;
                float scalarValue8 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue ? scalarValue6 : scalarValue7;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue1 ? scalarValue6 : scalarValue5;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue37;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue15 = branchMergedValue;
            intermediateValue16 = branchMergedValue1;
            intermediateValue17 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue3 = fract(productValue33);
                float scalarValue4 = fract(productValue34);
                float comparisonValue4;
                if (abs(scalarValue3 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue5 = sampledTextureValue7.x;
                float scalarValue6 = sampledTextureValue7.y;
                float scalarValue7 = sampledTextureValue7.z;
                float scalarValue8 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue ? scalarValue6 : scalarValue7;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue1 ? scalarValue6 : scalarValue5;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue37;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue18 = branchMergedValue;
            intermediateValue19 = branchMergedValue1;
            intermediateValue20 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue3 = fract(productValue33);
                float scalarValue4 = fract(productValue34);
                float comparisonValue4;
                if (abs(scalarValue3 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue5 = sampledTextureValue7.x;
                float scalarValue6 = sampledTextureValue7.y;
                float scalarValue7 = sampledTextureValue7.z;
                float scalarValue8 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue ? scalarValue6 : scalarValue7;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue1 ? scalarValue6 : scalarValue5;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue37;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue21 = branchMergedValue;
            intermediateValue22 = branchMergedValue1;
            intermediateValue23 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue3 = fract(productValue33);
                float scalarValue4 = fract(productValue34);
                float comparisonValue4;
                if (abs(scalarValue3 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue5 = sampledTextureValue7.x;
                float scalarValue6 = sampledTextureValue7.y;
                float scalarValue7 = sampledTextureValue7.z;
                float scalarValue8 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue ? scalarValue6 : scalarValue7;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue1 ? scalarValue6 : scalarValue5;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue37;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue16 = branchMergedValue;
            intermediateValue17 = branchMergedValue1;
            intermediateValue18 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue3 = fract(productValue33);
                float scalarValue4 = fract(productValue34);
                float comparisonValue4;
                if (abs(scalarValue3 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue5 = sampledTextureValue7.x;
                float scalarValue6 = sampledTextureValue7.y;
                float scalarValue7 = sampledTextureValue7.z;
                float scalarValue8 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue ? scalarValue6 : scalarValue7;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue1 ? scalarValue6 : scalarValue5;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue37;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue19 = branchMergedValue;
            intermediateValue20 = branchMergedValue1;
            intermediateValue21 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue3 = fract(productValue33);
                float scalarValue4 = fract(productValue34);
                float comparisonValue4;
                if (abs(scalarValue3 + (-0.5)) < 0.0625)
                {
                    comparisonValue4 = ((scalarValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue4, comparisonValue5));
                float scalarValue5 = sampledTextureValue7.x;
                float scalarValue6 = sampledTextureValue7.y;
                float scalarValue7 = sampledTextureValue7.z;
                float scalarValue8 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue ? scalarValue6 : scalarValue7;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue1 ? scalarValue6 : scalarValue5;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * productValue37;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue22 = branchMergedValue;
            intermediateValue23 = branchMergedValue1;
            intermediateValue24 = branchMergedValue2;
#endif
        }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue25 = intermediateValue26 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue36 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue25, intermediateValue26 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue15, intermediateValue26 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue37 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue25, intermediateValue26 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue15, intermediateValue26 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue38 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue25, intermediateValue26 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue15, intermediateValue26 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue4 = vec3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38);
        float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        productValue1 = inverseLengthValue15 * multiplyAddValue38;
        productValue2 = inverseLengthValue15 * multiplyAddValue37;
        productValue3 = inverseLengthValue15 * multiplyAddValue36;
    }
    else
    {
        productValue1 = varyingNormal0.z;
        productValue2 = varyingNormal0.y;
        productValue3 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue27 = intermediateValue26 ? multiplyAddValue16 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue52 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue27, intermediateValue26 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue18, intermediateValue26 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue53 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue27, intermediateValue26 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue18, intermediateValue26 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue54 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue27, intermediateValue26 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue18, intermediateValue26 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue17) : 0.0) : 0.0);
        vec3 vectorValue6 = vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54);
        float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
        productValue2 = inverseLengthValue17 * multiplyAddValue54;
        productValue3 = inverseLengthValue17 * multiplyAddValue53;
        productValue4 = inverseLengthValue17 * multiplyAddValue52;
    }
    else
    {
        productValue2 = varyingNormal0.z;
        productValue3 = varyingNormal0.y;
        productValue4 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue31 = intermediateValue30 ? multiplyAddValue10 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue66 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue31, intermediateValue30 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue12, intermediateValue30 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue67 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue31, intermediateValue30 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue12, intermediateValue30 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue68 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue31, intermediateValue30 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue12, intermediateValue30 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue11) : 0.0) : 0.0);
        vec3 vectorValue8 = vec3(multiplyAddValue66, multiplyAddValue67, multiplyAddValue68);
        float inverseLengthValue22 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
        productValue1 = inverseLengthValue22 * multiplyAddValue68;
        productValue2 = inverseLengthValue22 * multiplyAddValue67;
        productValue3 = inverseLengthValue22 * multiplyAddValue66;
    }
    else
    {
        productValue1 = varyingNormal0.z;
        productValue2 = varyingNormal0.y;
        productValue3 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue33 = intermediateValue30 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue79 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue33, intermediateValue30 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue15, intermediateValue30 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue80 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue33, intermediateValue30 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue15, intermediateValue30 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue81 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue33, intermediateValue30 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue15, intermediateValue30 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue9 = vec3(multiplyAddValue79, multiplyAddValue80, multiplyAddValue81);
        float inverseLengthValue23 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
        productValue2 = inverseLengthValue23 * multiplyAddValue81;
        productValue3 = inverseLengthValue23 * multiplyAddValue80;
        productValue4 = inverseLengthValue23 * multiplyAddValue79;
    }
    else
    {
        productValue2 = varyingNormal0.z;
        productValue3 = varyingNormal0.y;
        productValue4 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue34 = intermediateValue23 ? multiplyAddValue16 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue94 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue34, intermediateValue23 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue18, intermediateValue23 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue95 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue34, intermediateValue23 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue18, intermediateValue23 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue96 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue34, intermediateValue23 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue18, intermediateValue23 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue17) : 0.0) : 0.0);
        vec3 vectorValue10 = vec3(multiplyAddValue94, multiplyAddValue95, multiplyAddValue96);
        float inverseLengthValue24 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
        productValue5 = inverseLengthValue24 * multiplyAddValue96;
        productValue6 = inverseLengthValue24 * multiplyAddValue95;
        productValue7 = inverseLengthValue24 * multiplyAddValue94;
    }
    else
    {
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue36 = intermediateValue26 ? multiplyAddValue20 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue112 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue36, intermediateValue26 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue22, intermediateValue26 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue21) : 0.0) : 0.0);
        float multiplyAddValue113 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue36, intermediateValue26 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue22, intermediateValue26 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue21) : 0.0) : 0.0);
        float multiplyAddValue114 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue36, intermediateValue26 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue22, intermediateValue26 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue21) : 0.0) : 0.0);
        vec3 vectorValue12 = vec3(multiplyAddValue112, multiplyAddValue113, multiplyAddValue114);
        float inverseLengthValue26 = inversesqrt(rdDot3Precise2(vectorValue12, vectorValue12));
        productValue2 = inverseLengthValue26 * multiplyAddValue114;
        productValue3 = inverseLengthValue26 * multiplyAddValue113;
        productValue4 = inverseLengthValue26 * multiplyAddValue112;
    }
    else
    {
        productValue2 = varyingNormal0.z;
        productValue3 = varyingNormal0.y;
        productValue4 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue37 = intermediateValue27 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue121 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue37, intermediateValue27 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue15, intermediateValue27 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue122 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue37, intermediateValue27 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue15, intermediateValue27 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue123 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue37, intermediateValue27 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue15, intermediateValue27 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue13 = vec3(multiplyAddValue121, multiplyAddValue122, multiplyAddValue123);
        float inverseLengthValue27 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
        productValue5 = inverseLengthValue27 * multiplyAddValue123;
        productValue6 = inverseLengthValue27 * multiplyAddValue122;
        productValue7 = inverseLengthValue27 * multiplyAddValue121;
    }
    else
    {
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue38 = intermediateValue30 ? multiplyAddValue17 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue134 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue38, intermediateValue30 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue19, intermediateValue30 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue135 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue38, intermediateValue30 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue19, intermediateValue30 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue136 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue38, intermediateValue30 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue19, intermediateValue30 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue18) : 0.0) : 0.0);
        vec3 vectorValue14 = vec3(multiplyAddValue134, multiplyAddValue135, multiplyAddValue136);
        float inverseLengthValue28 = inversesqrt(rdDot3Precise2(vectorValue14, vectorValue14));
        productValue2 = inverseLengthValue28 * multiplyAddValue136;
        productValue3 = inverseLengthValue28 * multiplyAddValue135;
        productValue4 = inverseLengthValue28 * multiplyAddValue134;
    }
    else
    {
        productValue2 = varyingNormal0.z;
        productValue3 = varyingNormal0.y;
        productValue4 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue39 = intermediateValue24 ? multiplyAddValue16 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue149 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue39, intermediateValue24 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue18, intermediateValue24 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue150 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue39, intermediateValue24 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue18, intermediateValue24 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue151 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue39, intermediateValue24 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue18, intermediateValue24 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue17) : 0.0) : 0.0);
        vec3 vectorValue15 = vec3(multiplyAddValue149, multiplyAddValue150, multiplyAddValue151);
        float inverseLengthValue32 = inversesqrt(rdDot3Precise2(vectorValue15, vectorValue15));
        productValue6 = inverseLengthValue32 * multiplyAddValue151;
        productValue7 = inverseLengthValue32 * multiplyAddValue150;
        productValue8 = inverseLengthValue32 * multiplyAddValue149;
    }
    else
    {
        productValue6 = varyingNormal0.z;
        productValue7 = varyingNormal0.y;
        productValue8 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue40 = intermediateValue27 ? multiplyAddValue18 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue164 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue40, intermediateValue27 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue20, intermediateValue27 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue19) : 0.0) : 0.0);
        float multiplyAddValue165 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue40, intermediateValue27 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue20, intermediateValue27 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue19) : 0.0) : 0.0);
        float multiplyAddValue166 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue40, intermediateValue27 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue20, intermediateValue27 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue19) : 0.0) : 0.0);
        vec3 vectorValue17 = vec3(multiplyAddValue164, multiplyAddValue165, multiplyAddValue166);
        float inverseLengthValue37 = inversesqrt(rdDot3Precise2(vectorValue17, vectorValue17));
        productValue5 = inverseLengthValue37 * multiplyAddValue166;
        productValue6 = inverseLengthValue37 * multiplyAddValue165;
        productValue7 = inverseLengthValue37 * multiplyAddValue164;
    }
    else
    {
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue41 = intermediateValue28 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue173 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue41, intermediateValue28 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue15, intermediateValue28 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue174 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue41, intermediateValue28 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue15, intermediateValue28 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue175 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue41, intermediateValue28 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue15, intermediateValue28 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue18 = vec3(multiplyAddValue173, multiplyAddValue174, multiplyAddValue175);
        float inverseLengthValue38 = inversesqrt(rdDot3Precise2(vectorValue18, vectorValue18));
        productValue6 = inverseLengthValue38 * multiplyAddValue175;
        productValue7 = inverseLengthValue38 * multiplyAddValue174;
        productValue8 = inverseLengthValue38 * multiplyAddValue173;
    }
    else
    {
        productValue6 = varyingNormal0.z;
        productValue7 = varyingNormal0.y;
        productValue8 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue42 = intermediateValue31 ? multiplyAddValue15 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue185 = fma(inverseLengthValue14 * varyingNormal0.x, comparisonValue42, intermediateValue31 ? fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue17, intermediateValue31 ? ((inverseLengthValue13 * varyingBitangent0.x) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue186 = fma(inverseLengthValue14 * varyingNormal0.y, comparisonValue42, intermediateValue31 ? fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue17, intermediateValue31 ? ((inverseLengthValue13 * varyingBitangent0.y) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue187 = fma(inverseLengthValue14 * varyingNormal0.z, comparisonValue42, intermediateValue31 ? fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue17, intermediateValue31 ? ((inverseLengthValue13 * varyingBitangent0.z) * multiplyAddValue16) : 0.0) : 0.0);
        vec3 vectorValue19 = vec3(multiplyAddValue185, multiplyAddValue186, multiplyAddValue187);
        float inverseLengthValue42 = inversesqrt(rdDot3Precise2(vectorValue19, vectorValue19));
        productValue5 = inverseLengthValue42 * multiplyAddValue187;
        productValue6 = inverseLengthValue42 * multiplyAddValue186;
        productValue7 = inverseLengthValue42 * multiplyAddValue185;
    }
    else
    {
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue15 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue15;
        float multiplyAddValue = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue17, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue16, inverseLengthValue4 * varyingTangent0.x));
        float multiplyAddValue1 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue17, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue16, inverseLengthValue4 * varyingTangent0.y));
        float multiplyAddValue2 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue17, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue16, inverseLengthValue4 * varyingTangent0.z));
        float inverseLengthValue5 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue8 = inverseLengthValue5 * multiplyAddValue;
        intermediateValue9 = inverseLengthValue5 * multiplyAddValue1;
        intermediateValue10 = inverseLengthValue5 * multiplyAddValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue7 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        float multiplyAddValue5 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue19, inverseLengthValue7 * varyingTangent0.x));
        float multiplyAddValue6 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue19, inverseLengthValue7 * varyingTangent0.y));
        float multiplyAddValue7 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue19, inverseLengthValue7 * varyingTangent0.z));
        float inverseLengthValue8 = inversesqrt(dot(vec3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), vec3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue11 = inverseLengthValue8 * multiplyAddValue5;
        intermediateValue12 = inverseLengthValue8 * multiplyAddValue6;
        intermediateValue13 = inverseLengthValue8 * multiplyAddValue7;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue7 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        float multiplyAddValue5 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue19, inverseLengthValue7 * varyingTangent0.x));
        float multiplyAddValue6 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue19, inverseLengthValue7 * varyingTangent0.y));
        float multiplyAddValue7 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue19, inverseLengthValue7 * varyingTangent0.z));
        float inverseLengthValue8 = inversesqrt(dot(vec3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), vec3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue11 = inverseLengthValue8 * multiplyAddValue5;
        intermediateValue12 = inverseLengthValue8 * multiplyAddValue6;
        intermediateValue13 = inverseLengthValue8 * multiplyAddValue7;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue9 = inversesqrt(dot(vec3(intermediateValue11, intermediateValue12, intermediateValue13), vec3(intermediateValue11, intermediateValue12, intermediateValue13)));
    float productValue58 = inverseLengthValue9 * intermediateValue11;
    float productValue59 = inverseLengthValue9 * intermediateValue12;
    float productValue60 = inverseLengthValue9 * intermediateValue13;
    float quotientValue1 = 1.0 / ((abs(productValue59) + abs(productValue58)) + abs(productValue60));
    float productValue61 = quotientValue1 * productValue58;
    float productValue62 = quotientValue1 * productValue59;
    bool conditionValue3 = productValue60 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue15;
    float productValue15;
    float productValue16;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue88 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue15 = spvNClamp(productValue88, 0.0, 1.0);
        productValue15 = spvNClamp(((productValue88 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue88, 0.0, 1.0);
        productValue16 = spvNClamp((((productValue88 * productValue88) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue88, 0.0, 1.0);
    }
    else
    {
        intermediateValue15 = fragmentVectorConstants1.packedValues[11u].x;
        productValue15 = fragmentVectorConstants1.packedValues[11u].y;
        productValue16 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue21 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue22 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue23 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue19 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue21;
        float multiplyAddValue57 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue22, inverseLengthValue19 * varyingTangent0.x));
        float multiplyAddValue58 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue22, inverseLengthValue19 * varyingTangent0.y));
        float multiplyAddValue59 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue22, inverseLengthValue19 * varyingTangent0.z));
        float inverseLengthValue20 = inversesqrt(dot(vec3(multiplyAddValue57, multiplyAddValue58, multiplyAddValue59), vec3(multiplyAddValue57, multiplyAddValue58, multiplyAddValue59)));
        intermediateValue14 = inverseLengthValue20 * multiplyAddValue57;
        intermediateValue15 = inverseLengthValue20 * multiplyAddValue58;
        intermediateValue16 = inverseLengthValue20 * multiplyAddValue59;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue21 = inversesqrt(dot(vec3(intermediateValue14, intermediateValue15, intermediateValue16), vec3(intermediateValue14, intermediateValue15, intermediateValue16)));
    float productValue96 = inverseLengthValue21 * intermediateValue14;
    float productValue97 = inverseLengthValue21 * intermediateValue15;
    float productValue98 = inverseLengthValue21 * intermediateValue16;
    float quotientValue4 = 1.0 / ((abs(productValue97) + abs(productValue96)) + abs(productValue98));
    float productValue99 = quotientValue4 * productValue96;
    float productValue100 = quotientValue4 * productValue97;
    bool conditionValue8 = productValue98 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue18;
    float productValue16;
    float productValue17;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue88 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue18 = spvNClamp(productValue88, 0.0, 1.0);
        productValue16 = spvNClamp(((productValue88 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue88, 0.0, 1.0);
        productValue17 = spvNClamp((((productValue88 * productValue88) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue88, 0.0, 1.0);
    }
    else
    {
        intermediateValue18 = fragmentVectorConstants1.packedValues[11u].x;
        productValue16 = fragmentVectorConstants1.packedValues[11u].y;
        productValue17 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue15 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue15;
        float multiplyAddValue = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue17, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue16, inverseLengthValue4 * varyingTangent0.x));
        float multiplyAddValue1 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue17, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue16, inverseLengthValue4 * varyingTangent0.y));
        float multiplyAddValue2 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue17, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue16, inverseLengthValue4 * varyingTangent0.z));
        float inverseLengthValue5 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue8 = inverseLengthValue5 * multiplyAddValue;
        intermediateValue9 = inverseLengthValue5 * multiplyAddValue1;
        intermediateValue10 = inverseLengthValue5 * multiplyAddValue2;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(intermediateValue8, intermediateValue9, intermediateValue10), vec3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue38 = inverseLengthValue6 * intermediateValue8;
    float productValue39 = inverseLengthValue6 * intermediateValue9;
    float productValue40 = inverseLengthValue6 * intermediateValue10;
    float quotientValue = 1.0 / ((abs(productValue39) + abs(productValue38)) + abs(productValue40));
    float productValue41 = quotientValue * productValue38;
    float productValue42 = quotientValue * productValue39;
    bool conditionValue2 = productValue40 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue12;
    float productValue19;
    float productValue20;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue119 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue12 = spvNClamp(productValue119, 0.0, 1.0);
        productValue19 = spvNClamp(((productValue119 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue119, 0.0, 1.0);
        productValue20 = spvNClamp((((productValue119 * productValue119) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue119, 0.0, 1.0);
    }
    else
    {
        intermediateValue12 = fragmentVectorConstants1.packedValues[11u].x;
        productValue19 = fragmentVectorConstants1.packedValues[11u].y;
        productValue20 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue7 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        float multiplyAddValue5 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue19, inverseLengthValue7 * varyingTangent0.x));
        float multiplyAddValue6 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue19, inverseLengthValue7 * varyingTangent0.y));
        float multiplyAddValue7 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue19, inverseLengthValue7 * varyingTangent0.z));
        float inverseLengthValue8 = inversesqrt(dot(vec3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), vec3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue11 = inverseLengthValue8 * multiplyAddValue5;
        intermediateValue12 = inverseLengthValue8 * multiplyAddValue6;
        intermediateValue13 = inverseLengthValue8 * multiplyAddValue7;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue9 = inversesqrt(dot(vec3(intermediateValue11, intermediateValue12, intermediateValue13), vec3(intermediateValue11, intermediateValue12, intermediateValue13)));
    float productValue58 = inverseLengthValue9 * intermediateValue11;
    float productValue59 = inverseLengthValue9 * intermediateValue12;
    float productValue60 = inverseLengthValue9 * intermediateValue13;
    float quotientValue1 = 1.0 / ((abs(productValue59) + abs(productValue58)) + abs(productValue60));
    float productValue61 = quotientValue1 * productValue58;
    float productValue62 = quotientValue1 * productValue59;
    bool conditionValue3 = productValue60 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue15;
    float productValue20;
    float productValue21;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue119 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue15 = spvNClamp(productValue119, 0.0, 1.0);
        productValue20 = spvNClamp(((productValue119 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue119, 0.0, 1.0);
        productValue21 = spvNClamp((((productValue119 * productValue119) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue119, 0.0, 1.0);
    }
    else
    {
        intermediateValue15 = fragmentVectorConstants1.packedValues[11u].x;
        productValue20 = fragmentVectorConstants1.packedValues[11u].y;
        productValue21 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue7 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        float multiplyAddValue5 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue19, inverseLengthValue7 * varyingTangent0.x));
        float multiplyAddValue6 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue19, inverseLengthValue7 * varyingTangent0.y));
        float multiplyAddValue7 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue20, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue19, inverseLengthValue7 * varyingTangent0.z));
        float inverseLengthValue8 = inversesqrt(dot(vec3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), vec3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue11 = inverseLengthValue8 * multiplyAddValue5;
        intermediateValue12 = inverseLengthValue8 * multiplyAddValue6;
        intermediateValue13 = inverseLengthValue8 * multiplyAddValue7;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue9 = inversesqrt(dot(vec3(intermediateValue11, intermediateValue12, intermediateValue13), vec3(intermediateValue11, intermediateValue12, intermediateValue13)));
    float productValue58 = inverseLengthValue9 * intermediateValue11;
    float productValue59 = inverseLengthValue9 * intermediateValue12;
    float productValue60 = inverseLengthValue9 * intermediateValue13;
    float quotientValue1 = 1.0 / ((abs(productValue59) + abs(productValue58)) + abs(productValue60));
    float productValue61 = quotientValue1 * productValue58;
    float productValue62 = quotientValue1 * productValue59;
    bool conditionValue3 = productValue60 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue15;
    float productValue19;
    float productValue20;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue88 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue15 = spvNClamp(productValue88, 0.0, 1.0);
        productValue19 = spvNClamp(((productValue88 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue88, 0.0, 1.0);
        productValue20 = spvNClamp((((productValue88 * productValue88) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue88, 0.0, 1.0);
    }
    else
    {
        intermediateValue15 = fragmentVectorConstants1.packedValues[11u].x;
        productValue19 = fragmentVectorConstants1.packedValues[11u].y;
        productValue20 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue21 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue22 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue23 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue19 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue21;
        float multiplyAddValue57 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue22, inverseLengthValue19 * varyingTangent0.x));
        float multiplyAddValue58 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue22, inverseLengthValue19 * varyingTangent0.y));
        float multiplyAddValue59 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue22, inverseLengthValue19 * varyingTangent0.z));
        float inverseLengthValue20 = inversesqrt(dot(vec3(multiplyAddValue57, multiplyAddValue58, multiplyAddValue59), vec3(multiplyAddValue57, multiplyAddValue58, multiplyAddValue59)));
        intermediateValue14 = inverseLengthValue20 * multiplyAddValue57;
        intermediateValue15 = inverseLengthValue20 * multiplyAddValue58;
        intermediateValue16 = inverseLengthValue20 * multiplyAddValue59;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue21 = inversesqrt(dot(vec3(intermediateValue14, intermediateValue15, intermediateValue16), vec3(intermediateValue14, intermediateValue15, intermediateValue16)));
    float productValue96 = inverseLengthValue21 * intermediateValue14;
    float productValue97 = inverseLengthValue21 * intermediateValue15;
    float productValue98 = inverseLengthValue21 * intermediateValue16;
    float quotientValue4 = 1.0 / ((abs(productValue97) + abs(productValue96)) + abs(productValue98));
    float productValue99 = quotientValue4 * productValue96;
    float productValue100 = quotientValue4 * productValue97;
    bool conditionValue8 = productValue98 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue18;
    float productValue20;
    float productValue21;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue88 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue18 = spvNClamp(productValue88, 0.0, 1.0);
        productValue20 = spvNClamp(((productValue88 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue88, 0.0, 1.0);
        productValue21 = spvNClamp((((productValue88 * productValue88) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue88, 0.0, 1.0);
    }
    else
    {
        intermediateValue18 = fragmentVectorConstants1.packedValues[11u].x;
        productValue20 = fragmentVectorConstants1.packedValues[11u].y;
        productValue21 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue16 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue18 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue29 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue16;
        float multiplyAddValue137 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue17, inverseLengthValue29 * varyingTangent0.x));
        float multiplyAddValue138 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue17, inverseLengthValue29 * varyingTangent0.y));
        float multiplyAddValue139 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue18, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue17, inverseLengthValue29 * varyingTangent0.z));
        float inverseLengthValue30 = inversesqrt(dot(vec3(multiplyAddValue137, multiplyAddValue138, multiplyAddValue139), vec3(multiplyAddValue137, multiplyAddValue138, multiplyAddValue139)));
        intermediateValue9 = inverseLengthValue30 * multiplyAddValue137;
        intermediateValue10 = inverseLengthValue30 * multiplyAddValue138;
        intermediateValue11 = inverseLengthValue30 * multiplyAddValue139;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue31 = inversesqrt(dot(vec3(intermediateValue9, intermediateValue10, intermediateValue11), vec3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue185 = inverseLengthValue31 * intermediateValue9;
    float productValue186 = inverseLengthValue31 * intermediateValue10;
    float productValue187 = inverseLengthValue31 * intermediateValue11;
    float quotientValue6 = 1.0 / ((abs(productValue186) + abs(productValue185)) + abs(productValue187));
    float productValue188 = quotientValue6 * productValue185;
    float productValue189 = quotientValue6 * productValue186;
    bool conditionValue11 = productValue187 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue13;
    float productValue20;
    float productValue21;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue119 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue13 = spvNClamp(productValue119, 0.0, 1.0);
        productValue20 = spvNClamp(((productValue119 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue119, 0.0, 1.0);
        productValue21 = spvNClamp((((productValue119 * productValue119) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue119, 0.0, 1.0);
    }
    else
    {
        intermediateValue13 = fragmentVectorConstants1.packedValues[11u].x;
        productValue20 = fragmentVectorConstants1.packedValues[11u].y;
        productValue21 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue19 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue34 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        float multiplyAddValue152 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue21, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue20, inverseLengthValue34 * varyingTangent0.x));
        float multiplyAddValue153 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue21, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue20, inverseLengthValue34 * varyingTangent0.y));
        float multiplyAddValue154 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue21, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue20, inverseLengthValue34 * varyingTangent0.z));
        float inverseLengthValue35 = inversesqrt(dot(vec3(multiplyAddValue152, multiplyAddValue153, multiplyAddValue154), vec3(multiplyAddValue152, multiplyAddValue153, multiplyAddValue154)));
        intermediateValue12 = inverseLengthValue35 * multiplyAddValue152;
        intermediateValue13 = inverseLengthValue35 * multiplyAddValue153;
        intermediateValue14 = inverseLengthValue35 * multiplyAddValue154;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue36 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue212 = inverseLengthValue36 * intermediateValue12;
    float productValue213 = inverseLengthValue36 * intermediateValue13;
    float productValue214 = inverseLengthValue36 * intermediateValue14;
    float quotientValue8 = 1.0 / ((abs(productValue213) + abs(productValue212)) + abs(productValue214));
    float productValue215 = quotientValue8 * productValue212;
    float productValue216 = quotientValue8 * productValue213;
    bool conditionValue13 = productValue214 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue16;
    float productValue21;
    float productValue22;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue119 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue16 = spvNClamp(productValue119, 0.0, 1.0);
        productValue21 = spvNClamp(((productValue119 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue119, 0.0, 1.0);
        productValue22 = spvNClamp((((productValue119 * productValue119) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue119, 0.0, 1.0);
    }
    else
    {
        intermediateValue16 = fragmentVectorConstants1.packedValues[11u].x;
        productValue21 = fragmentVectorConstants1.packedValues[11u].y;
        productValue22 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue19 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue34 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        float multiplyAddValue152 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue21, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue20, inverseLengthValue34 * varyingTangent0.x));
        float multiplyAddValue153 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue21, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue20, inverseLengthValue34 * varyingTangent0.y));
        float multiplyAddValue154 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue21, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue20, inverseLengthValue34 * varyingTangent0.z));
        float inverseLengthValue35 = inversesqrt(dot(vec3(multiplyAddValue152, multiplyAddValue153, multiplyAddValue154), vec3(multiplyAddValue152, multiplyAddValue153, multiplyAddValue154)));
        intermediateValue12 = inverseLengthValue35 * multiplyAddValue152;
        intermediateValue13 = inverseLengthValue35 * multiplyAddValue153;
        intermediateValue14 = inverseLengthValue35 * multiplyAddValue154;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue36 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue212 = inverseLengthValue36 * intermediateValue12;
    float productValue213 = inverseLengthValue36 * intermediateValue13;
    float productValue214 = inverseLengthValue36 * intermediateValue14;
    float quotientValue8 = 1.0 / ((abs(productValue213) + abs(productValue212)) + abs(productValue214));
    float productValue215 = quotientValue8 * productValue212;
    float productValue216 = quotientValue8 * productValue213;
    bool conditionValue13 = productValue214 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue16;
    float productValue20;
    float productValue21;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue88 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue16 = spvNClamp(productValue88, 0.0, 1.0);
        productValue20 = spvNClamp(((productValue88 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue88, 0.0, 1.0);
        productValue21 = spvNClamp((((productValue88 * productValue88) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue88, 0.0, 1.0);
    }
    else
    {
        intermediateValue16 = fragmentVectorConstants1.packedValues[11u].x;
        productValue20 = fragmentVectorConstants1.packedValues[11u].y;
        productValue21 = fragmentVectorConstants1.packedValues[11u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue22 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue23 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue24 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue39 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        float multiplyAddValue176 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue24, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue23, inverseLengthValue39 * varyingTangent0.x));
        float multiplyAddValue177 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue24, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue23, inverseLengthValue39 * varyingTangent0.y));
        float multiplyAddValue178 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue24, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue23, inverseLengthValue39 * varyingTangent0.z));
        float inverseLengthValue40 = inversesqrt(dot(vec3(multiplyAddValue176, multiplyAddValue177, multiplyAddValue178), vec3(multiplyAddValue176, multiplyAddValue177, multiplyAddValue178)));
        intermediateValue15 = inverseLengthValue40 * multiplyAddValue176;
        intermediateValue16 = inverseLengthValue40 * multiplyAddValue177;
        intermediateValue17 = inverseLengthValue40 * multiplyAddValue178;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue41 = inversesqrt(dot(vec3(intermediateValue15, intermediateValue16, intermediateValue17), vec3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue242 = inverseLengthValue41 * intermediateValue15;
    float productValue243 = inverseLengthValue41 * intermediateValue16;
    float productValue244 = inverseLengthValue41 * intermediateValue17;
    float quotientValue9 = 1.0 / ((abs(productValue243) + abs(productValue242)) + abs(productValue244));
    float productValue245 = quotientValue9 * productValue242;
    float productValue246 = quotientValue9 * productValue243;
    bool conditionValue14 = productValue244 < 0.0;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue19;
    float productValue21;
    float productValue22;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue88 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue19 = spvNClamp(productValue88, 0.0, 1.0);
        productValue21 = spvNClamp(((productValue88 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue88, 0.0, 1.0);
        productValue22 = spvNClamp((((productValue88 * productValue88) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue88, 0.0, 1.0);
    }
    else
    {
        intermediateValue19 = fragmentVectorConstants1.packedValues[11u].x;
        productValue21 = fragmentVectorConstants1.packedValues[11u].y;
        productValue22 = fragmentVectorConstants1.packedValues[11u].z;
#endif
    }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue21) ? fma(intermediateValue21, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(productValue3, productValue2, productValue1);
    float inverseLengthValue16 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue68 = inverseLengthValue16 * productValue3;
    float productValue69 = inverseLengthValue16 * productValue2;
    float productValue70 = inverseLengthValue16 * productValue1;
    float quotientValue2 = 1.0 / (abs(productValue70) + (abs(productValue69) + abs(productValue68)));
    float productValue71 = quotientValue2 * productValue68;
    float productValue72 = quotientValue2 * productValue69;
    bool conditionValue6 = productValue70 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue6 ? (((productValue71 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue72))) : productValue71;
    fragmentColor2.y = conditionValue6 ? (((productValue72 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue71))) : productValue72;
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[35u], sumValue5, fma(fragmentScalarConstants1.packedValues[27u], sumValue3, sumValue4 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue39, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue40, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue39, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue40, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[56u] > 9.9999997473787516355514526367188e-05);
    float productValue73 = fragmentScalarConstants1.packedValues[56u] * fragmentScalarConstants1.packedValues[56u];
    float comparisonValue26 = (bitwiseValue1 ? spvNMin(productValue73, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue41 = (bitwiseValue1 ? spvNMin(fma(fma(productValue73, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue73, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue42 = (bitwiseValue1 ? spvNMin(fma(productValue73 * productValue73, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue73, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue74 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue41, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue42, comparisonValue26)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue41 / productValue74, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue26 / productValue74, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue42 / productValue74, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue74, 0.0, 1.0) * 255.0);
    uint productValue75 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = (((productValue75 & 2u) != 0u) ? 512u : 0u) + ((((productValue75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[57u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue21) ? fma(intermediateValue21, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(productValue4, productValue3, productValue2);
    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue77 = inverseLengthValue18 * productValue4;
    float productValue78 = inverseLengthValue18 * productValue3;
    float productValue79 = inverseLengthValue18 * productValue2;
    float quotientValue3 = 1.0 / (abs(productValue79) + (abs(productValue78) + abs(productValue77)));
    float productValue80 = quotientValue3 * productValue77;
    float productValue81 = quotientValue3 * productValue78;
    bool conditionValue7 = productValue79 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue80 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue81))) : productValue80;
    fragmentColor2.y = conditionValue7 ? (((productValue81 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue80))) : productValue81;
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[35u], sumValue5, fma(fragmentScalarConstants1.packedValues[27u], sumValue3, sumValue4 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue39, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue40, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue39, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue3, sumValue4 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue40, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[56u] > 9.9999997473787516355514526367188e-05);
    float productValue73 = fragmentScalarConstants1.packedValues[56u] * fragmentScalarConstants1.packedValues[56u];
    float comparisonValue26 = (bitwiseValue1 ? spvNMin(productValue73, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue41 = (bitwiseValue1 ? spvNMin(fma(fma(productValue73, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue73, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue42 = (bitwiseValue1 ? spvNMin(fma(productValue73 * productValue73, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue73, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue74 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue41, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue42, comparisonValue26)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue41 / productValue74, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue26 / productValue74, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue42 / productValue74, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue74, 0.0, 1.0) * 255.0);
    uint productValue75 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = (((productValue75 & 2u) != 0u) ? 512u : 0u) + ((((productValue75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[57u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue25) ? fma(intermediateValue25, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(productValue3, productValue2, productValue1);
    float inverseLengthValue16 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue68 = inverseLengthValue16 * productValue3;
    float productValue69 = inverseLengthValue16 * productValue2;
    float productValue70 = inverseLengthValue16 * productValue1;
    float quotientValue2 = 1.0 / (abs(productValue70) + (abs(productValue69) + abs(productValue68)));
    float productValue71 = quotientValue2 * productValue68;
    float productValue72 = quotientValue2 * productValue69;
    bool conditionValue6 = productValue70 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue6 ? (((productValue71 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue72))) : productValue71;
    fragmentColor2.y = conditionValue6 ? (((productValue72 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue71))) : productValue72;
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue70, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue70, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue103 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue71 = (bitwiseValue3 ? spvNMin(fma(fma(productValue103, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue72 = (bitwiseValue3 ? spvNMin(fma(productValue103 * productValue103, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue104 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue71, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue72, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue71 / productValue104, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue104, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue72 / productValue104, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue104, 0.0, 1.0) * 255.0);
    uint productValue105 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue105 & 2u) != 0u) ? 512u : 0u) + ((((productValue105 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue27, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue26, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue25) ? fma(intermediateValue25, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(productValue4, productValue3, productValue2);
    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue77 = inverseLengthValue18 * productValue4;
    float productValue78 = inverseLengthValue18 * productValue3;
    float productValue79 = inverseLengthValue18 * productValue2;
    float quotientValue3 = 1.0 / (abs(productValue79) + (abs(productValue78) + abs(productValue77)));
    float productValue80 = quotientValue3 * productValue77;
    float productValue81 = quotientValue3 * productValue78;
    bool conditionValue7 = productValue79 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue80 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue81))) : productValue80;
    fragmentColor2.y = conditionValue7 ? (((productValue81 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue80))) : productValue81;
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue70, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue70, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue103 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue71 = (bitwiseValue3 ? spvNMin(fma(fma(productValue103, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue72 = (bitwiseValue3 ? spvNMin(fma(productValue103 * productValue103, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue104 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue71, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue72, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue71 / productValue104, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue104, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue72 / productValue104, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue104, 0.0, 1.0) * 255.0);
    uint productValue105 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue105 & 2u) != 0u) ? 512u : 0u) + ((((productValue105 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue27, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue26, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue18) ? fma(intermediateValue18, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue11 = vec3(productValue7, productValue6, productValue5);
    float inverseLengthValue25 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    float productValue142 = inverseLengthValue25 * productValue7;
    float productValue143 = inverseLengthValue25 * productValue6;
    float productValue144 = inverseLengthValue25 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue144) + (abs(productValue143) + abs(productValue142)));
    float productValue145 = quotientValue5 * productValue142;
    float productValue146 = quotientValue5 * productValue143;
    bool conditionValue10 = productValue144 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue10 ? (((productValue145 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue146))) : productValue145;
    fragmentColor2.y = conditionValue10 ? (((productValue146 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue145))) : productValue146;
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue70, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue70, 0.5, 0.5);
    bool bitwiseValue4 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float productValue147 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    float comparisonValue35 = (bitwiseValue4 ? spvNMin(productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue97 = (bitwiseValue4 ? spvNMin(fma(fma(productValue147, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue98 = (bitwiseValue4 ? spvNMin(fma(productValue147 * productValue147, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue148 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue97, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue98, comparisonValue35)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue97 / productValue148, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue35 / productValue148, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue98 / productValue148, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue148, 0.0, 1.0) * 255.0);
    uint productValue105 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue105 & 2u) != 0u) ? 512u : 0u) + ((((productValue105 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue20, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue21) ? fma(intermediateValue21, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(productValue4, productValue3, productValue2);
    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue77 = inverseLengthValue18 * productValue4;
    float productValue78 = inverseLengthValue18 * productValue3;
    float productValue79 = inverseLengthValue18 * productValue2;
    float quotientValue3 = 1.0 / (abs(productValue79) + (abs(productValue78) + abs(productValue77)));
    float productValue80 = quotientValue3 * productValue77;
    float productValue81 = quotientValue3 * productValue78;
    bool conditionValue7 = productValue79 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue80 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue81))) : productValue80;
    fragmentColor2.y = conditionValue7 ? (((productValue81 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue80))) : productValue81;
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue70, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue70, 0.5, 0.5);
    bool bitwiseValue4 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float productValue147 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    float comparisonValue35 = (bitwiseValue4 ? spvNMin(productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue97 = (bitwiseValue4 ? spvNMin(fma(fma(productValue147, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue98 = (bitwiseValue4 ? spvNMin(fma(productValue147 * productValue147, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue148 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue97, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue98, comparisonValue35)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue97 / productValue148, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue35 / productValue148, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue98 / productValue148, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue148, 0.0, 1.0) * 255.0);
    uint productValue105 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue105 & 2u) != 0u) ? 512u : 0u) + ((((productValue105 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue22) ? fma(intermediateValue22, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue11 = vec3(productValue7, productValue6, productValue5);
    float inverseLengthValue25 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    float productValue142 = inverseLengthValue25 * productValue7;
    float productValue143 = inverseLengthValue25 * productValue6;
    float productValue144 = inverseLengthValue25 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue144) + (abs(productValue143) + abs(productValue142)));
    float productValue145 = quotientValue5 * productValue142;
    float productValue146 = quotientValue5 * productValue143;
    bool conditionValue10 = productValue144 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue10 ? (((productValue145 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue146))) : productValue145;
    fragmentColor2.y = conditionValue10 ? (((productValue146 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue145))) : productValue146;
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue70, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue70, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue103 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue71 = (bitwiseValue3 ? spvNMin(fma(fma(productValue103, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue72 = (bitwiseValue3 ? spvNMin(fma(productValue103 * productValue103, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue104 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue71, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue72, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue71 / productValue104, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue104, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue72 / productValue104, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue104, 0.0, 1.0) * 255.0);
    uint productValue105 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue105 & 2u) != 0u) ? 512u : 0u) + ((((productValue105 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue19) ? fma(intermediateValue19, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue16 = vec3(productValue8, productValue7, productValue6);
    float inverseLengthValue33 = inversesqrt(rdDot3Precise2(vectorValue16, vectorValue16));
    float productValue195 = inverseLengthValue33 * productValue8;
    float productValue196 = inverseLengthValue33 * productValue7;
    float productValue197 = inverseLengthValue33 * productValue6;
    float quotientValue7 = 1.0 / (abs(productValue197) + (abs(productValue196) + abs(productValue195)));
    float productValue198 = quotientValue7 * productValue195;
    float productValue199 = quotientValue7 * productValue196;
    bool conditionValue12 = productValue197 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue12 ? (((productValue198 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue199))) : productValue198;
    fragmentColor2.y = conditionValue12 ? (((productValue199 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue198))) : productValue199;
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue70, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue70, 0.5, 0.5);
    bool bitwiseValue4 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float productValue147 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    float comparisonValue35 = (bitwiseValue4 ? spvNMin(productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue97 = (bitwiseValue4 ? spvNMin(fma(fma(productValue147, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue98 = (bitwiseValue4 ? spvNMin(fma(productValue147 * productValue147, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue148 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue97, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue98, comparisonValue35)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue97 / productValue148, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue35 / productValue148, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue98 / productValue148, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue148, 0.0, 1.0) * 255.0);
    uint productValue105 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue105 & 2u) != 0u) ? 512u : 0u) + ((((productValue105 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue20, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue22) ? fma(intermediateValue22, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue11 = vec3(productValue7, productValue6, productValue5);
    float inverseLengthValue25 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    float productValue142 = inverseLengthValue25 * productValue7;
    float productValue143 = inverseLengthValue25 * productValue6;
    float productValue144 = inverseLengthValue25 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue144) + (abs(productValue143) + abs(productValue142)));
    float productValue145 = quotientValue5 * productValue142;
    float productValue146 = quotientValue5 * productValue143;
    bool conditionValue10 = productValue144 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue10 ? (((productValue145 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue146))) : productValue145;
    fragmentColor2.y = conditionValue10 ? (((productValue146 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue145))) : productValue146;
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue70, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue70, 0.5, 0.5);
    bool bitwiseValue4 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float productValue147 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    float comparisonValue35 = (bitwiseValue4 ? spvNMin(productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue97 = (bitwiseValue4 ? spvNMin(fma(fma(productValue147, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue98 = (bitwiseValue4 ? spvNMin(fma(productValue147 * productValue147, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue147, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue148 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue97, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue98, comparisonValue35)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue97 / productValue148, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue35 / productValue148, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue98 / productValue148, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue148, 0.0, 1.0) * 255.0);
    uint productValue105 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue105 & 2u) != 0u) ? 512u : 0u) + ((((productValue105 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue23) ? fma(intermediateValue23, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue16 = vec3(productValue8, productValue7, productValue6);
    float inverseLengthValue33 = inversesqrt(rdDot3Precise2(vectorValue16, vectorValue16));
    float productValue195 = inverseLengthValue33 * productValue8;
    float productValue196 = inverseLengthValue33 * productValue7;
    float productValue197 = inverseLengthValue33 * productValue6;
    float quotientValue7 = 1.0 / (abs(productValue197) + (abs(productValue196) + abs(productValue195)));
    float productValue198 = quotientValue7 * productValue195;
    float productValue199 = quotientValue7 * productValue196;
    bool conditionValue12 = productValue197 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue12 ? (((productValue198 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue199))) : productValue198;
    fragmentColor2.y = conditionValue12 ? (((productValue199 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue198))) : productValue199;
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue70, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue70, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue103 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue71 = (bitwiseValue3 ? spvNMin(fma(fma(productValue103, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue72 = (bitwiseValue3 ? spvNMin(fma(productValue103 * productValue103, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue104 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue71, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue72, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue71 / productValue104, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue104, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue72 / productValue104, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue104, 0.0, 1.0) * 255.0);
    uint productValue105 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue105 & 2u) != 0u) ? 512u : 0u) + ((((productValue105 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue25, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue3 < intermediateValue26) ? fma(intermediateValue26, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue3, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue11 = vec3(productValue7, productValue6, productValue5);
    float inverseLengthValue25 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    float productValue142 = inverseLengthValue25 * productValue7;
    float productValue143 = inverseLengthValue25 * productValue6;
    float productValue144 = inverseLengthValue25 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue144) + (abs(productValue143) + abs(productValue142)));
    float productValue145 = quotientValue5 * productValue142;
    float productValue146 = quotientValue5 * productValue143;
    bool conditionValue10 = productValue144 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue10 ? (((productValue145 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue146))) : productValue145;
    fragmentColor2.y = conditionValue10 ? (((productValue146 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue145))) : productValue146;
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[39u], sumValue17, fma(fragmentScalarConstants1.packedValues[31u], sumValue15, sumValue16 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue70, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue69, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue15, sumValue16 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue70, 0.5, 0.5);
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue103 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue32 = (bitwiseValue3 ? spvNMin(productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue71 = (bitwiseValue3 ? spvNMin(fma(fma(productValue103, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue72 = (bitwiseValue3 ? spvNMin(fma(productValue103 * productValue103, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue103, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue104 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue71, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue72, comparisonValue32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue71 / productValue104, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue32 / productValue104, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue72 / productValue104, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue104, 0.0, 1.0) * 255.0);
    uint productValue105 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue105 & 2u) != 0u) ? 512u : 0u) + ((((productValue105 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue28, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue27, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(intermediateValue8, intermediateValue9, intermediateValue10), vec3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue38 = inverseLengthValue6 * intermediateValue8;
    float productValue39 = inverseLengthValue6 * intermediateValue9;
    float productValue40 = inverseLengthValue6 * intermediateValue10;
    float quotientValue = 1.0 / ((abs(productValue39) + abs(productValue38)) + abs(productValue40));
    float productValue41 = quotientValue * productValue38;
    float productValue42 = quotientValue * productValue39;
    bool conditionValue2 = productValue40 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue12;
    float productValue15;
    float productValue16;
    if ((fragmentVectorConstants1.packedValues[14u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue43 = fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue12 = spvNClamp(productValue43, 0.0, 1.0);
        productValue15 = spvNClamp(((productValue43 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue43, 0.0, 1.0);
        productValue16 = spvNClamp((((productValue43 * productValue43) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue43, 0.0, 1.0);
    }
    else
    {
        intermediateValue12 = fragmentVectorConstants1.packedValues[10u].x;
        productValue15 = fragmentVectorConstants1.packedValues[10u].y;
        productValue16 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue44 = intermediateValue12 * 0.16666667163372039794921875;
    float productValue45 = productValue15 * 0.16666667163372039794921875;
    float productValue46 = productValue16 * 0.16666667163372039794921875;
    float productValue47 = ceil(spvNClamp(spvNMax(spvNMax(productValue44, productValue46), spvNMax(productValue45, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue44 / productValue47, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue45 / productValue47, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue46 / productValue47, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue47, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[14u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue28) * fragmentVectorConstants1.packedValues[5u].w) + productValue28;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue29) * fragmentVectorConstants1.packedValues[5u].w) + productValue29;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue30) * fragmentVectorConstants1.packedValues[5u].w) + productValue30;
    fragmentColor1.w = (intermediateValue4 > intermediateValue7) ? ((intermediateValue4 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue7 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue41 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue42))) : productValue41;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue41)) * ((productValue42 < 0.0) ? (-1.0) : 1.0)) : productValue42;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue9 = inversesqrt(dot(vec3(intermediateValue11, intermediateValue12, intermediateValue13), vec3(intermediateValue11, intermediateValue12, intermediateValue13)));
    float productValue58 = inverseLengthValue9 * intermediateValue11;
    float productValue59 = inverseLengthValue9 * intermediateValue12;
    float productValue60 = inverseLengthValue9 * intermediateValue13;
    float quotientValue1 = 1.0 / ((abs(productValue59) + abs(productValue58)) + abs(productValue60));
    float productValue61 = quotientValue1 * productValue58;
    float productValue62 = quotientValue1 * productValue59;
    bool conditionValue3 = productValue60 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue15;
    float productValue16;
    float productValue17;
    if ((fragmentVectorConstants1.packedValues[14u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue43 = fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue15 = spvNClamp(productValue43, 0.0, 1.0);
        productValue16 = spvNClamp(((productValue43 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue43, 0.0, 1.0);
        productValue17 = spvNClamp((((productValue43 * productValue43) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue43, 0.0, 1.0);
    }
    else
    {
        intermediateValue15 = fragmentVectorConstants1.packedValues[10u].x;
        productValue16 = fragmentVectorConstants1.packedValues[10u].y;
        productValue17 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue63 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue46 = productValue16 * 0.16666667163372039794921875;
    float productValue64 = productValue17 * 0.16666667163372039794921875;
    float productValue65 = ceil(spvNClamp(spvNMax(spvNMax(productValue63, productValue64), spvNMax(productValue46, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue63 / productValue65, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue46 / productValue65, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue64 / productValue65, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue65, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[14u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue55) * fragmentVectorConstants1.packedValues[5u].w) + productValue55;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue56) * fragmentVectorConstants1.packedValues[5u].w) + productValue56;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue57) * fragmentVectorConstants1.packedValues[5u].w) + productValue57;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue3 ? (((productValue61 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue62))) : productValue61;
    fragmentColor2.y = conditionValue3 ? ((1.0 - abs(productValue61)) * ((productValue62 < 0.0) ? (-1.0) : 1.0)) : productValue62;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue63 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue45 = productValue15 * 0.16666667163372039794921875;
    float productValue46 = productValue16 * 0.16666667163372039794921875;
    float productValue89 = ceil(spvNClamp(spvNMax(spvNMax(productValue63, productValue46), spvNMax(productValue45, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue63 / productValue89, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue45 / productValue89, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue46 / productValue89, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue89, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue85) * fragmentVectorConstants1.packedValues[6u].w) + productValue85;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue86) * fragmentVectorConstants1.packedValues[6u].w) + productValue86;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue87) * fragmentVectorConstants1.packedValues[6u].w) + productValue87;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue3 ? (((productValue61 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue62))) : productValue61;
    fragmentColor2.y = conditionValue3 ? ((1.0 - abs(productValue61)) * ((productValue62 < 0.0) ? (-1.0) : 1.0)) : productValue62;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue101 = intermediateValue18 * 0.16666667163372039794921875;
    float productValue46 = productValue16 * 0.16666667163372039794921875;
    float productValue64 = productValue17 * 0.16666667163372039794921875;
    float productValue102 = ceil(spvNClamp(spvNMax(spvNMax(productValue101, productValue64), spvNMax(productValue46, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue11, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue101 / productValue102, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue46 / productValue102, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue64 / productValue102, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue102, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue93) * fragmentVectorConstants1.packedValues[6u].w) + productValue93;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue94) * fragmentVectorConstants1.packedValues[6u].w) + productValue94;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue95) * fragmentVectorConstants1.packedValues[6u].w) + productValue95;
    fragmentColor1.w = (intermediateValue10 > intermediateValue13) ? ((intermediateValue10 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue13 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue8 ? (((productValue99 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue100))) : productValue99;
    fragmentColor2.y = conditionValue8 ? ((1.0 - abs(productValue99)) * ((productValue100 < 0.0) ? (-1.0) : 1.0)) : productValue100;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue44 = intermediateValue12 * 0.16666667163372039794921875;
    float productValue120 = productValue19 * 0.16666667163372039794921875;
    float productValue121 = productValue20 * 0.16666667163372039794921875;
    float productValue122 = ceil(spvNClamp(spvNMax(spvNMax(productValue44, productValue121), spvNMax(productValue120, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue44 / productValue122, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue120 / productValue122, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue121 / productValue122, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue122, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue116) * fragmentVectorConstants1.packedValues[6u].w) + productValue116;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue117) * fragmentVectorConstants1.packedValues[6u].w) + productValue117;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue118) * fragmentVectorConstants1.packedValues[6u].w) + productValue118;
    fragmentColor1.w = (intermediateValue4 > intermediateValue7) ? ((intermediateValue4 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue7 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue41 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue42))) : productValue41;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue41)) * ((productValue42 < 0.0) ? (-1.0) : 1.0)) : productValue42;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue63 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue121 = productValue20 * 0.16666667163372039794921875;
    float productValue136 = productValue21 * 0.16666667163372039794921875;
    float productValue137 = ceil(spvNClamp(spvNMax(spvNMax(productValue63, productValue136), spvNMax(productValue121, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue63 / productValue137, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue121 / productValue137, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue136 / productValue137, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue137, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue133) * fragmentVectorConstants1.packedValues[6u].w) + productValue133;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue134) * fragmentVectorConstants1.packedValues[6u].w) + productValue134;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue135) * fragmentVectorConstants1.packedValues[6u].w) + productValue135;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue3 ? (((productValue61 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue62))) : productValue61;
    fragmentColor2.y = conditionValue3 ? ((1.0 - abs(productValue61)) * ((productValue62 < 0.0) ? (-1.0) : 1.0)) : productValue62;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue63 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue120 = productValue19 * 0.16666667163372039794921875;
    float productValue121 = productValue20 * 0.16666667163372039794921875;
    float productValue157 = ceil(spvNClamp(spvNMax(spvNMax(productValue63, productValue121), spvNMax(productValue120, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue63 / productValue157, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue120 / productValue157, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue121 / productValue157, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue157, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue154) * fragmentVectorConstants1.packedValues[6u].w) + productValue154;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue155) * fragmentVectorConstants1.packedValues[6u].w) + productValue155;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue156) * fragmentVectorConstants1.packedValues[6u].w) + productValue156;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue3 ? (((productValue61 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue62))) : productValue61;
    fragmentColor2.y = conditionValue3 ? ((1.0 - abs(productValue61)) * ((productValue62 < 0.0) ? (-1.0) : 1.0)) : productValue62;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue101 = intermediateValue18 * 0.16666667163372039794921875;
    float productValue121 = productValue20 * 0.16666667163372039794921875;
    float productValue136 = productValue21 * 0.16666667163372039794921875;
    float productValue172 = ceil(spvNClamp(spvNMax(spvNMax(productValue101, productValue136), spvNMax(productValue121, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue11, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue101 / productValue172, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue121 / productValue172, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue136 / productValue172, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue172, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue169) * fragmentVectorConstants1.packedValues[6u].w) + productValue169;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue170) * fragmentVectorConstants1.packedValues[6u].w) + productValue170;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue171) * fragmentVectorConstants1.packedValues[6u].w) + productValue171;
    fragmentColor1.w = (intermediateValue10 > intermediateValue13) ? ((intermediateValue10 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue13 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue8 ? (((productValue99 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue100))) : productValue99;
    fragmentColor2.y = conditionValue8 ? ((1.0 - abs(productValue99)) * ((productValue100 < 0.0) ? (-1.0) : 1.0)) : productValue100;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue190 = intermediateValue13 * 0.16666667163372039794921875;
    float productValue121 = productValue20 * 0.16666667163372039794921875;
    float productValue136 = productValue21 * 0.16666667163372039794921875;
    float productValue191 = ceil(spvNClamp(spvNMax(spvNMax(productValue190, productValue136), spvNMax(productValue121, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue190 / productValue191, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue121 / productValue191, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue136 / productValue191, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue191, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue182) * fragmentVectorConstants1.packedValues[6u].w) + productValue182;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue183) * fragmentVectorConstants1.packedValues[6u].w) + productValue183;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue184) * fragmentVectorConstants1.packedValues[6u].w) + productValue184;
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue8 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue11 ? (((productValue188 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue189))) : productValue188;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue188)) * ((productValue189 < 0.0) ? (-1.0) : 1.0)) : productValue189;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue217 = intermediateValue16 * 0.16666667163372039794921875;
    float productValue136 = productValue21 * 0.16666667163372039794921875;
    float productValue218 = productValue22 * 0.16666667163372039794921875;
    float productValue219 = ceil(spvNClamp(spvNMax(spvNMax(productValue217, productValue218), spvNMax(productValue136, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue217 / productValue219, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue136 / productValue219, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue218 / productValue219, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue219, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue209) * fragmentVectorConstants1.packedValues[6u].w) + productValue209;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue210) * fragmentVectorConstants1.packedValues[6u].w) + productValue210;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue211) * fragmentVectorConstants1.packedValues[6u].w) + productValue211;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue11 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue13 ? (((productValue215 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue216))) : productValue215;
    fragmentColor2.y = conditionValue13 ? ((1.0 - abs(productValue215)) * ((productValue216 < 0.0) ? (-1.0) : 1.0)) : productValue216;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue217 = intermediateValue16 * 0.16666667163372039794921875;
    float productValue121 = productValue20 * 0.16666667163372039794921875;
    float productValue136 = productValue21 * 0.16666667163372039794921875;
    float productValue229 = ceil(spvNClamp(spvNMax(spvNMax(productValue217, productValue136), spvNMax(productValue121, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue217 / productValue229, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue121 / productValue229, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue136 / productValue229, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue229, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue169) * fragmentVectorConstants1.packedValues[6u].w) + productValue169;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue170) * fragmentVectorConstants1.packedValues[6u].w) + productValue170;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue171) * fragmentVectorConstants1.packedValues[6u].w) + productValue171;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue11 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue13 ? (((productValue215 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue216))) : productValue215;
    fragmentColor2.y = conditionValue13 ? ((1.0 - abs(productValue215)) * ((productValue216 < 0.0) ? (-1.0) : 1.0)) : productValue216;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue56)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue247 = intermediateValue19 * 0.16666667163372039794921875;
    float productValue136 = productValue21 * 0.16666667163372039794921875;
    float productValue218 = productValue22 * 0.16666667163372039794921875;
    float productValue248 = ceil(spvNClamp(spvNMax(spvNMax(productValue247, productValue218), spvNMax(productValue136, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue247 / productValue248, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue136 / productValue248, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue218 / productValue248, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue248, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[6u].x - productValue239) * fragmentVectorConstants1.packedValues[6u].w) + productValue239;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[6u].y - productValue240) * fragmentVectorConstants1.packedValues[6u].w) + productValue240;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[6u].z - productValue241) * fragmentVectorConstants1.packedValues[6u].w) + productValue241;
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue14 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue14 ? (((productValue245 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue246))) : productValue245;
    fragmentColor2.y = conditionValue14 ? ((1.0 - abs(productValue245)) * ((productValue246 < 0.0) ? (-1.0) : 1.0)) : productValue246;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue56)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue55) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue56)) * 0.5;
#endif
}
