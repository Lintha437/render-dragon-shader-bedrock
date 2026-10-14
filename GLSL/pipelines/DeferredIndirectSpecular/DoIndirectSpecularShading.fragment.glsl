#version 460
#extension GL_GOOGLE_include_directive : require
// DeferredIndirectSpecular / DoIndirectSpecularShading / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 5
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_MODE
#define RD_OPTION_MODE RD_MODE_DEFAULT
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_samplerless_texture_functions : require
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_samplerless_texture_functions : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/DeferredIndirectSpecular/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    fragmentColor0.x = 0.0;
    fragmentColor0.y = 0.0;
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
#elif (RD_OPTION_MODE == RD_MODE_DEFAULT && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue32 = sampledTextureValue17.x;
    float scalarValue33 = sampledTextureValue17.y;
    vec4 sampledTextureValue18 = texture(sampler2D(materialTexture8, textureSampler8), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue34 = sampledTextureValue18.x;
    float multiplyAddValue25 = fma(scalarValue34, fragmentScalarConstants1.packedValues[59u], fragmentScalarConstants1.packedValues[63u]);
    float quotientValue16 = (varyingColor1.x * fragmentScalarConstants1.packedValues[48u]) / multiplyAddValue25;
    float quotientValue17 = (varyingColor1.y * fragmentScalarConstants1.packedValues[53u]) / multiplyAddValue25;
    float quotientValue18 = fragmentScalarConstants1.packedValues[62u] / multiplyAddValue25;
    float multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue18, fma(fragmentVectorConstants1.packedValues[4u].x, quotientValue16, quotientValue17 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue18, fma(fragmentVectorConstants1.packedValues[4u].y, quotientValue16, quotientValue17 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue18, fma(fragmentVectorConstants1.packedValues[4u].z, quotientValue16, quotientValue17 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float quotientValue19 = ((varyingColor1.y - fragmentScalarConstants1.packedValues[129u]) * fragmentScalarConstants1.packedValues[53u]) / multiplyAddValue25;
    float quotientValue20 = ((varyingColor1.x + fragmentScalarConstants1.packedValues[128u]) * fragmentScalarConstants1.packedValues[48u]) / multiplyAddValue25;
    float multiplyAddValue29 = (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue18, fma(fragmentVectorConstants1.packedValues[4u].x, quotientValue20, quotientValue19 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[37u].x;
    float multiplyAddValue30 = (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue18, fma(fragmentVectorConstants1.packedValues[4u].y, quotientValue20, quotientValue19 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) - fragmentVectorConstants1.packedValues[37u].y;
    float multiplyAddValue31 = (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue18, fma(fragmentVectorConstants1.packedValues[4u].z, quotientValue20, quotientValue19 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) - fragmentVectorConstants1.packedValues[37u].z;
    float scalarValue35 = dFdxCoarse(quotientValue18);
    float scalarValue36 = dFdxCoarse(quotientValue20);
    float scalarValue37 = dFdxCoarse(quotientValue19);
    vec3 vectorValue = vec3(scalarValue35, scalarValue36, scalarValue37);
    float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue116 = inverseLengthValue13 * scalarValue35;
    float productValue117 = inverseLengthValue13 * scalarValue36;
    float productValue118 = inverseLengthValue13 * scalarValue37;
    float scalarValue38 = dFdyCoarse(-quotientValue19);
    float scalarValue39 = dFdyCoarse(-quotientValue18);
    float scalarValue40 = dFdyCoarse(-quotientValue20);
    vec3 vectorValue1 = vec3(scalarValue38, scalarValue39, scalarValue40);
    float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    float productValue119 = inverseLengthValue14 * scalarValue38;
    float productValue120 = inverseLengthValue14 * scalarValue39;
    float productValue121 = inverseLengthValue14 * scalarValue40;
    float multiplyAddValue32 = fma(productValue118, productValue120, -(productValue119 * productValue116));
    float multiplyAddValue33 = fma(productValue116, productValue121, -(productValue120 * productValue117));
    float multiplyAddValue34 = fma(productValue117, productValue119, -(productValue121 * productValue118));
    vec3 vectorValue2 = vec3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34);
    float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    float productValue122 = inverseLengthValue15 * multiplyAddValue32;
    float productValue123 = inverseLengthValue15 * multiplyAddValue33;
    float productValue124 = inverseLengthValue15 * multiplyAddValue34;
    float multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue124, fma(fragmentVectorConstants1.packedValues[4u].x, productValue122, productValue123 * fragmentVectorConstants1.packedValues[5u].x));
    float multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue124, fma(fragmentVectorConstants1.packedValues[4u].y, productValue122, productValue123 * fragmentVectorConstants1.packedValues[5u].y));
    float multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue124, fma(fragmentVectorConstants1.packedValues[4u].z, productValue122, productValue123 * fragmentVectorConstants1.packedValues[5u].z));
    vec3 vectorValue3 = vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37);
    float inverseLengthValue16 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    float quotientValue21 = roundEven((inverseLengthValue16 * multiplyAddValue35) / fragmentScalarConstants1.packedValues[72u]) * fragmentScalarConstants1.packedValues[72u];
    float quotientValue22 = roundEven((inverseLengthValue16 * multiplyAddValue36) / fragmentScalarConstants1.packedValues[72u]) * fragmentScalarConstants1.packedValues[72u];
    float quotientValue23 = roundEven((inverseLengthValue16 * multiplyAddValue37) / fragmentScalarConstants1.packedValues[72u]) * fragmentScalarConstants1.packedValues[72u];
    vec3 vectorValue4 = vec3(quotientValue21, quotientValue22, quotientValue23);
    float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
    float productValue125 = inverseLengthValue17 * quotientValue21;
    float productValue126 = inverseLengthValue17 * quotientValue22;
    float productValue127 = inverseLengthValue17 * quotientValue23;
    float scalarValue41 = -fragmentScalarConstants1.packedValues[66u];
    float multiplyAddValue38 = fma(fragmentScalarConstants1.packedValues[66u], 0.5, -fma(scalarValue41, floor(multiplyAddValue29 / fragmentScalarConstants1.packedValues[66u]), multiplyAddValue29));
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[66u], 0.5, -fma(scalarValue41, floor(multiplyAddValue30 / fragmentScalarConstants1.packedValues[66u]), multiplyAddValue30));
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[66u], 0.5, -fma(scalarValue41, floor(multiplyAddValue31 / fragmentScalarConstants1.packedValues[66u]), multiplyAddValue31));
    float scalarValue42 = -rdDot3Precise2(vec3(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40), vec3(productValue125, productValue126, productValue127));
    float multiplyAddValue47 = (fma(scalarValue42, productValue125, multiplyAddValue38) + multiplyAddValue29) + fragmentVectorConstants1.packedValues[37u].x;
    float multiplyAddValue48 = (fma(scalarValue42, productValue126, multiplyAddValue39) + multiplyAddValue30) + fragmentVectorConstants1.packedValues[37u].y;
    float multiplyAddValue49 = (fma(scalarValue42, productValue127, multiplyAddValue40) + multiplyAddValue31) + fragmentVectorConstants1.packedValues[37u].z;
    float scalarValue43 = abs(scalarValue33);
    float sumValue15 = 1.0 - abs(scalarValue32);
    float sumValue16 = sumValue15 - scalarValue43;
    bool conditionValue2 = sumValue16 < 0.0;
    float comparisonValue19 = conditionValue2 ? (((scalarValue32 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue43)) : scalarValue32;
    float comparisonValue20 = conditionValue2 ? (((scalarValue33 >= 0.0) ? 1.0 : (-1.0)) * sumValue15) : scalarValue33;
    vec3 vectorValue5 = vec3(comparisonValue19, comparisonValue20, sumValue16);
    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue128 = inverseLengthValue18 * comparisonValue19;
    float productValue129 = inverseLengthValue18 * comparisonValue20;
    float productValue130 = inverseLengthValue18 * sumValue16;
    float multiplyAddValue50 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue130, fma(fragmentVectorConstants1.packedValues[0u].x, productValue128, productValue129 * fragmentVectorConstants1.packedValues[1u].x));
    float multiplyAddValue51 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue130, fma(fragmentVectorConstants1.packedValues[0u].y, productValue128, productValue129 * fragmentVectorConstants1.packedValues[1u].y));
    float multiplyAddValue52 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue130, fma(fragmentVectorConstants1.packedValues[0u].z, productValue128, productValue129 * fragmentVectorConstants1.packedValues[1u].z));
    vec3 vectorValue6 = vec3(multiplyAddValue50, multiplyAddValue51, multiplyAddValue52);
    float inverseLengthValue19 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
    vec4 sampledTextureValue19 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue44 = sampledTextureValue19.x;
    float scalarValue45 = sampledTextureValue19.y;
    float scalarValue46 = sampledTextureValue19.z;
    float productValue131 = spvNClamp((sampledTextureValue19.w - 0.501960813999176025390625) * 2.007874011993408203125, 0.0, 1.0);
    bool sampledTextureValue20 = uint(textureQueryLevels(intermediateValue2)) > 0u;
    uvec2 sampledTextureValue21 = uvec2(textureSize(intermediateValue2, int(0u)));
    uint scalarValue47 = sampledTextureValue21.x;
    uvec4 sampledTextureValue22 = texelFetch(intermediateValue2, ivec2(uvec2(uint(int(rdEvaluateFloatExpression(sampledTextureValue20 ? scalarValue47 : 0u) * varyingTexCoord0.x)), uint(int(rdEvaluateFloatExpression(sampledTextureValue20 ? sampledTextureValue21.y : 0u) * varyingTexCoord0.y)))), int(0u));
    uint scalarValue48 = sampledTextureValue22.y;
    uint scalarValue49 = sampledTextureValue22.z;
    float scalarValue50 = rdEvaluateFloatExpression(bitfieldExtract(sampledTextureValue22.x, int(8u), int(8u)));
    float bitwiseValue6 = rdEvaluateFloatExpression(scalarValue49 & 255u) * 0.0039215688593685626983642578125;
    float productValue132 = (bitwiseValue6 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue48, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * 6.0;
    float bitwiseValue7 = (bitwiseValue6 * (rdEvaluateFloatExpression(scalarValue48 & 255u) * 0.0039215688593685626983642578125)) * 6.0;
    float productValue133 = (bitwiseValue6 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue49, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * 6.0;
    bool comparisonValue21 = fragmentScalarConstants1.packedValues[100u] != 0.0;
    float sumValue17 = 1.0 - productValue131;
    float multiplyAddValue53 = fma(sumValue17, 0.039999999105930328369140625, productValue131 * (comparisonValue21 ? exp2(log2(spvNMax(scalarValue44, 0.0)) * 2.2000000476837158203125) : ((scalarValue44 <= 0.040449999272823333740234375) ? (scalarValue44 * 0.077399380505084991455078125) : exp2(log2((scalarValue44 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))));
    float multiplyAddValue54 = fma(sumValue17, 0.039999999105930328369140625, productValue131 * (comparisonValue21 ? exp2(log2(spvNMax(scalarValue45, 0.0)) * 2.2000000476837158203125) : ((scalarValue45 <= 0.040449999272823333740234375) ? (scalarValue45 * 0.077399380505084991455078125) : exp2(log2((scalarValue45 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))));
    float multiplyAddValue55 = fma(sumValue17, 0.039999999105930328369140625, productValue131 * (comparisonValue21 ? exp2(log2(spvNMax(scalarValue46, 0.0)) * 2.2000000476837158203125) : ((scalarValue46 <= 0.040449999272823333740234375) ? (scalarValue46 * 0.077399380505084991455078125) : exp2(log2((scalarValue46 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))));
    bool conditionValue3 = fragmentScalarConstants1.packedValues[108u] > 0.0;
    float sampledTextureValue6;
    if (conditionValue3)
    {
        sampledTextureValue6 = texture(sampler2D(materialTexture6, textureSampler6), vec2(0.5)).x;
    }
    else
    {
        sampledTextureValue6 = 0.0;
    }
    float multiplyAddValue56 = spvNClamp(fma(rdEvaluateFloatExpression(sampledTextureValue22.w & 255u), 0.062745101749897003173828125, -fragmentScalarConstants1.packedValues[89u]) / spvNMax(fragmentScalarConstants1.packedValues[88u] - fragmentScalarConstants1.packedValues[89u], 1.0), 0.0, 1.0);
    float productValue134 = (multiplyAddValue56 * (multiplyAddValue56 * multiplyAddValue56)) * fragmentScalarConstants1.packedValues[116u];
    vec3 vectorValue7 = vec3(quotientValue16, quotientValue17, quotientValue18);
    bool comparisonValue22 = fragmentScalarConstants1.packedValues[116u] != 0.0;
    vec3 vectorValue8 = vec3(productValue128, productValue129, productValue130);
    vec3 productValue135 = vec3(inverseLengthValue19 * multiplyAddValue50, inverseLengthValue19 * multiplyAddValue51, inverseLengthValue19 * multiplyAddValue52);
    float multiplyAddValue41;
    float multiplyAddValue43;
    float multiplyAddValue45;
    if ((fragmentScalarConstants1.packedValues[124u] != 0.0) && comparisonValue22)
    {
        bool conditionValue4 = fragmentScalarConstants1.packedValues[67u] > 0.0;
        float multiplyAddValue57 = fma(fragmentScalarConstants1.packedValues[43u], multiplyAddValue49, fma(fragmentScalarConstants1.packedValues[35u], multiplyAddValue47, multiplyAddValue48 * fragmentScalarConstants1.packedValues[39u])) + fragmentScalarConstants1.packedValues[47u];
        float multiplyAddValue58 = conditionValue4 ? (fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) : quotientValue16;
        float multiplyAddValue59 = conditionValue4 ? (fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) : quotientValue17;
        float multiplyAddValue60 = conditionValue4 ? (fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) : quotientValue18;
        float comparisonValue23 = (conditionValue4 ? multiplyAddValue47 : multiplyAddValue26) - fragmentVectorConstants1.packedValues[7u].x;
        float comparisonValue24 = (conditionValue4 ? multiplyAddValue48 : multiplyAddValue27) - fragmentVectorConstants1.packedValues[7u].y;
        float comparisonValue25 = (conditionValue4 ? multiplyAddValue49 : multiplyAddValue28) - fragmentVectorConstants1.packedValues[7u].z;
        vec3 vectorValue9 = vec3(comparisonValue23, comparisonValue24, comparisonValue25);
        float inverseLengthValue20 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
        float productValue136 = inverseLengthValue20 * comparisonValue23;
        float productValue137 = inverseLengthValue20 * comparisonValue24;
        float productValue138 = inverseLengthValue20 * comparisonValue25;
        vec3 vectorValue10 = vec3(multiplyAddValue58, multiplyAddValue59, multiplyAddValue60);
        float inverseLengthValue21 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
        vec4 sampledTextureValue23 = texture(sampler2D(materialTexture7, textureSampler7), vec2((conditionValue4 ? ((((fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[8u].x, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue57) + 1.0) * 0.5) : fma(varyingColor1.x, 0.5, 0.5)) * fragmentVectorConstants1.packedValues[33u].x, (conditionValue4 ? ((1.0 - ((fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[8u].y, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue57)) * 0.5) : fma(varyingColor1.y, -0.5, 0.5)) * fragmentVectorConstants1.packedValues[33u].y));
        float scalarValue51 = sampledTextureValue23.x;
        float scalarValue52 = sampledTextureValue23.y;
        float scalarValue53 = sampledTextureValue23.z;
        float quotientValue24 = (0.180000007152557373046875 / sampledTextureValue6) + 9.9999997473787516355514526367188e-05;
        float scalarValue54 = rdDot3Precise2(vec3(productValue136, productValue137, productValue138), vectorValue8);
        float sumValue18 = -(scalarValue54 + scalarValue54);
        float multiplyAddValue61 = fma(productValue128, sumValue18, productValue136);
        float multiplyAddValue62 = fma(productValue129, sumValue18, productValue137);
        float multiplyAddValue63 = fma(productValue130, sumValue18, productValue138);
        float multiplyAddValue67 = fma(-scalarValue50, 0.0039215688593685626983642578125, 1.0);
        float productValue139 = multiplyAddValue67 * multiplyAddValue67;
        float sumValue19 = fragmentScalarConstants1.packedValues[117u] - 1.0;
        float productValue140 = productValue139 * productValue139;
        float multiplyAddValue68 = (uint(int(fragmentScalarConstants1.packedValues[104u])) == 1u) ? (fma(-multiplyAddValue67, multiplyAddValue67, 1.0) * sumValue19) : (sumValue19 * fma(-productValue140, productValue140, 1.0));
        uint sumValue20 = uint(int(fragmentScalarConstants1.packedValues[80u])) + 2u;
        uint scalarValue55 = uint(abs(int(sumValue20))) % 3u;
        vec4 sampledTextureValue24 = textureLod(samplerCubeArray(materialTexture12, textureSampler12), vec4(multiplyAddValue61, multiplyAddValue62, multiplyAddValue63, trunc(fragmentScalarConstants1.packedValues[80u])), multiplyAddValue68);
        vec4 sampledTextureValue25 = textureLod(samplerCubeArray(materialTexture12, textureSampler12), vec4(multiplyAddValue61, multiplyAddValue62, multiplyAddValue63, rdSignedBitsToFloat(((sumValue20 & 2147483648u) != 0u) ? (-scalarValue55) : scalarValue55)), multiplyAddValue68);
        float scalarValue56 = sampledTextureValue25.x;
        float scalarValue57 = sampledTextureValue25.y;
        float scalarValue58 = sampledTextureValue25.z;
        float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[119u], sampledTextureValue24.x - scalarValue56, scalarValue56);
        float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[119u], sampledTextureValue24.y - scalarValue57, scalarValue57);
        float multiplyAddValue71 = fma(fragmentScalarConstants1.packedValues[119u], sampledTextureValue24.z - scalarValue58, scalarValue58);
        float comparisonValue26 = (productValue134 * (conditionValue3 ? (multiplyAddValue69 * 301.72412109375) : multiplyAddValue69)) * fragmentScalarConstants1.packedValues[118u];
        float comparisonValue27 = (productValue134 * (conditionValue3 ? (multiplyAddValue70 * 301.72412109375) : multiplyAddValue70)) * fragmentScalarConstants1.packedValues[118u];
        float comparisonValue28 = (productValue134 * (conditionValue3 ? (multiplyAddValue71 * 301.72412109375) : multiplyAddValue71)) * fragmentScalarConstants1.packedValues[118u];
        float productValue141 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].x;
        float productValue142 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].y;
        float productValue143 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].z;
        float productValue144 = productValue132 * fragmentScalarConstants1.packedValues[71u];
        float productValue145 = bitwiseValue7 * fragmentScalarConstants1.packedValues[71u];
        float productValue146 = productValue133 * fragmentScalarConstants1.packedValues[71u];
        float productValue147 = spvNClamp(rdDot3Precise2(vec3(productValue144 * fragmentScalarConstants1.packedValues[96u], productValue145 * fragmentScalarConstants1.packedValues[96u], productValue146 * fragmentScalarConstants1.packedValues[96u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
        float multiplyAddValue72 = productValue131 * fma(productValue147, fma(fragmentScalarConstants1.packedValues[96u], productValue144, -productValue141), productValue141);
        float multiplyAddValue73 = productValue131 * fma(productValue147, fma(fragmentScalarConstants1.packedValues[96u], productValue145, -productValue142), productValue142);
        float multiplyAddValue74 = productValue131 * fma(productValue147, fma(fragmentScalarConstants1.packedValues[96u], productValue146, -productValue143), productValue143);
        bool comparisonValue29 = (fragmentScalarConstants1.packedValues[115u] != 0.0) && (rdDot3Precise2(vec3(comparisonValue26, comparisonValue27, comparisonValue28), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < rdDot3Precise2(vec3(multiplyAddValue72, multiplyAddValue73, multiplyAddValue74), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)));
        float comparisonValue30 = comparisonValue29 ? multiplyAddValue72 : comparisonValue26;
        float comparisonValue31 = comparisonValue29 ? multiplyAddValue73 : comparisonValue27;
        float comparisonValue32 = comparisonValue29 ? multiplyAddValue74 : comparisonValue28;
        float productValue148 = sampledTextureValue23.w * fragmentScalarConstants1.packedValues[125u];
        vec4 sampledTextureValue26 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(productValue135, vec3(-(inverseLengthValue21 * multiplyAddValue58), -(inverseLengthValue21 * multiplyAddValue59), -(inverseLengthValue21 * multiplyAddValue60))), 0.0, 1.0), multiplyAddValue67));
        float scalarValue59 = sampledTextureValue26.x;
        float scalarValue60 = sampledTextureValue26.y;
        multiplyAddValue41 = fma(multiplyAddValue55, scalarValue59, scalarValue60) * fma(productValue148, (conditionValue3 ? (scalarValue53 / quotientValue24) : scalarValue53) - comparisonValue32, comparisonValue32);
        multiplyAddValue43 = fma(multiplyAddValue54, scalarValue59, scalarValue60) * fma(productValue148, (conditionValue3 ? (scalarValue52 / quotientValue24) : scalarValue52) - comparisonValue31, comparisonValue31);
        multiplyAddValue45 = fma(multiplyAddValue53, scalarValue59, scalarValue60) * fma(productValue148, (conditionValue3 ? (scalarValue51 / quotientValue24) : scalarValue51) - comparisonValue30, comparisonValue30);
    }
    else
    {
        float multiplyAddValue42;
        float multiplyAddValue44;
        float multiplyAddValue46;
        if (comparisonValue22)
        {
            bool conditionValue5 = fragmentScalarConstants1.packedValues[67u] > 0.0;
            float multiplyAddValue75 = conditionValue5 ? (fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) : quotientValue16;
            float multiplyAddValue76 = conditionValue5 ? (fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) : quotientValue17;
            float multiplyAddValue77 = conditionValue5 ? (fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) : quotientValue18;
            float comparisonValue33 = (conditionValue5 ? multiplyAddValue47 : multiplyAddValue26) - fragmentVectorConstants1.packedValues[7u].x;
            float comparisonValue34 = (conditionValue5 ? multiplyAddValue48 : multiplyAddValue27) - fragmentVectorConstants1.packedValues[7u].y;
            float comparisonValue35 = (conditionValue5 ? multiplyAddValue49 : multiplyAddValue28) - fragmentVectorConstants1.packedValues[7u].z;
            vec3 vectorValue11 = vec3(comparisonValue33, comparisonValue34, comparisonValue35);
            float inverseLengthValue22 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
            float productValue149 = comparisonValue33 * inverseLengthValue22;
            float productValue150 = comparisonValue34 * inverseLengthValue22;
            float productValue151 = comparisonValue35 * inverseLengthValue22;
            vec3 vectorValue12 = vec3(multiplyAddValue75, multiplyAddValue76, multiplyAddValue77);
            float inverseLengthValue23 = inversesqrt(rdDot3Precise2(vectorValue12, vectorValue12));
            float scalarValue61 = rdDot3Precise2(vec3(productValue149, productValue150, productValue151), vectorValue8);
            float sumValue21 = -(scalarValue61 + scalarValue61);
            float multiplyAddValue78 = fma(productValue128, sumValue21, productValue149);
            float multiplyAddValue79 = fma(productValue129, sumValue21, productValue150);
            float multiplyAddValue80 = fma(productValue130, sumValue21, productValue151);
            float multiplyAddValue81 = fma(-scalarValue50, 0.0039215688593685626983642578125, 1.0);
            float productValue152 = multiplyAddValue81 * multiplyAddValue81;
            float sumValue22 = fragmentScalarConstants1.packedValues[117u] - 1.0;
            float productValue153 = productValue152 * productValue152;
            float multiplyAddValue82 = (uint(int(fragmentScalarConstants1.packedValues[104u])) == 1u) ? (fma(-multiplyAddValue81, multiplyAddValue81, 1.0) * sumValue22) : (fma(-productValue153, productValue153, 1.0) * sumValue22);
            uint sumValue23 = uint(int(fragmentScalarConstants1.packedValues[80u])) + 2u;
            uint scalarValue62 = uint(abs(int(sumValue23))) % 3u;
            vec4 sampledTextureValue27 = textureLod(samplerCubeArray(materialTexture12, textureSampler12), vec4(multiplyAddValue78, multiplyAddValue79, multiplyAddValue80, trunc(fragmentScalarConstants1.packedValues[80u])), multiplyAddValue82);
            vec4 sampledTextureValue28 = textureLod(samplerCubeArray(materialTexture12, textureSampler12), vec4(multiplyAddValue78, multiplyAddValue79, multiplyAddValue80, rdSignedBitsToFloat(((sumValue23 & 2147483648u) != 0u) ? (-scalarValue62) : scalarValue62)), multiplyAddValue82);
            float scalarValue63 = sampledTextureValue28.x;
            float scalarValue64 = sampledTextureValue28.y;
            float scalarValue65 = sampledTextureValue28.z;
            float multiplyAddValue83 = fma(fragmentScalarConstants1.packedValues[119u], sampledTextureValue27.x - scalarValue63, scalarValue63);
            float multiplyAddValue84 = fma(fragmentScalarConstants1.packedValues[119u], sampledTextureValue27.y - scalarValue64, scalarValue64);
            float multiplyAddValue85 = fma(fragmentScalarConstants1.packedValues[119u], sampledTextureValue27.z - scalarValue65, scalarValue65);
            float comparisonValue36 = (productValue134 * (conditionValue3 ? (multiplyAddValue83 * 301.72412109375) : multiplyAddValue83)) * fragmentScalarConstants1.packedValues[118u];
            float comparisonValue37 = (productValue134 * (conditionValue3 ? (multiplyAddValue84 * 301.72412109375) : multiplyAddValue84)) * fragmentScalarConstants1.packedValues[118u];
            float comparisonValue38 = (productValue134 * (conditionValue3 ? (multiplyAddValue85 * 301.72412109375) : multiplyAddValue85)) * fragmentScalarConstants1.packedValues[118u];
            float productValue154 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].x;
            float productValue155 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].y;
            float productValue156 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].z;
            float productValue157 = productValue132 * fragmentScalarConstants1.packedValues[71u];
            float productValue158 = bitwiseValue7 * fragmentScalarConstants1.packedValues[71u];
            float productValue159 = productValue133 * fragmentScalarConstants1.packedValues[71u];
            float productValue160 = spvNClamp(rdDot3Precise2(vec3(productValue157 * fragmentScalarConstants1.packedValues[96u], productValue158 * fragmentScalarConstants1.packedValues[96u], productValue159 * fragmentScalarConstants1.packedValues[96u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
            float multiplyAddValue86 = productValue131 * fma(productValue160, fma(fragmentScalarConstants1.packedValues[96u], productValue157, -productValue154), productValue154);
            float multiplyAddValue87 = productValue131 * fma(productValue160, fma(fragmentScalarConstants1.packedValues[96u], productValue158, -productValue155), productValue155);
            float multiplyAddValue88 = productValue131 * fma(productValue160, fma(fragmentScalarConstants1.packedValues[96u], productValue159, -productValue156), productValue156);
            bool comparisonValue39 = (fragmentScalarConstants1.packedValues[115u] != 0.0) && (rdDot3Precise2(vec3(comparisonValue36, comparisonValue37, comparisonValue38), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < rdDot3Precise2(vec3(multiplyAddValue86, multiplyAddValue87, multiplyAddValue88), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)));
            vec4 sampledTextureValue29 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(productValue135, vec3(-(inverseLengthValue23 * multiplyAddValue75), -(inverseLengthValue23 * multiplyAddValue76), -(inverseLengthValue23 * multiplyAddValue77))), 0.0, 1.0), multiplyAddValue81));
            float scalarValue66 = sampledTextureValue29.x;
            float scalarValue67 = sampledTextureValue29.y;
            multiplyAddValue46 = (comparisonValue39 ? multiplyAddValue86 : comparisonValue36) * fma(multiplyAddValue53, scalarValue66, scalarValue67);
            multiplyAddValue44 = (comparisonValue39 ? multiplyAddValue87 : comparisonValue37) * fma(multiplyAddValue54, scalarValue66, scalarValue67);
            multiplyAddValue42 = (comparisonValue39 ? multiplyAddValue88 : comparisonValue38) * fma(multiplyAddValue55, scalarValue66, scalarValue67);
        }
        else
        {
            float multiplyAddValue64;
            float multiplyAddValue65;
            float multiplyAddValue66;
            if (fragmentScalarConstants1.packedValues[115u] != 0.0)
            {
                bool conditionValue6 = fragmentScalarConstants1.packedValues[67u] > 0.0;
                float multiplyAddValue89 = conditionValue6 ? (fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) : quotientValue16;
                float multiplyAddValue90 = conditionValue6 ? (fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) : quotientValue17;
                float multiplyAddValue91 = conditionValue6 ? (fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) : quotientValue18;
                vec3 vectorValue13 = vec3(multiplyAddValue89, multiplyAddValue90, multiplyAddValue91);
                float inverseLengthValue24 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
                float productValue161 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].x;
                float productValue162 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].y;
                float productValue163 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].z;
                float productValue164 = productValue132 * fragmentScalarConstants1.packedValues[71u];
                float productValue165 = bitwiseValue7 * fragmentScalarConstants1.packedValues[71u];
                float productValue166 = productValue133 * fragmentScalarConstants1.packedValues[71u];
                float productValue167 = spvNClamp(rdDot3Precise2(vec3(productValue164 * fragmentScalarConstants1.packedValues[96u], productValue165 * fragmentScalarConstants1.packedValues[96u], productValue166 * fragmentScalarConstants1.packedValues[96u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
                float multiplyAddValue92 = productValue131 * fma(productValue167, fma(fragmentScalarConstants1.packedValues[96u], productValue164, -productValue161), productValue161);
                float multiplyAddValue93 = productValue131 * fma(productValue167, fma(fragmentScalarConstants1.packedValues[96u], productValue165, -productValue162), productValue162);
                float multiplyAddValue94 = productValue131 * fma(productValue167, fma(fragmentScalarConstants1.packedValues[96u], productValue166, -productValue163), productValue163);
                bool conditionValue7 = rdDot3Precise2(vec3(multiplyAddValue92, multiplyAddValue93, multiplyAddValue94), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) > 0.0;
                vec4 sampledTextureValue30 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(productValue135, vec3(-(multiplyAddValue89 * inverseLengthValue24), -(multiplyAddValue90 * inverseLengthValue24), -(multiplyAddValue91 * inverseLengthValue24))), 0.0, 1.0), fma(-scalarValue50, 0.0039215688593685626983642578125, 1.0)));
                float scalarValue68 = sampledTextureValue30.x;
                float scalarValue69 = sampledTextureValue30.y;
                multiplyAddValue64 = conditionValue7 ? (fma(multiplyAddValue53, scalarValue68, scalarValue69) * multiplyAddValue92) : 0.0;
                multiplyAddValue65 = conditionValue7 ? (fma(multiplyAddValue54, scalarValue68, scalarValue69) * multiplyAddValue93) : 0.0;
                multiplyAddValue66 = conditionValue7 ? (fma(multiplyAddValue55, scalarValue68, scalarValue69) * multiplyAddValue94) : 0.0;
            }
            else
            {
                multiplyAddValue64 = 0.0;
                multiplyAddValue65 = 0.0;
                multiplyAddValue66 = 0.0;
            }
            multiplyAddValue46 = multiplyAddValue64;
            multiplyAddValue44 = multiplyAddValue65;
            multiplyAddValue42 = multiplyAddValue66;
        }
        multiplyAddValue41 = multiplyAddValue42;
        multiplyAddValue43 = multiplyAddValue44;
        multiplyAddValue45 = multiplyAddValue46;
    }
    bool comparisonValue40 = fragmentScalarConstants1.packedValues[92u] != 0.0;
    float nonlinearValue1 = ((sqrt(rdDot3Precise2(vectorValue7, vectorValue7)) / fragmentScalarConstants1.packedValues[86u]) + fragmentScalarConstants1.packedValues[120u]) - fragmentScalarConstants1.packedValues[84u];
    float productValue168 = 1.0 - spvNClamp(nonlinearValue1 * fragmentScalarConstants1.packedValues[85u], 0.0, 1.0);
    float quotientValue25 = 1.0 - spvNClamp(nonlinearValue1 / (fragmentScalarConstants1.packedValues[85u] - fragmentScalarConstants1.packedValues[84u]), 0.0, 1.0);
    float comparisonValue41 = comparisonValue40 ? (productValue168 * multiplyAddValue45) : (quotientValue25 * multiplyAddValue45);
    float comparisonValue42 = comparisonValue40 ? (productValue168 * multiplyAddValue43) : (quotientValue25 * multiplyAddValue43);
    float comparisonValue43 = comparisonValue40 ? (productValue168 * multiplyAddValue41) : (quotientValue25 * multiplyAddValue41);
    float productValue47;
    float productValue48;
    float productValue49;
    if (fragmentScalarConstants1.packedValues[144u] != 0.0)
    {
        float multiplyAddValue95 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, scalarValue34, fma(fragmentVectorConstants1.packedValues[12u].z, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, scalarValue34, fma(fragmentVectorConstants1.packedValues[12u].w, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[140u]) / (fragmentScalarConstants1.packedValues[141u] - fragmentScalarConstants1.packedValues[140u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[138u]), -0.5);
        uint sumValue24 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[138u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue95))), int(0u))))));
        float scalarValue70 = rdSignedBitsToFloat(sumValue24);
        float multiplyAddValue96 = fma(varyingColor1.x, 0.5, 0.5);
        float multiplyAddValue97 = fma(varyingColor1.y, 0.5, 0.5);
        vec4 sampledTextureValue31 = textureLod(sampler2DArray(materialTexture10, textureSampler10), vec3(multiplyAddValue96, multiplyAddValue97, scalarValue70), 0.0);
        float scalarValue71 = sampledTextureValue31.w;
        float sampledTextureValue32 = fma(spvNClamp(multiplyAddValue95 - scalarValue70, 0.0, 1.0), textureLod(sampler2DArray(materialTexture10, textureSampler10), vec3(multiplyAddValue96, multiplyAddValue97, rdSignedBitsToFloat(sumValue24 + 1u)), 0.0).w - scalarValue71, scalarValue71);
        productValue47 = comparisonValue43 * sampledTextureValue32;
        productValue48 = comparisonValue42 * sampledTextureValue32;
        productValue49 = comparisonValue41 * sampledTextureValue32;
    }
    else
    {
        productValue47 = comparisonValue43;
        productValue48 = comparisonValue42;
        productValue49 = comparisonValue41;
    }
    float quotientValue26 = (0.180000007152557373046875 / sampledTextureValue6) + 9.9999997473787516355514526367188e-05;
    fragmentColor0.x = conditionValue3 ? (quotientValue26 * productValue49) : productValue49;
    fragmentColor0.y = conditionValue3 ? (quotientValue26 * productValue48) : productValue48;
    fragmentColor0.z = conditionValue3 ? (quotientValue26 * productValue47) : productValue47;
    fragmentColor0.w = 1.0;
