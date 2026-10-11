#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandTextured / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/ItemInHandTextured/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    bool comparisonValue = fragmentScalarConstants1.packedValues[8u] != 0.0;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    precise float multiplyAddValue = fma(scalarValue7, fma(scalarValue4, varyingColor0.x, -scalarValue4), scalarValue4) * varyingColor0.w;
    precise float multiplyAddValue1 = fma(scalarValue7, fma(scalarValue5, varyingColor0.y, -scalarValue5), scalarValue5) * varyingColor0.w;
    precise float multiplyAddValue2 = fma(scalarValue7, fma(scalarValue6, varyingColor0.z, -scalarValue6), scalarValue6) * varyingColor0.w;
    precise float productValue16 = scalarValue4 * varyingColor0.x;
    precise float productValue17 = scalarValue5 * varyingColor0.y;
    precise float productValue18 = scalarValue6 * varyingColor0.z;
    precise float comparisonValue1 = (comparisonValue ? multiplyAddValue : productValue16) * fragmentVectorConstants1.packedValues[4u].x;
    precise float comparisonValue2 = (comparisonValue ? multiplyAddValue1 : productValue17) * fragmentVectorConstants1.packedValues[4u].y;
    precise float comparisonValue3 = (comparisonValue ? multiplyAddValue2 : productValue18) * fragmentVectorConstants1.packedValues[4u].z;
    precise float comparisonValue4 = (comparisonValue ? 1.0 : scalarValue7) * fragmentVectorConstants1.packedValues[4u].w;
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    precise float multiplyAddValue3 = comparisonValue1 * fma(fragmentScalarConstants1.packedValues[12u], sumValue, 1.0);
    precise float multiplyAddValue4 = comparisonValue2 * fma(fragmentScalarConstants1.packedValues[12u], sumValue1, 1.0);
    precise float multiplyAddValue5 = comparisonValue3 * fma(fragmentScalarConstants1.packedValues[12u], sumValue2, 1.0);
    fragmentColor0.w = comparisonValue4;
    float multiplyAddValue6 = fma(varyingColor0.w, fma(multiplyAddValue3, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue3), multiplyAddValue3);
    float multiplyAddValue7 = fma(varyingColor0.w, fma(multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue4), multiplyAddValue4);
    float multiplyAddValue8 = fma(varyingColor0.w, fma(multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue5), multiplyAddValue5);
    precise float sumValue3 = fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue6;
    precise float sumValue4 = fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue7;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue8;
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[7u], sumValue3, multiplyAddValue6);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[7u], sumValue4, multiplyAddValue7);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[7u], sumValue5, multiplyAddValue8);
    precise float productValue19 = multiplyAddValue9 * varyingColor1.x;
    precise float productValue20 = multiplyAddValue10 * varyingColor1.y;
    precise float productValue21 = multiplyAddValue11 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue9, varyingColor1.x, varyingColor2.x), productValue19);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue10, varyingColor1.y, varyingColor2.y), productValue20);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue11, varyingColor1.z, varyingColor2.z), productValue21);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    bool comparisonValue = fragmentScalarConstants1.packedValues[8u] != 0.0;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.w;
    precise float multiplyAddValue = fma(scalarValue7, fma(scalarValue4, varyingColor0.x, -scalarValue4), scalarValue4) * varyingColor0.w;
    precise float multiplyAddValue1 = fma(scalarValue7, fma(scalarValue5, varyingColor0.y, -scalarValue5), scalarValue5) * varyingColor0.w;
    precise float productValue16 = scalarValue4 * varyingColor0.x;
    precise float productValue17 = scalarValue5 * varyingColor0.y;
    precise float comparisonValue1 = (comparisonValue ? multiplyAddValue : productValue16) * fragmentVectorConstants1.packedValues[4u].x;
    precise float comparisonValue2 = (comparisonValue ? multiplyAddValue1 : productValue17) * fragmentVectorConstants1.packedValues[4u].y;
    precise float comparisonValue5 = (comparisonValue ? 1.0 : scalarValue7) * fragmentScalarConstants1.packedValues[19u];
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float multiplyAddValue3 = comparisonValue1 * fma(fragmentScalarConstants1.packedValues[12u], sumValue, 1.0);
    precise float multiplyAddValue4 = comparisonValue2 * fma(fragmentScalarConstants1.packedValues[12u], sumValue1, 1.0);
    fragmentColor0.w = comparisonValue5;
    precise float productValue36 = multiplyAddValue3 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue37 = multiplyAddValue3 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue38 = multiplyAddValue3 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue10 = ceil(multiplyAddValue4);
    float multiplyAddValue27 = fma(scalarValue10, fma(multiplyAddValue4, fragmentVectorConstants1.packedValues[5u].x, -productValue36), productValue36);
    float multiplyAddValue28 = fma(scalarValue10, fma(multiplyAddValue4, fragmentVectorConstants1.packedValues[5u].y, -productValue37), productValue37);
    float multiplyAddValue29 = fma(scalarValue10, fma(multiplyAddValue4, fragmentVectorConstants1.packedValues[5u].z, -productValue38), productValue38);
    precise float sumValue6 = fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue27;
    precise float sumValue7 = fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue28;
    precise float sumValue8 = fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue29;
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[7u], sumValue6, multiplyAddValue27);
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[7u], sumValue7, multiplyAddValue28);
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[7u], sumValue8, multiplyAddValue29);
    precise float productValue39 = multiplyAddValue30 * varyingColor1.x;
    precise float productValue40 = multiplyAddValue31 * varyingColor1.y;
    precise float productValue41 = multiplyAddValue32 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue30, varyingColor1.x, varyingColor2.x), productValue39);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue31, varyingColor1.y, varyingColor2.y), productValue40);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue32, varyingColor1.z, varyingColor2.z), productValue41);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool comparisonValue = fragmentScalarConstants1.packedValues[8u] != 0.0;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    float multiplyAddValue12 = ((comparisonValue ? (fma(scalarValue7, fma(scalarValue4, varyingColor0.x, -scalarValue4), scalarValue4) * varyingColor0.w) : (scalarValue4 * varyingColor0.x)) * fragmentVectorConstants1.packedValues[4u].x) * fma(fragmentScalarConstants1.packedValues[12u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue13 = ((comparisonValue ? (fma(scalarValue7, fma(scalarValue5, varyingColor0.y, -scalarValue5), scalarValue5) * varyingColor0.w) : (scalarValue5 * varyingColor0.y)) * fragmentVectorConstants1.packedValues[4u].y) * fma(fragmentScalarConstants1.packedValues[12u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue14 = ((comparisonValue ? (fma(scalarValue7, fma(scalarValue6, varyingColor0.z, -scalarValue6), scalarValue6) * varyingColor0.w) : (scalarValue6 * varyingColor0.z)) * fragmentVectorConstants1.packedValues[4u].z) * fma(fragmentScalarConstants1.packedValues[12u], varyingColor0.z - 1.0, 1.0);
    fragmentColor0.w = (comparisonValue ? 1.0 : scalarValue7) * fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue15 = fma(varyingColor0.w, fma(multiplyAddValue12, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue12), multiplyAddValue12);
    float multiplyAddValue16 = fma(varyingColor0.w, fma(multiplyAddValue13, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue13), multiplyAddValue13);
    float multiplyAddValue17 = fma(varyingColor0.w, fma(multiplyAddValue14, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue14), multiplyAddValue14);
    float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue15, multiplyAddValue15);
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue16, multiplyAddValue16);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue17, multiplyAddValue17);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue18, varyingColor1.x, varyingColor2.x), multiplyAddValue18 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue19, varyingColor1.y, varyingColor2.y), multiplyAddValue19 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue20, varyingColor1.z, varyingColor2.z), multiplyAddValue20 * varyingColor1.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    bool comparisonValue = fragmentScalarConstants1.packedValues[8u] != 0.0;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.w;
    float multiplyAddValue12 = ((comparisonValue ? (fma(scalarValue7, fma(scalarValue4, varyingColor0.x, -scalarValue4), scalarValue4) * varyingColor0.w) : (scalarValue4 * varyingColor0.x)) * fragmentVectorConstants1.packedValues[4u].x) * fma(fragmentScalarConstants1.packedValues[12u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue13 = ((comparisonValue ? (fma(scalarValue7, fma(scalarValue5, varyingColor0.y, -scalarValue5), scalarValue5) * varyingColor0.w) : (scalarValue5 * varyingColor0.y)) * fragmentVectorConstants1.packedValues[4u].y) * fma(fragmentScalarConstants1.packedValues[12u], varyingColor0.y - 1.0, 1.0);
    fragmentColor0.w = (comparisonValue ? 1.0 : scalarValue7) * fragmentScalarConstants1.packedValues[19u];
    float productValue33 = multiplyAddValue12 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue34 = multiplyAddValue12 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue35 = multiplyAddValue12 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue9 = ceil(multiplyAddValue13);
    float multiplyAddValue21 = fma(scalarValue9, fma(multiplyAddValue13, fragmentVectorConstants1.packedValues[5u].x, -productValue33), productValue33);
    float multiplyAddValue22 = fma(scalarValue9, fma(multiplyAddValue13, fragmentVectorConstants1.packedValues[5u].y, -productValue34), productValue34);
    float multiplyAddValue23 = fma(scalarValue9, fma(multiplyAddValue13, fragmentVectorConstants1.packedValues[5u].z, -productValue35), productValue35);
    float multiplyAddValue24 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue21, multiplyAddValue21);
    float multiplyAddValue25 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue22, multiplyAddValue22);
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue23, multiplyAddValue23);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue24, varyingColor1.x, varyingColor2.x), multiplyAddValue24 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue25, varyingColor1.y, varyingColor2.y), multiplyAddValue25 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue26, varyingColor1.z, varyingColor2.z), multiplyAddValue26 * varyingColor1.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue1 * varyingColor0.y;
    float productValue6 = scalarValue2 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[2u].x != 0.0)
    {
        productValue3 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        productValue5 = (((productValue6 - scalarValue2) * scalarValue3) + scalarValue2) * varyingColor0.w;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue6;
        intermediateValue4 = scalarValue3;
    }
    float productValue7 = (fragmentVectorConstants1.packedValues[4u].x * productValue3) * ((fragmentVectorConstants1.packedValues[3u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue8 = (fragmentVectorConstants1.packedValues[4u].y * productValue4) * ((fragmentVectorConstants1.packedValues[3u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue9 = (fragmentVectorConstants1.packedValues[4u].z * productValue5) * ((fragmentVectorConstants1.packedValues[3u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue10 = (((productValue7 * fragmentVectorConstants1.packedValues[0u].x) - productValue7) * varyingColor0.w) + productValue7;
    float productValue11 = (((productValue8 * fragmentVectorConstants1.packedValues[0u].y) - productValue8) * varyingColor0.w) + productValue8;
    float productValue12 = (((productValue9 * fragmentVectorConstants1.packedValues[0u].z) - productValue9) * varyingColor0.w) + productValue9;
    float productValue13 = (((fragmentVectorConstants1.packedValues[1u].x - productValue10) * fragmentVectorConstants1.packedValues[1u].w) + productValue10) * varyingColor1.x;
    float productValue14 = (((fragmentVectorConstants1.packedValues[1u].y - productValue11) * fragmentVectorConstants1.packedValues[1u].w) + productValue11) * varyingColor1.y;
    float productValue15 = (((fragmentVectorConstants1.packedValues[1u].z - productValue12) * fragmentVectorConstants1.packedValues[1u].w) + productValue12) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((varyingColor2.y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((varyingColor2.z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[4u].w * intermediateValue4;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue1 * varyingColor0.y;
    float productValue2;
    float productValue3;
    float intermediateValue3;
    if (fragmentVectorConstants1.packedValues[2u].x != 0.0)
    {
        productValue2 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue3 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        intermediateValue3 = 1.0;
    }
    else
    {
        productValue2 = productValue;
        productValue3 = productValue1;
        intermediateValue3 = scalarValue3;
    }
    float productValue22 = (fragmentVectorConstants1.packedValues[4u].x * productValue2) * ((fragmentVectorConstants1.packedValues[3u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue23 = (fragmentVectorConstants1.packedValues[4u].y * productValue3) * ((fragmentVectorConstants1.packedValues[3u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue24 = productValue22 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue25 = productValue22 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue26 = productValue22 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue8 = ceil(productValue23);
    float productValue27 = (((productValue23 * fragmentVectorConstants1.packedValues[5u].x) - productValue24) * scalarValue8) + productValue24;
    float productValue28 = (((productValue23 * fragmentVectorConstants1.packedValues[5u].y) - productValue25) * scalarValue8) + productValue25;
    float productValue29 = (((productValue23 * fragmentVectorConstants1.packedValues[5u].z) - productValue26) * scalarValue8) + productValue26;
    float productValue30 = (((fragmentVectorConstants1.packedValues[1u].x - productValue27) * fragmentVectorConstants1.packedValues[1u].w) + productValue27) * varyingColor1.x;
    float productValue31 = (((fragmentVectorConstants1.packedValues[1u].y - productValue28) * fragmentVectorConstants1.packedValues[1u].w) + productValue28) * varyingColor1.y;
    float productValue32 = (((fragmentVectorConstants1.packedValues[1u].z - productValue29) * fragmentVectorConstants1.packedValues[1u].w) + productValue29) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue30) * varyingColor2.w) + productValue30;
    fragmentColor0.y = ((varyingColor2.y - productValue31) * varyingColor2.w) + productValue31;
    fragmentColor0.z = ((varyingColor2.z - productValue32) * varyingColor2.w) + productValue32;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[4u].w * intermediateValue3;
#endif
}
