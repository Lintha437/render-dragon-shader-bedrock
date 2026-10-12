#version 460
#extension GL_GOOGLE_include_directive : require
// ParticlePrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ParticlePrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.x;
    float scalarValue2 = sampledTextureValue3.y;
    float scalarValue3 = sampledTextureValue3.z;
    if (sampledTextureValue3.w < 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(particleTextureTexture, particleTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue.w < 0.5)
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor1.x = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.x, varyingColor1.x), scalarValue1 * varyingColor0.x);
    fragmentColor1.y = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.y, varyingColor1.y), scalarValue2 * varyingColor0.y);
    fragmentColor1.z = fma(varyingColor1.w, fma(-scalarValue3, varyingColor0.z, varyingColor1.z), scalarValue3 * varyingColor0.z);
    uint scalarValue4 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float comparisonValue;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((scalarValue4 & 1u) == 1u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[0u].x));
    float intermediateValue1;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    if ((scalarValue & 1u) == 0u)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        comparisonValue = ((scalarValue4 & 2u) == 2u) ? sampledTextureValue4.w : fragmentScalarConstants1.packedValues[43u];
        intermediateValue14 = sampledTextureValue4.x;
        intermediateValue15 = sampledTextureValue4.z;
        intermediateValue16 = sampledTextureValue4.y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue1 = fragmentVectorConstants1.packedValues[10u].x;
        intermediateValue2 = fragmentVectorConstants1.packedValues[10u].y;
        intermediateValue3 = fragmentVectorConstants1.packedValues[10u].z;
        intermediateValue4 = fragmentVectorConstants1.packedValues[10u].w;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        comparisonValue = fragmentScalarConstants1.packedValues[43u];
        intermediateValue14 = fragmentScalarConstants1.packedValues[40u];
        intermediateValue15 = fragmentVectorConstants1.packedValues[10u].z;
        intermediateValue16 = fragmentVectorConstants1.packedValues[10u].y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue1 = sampledTextureValue1.x;
        intermediateValue2 = sampledTextureValue1.y;
        intermediateValue3 = sampledTextureValue1.z;
        intermediateValue4 = ((scalarValue & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[10u].w;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue3;
    float multiplyAddValue4;
    float multiplyAddValue5;
    if ((scalarValue4 & 4u) == 4u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if ((scalarValue & 4u) == 0u)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        vec3 vectorValue = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue5 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue4 = inversesqrt(scalarValue5);
        vec3 vectorValue1 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue6 = rdDot3Precise(vectorValue1, vectorValue1);
        float inverseLengthValue5 = inversesqrt(scalarValue6);
        vec3 vectorValue2 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue7 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue6 = inversesqrt(scalarValue7);
        vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        float multiplyAddValue2 = fma(sampledTextureValue5.x, 2.0, -1.0);
        float multiplyAddValue6 = fma(sampledTextureValue5.y, 2.0, -1.0);
        float multiplyAddValue7 = fma(sampledTextureValue5.z, 2.0, -1.0);
        multiplyAddValue3 = fma(inverseLengthValue6 * varyingNormal0.z, multiplyAddValue7, fma(inverseLengthValue4 * varyingTangent0.z, multiplyAddValue2, (inverseLengthValue5 * varyingBitangent0.z) * multiplyAddValue6));
        multiplyAddValue4 = fma(inverseLengthValue6 * varyingNormal0.y, multiplyAddValue7, fma(inverseLengthValue4 * varyingTangent0.y, multiplyAddValue2, (inverseLengthValue5 * varyingBitangent0.y) * multiplyAddValue6));
        multiplyAddValue5 = fma(inverseLengthValue6 * varyingNormal0.x, multiplyAddValue7, fma(inverseLengthValue4 * varyingTangent0.x, multiplyAddValue2, (inverseLengthValue5 * varyingBitangent0.x) * multiplyAddValue6));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue5 = varyingNormal0.x;
        intermediateValue6 = varyingNormal0.y;
        intermediateValue7 = varyingNormal0.z;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue3 = varyingNormal0.z;
        multiplyAddValue4 = varyingNormal0.y;
        multiplyAddValue5 = varyingNormal0.x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue1 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        vec4 sampledTextureValue2 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        float productValue3 = (sampledTextureValue2.y * 2.0) + (-1.0);
        float productValue4 = (sampledTextureValue2.z * 2.0) + (-1.0);
        float inverseLengthValue2 = ((sampledTextureValue2.x * 2.0) + (-1.0)) * inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z)));
        intermediateValue5 = fma(inverseLengthValue * varyingNormal0.x, productValue4, fma(inverseLengthValue1 * varyingBitangent0.x, productValue3, inverseLengthValue2 * varyingTangent0.x));
        intermediateValue6 = fma(inverseLengthValue * varyingNormal0.y, productValue4, fma(inverseLengthValue1 * varyingBitangent0.y, productValue3, inverseLengthValue2 * varyingTangent0.y));
        intermediateValue7 = fma(inverseLengthValue * varyingNormal0.z, productValue4, fma(inverseLengthValue1 * varyingBitangent0.z, productValue3, inverseLengthValue2 * varyingTangent0.z));