#elif (RD_OPTION_MODE == RD_MODE_MIXED_RES && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue247 = (floor(varyingTexCoord0.x * fragmentVectorConstants1.packedValues[29u].x) + 0.5) * fragmentVectorConstants1.packedValues[29u].z;
    float productValue248 = (floor(varyingTexCoord0.y * fragmentVectorConstants1.packedValues[29u].y) + 0.5) * fragmentVectorConstants1.packedValues[29u].w;
    vec4 sampledTextureValue47 = texture(sampler2D(materialTexture3, textureSampler3), vec2(productValue247, productValue248));
    float scalarValue102 = sampledTextureValue47.x;
    float scalarValue103 = sampledTextureValue47.y;
    vec4 sampledTextureValue48 = texture(sampler2D(materialTexture8, textureSampler8), vec2(productValue247, productValue248));
    float scalarValue104 = sampledTextureValue48.x;
    float multiplyAddValue112 = fma(scalarValue104, fragmentScalarConstants1.packedValues[59u], fragmentScalarConstants1.packedValues[63u]);
    float quotientValue38 = (varyingColor1.x * fragmentScalarConstants1.packedValues[48u]) / multiplyAddValue112;
    float quotientValue39 = (varyingColor1.y * fragmentScalarConstants1.packedValues[53u]) / multiplyAddValue112;
    float quotientValue40 = fragmentScalarConstants1.packedValues[62u] / multiplyAddValue112;
    float multiplyAddValue113 = fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue40, fma(fragmentVectorConstants1.packedValues[4u].x, quotientValue38, quotientValue39 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue114 = fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue40, fma(fragmentVectorConstants1.packedValues[4u].y, quotientValue38, quotientValue39 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue115 = fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue40, fma(fragmentVectorConstants1.packedValues[4u].z, quotientValue38, quotientValue39 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float quotientValue41 = ((varyingColor1.y - fragmentScalarConstants1.packedValues[133u]) * fragmentScalarConstants1.packedValues[53u]) / multiplyAddValue112;
    float quotientValue42 = ((varyingColor1.x + fragmentScalarConstants1.packedValues[132u]) * fragmentScalarConstants1.packedValues[48u]) / multiplyAddValue112;
    float multiplyAddValue116 = (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue40, fma(fragmentVectorConstants1.packedValues[4u].x, quotientValue42, quotientValue41 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[38u].x;
    float multiplyAddValue117 = (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue40, fma(fragmentVectorConstants1.packedValues[4u].y, quotientValue42, quotientValue41 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) - fragmentVectorConstants1.packedValues[38u].y;
    float multiplyAddValue118 = (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue40, fma(fragmentVectorConstants1.packedValues[4u].z, quotientValue42, quotientValue41 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) - fragmentVectorConstants1.packedValues[38u].z;
    float scalarValue105 = dFdxCoarse(quotientValue40);
    float scalarValue106 = dFdxCoarse(quotientValue42);
    float scalarValue107 = dFdxCoarse(quotientValue41);
    vec3 vectorValue14 = vec3(scalarValue105, scalarValue106, scalarValue107);
    float inverseLengthValue33 = inversesqrt(rdDot3Precise2(vectorValue14, vectorValue14));
    float productValue249 = inverseLengthValue33 * scalarValue105;
    float productValue250 = inverseLengthValue33 * scalarValue106;
    float productValue251 = inverseLengthValue33 * scalarValue107;
    float scalarValue108 = dFdyCoarse(-quotientValue41);
    float scalarValue109 = dFdyCoarse(-quotientValue40);
    float scalarValue110 = dFdyCoarse(-quotientValue42);
    vec3 vectorValue15 = vec3(scalarValue108, scalarValue109, scalarValue110);
    float inverseLengthValue34 = inversesqrt(rdDot3Precise2(vectorValue15, vectorValue15));
    float productValue252 = scalarValue108 * inverseLengthValue34;
    float productValue253 = scalarValue109 * inverseLengthValue34;
    float productValue254 = scalarValue110 * inverseLengthValue34;
    float multiplyAddValue119 = fma(productValue251, productValue253, -(productValue252 * productValue249));
    float multiplyAddValue120 = fma(productValue249, productValue254, -(productValue253 * productValue250));
    float multiplyAddValue121 = fma(productValue250, productValue252, -(productValue254 * productValue251));
    vec3 vectorValue16 = vec3(multiplyAddValue119, multiplyAddValue120, multiplyAddValue121);
    float inverseLengthValue35 = inversesqrt(rdDot3Precise2(vectorValue16, vectorValue16));
    float productValue255 = multiplyAddValue119 * inverseLengthValue35;
    float productValue256 = multiplyAddValue120 * inverseLengthValue35;
    float productValue257 = multiplyAddValue121 * inverseLengthValue35;
    float multiplyAddValue122 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue257, fma(fragmentVectorConstants1.packedValues[4u].x, productValue255, productValue256 * fragmentVectorConstants1.packedValues[5u].x));
    float multiplyAddValue123 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue257, fma(fragmentVectorConstants1.packedValues[4u].y, productValue255, productValue256 * fragmentVectorConstants1.packedValues[5u].y));
    float multiplyAddValue124 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue257, fma(fragmentVectorConstants1.packedValues[4u].z, productValue255, productValue256 * fragmentVectorConstants1.packedValues[5u].z));
    vec3 vectorValue17 = vec3(multiplyAddValue122, multiplyAddValue123, multiplyAddValue124);
    float inverseLengthValue36 = inversesqrt(rdDot3Precise2(vectorValue17, vectorValue17));
    float quotientValue43 = roundEven((multiplyAddValue122 * inverseLengthValue36) / fragmentScalarConstants1.packedValues[72u]) * fragmentScalarConstants1.packedValues[72u];
    float quotientValue44 = roundEven((multiplyAddValue123 * inverseLengthValue36) / fragmentScalarConstants1.packedValues[72u]) * fragmentScalarConstants1.packedValues[72u];
    float quotientValue45 = roundEven((multiplyAddValue124 * inverseLengthValue36) / fragmentScalarConstants1.packedValues[72u]) * fragmentScalarConstants1.packedValues[72u];
    vec3 vectorValue18 = vec3(quotientValue43, quotientValue44, quotientValue45);
    float inverseLengthValue37 = inversesqrt(rdDot3Precise2(vectorValue18, vectorValue18));
    float productValue258 = quotientValue43 * inverseLengthValue37;
    float productValue259 = quotientValue44 * inverseLengthValue37;
    float productValue260 = quotientValue45 * inverseLengthValue37;
    float scalarValue41 = -fragmentScalarConstants1.packedValues[66u];
    float multiplyAddValue125 = fma(fragmentScalarConstants1.packedValues[66u], 0.5, -fma(scalarValue41, floor(multiplyAddValue116 / fragmentScalarConstants1.packedValues[66u]), multiplyAddValue116));
    float multiplyAddValue126 = fma(fragmentScalarConstants1.packedValues[66u], 0.5, -fma(scalarValue41, floor(multiplyAddValue117 / fragmentScalarConstants1.packedValues[66u]), multiplyAddValue117));
    float multiplyAddValue127 = fma(fragmentScalarConstants1.packedValues[66u], 0.5, -fma(scalarValue41, floor(multiplyAddValue118 / fragmentScalarConstants1.packedValues[66u]), multiplyAddValue118));
    float scalarValue111 = -rdDot3Precise2(vec3(multiplyAddValue125, multiplyAddValue126, multiplyAddValue127), vec3(productValue258, productValue259, productValue260));
    float multiplyAddValue128 = (fma(scalarValue111, productValue258, multiplyAddValue125) + multiplyAddValue116) + fragmentVectorConstants1.packedValues[38u].x;
    float multiplyAddValue129 = (fma(scalarValue111, productValue259, multiplyAddValue126) + multiplyAddValue117) + fragmentVectorConstants1.packedValues[38u].y;
    float multiplyAddValue130 = (fma(scalarValue111, productValue260, multiplyAddValue127) + multiplyAddValue118) + fragmentVectorConstants1.packedValues[38u].z;
    float scalarValue112 = abs(scalarValue103);
    float sumValue33 = 1.0 - abs(scalarValue102);
    float sumValue34 = sumValue33 - scalarValue112;
    bool conditionValue9 = sumValue34 < 0.0;
    float comparisonValue56 = conditionValue9 ? (((scalarValue102 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue112)) : scalarValue102;
    float comparisonValue57 = conditionValue9 ? (((scalarValue103 >= 0.0) ? 1.0 : (-1.0)) * sumValue33) : scalarValue103;
    vec3 vectorValue19 = vec3(comparisonValue56, comparisonValue57, sumValue34);
    float inverseLengthValue38 = inversesqrt(rdDot3Precise2(vectorValue19, vectorValue19));
    float productValue261 = inverseLengthValue38 * comparisonValue56;
    float productValue262 = inverseLengthValue38 * comparisonValue57;
    float productValue263 = inverseLengthValue38 * sumValue34;
    float multiplyAddValue131 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue263, fma(fragmentVectorConstants1.packedValues[0u].x, productValue261, productValue262 * fragmentVectorConstants1.packedValues[1u].x));
    float multiplyAddValue132 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue263, fma(fragmentVectorConstants1.packedValues[0u].y, productValue261, productValue262 * fragmentVectorConstants1.packedValues[1u].y));
    float multiplyAddValue133 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue263, fma(fragmentVectorConstants1.packedValues[0u].z, productValue261, productValue262 * fragmentVectorConstants1.packedValues[1u].z));
    vec3 vectorValue20 = vec3(multiplyAddValue131, multiplyAddValue132, multiplyAddValue133);
    float inverseLengthValue39 = inversesqrt(rdDot3Precise2(vectorValue20, vectorValue20));
    vec4 sampledTextureValue49 = texture(sampler2D(materialTexture1, textureSampler1), vec2(productValue247, productValue248));
    float scalarValue113 = sampledTextureValue49.x;
    float scalarValue114 = sampledTextureValue49.y;
    float scalarValue115 = sampledTextureValue49.z;
    float productValue264 = spvNClamp((sampledTextureValue49.w - 0.501960813999176025390625) * 2.007874011993408203125, 0.0, 1.0);
    bool sampledTextureValue20 = uint(textureQueryLevels(intermediateValue2)) > 0u;
    uvec2 sampledTextureValue21 = uvec2(textureSize(intermediateValue2, int(0u)));
    uint scalarValue47 = sampledTextureValue21.x;
    uvec4 sampledTextureValue50 = texelFetch(intermediateValue2, ivec2(uvec2(uint(int(productValue247 * rdEvaluateFloatExpression(sampledTextureValue20 ? scalarValue47 : 0u))), uint(int(productValue248 * rdEvaluateFloatExpression(sampledTextureValue20 ? sampledTextureValue21.y : 0u))))), int(0u));
    uint scalarValue116 = sampledTextureValue50.y;
    uint scalarValue117 = sampledTextureValue50.z;
    float scalarValue118 = rdEvaluateFloatExpression(bitfieldExtract(sampledTextureValue50.x, int(8u), int(8u)));
    float bitwiseValue14 = rdEvaluateFloatExpression(scalarValue117 & 255u) * 0.0039215688593685626983642578125;
    float productValue265 = (bitwiseValue14 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue116, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * 6.0;
    float bitwiseValue15 = (bitwiseValue14 * (rdEvaluateFloatExpression(scalarValue116 & 255u) * 0.0039215688593685626983642578125)) * 6.0;
    float productValue266 = (bitwiseValue14 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue117, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * 6.0;
    bool comparisonValue21 = fragmentScalarConstants1.packedValues[100u] != 0.0;
    float sumValue35 = 1.0 - productValue264;
    float multiplyAddValue134 = fma(sumValue35, 0.039999999105930328369140625, productValue264 * (comparisonValue21 ? exp2(log2(spvNMax(scalarValue113, 0.0)) * 2.2000000476837158203125) : ((scalarValue113 <= 0.040449999272823333740234375) ? (scalarValue113 * 0.077399380505084991455078125) : exp2(log2((scalarValue113 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))));
    float multiplyAddValue135 = fma(sumValue35, 0.039999999105930328369140625, productValue264 * (comparisonValue21 ? exp2(log2(spvNMax(scalarValue114, 0.0)) * 2.2000000476837158203125) : ((scalarValue114 <= 0.040449999272823333740234375) ? (scalarValue114 * 0.077399380505084991455078125) : exp2(log2((scalarValue114 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))));
    float multiplyAddValue136 = fma(sumValue35, 0.039999999105930328369140625, productValue264 * (comparisonValue21 ? exp2(log2(spvNMax(scalarValue115, 0.0)) * 2.2000000476837158203125) : ((scalarValue115 <= 0.040449999272823333740234375) ? (scalarValue115 * 0.077399380505084991455078125) : exp2(log2((scalarValue115 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625))));
    bool conditionValue3 = fragmentScalarConstants1.packedValues[108u] > 0.0;
    float sampledTextureValue6;
    if (conditionValue3)
    {
        sampledTextureValue6 = texture(sampler2D(materialTexture6, textureSampler6), vec2(0.5)).x;
    }
    else
    {
        sampledTextureValue6 = 0.0;
    }
    float multiplyAddValue137 = spvNClamp(fma(rdEvaluateFloatExpression(sampledTextureValue50.w & 255u), 0.062745101749897003173828125, -fragmentScalarConstants1.packedValues[89u]) / spvNMax(fragmentScalarConstants1.packedValues[88u] - fragmentScalarConstants1.packedValues[89u], 1.0), 0.0, 1.0);
    float productValue267 = (multiplyAddValue137 * (multiplyAddValue137 * multiplyAddValue137)) * fragmentScalarConstants1.packedValues[120u];
    vec3 vectorValue21 = vec3(quotientValue38, quotientValue39, quotientValue40);
    bool comparisonValue58 = fragmentScalarConstants1.packedValues[120u] != 0.0;
    vec3 vectorValue22 = vec3(productValue261, productValue262, productValue263);
    vec3 productValue268 = vec3(inverseLengthValue39 * multiplyAddValue131, inverseLengthValue39 * multiplyAddValue132, inverseLengthValue39 * multiplyAddValue133);
    float multiplyAddValue41;
    float multiplyAddValue43;
    float multiplyAddValue45;
    if ((fragmentScalarConstants1.packedValues[128u] != 0.0) && comparisonValue58)
    {
        bool conditionValue4 = fragmentScalarConstants1.packedValues[67u] > 0.0;
        float multiplyAddValue138 = fma(fragmentScalarConstants1.packedValues[43u], multiplyAddValue130, fma(fragmentScalarConstants1.packedValues[35u], multiplyAddValue128, multiplyAddValue129 * fragmentScalarConstants1.packedValues[39u])) + fragmentScalarConstants1.packedValues[47u];
        float multiplyAddValue139 = conditionValue4 ? (fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) : quotientValue38;
        float multiplyAddValue140 = conditionValue4 ? (fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) : quotientValue39;
        float multiplyAddValue141 = conditionValue4 ? (fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) : quotientValue40;
        float comparisonValue59 = (conditionValue4 ? multiplyAddValue128 : multiplyAddValue113) - fragmentVectorConstants1.packedValues[7u].x;
        float comparisonValue60 = (conditionValue4 ? multiplyAddValue129 : multiplyAddValue114) - fragmentVectorConstants1.packedValues[7u].y;
        float comparisonValue61 = (conditionValue4 ? multiplyAddValue130 : multiplyAddValue115) - fragmentVectorConstants1.packedValues[7u].z;
        vec3 vectorValue23 = vec3(comparisonValue59, comparisonValue60, comparisonValue61);
        float inverseLengthValue40 = inversesqrt(rdDot3Precise2(vectorValue23, vectorValue23));
        float productValue269 = inverseLengthValue40 * comparisonValue59;
        float productValue270 = inverseLengthValue40 * comparisonValue60;
        float productValue271 = inverseLengthValue40 * comparisonValue61;
        vec3 vectorValue24 = vec3(multiplyAddValue139, multiplyAddValue140, multiplyAddValue141);
        float inverseLengthValue41 = inversesqrt(rdDot3Precise2(vectorValue24, vectorValue24));
        vec4 sampledTextureValue51 = texture(sampler2D(materialTexture7, textureSampler7), vec2((conditionValue4 ? ((((fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[8u].x, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue138) + 1.0) * 0.5) : fma(varyingColor1.x, 0.5, 0.5)) * fragmentVectorConstants1.packedValues[34u].x, (conditionValue4 ? ((1.0 - ((fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[8u].y, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue138)) * 0.5) : fma(varyingColor1.y, -0.5, 0.5)) * fragmentVectorConstants1.packedValues[34u].y));
        float scalarValue119 = sampledTextureValue51.x;
        float scalarValue120 = sampledTextureValue51.y;
        float scalarValue121 = sampledTextureValue51.z;
        float quotientValue24 = (0.180000007152557373046875 / sampledTextureValue6) + 9.9999997473787516355514526367188e-05;
        float scalarValue122 = rdDot3Precise2(vec3(productValue269, productValue270, productValue271), vectorValue22);
        float sumValue36 = -(scalarValue122 + scalarValue122);
        float multiplyAddValue142 = fma(productValue261, sumValue36, productValue269);
        float multiplyAddValue143 = fma(productValue262, sumValue36, productValue270);
        float multiplyAddValue144 = fma(productValue263, sumValue36, productValue271);
        float multiplyAddValue145 = fma(-scalarValue118, 0.0039215688593685626983642578125, 1.0);
        float productValue272 = multiplyAddValue145 * multiplyAddValue145;
        float sumValue37 = fragmentScalarConstants1.packedValues[121u] - 1.0;
        float productValue273 = productValue272 * productValue272;
        float multiplyAddValue146 = (uint(int(fragmentScalarConstants1.packedValues[104u])) == 1u) ? (fma(-multiplyAddValue145, multiplyAddValue145, 1.0) * sumValue37) : (sumValue37 * fma(-productValue273, productValue273, 1.0));
        uint sumValue20 = uint(int(fragmentScalarConstants1.packedValues[80u])) + 2u;
        uint scalarValue55 = uint(abs(int(sumValue20))) % 3u;
        vec4 sampledTextureValue52 = textureLod(samplerCubeArray(materialTexture12, textureSampler12), vec4(multiplyAddValue142, multiplyAddValue143, multiplyAddValue144, trunc(fragmentScalarConstants1.packedValues[80u])), multiplyAddValue146);
        vec4 sampledTextureValue53 = textureLod(samplerCubeArray(materialTexture12, textureSampler12), vec4(multiplyAddValue142, multiplyAddValue143, multiplyAddValue144, rdSignedBitsToFloat(((sumValue20 & 2147483648u) != 0u) ? (-scalarValue55) : scalarValue55)), multiplyAddValue146);
        float multiplyAddValue147 = fma(fragmentScalarConstants1.packedValues[123u], sampledTextureValue52.x - sampledTextureValue53.x, sampledTextureValue53.x);
        float multiplyAddValue148 = fma(fragmentScalarConstants1.packedValues[123u], sampledTextureValue52.y - sampledTextureValue53.y, sampledTextureValue53.y);
        float multiplyAddValue149 = fma(fragmentScalarConstants1.packedValues[123u], sampledTextureValue52.z - sampledTextureValue53.z, sampledTextureValue53.z);
        float comparisonValue62 = (productValue267 * (conditionValue3 ? (multiplyAddValue147 * 301.72412109375) : multiplyAddValue147)) * fragmentScalarConstants1.packedValues[122u];
        float comparisonValue63 = (productValue267 * (conditionValue3 ? (multiplyAddValue148 * 301.72412109375) : multiplyAddValue148)) * fragmentScalarConstants1.packedValues[122u];
        float comparisonValue64 = (productValue267 * (conditionValue3 ? (multiplyAddValue149 * 301.72412109375) : multiplyAddValue149)) * fragmentScalarConstants1.packedValues[122u];
        float productValue141 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].x;
        float productValue142 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].y;
        float productValue143 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].z;
        float productValue274 = productValue265 * fragmentScalarConstants1.packedValues[71u];
        float productValue275 = bitwiseValue15 * fragmentScalarConstants1.packedValues[71u];
        float productValue276 = productValue266 * fragmentScalarConstants1.packedValues[71u];
        float productValue277 = spvNClamp(rdDot3Precise2(vec3(productValue274 * fragmentScalarConstants1.packedValues[96u], productValue275 * fragmentScalarConstants1.packedValues[96u], productValue276 * fragmentScalarConstants1.packedValues[96u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
        float multiplyAddValue150 = productValue264 * fma(productValue277, fma(fragmentScalarConstants1.packedValues[96u], productValue274, -productValue141), productValue141);
        float multiplyAddValue151 = productValue264 * fma(productValue277, fma(fragmentScalarConstants1.packedValues[96u], productValue275, -productValue142), productValue142);
        float multiplyAddValue152 = productValue264 * fma(productValue277, fma(fragmentScalarConstants1.packedValues[96u], productValue276, -productValue143), productValue143);
        bool comparisonValue65 = (fragmentScalarConstants1.packedValues[115u] != 0.0) && (rdDot3Precise2(vec3(comparisonValue62, comparisonValue63, comparisonValue64), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < rdDot3Precise2(vec3(multiplyAddValue150, multiplyAddValue151, multiplyAddValue152), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)));
        float comparisonValue66 = comparisonValue65 ? multiplyAddValue150 : comparisonValue62;
        float comparisonValue67 = comparisonValue65 ? multiplyAddValue151 : comparisonValue63;
        float comparisonValue68 = comparisonValue65 ? multiplyAddValue152 : comparisonValue64;
        float productValue278 = sampledTextureValue51.w * fragmentScalarConstants1.packedValues[129u];
        vec4 sampledTextureValue54 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(productValue268, vec3(-(inverseLengthValue41 * multiplyAddValue139), -(inverseLengthValue41 * multiplyAddValue140), -(inverseLengthValue41 * multiplyAddValue141))), 0.0, 1.0), multiplyAddValue145));
        float scalarValue123 = sampledTextureValue54.x;
        float scalarValue124 = sampledTextureValue54.y;
        multiplyAddValue41 = fma(multiplyAddValue136, scalarValue123, scalarValue124) * fma(productValue278, (conditionValue3 ? (scalarValue121 / quotientValue24) : scalarValue121) - comparisonValue68, comparisonValue68);
        multiplyAddValue43 = fma(multiplyAddValue135, scalarValue123, scalarValue124) * fma(productValue278, (conditionValue3 ? (scalarValue120 / quotientValue24) : scalarValue120) - comparisonValue67, comparisonValue67);
        multiplyAddValue45 = fma(multiplyAddValue134, scalarValue123, scalarValue124) * fma(productValue278, (conditionValue3 ? (scalarValue119 / quotientValue24) : scalarValue119) - comparisonValue66, comparisonValue66);
    }
    else
    {
        float multiplyAddValue42;
        float multiplyAddValue44;
        float multiplyAddValue46;
        if (comparisonValue58)
        {
            bool conditionValue5 = fragmentScalarConstants1.packedValues[67u] > 0.0;
            float multiplyAddValue153 = conditionValue5 ? (fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) : quotientValue38;
            float multiplyAddValue154 = conditionValue5 ? (fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) : quotientValue39;
            float multiplyAddValue155 = conditionValue5 ? (fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) : quotientValue40;
            float comparisonValue69 = (conditionValue5 ? multiplyAddValue128 : multiplyAddValue113) - fragmentVectorConstants1.packedValues[7u].x;
            float comparisonValue70 = (conditionValue5 ? multiplyAddValue129 : multiplyAddValue114) - fragmentVectorConstants1.packedValues[7u].y;
            float comparisonValue71 = (conditionValue5 ? multiplyAddValue130 : multiplyAddValue115) - fragmentVectorConstants1.packedValues[7u].z;
            vec3 vectorValue25 = vec3(comparisonValue69, comparisonValue70, comparisonValue71);
            float inverseLengthValue42 = inversesqrt(rdDot3Precise2(vectorValue25, vectorValue25));
            float productValue279 = comparisonValue69 * inverseLengthValue42;
            float productValue280 = comparisonValue70 * inverseLengthValue42;
            float productValue281 = comparisonValue71 * inverseLengthValue42;
            vec3 vectorValue26 = vec3(multiplyAddValue153, multiplyAddValue154, multiplyAddValue155);
            float inverseLengthValue43 = inversesqrt(rdDot3Precise2(vectorValue26, vectorValue26));
            float scalarValue125 = rdDot3Precise2(vec3(productValue279, productValue280, productValue281), vectorValue22);
            float sumValue38 = -(scalarValue125 + scalarValue125);
            float multiplyAddValue156 = fma(productValue261, sumValue38, productValue279);
            float multiplyAddValue157 = fma(productValue262, sumValue38, productValue280);
            float multiplyAddValue158 = fma(productValue263, sumValue38, productValue281);
            float multiplyAddValue159 = fma(-scalarValue118, 0.0039215688593685626983642578125, 1.0);
            float productValue282 = multiplyAddValue159 * multiplyAddValue159;
            float sumValue39 = fragmentScalarConstants1.packedValues[121u] - 1.0;
            float productValue283 = productValue282 * productValue282;
            float multiplyAddValue160 = (uint(int(fragmentScalarConstants1.packedValues[104u])) == 1u) ? (fma(-multiplyAddValue159, multiplyAddValue159, 1.0) * sumValue39) : (fma(-productValue283, productValue283, 1.0) * sumValue39);
            uint sumValue23 = uint(int(fragmentScalarConstants1.packedValues[80u])) + 2u;
            uint scalarValue62 = uint(abs(int(sumValue23))) % 3u;
            vec4 sampledTextureValue55 = textureLod(samplerCubeArray(materialTexture12, textureSampler12), vec4(multiplyAddValue156, multiplyAddValue157, multiplyAddValue158, trunc(fragmentScalarConstants1.packedValues[80u])), multiplyAddValue160);
            vec4 sampledTextureValue56 = textureLod(samplerCubeArray(materialTexture12, textureSampler12), vec4(multiplyAddValue156, multiplyAddValue157, multiplyAddValue158, rdSignedBitsToFloat(((sumValue23 & 2147483648u) != 0u) ? (-scalarValue62) : scalarValue62)), multiplyAddValue160);
            float multiplyAddValue161 = fma(fragmentScalarConstants1.packedValues[123u], sampledTextureValue55.x - sampledTextureValue56.x, sampledTextureValue56.x);
            float multiplyAddValue162 = fma(fragmentScalarConstants1.packedValues[123u], sampledTextureValue55.y - sampledTextureValue56.y, sampledTextureValue56.y);
            float multiplyAddValue163 = fma(fragmentScalarConstants1.packedValues[123u], sampledTextureValue55.z - sampledTextureValue56.z, sampledTextureValue56.z);
            float comparisonValue72 = (productValue267 * (conditionValue3 ? (multiplyAddValue161 * 301.72412109375) : multiplyAddValue161)) * fragmentScalarConstants1.packedValues[122u];
            float comparisonValue73 = (productValue267 * (conditionValue3 ? (multiplyAddValue162 * 301.72412109375) : multiplyAddValue162)) * fragmentScalarConstants1.packedValues[122u];
            float comparisonValue74 = (productValue267 * (conditionValue3 ? (multiplyAddValue163 * 301.72412109375) : multiplyAddValue163)) * fragmentScalarConstants1.packedValues[122u];
            float productValue154 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].x;
            float productValue155 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].y;
            float productValue156 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].z;
            float productValue284 = productValue265 * fragmentScalarConstants1.packedValues[71u];
            float productValue285 = bitwiseValue15 * fragmentScalarConstants1.packedValues[71u];
            float productValue286 = productValue266 * fragmentScalarConstants1.packedValues[71u];
            float productValue287 = spvNClamp(rdDot3Precise2(vec3(productValue284 * fragmentScalarConstants1.packedValues[96u], productValue285 * fragmentScalarConstants1.packedValues[96u], productValue286 * fragmentScalarConstants1.packedValues[96u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
            float multiplyAddValue164 = productValue264 * fma(productValue287, fma(fragmentScalarConstants1.packedValues[96u], productValue284, -productValue154), productValue154);
            float multiplyAddValue165 = productValue264 * fma(productValue287, fma(fragmentScalarConstants1.packedValues[96u], productValue285, -productValue155), productValue155);
            float multiplyAddValue166 = productValue264 * fma(productValue287, fma(fragmentScalarConstants1.packedValues[96u], productValue286, -productValue156), productValue156);
            bool comparisonValue75 = (fragmentScalarConstants1.packedValues[115u] != 0.0) && (rdDot3Precise2(vec3(comparisonValue72, comparisonValue73, comparisonValue74), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < rdDot3Precise2(vec3(multiplyAddValue164, multiplyAddValue165, multiplyAddValue166), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)));
            vec4 sampledTextureValue57 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(productValue268, vec3(-(inverseLengthValue43 * multiplyAddValue153), -(inverseLengthValue43 * multiplyAddValue154), -(inverseLengthValue43 * multiplyAddValue155))), 0.0, 1.0), multiplyAddValue159));
            float scalarValue126 = sampledTextureValue57.x;
            float scalarValue127 = sampledTextureValue57.y;
            multiplyAddValue46 = (comparisonValue75 ? multiplyAddValue164 : comparisonValue72) * fma(multiplyAddValue134, scalarValue126, scalarValue127);
            multiplyAddValue44 = (comparisonValue75 ? multiplyAddValue165 : comparisonValue73) * fma(multiplyAddValue135, scalarValue126, scalarValue127);
            multiplyAddValue42 = (comparisonValue75 ? multiplyAddValue166 : comparisonValue74) * fma(multiplyAddValue136, scalarValue126, scalarValue127);
        }
        else
        {
            float multiplyAddValue64;
            float multiplyAddValue65;
            float multiplyAddValue66;
            if (fragmentScalarConstants1.packedValues[115u] != 0.0)
            {
                bool conditionValue6 = fragmentScalarConstants1.packedValues[67u] > 0.0;
                float multiplyAddValue167 = conditionValue6 ? (fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) : quotientValue38;
                float multiplyAddValue168 = conditionValue6 ? (fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) : quotientValue39;
                float multiplyAddValue169 = conditionValue6 ? (fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue130, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue128, multiplyAddValue129 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) : quotientValue40;
                vec3 vectorValue27 = vec3(multiplyAddValue167, multiplyAddValue168, multiplyAddValue169);
                float inverseLengthValue44 = inversesqrt(rdDot3Precise2(vectorValue27, vectorValue27));
                float productValue161 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].x;
                float productValue162 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].y;
                float productValue163 = fragmentScalarConstants1.packedValues[79u] * fragmentVectorConstants1.packedValues[19u].z;
                float productValue288 = productValue265 * fragmentScalarConstants1.packedValues[71u];
                float productValue289 = bitwiseValue15 * fragmentScalarConstants1.packedValues[71u];
                float productValue290 = productValue266 * fragmentScalarConstants1.packedValues[71u];
                float productValue291 = spvNClamp(rdDot3Precise2(vec3(productValue288 * fragmentScalarConstants1.packedValues[96u], productValue289 * fragmentScalarConstants1.packedValues[96u], productValue290 * fragmentScalarConstants1.packedValues[96u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
                float multiplyAddValue170 = productValue264 * fma(productValue291, fma(fragmentScalarConstants1.packedValues[96u], productValue288, -productValue161), productValue161);
                float multiplyAddValue171 = productValue264 * fma(productValue291, fma(fragmentScalarConstants1.packedValues[96u], productValue289, -productValue162), productValue162);
                float multiplyAddValue172 = productValue264 * fma(productValue291, fma(fragmentScalarConstants1.packedValues[96u], productValue290, -productValue163), productValue163);
                bool conditionValue10 = rdDot3Precise2(vec3(multiplyAddValue170, multiplyAddValue171, multiplyAddValue172), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) > 0.0;
                vec4 sampledTextureValue58 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(productValue268, vec3(-(inverseLengthValue44 * multiplyAddValue167), -(inverseLengthValue44 * multiplyAddValue168), -(inverseLengthValue44 * multiplyAddValue169))), 0.0, 1.0), fma(-scalarValue118, 0.0039215688593685626983642578125, 1.0)));
                float scalarValue128 = sampledTextureValue58.x;
                float scalarValue129 = sampledTextureValue58.y;
                multiplyAddValue64 = conditionValue10 ? (fma(multiplyAddValue134, scalarValue128, scalarValue129) * multiplyAddValue170) : 0.0;
                multiplyAddValue65 = conditionValue10 ? (fma(multiplyAddValue135, scalarValue128, scalarValue129) * multiplyAddValue171) : 0.0;
                multiplyAddValue66 = conditionValue10 ? (fma(multiplyAddValue136, scalarValue128, scalarValue129) * multiplyAddValue172) : 0.0;
            }
            else
            {
                multiplyAddValue64 = 0.0;
                multiplyAddValue65 = 0.0;
                multiplyAddValue66 = 0.0;
            }
            multiplyAddValue46 = multiplyAddValue64;
            multiplyAddValue44 = multiplyAddValue65;
            multiplyAddValue42 = multiplyAddValue66;
        }
        multiplyAddValue41 = multiplyAddValue42;
        multiplyAddValue43 = multiplyAddValue44;
        multiplyAddValue45 = multiplyAddValue46;
    }
    bool comparisonValue40 = fragmentScalarConstants1.packedValues[92u] != 0.0;
    float nonlinearValue3 = ((sqrt(rdDot3Precise2(vectorValue21, vectorValue21)) / fragmentScalarConstants1.packedValues[86u]) + fragmentScalarConstants1.packedValues[124u]) - fragmentScalarConstants1.packedValues[84u];
    float productValue292 = 1.0 - spvNClamp(nonlinearValue3 * fragmentScalarConstants1.packedValues[85u], 0.0, 1.0);
    float quotientValue46 = 1.0 - spvNClamp(nonlinearValue3 / (fragmentScalarConstants1.packedValues[85u] - fragmentScalarConstants1.packedValues[84u]), 0.0, 1.0);
    float comparisonValue76 = comparisonValue40 ? (productValue292 * multiplyAddValue45) : (quotientValue46 * multiplyAddValue45);
    float comparisonValue77 = comparisonValue40 ? (productValue292 * multiplyAddValue43) : (quotientValue46 * multiplyAddValue43);
    float comparisonValue78 = comparisonValue40 ? (productValue292 * multiplyAddValue41) : (quotientValue46 * multiplyAddValue41);
    float productValue49;
    float productValue50;
    float productValue51;
    if (fragmentScalarConstants1.packedValues[148u] != 0.0)
    {
        float multiplyAddValue173 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, scalarValue104, fma(fragmentVectorConstants1.packedValues[12u].z, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, scalarValue104, fma(fragmentVectorConstants1.packedValues[12u].w, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[144u]) / (fragmentScalarConstants1.packedValues[145u] - fragmentScalarConstants1.packedValues[144u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[142u]), -0.5);
        uint sumValue40 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[142u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue173))), int(0u))))));
        float scalarValue130 = rdSignedBitsToFloat(sumValue40);
        float multiplyAddValue96 = fma(varyingColor1.x, 0.5, 0.5);
        float multiplyAddValue97 = fma(varyingColor1.y, 0.5, 0.5);
        vec4 sampledTextureValue59 = textureLod(sampler2DArray(materialTexture10, textureSampler10), vec3(multiplyAddValue96, multiplyAddValue97, scalarValue130), 0.0);
        float scalarValue131 = sampledTextureValue59.w;
        float sampledTextureValue60 = fma(spvNClamp(multiplyAddValue173 - scalarValue130, 0.0, 1.0), textureLod(sampler2DArray(materialTexture10, textureSampler10), vec3(multiplyAddValue96, multiplyAddValue97, rdSignedBitsToFloat(sumValue40 + 1u)), 0.0).w - scalarValue131, scalarValue131);
        productValue49 = comparisonValue78 * sampledTextureValue60;
        productValue50 = comparisonValue77 * sampledTextureValue60;
        productValue51 = comparisonValue76 * sampledTextureValue60;
    }
    else
    {
        productValue49 = comparisonValue78;
        productValue50 = comparisonValue77;
        productValue51 = comparisonValue76;
    }
    float quotientValue26 = (0.180000007152557373046875 / sampledTextureValue6) + 9.9999997473787516355514526367188e-05;
    fragmentColor0.x = conditionValue3 ? (quotientValue26 * productValue51) : productValue51;
    fragmentColor0.y = conditionValue3 ? (quotientValue26 * productValue50) : productValue50;
    fragmentColor0.z = conditionValue3 ? (quotientValue26 * productValue49) : productValue49;
    fragmentColor0.w = 1.0;
#elif (RD_OPTION_MODE == RD_MODE_DEFAULT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_MODE == RD_MODE_DEFAULT && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(normalTexture, normalSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    vec4 sampledTextureValue1 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float productValue = (scalarValue2 * fragmentVectorConstants1.packedValues[14u].w) + fragmentVectorConstants1.packedValues[15u].w;
    float quotientValue = (fragmentVectorConstants1.packedValues[12u].x * varyingColor1.x) / productValue;
    float quotientValue1 = (fragmentVectorConstants1.packedValues[13u].y * varyingColor1.y) / productValue;
    float quotientValue2 = fragmentVectorConstants1.packedValues[15u].z / productValue;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].x, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].y, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float quotientValue3 = ((fragmentVectorConstants1.packedValues[32u].x + varyingColor1.x) * fragmentVectorConstants1.packedValues[12u].x) / productValue;
    float quotientValue4 = ((varyingColor1.y - fragmentVectorConstants1.packedValues[32u].y) * fragmentVectorConstants1.packedValues[13u].y) / productValue;
    float multiplyAddValue3 = (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].x, quotientValue4, quotientValue3 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[37u].x;
    float multiplyAddValue4 = (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].y, quotientValue4, quotientValue3 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) - fragmentVectorConstants1.packedValues[37u].y;
    float multiplyAddValue5 = (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue4, quotientValue3 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z) - fragmentVectorConstants1.packedValues[37u].z;
    float scalarValue3 = dFdxCoarse(quotientValue3);
    float scalarValue4 = dFdxCoarse(quotientValue4);
    float scalarValue5 = dFdxCoarse(quotientValue2);
    float inverseLengthValue = inversesqrt(dot(vec3(scalarValue3, scalarValue4, scalarValue5), vec3(scalarValue3, scalarValue4, scalarValue5)));
    float productValue1 = inverseLengthValue * scalarValue3;
    float productValue2 = inverseLengthValue * scalarValue4;
    float productValue3 = inverseLengthValue * scalarValue5;
    float sumValue = dFdyCoarse((-0.0) - quotientValue3);
    float sumValue1 = dFdyCoarse((-0.0) - quotientValue4);
    float sumValue2 = dFdyCoarse((-0.0) - quotientValue2);
    float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue, sumValue1, sumValue2), vec3(sumValue, sumValue1, sumValue2)));
    float productValue4 = inverseLengthValue1 * sumValue;
    float productValue5 = inverseLengthValue1 * sumValue1;
    float productValue6 = inverseLengthValue1 * sumValue2;
    float productValue7 = (productValue6 * productValue2) - (productValue5 * productValue3);
    float productValue8 = (productValue4 * productValue3) - (productValue6 * productValue1);
    float productValue9 = (productValue5 * productValue1) - (productValue4 * productValue2);
    float inverseLengthValue2 = inversesqrt(dot(vec3(productValue7, productValue8, productValue9), vec3(productValue7, productValue8, productValue9)));
    float productValue10 = productValue7 * inverseLengthValue2;
    float productValue11 = productValue8 * inverseLengthValue2;
    float productValue12 = productValue9 * inverseLengthValue2;
    float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue12, fma(fragmentVectorConstants1.packedValues[5u].x, productValue11, productValue10 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue12, fma(fragmentVectorConstants1.packedValues[5u].y, productValue11, productValue10 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue12, fma(fragmentVectorConstants1.packedValues[5u].z, productValue11, productValue10 * fragmentVectorConstants1.packedValues[4u].z));
    float inverseLengthValue3 = inversesqrt(dot(vec3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8), vec3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8)));
    float quotientValue5 = roundEven((inverseLengthValue3 * multiplyAddValue6) / fragmentVectorConstants1.packedValues[18u].x) * fragmentVectorConstants1.packedValues[18u].x;
    float quotientValue6 = roundEven((inverseLengthValue3 * multiplyAddValue7) / fragmentVectorConstants1.packedValues[18u].x) * fragmentVectorConstants1.packedValues[18u].x;
    float quotientValue7 = roundEven((inverseLengthValue3 * multiplyAddValue8) / fragmentVectorConstants1.packedValues[18u].x) * fragmentVectorConstants1.packedValues[18u].x;
    float inverseLengthValue4 = inversesqrt(dot(vec3(quotientValue5, quotientValue6, quotientValue7), vec3(quotientValue5, quotientValue6, quotientValue7)));
    float productValue13 = inverseLengthValue4 * quotientValue5;
    float productValue14 = inverseLengthValue4 * quotientValue6;
    float productValue15 = inverseLengthValue4 * quotientValue7;
    float productValue16 = fragmentVectorConstants1.packedValues[16u].z * 0.5;
    float quotientValue8 = productValue16 - (multiplyAddValue3 - (floor(multiplyAddValue3 / fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[16u].z));
    float quotientValue9 = productValue16 - (multiplyAddValue4 - (floor(multiplyAddValue4 / fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[16u].z));
    float quotientValue10 = productValue16 - (multiplyAddValue5 - (floor(multiplyAddValue5 / fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[16u].z));
    float dotProductValue = dot(vec3(quotientValue8, quotientValue9, quotientValue10), vec3(productValue13, productValue14, productValue15));
    float productValue17 = ((quotientValue8 + multiplyAddValue3) - (dotProductValue * productValue13)) + fragmentVectorConstants1.packedValues[37u].x;
    float productValue18 = ((multiplyAddValue4 - (dotProductValue * productValue14)) + quotientValue9) + fragmentVectorConstants1.packedValues[37u].y;
    float productValue19 = ((multiplyAddValue5 - (dotProductValue * productValue15)) + quotientValue10) + fragmentVectorConstants1.packedValues[37u].z;
    float sumValue3 = 1.0 - abs(scalarValue);
    float scalarValue6 = abs(scalarValue1);
    float sumValue4 = sumValue3 - scalarValue6;
    bool conditionValue = sumValue4 < 0.0;
    float comparisonValue = conditionValue ? ((1.0 - scalarValue6) * ((scalarValue < 0.0) ? (-1.0) : 1.0)) : scalarValue;
    float comparisonValue1 = conditionValue ? (sumValue3 * ((scalarValue1 < 0.0) ? (-1.0) : 1.0)) : scalarValue1;
    float inverseLengthValue5 = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue4), vec3(comparisonValue, comparisonValue1, sumValue4)));
    float productValue20 = comparisonValue * inverseLengthValue5;
    float productValue21 = comparisonValue1 * inverseLengthValue5;
    float productValue22 = inverseLengthValue5 * sumValue4;
    float inverseLengthValue6 = inversesqrt(dot(vec3(productValue20, productValue21, productValue22), vec3(productValue20, productValue21, productValue22)));
    float productValue23 = inverseLengthValue6 * productValue20;
    float productValue24 = productValue21 * inverseLengthValue6;
    float productValue25 = inverseLengthValue6 * productValue22;
    float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue25, fma(fragmentVectorConstants1.packedValues[1u].x, productValue24, productValue23 * fragmentVectorConstants1.packedValues[0u].x));
    float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue25, fma(fragmentVectorConstants1.packedValues[1u].y, productValue24, productValue23 * fragmentVectorConstants1.packedValues[0u].y));
    float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue25, fma(fragmentVectorConstants1.packedValues[1u].z, productValue24, productValue23 * fragmentVectorConstants1.packedValues[0u].z));
    float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue26 = inverseLengthValue7 * multiplyAddValue9;
    float productValue27 = inverseLengthValue7 * multiplyAddValue10;
    float productValue28 = inverseLengthValue7 * multiplyAddValue11;
    vec4 sampledTextureValue2 = texture(sampler2D(colorMetalnessSubsurfaceTexture, colorMetalnessSubsurfaceSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue2.x;
    float scalarValue8 = sampledTextureValue2.y;
    float scalarValue9 = sampledTextureValue2.z;
    float productValue29 = spvNClamp((sampledTextureValue2.w + (-0.501960813999176025390625)) * 2.007874011993408203125, 0.0, 1.0);
    uvec2 sampledTextureValue3 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue4 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue3.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(sampledTextureValue3.y)))))) * varyingTexCoord0.y)))), int(0u));
    uint scalarValue10 = sampledTextureValue4.y;
    uint scalarValue11 = sampledTextureValue4.z;
    float bitwiseValue = float((sampledTextureValue4.x >> 8u) & 255u) * 0.0039215688593685626983642578125;
    float bitwiseValue1 = float(scalarValue11 & 255u) * 9.2272217443678528070449829101562e-05;
    float bitwiseValue2 = bitwiseValue1 * float((scalarValue10 >> 8u) & 255u);
    float bitwiseValue3 = bitwiseValue1 * float(scalarValue10 & 255u);
    float bitwiseValue4 = bitwiseValue1 * float((scalarValue11 >> 8u) & 255u);
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(scalarValue7, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue8, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue9, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue7 <= 0.040449999272823333740234375) ? (scalarValue7 * 0.077399380505084991455078125) : exp2(log2((scalarValue7 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue8 <= 0.040449999272823333740234375) ? (scalarValue8 * 0.077399380505084991455078125) : exp2(log2((scalarValue8 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue9 <= 0.040449999272823333740234375) ? (scalarValue9 * 0.077399380505084991455078125) : exp2(log2((scalarValue9 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float productValue30 = (1.0 - productValue29) * 0.039999999105930328369140625;
    float productValue31 = (exponentialValue * productValue29) + productValue30;
    float productValue32 = (exponentialValue1 * productValue29) + productValue30;
    float productValue33 = (exponentialValue2 * productValue29) + productValue30;
    bool conditionValue1 = fragmentVectorConstants1.packedValues[27u].x > 0.0;
    float sampledTextureValue5;
    if (conditionValue1)
    {
        sampledTextureValue5 = texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x;
    }
    else
    {
        sampledTextureValue5 = 0.0;
    }
    float bitwiseValue5 = spvNClamp(((float(sampledTextureValue4.w & 255u) * 0.062745101749897003173828125) - fragmentVectorConstants1.packedValues[22u].y) / spvNMax(fragmentVectorConstants1.packedValues[22u].x - fragmentVectorConstants1.packedValues[22u].y, 1.0), 0.0, 1.0);
    float productValue34 = ((bitwiseValue5 * bitwiseValue5) * bitwiseValue5) * fragmentVectorConstants1.packedValues[29u].x;
    bool comparisonValue2 = fragmentVectorConstants1.packedValues[29u].x != 0.0;
    bool comparisonValue3 = fragmentVectorConstants1.packedValues[28u].w != 0.0;
    float productValue62;
    float productValue63;
    float productValue64;
    if (comparisonValue2 && (fragmentVectorConstants1.packedValues[31u].x != 0.0))
    {
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        if (fragmentVectorConstants1.packedValues[16u].w > 0.0)
        {
            float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[10u].w, productValue19, fma(fragmentVectorConstants1.packedValues[9u].w, productValue18, productValue17 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
            intermediateValue14 = productValue17;
            intermediateValue15 = productValue18;
            intermediateValue16 = productValue19;
            multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue19, fma(fragmentVectorConstants1.packedValues[1u].x, productValue18, productValue17 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x;
            multiplyAddValue14 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue19, fma(fragmentVectorConstants1.packedValues[1u].y, productValue18, productValue17 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y;
            multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue19, fma(fragmentVectorConstants1.packedValues[1u].z, productValue18, productValue17 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z;
            multiplyAddValue16 = (fma(fragmentVectorConstants1.packedValues[10u].x, productValue19, fma(fragmentVectorConstants1.packedValues[9u].x, productValue18, productValue17 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue12;
            multiplyAddValue17 = (1.0 - ((fma(fragmentVectorConstants1.packedValues[10u].y, productValue19, fma(fragmentVectorConstants1.packedValues[9u].y, productValue18, productValue17 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue12)) * 0.5;
        }
        else
        {
            intermediateValue14 = multiplyAddValue;
            intermediateValue15 = multiplyAddValue1;
            intermediateValue16 = multiplyAddValue2;
            multiplyAddValue13 = quotientValue;
            multiplyAddValue14 = quotientValue1;
            multiplyAddValue15 = quotientValue2;
            multiplyAddValue16 = varyingColor1.x;
            multiplyAddValue17 = 1.0 - ((varyingColor1.y + 1.0) * 0.5);
        }
        precise float sumValue5 = multiplyAddValue16 + 1.0;
        precise float productValue35 = sumValue5 * 0.5;
        float sumValue6 = intermediateValue14 - fragmentVectorConstants1.packedValues[7u].x;
        float sumValue7 = intermediateValue15 - fragmentVectorConstants1.packedValues[7u].y;
        float sumValue8 = intermediateValue16 - fragmentVectorConstants1.packedValues[7u].z;
        float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue6, sumValue7, sumValue8), vec3(sumValue6, sumValue7, sumValue8)));
        float productValue36 = inverseLengthValue8 * sumValue6;
        float productValue37 = inverseLengthValue8 * sumValue7;
        float productValue38 = inverseLengthValue8 * sumValue8;
        float inverseLengthValue9 = inversesqrt(dot(vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15), vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15)));
        vec4 sampledTextureValue7 = texture(sampler2D(ssrTextureTexture, ssrTextureSampler), vec2(productValue35 * fragmentVectorConstants1.packedValues[33u].x, multiplyAddValue17 * fragmentVectorConstants1.packedValues[33u].y));
        float scalarValue12 = sampledTextureValue7.x;
        float scalarValue13 = sampledTextureValue7.y;
        float scalarValue14 = sampledTextureValue7.z;
        float quotientValue12;
        float quotientValue13;
        float quotientValue14;
        if (conditionValue1)
        {
            float quotientValue11 = (0.180000007152557373046875 / sampledTextureValue5) + 9.9999997473787516355514526367188e-05;
            quotientValue12 = scalarValue12 / quotientValue11;
            quotientValue13 = scalarValue13 / quotientValue11;
            quotientValue14 = scalarValue14 / quotientValue11;
        }
        else
        {
            quotientValue12 = scalarValue12;
            quotientValue13 = scalarValue13;
            quotientValue14 = scalarValue14;
        }
        float dotProductValue1 = dot(vec3(productValue36, productValue37, productValue38), vec3(productValue23, productValue24, productValue25)) * 2.0;
        float productValue39 = productValue36 - (dotProductValue1 * productValue23);
        float productValue40 = productValue37 - (dotProductValue1 * productValue24);
        float productValue41 = productValue38 - (dotProductValue1 * productValue25);
        float sumValue9 = 1.0 - bitwiseValue;
        float productValue42 = sumValue9 * sumValue9;
        float productValue43 = productValue42 * productValue42;
        precise float comparisonValue4 = 1.0 - ((uint(int(fragmentVectorConstants1.packedValues[26u].x)) == 1u) ? productValue42 : (productValue43 * productValue43));
        precise float productValue44 = (fragmentVectorConstants1.packedValues[29u].y + (-1.0)) * comparisonValue4;
        uint scalarValue15 = uint(int(fragmentVectorConstants1.packedValues[20u].x));
        vec4 sampledTextureValue8 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue39, productValue40, productValue41, float(int(scalarValue15))), productValue44);
        vec4 sampledTextureValue9 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue39, productValue40, productValue41, float(int(uint(int(scalarValue15 + 2u) - int(3u) * (int(scalarValue15 + 2u) / int(3u)))))), productValue44);
        float scalarValue16 = sampledTextureValue9.x;
        float scalarValue17 = sampledTextureValue9.y;
        float scalarValue18 = sampledTextureValue9.z;
        float productValue45 = ((sampledTextureValue8.x - scalarValue16) * fragmentVectorConstants1.packedValues[29u].w) + scalarValue16;
        float productValue46 = ((sampledTextureValue8.y - scalarValue17) * fragmentVectorConstants1.packedValues[29u].w) + scalarValue17;
        float productValue52 = ((sampledTextureValue8.z - scalarValue18) * fragmentVectorConstants1.packedValues[29u].w) + scalarValue18;
        float productValue53 = productValue34 * fragmentVectorConstants1.packedValues[29u].z;
        float comparisonValue5 = (conditionValue1 ? (productValue45 * 301.72412109375) : productValue45) * productValue53;
        float comparisonValue6 = (conditionValue1 ? (productValue46 * 301.72412109375) : productValue46) * productValue53;
        float comparisonValue7 = (conditionValue1 ? (productValue52 * 301.72412109375) : productValue52) * productValue53;
        float comparisonValue13;
        float comparisonValue14;
        float comparisonValue15;
        if (comparisonValue3)
        {
            float productValue54 = fragmentVectorConstants1.packedValues[19u].x * fragmentVectorConstants1.packedValues[19u].w;
            float productValue55 = fragmentVectorConstants1.packedValues[19u].y * fragmentVectorConstants1.packedValues[19u].w;
            float productValue56 = fragmentVectorConstants1.packedValues[19u].z * fragmentVectorConstants1.packedValues[19u].w;
            float productValue57 = fragmentVectorConstants1.packedValues[17u].w * fragmentVectorConstants1.packedValues[24u].x;
            float productValue58 = productValue57 * bitwiseValue2;
            float productValue59 = productValue57 * bitwiseValue3;
            float productValue60 = productValue57 * bitwiseValue4;
            float dotProductValue2 = spvNClamp(dot(vec3(productValue58, productValue59, productValue60), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
            float productValue61 = ((dotProductValue2 * (productValue58 - productValue54)) + productValue54) * productValue29;
            float productValue67 = ((dotProductValue2 * (productValue59 - productValue55)) + productValue55) * productValue29;
            float productValue68 = ((dotProductValue2 * (productValue60 - productValue56)) + productValue56) * productValue29;
            float intermediateValue40;
            float intermediateValue41;
            float intermediateValue42;
            bool intermediateValue43;
            if (!(dot(vec3(comparisonValue5, comparisonValue6, comparisonValue7), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= dot(vec3(productValue61, productValue67, productValue68), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))))
            {
                intermediateValue40 = productValue61;
                intermediateValue41 = productValue67;
                intermediateValue42 = productValue68;
                intermediateValue43 = true;
            }
            else
            {
                intermediateValue40 = 0.0;
                intermediateValue41 = 0.0;
                intermediateValue42 = 0.0;
                intermediateValue43 = false;
            }
            comparisonValue13 = intermediateValue43 ? intermediateValue40 : comparisonValue5;
            comparisonValue14 = intermediateValue43 ? intermediateValue41 : comparisonValue6;
            comparisonValue15 = intermediateValue43 ? intermediateValue42 : comparisonValue7;
        }
        else
        {
            comparisonValue13 = comparisonValue5;
            comparisonValue14 = comparisonValue6;
            comparisonValue15 = comparisonValue7;
        }
        float productValue69 = sampledTextureValue7.w * fragmentVectorConstants1.packedValues[31u].y;
        vec4 sampledTextureValue10 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(productValue26, productValue27, productValue28), vec3((-0.0) - (multiplyAddValue13 * inverseLengthValue9), (-0.0) - (multiplyAddValue14 * inverseLengthValue9), (-0.0) - (multiplyAddValue15 * inverseLengthValue9))), 0.0, 1.0), sumValue9));
        float scalarValue19 = sampledTextureValue10.x;
        float scalarValue20 = sampledTextureValue10.y;
        productValue62 = ((scalarValue19 * productValue31) + scalarValue20) * (((quotientValue12 - comparisonValue13) * productValue69) + comparisonValue13);
        productValue63 = ((scalarValue19 * productValue32) + scalarValue20) * (((quotientValue13 - comparisonValue14) * productValue69) + comparisonValue14);
        productValue64 = ((scalarValue19 * productValue33) + scalarValue20) * (((quotientValue14 - comparisonValue15) * productValue69) + comparisonValue15);
    }
    else
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (comparisonValue2)
        {
            float intermediateValue24;
            float intermediateValue25;
            float intermediateValue26;
            float multiplyAddValue18;
            float multiplyAddValue19;
            float multiplyAddValue20;
            if (fragmentVectorConstants1.packedValues[16u].w > 0.0)
            {
                intermediateValue24 = productValue17;
                intermediateValue25 = productValue18;
                intermediateValue26 = productValue19;
                multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue19, fma(fragmentVectorConstants1.packedValues[1u].x, productValue18, productValue17 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x;
                multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue19, fma(fragmentVectorConstants1.packedValues[1u].y, productValue18, productValue17 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y;
                multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue19, fma(fragmentVectorConstants1.packedValues[1u].z, productValue18, productValue17 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z;
            }
            else
            {
                intermediateValue24 = multiplyAddValue;
                intermediateValue25 = multiplyAddValue1;
                intermediateValue26 = multiplyAddValue2;
                multiplyAddValue18 = quotientValue;
                multiplyAddValue19 = quotientValue1;
                multiplyAddValue20 = quotientValue2;
            }
            float sumValue10 = intermediateValue24 - fragmentVectorConstants1.packedValues[7u].x;
            float sumValue11 = intermediateValue25 - fragmentVectorConstants1.packedValues[7u].y;
            float sumValue12 = intermediateValue26 - fragmentVectorConstants1.packedValues[7u].z;
            float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue10, sumValue11, sumValue12), vec3(sumValue10, sumValue11, sumValue12)));
            float productValue70 = inverseLengthValue10 * sumValue10;
            float productValue71 = inverseLengthValue10 * sumValue11;
            float productValue72 = inverseLengthValue10 * sumValue12;
            float inverseLengthValue11 = inversesqrt(dot(vec3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), vec3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
            float dotProductValue3 = dot(vec3(productValue70, productValue71, productValue72), vec3(productValue23, productValue24, productValue25)) * 2.0;
            float productValue73 = productValue70 - (dotProductValue3 * productValue23);
            float productValue74 = productValue71 - (dotProductValue3 * productValue24);
            float productValue75 = productValue72 - (dotProductValue3 * productValue25);
            float sumValue13 = 1.0 - bitwiseValue;
            float productValue76 = sumValue13 * sumValue13;
            float productValue77 = productValue76 * productValue76;
            precise float comparisonValue8 = 1.0 - ((uint(int(fragmentVectorConstants1.packedValues[26u].x)) == 1u) ? productValue76 : (productValue77 * productValue77));
            precise float productValue78 = (fragmentVectorConstants1.packedValues[29u].y + (-1.0)) * comparisonValue8;
            uint scalarValue21 = uint(int(fragmentVectorConstants1.packedValues[20u].x));
            vec4 sampledTextureValue11 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue73, productValue74, productValue75, float(int(scalarValue21))), productValue78);
            vec4 sampledTextureValue12 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue73, productValue74, productValue75, float(int(uint(int(scalarValue21 + 2u) - int(3u) * (int(scalarValue21 + 2u) / int(3u)))))), productValue78);
            float scalarValue22 = sampledTextureValue12.x;
            float scalarValue23 = sampledTextureValue12.y;
            float scalarValue24 = sampledTextureValue12.z;
            float productValue79 = ((sampledTextureValue11.x - scalarValue22) * fragmentVectorConstants1.packedValues[29u].w) + scalarValue22;
            float productValue80 = ((sampledTextureValue11.y - scalarValue23) * fragmentVectorConstants1.packedValues[29u].w) + scalarValue23;
            float productValue81 = ((sampledTextureValue11.z - scalarValue24) * fragmentVectorConstants1.packedValues[29u].w) + scalarValue24;
            float productValue82 = productValue34 * fragmentVectorConstants1.packedValues[29u].z;
            float comparisonValue9 = (conditionValue1 ? (productValue79 * 301.72412109375) : productValue79) * productValue82;
            float comparisonValue10 = (conditionValue1 ? (productValue80 * 301.72412109375) : productValue80) * productValue82;
            float comparisonValue11 = (conditionValue1 ? (productValue81 * 301.72412109375) : productValue81) * productValue82;
            float comparisonValue16;
            float comparisonValue17;
            float comparisonValue18;
            if (comparisonValue3)
            {
                float productValue83 = fragmentVectorConstants1.packedValues[19u].x * fragmentVectorConstants1.packedValues[19u].w;
                float productValue84 = fragmentVectorConstants1.packedValues[19u].y * fragmentVectorConstants1.packedValues[19u].w;
                float productValue85 = fragmentVectorConstants1.packedValues[19u].z * fragmentVectorConstants1.packedValues[19u].w;
                float productValue86 = fragmentVectorConstants1.packedValues[17u].w * fragmentVectorConstants1.packedValues[24u].x;
                float productValue87 = productValue86 * bitwiseValue2;
                float productValue88 = productValue86 * bitwiseValue3;
                float productValue89 = productValue86 * bitwiseValue4;
                float dotProductValue4 = spvNClamp(dot(vec3(productValue87, productValue88, productValue89), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
                float productValue90 = ((dotProductValue4 * (productValue87 - productValue83)) + productValue83) * productValue29;
                float productValue91 = ((dotProductValue4 * (productValue88 - productValue84)) + productValue84) * productValue29;
                float productValue92 = ((dotProductValue4 * (productValue89 - productValue85)) + productValue85) * productValue29;
                float intermediateValue44;
                float intermediateValue45;
                float intermediateValue46;
                bool intermediateValue47;
                if (!(dot(vec3(comparisonValue9, comparisonValue10, comparisonValue11), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= dot(vec3(productValue90, productValue91, productValue92), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))))
                {
                    intermediateValue44 = productValue90;
                    intermediateValue45 = productValue91;
                    intermediateValue46 = productValue92;
                    intermediateValue47 = true;
                }
                else
                {
                    intermediateValue44 = 0.0;
                    intermediateValue45 = 0.0;
                    intermediateValue46 = 0.0;
                    intermediateValue47 = false;
                }
                comparisonValue16 = intermediateValue47 ? intermediateValue44 : comparisonValue9;
                comparisonValue17 = intermediateValue47 ? intermediateValue45 : comparisonValue10;
                comparisonValue18 = intermediateValue47 ? intermediateValue46 : comparisonValue11;
            }
            else
            {
                comparisonValue16 = comparisonValue9;
                comparisonValue17 = comparisonValue10;
                comparisonValue18 = comparisonValue11;
            }
            vec4 sampledTextureValue13 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(productValue26, productValue27, productValue28), vec3((-0.0) - (multiplyAddValue18 * inverseLengthValue11), (-0.0) - (multiplyAddValue19 * inverseLengthValue11), (-0.0) - (multiplyAddValue20 * inverseLengthValue11))), 0.0, 1.0), sumValue13));
            float scalarValue25 = sampledTextureValue13.x;
            float scalarValue26 = sampledTextureValue13.y;
            branchMergedValue = ((scalarValue25 * productValue33) + scalarValue26) * comparisonValue18;
            branchMergedValue1 = ((scalarValue25 * productValue32) + scalarValue26) * comparisonValue17;
            branchMergedValue2 = ((scalarValue25 * productValue31) + scalarValue26) * comparisonValue16;
        }
        else
        {
            float branchMergedValue3;
            float branchMergedValue4;
            float branchMergedValue5;
            if (comparisonValue3)
            {
                float multiplyAddValue21;
                float multiplyAddValue22;
                float multiplyAddValue23;
                if (fragmentVectorConstants1.packedValues[16u].w > 0.0)
                {
                    multiplyAddValue21 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue19, fma(fragmentVectorConstants1.packedValues[1u].x, productValue18, productValue17 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x;
                    multiplyAddValue22 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue19, fma(fragmentVectorConstants1.packedValues[1u].y, productValue18, productValue17 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y;
                    multiplyAddValue23 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue19, fma(fragmentVectorConstants1.packedValues[1u].z, productValue18, productValue17 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z;
                }
                else
                {
                    multiplyAddValue21 = quotientValue;
                    multiplyAddValue22 = quotientValue1;
                    multiplyAddValue23 = quotientValue2;
                }
                float inverseLengthValue12 = inversesqrt(dot(vec3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23), vec3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23)));
                float productValue93 = fragmentVectorConstants1.packedValues[19u].x * fragmentVectorConstants1.packedValues[19u].w;
                float productValue94 = fragmentVectorConstants1.packedValues[19u].y * fragmentVectorConstants1.packedValues[19u].w;
                float productValue95 = fragmentVectorConstants1.packedValues[19u].z * fragmentVectorConstants1.packedValues[19u].w;
                float productValue96 = fragmentVectorConstants1.packedValues[17u].w * fragmentVectorConstants1.packedValues[24u].x;
                float productValue97 = productValue96 * bitwiseValue2;
                float productValue98 = productValue96 * bitwiseValue3;
                float productValue99 = productValue96 * bitwiseValue4;
                float dotProductValue5 = spvNClamp(dot(vec3(productValue97, productValue98, productValue99), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
                float productValue100 = ((dotProductValue5 * (productValue97 - productValue93)) + productValue93) * productValue29;
                float productValue109 = ((dotProductValue5 * (productValue98 - productValue94)) + productValue94) * productValue29;
                float productValue110 = ((dotProductValue5 * (productValue99 - productValue95)) + productValue95) * productValue29;
                bool dotProductValue6 = dot(vec3(productValue100, productValue109, productValue110), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) <= 0.0;
                vec4 sampledTextureValue14 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(productValue26, productValue27, productValue28), vec3((-0.0) - (multiplyAddValue21 * inverseLengthValue12), (-0.0) - (multiplyAddValue22 * inverseLengthValue12), (-0.0) - (multiplyAddValue23 * inverseLengthValue12))), 0.0, 1.0), 1.0 - bitwiseValue));
                float scalarValue27 = sampledTextureValue14.x;
                float scalarValue28 = sampledTextureValue14.y;
                branchMergedValue3 = ((scalarValue27 * productValue33) + scalarValue28) * (dotProductValue6 ? 0.0 : productValue110);
                branchMergedValue4 = ((scalarValue27 * productValue32) + scalarValue28) * (dotProductValue6 ? 0.0 : productValue109);
                branchMergedValue5 = ((scalarValue27 * productValue31) + scalarValue28) * (dotProductValue6 ? 0.0 : productValue100);
            }
            else
            {
                branchMergedValue3 = 0.0;
                branchMergedValue4 = 0.0;
                branchMergedValue5 = 0.0;
            }
            branchMergedValue = branchMergedValue3;
            branchMergedValue1 = branchMergedValue4;
            branchMergedValue2 = branchMergedValue5;
        }
        productValue62 = branchMergedValue2;
        productValue63 = branchMergedValue1;
        productValue64 = branchMergedValue;
    }
    float nonlinearValue = (fragmentVectorConstants1.packedValues[30u].x - fragmentVectorConstants1.packedValues[21u].x) + (sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) / fragmentVectorConstants1.packedValues[21u].z);
    float comparisonValue12 = 1.0 - spvNClamp((fragmentVectorConstants1.packedValues[23u].x != 0.0) ? (nonlinearValue * fragmentVectorConstants1.packedValues[21u].y) : (nonlinearValue / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x)), 0.0, 1.0);
    float productValue111 = comparisonValue12 * productValue62;
    float productValue112 = comparisonValue12 * productValue63;
    float productValue113 = comparisonValue12 * productValue64;
    float productValue101;
    float productValue102;
    float productValue103;
    if (fragmentVectorConstants1.packedValues[36u].x != 0.0)
    {
        float productValue114 = (varyingColor1.x + 1.0) * 0.5;
        float productValue115 = (varyingColor1.y + 1.0) * 0.5;
        uint scalarValue29 = uint(int(fragmentVectorConstants1.packedValues[34u].z));
        float multiplyAddValue24 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, scalarValue2, fma(fragmentVectorConstants1.packedValues[13u].z, varyingColor1.y, fragmentVectorConstants1.packedValues[12u].z * varyingColor1.x)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, scalarValue2, fma(fragmentVectorConstants1.packedValues[13u].w, varyingColor1.y, fragmentVectorConstants1.packedValues[12u].w * varyingColor1.x)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[35u].x) / (fragmentVectorConstants1.packedValues[35u].y - fragmentVectorConstants1.packedValues[35u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue29))) + (-0.5);
        uint sumValue14 = uint(min(int(uint(max(int(uint(int(multiplyAddValue24))), int(0u)))), int(scalarValue29 + 4294967294u)));
        float scalarValue30 = float(int(sumValue14));
        vec4 sampledTextureValue15 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue114, productValue115, scalarValue30), 0.0);
        float scalarValue31 = sampledTextureValue15.w;
        float sampledTextureValue16 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue114, productValue115, float(int(sumValue14 + 1u))), 0.0).w - scalarValue31) * spvNMin(spvNMax(multiplyAddValue24 - scalarValue30, 0.0), 1.0)) + scalarValue31;
        productValue101 = sampledTextureValue16 * productValue111;
        productValue102 = sampledTextureValue16 * productValue112;
        productValue103 = sampledTextureValue16 * productValue113;
    }
    else
    {
        productValue101 = productValue111;
        productValue102 = productValue112;
        productValue103 = productValue113;
    }
    float productValue104;
    float productValue105;
    float productValue106;
    if (conditionValue1)
    {
        float quotientValue15 = (0.180000007152557373046875 / sampledTextureValue5) + 9.9999997473787516355514526367188e-05;
        productValue104 = quotientValue15 * productValue101;
        productValue105 = quotientValue15 * productValue102;
        productValue106 = quotientValue15 * productValue103;
    }
    else
    {
        productValue104 = productValue101;
        productValue105 = productValue102;
        productValue106 = productValue103;
    }
    fragmentColor0.x = productValue104;
    fragmentColor0.y = productValue105;
    fragmentColor0.z = productValue106;
    fragmentColor0.w = 1.0;
