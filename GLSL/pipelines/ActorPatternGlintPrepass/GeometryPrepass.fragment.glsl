#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPatternGlintPrepass / GeometryPrepass / fragment forward pipeline.
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

#include "../../include/materials/ActorPatternGlintPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue7 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue8 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue17;
    float intermediateValue19;
    float intermediateValue20;
    uint intermediateValue21;
    float productValue1;
    float productValue2;
    float productValue3;
    intermediateValue17 = intermediateValue18;
    intermediateValue19 = intermediateValue18;
    intermediateValue20 = intermediateValue18;
    intermediateValue21 = 4294967295u;
    productValue1 = sampledTextureValue10.z * fragmentVectorConstants1.packedValues[17u].z;
    productValue2 = sampledTextureValue10.y * fragmentVectorConstants1.packedValues[17u].y;
    productValue3 = sampledTextureValue10.x * fragmentVectorConstants1.packedValues[17u].x;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint comparisonValue;
    float multiplyAddValue3;
    float multiplyAddValue4;
    float multiplyAddValue5;
    uint sumValue;
    uint scalarValue9 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue7 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue24 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue24.x;
    float scalarValue24 = sampledTextureValue24.y;
    float scalarValue25 = sampledTextureValue24.z;
    bool productValue78 = ((1.0 - sampledTextureValue24.w) * (scalarValue25 + (scalarValue24 + scalarValue23))) > 0.0;
    uint scalarValue8 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue20;
    float intermediateValue22;
    float intermediateValue23;
    uint intermediateValue24;
    float multiplyAddValue3;
    float multiplyAddValue5;
    float multiplyAddValue7;
    intermediateValue20 = intermediateValue21;
    intermediateValue22 = intermediateValue21;
    intermediateValue23 = intermediateValue21;
    intermediateValue24 = 4294967295u;
    multiplyAddValue3 = productValue78 ? (fma(fragmentVectorConstants1.packedValues[17u].z, sampledTextureValue10.z, -scalarValue25) + scalarValue25) : scalarValue25;
    multiplyAddValue5 = productValue78 ? (fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue10.y, -scalarValue24) + scalarValue24) : scalarValue24;
    multiplyAddValue7 = productValue78 ? (fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue10.x, -scalarValue23) + scalarValue23) : scalarValue23;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint comparisonValue;
    float multiplyAddValue4;
    float multiplyAddValue6;
    float multiplyAddValue8;
    uint sumValue;
    uint scalarValue9 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue27 = uint(int(fragmentScalarConstants1.packedValues[8u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue102 = sampledTextureValue10.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue103 = sampledTextureValue10.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue104 = sampledTextureValue10.z * fragmentVectorConstants1.packedValues[18u].z;
    float productValue105 = sampledTextureValue10.w * fragmentVectorConstants1.packedValues[18u].w;
    uint scalarValue8 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue17;
    float intermediateValue19;
    float intermediateValue20;
    uint intermediateValue21;
    float multiplyAddValue3;
    float multiplyAddValue5;
    float multiplyAddValue7;
    intermediateValue17 = intermediateValue18;
    intermediateValue19 = intermediateValue18;
    intermediateValue20 = intermediateValue18;
    intermediateValue21 = 4294967295u;
    multiplyAddValue3 = fma(productValue105, fma(productValue104, fragmentVectorConstants1.packedValues[1u].z, -productValue104), productValue104);
    multiplyAddValue5 = fma(productValue105, fma(productValue103, fragmentVectorConstants1.packedValues[1u].y, -productValue103), productValue103);
    multiplyAddValue7 = fma(productValue105, fma(productValue102, fragmentVectorConstants1.packedValues[1u].x, -productValue102), productValue102);
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint comparisonValue;
    float multiplyAddValue4;
    float multiplyAddValue6;
    float multiplyAddValue8;
    uint sumValue;
    uint scalarValue9 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue27 = uint(int(fragmentScalarConstants1.packedValues[8u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue24 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue24.x;
    float scalarValue24 = sampledTextureValue24.y;
    float scalarValue25 = sampledTextureValue24.z;
    float scalarValue29 = sampledTextureValue24.w;
    bool productValue134 = ((1.0 - scalarValue29) * (scalarValue25 + (scalarValue24 + scalarValue23))) > 0.0;
    float multiplyAddValue71 = productValue134 ? (fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue10.x, -scalarValue23) + scalarValue23) : scalarValue23;
    float multiplyAddValue72 = productValue134 ? (fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue10.y, -scalarValue24) + scalarValue24) : scalarValue24;
    float multiplyAddValue73 = productValue134 ? (fma(fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue10.z, -scalarValue25) + scalarValue25) : scalarValue25;
    float multiplyAddValue74 = productValue134 ? (fma(fragmentVectorConstants1.packedValues[18u].w, sampledTextureValue10.w, -scalarValue29) + scalarValue29) : scalarValue29;
    uint scalarValue8 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue21;
    float intermediateValue23;
    float intermediateValue24;
    uint intermediateValue25;
    float multiplyAddValue7;
    float multiplyAddValue9;
    float multiplyAddValue11;
    intermediateValue21 = intermediateValue22;
    intermediateValue23 = intermediateValue22;
    intermediateValue24 = intermediateValue22;
    intermediateValue25 = 4294967295u;
    multiplyAddValue7 = fma(multiplyAddValue74, fma(multiplyAddValue73, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue73), multiplyAddValue73);
    multiplyAddValue9 = fma(multiplyAddValue74, fma(multiplyAddValue72, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue72), multiplyAddValue72);
    multiplyAddValue11 = fma(multiplyAddValue74, fma(multiplyAddValue71, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue71), multiplyAddValue71);
    float multiplyAddValue4;
    float multiplyAddValue5;
    float multiplyAddValue6;
    uint comparisonValue;
    float multiplyAddValue8;
    float multiplyAddValue10;
    float multiplyAddValue12;
    uint sumValue;
    uint scalarValue9 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue27 = uint(int(fragmentScalarConstants1.packedValues[8u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue102 = sampledTextureValue10.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue103 = sampledTextureValue10.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue155 = productValue102 * fragmentVectorConstants1.packedValues[1u].x;
    float productValue156 = productValue102 * fragmentVectorConstants1.packedValues[1u].y;
    float productValue157 = productValue102 * fragmentVectorConstants1.packedValues[1u].z;
    float scalarValue31 = ceil(productValue103);
    uint scalarValue8 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue18;
    float intermediateValue20;
    float intermediateValue21;
    uint intermediateValue22;
    float multiplyAddValue3;
    float multiplyAddValue5;
    float multiplyAddValue7;
    intermediateValue18 = intermediateValue19;
    intermediateValue20 = intermediateValue19;
    intermediateValue21 = intermediateValue19;
    intermediateValue22 = 4294967295u;
    multiplyAddValue3 = fma(scalarValue31, fma(productValue103, fragmentVectorConstants1.packedValues[19u].z, -productValue157), productValue157);
    multiplyAddValue5 = fma(scalarValue31, fma(productValue103, fragmentVectorConstants1.packedValues[19u].y, -productValue156), productValue156);
    multiplyAddValue7 = fma(scalarValue31, fma(productValue103, fragmentVectorConstants1.packedValues[19u].x, -productValue155), productValue155);
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint comparisonValue;
    float multiplyAddValue4;
    float multiplyAddValue6;
    float multiplyAddValue8;
    uint sumValue;
    uint scalarValue9 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue27 = uint(int(fragmentScalarConstants1.packedValues[8u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue24 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue24.x;
    float scalarValue24 = sampledTextureValue24.y;
    bool productValue178 = ((sampledTextureValue24.z + (scalarValue24 + scalarValue23)) * (1.0 - sampledTextureValue24.w)) > 0.0;
    float multiplyAddValue87 = productValue178 ? (fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue10.x, -scalarValue23) + scalarValue23) : scalarValue23;
    float multiplyAddValue88 = productValue178 ? (fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue10.y, -scalarValue24) + scalarValue24) : scalarValue24;
    float productValue179 = multiplyAddValue87 * fragmentVectorConstants1.packedValues[1u].x;
    float productValue180 = multiplyAddValue87 * fragmentVectorConstants1.packedValues[1u].y;
    float productValue181 = multiplyAddValue87 * fragmentVectorConstants1.packedValues[1u].z;
    float scalarValue33 = ceil(multiplyAddValue88);
    uint scalarValue8 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue20;
    float intermediateValue22;
    float intermediateValue23;
    uint intermediateValue24;
    float multiplyAddValue5;
    float multiplyAddValue7;
    float multiplyAddValue9;
    intermediateValue20 = intermediateValue21;
    intermediateValue22 = intermediateValue21;
    intermediateValue23 = intermediateValue21;
    intermediateValue24 = 4294967295u;
    multiplyAddValue5 = fma(scalarValue33, fma(multiplyAddValue88, fragmentVectorConstants1.packedValues[19u].z, -productValue181), productValue181);
    multiplyAddValue7 = fma(scalarValue33, fma(multiplyAddValue88, fragmentVectorConstants1.packedValues[19u].y, -productValue180), productValue180);
    multiplyAddValue9 = fma(scalarValue33, fma(multiplyAddValue88, fragmentVectorConstants1.packedValues[19u].x, -productValue179), productValue179);
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    uint comparisonValue;
    float multiplyAddValue6;
    float multiplyAddValue8;
    float multiplyAddValue10;
    uint sumValue;
    uint scalarValue9 = 0u;
    for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue12 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue27 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z;
    bool comparisonValue;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    if (int(uint(int(fragmentVectorConstants1.packedValues[0u].x))) > int(0u))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue22 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue20 = sampledTextureValue22.x;
    float scalarValue21 = sampledTextureValue22.y;
    float scalarValue22 = sampledTextureValue22.z;
    float productValue62 = float((((scalarValue20 + scalarValue21) + scalarValue22) * (1.0 - sampledTextureValue22.w)) > 0.0);
    float productValue63 = (productValue62 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue20)) + scalarValue20;
    float productValue64 = (productValue62 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue21)) + scalarValue21;
    float productValue65 = (productValue62 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue22)) + scalarValue22;
    bool comparisonValue;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if (int(uint(int(fragmentVectorConstants1.packedValues[0u].x))) > int(0u))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue26 = uint(int(fragmentVectorConstants1.packedValues[2u].x));
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue84 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue85 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue86 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[18u].z;
    float productValue87 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[18u].w;
    float productValue88 = (((productValue84 * fragmentVectorConstants1.packedValues[1u].x) - productValue84) * productValue87) + productValue84;
    float productValue89 = (((productValue85 * fragmentVectorConstants1.packedValues[1u].y) - productValue85) * productValue87) + productValue85;
    float productValue90 = (((productValue86 * fragmentVectorConstants1.packedValues[1u].z) - productValue86) * productValue87) + productValue86;
    bool comparisonValue;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    if (int(uint(int(fragmentVectorConstants1.packedValues[0u].x))) > int(0u))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue26 = uint(int(fragmentVectorConstants1.packedValues[2u].x));
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue22 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue20 = sampledTextureValue22.x;
    float scalarValue21 = sampledTextureValue22.y;
    float scalarValue22 = sampledTextureValue22.z;
    float scalarValue28 = sampledTextureValue22.w;
    float productValue114 = float((((scalarValue20 + scalarValue21) + scalarValue22) * (1.0 - scalarValue28)) > 0.0);
    float productValue115 = (productValue114 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x) - scalarValue20)) + scalarValue20;
    float productValue116 = (productValue114 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y) - scalarValue21)) + scalarValue21;
    float productValue117 = (productValue114 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[18u].z) - scalarValue22)) + scalarValue22;
    float productValue118 = (productValue114 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[18u].w) - scalarValue28)) + scalarValue28;
    float productValue119 = (((productValue115 * fragmentVectorConstants1.packedValues[1u].x) - productValue115) * productValue118) + productValue115;
    float productValue120 = (((productValue116 * fragmentVectorConstants1.packedValues[1u].y) - productValue116) * productValue118) + productValue116;
    float productValue121 = (((productValue117 * fragmentVectorConstants1.packedValues[1u].z) - productValue117) * productValue118) + productValue117;
    bool comparisonValue;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if (int(uint(int(fragmentVectorConstants1.packedValues[0u].x))) > int(0u))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue26 = uint(int(fragmentVectorConstants1.packedValues[2u].x));
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue84 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue85 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue135 = fragmentVectorConstants1.packedValues[1u].x * productValue84;
    float productValue136 = fragmentVectorConstants1.packedValues[1u].y * productValue84;
    float productValue137 = fragmentVectorConstants1.packedValues[1u].z * productValue84;
    float scalarValue30 = ceil(productValue85);
    float productValue138 = (((productValue85 * fragmentVectorConstants1.packedValues[19u].x) - productValue135) * scalarValue30) + productValue135;
    float productValue139 = (((productValue85 * fragmentVectorConstants1.packedValues[19u].y) - productValue136) * scalarValue30) + productValue136;
    float productValue140 = (((productValue85 * fragmentVectorConstants1.packedValues[19u].z) - productValue137) * scalarValue30) + productValue137;
    bool comparisonValue;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (int(uint(int(fragmentVectorConstants1.packedValues[0u].x))) > int(0u))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue26 = uint(int(fragmentVectorConstants1.packedValues[2u].x));
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue22 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue20 = sampledTextureValue22.x;
    float scalarValue21 = sampledTextureValue22.y;
    float productValue163 = float((((scalarValue20 + scalarValue21) + sampledTextureValue22.z) * (1.0 - sampledTextureValue22.w)) > 0.0);
    float productValue164 = (productValue163 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x) - scalarValue20)) + scalarValue20;
    float productValue165 = (productValue163 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y) - scalarValue21)) + scalarValue21;
    float productValue166 = productValue164 * fragmentVectorConstants1.packedValues[1u].x;
    float productValue167 = productValue164 * fragmentVectorConstants1.packedValues[1u].y;
    float productValue168 = productValue164 * fragmentVectorConstants1.packedValues[1u].z;
    float scalarValue32 = ceil(productValue165);
    float productValue169 = (((productValue165 * fragmentVectorConstants1.packedValues[19u].x) - productValue166) * scalarValue32) + productValue166;
    float productValue170 = (((productValue165 * fragmentVectorConstants1.packedValues[19u].y) - productValue167) * scalarValue32) + productValue167;
    float productValue171 = (((productValue165 * fragmentVectorConstants1.packedValues[19u].z) - productValue168) * scalarValue32) + productValue168;
    bool comparisonValue;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if (int(uint(int(fragmentVectorConstants1.packedValues[0u].x))) > int(0u))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (int(scalarValue8) <= int(scalarValue9))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue5;
        uint intermediateValue6;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        intermediateValue5 = 0u;
        intermediateValue6 = 1u;
        intermediateValue7 = productValue;
        intermediateValue8 = productValue12;
        intermediateValue9 = productValue27;
        float productValue3;
        float productValue4;
        float productValue5;
        uint comparisonValue2;
        for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue8;
        uint intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        intermediateValue8 = 0u;
        intermediateValue9 = 1u;
        intermediateValue10 = productValue63;
        intermediateValue11 = productValue64;
        intermediateValue12 = productValue65;
        float productValue4;
        float productValue5;
        float productValue6;
        uint comparisonValue2;
        for (;;)
        {
            uint sumValue21 = intermediateValue8 + 26u;
            uint sumValue22 = intermediateValue8 + 19u;
            vec4 sampledTextureValue23 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue21].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue21].x, (fragmentVectorConstants1.packedValues[sumValue21].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue21].y));
            float productValue66 = sampledTextureValue23.w * fragmentVectorConstants1.packedValues[sumValue22].w;
            productValue4 = (((sampledTextureValue23.x * fragmentVectorConstants1.packedValues[sumValue22].x) - intermediateValue10) * productValue66) + intermediateValue10;
            productValue5 = (((sampledTextureValue23.y * fragmentVectorConstants1.packedValues[sumValue22].y) - intermediateValue11) * productValue66) + intermediateValue11;
            productValue6 = (((sampledTextureValue23.z * fragmentVectorConstants1.packedValues[sumValue22].z) - intermediateValue12) * productValue66) + intermediateValue12;
            comparisonValue2 = ((intermediateValue9 != 0u) && (productValue66 > 0.5)) ? 0u : intermediateValue9;
            uint sumValue23 = intermediateValue8 + 1u;
            if (int(sumValue23) < int(uint(int(fragmentVectorConstants1.packedValues[0u].x))))
            {
                intermediateValue8 = sumValue23;
                intermediateValue9 = comparisonValue2;
                intermediateValue10 = productValue4;
                intermediateValue11 = productValue5;
                intermediateValue12 = productValue6;
            }
            else
            {
                break;
            }
        }
        comparisonValue = comparisonValue2 != 0u;
        intermediateValue5 = productValue4;
        intermediateValue6 = productValue5;
        intermediateValue7 = productValue6;
    }
    else
    {
        comparisonValue = true;
        intermediateValue5 = productValue63;
        intermediateValue6 = productValue64;
        intermediateValue7 = productValue65;
    }
    uint comparisonValue1 = comparisonValue ? scalarValue : (scalarValue & 4294967294u);
    float productValue67 = ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue5;
    float productValue68 = ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue6;
    float productValue69 = ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue7;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue32 = (fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[35u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue33 = (fragmentVectorConstants1.packedValues[15u].y * fragmentVectorConstants1.packedValues[35u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue34 = (fragmentVectorConstants1.packedValues[15u].z * fragmentVectorConstants1.packedValues[35u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((comparisonValue1 & 1u) == 0u)
    {
        intermediateValue13 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue15 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue16 = fragmentVectorConstants1.packedValues[34u].x;
    }
    else
    {
        vec4 sampledTextureValue4 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue13 = sampledTextureValue4.x;
        intermediateValue14 = sampledTextureValue4.y;
        intermediateValue15 = sampledTextureValue4.z;
        intermediateValue16 = ((comparisonValue1 & 2u) != 0u) ? sampledTextureValue4.w : fragmentVectorConstants1.packedValues[34u].x;
    }
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if ((comparisonValue1 & 28u) == 0u)
    {
        intermediateValue17 = varyingNormal0.x;
        intermediateValue18 = varyingNormal0.y;
        intermediateValue19 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue24;
        float intermediateValue25;
        float intermediateValue26;
        if ((comparisonValue1 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue5;
        uint intermediateValue6;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        intermediateValue5 = 0u;
        intermediateValue6 = 1u;
        intermediateValue7 = productValue88;
        intermediateValue8 = productValue89;
        intermediateValue9 = productValue90;
        float productValue7;
        float productValue8;
        float productValue9;
        uint comparisonValue2;
        for (;;)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue9;
        uint intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        intermediateValue9 = 0u;
        intermediateValue10 = 1u;
        intermediateValue11 = productValue119;
        intermediateValue12 = productValue120;
        intermediateValue13 = productValue121;
        float productValue8;
        float productValue9;
        float productValue10;
        uint comparisonValue2;
        for (;;)
        {
            uint sumValue31 = intermediateValue9 + 27u;
            uint sumValue32 = intermediateValue9 + 20u;
            vec4 sampledTextureValue27 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue31].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue31].x, (fragmentVectorConstants1.packedValues[sumValue31].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue31].y));
            float productValue122 = sampledTextureValue27.w * fragmentVectorConstants1.packedValues[sumValue32].w;
            productValue8 = (((sampledTextureValue27.x * fragmentVectorConstants1.packedValues[sumValue32].x) - intermediateValue11) * productValue122) + intermediateValue11;
            productValue9 = (((sampledTextureValue27.y * fragmentVectorConstants1.packedValues[sumValue32].y) - intermediateValue12) * productValue122) + intermediateValue12;
            productValue10 = (((sampledTextureValue27.z * fragmentVectorConstants1.packedValues[sumValue32].z) - intermediateValue13) * productValue122) + intermediateValue13;
            comparisonValue2 = ((intermediateValue10 != 0u) && (productValue122 > 0.5)) ? 0u : intermediateValue10;
            uint sumValue33 = intermediateValue9 + 1u;
            if (int(sumValue33) < int(uint(int(fragmentVectorConstants1.packedValues[0u].x))))
            {
                intermediateValue9 = sumValue33;
                intermediateValue10 = comparisonValue2;
                intermediateValue11 = productValue8;
                intermediateValue12 = productValue9;
                intermediateValue13 = productValue10;
            }
            else
            {
                break;
            }
        }
        comparisonValue = comparisonValue2 != 0u;
        intermediateValue6 = productValue8;
        intermediateValue7 = productValue9;
        intermediateValue8 = productValue10;
    }
    else
    {
        comparisonValue = true;
        intermediateValue6 = productValue119;
        intermediateValue7 = productValue120;
        intermediateValue8 = productValue121;
    }
    uint comparisonValue36 = comparisonValue ? scalarValue26 : (scalarValue26 & 4294967294u);
    float productValue123 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue6;
    float productValue124 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue7;
    float productValue125 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue8;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue95 = (fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[36u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue96 = (fragmentVectorConstants1.packedValues[16u].y * fragmentVectorConstants1.packedValues[36u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue97 = (fragmentVectorConstants1.packedValues[16u].z * fragmentVectorConstants1.packedValues[36u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if ((comparisonValue36 & 1u) == 0u)
    {
        intermediateValue14 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue15 = fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue16 = fragmentVectorConstants1.packedValues[34u].x;
        intermediateValue17 = fragmentVectorConstants1.packedValues[35u].x;
    }
    else
    {
        vec4 sampledTextureValue4 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue14 = sampledTextureValue4.x;
        intermediateValue15 = sampledTextureValue4.y;
        intermediateValue16 = sampledTextureValue4.z;
        intermediateValue17 = ((comparisonValue36 & 2u) != 0u) ? sampledTextureValue4.w : fragmentVectorConstants1.packedValues[35u].x;
    }
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
    if ((comparisonValue36 & 28u) == 0u)
    {
        intermediateValue18 = varyingNormal0.x;
        intermediateValue19 = varyingNormal0.y;
        intermediateValue20 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue25;
        float intermediateValue26;
        float intermediateValue27;
        if ((comparisonValue36 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue6;
        uint intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        intermediateValue6 = 0u;
        intermediateValue7 = 1u;
        intermediateValue8 = productValue138;
        intermediateValue9 = productValue139;
        intermediateValue10 = productValue140;
        float productValue8;
        float productValue9;
        float productValue10;
        uint comparisonValue2;
        for (;;)
        {
            uint sumValue34 = intermediateValue6 + 28u;
            uint sumValue35 = intermediateValue6 + 21u;
            vec4 sampledTextureValue28 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue34].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue34].x, (fragmentVectorConstants1.packedValues[sumValue34].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue34].y));
            float productValue141 = sampledTextureValue28.w * fragmentVectorConstants1.packedValues[sumValue35].w;
            productValue8 = (((sampledTextureValue28.x * fragmentVectorConstants1.packedValues[sumValue35].x) - intermediateValue8) * productValue141) + intermediateValue8;
            productValue9 = (((sampledTextureValue28.y * fragmentVectorConstants1.packedValues[sumValue35].y) - intermediateValue9) * productValue141) + intermediateValue9;
            productValue10 = (((sampledTextureValue28.z * fragmentVectorConstants1.packedValues[sumValue35].z) - intermediateValue10) * productValue141) + intermediateValue10;
            comparisonValue2 = ((intermediateValue7 != 0u) && (productValue141 > 0.5)) ? 0u : intermediateValue7;
            uint sumValue36 = intermediateValue6 + 1u;
            if (int(sumValue36) < int(uint(int(fragmentVectorConstants1.packedValues[0u].x))))
            {
                intermediateValue6 = sumValue36;
                intermediateValue7 = comparisonValue2;
                intermediateValue8 = productValue8;
                intermediateValue9 = productValue9;
                intermediateValue10 = productValue10;
            }
            else
            {
                break;
            }
        }
        comparisonValue = comparisonValue2 != 0u;
        intermediateValue3 = productValue8;
        intermediateValue4 = productValue9;
        intermediateValue5 = productValue10;
    }
    else
    {
        comparisonValue = true;
        intermediateValue3 = productValue138;
        intermediateValue4 = productValue139;
        intermediateValue5 = productValue140;
    }
    uint comparisonValue36 = comparisonValue ? scalarValue26 : (scalarValue26 & 4294967294u);
    float productValue142 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue3;
    float productValue143 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue4;
    float productValue144 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue5;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue145 = (fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[37u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue146 = (fragmentVectorConstants1.packedValues[16u].y * fragmentVectorConstants1.packedValues[37u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue147 = (fragmentVectorConstants1.packedValues[16u].z * fragmentVectorConstants1.packedValues[37u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((comparisonValue36 & 1u) == 0u)
    {
        intermediateValue11 = fragmentVectorConstants1.packedValues[20u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[35u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[36u].x;
    }
    else
    {
        vec4 sampledTextureValue4 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue11 = sampledTextureValue4.x;
        intermediateValue12 = sampledTextureValue4.y;
        intermediateValue13 = sampledTextureValue4.z;
        intermediateValue14 = ((comparisonValue36 & 2u) != 0u) ? sampledTextureValue4.w : fragmentVectorConstants1.packedValues[36u].x;
    }
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if ((comparisonValue36 & 28u) == 0u)
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
        if ((comparisonValue36 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue8;
        uint intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        intermediateValue8 = 0u;
        intermediateValue9 = 1u;
        intermediateValue10 = productValue169;
        intermediateValue11 = productValue170;
        intermediateValue12 = productValue171;
        float productValue9;
        float productValue10;
        float productValue11;
        uint comparisonValue2;
        for (;;)
        {
            uint sumValue39 = intermediateValue8 + 28u;
            uint sumValue40 = intermediateValue8 + 21u;
            vec4 sampledTextureValue30 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue39].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue39].x, (fragmentVectorConstants1.packedValues[sumValue39].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue39].y));
            float productValue172 = sampledTextureValue30.w * fragmentVectorConstants1.packedValues[sumValue40].w;
            productValue9 = (((sampledTextureValue30.x * fragmentVectorConstants1.packedValues[sumValue40].x) - intermediateValue10) * productValue172) + intermediateValue10;
            productValue10 = (((sampledTextureValue30.y * fragmentVectorConstants1.packedValues[sumValue40].y) - intermediateValue11) * productValue172) + intermediateValue11;
            productValue11 = (((sampledTextureValue30.z * fragmentVectorConstants1.packedValues[sumValue40].z) - intermediateValue12) * productValue172) + intermediateValue12;
            comparisonValue2 = ((intermediateValue9 != 0u) && (productValue172 > 0.5)) ? 0u : intermediateValue9;
            uint sumValue23 = intermediateValue8 + 1u;
            if (int(sumValue23) < int(uint(int(fragmentVectorConstants1.packedValues[0u].x))))
            {
                intermediateValue8 = sumValue23;
                intermediateValue9 = comparisonValue2;
                intermediateValue10 = productValue9;
                intermediateValue11 = productValue10;
                intermediateValue12 = productValue11;
            }
            else
            {
                break;
            }
        }
        comparisonValue = comparisonValue2 != 0u;
        intermediateValue5 = productValue9;
        intermediateValue6 = productValue10;
        intermediateValue7 = productValue11;
    }
    else
    {
        comparisonValue = true;
        intermediateValue5 = productValue169;
        intermediateValue6 = productValue170;
        intermediateValue7 = productValue171;
    }
    uint comparisonValue36 = comparisonValue ? scalarValue26 : (scalarValue26 & 4294967294u);
    float productValue173 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue5;
    float productValue174 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue6;
    float productValue175 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue7;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue145 = (fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[37u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue146 = (fragmentVectorConstants1.packedValues[16u].y * fragmentVectorConstants1.packedValues[37u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue147 = (fragmentVectorConstants1.packedValues[16u].z * fragmentVectorConstants1.packedValues[37u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((comparisonValue36 & 1u) == 0u)
    {
        intermediateValue13 = fragmentVectorConstants1.packedValues[20u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue15 = fragmentVectorConstants1.packedValues[35u].x;
        intermediateValue16 = fragmentVectorConstants1.packedValues[36u].x;
    }
    else
    {
        vec4 sampledTextureValue4 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue13 = sampledTextureValue4.x;
        intermediateValue14 = sampledTextureValue4.y;
        intermediateValue15 = sampledTextureValue4.z;
        intermediateValue16 = ((comparisonValue36 & 2u) != 0u) ? sampledTextureValue4.w : fragmentVectorConstants1.packedValues[36u].x;
    }
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if ((comparisonValue36 & 28u) == 0u)
    {
        intermediateValue17 = varyingNormal0.x;
        intermediateValue18 = varyingNormal0.y;
        intermediateValue19 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue24;
        float intermediateValue25;
        float intermediateValue26;
        if ((comparisonValue36 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue10 = scalarValue9 + 26u;
        vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue10].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue10].x), fma(fragmentVectorConstants1.packedValues[sumValue10].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue10].y)));
        uint sumValue11 = scalarValue9 + 19u;
        float bitwiseValue1 = sampledTextureValue11.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue9) + 304u) + 12u) >> 2u];
        multiplyAddValue = fma(sampledTextureValue11.x, fragmentVectorConstants1.packedValues[sumValue11].x, -productValue3);
        multiplyAddValue1 = fma(sampledTextureValue11.y, fragmentVectorConstants1.packedValues[sumValue11].y, -productValue2);
        multiplyAddValue2 = fma(sampledTextureValue11.z, fragmentVectorConstants1.packedValues[sumValue11].z, -productValue1);
        multiplyAddValue5 = fma(bitwiseValue1, multiplyAddValue, productValue3);
        multiplyAddValue4 = fma(bitwiseValue1, multiplyAddValue1, productValue2);
        multiplyAddValue3 = fma(bitwiseValue1, multiplyAddValue2, productValue1);
        comparisonValue = ((bitwiseValue1 > 0.5) && (intermediateValue21 != 0u)) ? 0u : intermediateValue21;
        sumValue = scalarValue9 + 1u;
        intermediateValue17 = multiplyAddValue;
        intermediateValue19 = multiplyAddValue1;
        intermediateValue20 = multiplyAddValue2;
        intermediateValue21 = comparisonValue;
        productValue1 = multiplyAddValue3;
        productValue2 = multiplyAddValue4;
        productValue3 = multiplyAddValue5;
        scalarValue9 = sumValue;
        continue;
    }
    uint comparisonValue10 = (intermediateValue21 != 0u) ? scalarValue7 : (scalarValue7 & 4294967294u);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue12 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue13 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue31 = fma(sampledTextureValue12.x, fragmentVectorConstants1.packedValues[15u].x, sampledTextureValue13.x * fragmentVectorConstants1.packedValues[15u].x) * fragmentVectorConstants1.packedValues[35u].x;
    float multiplyAddValue32 = fma(sampledTextureValue12.y, fragmentVectorConstants1.packedValues[15u].y, sampledTextureValue13.y * fragmentVectorConstants1.packedValues[15u].y) * fragmentVectorConstants1.packedValues[35u].y;
    float multiplyAddValue33 = fma(sampledTextureValue12.z, fragmentVectorConstants1.packedValues[15u].z, sampledTextureValue13.z * fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[35u].z;
    fragmentColor1.x = fma(multiplyAddValue31, multiplyAddValue31, fma(fragmentScalarConstants1.packedValues[27u], fma(-productValue3, multiplyAddValue28, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue28 * productValue3));
    fragmentColor1.y = fma(multiplyAddValue32, multiplyAddValue32, fma(fragmentScalarConstants1.packedValues[27u], fma(-productValue2, multiplyAddValue29, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue29 * productValue2));
    fragmentColor1.z = fma(multiplyAddValue33, multiplyAddValue33, fma(fragmentScalarConstants1.packedValues[27u], fma(-productValue1, multiplyAddValue30, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue30 * productValue1));
    bool comparisonValue11 = (comparisonValue10 & 16u) == 16u;
    bool comparisonValue12 = (comparisonValue10 & 4u) == 4u;
    bool comparisonValue13 = (comparisonValue10 & 8u) == 8u;
    float scalarValue10 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue11 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue12 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue13 = dFdxCoarse(varyingTexCoord0.x);
    float comparisonValue5;
    float intermediateValue27;
    float intermediateValue28;
    float intermediateValue29;
    if ((comparisonValue10 & 1u) == 1u)
    {
        vec4 sampledTextureValue14 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
        comparisonValue5 = ((comparisonValue10 & 2u) == 2u) ? sampledTextureValue14.w : fragmentScalarConstants1.packedValues[136u];
        intermediateValue27 = sampledTextureValue14.x;
        intermediateValue28 = sampledTextureValue14.z;
        intermediateValue29 = sampledTextureValue14.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[136u];
        intermediateValue27 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue28 = fragmentScalarConstants1.packedValues[132u];
        intermediateValue29 = fragmentScalarConstants1.packedValues[56u];
    }
    float productValue4;
    float productValue5;
    float productValue6;
    if (comparisonValue11 || (comparisonValue13 || comparisonValue12))
    {
        float multiplyAddValue16;
        float multiplyAddValue17;
        float multiplyAddValue18;
        bool intermediateValue32;
        if (comparisonValue12)
        {
            vec4 sampledTextureValue15 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
            multiplyAddValue16 = fma(sampledTextureValue15.z, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue15.y, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue15.x, 2.0, -1.0);
            intermediateValue32 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue10 = scalarValue9 + 26u;
        vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue10].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue10].x), fma(fragmentVectorConstants1.packedValues[sumValue10].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue10].y)));
        uint sumValue11 = scalarValue9 + 19u;
        float bitwiseValue1 = sampledTextureValue11.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue9) + 304u) + 12u) >> 2u];
        multiplyAddValue = fma(sampledTextureValue11.x, fragmentVectorConstants1.packedValues[sumValue11].x, -multiplyAddValue7);
        multiplyAddValue1 = fma(sampledTextureValue11.y, fragmentVectorConstants1.packedValues[sumValue11].y, -multiplyAddValue5);
        multiplyAddValue2 = fma(sampledTextureValue11.z, fragmentVectorConstants1.packedValues[sumValue11].z, -multiplyAddValue3);
        multiplyAddValue8 = fma(bitwiseValue1, multiplyAddValue, multiplyAddValue7);
        multiplyAddValue6 = fma(bitwiseValue1, multiplyAddValue1, multiplyAddValue5);
        multiplyAddValue4 = fma(bitwiseValue1, multiplyAddValue2, multiplyAddValue3);
        comparisonValue = ((bitwiseValue1 > 0.5) && (intermediateValue24 != 0u)) ? 0u : intermediateValue24;
        sumValue = scalarValue9 + 1u;
        intermediateValue20 = multiplyAddValue;
        intermediateValue22 = multiplyAddValue1;
        intermediateValue23 = multiplyAddValue2;
        intermediateValue24 = comparisonValue;
        multiplyAddValue3 = multiplyAddValue4;
        multiplyAddValue5 = multiplyAddValue6;
        multiplyAddValue7 = multiplyAddValue8;
        scalarValue9 = sumValue;
        continue;
    }
    uint comparisonValue31 = (intermediateValue24 != 0u) ? scalarValue7 : (scalarValue7 & 4294967294u);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue12 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue13 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue31 = fma(sampledTextureValue12.x, fragmentVectorConstants1.packedValues[15u].x, sampledTextureValue13.x * fragmentVectorConstants1.packedValues[15u].x) * fragmentVectorConstants1.packedValues[35u].x;
    float multiplyAddValue32 = fma(sampledTextureValue12.y, fragmentVectorConstants1.packedValues[15u].y, sampledTextureValue13.y * fragmentVectorConstants1.packedValues[15u].y) * fragmentVectorConstants1.packedValues[35u].y;
    float multiplyAddValue33 = fma(sampledTextureValue12.z, fragmentVectorConstants1.packedValues[15u].z, sampledTextureValue13.z * fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[35u].z;
    fragmentColor1.x = fma(multiplyAddValue31, multiplyAddValue31, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue7, multiplyAddValue28, fragmentVectorConstants1.packedValues[6u].x), multiplyAddValue28 * multiplyAddValue7));
    fragmentColor1.y = fma(multiplyAddValue32, multiplyAddValue32, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue5, multiplyAddValue29, fragmentVectorConstants1.packedValues[6u].y), multiplyAddValue29 * multiplyAddValue5));
    fragmentColor1.z = fma(multiplyAddValue33, multiplyAddValue33, fma(fragmentScalarConstants1.packedValues[27u], fma(-multiplyAddValue3, multiplyAddValue30, fragmentVectorConstants1.packedValues[6u].z), multiplyAddValue30 * multiplyAddValue3));
    bool comparisonValue32 = (comparisonValue31 & 16u) == 16u;
    bool comparisonValue33 = (comparisonValue31 & 4u) == 4u;
    bool comparisonValue34 = (comparisonValue31 & 8u) == 8u;
    float scalarValue11 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue13 = dFdxCoarse(varyingTexCoord0.x);
    float scalarValue12 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue10 = dFdxCoarse(varyingTexCoord0.y);
    float comparisonValue5;
    float intermediateValue30;
    float intermediateValue31;
    float intermediateValue32;
    if ((comparisonValue31 & 1u) == 1u)
    {
        vec4 sampledTextureValue14 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
        comparisonValue5 = ((comparisonValue31 & 2u) == 2u) ? sampledTextureValue14.w : fragmentScalarConstants1.packedValues[136u];
        intermediateValue30 = sampledTextureValue14.x;
        intermediateValue31 = sampledTextureValue14.z;
        intermediateValue32 = sampledTextureValue14.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[136u];
        intermediateValue30 = fragmentScalarConstants1.packedValues[72u];
        intermediateValue31 = fragmentScalarConstants1.packedValues[132u];
        intermediateValue32 = fragmentScalarConstants1.packedValues[56u];
    }
    float productValue2;
    float productValue3;
    float productValue4;
    if (comparisonValue32 || (comparisonValue34 || comparisonValue33))
    {
        float multiplyAddValue19;
        float multiplyAddValue20;
        float multiplyAddValue21;
        bool intermediateValue35;
        if (comparisonValue33)
        {
            vec4 sampledTextureValue15 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
            multiplyAddValue19 = fma(sampledTextureValue15.z, 2.0, -1.0);
            multiplyAddValue20 = fma(sampledTextureValue15.y, 2.0, -1.0);
            multiplyAddValue21 = fma(sampledTextureValue15.x, 2.0, -1.0);
            intermediateValue35 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue29 = scalarValue9 + 27u;
        vec4 sampledTextureValue26 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue29].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue29].x), fma(fragmentVectorConstants1.packedValues[sumValue29].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue29].y)));
        uint sumValue30 = scalarValue9 + 20u;
        float bitwiseValue4 = sampledTextureValue26.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue9) + 320u) + 12u) >> 2u];
        multiplyAddValue = fma(sampledTextureValue26.x, fragmentVectorConstants1.packedValues[sumValue30].x, -multiplyAddValue7);
        multiplyAddValue1 = fma(sampledTextureValue26.y, fragmentVectorConstants1.packedValues[sumValue30].y, -multiplyAddValue5);
        multiplyAddValue2 = fma(sampledTextureValue26.z, fragmentVectorConstants1.packedValues[sumValue30].z, -multiplyAddValue3);
        multiplyAddValue8 = fma(bitwiseValue4, multiplyAddValue, multiplyAddValue7);
        multiplyAddValue6 = fma(bitwiseValue4, multiplyAddValue1, multiplyAddValue5);
        multiplyAddValue4 = fma(bitwiseValue4, multiplyAddValue2, multiplyAddValue3);
        comparisonValue = ((bitwiseValue4 > 0.5) && (intermediateValue21 != 0u)) ? 0u : intermediateValue21;
        sumValue = scalarValue9 + 1u;
        intermediateValue17 = multiplyAddValue;
        intermediateValue19 = multiplyAddValue1;
        intermediateValue20 = multiplyAddValue2;
        intermediateValue21 = comparisonValue;
        multiplyAddValue3 = multiplyAddValue4;
        multiplyAddValue5 = multiplyAddValue6;
        multiplyAddValue7 = multiplyAddValue8;
        scalarValue9 = sumValue;
        continue;
    }
    uint comparisonValue37 = (intermediateValue21 != 0u) ? scalarValue27 : (scalarValue27 & 4294967294u);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue57 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue12 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue13 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue58 = fma(sampledTextureValue12.x, fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue13.x * fragmentVectorConstants1.packedValues[16u].x) * fragmentVectorConstants1.packedValues[36u].x;
    float multiplyAddValue59 = fma(sampledTextureValue12.y, fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue13.y * fragmentVectorConstants1.packedValues[16u].y) * fragmentVectorConstants1.packedValues[36u].y;
    float multiplyAddValue60 = fma(sampledTextureValue12.z, fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue13.z * fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[36u].z;
    fragmentColor1.x = fma(multiplyAddValue58, multiplyAddValue58, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue7, multiplyAddValue55, fragmentVectorConstants1.packedValues[7u].x), multiplyAddValue55 * multiplyAddValue7));
    fragmentColor1.y = fma(multiplyAddValue59, multiplyAddValue59, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue5, multiplyAddValue56, fragmentVectorConstants1.packedValues[7u].y), multiplyAddValue56 * multiplyAddValue5));
    fragmentColor1.z = fma(multiplyAddValue60, multiplyAddValue60, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue3, multiplyAddValue57, fragmentVectorConstants1.packedValues[7u].z), multiplyAddValue57 * multiplyAddValue3));
    bool comparisonValue38 = (comparisonValue37 & 16u) == 16u;
    bool comparisonValue39 = (comparisonValue37 & 4u) == 4u;
    bool comparisonValue40 = (comparisonValue37 & 8u) == 8u;
    float scalarValue10 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue12 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue11 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue13 = dFdxCoarse(varyingTexCoord0.x);
    float comparisonValue5;
    float intermediateValue27;
    float intermediateValue28;
    float intermediateValue29;
    if ((comparisonValue37 & 1u) == 1u)
    {
        vec4 sampledTextureValue14 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
        comparisonValue5 = ((comparisonValue37 & 2u) == 2u) ? sampledTextureValue14.w : fragmentScalarConstants1.packedValues[140u];
        intermediateValue27 = sampledTextureValue14.x;
        intermediateValue28 = sampledTextureValue14.z;
        intermediateValue29 = sampledTextureValue14.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[140u];
        intermediateValue27 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue28 = fragmentScalarConstants1.packedValues[136u];
        intermediateValue29 = fragmentScalarConstants1.packedValues[60u];
    }
    float productValue5;
    float productValue6;
    float productValue7;
    if (comparisonValue38 || (comparisonValue40 || comparisonValue39))
    {
        float multiplyAddValue19;
        float multiplyAddValue20;
        float multiplyAddValue21;
        bool intermediateValue32;
        if (comparisonValue39)
        {
            vec4 sampledTextureValue15 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
            multiplyAddValue19 = fma(sampledTextureValue15.z, 2.0, -1.0);
            multiplyAddValue20 = fma(sampledTextureValue15.y, 2.0, -1.0);
            multiplyAddValue21 = fma(sampledTextureValue15.x, 2.0, -1.0);
            intermediateValue32 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue29 = scalarValue9 + 27u;
        vec4 sampledTextureValue26 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue29].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue29].x), fma(fragmentVectorConstants1.packedValues[sumValue29].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue29].y)));
        uint sumValue30 = scalarValue9 + 20u;
        float bitwiseValue4 = sampledTextureValue26.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue9) + 320u) + 12u) >> 2u];
        multiplyAddValue4 = fma(sampledTextureValue26.x, fragmentVectorConstants1.packedValues[sumValue30].x, -multiplyAddValue11);
        multiplyAddValue5 = fma(sampledTextureValue26.y, fragmentVectorConstants1.packedValues[sumValue30].y, -multiplyAddValue9);
        multiplyAddValue6 = fma(sampledTextureValue26.z, fragmentVectorConstants1.packedValues[sumValue30].z, -multiplyAddValue7);
        multiplyAddValue12 = fma(bitwiseValue4, multiplyAddValue4, multiplyAddValue11);
        multiplyAddValue10 = fma(bitwiseValue4, multiplyAddValue5, multiplyAddValue9);
        multiplyAddValue8 = fma(bitwiseValue4, multiplyAddValue6, multiplyAddValue7);
        comparisonValue = ((bitwiseValue4 > 0.5) && (intermediateValue25 != 0u)) ? 0u : intermediateValue25;
        sumValue = scalarValue9 + 1u;
        intermediateValue21 = multiplyAddValue4;
        intermediateValue23 = multiplyAddValue5;
        intermediateValue24 = multiplyAddValue6;
        intermediateValue25 = comparisonValue;
        multiplyAddValue7 = multiplyAddValue8;
        multiplyAddValue9 = multiplyAddValue10;
        multiplyAddValue11 = multiplyAddValue12;
        scalarValue9 = sumValue;
        continue;
    }
    uint comparisonValue43 = (intermediateValue25 != 0u) ? scalarValue27 : (scalarValue27 & 4294967294u);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue57 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue12 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue13 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue58 = fma(sampledTextureValue12.x, fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue13.x * fragmentVectorConstants1.packedValues[16u].x) * fragmentVectorConstants1.packedValues[36u].x;
    float multiplyAddValue59 = fma(sampledTextureValue12.y, fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue13.y * fragmentVectorConstants1.packedValues[16u].y) * fragmentVectorConstants1.packedValues[36u].y;
    float multiplyAddValue60 = fma(sampledTextureValue12.z, fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue13.z * fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[36u].z;
    fragmentColor1.x = fma(multiplyAddValue58, multiplyAddValue58, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue11, multiplyAddValue55, fragmentVectorConstants1.packedValues[7u].x), multiplyAddValue55 * multiplyAddValue11));
    fragmentColor1.y = fma(multiplyAddValue59, multiplyAddValue59, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue9, multiplyAddValue56, fragmentVectorConstants1.packedValues[7u].y), multiplyAddValue56 * multiplyAddValue9));
    fragmentColor1.z = fma(multiplyAddValue60, multiplyAddValue60, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue7, multiplyAddValue57, fragmentVectorConstants1.packedValues[7u].z), multiplyAddValue57 * multiplyAddValue7));
    bool comparisonValue44 = (comparisonValue43 & 16u) == 16u;
    bool comparisonValue45 = (comparisonValue43 & 4u) == 4u;
    bool comparisonValue46 = (comparisonValue43 & 8u) == 8u;
    float scalarValue12 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue11 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue10 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue13 = dFdxCoarse(varyingTexCoord0.x);
    float comparisonValue5;
    float intermediateValue31;
    float intermediateValue32;
    float intermediateValue33;
    if ((comparisonValue43 & 1u) == 1u)
    {
        vec4 sampledTextureValue14 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
        comparisonValue5 = ((comparisonValue43 & 2u) == 2u) ? sampledTextureValue14.w : fragmentScalarConstants1.packedValues[140u];
        intermediateValue31 = sampledTextureValue14.x;
        intermediateValue32 = sampledTextureValue14.z;
        intermediateValue33 = sampledTextureValue14.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[140u];
        intermediateValue31 = fragmentScalarConstants1.packedValues[76u];
        intermediateValue32 = fragmentScalarConstants1.packedValues[136u];
        intermediateValue33 = fragmentScalarConstants1.packedValues[60u];
    }
    float productValue2;
    float productValue3;
    float productValue4;
    if (comparisonValue44 || (comparisonValue46 || comparisonValue45))
    {
        float multiplyAddValue23;
        float multiplyAddValue24;
        float multiplyAddValue25;
        bool intermediateValue36;
        if (comparisonValue45)
        {
            vec4 sampledTextureValue15 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
            multiplyAddValue23 = fma(sampledTextureValue15.z, 2.0, -1.0);
            multiplyAddValue24 = fma(sampledTextureValue15.y, 2.0, -1.0);
            multiplyAddValue25 = fma(sampledTextureValue15.x, 2.0, -1.0);
            intermediateValue36 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue37 = scalarValue9 + 28u;
        vec4 sampledTextureValue29 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue37].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue37].x), fma(fragmentVectorConstants1.packedValues[sumValue37].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue37].y)));
        uint sumValue38 = scalarValue9 + 21u;
        float bitwiseValue6 = sampledTextureValue29.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue9) + 336u) + 12u) >> 2u];
        multiplyAddValue = fma(sampledTextureValue29.x, fragmentVectorConstants1.packedValues[sumValue38].x, -multiplyAddValue7);
        multiplyAddValue1 = fma(sampledTextureValue29.y, fragmentVectorConstants1.packedValues[sumValue38].y, -multiplyAddValue5);
        multiplyAddValue2 = fma(sampledTextureValue29.z, fragmentVectorConstants1.packedValues[sumValue38].z, -multiplyAddValue3);
        multiplyAddValue8 = fma(bitwiseValue6, multiplyAddValue, multiplyAddValue7);
        multiplyAddValue6 = fma(bitwiseValue6, multiplyAddValue1, multiplyAddValue5);
        multiplyAddValue4 = fma(bitwiseValue6, multiplyAddValue2, multiplyAddValue3);
        comparisonValue = ((bitwiseValue6 > 0.5) && (intermediateValue22 != 0u)) ? 0u : intermediateValue22;
        sumValue = scalarValue9 + 1u;
        intermediateValue18 = multiplyAddValue;
        intermediateValue20 = multiplyAddValue1;
        intermediateValue21 = multiplyAddValue2;
        intermediateValue22 = comparisonValue;
        multiplyAddValue3 = multiplyAddValue4;
        multiplyAddValue5 = multiplyAddValue6;
        multiplyAddValue7 = multiplyAddValue8;
        scalarValue9 = sumValue;
        continue;
    }
    uint comparisonValue48 = (intermediateValue22 != 0u) ? scalarValue27 : (scalarValue27 & 4294967294u);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue57 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue12 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue13 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue81 = fma(sampledTextureValue12.x, fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue13.x * fragmentVectorConstants1.packedValues[16u].x) * fragmentVectorConstants1.packedValues[37u].x;
    float multiplyAddValue82 = fma(sampledTextureValue12.y, fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue13.y * fragmentVectorConstants1.packedValues[16u].y) * fragmentVectorConstants1.packedValues[37u].y;
    float multiplyAddValue83 = fma(sampledTextureValue12.z, fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue13.z * fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[37u].z;
    fragmentColor1.x = fma(multiplyAddValue81, multiplyAddValue81, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue7, multiplyAddValue55, fragmentVectorConstants1.packedValues[7u].x), multiplyAddValue55 * multiplyAddValue7));
    fragmentColor1.y = fma(multiplyAddValue82, multiplyAddValue82, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue5, multiplyAddValue56, fragmentVectorConstants1.packedValues[7u].y), multiplyAddValue56 * multiplyAddValue5));
    fragmentColor1.z = fma(multiplyAddValue83, multiplyAddValue83, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue3, multiplyAddValue57, fragmentVectorConstants1.packedValues[7u].z), multiplyAddValue57 * multiplyAddValue3));
    bool comparisonValue49 = (comparisonValue48 & 16u) == 16u;
    bool comparisonValue50 = (comparisonValue48 & 4u) == 4u;
    bool comparisonValue51 = (comparisonValue48 & 8u) == 8u;
    float scalarValue10 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue11 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue12 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue13 = dFdxCoarse(varyingTexCoord0.x);
    float comparisonValue5;
    float intermediateValue28;
    float intermediateValue29;
    float intermediateValue30;
    if ((comparisonValue48 & 1u) == 1u)
    {
        vec4 sampledTextureValue14 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
        comparisonValue5 = ((comparisonValue48 & 2u) == 2u) ? sampledTextureValue14.w : fragmentScalarConstants1.packedValues[144u];
        intermediateValue28 = sampledTextureValue14.x;
        intermediateValue29 = sampledTextureValue14.z;
        intermediateValue30 = sampledTextureValue14.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[144u];
        intermediateValue28 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue29 = fragmentScalarConstants1.packedValues[140u];
        intermediateValue30 = fragmentScalarConstants1.packedValues[60u];
    }
    float productValue6;
    float productValue7;
    float productValue8;
    if (comparisonValue49 || (comparisonValue51 || comparisonValue50))
    {
        float multiplyAddValue19;
        float multiplyAddValue20;
        float multiplyAddValue21;
        bool intermediateValue33;
        if (comparisonValue50)
        {
            vec4 sampledTextureValue15 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
            multiplyAddValue19 = fma(sampledTextureValue15.z, 2.0, -1.0);
            multiplyAddValue20 = fma(sampledTextureValue15.y, 2.0, -1.0);
            multiplyAddValue21 = fma(sampledTextureValue15.x, 2.0, -1.0);
            intermediateValue33 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            break;
        }
        uint sumValue37 = scalarValue9 + 28u;
        vec4 sampledTextureValue29 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue37].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue37].x), fma(fragmentVectorConstants1.packedValues[sumValue37].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue37].y)));
        uint sumValue38 = scalarValue9 + 21u;
        float bitwiseValue6 = sampledTextureValue29.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue9) + 336u) + 12u) >> 2u];
        multiplyAddValue2 = fma(sampledTextureValue29.x, fragmentVectorConstants1.packedValues[sumValue38].x, -multiplyAddValue9);
        multiplyAddValue3 = fma(sampledTextureValue29.y, fragmentVectorConstants1.packedValues[sumValue38].y, -multiplyAddValue7);
        multiplyAddValue4 = fma(sampledTextureValue29.z, fragmentVectorConstants1.packedValues[sumValue38].z, -multiplyAddValue5);
        multiplyAddValue10 = fma(bitwiseValue6, multiplyAddValue2, multiplyAddValue9);
        multiplyAddValue8 = fma(bitwiseValue6, multiplyAddValue3, multiplyAddValue7);
        multiplyAddValue6 = fma(bitwiseValue6, multiplyAddValue4, multiplyAddValue5);
        comparisonValue = ((bitwiseValue6 > 0.5) && (intermediateValue24 != 0u)) ? 0u : intermediateValue24;
        sumValue = scalarValue9 + 1u;
        intermediateValue20 = multiplyAddValue2;
        intermediateValue22 = multiplyAddValue3;
        intermediateValue23 = multiplyAddValue4;
        intermediateValue24 = comparisonValue;
        multiplyAddValue5 = multiplyAddValue6;
        multiplyAddValue7 = multiplyAddValue8;
        multiplyAddValue9 = multiplyAddValue10;
        scalarValue9 = sumValue;
        continue;
    }
    uint comparisonValue53 = (intermediateValue24 != 0u) ? scalarValue27 : (scalarValue27 & 4294967294u);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue57 = fma(fragmentScalarConstants1.packedValues[56u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue12 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue13 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue81 = fma(sampledTextureValue12.x, fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue13.x * fragmentVectorConstants1.packedValues[16u].x) * fragmentVectorConstants1.packedValues[37u].x;
    float multiplyAddValue82 = fma(sampledTextureValue12.y, fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue13.y * fragmentVectorConstants1.packedValues[16u].y) * fragmentVectorConstants1.packedValues[37u].y;
    float multiplyAddValue83 = fma(sampledTextureValue12.z, fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue13.z * fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[37u].z;
    fragmentColor1.x = fma(multiplyAddValue81, multiplyAddValue81, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue9, multiplyAddValue55, fragmentVectorConstants1.packedValues[7u].x), multiplyAddValue55 * multiplyAddValue9));
    fragmentColor1.y = fma(multiplyAddValue82, multiplyAddValue82, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue7, multiplyAddValue56, fragmentVectorConstants1.packedValues[7u].y), multiplyAddValue56 * multiplyAddValue7));
    fragmentColor1.z = fma(multiplyAddValue83, multiplyAddValue83, fma(fragmentScalarConstants1.packedValues[31u], fma(-multiplyAddValue5, multiplyAddValue57, fragmentVectorConstants1.packedValues[7u].z), multiplyAddValue57 * multiplyAddValue5));
    bool comparisonValue54 = (comparisonValue53 & 16u) == 16u;
    bool comparisonValue55 = (comparisonValue53 & 4u) == 4u;
    bool comparisonValue56 = (comparisonValue53 & 8u) == 8u;
    float scalarValue10 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue11 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue12 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue13 = dFdxCoarse(varyingTexCoord0.x);
    float comparisonValue5;
    float intermediateValue30;
    float intermediateValue31;
    float intermediateValue32;
    if ((comparisonValue53 & 1u) == 1u)
    {
        vec4 sampledTextureValue14 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
        comparisonValue5 = ((comparisonValue53 & 2u) == 2u) ? sampledTextureValue14.w : fragmentScalarConstants1.packedValues[144u];
        intermediateValue30 = sampledTextureValue14.x;
        intermediateValue31 = sampledTextureValue14.z;
        intermediateValue32 = sampledTextureValue14.y;
    }
    else
    {
        comparisonValue5 = fragmentScalarConstants1.packedValues[144u];
        intermediateValue30 = fragmentScalarConstants1.packedValues[80u];
        intermediateValue31 = fragmentScalarConstants1.packedValues[140u];
        intermediateValue32 = fragmentScalarConstants1.packedValues[60u];
    }
    float productValue5;
    float productValue6;
    float productValue7;
    if (comparisonValue54 || (comparisonValue56 || comparisonValue55))
    {
        float multiplyAddValue21;
        float multiplyAddValue22;
        float multiplyAddValue23;
        bool intermediateValue35;
        if (comparisonValue55)
        {
            vec4 sampledTextureValue15 = textureGrad(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue13, scalarValue10), vec2(scalarValue11, scalarValue12));
            multiplyAddValue21 = fma(sampledTextureValue15.z, 2.0, -1.0);
            multiplyAddValue22 = fma(sampledTextureValue15.y, 2.0, -1.0);
            multiplyAddValue23 = fma(sampledTextureValue15.x, 2.0, -1.0);
            intermediateValue35 = true;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            uint sumValue1 = intermediateValue5 + 26u;
            uint sumValue2 = intermediateValue5 + 19u;
            vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue1].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue1].x, (fragmentVectorConstants1.packedValues[sumValue1].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue1].y));
            float productValue28 = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[sumValue2].w;
            productValue3 = (((sampledTextureValue1.x * fragmentVectorConstants1.packedValues[sumValue2].x) - intermediateValue7) * productValue28) + intermediateValue7;
            productValue4 = (((sampledTextureValue1.y * fragmentVectorConstants1.packedValues[sumValue2].y) - intermediateValue8) * productValue28) + intermediateValue8;
            productValue5 = (((sampledTextureValue1.z * fragmentVectorConstants1.packedValues[sumValue2].z) - intermediateValue9) * productValue28) + intermediateValue9;
            comparisonValue2 = ((intermediateValue6 != 0u) && (productValue28 > 0.5)) ? 0u : intermediateValue6;
            uint sumValue3 = intermediateValue5 + 1u;
            if (int(sumValue3) < int(uint(int(fragmentVectorConstants1.packedValues[0u].x))))
            {
                intermediateValue5 = sumValue3;
                intermediateValue6 = comparisonValue2;
                intermediateValue7 = productValue3;
                intermediateValue8 = productValue4;
                intermediateValue9 = productValue5;
            }
            else
            {
                break;
            }
        }
        comparisonValue = comparisonValue2 != 0u;
        intermediateValue2 = productValue3;
        intermediateValue3 = productValue4;
        intermediateValue4 = productValue5;
    }
    else
    {
        comparisonValue = true;
        intermediateValue2 = productValue;
        intermediateValue3 = productValue12;
        intermediateValue4 = productValue27;
    }
    uint comparisonValue1 = comparisonValue ? scalarValue : (scalarValue & 4294967294u);
    float productValue29 = ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue2;
    float productValue30 = ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue3;
    float productValue31 = ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue4;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue32 = (fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[35u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue33 = (fragmentVectorConstants1.packedValues[15u].y * fragmentVectorConstants1.packedValues[35u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue34 = (fragmentVectorConstants1.packedValues[15u].z * fragmentVectorConstants1.packedValues[35u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((comparisonValue1 & 1u) == 0u)
    {
        intermediateValue10 = fragmentVectorConstants1.packedValues[18u].x;
        intermediateValue11 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[34u].x;
    }
    else
    {
        vec4 sampledTextureValue4 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue10 = sampledTextureValue4.x;
        intermediateValue11 = sampledTextureValue4.y;
        intermediateValue12 = sampledTextureValue4.z;
        intermediateValue13 = ((comparisonValue1 & 2u) != 0u) ? sampledTextureValue4.w : fragmentVectorConstants1.packedValues[34u].x;
    }
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((comparisonValue1 & 28u) == 0u)
    {
        intermediateValue14 = varyingNormal0.x;
        intermediateValue15 = varyingNormal0.y;
        intermediateValue16 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
        if ((comparisonValue1 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue1 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue1 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue5 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue6 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue35 = fract(float(int(uint(int(float(int(sampledTextureValue5.x)))))) * varyingTexCoord0.x);
                    float productValue36 = fract(float(int(uint(int(float(int(sampledTextureValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue3 = (((productValue35 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.y * 2.0) + (-1.0))) - (((sampledTextureValue6.w * 2.0) + (-1.0)) * ((productValue35 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue4 = (((productValue36 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.z * 2.0) + (-1.0))) - (((productValue36 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue6.x * 2.0) + (-1.0)));
                    float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                    float comparisonValue9 = ((abs(comparisonValue4) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue4;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue6, comparisonValue9, 0.25), vec3(comparisonValue6, comparisonValue9, 0.25)));
                    branchMergedValue3 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue9 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue7 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue37 = float(int(uint(int(float(int(sampledTextureValue7.x)))))) * varyingTexCoord0.x;
                float productValue38 = float(int(uint(int(float(int(sampledTextureValue7.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue37);
                float scalarValue2 = fract(productValue38);
                float comparisonValue7;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue7 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue7 = varyingTexCoord0.x;
                }
                float comparisonValue8;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue8 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue7, comparisonValue8));
                float scalarValue3 = sampledTextureValue8.x;
                float scalarValue4 = sampledTextureValue8.y;
                float scalarValue5 = sampledTextureValue8.z;
                float scalarValue6 = sampledTextureValue8.w;
                float sumValue4 = fract(productValue37 + 0.5);
                float sumValue5 = fract(productValue38 + 0.5);
                bool conditionValue = sumValue5 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue39 = intermediateValue[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue40 = intermediateValue[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue6 = productValue39 - productValue40;
                bool conditionValue1 = sumValue4 > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue41 = intermediateValue[uint(int(spvNClamp((sumValue5 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue5 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue6, productValue41, 0.25), vec3(sumValue6, productValue41, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue6;
                branchMergedValue1 = inverseLengthValue1 * productValue41;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue21 = branchMergedValue;
            intermediateValue22 = branchMergedValue1;
            intermediateValue23 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue1 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue1 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue5 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue6 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue35 = fract(float(int(uint(int(float(int(sampledTextureValue5.x)))))) * varyingTexCoord0.x);
                    float productValue36 = fract(float(int(uint(int(float(int(sampledTextureValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue3 = (((productValue35 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.y * 2.0) + (-1.0))) - (((sampledTextureValue6.w * 2.0) + (-1.0)) * ((productValue35 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue4 = (((productValue36 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.z * 2.0) + (-1.0))) - (((productValue36 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue6.x * 2.0) + (-1.0)));
                    float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                    float comparisonValue9 = ((abs(comparisonValue4) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue4;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue6, comparisonValue9, 0.25), vec3(comparisonValue6, comparisonValue9, 0.25)));
                    branchMergedValue3 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue9 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue7 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue37 = float(int(uint(int(float(int(sampledTextureValue7.x)))))) * varyingTexCoord0.x;
                float productValue38 = float(int(uint(int(float(int(sampledTextureValue7.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue37);
                float scalarValue2 = fract(productValue38);
                float comparisonValue7;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue7 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue7 = varyingTexCoord0.x;
                }
                float comparisonValue8;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue8 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue7, comparisonValue8));
                float scalarValue3 = sampledTextureValue8.x;
                float scalarValue4 = sampledTextureValue8.y;
                float scalarValue5 = sampledTextureValue8.z;
                float scalarValue6 = sampledTextureValue8.w;
                float sumValue4 = fract(productValue37 + 0.5);
                float sumValue5 = fract(productValue38 + 0.5);
                bool conditionValue = sumValue5 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue39 = intermediateValue[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue40 = intermediateValue[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue6 = productValue39 - productValue40;
                bool conditionValue1 = sumValue4 > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue41 = intermediateValue[uint(int(spvNClamp((sumValue5 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue5 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue6, productValue41, 0.25), vec3(sumValue6, productValue41, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue6;
                branchMergedValue1 = inverseLengthValue1 * productValue41;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue24 = branchMergedValue;
            intermediateValue25 = branchMergedValue1;
            intermediateValue26 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            uint sumValue24 = intermediateValue5 + 27u;
            uint sumValue25 = intermediateValue5 + 20u;
            vec4 sampledTextureValue25 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue24].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue24].x, (fragmentVectorConstants1.packedValues[sumValue24].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue24].y));
            float productValue91 = sampledTextureValue25.w * fragmentVectorConstants1.packedValues[sumValue25].w;
            productValue7 = (((sampledTextureValue25.x * fragmentVectorConstants1.packedValues[sumValue25].x) - intermediateValue7) * productValue91) + intermediateValue7;
            productValue8 = (((sampledTextureValue25.y * fragmentVectorConstants1.packedValues[sumValue25].y) - intermediateValue8) * productValue91) + intermediateValue8;
            productValue9 = (((sampledTextureValue25.z * fragmentVectorConstants1.packedValues[sumValue25].z) - intermediateValue9) * productValue91) + intermediateValue9;
            comparisonValue2 = ((intermediateValue6 != 0u) && (productValue91 > 0.5)) ? 0u : intermediateValue6;
            uint sumValue3 = intermediateValue5 + 1u;
            if (int(sumValue3) < int(uint(int(fragmentVectorConstants1.packedValues[0u].x))))
            {
                intermediateValue5 = sumValue3;
                intermediateValue6 = comparisonValue2;
                intermediateValue7 = productValue7;
                intermediateValue8 = productValue8;
                intermediateValue9 = productValue9;
            }
            else
            {
                break;
            }
        }
        comparisonValue = comparisonValue2 != 0u;
        intermediateValue2 = productValue7;
        intermediateValue3 = productValue8;
        intermediateValue4 = productValue9;
    }
    else
    {
        comparisonValue = true;
        intermediateValue2 = productValue88;
        intermediateValue3 = productValue89;
        intermediateValue4 = productValue90;
    }
    uint comparisonValue36 = comparisonValue ? scalarValue26 : (scalarValue26 & 4294967294u);
    float productValue92 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.x + (-1.0))) + 1.0) * intermediateValue2;
    float productValue93 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.y + (-1.0))) + 1.0) * intermediateValue3;
    float productValue94 = ((fragmentVectorConstants1.packedValues[14u].x * (varyingColor0.z + (-1.0))) + 1.0) * intermediateValue4;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue95 = (fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[36u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue96 = (fragmentVectorConstants1.packedValues[16u].y * fragmentVectorConstants1.packedValues[36u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue97 = (fragmentVectorConstants1.packedValues[16u].z * fragmentVectorConstants1.packedValues[36u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((comparisonValue36 & 1u) == 0u)
    {
        intermediateValue10 = fragmentVectorConstants1.packedValues[19u].x;
        intermediateValue11 = fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[34u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[35u].x;
    }
    else
    {
        vec4 sampledTextureValue4 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue10 = sampledTextureValue4.x;
        intermediateValue11 = sampledTextureValue4.y;
        intermediateValue12 = sampledTextureValue4.z;
        intermediateValue13 = ((comparisonValue36 & 2u) != 0u) ? sampledTextureValue4.w : fragmentVectorConstants1.packedValues[35u].x;
    }
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((comparisonValue36 & 28u) == 0u)
    {
        intermediateValue14 = varyingNormal0.x;
        intermediateValue15 = varyingNormal0.y;
        intermediateValue16 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
        if ((comparisonValue36 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue36 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue36 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue5 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue6 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue35 = fract(float(int(uint(int(float(int(sampledTextureValue5.x)))))) * varyingTexCoord0.x);
                    float productValue36 = fract(float(int(uint(int(float(int(sampledTextureValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue3 = (((productValue35 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.y * 2.0) + (-1.0))) - (((sampledTextureValue6.w * 2.0) + (-1.0)) * ((productValue35 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue4 = (((productValue36 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.z * 2.0) + (-1.0))) - (((productValue36 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue6.x * 2.0) + (-1.0)));
                    float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                    float comparisonValue9 = ((abs(comparisonValue4) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue4;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue6, comparisonValue9, 0.25), vec3(comparisonValue6, comparisonValue9, 0.25)));
                    branchMergedValue3 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue9 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue7 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue37 = float(int(uint(int(float(int(sampledTextureValue7.x)))))) * varyingTexCoord0.x;
                float productValue38 = float(int(uint(int(float(int(sampledTextureValue7.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue37);
                float scalarValue2 = fract(productValue38);
                float comparisonValue7;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue7 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue7 = varyingTexCoord0.x;
                }
                float comparisonValue8;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue8 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue7, comparisonValue8));
                float scalarValue3 = sampledTextureValue8.x;
                float scalarValue4 = sampledTextureValue8.y;
                float scalarValue5 = sampledTextureValue8.z;
                float scalarValue6 = sampledTextureValue8.w;
                float sumValue4 = fract(productValue37 + 0.5);
                float sumValue5 = fract(productValue38 + 0.5);
                bool conditionValue = sumValue5 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue39 = intermediateValue[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue40 = intermediateValue[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue6 = productValue39 - productValue40;
                bool conditionValue1 = sumValue4 > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue41 = intermediateValue[uint(int(spvNClamp((sumValue5 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue5 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue6, productValue41, 0.25), vec3(sumValue6, productValue41, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue6;
                branchMergedValue1 = inverseLengthValue1 * productValue41;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue21 = branchMergedValue;
            intermediateValue22 = branchMergedValue1;
            intermediateValue23 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue36 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue36 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue5 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue6 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue35 = fract(float(int(uint(int(float(int(sampledTextureValue5.x)))))) * varyingTexCoord0.x);
                    float productValue36 = fract(float(int(uint(int(float(int(sampledTextureValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue3 = (((productValue35 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.y * 2.0) + (-1.0))) - (((sampledTextureValue6.w * 2.0) + (-1.0)) * ((productValue35 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue4 = (((productValue36 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.z * 2.0) + (-1.0))) - (((productValue36 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue6.x * 2.0) + (-1.0)));
                    float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                    float comparisonValue9 = ((abs(comparisonValue4) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue4;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue6, comparisonValue9, 0.25), vec3(comparisonValue6, comparisonValue9, 0.25)));
                    branchMergedValue3 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue9 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue7 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue37 = float(int(uint(int(float(int(sampledTextureValue7.x)))))) * varyingTexCoord0.x;
                float productValue38 = float(int(uint(int(float(int(sampledTextureValue7.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue37);
                float scalarValue2 = fract(productValue38);
                float comparisonValue7;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue7 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue7 = varyingTexCoord0.x;
                }
                float comparisonValue8;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue8 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue7, comparisonValue8));
                float scalarValue3 = sampledTextureValue8.x;
                float scalarValue4 = sampledTextureValue8.y;
                float scalarValue5 = sampledTextureValue8.z;
                float scalarValue6 = sampledTextureValue8.w;
                float sumValue4 = fract(productValue37 + 0.5);
                float sumValue5 = fract(productValue38 + 0.5);
                bool conditionValue = sumValue5 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue39 = intermediateValue[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue40 = intermediateValue[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue6 = productValue39 - productValue40;
                bool conditionValue1 = sumValue4 > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue41 = intermediateValue[uint(int(spvNClamp((sumValue5 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue5 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue6, productValue41, 0.25), vec3(sumValue6, productValue41, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue6;
                branchMergedValue1 = inverseLengthValue1 * productValue41;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue25 = branchMergedValue;
            intermediateValue26 = branchMergedValue1;
            intermediateValue27 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue36 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue36 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue5 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue6 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue35 = fract(float(int(uint(int(float(int(sampledTextureValue5.x)))))) * varyingTexCoord0.x);
                    float productValue36 = fract(float(int(uint(int(float(int(sampledTextureValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue3 = (((productValue35 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.y * 2.0) + (-1.0))) - (((sampledTextureValue6.w * 2.0) + (-1.0)) * ((productValue35 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue4 = (((productValue36 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.z * 2.0) + (-1.0))) - (((productValue36 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue6.x * 2.0) + (-1.0)));
                    float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                    float comparisonValue9 = ((abs(comparisonValue4) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue4;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue6, comparisonValue9, 0.25), vec3(comparisonValue6, comparisonValue9, 0.25)));
                    branchMergedValue3 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue9 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue7 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue37 = float(int(uint(int(float(int(sampledTextureValue7.x)))))) * varyingTexCoord0.x;
                float productValue38 = float(int(uint(int(float(int(sampledTextureValue7.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue37);
                float scalarValue2 = fract(productValue38);
                float comparisonValue7;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue7 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue7 = varyingTexCoord0.x;
                }
                float comparisonValue8;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue8 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue7, comparisonValue8));
                float scalarValue3 = sampledTextureValue8.x;
                float scalarValue4 = sampledTextureValue8.y;
                float scalarValue5 = sampledTextureValue8.z;
                float scalarValue6 = sampledTextureValue8.w;
                float sumValue4 = fract(productValue37 + 0.5);
                float sumValue5 = fract(productValue38 + 0.5);
                bool conditionValue = sumValue5 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue39 = intermediateValue[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue40 = intermediateValue[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue6 = productValue39 - productValue40;
                bool conditionValue1 = sumValue4 > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue41 = intermediateValue[uint(int(spvNClamp((sumValue5 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue5 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue6, productValue41, 0.25), vec3(sumValue6, productValue41, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue6;
                branchMergedValue1 = inverseLengthValue1 * productValue41;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue22 = branchMergedValue;
            intermediateValue23 = branchMergedValue1;
            intermediateValue24 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue36 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue36 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    uvec2 sampledTextureValue5 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue6 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue35 = fract(float(int(uint(int(float(int(sampledTextureValue5.x)))))) * varyingTexCoord0.x);
                    float productValue36 = fract(float(int(uint(int(float(int(sampledTextureValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue3 = (((productValue35 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.y * 2.0) + (-1.0))) - (((sampledTextureValue6.w * 2.0) + (-1.0)) * ((productValue35 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue4 = (((productValue36 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue6.z * 2.0) + (-1.0))) - (((productValue36 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue6.x * 2.0) + (-1.0)));
                    float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                    float comparisonValue9 = ((abs(comparisonValue4) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue4;
                    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue6, comparisonValue9, 0.25), vec3(comparisonValue6, comparisonValue9, 0.25)));
                    branchMergedValue3 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue9 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
                uvec2 sampledTextureValue7 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue37 = float(int(uint(int(float(int(sampledTextureValue7.x)))))) * varyingTexCoord0.x;
                float productValue38 = float(int(uint(int(float(int(sampledTextureValue7.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = fract(productValue37);
                float scalarValue2 = fract(productValue38);
                float comparisonValue7;
                if (abs(scalarValue1 + (-0.5)) < 0.0625)
                {
                    comparisonValue7 = ((scalarValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue7 = varyingTexCoord0.x;
                }
                float comparisonValue8;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue8 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue8 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue7, comparisonValue8));
                float scalarValue3 = sampledTextureValue8.x;
                float scalarValue4 = sampledTextureValue8.y;
                float scalarValue5 = sampledTextureValue8.z;
                float scalarValue6 = sampledTextureValue8.w;
                float sumValue4 = fract(productValue37 + 0.5);
                float sumValue5 = fract(productValue38 + 0.5);
                bool conditionValue = sumValue5 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float productValue39 = intermediateValue[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue40 = intermediateValue[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue6 = productValue39 - productValue40;
                bool conditionValue1 = sumValue4 > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float productValue41 = intermediateValue[uint(int(spvNClamp((sumValue5 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue5 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue6, productValue41, 0.25), vec3(sumValue6, productValue41, 0.25)));
                branchMergedValue = inverseLengthValue1 * sumValue6;
                branchMergedValue1 = inverseLengthValue1 * productValue41;
                branchMergedValue2 = inverseLengthValue1 * 0.25;
            }
            intermediateValue24 = branchMergedValue;
            intermediateValue25 = branchMergedValue1;
            intermediateValue26 = branchMergedValue2;
#endif
        }
        else
        {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue33;
            if (comparisonValue13)
            {
                bool sampledTextureValue16 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue17 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue14 = sampledTextureValue17.x;
                float comparisonValue14 = rdEvaluateFloatExpression(sampledTextureValue16 ? scalarValue14 : 0u);
                float comparisonValue15 = rdEvaluateFloatExpression(sampledTextureValue16 ? sampledTextureValue17.y : 0u);
                float productValue52 = fract(comparisonValue14 * varyingTexCoord0.x);
                float productValue53 = fract(comparisonValue15 * varyingTexCoord0.y);
                vec4 sampledTextureValue18 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue53 - 0.5) < 0.0625) ? (((productValue53 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue15 = sampledTextureValue18.x;
                float scalarValue16 = sampledTextureValue18.y;
                float scalarValue17 = sampledTextureValue18.z;
                float scalarValue18 = sampledTextureValue18.w;
                float multiplyAddValue34 = fract(fma(varyingTexCoord0.x, comparisonValue14, 0.5));
                float multiplyAddValue35 = fract(fma(varyingTexCoord0.y, comparisonValue15, 0.5));
                bool conditionValue3 = multiplyAddValue35 > 0.5;
                bool conditionValue4 = multiplyAddValue34 > 0.5;
                float comparisonValue18 = conditionValue3 ? scalarValue15 : scalarValue18;
                float comparisonValue19 = conditionValue3 ? scalarValue16 : scalarValue17;
                float comparisonValue20 = conditionValue4 ? scalarValue17 : scalarValue18;
                float comparisonValue21 = conditionValue4 ? scalarValue16 : scalarValue15;
                float sumValue12 = multiplyAddValue34 - 0.083333335816860198974609375;
                float sumValue13 = multiplyAddValue34 + 0.083333335816860198974609375;
                float sumValue14 = multiplyAddValue35 - 0.083333335816860198974609375;
                float sumValue15 = multiplyAddValue35 + 0.083333335816860198974609375;
                uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                uint sumValue18 = uint(int(spvNClamp(sumValue14 + sumValue14, 0.0, 1.0)));
                uint sumValue19 = uint(int(spvNClamp(sumValue15 + sumValue15, 0.0, 1.0)));
                float comparisonValue22 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                float comparisonValue23 = ((sumValue18 == 1u) ? comparisonValue21 : ((sumValue18 == 0u) ? comparisonValue20 : 0.0)) - ((sumValue19 == 1u) ? comparisonValue21 : ((sumValue19 == 0u) ? comparisonValue20 : 0.0));
                vec3 vectorValue = vec3(comparisonValue22, comparisonValue23, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue33 = true;
                productValue17 = inverseLengthValue7 * comparisonValue22;
                productValue16 = inverseLengthValue7 * comparisonValue23;
                productValue15 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue20;
                if (comparisonValue11)
                {
                    bool sampledTextureValue19 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue20 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue19 = sampledTextureValue20.x;
                    vec4 sampledTextureValue21 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue24 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? scalarValue19 : 0u) * varyingTexCoord0.x);
                    float comparisonValue25 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? sampledTextureValue20.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue36 = (comparisonValue24 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue37 = (comparisonValue25 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue38 = (comparisonValue24 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.y, 2.0, -1.0) + multiplyAddValue36) : multiplyAddValue36;
                    float multiplyAddValue39 = (comparisonValue25 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.z, 2.0, -1.0) + multiplyAddValue37) : multiplyAddValue37;
                    bool comparisonValue26 = abs(multiplyAddValue38) >= 0.004999999888241291046142578125;
                    bool comparisonValue27 = abs(multiplyAddValue39) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue28 = vec3(comparisonValue26 ? multiplyAddValue38 : 0.0, comparisonValue27 ? multiplyAddValue39 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue28, comparisonValue28));
                    comparisonValue16 = comparisonValue26 ? (inverseLengthValue8 * multiplyAddValue38) : 0.0;
                    comparisonValue17 = comparisonValue27 ? (inverseLengthValue8 * multiplyAddValue39) : 0.0;
                    productValue20 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue17;
                    comparisonValue17 = intermediateValue19;
                    productValue20 = intermediateValue20;
                }
                intermediateValue33 = comparisonValue11;
                productValue17 = comparisonValue16;
                productValue16 = comparisonValue17;
                productValue15 = productValue20;
            }
            multiplyAddValue16 = productValue15;
            multiplyAddValue17 = productValue16;
            multiplyAddValue18 = productValue17;
            intermediateValue32 = intermediateValue33;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue36;
            if (comparisonValue34)
            {
                bool sampledTextureValue16 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue17 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue14 = sampledTextureValue17.x;
                float comparisonValue14 = rdEvaluateFloatExpression(sampledTextureValue16 ? scalarValue14 : 0u);
                float comparisonValue15 = rdEvaluateFloatExpression(sampledTextureValue16 ? sampledTextureValue17.y : 0u);
                float productValue52 = fract(comparisonValue14 * varyingTexCoord0.x);
                float productValue53 = fract(comparisonValue15 * varyingTexCoord0.y);
                vec4 sampledTextureValue18 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue53 - 0.5) < 0.0625) ? (((productValue53 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue15 = sampledTextureValue18.x;
                float scalarValue16 = sampledTextureValue18.y;
                float scalarValue17 = sampledTextureValue18.z;
                float scalarValue18 = sampledTextureValue18.w;
                float multiplyAddValue34 = fract(fma(varyingTexCoord0.x, comparisonValue14, 0.5));
                float multiplyAddValue35 = fract(fma(varyingTexCoord0.y, comparisonValue15, 0.5));
                bool conditionValue3 = multiplyAddValue35 > 0.5;
                bool conditionValue4 = multiplyAddValue34 > 0.5;
                float comparisonValue18 = conditionValue3 ? scalarValue15 : scalarValue18;
                float comparisonValue19 = conditionValue3 ? scalarValue16 : scalarValue17;
                float comparisonValue20 = conditionValue4 ? scalarValue17 : scalarValue18;
                float comparisonValue21 = conditionValue4 ? scalarValue16 : scalarValue15;
                float sumValue12 = multiplyAddValue34 - 0.083333335816860198974609375;
                float sumValue13 = multiplyAddValue34 + 0.083333335816860198974609375;
                float sumValue14 = multiplyAddValue35 - 0.083333335816860198974609375;
                float sumValue15 = multiplyAddValue35 + 0.083333335816860198974609375;
                uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                uint sumValue18 = uint(int(spvNClamp(sumValue14 + sumValue14, 0.0, 1.0)));
                uint sumValue19 = uint(int(spvNClamp(sumValue15 + sumValue15, 0.0, 1.0)));
                float comparisonValue22 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                float comparisonValue23 = ((sumValue18 == 1u) ? comparisonValue21 : ((sumValue18 == 0u) ? comparisonValue20 : 0.0)) - ((sumValue19 == 1u) ? comparisonValue21 : ((sumValue19 == 0u) ? comparisonValue20 : 0.0));
                vec3 vectorValue = vec3(comparisonValue22, comparisonValue23, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue36 = true;
                productValue15 = inverseLengthValue7 * comparisonValue22;
                productValue14 = inverseLengthValue7 * comparisonValue23;
                productValue13 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue18;
                if (comparisonValue32)
                {
                    bool sampledTextureValue19 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue20 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue19 = sampledTextureValue20.x;
                    vec4 sampledTextureValue21 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue24 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? scalarValue19 : 0u) * varyingTexCoord0.x);
                    float comparisonValue25 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? sampledTextureValue20.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue36 = (comparisonValue24 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue37 = (comparisonValue25 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue38 = (comparisonValue24 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.y, 2.0, -1.0) + multiplyAddValue36) : multiplyAddValue36;
                    float multiplyAddValue39 = (comparisonValue25 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.z, 2.0, -1.0) + multiplyAddValue37) : multiplyAddValue37;
                    bool comparisonValue26 = abs(multiplyAddValue38) >= 0.004999999888241291046142578125;
                    bool comparisonValue27 = abs(multiplyAddValue39) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue28 = vec3(comparisonValue26 ? multiplyAddValue38 : 0.0, comparisonValue27 ? multiplyAddValue39 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue28, comparisonValue28));
                    comparisonValue16 = comparisonValue26 ? (inverseLengthValue8 * multiplyAddValue38) : 0.0;
                    comparisonValue17 = comparisonValue27 ? (inverseLengthValue8 * multiplyAddValue39) : 0.0;
                    productValue18 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue20;
                    comparisonValue17 = intermediateValue22;
                    productValue18 = intermediateValue23;
                }
                intermediateValue36 = comparisonValue32;
                productValue15 = comparisonValue16;
                productValue14 = comparisonValue17;
                productValue13 = productValue18;
            }
            multiplyAddValue19 = productValue13;
            multiplyAddValue20 = productValue14;
            multiplyAddValue21 = productValue15;
            intermediateValue35 = intermediateValue36;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue33;
            if (comparisonValue40)
            {
                bool sampledTextureValue16 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue17 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue14 = sampledTextureValue17.x;
                float comparisonValue14 = rdEvaluateFloatExpression(sampledTextureValue16 ? scalarValue14 : 0u);
                float comparisonValue15 = rdEvaluateFloatExpression(sampledTextureValue16 ? sampledTextureValue17.y : 0u);
                float productValue52 = fract(comparisonValue14 * varyingTexCoord0.x);
                float productValue53 = fract(comparisonValue15 * varyingTexCoord0.y);
                vec4 sampledTextureValue18 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue53 - 0.5) < 0.0625) ? (((productValue53 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue15 = sampledTextureValue18.x;
                float scalarValue16 = sampledTextureValue18.y;
                float scalarValue17 = sampledTextureValue18.z;
                float scalarValue18 = sampledTextureValue18.w;
                float multiplyAddValue34 = fract(fma(varyingTexCoord0.x, comparisonValue14, 0.5));
                float multiplyAddValue35 = fract(fma(varyingTexCoord0.y, comparisonValue15, 0.5));
                bool conditionValue3 = multiplyAddValue35 > 0.5;
                bool conditionValue4 = multiplyAddValue34 > 0.5;
                float comparisonValue18 = conditionValue3 ? scalarValue15 : scalarValue18;
                float comparisonValue19 = conditionValue3 ? scalarValue16 : scalarValue17;
                float comparisonValue20 = conditionValue4 ? scalarValue17 : scalarValue18;
                float comparisonValue21 = conditionValue4 ? scalarValue16 : scalarValue15;
                float sumValue12 = multiplyAddValue34 - 0.083333335816860198974609375;
                float sumValue13 = multiplyAddValue34 + 0.083333335816860198974609375;
                float sumValue14 = multiplyAddValue35 - 0.083333335816860198974609375;
                float sumValue15 = multiplyAddValue35 + 0.083333335816860198974609375;
                uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                uint sumValue18 = uint(int(spvNClamp(sumValue14 + sumValue14, 0.0, 1.0)));
                uint sumValue19 = uint(int(spvNClamp(sumValue15 + sumValue15, 0.0, 1.0)));
                float comparisonValue22 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                float comparisonValue23 = ((sumValue18 == 1u) ? comparisonValue21 : ((sumValue18 == 0u) ? comparisonValue20 : 0.0)) - ((sumValue19 == 1u) ? comparisonValue21 : ((sumValue19 == 0u) ? comparisonValue20 : 0.0));
                vec3 vectorValue = vec3(comparisonValue22, comparisonValue23, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue33 = true;
                productValue18 = inverseLengthValue7 * comparisonValue22;
                productValue17 = inverseLengthValue7 * comparisonValue23;
                productValue16 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue21;
                if (comparisonValue38)
                {
                    bool sampledTextureValue19 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue20 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue19 = sampledTextureValue20.x;
                    vec4 sampledTextureValue21 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue24 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? scalarValue19 : 0u) * varyingTexCoord0.x);
                    float comparisonValue25 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? sampledTextureValue20.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue36 = (comparisonValue24 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue37 = (comparisonValue25 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue38 = (comparisonValue24 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.y, 2.0, -1.0) + multiplyAddValue36) : multiplyAddValue36;
                    float multiplyAddValue39 = (comparisonValue25 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.z, 2.0, -1.0) + multiplyAddValue37) : multiplyAddValue37;
                    bool comparisonValue26 = abs(multiplyAddValue38) >= 0.004999999888241291046142578125;
                    bool comparisonValue27 = abs(multiplyAddValue39) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue28 = vec3(comparisonValue26 ? multiplyAddValue38 : 0.0, comparisonValue27 ? multiplyAddValue39 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue28, comparisonValue28));
                    comparisonValue16 = comparisonValue26 ? (inverseLengthValue8 * multiplyAddValue38) : 0.0;
                    comparisonValue17 = comparisonValue27 ? (inverseLengthValue8 * multiplyAddValue39) : 0.0;
                    productValue21 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue17;
                    comparisonValue17 = intermediateValue19;
                    productValue21 = intermediateValue20;
                }
                intermediateValue33 = comparisonValue38;
                productValue18 = comparisonValue16;
                productValue17 = comparisonValue17;
                productValue16 = productValue21;
            }
            multiplyAddValue19 = productValue16;
            multiplyAddValue20 = productValue17;
            multiplyAddValue21 = productValue18;
            intermediateValue32 = intermediateValue33;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue37;
            if (comparisonValue46)
            {
                bool sampledTextureValue16 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue17 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue14 = sampledTextureValue17.x;
                float comparisonValue14 = rdEvaluateFloatExpression(sampledTextureValue16 ? scalarValue14 : 0u);
                float comparisonValue15 = rdEvaluateFloatExpression(sampledTextureValue16 ? sampledTextureValue17.y : 0u);
                float productValue52 = fract(comparisonValue14 * varyingTexCoord0.x);
                float productValue53 = fract(comparisonValue15 * varyingTexCoord0.y);
                vec4 sampledTextureValue18 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue53 - 0.5) < 0.0625) ? (((productValue53 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue15 = sampledTextureValue18.x;
                float scalarValue16 = sampledTextureValue18.y;
                float scalarValue17 = sampledTextureValue18.z;
                float scalarValue18 = sampledTextureValue18.w;
                float multiplyAddValue34 = fract(fma(varyingTexCoord0.x, comparisonValue14, 0.5));
                float multiplyAddValue35 = fract(fma(varyingTexCoord0.y, comparisonValue15, 0.5));
                bool conditionValue3 = multiplyAddValue35 > 0.5;
                bool conditionValue4 = multiplyAddValue34 > 0.5;
                float comparisonValue18 = conditionValue3 ? scalarValue15 : scalarValue18;
                float comparisonValue19 = conditionValue3 ? scalarValue16 : scalarValue17;
                float comparisonValue20 = conditionValue4 ? scalarValue17 : scalarValue18;
                float comparisonValue21 = conditionValue4 ? scalarValue16 : scalarValue15;
                float sumValue12 = multiplyAddValue34 - 0.083333335816860198974609375;
                float sumValue13 = multiplyAddValue34 + 0.083333335816860198974609375;
                float sumValue14 = multiplyAddValue35 - 0.083333335816860198974609375;
                float sumValue15 = multiplyAddValue35 + 0.083333335816860198974609375;
                uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                uint sumValue18 = uint(int(spvNClamp(sumValue14 + sumValue14, 0.0, 1.0)));
                uint sumValue19 = uint(int(spvNClamp(sumValue15 + sumValue15, 0.0, 1.0)));
                float comparisonValue22 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                float comparisonValue23 = ((sumValue18 == 1u) ? comparisonValue21 : ((sumValue18 == 0u) ? comparisonValue20 : 0.0)) - ((sumValue19 == 1u) ? comparisonValue21 : ((sumValue19 == 0u) ? comparisonValue20 : 0.0));
                vec3 vectorValue = vec3(comparisonValue22, comparisonValue23, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue37 = true;
                productValue15 = inverseLengthValue7 * comparisonValue22;
                productValue14 = inverseLengthValue7 * comparisonValue23;
                productValue13 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue18;
                if (comparisonValue44)
                {
                    bool sampledTextureValue19 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue20 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue19 = sampledTextureValue20.x;
                    vec4 sampledTextureValue21 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue24 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? scalarValue19 : 0u) * varyingTexCoord0.x);
                    float comparisonValue25 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? sampledTextureValue20.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue36 = (comparisonValue24 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue37 = (comparisonValue25 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue38 = (comparisonValue24 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.y, 2.0, -1.0) + multiplyAddValue36) : multiplyAddValue36;
                    float multiplyAddValue39 = (comparisonValue25 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.z, 2.0, -1.0) + multiplyAddValue37) : multiplyAddValue37;
                    bool comparisonValue26 = abs(multiplyAddValue38) >= 0.004999999888241291046142578125;
                    bool comparisonValue27 = abs(multiplyAddValue39) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue28 = vec3(comparisonValue26 ? multiplyAddValue38 : 0.0, comparisonValue27 ? multiplyAddValue39 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue28, comparisonValue28));
                    comparisonValue16 = comparisonValue26 ? (inverseLengthValue8 * multiplyAddValue38) : 0.0;
                    comparisonValue17 = comparisonValue27 ? (inverseLengthValue8 * multiplyAddValue39) : 0.0;
                    productValue18 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue21;
                    comparisonValue17 = intermediateValue23;
                    productValue18 = intermediateValue24;
                }
                intermediateValue37 = comparisonValue44;
                productValue15 = comparisonValue16;
                productValue14 = comparisonValue17;
                productValue13 = productValue18;
            }
            multiplyAddValue23 = productValue13;
            multiplyAddValue24 = productValue14;
            multiplyAddValue25 = productValue15;
            intermediateValue36 = intermediateValue37;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue17;
            float productValue18;
            float productValue19;
            bool intermediateValue34;
            if (comparisonValue51)
            {
                bool sampledTextureValue16 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue17 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue14 = sampledTextureValue17.x;
                float comparisonValue14 = rdEvaluateFloatExpression(sampledTextureValue16 ? scalarValue14 : 0u);
                float comparisonValue15 = rdEvaluateFloatExpression(sampledTextureValue16 ? sampledTextureValue17.y : 0u);
                float productValue52 = fract(comparisonValue14 * varyingTexCoord0.x);
                float productValue53 = fract(comparisonValue15 * varyingTexCoord0.y);
                vec4 sampledTextureValue18 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue53 - 0.5) < 0.0625) ? (((productValue53 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue15 = sampledTextureValue18.x;
                float scalarValue16 = sampledTextureValue18.y;
                float scalarValue17 = sampledTextureValue18.z;
                float scalarValue18 = sampledTextureValue18.w;
                float multiplyAddValue34 = fract(fma(varyingTexCoord0.x, comparisonValue14, 0.5));
                float multiplyAddValue35 = fract(fma(varyingTexCoord0.y, comparisonValue15, 0.5));
                bool conditionValue3 = multiplyAddValue35 > 0.5;
                bool conditionValue4 = multiplyAddValue34 > 0.5;
                float comparisonValue18 = conditionValue3 ? scalarValue15 : scalarValue18;
                float comparisonValue19 = conditionValue3 ? scalarValue16 : scalarValue17;
                float comparisonValue20 = conditionValue4 ? scalarValue17 : scalarValue18;
                float comparisonValue21 = conditionValue4 ? scalarValue16 : scalarValue15;
                float sumValue12 = multiplyAddValue34 - 0.083333335816860198974609375;
                float sumValue13 = multiplyAddValue34 + 0.083333335816860198974609375;
                float sumValue14 = multiplyAddValue35 - 0.083333335816860198974609375;
                float sumValue15 = multiplyAddValue35 + 0.083333335816860198974609375;
                uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                uint sumValue18 = uint(int(spvNClamp(sumValue14 + sumValue14, 0.0, 1.0)));
                uint sumValue19 = uint(int(spvNClamp(sumValue15 + sumValue15, 0.0, 1.0)));
                float comparisonValue22 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                float comparisonValue23 = ((sumValue18 == 1u) ? comparisonValue21 : ((sumValue18 == 0u) ? comparisonValue20 : 0.0)) - ((sumValue19 == 1u) ? comparisonValue21 : ((sumValue19 == 0u) ? comparisonValue20 : 0.0));
                vec3 vectorValue = vec3(comparisonValue22, comparisonValue23, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue34 = true;
                productValue19 = inverseLengthValue7 * comparisonValue22;
                productValue18 = inverseLengthValue7 * comparisonValue23;
                productValue17 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue22;
                if (comparisonValue49)
                {
                    bool sampledTextureValue19 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue20 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue19 = sampledTextureValue20.x;
                    vec4 sampledTextureValue21 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue24 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? scalarValue19 : 0u) * varyingTexCoord0.x);
                    float comparisonValue25 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? sampledTextureValue20.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue36 = (comparisonValue24 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue37 = (comparisonValue25 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue38 = (comparisonValue24 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.y, 2.0, -1.0) + multiplyAddValue36) : multiplyAddValue36;
                    float multiplyAddValue39 = (comparisonValue25 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.z, 2.0, -1.0) + multiplyAddValue37) : multiplyAddValue37;
                    bool comparisonValue26 = abs(multiplyAddValue38) >= 0.004999999888241291046142578125;
                    bool comparisonValue27 = abs(multiplyAddValue39) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue28 = vec3(comparisonValue26 ? multiplyAddValue38 : 0.0, comparisonValue27 ? multiplyAddValue39 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue28, comparisonValue28));
                    comparisonValue16 = comparisonValue26 ? (inverseLengthValue8 * multiplyAddValue38) : 0.0;
                    comparisonValue17 = comparisonValue27 ? (inverseLengthValue8 * multiplyAddValue39) : 0.0;
                    productValue22 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue18;
                    comparisonValue17 = intermediateValue20;
                    productValue22 = intermediateValue21;
                }
                intermediateValue34 = comparisonValue49;
                productValue19 = comparisonValue16;
                productValue18 = comparisonValue17;
                productValue17 = productValue22;
            }
            multiplyAddValue19 = productValue17;
            multiplyAddValue20 = productValue18;
            multiplyAddValue21 = productValue19;
            intermediateValue33 = intermediateValue34;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue36;
            if (comparisonValue56)
            {
                bool sampledTextureValue16 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue17 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue14 = sampledTextureValue17.x;
                float comparisonValue14 = rdEvaluateFloatExpression(sampledTextureValue16 ? scalarValue14 : 0u);
                float comparisonValue15 = rdEvaluateFloatExpression(sampledTextureValue16 ? sampledTextureValue17.y : 0u);
                float productValue52 = fract(comparisonValue14 * varyingTexCoord0.x);
                float productValue53 = fract(comparisonValue15 * varyingTexCoord0.y);
                vec4 sampledTextureValue18 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue53 - 0.5) < 0.0625) ? (((productValue53 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue15 = sampledTextureValue18.x;
                float scalarValue16 = sampledTextureValue18.y;
                float scalarValue17 = sampledTextureValue18.z;
                float scalarValue18 = sampledTextureValue18.w;
                float multiplyAddValue34 = fract(fma(varyingTexCoord0.x, comparisonValue14, 0.5));
                float multiplyAddValue35 = fract(fma(varyingTexCoord0.y, comparisonValue15, 0.5));
                bool conditionValue3 = multiplyAddValue35 > 0.5;
                bool conditionValue4 = multiplyAddValue34 > 0.5;
                float comparisonValue18 = conditionValue3 ? scalarValue15 : scalarValue18;
                float comparisonValue19 = conditionValue3 ? scalarValue16 : scalarValue17;
                float comparisonValue20 = conditionValue4 ? scalarValue17 : scalarValue18;
                float comparisonValue21 = conditionValue4 ? scalarValue16 : scalarValue15;
                float sumValue12 = multiplyAddValue34 - 0.083333335816860198974609375;
                float sumValue13 = multiplyAddValue34 + 0.083333335816860198974609375;
                float sumValue14 = multiplyAddValue35 - 0.083333335816860198974609375;
                float sumValue15 = multiplyAddValue35 + 0.083333335816860198974609375;
                uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                uint sumValue18 = uint(int(spvNClamp(sumValue14 + sumValue14, 0.0, 1.0)));
                uint sumValue19 = uint(int(spvNClamp(sumValue15 + sumValue15, 0.0, 1.0)));
                float comparisonValue22 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                float comparisonValue23 = ((sumValue18 == 1u) ? comparisonValue21 : ((sumValue18 == 0u) ? comparisonValue20 : 0.0)) - ((sumValue19 == 1u) ? comparisonValue21 : ((sumValue19 == 0u) ? comparisonValue20 : 0.0));
                vec3 vectorValue = vec3(comparisonValue22, comparisonValue23, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                intermediateValue36 = true;
                productValue18 = inverseLengthValue7 * comparisonValue22;
                productValue17 = inverseLengthValue7 * comparisonValue23;
                productValue16 = inverseLengthValue7 * 0.25;
            }
            else
            {
                float comparisonValue16;
                float comparisonValue17;
                float productValue21;
                if (comparisonValue54)
                {
                    bool sampledTextureValue19 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue20 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue19 = sampledTextureValue20.x;
                    vec4 sampledTextureValue21 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float comparisonValue24 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? scalarValue19 : 0u) * varyingTexCoord0.x);
                    float comparisonValue25 = fract(rdEvaluateFloatExpression(sampledTextureValue19 ? sampledTextureValue20.y : 0u) * varyingTexCoord0.y);
                    float multiplyAddValue36 = (comparisonValue24 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue37 = (comparisonValue25 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue21.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue38 = (comparisonValue24 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.y, 2.0, -1.0) + multiplyAddValue36) : multiplyAddValue36;
                    float multiplyAddValue39 = (comparisonValue25 >= 0.916666686534881591796875) ? (fma(sampledTextureValue21.z, 2.0, -1.0) + multiplyAddValue37) : multiplyAddValue37;
                    bool comparisonValue26 = abs(multiplyAddValue38) >= 0.004999999888241291046142578125;
                    bool comparisonValue27 = abs(multiplyAddValue39) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue28 = vec3(comparisonValue26 ? multiplyAddValue38 : 0.0, comparisonValue27 ? multiplyAddValue39 : 0.0, 0.25);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(comparisonValue28, comparisonValue28));
                    comparisonValue16 = comparisonValue26 ? (inverseLengthValue8 * multiplyAddValue38) : 0.0;
                    comparisonValue17 = comparisonValue27 ? (inverseLengthValue8 * multiplyAddValue39) : 0.0;
                    productValue21 = inverseLengthValue8 * 0.25;
                }
                else
                {
                    comparisonValue16 = intermediateValue20;
                    comparisonValue17 = intermediateValue22;
                    productValue21 = intermediateValue23;
                }
                intermediateValue36 = comparisonValue54;
                productValue18 = comparisonValue16;
                productValue17 = comparisonValue17;
                productValue16 = productValue21;
            }
            multiplyAddValue21 = productValue16;
            multiplyAddValue22 = productValue17;
            multiplyAddValue23 = productValue18;
            intermediateValue35 = intermediateValue36;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue9 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue21 = (sampledTextureValue9.x * 2.0) + (-1.0);
            intermediateValue22 = (sampledTextureValue9.y * 2.0) + (-1.0);
            intermediateValue23 = (sampledTextureValue9.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue9 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue24 = (sampledTextureValue9.x * 2.0) + (-1.0);
            intermediateValue25 = (sampledTextureValue9.y * 2.0) + (-1.0);
            intermediateValue26 = (sampledTextureValue9.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue9 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue25 = (sampledTextureValue9.x * 2.0) + (-1.0);
            intermediateValue26 = (sampledTextureValue9.y * 2.0) + (-1.0);
            intermediateValue27 = (sampledTextureValue9.z * 2.0) + (-1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue9 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue22 = (sampledTextureValue9.x * 2.0) + (-1.0);
            intermediateValue23 = (sampledTextureValue9.y * 2.0) + (-1.0);
            intermediateValue24 = (sampledTextureValue9.z * 2.0) + (-1.0);
#endif
        }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue29 = intermediateValue32 ? multiplyAddValue16 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue40 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue29, intermediateValue32 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue18, intermediateValue32 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue41 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue29, intermediateValue32 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue18, intermediateValue32 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue42 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue29, intermediateValue32 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue18, intermediateValue32 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue17) : 0.0) : 0.0);
        vec3 vectorValue4 = vec3(multiplyAddValue40, multiplyAddValue41, multiplyAddValue42);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        productValue4 = inverseLengthValue12 * multiplyAddValue42;
        productValue5 = inverseLengthValue12 * multiplyAddValue41;
        productValue6 = inverseLengthValue12 * multiplyAddValue40;
    }
    else
    {
        productValue4 = varyingNormal0.z;
        productValue5 = varyingNormal0.y;
        productValue6 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue35 = intermediateValue35 ? multiplyAddValue19 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue50 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue35, intermediateValue35 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue21, intermediateValue35 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue51 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue35, intermediateValue35 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue21, intermediateValue35 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue52 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue35, intermediateValue35 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue21, intermediateValue35 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue20) : 0.0) : 0.0);
        vec3 vectorValue6 = vec3(multiplyAddValue50, multiplyAddValue51, multiplyAddValue52);
        float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
        productValue2 = inverseLengthValue17 * multiplyAddValue52;
        productValue3 = inverseLengthValue17 * multiplyAddValue51;
        productValue4 = inverseLengthValue17 * multiplyAddValue50;
    }
    else
    {
        productValue2 = varyingNormal0.z;
        productValue3 = varyingNormal0.y;
        productValue4 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue41 = intermediateValue32 ? multiplyAddValue19 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue61 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue41, intermediateValue32 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue21, intermediateValue32 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue62 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue41, intermediateValue32 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue21, intermediateValue32 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue63 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue41, intermediateValue32 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue21, intermediateValue32 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue20) : 0.0) : 0.0);
        vec3 vectorValue8 = vec3(multiplyAddValue61, multiplyAddValue62, multiplyAddValue63);
        float inverseLengthValue19 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
        productValue5 = inverseLengthValue19 * multiplyAddValue63;
        productValue6 = inverseLengthValue19 * multiplyAddValue62;
        productValue7 = inverseLengthValue19 * multiplyAddValue61;
    }
    else
    {
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue47 = intermediateValue36 ? multiplyAddValue23 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue75 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue47, intermediateValue36 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue25, intermediateValue36 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue24) : 0.0) : 0.0);
        float multiplyAddValue76 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue47, intermediateValue36 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue25, intermediateValue36 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue24) : 0.0) : 0.0);
        float multiplyAddValue77 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue47, intermediateValue36 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue25, intermediateValue36 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue24) : 0.0) : 0.0);
        vec3 vectorValue10 = vec3(multiplyAddValue75, multiplyAddValue76, multiplyAddValue77);
        float inverseLengthValue24 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
        productValue2 = inverseLengthValue24 * multiplyAddValue77;
        productValue3 = inverseLengthValue24 * multiplyAddValue76;
        productValue4 = inverseLengthValue24 * multiplyAddValue75;
    }
    else
    {
        productValue2 = varyingNormal0.z;
        productValue3 = varyingNormal0.y;
        productValue4 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue52 = intermediateValue33 ? multiplyAddValue19 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue84 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue52, intermediateValue33 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue21, intermediateValue33 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue85 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue52, intermediateValue33 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue21, intermediateValue33 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue86 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue52, intermediateValue33 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue21, intermediateValue33 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue20) : 0.0) : 0.0);
        vec3 vectorValue11 = vec3(multiplyAddValue84, multiplyAddValue85, multiplyAddValue86);
        float inverseLengthValue28 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
        productValue6 = inverseLengthValue28 * multiplyAddValue86;
        productValue7 = inverseLengthValue28 * multiplyAddValue85;
        productValue8 = inverseLengthValue28 * multiplyAddValue84;
    }
    else
    {
        productValue6 = varyingNormal0.z;
        productValue7 = varyingNormal0.y;
        productValue8 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue57 = intermediateValue35 ? multiplyAddValue21 : 1.0;
        vec3 vectorValue1 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 vectorValue2 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue89 = fma(inverseLengthValue11 * varyingNormal0.x, comparisonValue57, intermediateValue35 ? fma(inverseLengthValue9 * varyingTangent0.x, multiplyAddValue23, intermediateValue35 ? ((inverseLengthValue10 * varyingBitangent0.x) * multiplyAddValue22) : 0.0) : 0.0);
        float multiplyAddValue90 = fma(inverseLengthValue11 * varyingNormal0.y, comparisonValue57, intermediateValue35 ? fma(inverseLengthValue9 * varyingTangent0.y, multiplyAddValue23, intermediateValue35 ? ((inverseLengthValue10 * varyingBitangent0.y) * multiplyAddValue22) : 0.0) : 0.0);
        float multiplyAddValue91 = fma(inverseLengthValue11 * varyingNormal0.z, comparisonValue57, intermediateValue35 ? fma(inverseLengthValue9 * varyingTangent0.z, multiplyAddValue23, intermediateValue35 ? ((inverseLengthValue10 * varyingBitangent0.z) * multiplyAddValue22) : 0.0) : 0.0);
        vec3 vectorValue13 = vec3(multiplyAddValue89, multiplyAddValue90, multiplyAddValue91);
        float inverseLengthValue30 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
        productValue5 = inverseLengthValue30 * multiplyAddValue91;
        productValue6 = inverseLengthValue30 * multiplyAddValue90;
        productValue7 = inverseLengthValue30 * multiplyAddValue89;
    }
    else
    {
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue21;
        float multiplyAddValue13 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue22, inverseLengthValue4 * varyingTangent0.x));
        float multiplyAddValue14 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue22, inverseLengthValue4 * varyingTangent0.y));
        float multiplyAddValue15 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue22, inverseLengthValue4 * varyingTangent0.z));
        float inverseLengthValue5 = inversesqrt(dot(vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15), vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15)));
        intermediateValue14 = inverseLengthValue5 * multiplyAddValue13;
        intermediateValue15 = inverseLengthValue5 * multiplyAddValue14;
        intermediateValue16 = inverseLengthValue5 * multiplyAddValue15;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue14 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue24;
        float multiplyAddValue47 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue26, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue25, inverseLengthValue14 * varyingTangent0.x));
        float multiplyAddValue48 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue26, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue25, inverseLengthValue14 * varyingTangent0.y));
        float multiplyAddValue49 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue26, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue25, inverseLengthValue14 * varyingTangent0.z));
        float inverseLengthValue15 = inversesqrt(dot(vec3(multiplyAddValue47, multiplyAddValue48, multiplyAddValue49), vec3(multiplyAddValue47, multiplyAddValue48, multiplyAddValue49)));
        intermediateValue17 = inverseLengthValue15 * multiplyAddValue47;
        intermediateValue18 = inverseLengthValue15 * multiplyAddValue48;
        intermediateValue19 = inverseLengthValue15 * multiplyAddValue49;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue21;
        float multiplyAddValue13 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue22, inverseLengthValue4 * varyingTangent0.x));
        float multiplyAddValue14 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue22, inverseLengthValue4 * varyingTangent0.y));
        float multiplyAddValue15 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue23, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue22, inverseLengthValue4 * varyingTangent0.z));
        float inverseLengthValue5 = inversesqrt(dot(vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15), vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15)));
        intermediateValue14 = inverseLengthValue5 * multiplyAddValue13;
        intermediateValue15 = inverseLengthValue5 * multiplyAddValue14;
        intermediateValue16 = inverseLengthValue5 * multiplyAddValue15;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[13u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[13u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[13u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(intermediateValue14, intermediateValue15, intermediateValue16), vec3(intermediateValue14, intermediateValue15, intermediateValue16)));
    float productValue42 = inverseLengthValue6 * intermediateValue14;
    float productValue43 = inverseLengthValue6 * intermediateValue15;
    float productValue44 = inverseLengthValue6 * intermediateValue16;
    float quotientValue = 1.0 / ((abs(productValue43) + abs(productValue42)) + abs(productValue44));
    float productValue45 = quotientValue * productValue42;
    float productValue46 = quotientValue * productValue43;
    bool conditionValue2 = productValue44 < 0.0;
    float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].w;
    float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[10u].w, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].w, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
    float intermediateValue18;
    float productValue23;
    float productValue24;
    if ((fragmentVectorConstants1.packedValues[17u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[12u].x + fragmentVectorConstants1.packedValues[12u].y) + fragmentVectorConstants1.packedValues[12u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue98 = fragmentVectorConstants1.packedValues[17u].x * fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue18 = spvNClamp(productValue98, 0.0, 1.0);
        productValue23 = spvNClamp(((productValue98 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue98, 0.0, 1.0);
        productValue24 = spvNClamp((((productValue98 * productValue98) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue98, 0.0, 1.0);
    }
    else
    {
        intermediateValue18 = fragmentVectorConstants1.packedValues[12u].x;
        productValue23 = fragmentVectorConstants1.packedValues[12u].y;
        productValue24 = fragmentVectorConstants1.packedValues[12u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue21 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue25;
        float multiplyAddValue68 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue27, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue26, inverseLengthValue21 * varyingTangent0.x));
        float multiplyAddValue69 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue27, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue26, inverseLengthValue21 * varyingTangent0.y));
        float multiplyAddValue70 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue27, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue26, inverseLengthValue21 * varyingTangent0.z));
        float inverseLengthValue22 = inversesqrt(dot(vec3(multiplyAddValue68, multiplyAddValue69, multiplyAddValue70), vec3(multiplyAddValue68, multiplyAddValue69, multiplyAddValue70)));
        intermediateValue18 = inverseLengthValue22 * multiplyAddValue68;
        intermediateValue19 = inverseLengthValue22 * multiplyAddValue69;
        intermediateValue20 = inverseLengthValue22 * multiplyAddValue70;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[13u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[13u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[13u].z;
    float inverseLengthValue23 = inversesqrt(dot(vec3(intermediateValue18, intermediateValue19, intermediateValue20), vec3(intermediateValue18, intermediateValue19, intermediateValue20)));
    float productValue126 = inverseLengthValue23 * intermediateValue18;
    float productValue127 = inverseLengthValue23 * intermediateValue19;
    float productValue128 = inverseLengthValue23 * intermediateValue20;
    float quotientValue5 = 1.0 / ((abs(productValue127) + abs(productValue126)) + abs(productValue128));
    float productValue129 = quotientValue5 * productValue126;
    float productValue130 = quotientValue5 * productValue127;
    bool conditionValue9 = productValue128 < 0.0;
    float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].w;
    float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[10u].w, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].w, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
    float intermediateValue22;
    float productValue24;
    float productValue25;
    if ((fragmentVectorConstants1.packedValues[17u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[12u].x + fragmentVectorConstants1.packedValues[12u].y) + fragmentVectorConstants1.packedValues[12u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue98 = fragmentVectorConstants1.packedValues[17u].x * fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue22 = spvNClamp(productValue98, 0.0, 1.0);
        productValue24 = spvNClamp(((productValue98 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue98, 0.0, 1.0);
        productValue25 = spvNClamp((((productValue98 * productValue98) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue98, 0.0, 1.0);
    }
    else
    {
        intermediateValue22 = fragmentVectorConstants1.packedValues[12u].x;
        productValue24 = fragmentVectorConstants1.packedValues[12u].y;
        productValue25 = fragmentVectorConstants1.packedValues[12u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue25 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        float multiplyAddValue78 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue24, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue23, inverseLengthValue25 * varyingTangent0.x));
        float multiplyAddValue79 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue24, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue23, inverseLengthValue25 * varyingTangent0.y));
        float multiplyAddValue80 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue24, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue23, inverseLengthValue25 * varyingTangent0.z));
        float inverseLengthValue26 = inversesqrt(dot(vec3(multiplyAddValue78, multiplyAddValue79, multiplyAddValue80), vec3(multiplyAddValue78, multiplyAddValue79, multiplyAddValue80)));
        intermediateValue15 = inverseLengthValue26 * multiplyAddValue78;
        intermediateValue16 = inverseLengthValue26 * multiplyAddValue79;
        intermediateValue17 = inverseLengthValue26 * multiplyAddValue80;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[13u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[13u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[13u].z;
    float inverseLengthValue27 = inversesqrt(dot(vec3(intermediateValue15, intermediateValue16, intermediateValue17), vec3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue148 = inverseLengthValue27 * intermediateValue15;
    float productValue149 = inverseLengthValue27 * intermediateValue16;
    float productValue150 = inverseLengthValue27 * intermediateValue17;
    float quotientValue6 = 1.0 / ((abs(productValue149) + abs(productValue148)) + abs(productValue150));
    float productValue151 = quotientValue6 * productValue148;
    float productValue152 = quotientValue6 * productValue149;
    bool conditionValue10 = productValue150 < 0.0;
    float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].w;
    float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[10u].w, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].w, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
    float intermediateValue19;
    float productValue24;
    float productValue25;
    if ((fragmentVectorConstants1.packedValues[17u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[12u].x + fragmentVectorConstants1.packedValues[12u].y) + fragmentVectorConstants1.packedValues[12u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue98 = fragmentVectorConstants1.packedValues[17u].x * fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue19 = spvNClamp(productValue98, 0.0, 1.0);
        productValue24 = spvNClamp(((productValue98 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue98, 0.0, 1.0);
        productValue25 = spvNClamp((((productValue98 * productValue98) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue98, 0.0, 1.0);
    }
    else
    {
        intermediateValue19 = fragmentVectorConstants1.packedValues[12u].x;
        productValue24 = fragmentVectorConstants1.packedValues[12u].y;
        productValue25 = fragmentVectorConstants1.packedValues[12u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue2 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue14 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue24;
        float multiplyAddValue47 = fma(inverseLengthValue2 * varyingNormal0.x, intermediateValue26, fma(inverseLengthValue3 * varyingBitangent0.x, intermediateValue25, inverseLengthValue14 * varyingTangent0.x));
        float multiplyAddValue48 = fma(inverseLengthValue2 * varyingNormal0.y, intermediateValue26, fma(inverseLengthValue3 * varyingBitangent0.y, intermediateValue25, inverseLengthValue14 * varyingTangent0.y));
        float multiplyAddValue49 = fma(inverseLengthValue2 * varyingNormal0.z, intermediateValue26, fma(inverseLengthValue3 * varyingBitangent0.z, intermediateValue25, inverseLengthValue14 * varyingTangent0.z));
        float inverseLengthValue15 = inversesqrt(dot(vec3(multiplyAddValue47, multiplyAddValue48, multiplyAddValue49), vec3(multiplyAddValue47, multiplyAddValue48, multiplyAddValue49)));
        intermediateValue17 = inverseLengthValue15 * multiplyAddValue47;
        intermediateValue18 = inverseLengthValue15 * multiplyAddValue48;
        intermediateValue19 = inverseLengthValue15 * multiplyAddValue49;
    }
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[13u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[13u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[13u].z;
    float inverseLengthValue16 = inversesqrt(dot(vec3(intermediateValue17, intermediateValue18, intermediateValue19), vec3(intermediateValue17, intermediateValue18, intermediateValue19)));
    float productValue70 = inverseLengthValue16 * intermediateValue17;
    float productValue71 = inverseLengthValue16 * intermediateValue18;
    float productValue72 = inverseLengthValue16 * intermediateValue19;
    float quotientValue2 = 1.0 / ((abs(productValue71) + abs(productValue70)) + abs(productValue72));
    float productValue73 = quotientValue2 * productValue70;
    float productValue74 = quotientValue2 * productValue71;
    bool conditionValue6 = productValue72 < 0.0;
    float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].w;
    float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[10u].w, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].w, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
    float intermediateValue21;
    float productValue25;
    float productValue26;
    if ((fragmentVectorConstants1.packedValues[17u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[12u].x + fragmentVectorConstants1.packedValues[12u].y) + fragmentVectorConstants1.packedValues[12u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue98 = fragmentVectorConstants1.packedValues[17u].x * fragmentVectorConstants1.packedValues[17u].x;
        intermediateValue21 = spvNClamp(productValue98, 0.0, 1.0);
        productValue25 = spvNClamp(((productValue98 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue98, 0.0, 1.0);
        productValue26 = spvNClamp((((productValue98 * productValue98) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue98, 0.0, 1.0);
    }
    else
    {
        intermediateValue21 = fragmentVectorConstants1.packedValues[12u].x;
        productValue25 = fragmentVectorConstants1.packedValues[12u].y;
        productValue26 = fragmentVectorConstants1.packedValues[12u].z;
#endif
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue7 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue8 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue9 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue27) ? fma(intermediateValue27, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(productValue6, productValue5, productValue4);
    float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue54 = inverseLengthValue13 * productValue6;
    float productValue55 = inverseLengthValue13 * productValue5;
    float productValue56 = inverseLengthValue13 * productValue4;
    float quotientValue1 = 1.0 / (abs(productValue56) + (abs(productValue55) + abs(productValue54)));
    float productValue57 = quotientValue1 * productValue54;
    float productValue58 = quotientValue1 * productValue55;
    bool conditionValue5 = productValue56 < 0.0;
    float sumValue20 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue57 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue58))) : productValue57;
    fragmentColor2.y = conditionValue5 ? (((productValue58 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue57))) : productValue58;
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[39u], sumValue9, fma(fragmentScalarConstants1.packedValues[31u], sumValue7, sumValue8 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue43, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue9, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue7, sumValue8 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue44, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue43, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue9, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue7, sumValue8 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue44, 0.5, 0.5);
    bool bitwiseValue2 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue59 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue30 = (bitwiseValue2 ? spvNMin(productValue59, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue45 = (bitwiseValue2 ? spvNMin(fma(fma(productValue59, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue59, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue46 = (bitwiseValue2 ? spvNMin(fma(productValue59 * productValue59, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue59, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue60 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue45, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue46, comparisonValue30)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue45 / productValue60, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue30 / productValue60, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue46 / productValue60, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue60, 0.0, 1.0) * 255.0);
    uint productValue61 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue61 & 2u) != 0u) ? 512u : 0u) + ((((productValue61 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue29, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue28, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue7 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue8 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue9 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue30) ? fma(intermediateValue30, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(productValue4, productValue3, productValue2);
    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue79 = inverseLengthValue18 * productValue4;
    float productValue80 = inverseLengthValue18 * productValue3;
    float productValue81 = inverseLengthValue18 * productValue2;
    float quotientValue3 = 1.0 / (abs(productValue81) + (abs(productValue80) + abs(productValue79)));
    float productValue82 = quotientValue3 * productValue79;
    float productValue83 = quotientValue3 * productValue80;
    bool conditionValue7 = productValue81 < 0.0;
    float sumValue20 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue82 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue83))) : productValue82;
    fragmentColor2.y = conditionValue7 ? (((productValue83 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue82))) : productValue83;
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[39u], sumValue9, fma(fragmentScalarConstants1.packedValues[31u], sumValue7, sumValue8 * fragmentScalarConstants1.packedValues[35u])) + fragmentScalarConstants1.packedValues[43u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue43, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue9, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue7, sumValue8 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue44, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue43, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue9, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue7, sumValue8 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue44, 0.5, 0.5);
    bool bitwiseValue2 = (((fragmentScalarConstants1.packedValues[45u] + fragmentScalarConstants1.packedValues[44u]) + fragmentScalarConstants1.packedValues[46u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float productValue59 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    float comparisonValue30 = (bitwiseValue2 ? spvNMin(productValue59, 1.0) : fragmentVectorConstants1.packedValues[11u].x) * 0.16666667163372039794921875;
    float multiplyAddValue45 = (bitwiseValue2 ? spvNMin(fma(fma(productValue59, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue59, 1.0) : fragmentVectorConstants1.packedValues[11u].y) * 0.16666667163372039794921875;
    float multiplyAddValue46 = (bitwiseValue2 ? spvNMin(fma(productValue59 * productValue59, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue59, 1.0) : fragmentVectorConstants1.packedValues[11u].z) * 0.16666667163372039794921875;
    float productValue60 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue45, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue46, comparisonValue30)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue45 / productValue60, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue30 / productValue60, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue46 / productValue60, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue60, 0.0, 1.0) * 255.0);
    uint productValue61 = uint(floor(fragmentScalarConstants1.packedValues[47u] * 255.0));
    fragmentColor0.w = (((productValue61 & 2u) != 0u) ? 512u : 0u) + ((((productValue61 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue32, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue31, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[13u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[13u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[13u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue27) ? fma(intermediateValue27, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue9 = vec3(productValue7, productValue6, productValue5);
    float inverseLengthValue20 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
    float productValue106 = inverseLengthValue20 * productValue7;
    float productValue107 = inverseLengthValue20 * productValue6;
    float productValue108 = inverseLengthValue20 * productValue5;
    float quotientValue4 = 1.0 / (abs(productValue108) + (abs(productValue107) + abs(productValue106)));
    float productValue109 = quotientValue4 * productValue106;
    float productValue110 = quotientValue4 * productValue107;
    bool conditionValue8 = productValue108 < 0.0;
    float sumValue20 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue109 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue110))) : productValue109;
    fragmentColor2.y = conditionValue8 ? (((productValue110 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue109))) : productValue110;
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[23u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[19u])) + fragmentScalarConstants1.packedValues[27u];
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[43u], sumValue28, fma(fragmentScalarConstants1.packedValues[35u], sumValue26, sumValue27 * fragmentScalarConstants1.packedValues[39u])) + fragmentScalarConstants1.packedValues[47u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[6u].x) / multiplyAddValue64, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue65, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[6u].y) / multiplyAddValue64, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue65, 0.5, 0.5);
    bool bitwiseValue5 = (((fragmentScalarConstants1.packedValues[49u] + fragmentScalarConstants1.packedValues[48u]) + fragmentScalarConstants1.packedValues[50u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[68u] > 9.9999997473787516355514526367188e-05);
    float productValue111 = fragmentScalarConstants1.packedValues[68u] * fragmentScalarConstants1.packedValues[68u];
    float comparisonValue42 = (bitwiseValue5 ? spvNMin(productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].x) * 0.16666667163372039794921875;
    float multiplyAddValue66 = (bitwiseValue5 ? spvNMin(fma(fma(productValue111, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].y) * 0.16666667163372039794921875;
    float multiplyAddValue67 = (bitwiseValue5 ? spvNMin(fma(productValue111 * productValue111, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].z) * 0.16666667163372039794921875;
    float productValue112 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue66, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue67, comparisonValue42)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue66 / productValue112, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue42 / productValue112, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue67 / productValue112, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue112, 0.0, 1.0) * 255.0);
    uint productValue113 = uint(floor(fragmentScalarConstants1.packedValues[51u] * 255.0));
    fragmentColor0.w = (((productValue113 & 2u) != 0u) ? 512u : 0u) + ((((productValue113 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[69u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue29, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue28, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[13u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[13u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[13u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue31) ? fma(intermediateValue31, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(productValue4, productValue3, productValue2);
    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue79 = inverseLengthValue18 * productValue4;
    float productValue80 = inverseLengthValue18 * productValue3;
    float productValue81 = inverseLengthValue18 * productValue2;
    float quotientValue3 = 1.0 / (abs(productValue81) + (abs(productValue80) + abs(productValue79)));
    float productValue82 = quotientValue3 * productValue79;
    float productValue83 = quotientValue3 * productValue80;
    bool conditionValue7 = productValue81 < 0.0;
    float sumValue20 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue82 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue83))) : productValue82;
    fragmentColor2.y = conditionValue7 ? (((productValue83 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue82))) : productValue83;
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[23u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[19u])) + fragmentScalarConstants1.packedValues[27u];
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[43u], sumValue28, fma(fragmentScalarConstants1.packedValues[35u], sumValue26, sumValue27 * fragmentScalarConstants1.packedValues[39u])) + fragmentScalarConstants1.packedValues[47u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[6u].x) / multiplyAddValue64, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue65, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[6u].y) / multiplyAddValue64, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue65, 0.5, 0.5);
    bool bitwiseValue5 = (((fragmentScalarConstants1.packedValues[49u] + fragmentScalarConstants1.packedValues[48u]) + fragmentScalarConstants1.packedValues[50u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[68u] > 9.9999997473787516355514526367188e-05);
    float productValue111 = fragmentScalarConstants1.packedValues[68u] * fragmentScalarConstants1.packedValues[68u];
    float comparisonValue42 = (bitwiseValue5 ? spvNMin(productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].x) * 0.16666667163372039794921875;
    float multiplyAddValue66 = (bitwiseValue5 ? spvNMin(fma(fma(productValue111, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].y) * 0.16666667163372039794921875;
    float multiplyAddValue67 = (bitwiseValue5 ? spvNMin(fma(productValue111 * productValue111, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].z) * 0.16666667163372039794921875;
    float productValue112 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue66, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue67, comparisonValue42)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue66 / productValue112, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue42 / productValue112, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue67 / productValue112, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue112, 0.0, 1.0) * 255.0);
    uint productValue113 = uint(floor(fragmentScalarConstants1.packedValues[51u] * 255.0));
    fragmentColor0.w = (((productValue113 & 2u) != 0u) ? 512u : 0u) + ((((productValue113 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[69u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue33, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue32, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[13u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[13u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[13u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue28) ? fma(intermediateValue28, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue12 = vec3(productValue8, productValue7, productValue6);
    float inverseLengthValue29 = inversesqrt(rdDot3Precise2(vectorValue12, vectorValue12));
    float productValue158 = inverseLengthValue29 * productValue8;
    float productValue159 = inverseLengthValue29 * productValue7;
    float productValue160 = inverseLengthValue29 * productValue6;
    float quotientValue7 = 1.0 / (abs(productValue160) + (abs(productValue159) + abs(productValue158)));
    float productValue161 = quotientValue7 * productValue158;
    float productValue162 = quotientValue7 * productValue159;
    bool conditionValue11 = productValue160 < 0.0;
    float sumValue20 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? (((productValue161 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue162))) : productValue161;
    fragmentColor2.y = conditionValue11 ? (((productValue162 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue161))) : productValue162;
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[23u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[19u])) + fragmentScalarConstants1.packedValues[27u];
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[43u], sumValue28, fma(fragmentScalarConstants1.packedValues[35u], sumValue26, sumValue27 * fragmentScalarConstants1.packedValues[39u])) + fragmentScalarConstants1.packedValues[47u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[6u].x) / multiplyAddValue64, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue65, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[6u].y) / multiplyAddValue64, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue65, 0.5, 0.5);
    bool bitwiseValue5 = (((fragmentScalarConstants1.packedValues[49u] + fragmentScalarConstants1.packedValues[48u]) + fragmentScalarConstants1.packedValues[50u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[68u] > 9.9999997473787516355514526367188e-05);
    float productValue111 = fragmentScalarConstants1.packedValues[68u] * fragmentScalarConstants1.packedValues[68u];
    float comparisonValue42 = (bitwiseValue5 ? spvNMin(productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].x) * 0.16666667163372039794921875;
    float multiplyAddValue66 = (bitwiseValue5 ? spvNMin(fma(fma(productValue111, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].y) * 0.16666667163372039794921875;
    float multiplyAddValue67 = (bitwiseValue5 ? spvNMin(fma(productValue111 * productValue111, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].z) * 0.16666667163372039794921875;
    float productValue112 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue66, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue67, comparisonValue42)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue66 / productValue112, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue42 / productValue112, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue67 / productValue112, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue112, 0.0, 1.0) * 255.0);
    uint productValue113 = uint(floor(fragmentScalarConstants1.packedValues[51u] * 255.0));
    fragmentColor0.w = (((productValue113 & 2u) != 0u) ? 512u : 0u) + ((((productValue113 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[69u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue30, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue29, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue26 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[13u].x;
    float sumValue27 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[13u].y;
    float sumValue28 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[13u].z;
    fragmentColor1.w = (comparisonValue5 < intermediateValue30) ? fma(intermediateValue30, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue5, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue9 = vec3(productValue7, productValue6, productValue5);
    float inverseLengthValue20 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
    float productValue106 = inverseLengthValue20 * productValue7;
    float productValue107 = inverseLengthValue20 * productValue6;
    float productValue108 = inverseLengthValue20 * productValue5;
    float quotientValue4 = 1.0 / (abs(productValue108) + (abs(productValue107) + abs(productValue106)));
    float productValue109 = quotientValue4 * productValue106;
    float productValue110 = quotientValue4 * productValue107;
    bool conditionValue8 = productValue108 < 0.0;
    float sumValue20 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue109 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue110))) : productValue109;
    fragmentColor2.y = conditionValue8 ? (((productValue110 >= 0.0) ? sumValue20 : (-1.0)) * (1.0 - abs(productValue109))) : productValue110;
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[23u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[19u])) + fragmentScalarConstants1.packedValues[27u];
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[43u], sumValue28, fma(fragmentScalarConstants1.packedValues[35u], sumValue26, sumValue27 * fragmentScalarConstants1.packedValues[39u])) + fragmentScalarConstants1.packedValues[47u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[6u].x) / multiplyAddValue64, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue65, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[6u].y) / multiplyAddValue64, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue26, sumValue27 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue65, 0.5, 0.5);
    bool bitwiseValue5 = (((fragmentScalarConstants1.packedValues[49u] + fragmentScalarConstants1.packedValues[48u]) + fragmentScalarConstants1.packedValues[50u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[68u] > 9.9999997473787516355514526367188e-05);
    float productValue111 = fragmentScalarConstants1.packedValues[68u] * fragmentScalarConstants1.packedValues[68u];
    float comparisonValue42 = (bitwiseValue5 ? spvNMin(productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].x) * 0.16666667163372039794921875;
    float multiplyAddValue66 = (bitwiseValue5 ? spvNMin(fma(fma(productValue111, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].y) * 0.16666667163372039794921875;
    float multiplyAddValue67 = (bitwiseValue5 ? spvNMin(fma(productValue111 * productValue111, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue111, 1.0) : fragmentVectorConstants1.packedValues[12u].z) * 0.16666667163372039794921875;
    float productValue112 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue66, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue67, comparisonValue42)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue66 / productValue112, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue42 / productValue112, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue67 / productValue112, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue112, 0.0, 1.0) * 255.0);
    uint productValue113 = uint(floor(fragmentScalarConstants1.packedValues[51u] * 255.0));
    fragmentColor0.w = (((productValue113 & 2u) != 0u) ? 512u : 0u) + ((((productValue113 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[69u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue32, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue31, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue7 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue8 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue9 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(intermediateValue14, intermediateValue15, intermediateValue16), vec3(intermediateValue14, intermediateValue15, intermediateValue16)));
    float productValue42 = inverseLengthValue6 * intermediateValue14;
    float productValue43 = inverseLengthValue6 * intermediateValue15;
    float productValue44 = inverseLengthValue6 * intermediateValue16;
    float quotientValue = 1.0 / ((abs(productValue43) + abs(productValue42)) + abs(productValue44));
    float productValue45 = quotientValue * productValue42;
    float productValue46 = quotientValue * productValue43;
    bool conditionValue2 = productValue44 < 0.0;
    float multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue9, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue8, sumValue7 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue18;
    float productValue19;
    float productValue20;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue47 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue18 = spvNClamp(productValue47, 0.0, 1.0);
        productValue19 = spvNClamp(((productValue47 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue47, 0.0, 1.0);
        productValue20 = spvNClamp((((productValue47 * productValue47) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue47, 0.0, 1.0);
    }
    else
    {
        intermediateValue18 = fragmentVectorConstants1.packedValues[11u].x;
        productValue19 = fragmentVectorConstants1.packedValues[11u].y;
        productValue20 = fragmentVectorConstants1.packedValues[11u].z;
    }
    float productValue48 = intermediateValue18 * 0.16666667163372039794921875;
    float productValue49 = productValue19 * 0.16666667163372039794921875;
    float productValue50 = productValue20 * 0.16666667163372039794921875;
    float productValue51 = ceil(spvNClamp(spvNMax(spvNMax(productValue48, productValue50), spvNMax(productValue49, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue11, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue48 / productValue51, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue49 / productValue51, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue50 / productValue51, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue51, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[6u].x - productValue29) * fragmentVectorConstants1.packedValues[6u].w) + productValue29) + (productValue32 * productValue32);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[6u].y - productValue30) * fragmentVectorConstants1.packedValues[6u].w) + productValue30) + (productValue33 * productValue33);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[6u].z - productValue31) * fragmentVectorConstants1.packedValues[6u].w) + productValue31) + (productValue34 * productValue34);
    fragmentColor1.w = (intermediateValue10 > intermediateValue13) ? ((intermediateValue10 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue13 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue45 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue46))) : productValue45;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue45)) * ((productValue46 < 0.0) ? (-1.0) : 1.0)) : productValue46;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue26) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue9, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue8, sumValue7 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue27)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue26) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue9, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue8, sumValue7 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue27)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue7 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue8 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue9 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue16 = inversesqrt(dot(vec3(intermediateValue17, intermediateValue18, intermediateValue19), vec3(intermediateValue17, intermediateValue18, intermediateValue19)));
    float productValue70 = inverseLengthValue16 * intermediateValue17;
    float productValue71 = inverseLengthValue16 * intermediateValue18;
    float productValue72 = inverseLengthValue16 * intermediateValue19;
    float quotientValue2 = 1.0 / ((abs(productValue71) + abs(productValue70)) + abs(productValue72));
    float productValue73 = quotientValue2 * productValue70;
    float productValue74 = quotientValue2 * productValue71;
    bool conditionValue6 = productValue72 < 0.0;
    float multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[9u].w, sumValue9, fma(fragmentVectorConstants1.packedValues[8u].w, sumValue8, sumValue7 * fragmentVectorConstants1.packedValues[7u].w)) + fragmentVectorConstants1.packedValues[10u].w;
    float intermediateValue21;
    float productValue20;
    float productValue21;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[11u].x + fragmentVectorConstants1.packedValues[11u].y) + fragmentVectorConstants1.packedValues[11u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue47 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue21 = spvNClamp(productValue47, 0.0, 1.0);
        productValue20 = spvNClamp(((productValue47 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue47, 0.0, 1.0);
        productValue21 = spvNClamp((((productValue47 * productValue47) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue47, 0.0, 1.0);
    }
    else
    {
        intermediateValue21 = fragmentVectorConstants1.packedValues[11u].x;
        productValue20 = fragmentVectorConstants1.packedValues[11u].y;
        productValue21 = fragmentVectorConstants1.packedValues[11u].z;
    }
    float productValue75 = intermediateValue21 * 0.16666667163372039794921875;
    float productValue50 = productValue20 * 0.16666667163372039794921875;
    float productValue76 = productValue21 * 0.16666667163372039794921875;
    float productValue77 = ceil(spvNClamp(spvNMax(spvNMax(productValue75, productValue76), spvNMax(productValue50, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[11u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue75 / productValue77, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue50 / productValue77, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue76 / productValue77, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue77, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[6u].x - productValue67) * fragmentVectorConstants1.packedValues[6u].w) + productValue67) + (productValue32 * productValue32);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[6u].y - productValue68) * fragmentVectorConstants1.packedValues[6u].w) + productValue68) + (productValue33 * productValue33);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[6u].z - productValue69) * fragmentVectorConstants1.packedValues[6u].w) + productValue69) + (productValue34 * productValue34);
    fragmentColor1.w = (intermediateValue13 > intermediateValue16) ? ((intermediateValue13 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue16 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue73 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue74))) : productValue73;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue73)) * ((productValue74 < 0.0) ? (-1.0) : 1.0)) : productValue74;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue26) - ((fma(fragmentVectorConstants1.packedValues[9u].x, sumValue9, fma(fragmentVectorConstants1.packedValues[8u].x, sumValue8, sumValue7 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[10u].x) / multiplyAddValue27)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue26) - ((fma(fragmentVectorConstants1.packedValues[9u].y, sumValue9, fma(fragmentVectorConstants1.packedValues[8u].y, sumValue8, sumValue7 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[10u].y) / multiplyAddValue27)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue48 = intermediateValue18 * 0.16666667163372039794921875;
    float productValue99 = productValue23 * 0.16666667163372039794921875;
    float productValue100 = productValue24 * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNClamp(spvNMax(spvNMax(productValue48, productValue100), spvNMax(productValue99, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue3 = uint(floor(fragmentVectorConstants1.packedValues[12u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue11, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue48 / productValue101, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue99 / productValue101, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue100 / productValue101, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[17u].y, 0.0, 1.0) * 255.0) | (bitwiseValue3 & 256u)) | (bitwiseValue3 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[7u].x - productValue92) * fragmentVectorConstants1.packedValues[7u].w) + productValue92) + (productValue95 * productValue95);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[7u].y - productValue93) * fragmentVectorConstants1.packedValues[7u].w) + productValue93) + (productValue96 * productValue96);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[7u].z - productValue94) * fragmentVectorConstants1.packedValues[7u].w) + productValue94) + (productValue97 * productValue97);
    fragmentColor1.w = (intermediateValue10 > intermediateValue13) ? ((intermediateValue10 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue13 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue45 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue46))) : productValue45;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue45)) * ((productValue46 < 0.0) ? (-1.0) : 1.0)) : productValue46;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].x) / multiplyAddValue53) - ((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].x, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue54)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].y) / multiplyAddValue53) - ((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].y, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue54)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue131 = intermediateValue22 * 0.16666667163372039794921875;
    float productValue100 = productValue24 * 0.16666667163372039794921875;
    float productValue132 = productValue25 * 0.16666667163372039794921875;
    float productValue133 = ceil(spvNClamp(spvNMax(spvNMax(productValue131, productValue132), spvNMax(productValue100, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue3 = uint(floor(fragmentVectorConstants1.packedValues[12u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue131 / productValue133, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue100 / productValue133, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue132 / productValue133, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue133, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[17u].y, 0.0, 1.0) * 255.0) | (bitwiseValue3 & 256u)) | (bitwiseValue3 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[7u].x - productValue123) * fragmentVectorConstants1.packedValues[7u].w) + productValue123) + (productValue95 * productValue95);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[7u].y - productValue124) * fragmentVectorConstants1.packedValues[7u].w) + productValue124) + (productValue96 * productValue96);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[7u].z - productValue125) * fragmentVectorConstants1.packedValues[7u].w) + productValue125) + (productValue97 * productValue97);
    fragmentColor1.w = (intermediateValue14 > intermediateValue17) ? ((intermediateValue14 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue17 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue9 ? (((productValue129 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue130))) : productValue129;
    fragmentColor2.y = conditionValue9 ? ((1.0 - abs(productValue129)) * ((productValue130 < 0.0) ? (-1.0) : 1.0)) : productValue130;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].x) / multiplyAddValue53) - ((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].x, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue54)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].y) / multiplyAddValue53) - ((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].y, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue54)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue153 = intermediateValue19 * 0.16666667163372039794921875;
    float productValue100 = productValue24 * 0.16666667163372039794921875;
    float productValue132 = productValue25 * 0.16666667163372039794921875;
    float productValue154 = ceil(spvNClamp(spvNMax(spvNMax(productValue153, productValue132), spvNMax(productValue100, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue3 = uint(floor(fragmentVectorConstants1.packedValues[12u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue153 / productValue154, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue100 / productValue154, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue132 / productValue154, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue154, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[17u].y, 0.0, 1.0) * 255.0) | (bitwiseValue3 & 256u)) | (bitwiseValue3 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[7u].x - productValue142) * fragmentVectorConstants1.packedValues[7u].w) + productValue142) + (productValue145 * productValue145);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[7u].y - productValue143) * fragmentVectorConstants1.packedValues[7u].w) + productValue143) + (productValue146 * productValue146);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[7u].z - productValue144) * fragmentVectorConstants1.packedValues[7u].w) + productValue144) + (productValue147 * productValue147);
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue14 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue10 ? (((productValue151 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue152))) : productValue151;
    fragmentColor2.y = conditionValue10 ? ((1.0 - abs(productValue151)) * ((productValue152 < 0.0) ? (-1.0) : 1.0)) : productValue152;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].x) / multiplyAddValue53) - ((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].x, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue54)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].y) / multiplyAddValue53) - ((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].y, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue54)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue75 = intermediateValue21 * 0.16666667163372039794921875;
    float productValue132 = productValue25 * 0.16666667163372039794921875;
    float productValue176 = productValue26 * 0.16666667163372039794921875;
    float productValue177 = ceil(spvNClamp(spvNMax(spvNMax(productValue75, productValue176), spvNMax(productValue132, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue3 = uint(floor(fragmentVectorConstants1.packedValues[12u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue75 / productValue177, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue132 / productValue177, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue176 / productValue177, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue177, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[17u].y, 0.0, 1.0) * 255.0) | (bitwiseValue3 & 256u)) | (bitwiseValue3 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[7u].x - productValue173) * fragmentVectorConstants1.packedValues[7u].w) + productValue173) + (productValue145 * productValue145);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[7u].y - productValue174) * fragmentVectorConstants1.packedValues[7u].w) + productValue174) + (productValue146 * productValue146);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[7u].z - productValue175) * fragmentVectorConstants1.packedValues[7u].w) + productValue175) + (productValue147 * productValue147);
    fragmentColor1.w = (intermediateValue13 > intermediateValue16) ? ((intermediateValue13 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue16 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue73 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue74))) : productValue73;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue73)) * ((productValue74 < 0.0) ? (-1.0) : 1.0)) : productValue74;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].x) / multiplyAddValue53) - ((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].x, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue54)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[3u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[6u].y) / multiplyAddValue53) - ((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[9u].y, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue54)) * 0.5;
#endif
}