#endif
    }
    float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor1.w = (comparisonValue < intermediateValue14) ? fma(intermediateValue14, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue3 = vec3(multiplyAddValue5, multiplyAddValue4, multiplyAddValue3);
    float scalarValue8 = rdDot3Precise(vectorValue3, vectorValue3);
    float inverseLengthValue7 = inversesqrt(scalarValue8);
    float productValue17 = inverseLengthValue7 * multiplyAddValue5;
    float productValue18 = inverseLengthValue7 * multiplyAddValue4;
    float productValue19 = inverseLengthValue7 * multiplyAddValue3;
    float quotientValue1 = 1.0 / (abs(productValue19) + (abs(productValue18) + abs(productValue17)));
    float productValue20 = quotientValue1 * productValue17;
    float productValue21 = quotientValue1 * productValue18;
    bool conditionValue1 = productValue19 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue21)) * ((productValue20 >= 0.0) ? sumValue3 : (-1.0))) : productValue20;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue20)) * ((productValue21 >= 0.0) ? sumValue3 : (-1.0))) : productValue21;
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[31u], sumValue2, fma(fragmentScalarConstants1.packedValues[23u], sumValue, sumValue1 * fragmentScalarConstants1.packedValues[27u])) + fragmentScalarConstants1.packedValues[35u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue8, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[7u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[8u].x) / multiplyAddValue9, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue8, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[7u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[8u].y) / multiplyAddValue9, 0.5, 0.5);
    bool bitwiseValue = (((varyingTexCoord2.y + varyingTexCoord2.x) + varyingTexCoord2.z) < 9.9999997473787516355514526367188e-05) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05);
    float productValue10 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue1 = (bitwiseValue ? spvNMin(productValue10, 1.0) : varyingTexCoord2.x) * 0.16666667163372039794921875;
    float multiplyAddValue10 = (bitwiseValue ? spvNMin(fma(fma(productValue10, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue10, 1.0) : varyingTexCoord2.y) * 0.16666667163372039794921875;
    float multiplyAddValue11 = (bitwiseValue ? spvNMin(fma(productValue10 * productValue10, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue10, 1.0) : varyingTexCoord2.z) * 0.16666667163372039794921875;
    float productValue22 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue10, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue11, comparisonValue1)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue10 / productValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue1 / productValue22, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue11 / productValue22, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue22, 0.0, 1.0) * 255.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float inverseLengthValue3 = inversesqrt(dot(vec3(intermediateValue5, intermediateValue6, intermediateValue7), vec3(intermediateValue5, intermediateValue6, intermediateValue7)));
    float productValue5 = inverseLengthValue3 * intermediateValue5;
    float productValue6 = inverseLengthValue3 * intermediateValue6;
    float productValue7 = inverseLengthValue3 * intermediateValue7;
    float quotientValue = 1.0 / ((abs(productValue6) + abs(productValue5)) + abs(productValue7));
    float productValue8 = quotientValue * productValue5;
    float productValue9 = quotientValue * productValue6;
    bool conditionValue = productValue7 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[7u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[6u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[8u].w;
    float intermediateValue9;
    float productValue11;
    float productValue12;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05) && (((varyingTexCoord2.y + varyingTexCoord2.x) + varyingTexCoord2.z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue10 = varyingTexCoord1.x * varyingTexCoord1.x;
        intermediateValue9 = spvNClamp(productValue10, 0.0, 1.0);
        productValue11 = spvNClamp(((productValue10 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue10, 0.0, 1.0);
        productValue12 = spvNClamp((((productValue10 * productValue10) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue10, 0.0, 1.0);
    }
    else
    {
        intermediateValue9 = varyingTexCoord2.x;
        productValue11 = varyingTexCoord2.y;
        productValue12 = varyingTexCoord2.z;
    }
    float productValue13 = intermediateValue9 * 0.16666667163372039794921875;
    float productValue14 = productValue11 * 0.16666667163372039794921875;
    float productValue15 = productValue12 * 0.16666667163372039794921875;
    float productValue16 = ceil(spvNClamp(spvNMax(spvNMax(productValue13, productValue15), spvNMax(productValue14, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue3, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue2, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue13 / productValue16, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue14 / productValue16, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue15 / productValue16, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue16, 0.0, 1.0) * 255.0) & 255u);
#endif
    fragmentColor0.w = uint(spvNClamp(varyingTexCoord1.y, 0.0, 1.0) * 255.0);
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) * 256u);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor1.x = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    fragmentColor1.y = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    fragmentColor1.z = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    fragmentColor1.w = (intermediateValue1 > intermediateValue4) ? ((intermediateValue1 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue4 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue8 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue9))) : productValue8;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue8)) * ((productValue9 < 0.0) ? (-1.0) : 1.0)) : productValue9;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[7u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[8u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[7u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[8u].y) / multiplyAddValue1)) * 0.5;
#endif
    discardIfRequested();
}
