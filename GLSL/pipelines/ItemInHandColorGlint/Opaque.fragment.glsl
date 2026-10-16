#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandColorGlint / Opaque / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 7
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/ItemInHandColorGlint/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    float multiplyAddValue15 = fma(varyingColor0.w, fma(multiplyAddValue12, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue12), multiplyAddValue12);
    float multiplyAddValue16 = fma(varyingColor0.w, fma(multiplyAddValue13, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue13), multiplyAddValue13);
    float multiplyAddValue17 = fma(varyingColor0.w, fma(multiplyAddValue14, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue14), multiplyAddValue14);
    precise float sumValue3 = fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue15;
    precise float sumValue4 = fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue16;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue17;
    precise float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[7u], sumValue3, multiplyAddValue15) * varyingColor1.x;
    precise float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[7u], sumValue4, multiplyAddValue16) * varyingColor1.y;
    precise float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[7u], sumValue5, multiplyAddValue17) * varyingColor1.z;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue12 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue13 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue14 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue21 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, productValue12) * fragmentVectorConstants1.packedValues[4u].x;
    precise float multiplyAddValue22 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, productValue13) * fragmentVectorConstants1.packedValues[4u].y;
    precise float multiplyAddValue23 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, productValue14) * fragmentVectorConstants1.packedValues[4u].z;
    float multiplyAddValue24 = fma(multiplyAddValue21, multiplyAddValue21, multiplyAddValue18);
    float multiplyAddValue25 = fma(multiplyAddValue22, multiplyAddValue22, multiplyAddValue19);
    float multiplyAddValue26 = fma(multiplyAddValue23, multiplyAddValue23, multiplyAddValue20);
    precise float sumValue6 = varyingColor2.x - multiplyAddValue24;
    precise float sumValue7 = varyingColor2.y - multiplyAddValue25;
    precise float sumValue8 = varyingColor2.z - multiplyAddValue26;
    fragmentColor0.x = fma(varyingColor2.w, sumValue6, multiplyAddValue24);
    fragmentColor0.y = fma(varyingColor2.w, sumValue7, multiplyAddValue25);
    fragmentColor0.z = fma(varyingColor2.w, sumValue8, multiplyAddValue26);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    precise float productValue30 = multiplyAddValue12 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue31 = multiplyAddValue12 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue32 = multiplyAddValue12 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue2 = ceil(multiplyAddValue13);
    float multiplyAddValue36 = fma(scalarValue2, fma(multiplyAddValue13, fragmentVectorConstants1.packedValues[4u].x, -productValue30), productValue30);
    float multiplyAddValue37 = fma(scalarValue2, fma(multiplyAddValue13, fragmentVectorConstants1.packedValues[4u].y, -productValue31), productValue31);
    float multiplyAddValue38 = fma(scalarValue2, fma(multiplyAddValue13, fragmentVectorConstants1.packedValues[4u].z, -productValue32), productValue32);
    precise float sumValue9 = fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue36;
    precise float sumValue10 = fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue37;
    precise float sumValue11 = fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue38;
    precise float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[7u], sumValue9, multiplyAddValue36) * varyingColor1.x;
    precise float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[7u], sumValue10, multiplyAddValue37) * varyingColor1.y;
    precise float multiplyAddValue41 = fma(fragmentScalarConstants1.packedValues[7u], sumValue11, multiplyAddValue38) * varyingColor1.z;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue12 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue13 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue14 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue42 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, productValue12) * fragmentVectorConstants1.packedValues[5u].x;
    precise float multiplyAddValue43 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, productValue13) * fragmentVectorConstants1.packedValues[5u].y;
    precise float multiplyAddValue44 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, productValue14) * fragmentVectorConstants1.packedValues[5u].z;
    float multiplyAddValue45 = fma(multiplyAddValue42, multiplyAddValue42, multiplyAddValue39);
    float multiplyAddValue46 = fma(multiplyAddValue43, multiplyAddValue43, multiplyAddValue40);
    float multiplyAddValue47 = fma(multiplyAddValue44, multiplyAddValue44, multiplyAddValue41);
    precise float sumValue12 = varyingColor2.x - multiplyAddValue45;
    precise float sumValue13 = varyingColor2.y - multiplyAddValue46;
    precise float sumValue14 = varyingColor2.z - multiplyAddValue47;
    fragmentColor0.x = fma(varyingColor2.w, sumValue12, multiplyAddValue45);
    fragmentColor0.y = fma(varyingColor2.w, sumValue13, multiplyAddValue46);
    fragmentColor0.z = fma(varyingColor2.w, sumValue14, multiplyAddValue47);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue3 = fma(varyingColor0.w, fma(multiplyAddValue, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue), multiplyAddValue);
    float multiplyAddValue4 = fma(varyingColor0.w, fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue1), multiplyAddValue1);
    float multiplyAddValue5 = fma(varyingColor0.w, fma(multiplyAddValue2, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue2), multiplyAddValue2);
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue6 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[4u].x;
    float multiplyAddValue7 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[4u].y;
    float multiplyAddValue8 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[4u].z;
    float multiplyAddValue9 = fma(multiplyAddValue6, multiplyAddValue6, fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue3, multiplyAddValue3) * varyingColor1.x);
    float multiplyAddValue10 = fma(multiplyAddValue7, multiplyAddValue7, fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue4, multiplyAddValue4) * varyingColor1.y);
    float multiplyAddValue11 = fma(multiplyAddValue8, multiplyAddValue8, fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue5, multiplyAddValue5) * varyingColor1.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue9, multiplyAddValue9);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue10, multiplyAddValue10);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue11, multiplyAddValue11);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float productValue27 = multiplyAddValue * fragmentVectorConstants1.packedValues[0u].x;
    float productValue28 = multiplyAddValue * fragmentVectorConstants1.packedValues[0u].y;
    float productValue29 = multiplyAddValue * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue1 = ceil(multiplyAddValue1);
    float multiplyAddValue27 = fma(scalarValue1, fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[4u].x, -productValue27), productValue27);
    float multiplyAddValue28 = fma(scalarValue1, fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[4u].y, -productValue28), productValue28);
    float multiplyAddValue29 = fma(scalarValue1, fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[4u].z, -productValue29), productValue29);
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue30 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[5u].x;
    float multiplyAddValue31 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[5u].y;
    float multiplyAddValue32 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[5u].z;
    float multiplyAddValue33 = fma(multiplyAddValue30, multiplyAddValue30, fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue27, multiplyAddValue27) * varyingColor1.x);
    float multiplyAddValue34 = fma(multiplyAddValue31, multiplyAddValue31, fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue28, multiplyAddValue28) * varyingColor1.y);
    float multiplyAddValue35 = fma(multiplyAddValue32, multiplyAddValue32, fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue29, multiplyAddValue29) * varyingColor1.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue33, multiplyAddValue33);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue34, multiplyAddValue34);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue35, multiplyAddValue35);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue2 = (fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0;
    float productValue3 = (((productValue * fragmentVectorConstants1.packedValues[0u].x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * fragmentVectorConstants1.packedValues[0u].y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * fragmentVectorConstants1.packedValues[0u].z) - productValue2) * varyingColor0.w) + productValue2;
    vec4 sampledTextureValue2 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue6 = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[4u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue7 = (fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[4u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue8 = (fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[4u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float productValue9 = (productValue6 * productValue6) + ((((fragmentVectorConstants1.packedValues[1u].x - productValue3) * fragmentVectorConstants1.packedValues[1u].w) + productValue3) * varyingColor1.x);
    float productValue10 = (productValue7 * productValue7) + ((((fragmentVectorConstants1.packedValues[1u].y - productValue4) * fragmentVectorConstants1.packedValues[1u].w) + productValue4) * varyingColor1.y);
    float productValue11 = (productValue8 * productValue8) + ((((fragmentVectorConstants1.packedValues[1u].z - productValue5) * fragmentVectorConstants1.packedValues[1u].w) + productValue5) * varyingColor1.z);
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue15 = productValue * fragmentVectorConstants1.packedValues[0u].x;
    float productValue16 = productValue * fragmentVectorConstants1.packedValues[0u].y;
    float productValue17 = productValue * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue = ceil(productValue1);
    float productValue18 = (((productValue1 * fragmentVectorConstants1.packedValues[4u].x) - productValue15) * scalarValue) + productValue15;
    float productValue19 = (((productValue1 * fragmentVectorConstants1.packedValues[4u].y) - productValue16) * scalarValue) + productValue16;
    float productValue20 = (((productValue1 * fragmentVectorConstants1.packedValues[4u].z) - productValue17) * scalarValue) + productValue17;
    vec4 sampledTextureValue2 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue21 = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[5u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue22 = (fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[5u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue23 = (fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[5u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float productValue24 = (productValue21 * productValue21) + ((((fragmentVectorConstants1.packedValues[1u].x - productValue18) * fragmentVectorConstants1.packedValues[1u].w) + productValue18) * varyingColor1.x);
    float productValue25 = (productValue22 * productValue22) + ((((fragmentVectorConstants1.packedValues[1u].y - productValue19) * fragmentVectorConstants1.packedValues[1u].w) + productValue19) * varyingColor1.y);
    float productValue26 = (productValue23 * productValue23) + ((((fragmentVectorConstants1.packedValues[1u].z - productValue20) * fragmentVectorConstants1.packedValues[1u].w) + productValue20) * varyingColor1.z);
    fragmentColor0.x = ((varyingColor2.x - productValue24) * varyingColor2.w) + productValue24;
    fragmentColor0.y = ((varyingColor2.y - productValue25) * varyingColor2.w) + productValue25;
    fragmentColor0.z = ((varyingColor2.z - productValue26) * varyingColor2.w) + productValue26;
#endif
    fragmentColor0.w = 1.0;
}
