#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandColor / Opaque / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 6
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/ItemInHandColor/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    float multiplyAddValue12 = fma(varyingColor0.w, fma(multiplyAddValue9, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue9), multiplyAddValue9);
    float multiplyAddValue13 = fma(varyingColor0.w, fma(multiplyAddValue10, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue10), multiplyAddValue10);
    float multiplyAddValue14 = fma(varyingColor0.w, fma(multiplyAddValue11, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue11), multiplyAddValue11);
    precise float sumValue3 = fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue12;
    precise float sumValue4 = fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue13;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue14;
    float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[7u], sumValue3, multiplyAddValue12);
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[7u], sumValue4, multiplyAddValue13);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[7u], sumValue5, multiplyAddValue14);
    precise float productValue18 = multiplyAddValue15 * varyingColor1.x;
    precise float productValue19 = multiplyAddValue16 * varyingColor1.y;
    precise float productValue20 = multiplyAddValue17 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue15, varyingColor1.x, varyingColor2.x), productValue18);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue16, varyingColor1.y, varyingColor2.y), productValue19);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue17, varyingColor1.z, varyingColor2.z), productValue20);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    precise float productValue21 = multiplyAddValue9 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue22 = multiplyAddValue9 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue23 = multiplyAddValue9 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue1 = ceil(multiplyAddValue10);
    float multiplyAddValue18 = fma(scalarValue1, fma(multiplyAddValue10, fragmentVectorConstants1.packedValues[3u].x, -productValue21), productValue21);
    float multiplyAddValue19 = fma(scalarValue1, fma(multiplyAddValue10, fragmentVectorConstants1.packedValues[3u].y, -productValue22), productValue22);
    float multiplyAddValue20 = fma(scalarValue1, fma(multiplyAddValue10, fragmentVectorConstants1.packedValues[3u].z, -productValue23), productValue23);
    precise float sumValue6 = fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue18;
    precise float sumValue7 = fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue19;
    precise float sumValue8 = fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue20;
    float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[7u], sumValue6, multiplyAddValue18);
    float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[7u], sumValue7, multiplyAddValue19);
    float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[7u], sumValue8, multiplyAddValue20);
    precise float productValue24 = multiplyAddValue21 * varyingColor1.x;
    precise float productValue25 = multiplyAddValue22 * varyingColor1.y;
    precise float productValue26 = multiplyAddValue23 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue21, varyingColor1.x, varyingColor2.x), productValue24);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue22, varyingColor1.y, varyingColor2.y), productValue25);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue23, varyingColor1.z, varyingColor2.z), productValue26);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue3 = fma(varyingColor0.w, fma(multiplyAddValue, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue), multiplyAddValue);
    float multiplyAddValue4 = fma(varyingColor0.w, fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue1), multiplyAddValue1);
    float multiplyAddValue5 = fma(varyingColor0.w, fma(multiplyAddValue2, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue2), multiplyAddValue2);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue3, multiplyAddValue3);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue4, multiplyAddValue4);
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue5, multiplyAddValue5);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue6, varyingColor1.x, varyingColor2.x), multiplyAddValue6 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue7, varyingColor1.y, varyingColor2.y), multiplyAddValue7 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor1.z, varyingColor2.z), multiplyAddValue8 * varyingColor1.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float productValue27 = multiplyAddValue * fragmentVectorConstants1.packedValues[0u].x;
    float productValue28 = multiplyAddValue * fragmentVectorConstants1.packedValues[0u].y;
    float productValue29 = multiplyAddValue * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue2 = ceil(multiplyAddValue1);
    float multiplyAddValue24 = fma(scalarValue2, fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[3u].x, -productValue27), productValue27);
    float multiplyAddValue25 = fma(scalarValue2, fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[3u].y, -productValue28), productValue28);
    float multiplyAddValue26 = fma(scalarValue2, fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[3u].z, -productValue29), productValue29);
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue24, multiplyAddValue24);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue25, multiplyAddValue25);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue26, multiplyAddValue26);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue27, varyingColor1.x, varyingColor2.x), multiplyAddValue27 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue28, varyingColor1.y, varyingColor2.y), multiplyAddValue28 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue29, varyingColor1.z, varyingColor2.z), multiplyAddValue29 * varyingColor1.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue2 = (fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0;
    float productValue3 = (((productValue * fragmentVectorConstants1.packedValues[0u].x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * fragmentVectorConstants1.packedValues[0u].y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * fragmentVectorConstants1.packedValues[0u].z) - productValue2) * varyingColor0.w) + productValue2;
    float productValue6 = (((fragmentVectorConstants1.packedValues[1u].x - productValue3) * fragmentVectorConstants1.packedValues[1u].w) + productValue3) * varyingColor1.x;
    float productValue7 = (((fragmentVectorConstants1.packedValues[1u].y - productValue4) * fragmentVectorConstants1.packedValues[1u].w) + productValue4) * varyingColor1.y;
    float productValue8 = (((fragmentVectorConstants1.packedValues[1u].z - productValue5) * fragmentVectorConstants1.packedValues[1u].w) + productValue5) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue9 = productValue * fragmentVectorConstants1.packedValues[0u].x;
    float productValue10 = productValue * fragmentVectorConstants1.packedValues[0u].y;
    float productValue11 = productValue * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue = ceil(productValue1);
    float productValue12 = (((productValue1 * fragmentVectorConstants1.packedValues[3u].x) - productValue9) * scalarValue) + productValue9;
    float productValue13 = (((productValue1 * fragmentVectorConstants1.packedValues[3u].y) - productValue10) * scalarValue) + productValue10;
    float productValue14 = (((productValue1 * fragmentVectorConstants1.packedValues[3u].z) - productValue11) * scalarValue) + productValue11;
    float productValue15 = (((fragmentVectorConstants1.packedValues[1u].x - productValue12) * fragmentVectorConstants1.packedValues[1u].w) + productValue12) * varyingColor1.x;
    float productValue16 = (((fragmentVectorConstants1.packedValues[1u].y - productValue13) * fragmentVectorConstants1.packedValues[1u].w) + productValue13) * varyingColor1.y;
    float productValue17 = (((fragmentVectorConstants1.packedValues[1u].z - productValue14) * fragmentVectorConstants1.packedValues[1u].w) + productValue14) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.y = ((varyingColor2.y - productValue16) * varyingColor2.w) + productValue16;
    fragmentColor0.z = ((varyingColor2.z - productValue17) * varyingColor2.w) + productValue17;
#endif
    fragmentColor0.w = 1.0;
}