#elif (RD_OPTION_MODE == RD_MODE_MIXED_RES && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_MODE == RD_MODE_MIXED_RES && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue169 = (floor(fragmentVectorConstants1.packedValues[29u].x * varyingTexCoord0.x) + 0.5) * fragmentVectorConstants1.packedValues[29u].z;
    float productValue170 = (floor(fragmentVectorConstants1.packedValues[29u].y * varyingTexCoord0.y) + 0.5) * fragmentVectorConstants1.packedValues[29u].w;
    vec4 sampledTextureValue33 = texture(sampler2D(normalTexture, normalSampler), vec2(productValue169, productValue170));
    float scalarValue72 = sampledTextureValue33.x;
    float scalarValue73 = sampledTextureValue33.y;
    vec4 sampledTextureValue34 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(productValue169, productValue170));
    float scalarValue74 = sampledTextureValue34.x;
    float productValue171 = (scalarValue74 * fragmentVectorConstants1.packedValues[14u].w) + fragmentVectorConstants1.packedValues[15u].w;
    float quotientValue27 = (fragmentVectorConstants1.packedValues[12u].x * varyingColor1.x) / productValue171;
    float quotientValue28 = (fragmentVectorConstants1.packedValues[13u].y * varyingColor1.y) / productValue171;
    float quotientValue29 = fragmentVectorConstants1.packedValues[15u].z / productValue171;
    float multiplyAddValue98 = fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue29, fma(fragmentVectorConstants1.packedValues[5u].x, quotientValue28, quotientValue27 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue99 = fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue29, fma(fragmentVectorConstants1.packedValues[5u].y, quotientValue28, quotientValue27 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue100 = fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue29, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue28, quotientValue27 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float quotientValue30 = ((fragmentVectorConstants1.packedValues[33u].x + varyingColor1.x) * fragmentVectorConstants1.packedValues[12u].x) / productValue171;
    float quotientValue31 = ((varyingColor1.y - fragmentVectorConstants1.packedValues[33u].y) * fragmentVectorConstants1.packedValues[13u].y) / productValue171;
    float multiplyAddValue101 = (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue29, fma(fragmentVectorConstants1.packedValues[5u].x, quotientValue31, quotientValue30 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[38u].x;
    float multiplyAddValue102 = (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue29, fma(fragmentVectorConstants1.packedValues[5u].y, quotientValue31, quotientValue30 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) - fragmentVectorConstants1.packedValues[38u].y;
    float multiplyAddValue103 = (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue29, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue31, quotientValue30 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z) - fragmentVectorConstants1.packedValues[38u].z;
    float scalarValue75 = dFdxCoarse(quotientValue30);
    float scalarValue76 = dFdxCoarse(quotientValue31);
    float scalarValue77 = dFdxCoarse(quotientValue29);
    float inverseLengthValue25 = inversesqrt(dot(vec3(scalarValue75, scalarValue76, scalarValue77), vec3(scalarValue75, scalarValue76, scalarValue77)));
    float productValue172 = inverseLengthValue25 * scalarValue75;
    float productValue173 = inverseLengthValue25 * scalarValue76;
    float productValue174 = inverseLengthValue25 * scalarValue77;
    float sumValue25 = dFdyCoarse((-0.0) - quotientValue30);
    float sumValue26 = dFdyCoarse((-0.0) - quotientValue31);
    float sumValue27 = dFdyCoarse((-0.0) - quotientValue29);
    float inverseLengthValue26 = inversesqrt(dot(vec3(sumValue25, sumValue26, sumValue27), vec3(sumValue25, sumValue26, sumValue27)));
    float productValue175 = inverseLengthValue26 * sumValue25;
    float productValue176 = inverseLengthValue26 * sumValue26;
    float productValue177 = inverseLengthValue26 * sumValue27;
    float productValue178 = (productValue177 * productValue173) - (productValue176 * productValue174);
    float productValue179 = (productValue175 * productValue174) - (productValue177 * productValue172);
    float productValue180 = (productValue176 * productValue172) - (productValue175 * productValue173);
    float inverseLengthValue27 = inversesqrt(dot(vec3(productValue178, productValue179, productValue180), vec3(productValue178, productValue179, productValue180)));
    float productValue181 = productValue178 * inverseLengthValue27;
    float productValue182 = productValue179 * inverseLengthValue27;
    float productValue183 = productValue180 * inverseLengthValue27;
    float multiplyAddValue104 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue183, fma(fragmentVectorConstants1.packedValues[5u].x, productValue182, productValue181 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue105 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue183, fma(fragmentVectorConstants1.packedValues[5u].y, productValue182, productValue181 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue106 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue183, fma(fragmentVectorConstants1.packedValues[5u].z, productValue182, productValue181 * fragmentVectorConstants1.packedValues[4u].z));
    float inverseLengthValue28 = inversesqrt(dot(vec3(multiplyAddValue104, multiplyAddValue105, multiplyAddValue106), vec3(multiplyAddValue104, multiplyAddValue105, multiplyAddValue106)));
    float quotientValue32 = roundEven((inverseLengthValue28 * multiplyAddValue104) / fragmentVectorConstants1.packedValues[18u].x) * fragmentVectorConstants1.packedValues[18u].x;
    float quotientValue33 = roundEven((inverseLengthValue28 * multiplyAddValue105) / fragmentVectorConstants1.packedValues[18u].x) * fragmentVectorConstants1.packedValues[18u].x;
    float quotientValue34 = roundEven((inverseLengthValue28 * multiplyAddValue106) / fragmentVectorConstants1.packedValues[18u].x) * fragmentVectorConstants1.packedValues[18u].x;
    float inverseLengthValue29 = inversesqrt(dot(vec3(quotientValue32, quotientValue33, quotientValue34), vec3(quotientValue32, quotientValue33, quotientValue34)));
    float productValue184 = inverseLengthValue29 * quotientValue32;
    float productValue185 = inverseLengthValue29 * quotientValue33;
    float productValue186 = inverseLengthValue29 * quotientValue34;
    float productValue16 = fragmentVectorConstants1.packedValues[16u].z * 0.5;
    float quotientValue35 = productValue16 - (multiplyAddValue101 - (floor(multiplyAddValue101 / fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[16u].z));
    float quotientValue36 = productValue16 - (multiplyAddValue102 - (floor(multiplyAddValue102 / fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[16u].z));
    float quotientValue37 = productValue16 - (multiplyAddValue103 - (floor(multiplyAddValue103 / fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[16u].z));
    float dotProductValue7 = dot(vec3(quotientValue35, quotientValue36, quotientValue37), vec3(productValue184, productValue185, productValue186));
    float productValue187 = ((quotientValue35 + multiplyAddValue101) - (dotProductValue7 * productValue184)) + fragmentVectorConstants1.packedValues[38u].x;
    float productValue188 = ((multiplyAddValue102 - (dotProductValue7 * productValue185)) + quotientValue36) + fragmentVectorConstants1.packedValues[38u].y;
    float productValue189 = ((multiplyAddValue103 - (dotProductValue7 * productValue186)) + quotientValue37) + fragmentVectorConstants1.packedValues[38u].z;
    float sumValue28 = 1.0 - abs(scalarValue72);
    float scalarValue78 = abs(scalarValue73);
    float sumValue29 = sumValue28 - scalarValue78;
    bool conditionValue8 = sumValue29 < 0.0;
    float comparisonValue44 = conditionValue8 ? ((1.0 - scalarValue78) * ((scalarValue72 < 0.0) ? (-1.0) : 1.0)) : scalarValue72;
    float comparisonValue45 = conditionValue8 ? (sumValue28 * ((scalarValue73 < 0.0) ? (-1.0) : 1.0)) : scalarValue73;
    float inverseLengthValue30 = inversesqrt(dot(vec3(comparisonValue44, comparisonValue45, sumValue29), vec3(comparisonValue44, comparisonValue45, sumValue29)));
    float productValue190 = comparisonValue44 * inverseLengthValue30;
    float productValue191 = comparisonValue45 * inverseLengthValue30;
    float productValue192 = inverseLengthValue30 * sumValue29;
    float inverseLengthValue31 = inversesqrt(dot(vec3(productValue190, productValue191, productValue192), vec3(productValue190, productValue191, productValue192)));
    float productValue193 = inverseLengthValue31 * productValue190;
    float productValue194 = productValue191 * inverseLengthValue31;
    float productValue195 = inverseLengthValue31 * productValue192;
    float multiplyAddValue107 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue195, fma(fragmentVectorConstants1.packedValues[1u].x, productValue194, productValue193 * fragmentVectorConstants1.packedValues[0u].x));
    float multiplyAddValue108 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue195, fma(fragmentVectorConstants1.packedValues[1u].y, productValue194, productValue193 * fragmentVectorConstants1.packedValues[0u].y));
    float multiplyAddValue109 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue195, fma(fragmentVectorConstants1.packedValues[1u].z, productValue194, productValue193 * fragmentVectorConstants1.packedValues[0u].z));
    float inverseLengthValue32 = inversesqrt(dot(vec3(multiplyAddValue107, multiplyAddValue108, multiplyAddValue109), vec3(multiplyAddValue107, multiplyAddValue108, multiplyAddValue109)));
    float productValue196 = inverseLengthValue32 * multiplyAddValue107;
    float productValue197 = inverseLengthValue32 * multiplyAddValue108;
    float productValue198 = inverseLengthValue32 * multiplyAddValue109;
    vec4 sampledTextureValue35 = texture(sampler2D(colorMetalnessSubsurfaceTexture, colorMetalnessSubsurfaceSampler), vec2(productValue169, productValue170));
    float scalarValue79 = sampledTextureValue35.x;
    float scalarValue80 = sampledTextureValue35.y;
    float scalarValue81 = sampledTextureValue35.z;
    float productValue199 = spvNClamp((sampledTextureValue35.w + (-0.501960813999176025390625)) * 2.007874011993408203125, 0.0, 1.0);
    uvec2 sampledTextureValue3 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue36 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue3.x)))))) * productValue169)), uint(int(float(int(uint(int(float(int(sampledTextureValue3.y)))))) * productValue170)))), int(0u));
    uint scalarValue82 = sampledTextureValue36.y;
    uint scalarValue83 = sampledTextureValue36.z;
    float bitwiseValue8 = float((sampledTextureValue36.x >> 8u) & 255u) * 0.0039215688593685626983642578125;
    float bitwiseValue9 = float(scalarValue83 & 255u) * 9.2272217443678528070449829101562e-05;
    float bitwiseValue10 = bitwiseValue9 * float((scalarValue82 >> 8u) & 255u);
    float bitwiseValue11 = bitwiseValue9 * float(scalarValue82 & 255u);
    float bitwiseValue12 = bitwiseValue9 * float((scalarValue83 >> 8u) & 255u);
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(scalarValue79, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue80, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue81, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue79 <= 0.040449999272823333740234375) ? (scalarValue79 * 0.077399380505084991455078125) : exp2(log2((scalarValue79 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue80 <= 0.040449999272823333740234375) ? (scalarValue80 * 0.077399380505084991455078125) : exp2(log2((scalarValue80 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue81 <= 0.040449999272823333740234375) ? (scalarValue81 * 0.077399380505084991455078125) : exp2(log2((scalarValue81 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float productValue200 = (1.0 - productValue199) * 0.039999999105930328369140625;
    float productValue201 = (exponentialValue * productValue199) + productValue200;
    float productValue202 = (exponentialValue1 * productValue199) + productValue200;
    float productValue203 = (exponentialValue2 * productValue199) + productValue200;
    bool conditionValue1 = fragmentVectorConstants1.packedValues[27u].x > 0.0;
    float sampledTextureValue5;
    if (conditionValue1)
    {
        sampledTextureValue5 = texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x;
    }
    else
    {
        sampledTextureValue5 = 0.0;
    }
    float bitwiseValue13 = spvNClamp(((float(sampledTextureValue36.w & 255u) * 0.062745101749897003173828125) - fragmentVectorConstants1.packedValues[22u].y) / spvNMax(fragmentVectorConstants1.packedValues[22u].x - fragmentVectorConstants1.packedValues[22u].y, 1.0), 0.0, 1.0);
    float productValue204 = ((bitwiseValue13 * bitwiseValue13) * bitwiseValue13) * fragmentVectorConstants1.packedValues[30u].x;
    bool comparisonValue46 = fragmentVectorConstants1.packedValues[30u].x != 0.0;
    bool comparisonValue3 = fragmentVectorConstants1.packedValues[28u].w != 0.0;
    float productValue64;
    float productValue65;
    float productValue66;
    if (comparisonValue46 && (fragmentVectorConstants1.packedValues[32u].x != 0.0))
    {
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        if (fragmentVectorConstants1.packedValues[16u].w > 0.0)
        {
            float multiplyAddValue110 = fma(fragmentVectorConstants1.packedValues[10u].w, productValue189, fma(fragmentVectorConstants1.packedValues[9u].w, productValue188, productValue187 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
            intermediateValue14 = productValue187;
            intermediateValue15 = productValue188;
            intermediateValue16 = productValue189;
            multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue189, fma(fragmentVectorConstants1.packedValues[1u].x, productValue188, productValue187 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x;
            multiplyAddValue14 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue189, fma(fragmentVectorConstants1.packedValues[1u].y, productValue188, productValue187 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y;
            multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue189, fma(fragmentVectorConstants1.packedValues[1u].z, productValue188, productValue187 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z;
            multiplyAddValue16 = (fma(fragmentVectorConstants1.packedValues[10u].x, productValue189, fma(fragmentVectorConstants1.packedValues[9u].x, productValue188, productValue187 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue110;
            multiplyAddValue17 = (1.0 - ((fma(fragmentVectorConstants1.packedValues[10u].y, productValue189, fma(fragmentVectorConstants1.packedValues[9u].y, productValue188, productValue187 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue110)) * 0.5;
        }
        else
        {
            intermediateValue14 = multiplyAddValue98;
            intermediateValue15 = multiplyAddValue99;
            intermediateValue16 = multiplyAddValue100;
            multiplyAddValue13 = quotientValue27;
            multiplyAddValue14 = quotientValue28;
            multiplyAddValue15 = quotientValue29;
            multiplyAddValue16 = varyingColor1.x;
            multiplyAddValue17 = 1.0 - ((varyingColor1.y + 1.0) * 0.5);
        }
        precise float sumValue5 = multiplyAddValue16 + 1.0;
        precise float productValue35 = sumValue5 * 0.5;
        float sumValue6 = intermediateValue14 - fragmentVectorConstants1.packedValues[7u].x;
        float sumValue7 = intermediateValue15 - fragmentVectorConstants1.packedValues[7u].y;
        float sumValue8 = intermediateValue16 - fragmentVectorConstants1.packedValues[7u].z;
        float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue6, sumValue7, sumValue8), vec3(sumValue6, sumValue7, sumValue8)));
        float productValue36 = inverseLengthValue8 * sumValue6;
        float productValue37 = inverseLengthValue8 * sumValue7;
        float productValue38 = inverseLengthValue8 * sumValue8;
        float inverseLengthValue9 = inversesqrt(dot(vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15), vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15)));
        vec4 sampledTextureValue37 = texture(sampler2D(ssrTextureTexture, ssrTextureSampler), vec2(productValue35 * fragmentVectorConstants1.packedValues[34u].x, multiplyAddValue17 * fragmentVectorConstants1.packedValues[34u].y));
        float scalarValue84 = sampledTextureValue37.x;
        float scalarValue85 = sampledTextureValue37.y;
        float scalarValue86 = sampledTextureValue37.z;
        float quotientValue12;
        float quotientValue13;
        float quotientValue14;
        if (conditionValue1)
        {
            float quotientValue11 = (0.180000007152557373046875 / sampledTextureValue5) + 9.9999997473787516355514526367188e-05;
            quotientValue12 = scalarValue84 / quotientValue11;
            quotientValue13 = scalarValue85 / quotientValue11;
            quotientValue14 = scalarValue86 / quotientValue11;
        }
        else
        {
            quotientValue12 = scalarValue84;
            quotientValue13 = scalarValue85;
            quotientValue14 = scalarValue86;
        }
        float dotProductValue8 = dot(vec3(productValue36, productValue37, productValue38), vec3(productValue193, productValue194, productValue195)) * 2.0;
        float productValue205 = productValue36 - (dotProductValue8 * productValue193);
        float productValue206 = productValue37 - (dotProductValue8 * productValue194);
        float productValue207 = productValue38 - (dotProductValue8 * productValue195);
        float sumValue30 = 1.0 - bitwiseValue8;
        float productValue208 = sumValue30 * sumValue30;
        float productValue209 = productValue208 * productValue208;
        precise float comparisonValue47 = 1.0 - ((uint(int(fragmentVectorConstants1.packedValues[26u].x)) == 1u) ? productValue208 : (productValue209 * productValue209));
        precise float productValue210 = (fragmentVectorConstants1.packedValues[30u].y + (-1.0)) * comparisonValue47;
        uint scalarValue15 = uint(int(fragmentVectorConstants1.packedValues[20u].x));
        vec4 sampledTextureValue38 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue205, productValue206, productValue207, float(int(scalarValue15))), productValue210);
        vec4 sampledTextureValue39 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue205, productValue206, productValue207, float(int(uint(int(scalarValue15 + 2u) - int(3u) * (int(scalarValue15 + 2u) / int(3u)))))), productValue210);
        float scalarValue87 = sampledTextureValue39.x;
        float scalarValue88 = sampledTextureValue39.y;
        float scalarValue89 = sampledTextureValue39.z;
        float productValue211 = ((sampledTextureValue38.x - scalarValue87) * fragmentVectorConstants1.packedValues[30u].w) + scalarValue87;
        float productValue212 = ((sampledTextureValue38.y - scalarValue88) * fragmentVectorConstants1.packedValues[30u].w) + scalarValue88;
        float productValue213 = ((sampledTextureValue38.z - scalarValue89) * fragmentVectorConstants1.packedValues[30u].w) + scalarValue89;
        float productValue214 = productValue204 * fragmentVectorConstants1.packedValues[30u].z;
        float comparisonValue48 = (conditionValue1 ? (productValue211 * 301.72412109375) : productValue211) * productValue214;
        float comparisonValue49 = (conditionValue1 ? (productValue212 * 301.72412109375) : productValue212) * productValue214;
        float comparisonValue50 = (conditionValue1 ? (productValue213 * 301.72412109375) : productValue213) * productValue214;
        float comparisonValue13;
        float comparisonValue14;
        float comparisonValue15;
        if (comparisonValue3)
        {
            float productValue54 = fragmentVectorConstants1.packedValues[19u].x * fragmentVectorConstants1.packedValues[19u].w;
            float productValue55 = fragmentVectorConstants1.packedValues[19u].y * fragmentVectorConstants1.packedValues[19u].w;
            float productValue56 = fragmentVectorConstants1.packedValues[19u].z * fragmentVectorConstants1.packedValues[19u].w;
            float productValue57 = fragmentVectorConstants1.packedValues[17u].w * fragmentVectorConstants1.packedValues[24u].x;
            float productValue215 = productValue57 * bitwiseValue10;
            float productValue216 = productValue57 * bitwiseValue11;
            float productValue217 = productValue57 * bitwiseValue12;
            float dotProductValue9 = spvNClamp(dot(vec3(productValue215, productValue216, productValue217), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
            float productValue218 = ((dotProductValue9 * (productValue215 - productValue54)) + productValue54) * productValue199;
            float productValue219 = ((dotProductValue9 * (productValue216 - productValue55)) + productValue55) * productValue199;
            float productValue220 = ((dotProductValue9 * (productValue217 - productValue56)) + productValue56) * productValue199;
            float intermediateValue40;
            float intermediateValue41;
            float intermediateValue42;
            bool intermediateValue43;
            if (!(dot(vec3(comparisonValue48, comparisonValue49, comparisonValue50), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= dot(vec3(productValue218, productValue219, productValue220), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))))
            {
                intermediateValue40 = productValue218;
                intermediateValue41 = productValue219;
                intermediateValue42 = productValue220;
                intermediateValue43 = true;
            }
            else
            {
                intermediateValue40 = 0.0;
                intermediateValue41 = 0.0;
                intermediateValue42 = 0.0;
                intermediateValue43 = false;
            }
            comparisonValue13 = intermediateValue43 ? intermediateValue40 : comparisonValue48;
            comparisonValue14 = intermediateValue43 ? intermediateValue41 : comparisonValue49;
            comparisonValue15 = intermediateValue43 ? intermediateValue42 : comparisonValue50;
        }
        else
        {
            comparisonValue13 = comparisonValue48;
            comparisonValue14 = comparisonValue49;
            comparisonValue15 = comparisonValue50;
        }
        float productValue221 = sampledTextureValue37.w * fragmentVectorConstants1.packedValues[32u].y;
        vec4 sampledTextureValue40 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(productValue196, productValue197, productValue198), vec3((-0.0) - (multiplyAddValue13 * inverseLengthValue9), (-0.0) - (multiplyAddValue14 * inverseLengthValue9), (-0.0) - (multiplyAddValue15 * inverseLengthValue9))), 0.0, 1.0), sumValue30));
        float scalarValue90 = sampledTextureValue40.x;
        float scalarValue91 = sampledTextureValue40.y;
        productValue64 = ((scalarValue90 * productValue201) + scalarValue91) * (((quotientValue12 - comparisonValue13) * productValue221) + comparisonValue13);
        productValue65 = ((scalarValue90 * productValue202) + scalarValue91) * (((quotientValue13 - comparisonValue14) * productValue221) + comparisonValue14);
        productValue66 = ((scalarValue90 * productValue203) + scalarValue91) * (((quotientValue14 - comparisonValue15) * productValue221) + comparisonValue15);
    }
    else
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (comparisonValue46)
        {
            float intermediateValue24;
            float intermediateValue25;
            float intermediateValue26;
            float multiplyAddValue18;
            float multiplyAddValue19;
            float multiplyAddValue20;
            if (fragmentVectorConstants1.packedValues[16u].w > 0.0)
            {
                intermediateValue24 = productValue187;
                intermediateValue25 = productValue188;
                intermediateValue26 = productValue189;
                multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue189, fma(fragmentVectorConstants1.packedValues[1u].x, productValue188, productValue187 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x;
                multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue189, fma(fragmentVectorConstants1.packedValues[1u].y, productValue188, productValue187 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y;
                multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue189, fma(fragmentVectorConstants1.packedValues[1u].z, productValue188, productValue187 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z;
            }
            else
            {
                intermediateValue24 = multiplyAddValue98;
                intermediateValue25 = multiplyAddValue99;
                intermediateValue26 = multiplyAddValue100;
                multiplyAddValue18 = quotientValue27;
                multiplyAddValue19 = quotientValue28;
                multiplyAddValue20 = quotientValue29;
            }
            float sumValue10 = intermediateValue24 - fragmentVectorConstants1.packedValues[7u].x;
            float sumValue11 = intermediateValue25 - fragmentVectorConstants1.packedValues[7u].y;
            float sumValue12 = intermediateValue26 - fragmentVectorConstants1.packedValues[7u].z;
            float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue10, sumValue11, sumValue12), vec3(sumValue10, sumValue11, sumValue12)));
            float productValue70 = inverseLengthValue10 * sumValue10;
            float productValue71 = inverseLengthValue10 * sumValue11;
            float productValue72 = inverseLengthValue10 * sumValue12;
            float inverseLengthValue11 = inversesqrt(dot(vec3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), vec3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
            float dotProductValue10 = dot(vec3(productValue70, productValue71, productValue72), vec3(productValue193, productValue194, productValue195)) * 2.0;
            float productValue222 = productValue70 - (dotProductValue10 * productValue193);
            float productValue223 = productValue71 - (dotProductValue10 * productValue194);
            float productValue224 = productValue72 - (dotProductValue10 * productValue195);
            float sumValue31 = 1.0 - bitwiseValue8;
            float productValue225 = sumValue31 * sumValue31;
            float productValue226 = productValue225 * productValue225;
            precise float comparisonValue51 = 1.0 - ((uint(int(fragmentVectorConstants1.packedValues[26u].x)) == 1u) ? productValue225 : (productValue226 * productValue226));
            precise float productValue227 = (fragmentVectorConstants1.packedValues[30u].y + (-1.0)) * comparisonValue51;
            uint scalarValue21 = uint(int(fragmentVectorConstants1.packedValues[20u].x));
            vec4 sampledTextureValue41 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue222, productValue223, productValue224, float(int(scalarValue21))), productValue227);
            vec4 sampledTextureValue42 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue222, productValue223, productValue224, float(int(uint(int(scalarValue21 + 2u) - int(3u) * (int(scalarValue21 + 2u) / int(3u)))))), productValue227);
            float scalarValue92 = sampledTextureValue42.x;
            float scalarValue93 = sampledTextureValue42.y;
            float scalarValue94 = sampledTextureValue42.z;
            float productValue228 = ((sampledTextureValue41.x - scalarValue92) * fragmentVectorConstants1.packedValues[30u].w) + scalarValue92;
            float productValue229 = ((sampledTextureValue41.y - scalarValue93) * fragmentVectorConstants1.packedValues[30u].w) + scalarValue93;
            float productValue230 = ((sampledTextureValue41.z - scalarValue94) * fragmentVectorConstants1.packedValues[30u].w) + scalarValue94;
            float productValue231 = productValue204 * fragmentVectorConstants1.packedValues[30u].z;
            float comparisonValue52 = (conditionValue1 ? (productValue228 * 301.72412109375) : productValue228) * productValue231;
            float comparisonValue53 = (conditionValue1 ? (productValue229 * 301.72412109375) : productValue229) * productValue231;
            float comparisonValue54 = (conditionValue1 ? (productValue230 * 301.72412109375) : productValue230) * productValue231;
            float comparisonValue16;
            float comparisonValue17;
            float comparisonValue18;
            if (comparisonValue3)
            {
                float productValue83 = fragmentVectorConstants1.packedValues[19u].x * fragmentVectorConstants1.packedValues[19u].w;
                float productValue84 = fragmentVectorConstants1.packedValues[19u].y * fragmentVectorConstants1.packedValues[19u].w;
                float productValue85 = fragmentVectorConstants1.packedValues[19u].z * fragmentVectorConstants1.packedValues[19u].w;
                float productValue86 = fragmentVectorConstants1.packedValues[17u].w * fragmentVectorConstants1.packedValues[24u].x;
                float productValue232 = productValue86 * bitwiseValue10;
                float productValue233 = productValue86 * bitwiseValue11;
                float productValue234 = productValue86 * bitwiseValue12;
                float dotProductValue11 = spvNClamp(dot(vec3(productValue232, productValue233, productValue234), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
                float productValue235 = ((dotProductValue11 * (productValue232 - productValue83)) + productValue83) * productValue199;
                float productValue236 = ((dotProductValue11 * (productValue233 - productValue84)) + productValue84) * productValue199;
                float productValue237 = ((dotProductValue11 * (productValue234 - productValue85)) + productValue85) * productValue199;
                float intermediateValue44;
                float intermediateValue45;
                float intermediateValue46;
                bool intermediateValue47;
                if (!(dot(vec3(comparisonValue52, comparisonValue53, comparisonValue54), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= dot(vec3(productValue235, productValue236, productValue237), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))))
                {
                    intermediateValue44 = productValue235;
                    intermediateValue45 = productValue236;
                    intermediateValue46 = productValue237;
                    intermediateValue47 = true;
                }
                else
                {
                    intermediateValue44 = 0.0;
                    intermediateValue45 = 0.0;
                    intermediateValue46 = 0.0;
                    intermediateValue47 = false;
                }
                comparisonValue16 = intermediateValue47 ? intermediateValue44 : comparisonValue52;
                comparisonValue17 = intermediateValue47 ? intermediateValue45 : comparisonValue53;
                comparisonValue18 = intermediateValue47 ? intermediateValue46 : comparisonValue54;
            }
            else
            {
                comparisonValue16 = comparisonValue52;
                comparisonValue17 = comparisonValue53;
                comparisonValue18 = comparisonValue54;
            }
            vec4 sampledTextureValue43 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(productValue196, productValue197, productValue198), vec3((-0.0) - (multiplyAddValue18 * inverseLengthValue11), (-0.0) - (multiplyAddValue19 * inverseLengthValue11), (-0.0) - (multiplyAddValue20 * inverseLengthValue11))), 0.0, 1.0), sumValue31));
            float scalarValue95 = sampledTextureValue43.x;
            float scalarValue96 = sampledTextureValue43.y;
            branchMergedValue = ((scalarValue95 * productValue203) + scalarValue96) * comparisonValue18;
            branchMergedValue1 = ((scalarValue95 * productValue202) + scalarValue96) * comparisonValue17;
            branchMergedValue2 = ((scalarValue95 * productValue201) + scalarValue96) * comparisonValue16;
        }
        else
        {
            float branchMergedValue3;
            float branchMergedValue4;
            float branchMergedValue5;
            if (comparisonValue3)
            {
                float multiplyAddValue21;
                float multiplyAddValue22;
                float multiplyAddValue23;
                if (fragmentVectorConstants1.packedValues[16u].w > 0.0)
                {
                    multiplyAddValue21 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue189, fma(fragmentVectorConstants1.packedValues[1u].x, productValue188, productValue187 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x;
                    multiplyAddValue22 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue189, fma(fragmentVectorConstants1.packedValues[1u].y, productValue188, productValue187 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y;
                    multiplyAddValue23 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue189, fma(fragmentVectorConstants1.packedValues[1u].z, productValue188, productValue187 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z;
                }
                else
                {
                    multiplyAddValue21 = quotientValue27;
                    multiplyAddValue22 = quotientValue28;
                    multiplyAddValue23 = quotientValue29;
                }
                float inverseLengthValue12 = inversesqrt(dot(vec3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23), vec3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23)));
                float productValue93 = fragmentVectorConstants1.packedValues[19u].x * fragmentVectorConstants1.packedValues[19u].w;
                float productValue94 = fragmentVectorConstants1.packedValues[19u].y * fragmentVectorConstants1.packedValues[19u].w;
                float productValue95 = fragmentVectorConstants1.packedValues[19u].z * fragmentVectorConstants1.packedValues[19u].w;
                float productValue96 = fragmentVectorConstants1.packedValues[17u].w * fragmentVectorConstants1.packedValues[24u].x;
                float productValue238 = productValue96 * bitwiseValue10;
                float productValue239 = productValue96 * bitwiseValue11;
                float productValue240 = productValue96 * bitwiseValue12;
                float dotProductValue12 = spvNClamp(dot(vec3(productValue238, productValue239, productValue240), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
                float productValue241 = ((dotProductValue12 * (productValue238 - productValue93)) + productValue93) * productValue199;
                float productValue242 = ((dotProductValue12 * (productValue239 - productValue94)) + productValue94) * productValue199;
                float productValue243 = ((dotProductValue12 * (productValue240 - productValue95)) + productValue95) * productValue199;
                bool dotProductValue13 = dot(vec3(productValue241, productValue242, productValue243), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) <= 0.0;
                vec4 sampledTextureValue44 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(productValue196, productValue197, productValue198), vec3((-0.0) - (multiplyAddValue21 * inverseLengthValue12), (-0.0) - (multiplyAddValue22 * inverseLengthValue12), (-0.0) - (multiplyAddValue23 * inverseLengthValue12))), 0.0, 1.0), 1.0 - bitwiseValue8));
                float scalarValue97 = sampledTextureValue44.x;
                float scalarValue98 = sampledTextureValue44.y;
                branchMergedValue3 = ((scalarValue97 * productValue203) + scalarValue98) * (dotProductValue13 ? 0.0 : productValue243);
                branchMergedValue4 = ((scalarValue97 * productValue202) + scalarValue98) * (dotProductValue13 ? 0.0 : productValue242);
                branchMergedValue5 = ((scalarValue97 * productValue201) + scalarValue98) * (dotProductValue13 ? 0.0 : productValue241);
            }
            else
            {
                branchMergedValue3 = 0.0;
                branchMergedValue4 = 0.0;
                branchMergedValue5 = 0.0;
            }
            branchMergedValue = branchMergedValue3;
            branchMergedValue1 = branchMergedValue4;
            branchMergedValue2 = branchMergedValue5;
        }
        productValue64 = branchMergedValue2;
        productValue65 = branchMergedValue1;
        productValue66 = branchMergedValue;
    }
    float nonlinearValue2 = (fragmentVectorConstants1.packedValues[31u].x - fragmentVectorConstants1.packedValues[21u].x) + (sqrt(((quotientValue28 * quotientValue28) + (quotientValue27 * quotientValue27)) + (quotientValue29 * quotientValue29)) / fragmentVectorConstants1.packedValues[21u].z);
    float comparisonValue55 = 1.0 - spvNClamp((fragmentVectorConstants1.packedValues[23u].x != 0.0) ? (nonlinearValue2 * fragmentVectorConstants1.packedValues[21u].y) : (nonlinearValue2 / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x)), 0.0, 1.0);
    float productValue244 = comparisonValue55 * productValue64;
    float productValue245 = comparisonValue55 * productValue65;
    float productValue246 = comparisonValue55 * productValue66;
    float productValue103;
    float productValue104;
    float productValue105;
    if (fragmentVectorConstants1.packedValues[37u].x != 0.0)
    {
        float productValue114 = (varyingColor1.x + 1.0) * 0.5;
        float productValue115 = (varyingColor1.y + 1.0) * 0.5;
        uint scalarValue99 = uint(int(fragmentVectorConstants1.packedValues[35u].z));
        float multiplyAddValue111 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, scalarValue74, fma(fragmentVectorConstants1.packedValues[13u].z, varyingColor1.y, fragmentVectorConstants1.packedValues[12u].z * varyingColor1.x)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, scalarValue74, fma(fragmentVectorConstants1.packedValues[13u].w, varyingColor1.y, fragmentVectorConstants1.packedValues[12u].w * varyingColor1.x)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[36u].x) / (fragmentVectorConstants1.packedValues[36u].y - fragmentVectorConstants1.packedValues[36u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue99))) + (-0.5);
        uint sumValue32 = uint(min(int(uint(max(int(uint(int(multiplyAddValue111))), int(0u)))), int(scalarValue99 + 4294967294u)));
        float scalarValue100 = float(int(sumValue32));
        vec4 sampledTextureValue45 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue114, productValue115, scalarValue100), 0.0);
        float scalarValue101 = sampledTextureValue45.w;
        float sampledTextureValue46 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue114, productValue115, float(int(sumValue32 + 1u))), 0.0).w - scalarValue101) * spvNMin(spvNMax(multiplyAddValue111 - scalarValue100, 0.0), 1.0)) + scalarValue101;
        productValue103 = sampledTextureValue46 * productValue244;
        productValue104 = sampledTextureValue46 * productValue245;
        productValue105 = sampledTextureValue46 * productValue246;
    }
    else
    {
        productValue103 = productValue244;
        productValue104 = productValue245;
        productValue105 = productValue246;
    }
    float productValue106;
    float productValue107;
    float productValue108;
    if (conditionValue1)
    {
        float quotientValue15 = (0.180000007152557373046875 / sampledTextureValue5) + 9.9999997473787516355514526367188e-05;
        productValue106 = quotientValue15 * productValue103;
        productValue107 = quotientValue15 * productValue104;
        productValue108 = quotientValue15 * productValue105;
    }
    else
    {
        productValue106 = productValue103;
        productValue107 = productValue104;
        productValue108 = productValue105;
    }
    fragmentColor0.x = productValue106;
    fragmentColor0.y = productValue107;
    fragmentColor0.z = productValue108;
    fragmentColor0.w = 1.0;
#endif
}
