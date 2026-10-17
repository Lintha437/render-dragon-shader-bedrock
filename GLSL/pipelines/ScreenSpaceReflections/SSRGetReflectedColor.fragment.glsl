#version 460
#extension GL_GOOGLE_include_directive : require
// ScreenSpaceReflections / SSRGetReflectedColor / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/ScreenSpaceReflections/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue7.x;
    float scalarValue15 = sampledTextureValue7.y;
    float scalarValue16 = sampledTextureValue7.w;
    float scalarValue17 = dFdxCoarse(scalarValue15);
    float scalarValue18 = dFdyCoarse(scalarValue15);
    float scalarValue19 = dFdxCoarse(scalarValue14);
    float scalarValue20 = dFdyCoarse(scalarValue14);
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    if (scalarValue16 >= 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue7.x;
    float scalarValue15 = sampledTextureValue7.y;
    float scalarValue16 = sampledTextureValue7.w;
    float scalarValue18 = dFdyCoarse(scalarValue15);
    float scalarValue17 = dFdxCoarse(scalarValue15);
    float scalarValue20 = dFdyCoarse(scalarValue14);
    float scalarValue19 = dFdxCoarse(scalarValue14);
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    if (scalarValue16 >= 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(inputTextureTexture, inputTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.w;
    float sampledTextureValue1 = (texture(sampler2D(gbufferDepthTexture, gbufferDepthSampler), vec2(scalarValue, sampledTextureValue.y)).x * fragmentVectorConstants1.packedValues[6u].w) + fragmentVectorConstants1.packedValues[7u].w;
    float quotientValue = (((scalarValue * 2.0) + (-1.0)) * fragmentVectorConstants1.packedValues[4u].x) / sampledTextureValue1;
    float quotientValue1 = ((((1.0 - sampledTextureValue.y) * 2.0) + (-1.0)) * fragmentVectorConstants1.packedValues[5u].y) / sampledTextureValue1;
    float quotientValue10 = fragmentVectorConstants1.packedValues[7u].z / sampledTextureValue1;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue10, fma(fragmentVectorConstants1.packedValues[1u].x, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue10, fma(fragmentVectorConstants1.packedValues[1u].y, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y;
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue10, fma(fragmentVectorConstants1.packedValues[1u].z, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[10u].w, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[9u].w, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (!(scalarValue1 >= 0.0))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float multiplyAddValue12 = fma(fma(scalarValue14, 1.0, 0.0), 2.0, -1.0) * fragmentScalarConstants1.packedValues[16u];
        precise float multiplyAddValue21 = fma(fma(scalarValue15, -1.0, 1.0), 2.0, -1.0) * fragmentScalarConstants1.packedValues[21u];
        float sampledTextureValue8 = fma(textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(scalarValue14, scalarValue15), vec2(scalarValue19, scalarValue17), vec2(scalarValue20, scalarValue18)).x, fragmentScalarConstants1.packedValues[27u], fragmentScalarConstants1.packedValues[31u]);
        precise float quotientValue17 = multiplyAddValue12 / sampledTextureValue8;
        precise float quotientValue18 = multiplyAddValue21 / sampledTextureValue8;
        precise float quotientValue19 = fragmentScalarConstants1.packedValues[30u] / sampledTextureValue8;
        precise float productValue5 = quotientValue18 * fragmentVectorConstants1.packedValues[1u].x;
        precise float productValue6 = quotientValue18 * fragmentVectorConstants1.packedValues[1u].y;
        precise float productValue7 = quotientValue18 * fragmentVectorConstants1.packedValues[1u].z;
        precise float multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue19, fma(fragmentVectorConstants1.packedValues[0u].x, quotientValue17, productValue5)) + fragmentVectorConstants1.packedValues[3u].x;
        precise float multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue19, fma(fragmentVectorConstants1.packedValues[0u].y, quotientValue17, productValue6)) + fragmentVectorConstants1.packedValues[3u].y;
        precise float multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue19, fma(fragmentVectorConstants1.packedValues[0u].z, quotientValue17, productValue7)) + fragmentVectorConstants1.packedValues[3u].z;
        precise float productValue8 = multiplyAddValue27 * fragmentVectorConstants1.packedValues[9u].x;
        precise float productValue9 = multiplyAddValue27 * fragmentVectorConstants1.packedValues[9u].y;
        precise float productValue10 = multiplyAddValue27 * fragmentScalarConstants1.packedValues[39u];
        precise float multiplyAddValue29 = fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue28, fma(fragmentVectorConstants1.packedValues[8u].x, multiplyAddValue26, productValue8)) + fragmentVectorConstants1.packedValues[11u].x;
        precise float multiplyAddValue30 = fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue28, fma(fragmentVectorConstants1.packedValues[8u].y, multiplyAddValue26, productValue9)) + fragmentVectorConstants1.packedValues[11u].y;
        precise float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[43u], multiplyAddValue28, fma(fragmentScalarConstants1.packedValues[35u], multiplyAddValue26, productValue10)) + fragmentScalarConstants1.packedValues[47u];
        precise float quotientValue20 = multiplyAddValue29 / multiplyAddValue31;
        precise float quotientValue21 = multiplyAddValue30 / multiplyAddValue31;
        precise float sumValue17 = quotientValue20 + 1.0;
        precise float sumValue18 = quotientValue21 + 1.0;
        precise float productValue11 = sumValue17 * 0.5;
        vec4 sampledTextureValue9 = texture(sampler2D(materialTexture6, textureSampler6), vec2(productValue11, fma(-sumValue18, 0.5, 1.0)));
        intermediateValue18 = scalarValue16;
        intermediateValue19 = sampledTextureValue9.z;
        intermediateValue20 = sampledTextureValue9.y;
        intermediateValue21 = sampledTextureValue9.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue8 = fma(textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(scalarValue14, scalarValue15), vec2(scalarValue19, scalarValue17), vec2(scalarValue20, scalarValue18)).x, fragmentScalarConstants1.packedValues[27u], fragmentScalarConstants1.packedValues[31u]);
        float multiplyAddValue50 = (fma(scalarValue14, 2.0, -1.0) * fragmentScalarConstants1.packedValues[16u]) / sampledTextureValue8;
        float multiplyAddValue51 = (fma(1.0 - scalarValue15, 2.0, -1.0) * fragmentScalarConstants1.packedValues[21u]) / sampledTextureValue8;
        float quotientValue40 = fragmentScalarConstants1.packedValues[30u] / sampledTextureValue8;
        float multiplyAddValue52 = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue40, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue50, multiplyAddValue51 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x;
        float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue40, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue50, multiplyAddValue51 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y;
        float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue40, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue50, multiplyAddValue51 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z;
        float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[43u], multiplyAddValue54, fma(fragmentScalarConstants1.packedValues[35u], multiplyAddValue52, multiplyAddValue53 * fragmentScalarConstants1.packedValues[39u])) + fragmentScalarConstants1.packedValues[47u];
        vec4 sampledTextureValue14 = texture(sampler2D(materialTexture6, textureSampler6), vec2((((fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue54, fma(fragmentVectorConstants1.packedValues[8u].x, multiplyAddValue52, multiplyAddValue53 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue55) + 1.0) * 0.5, fma(-(((fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue54, fma(fragmentVectorConstants1.packedValues[8u].y, multiplyAddValue52, multiplyAddValue53 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue55) + 1.0), 0.5, 1.0)));
        intermediateValue18 = scalarValue16;
        intermediateValue19 = sampledTextureValue14.z;
        intermediateValue20 = sampledTextureValue14.y;
        intermediateValue21 = sampledTextureValue14.x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue2 = 0.0;
        intermediateValue3 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue18 = 0.0;
        intermediateValue19 = 0.0;
        intermediateValue20 = 0.0;
        intermediateValue21 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue2 = texture(sampler2D(rasterColorTexture, rasterColorSampler), vec2((((fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[9u].x, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue3) + 1.0) * 0.5, 1.0 - ((((fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[9u].y, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue3) + 1.0) * 0.5)));
        intermediateValue2 = sampledTextureValue2.x;
        intermediateValue3 = sampledTextureValue2.y;
        intermediateValue4 = sampledTextureValue2.z;
        intermediateValue5 = scalarValue1;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    float multiplyAddValue17;
    float multiplyAddValue18;
    float multiplyAddValue19;
    float multiplyAddValue20;
    if (fragmentScalarConstants1.packedValues[48u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue13;
    float multiplyAddValue14;
    float multiplyAddValue15;
    float multiplyAddValue16;
    if (fragmentScalarConstants1.packedValues[48u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue;
    float sumValue1;
    float sumValue2;
    float sumValue3;
    if (fragmentVectorConstants1.packedValues[12u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float multiplyAddValue32 = fma(fma(varyingTexCoord0.x, 1.0, 0.0), 2.0, -1.0) * fragmentScalarConstants1.packedValues[16u];
        precise float multiplyAddValue33 = fma(fma(varyingTexCoord0.y, -1.0, 1.0), 2.0, -1.0) * fragmentScalarConstants1.packedValues[21u];
        float multiplyAddValue34 = fma(sampledTextureValue7.z, fragmentScalarConstants1.packedValues[27u], fragmentScalarConstants1.packedValues[31u]);
        precise float quotientValue22 = multiplyAddValue32 / multiplyAddValue34;
        precise float quotientValue23 = multiplyAddValue33 / multiplyAddValue34;
        precise float quotientValue24 = fragmentScalarConstants1.packedValues[30u] / multiplyAddValue34;
        precise float productValue12 = quotientValue23 * fragmentVectorConstants1.packedValues[1u].x;
        precise float productValue13 = quotientValue23 * fragmentVectorConstants1.packedValues[1u].y;
        precise float productValue14 = quotientValue23 * fragmentVectorConstants1.packedValues[1u].z;
        precise float multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue24, fma(fragmentVectorConstants1.packedValues[0u].x, quotientValue22, productValue12)) + fragmentVectorConstants1.packedValues[3u].x;
        precise float multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue24, fma(fragmentVectorConstants1.packedValues[0u].y, quotientValue22, productValue13)) + fragmentVectorConstants1.packedValues[3u].y;
        precise float multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue24, fma(fragmentVectorConstants1.packedValues[0u].z, quotientValue22, productValue14)) + fragmentVectorConstants1.packedValues[3u].z;
        precise float productValue15 = multiplyAddValue36 * fragmentVectorConstants1.packedValues[9u].x;
        precise float productValue16 = multiplyAddValue36 * fragmentVectorConstants1.packedValues[9u].y;
        precise float productValue17 = multiplyAddValue36 * fragmentScalarConstants1.packedValues[39u];
        precise float multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue37, fma(fragmentVectorConstants1.packedValues[8u].x, multiplyAddValue35, productValue15)) + fragmentVectorConstants1.packedValues[11u].x;
        precise float multiplyAddValue39 = fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue37, fma(fragmentVectorConstants1.packedValues[8u].y, multiplyAddValue35, productValue16)) + fragmentVectorConstants1.packedValues[11u].y;
        precise float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[43u], multiplyAddValue37, fma(fragmentScalarConstants1.packedValues[35u], multiplyAddValue35, productValue17)) + fragmentScalarConstants1.packedValues[47u];
        precise float quotientValue25 = multiplyAddValue38 / multiplyAddValue40;
        precise float quotientValue26 = multiplyAddValue39 / multiplyAddValue40;
        precise float sumValue19 = quotientValue25 + 1.0;
        precise float sumValue20 = quotientValue26 + 1.0;
        precise float productValue18 = sumValue19 * fragmentScalarConstants1.packedValues[58u];
        uint scalarValue21 = uint(int(fragmentScalarConstants1.packedValues[50u]));
        uint scalarValue22 = -scalarValue21;
        float intermediateValue24;
        float intermediateValue26;
        float intermediateValue28;
        float intermediateValue30;
        float intermediateValue32;
        float intermediateValue34;
        float intermediateValue36;
        float intermediateValue38;
        float intermediateValue40;
        intermediateValue24 = 0.0;
        intermediateValue26 = 0.0;
        intermediateValue28 = 0.0;
        intermediateValue30 = 0.0;
        intermediateValue32 = 0.0;
        intermediateValue34 = 0.0;
        intermediateValue36 = 0.0;
        intermediateValue38 = 0.0;
        intermediateValue40 = 0.0;
        uint sumValue8;
        float intermediateValue25;
        float intermediateValue27;
        float intermediateValue29;
        float intermediateValue31;
        float intermediateValue33;
        float intermediateValue35;
        float intermediateValue37;
        float intermediateValue39;
        float intermediateValue41;
        uint scalarValue23 = scalarValue22;
        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue34 = fma(sampledTextureValue7.z, fragmentScalarConstants1.packedValues[27u], fragmentScalarConstants1.packedValues[31u]);
        float multiplyAddValue56 = (fma(varyingTexCoord0.x, 2.0, -1.0) * fragmentScalarConstants1.packedValues[16u]) / multiplyAddValue34;
        float multiplyAddValue57 = (fma(1.0 - varyingTexCoord0.y, 2.0, -1.0) * fragmentScalarConstants1.packedValues[21u]) / multiplyAddValue34;
        float quotientValue41 = fragmentScalarConstants1.packedValues[30u] / multiplyAddValue34;
        float multiplyAddValue58 = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue41, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x;
        float multiplyAddValue59 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue41, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y;
        float multiplyAddValue60 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue41, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z;
        float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[43u], multiplyAddValue60, fma(fragmentScalarConstants1.packedValues[35u], multiplyAddValue58, multiplyAddValue59 * fragmentScalarConstants1.packedValues[39u])) + fragmentScalarConstants1.packedValues[47u];
        uint scalarValue21 = uint(int(fragmentScalarConstants1.packedValues[50u]));
        uint scalarValue22 = -scalarValue21;
        float intermediateValue24;
        float intermediateValue26;
        float intermediateValue28;
        float intermediateValue30;
        float intermediateValue32;
        float intermediateValue34;
        float intermediateValue36;
        float intermediateValue38;
        float intermediateValue40;
        intermediateValue24 = 0.0;
        intermediateValue26 = 0.0;
        intermediateValue28 = 0.0;
        intermediateValue30 = 0.0;
        intermediateValue32 = 0.0;
        intermediateValue34 = 0.0;
        intermediateValue36 = 0.0;
        intermediateValue38 = 0.0;
        intermediateValue40 = 0.0;
        uint sumValue;
        float intermediateValue25;
        float intermediateValue27;
        float intermediateValue29;
        float intermediateValue31;
        float intermediateValue33;
        float intermediateValue35;
        float intermediateValue37;
        float intermediateValue39;
        float intermediateValue41;
        uint scalarValue23 = scalarValue22;
        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue = (sampledTextureValue.z * fragmentVectorConstants1.packedValues[6u].w) + fragmentVectorConstants1.packedValues[7u].w;
        float quotientValue11 = (fragmentVectorConstants1.packedValues[4u].x * ((varyingTexCoord0.x * 2.0) + (-1.0))) / productValue;
        float quotientValue12 = (fragmentVectorConstants1.packedValues[5u].y * (((1.0 - varyingTexCoord0.y) * 2.0) + (-1.0))) / productValue;
        float quotientValue13 = fragmentVectorConstants1.packedValues[7u].z / productValue;
        float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue13, fma(fragmentVectorConstants1.packedValues[1u].x, quotientValue12, quotientValue11 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x;
        float multiplyAddValue5 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue13, fma(fragmentVectorConstants1.packedValues[1u].y, quotientValue12, quotientValue11 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y;
        float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue13, fma(fragmentVectorConstants1.packedValues[1u].z, quotientValue12, quotientValue11 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z;
        float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[10u].w, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[9u].w, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
        uint scalarValue2 = uint(int(fragmentVectorConstants1.packedValues[12u].z));
        uint scalarValue3 = -scalarValue2;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        if (int(scalarValue2) < int(scalarValue3))
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            if (int(scalarValue21) < int(scalarValue23))
            {
                break;
            }
            float scalarValue24 = rdSignedBitsToFloat(scalarValue23);
            intermediateValue25 = intermediateValue24;
            intermediateValue27 = intermediateValue26;
            intermediateValue29 = intermediateValue28;
            intermediateValue31 = intermediateValue30;
            intermediateValue33 = intermediateValue32;
            intermediateValue35 = intermediateValue34;
            intermediateValue37 = intermediateValue36;
            intermediateValue39 = intermediateValue38;
            intermediateValue41 = intermediateValue40;
            precise float sumValue10;
            float multiplyAddValue22;
            float multiplyAddValue23;
            float multiplyAddValue24;
            float multiplyAddValue25;
            precise float sumValue11;
            precise float sumValue12;
            precise float sumValue13;
            precise float sumValue14;
            uint sumValue15;
            uint scalarValue25 = scalarValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            if (int(scalarValue21) < int(scalarValue23))
            {
                break;
            }
            float scalarValue24 = rdSignedBitsToFloat(scalarValue23);
            intermediateValue25 = intermediateValue24;
            intermediateValue27 = intermediateValue26;
            intermediateValue29 = intermediateValue28;
            intermediateValue31 = intermediateValue30;
            intermediateValue33 = intermediateValue32;
            intermediateValue35 = intermediateValue34;
            intermediateValue37 = intermediateValue36;
            intermediateValue39 = intermediateValue38;
            intermediateValue41 = intermediateValue40;
            float sumValue2;
            float multiplyAddValue17;
            float multiplyAddValue18;
            float multiplyAddValue19;
            float multiplyAddValue20;
            float quotientValue2;
            float quotientValue3;
            float quotientValue4;
            float quotientValue5;
            uint sumValue3;
            uint scalarValue25 = scalarValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue8 = -1.0;
            intermediateValue9 = 0.0;
            intermediateValue10 = 0.0;
            intermediateValue11 = 0.0;
            intermediateValue12 = 0.0;
            intermediateValue13 = 0.0;
            intermediateValue14 = 0.0;
            intermediateValue15 = 0.0;
            intermediateValue16 = 0.0;
        }
        else
        {
            float quotientValue6;
            float quotientValue7;
            float quotientValue8;
            float quotientValue9;
            float productValue1;
            float productValue2;
            float productValue3;
            float productValue4;
            float sumValue5;
            float intermediateValue27;
            uint intermediateValue28;
            float intermediateValue29;
            float intermediateValue30;
            float intermediateValue31;
            float intermediateValue32;
            float intermediateValue33;
            float intermediateValue34;
            float intermediateValue35;
            float intermediateValue36;
            float scalarValue4 = 0.0;
            uint scalarValue5 = scalarValue3;
            float scalarValue6 = 0.0;
            float scalarValue7 = 0.0;
            float scalarValue8 = 0.0;
            float scalarValue9 = 0.0;
            float scalarValue10 = 0.0;
            float scalarValue11 = 0.0;
            float scalarValue12 = 0.0;
            float scalarValue13 = 0.0;
#endif
            for (;;)
            {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
                if (int(scalarValue21) < int(scalarValue25))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue27 = scalarValue4;
                intermediateValue28 = scalarValue3;
                intermediateValue29 = scalarValue6;
                intermediateValue30 = scalarValue7;
                intermediateValue31 = scalarValue8;
                intermediateValue32 = scalarValue9;
                intermediateValue33 = scalarValue10;
                intermediateValue34 = scalarValue11;
                intermediateValue35 = scalarValue12;
                intermediateValue36 = scalarValue13;
                float intermediateValue40;
                float intermediateValue41;
                float intermediateValue42;
                float intermediateValue43;
                float intermediateValue37;
                float intermediateValue38;
                float intermediateValue39;
                bool comparisonValue;
                for (;;)
                {
                    vec4 sampledTextureValue3 = texture(sampler2D(inputTextureTexture, inputTextureSampler), vec2((fragmentVectorConstants1.packedValues[13u].z * float(int(scalarValue5))) + varyingTexCoord0.x, (fragmentVectorConstants1.packedValues[13u].w * float(int(intermediateValue28))) + varyingTexCoord0.y));
                    intermediateValue37 = sampledTextureValue3.x;
                    intermediateValue38 = sampledTextureValue3.y;
                    intermediateValue39 = sampledTextureValue3.w;
                    comparisonValue = !(intermediateValue39 >= 0.0);
                    float branchMergedValue;
                    float branchMergedValue1;
                    float branchMergedValue2;
                    float branchMergedValue3;
                    if (comparisonValue)
                    {
                        branchMergedValue = 0.0;
                        branchMergedValue1 = 0.0;
                        branchMergedValue2 = 0.0;
                        branchMergedValue3 = 0.0;
                    }
                    else
                    {
                        float sampledTextureValue4 = (texture(sampler2D(gbufferDepthTexture, gbufferDepthSampler), vec2(intermediateValue37, intermediateValue38)).x * fragmentVectorConstants1.packedValues[6u].w) + fragmentVectorConstants1.packedValues[7u].w;
                        float quotientValue14 = (((intermediateValue37 * 2.0) + (-1.0)) * fragmentVectorConstants1.packedValues[4u].x) / sampledTextureValue4;
                        float quotientValue15 = ((((1.0 - intermediateValue38) * 2.0) + (-1.0)) * fragmentVectorConstants1.packedValues[5u].y) / sampledTextureValue4;
                        float quotientValue16 = fragmentVectorConstants1.packedValues[7u].z / sampledTextureValue4;
                        float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue16, fma(fragmentVectorConstants1.packedValues[1u].x, quotientValue15, quotientValue14 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x;
                        float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue16, fma(fragmentVectorConstants1.packedValues[1u].y, quotientValue15, quotientValue14 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y;
                        float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue16, fma(fragmentVectorConstants1.packedValues[1u].z, quotientValue15, quotientValue14 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z;
                        float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[10u].w, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[9u].w, multiplyAddValue9, multiplyAddValue8 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
                        vec4 sampledTextureValue5 = texture(sampler2D(rasterColorTexture, rasterColorSampler), vec2((((fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[9u].x, multiplyAddValue9, multiplyAddValue8 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue11) + 1.0) * 0.5, 1.0 - ((((fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[9u].y, multiplyAddValue9, multiplyAddValue8 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue11) + 1.0) * 0.5)));
                        branchMergedValue = intermediateValue39;
                        branchMergedValue1 = sampledTextureValue5.z;
                        branchMergedValue2 = sampledTextureValue5.y;
                        branchMergedValue3 = sampledTextureValue5.x;
                    }
                    intermediateValue43 = branchMergedValue;
                    intermediateValue42 = branchMergedValue1;
                    intermediateValue41 = branchMergedValue2;
                    intermediateValue40 = branchMergedValue3;
                    sumValue5 = intermediateValue27 + 1.0;
                    float sumValue4 = intermediateValue40 - intermediateValue29;
                    float sumValue6 = intermediateValue41 - intermediateValue30;
                    float sumValue7 = intermediateValue42 - intermediateValue31;
                    float sumValue9 = intermediateValue43 - intermediateValue32;
                    quotientValue6 = (sumValue4 / sumValue5) + intermediateValue29;
                    quotientValue7 = (sumValue6 / sumValue5) + intermediateValue30;
                    quotientValue8 = (sumValue7 / sumValue5) + intermediateValue31;
                    quotientValue9 = (sumValue9 / sumValue5) + intermediateValue32;
                    productValue1 = ((intermediateValue40 - quotientValue6) * sumValue4) + intermediateValue33;
                    productValue2 = ((intermediateValue41 - quotientValue7) * sumValue6) + intermediateValue34;
                    productValue3 = ((intermediateValue42 - quotientValue8) * sumValue7) + intermediateValue35;
                    productValue4 = ((intermediateValue43 - quotientValue9) * sumValue9) + intermediateValue36;
                    if (int(intermediateValue28) < int(scalarValue2))
                    {
                        intermediateValue27 = sumValue5;
                        intermediateValue28++;
                        intermediateValue29 = quotientValue6;
                        intermediateValue30 = quotientValue7;
                        intermediateValue31 = quotientValue8;
                        intermediateValue32 = quotientValue9;
                        intermediateValue33 = productValue1;
                        intermediateValue34 = productValue2;
                        intermediateValue35 = productValue3;
                        intermediateValue36 = productValue4;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                if (int(scalarValue5) < int(scalarValue2))
                {
                    scalarValue4 = sumValue5;
                    scalarValue5++;
                    scalarValue6 = quotientValue6;
                    scalarValue7 = quotientValue7;
                    scalarValue8 = quotientValue8;
                    scalarValue9 = quotientValue9;
                    scalarValue10 = productValue1;
                    scalarValue11 = productValue2;
                    scalarValue12 = productValue3;
                    scalarValue13 = productValue4;
                    continue;
                }
                else
#endif
                {
                    break;
                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                vec4 sampledTextureValue10 = texture(sampler2D(materialTexture4, textureSampler4), vec2(fma(scalarValue24, fragmentVectorConstants1.packedValues[13u].z, varyingTexCoord0.x), fma(rdSignedBitsToFloat(scalarValue25), fragmentVectorConstants1.packedValues[13u].w, varyingTexCoord0.y)));
                float scalarValue26 = sampledTextureValue10.x;
                float scalarValue27 = sampledTextureValue10.y;
                float scalarValue28 = sampledTextureValue10.w;
                float scalarValue29 = dFdxCoarse(scalarValue26);
                float scalarValue30 = dFdyCoarse(scalarValue26);
                float scalarValue31 = dFdyCoarse(scalarValue27);
                float scalarValue32 = dFdxCoarse(scalarValue27);
                float intermediateValue53;
                float intermediateValue54;
                float intermediateValue55;
                float intermediateValue56;
                if (scalarValue28 >= 0.0)
                {
                    precise float multiplyAddValue41 = fma(fma(scalarValue26, 1.0, 0.0), 2.0, -1.0) * fragmentScalarConstants1.packedValues[16u];
                    precise float multiplyAddValue42 = fma(fma(scalarValue27, -1.0, 1.0), 2.0, -1.0) * fragmentScalarConstants1.packedValues[21u];
                    float sampledTextureValue11 = fma(textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(scalarValue26, scalarValue27), vec2(scalarValue29, scalarValue32), vec2(scalarValue30, scalarValue31)).x, fragmentScalarConstants1.packedValues[27u], fragmentScalarConstants1.packedValues[31u]);
                    precise float quotientValue27 = multiplyAddValue41 / sampledTextureValue11;
                    precise float quotientValue28 = multiplyAddValue42 / sampledTextureValue11;
                    precise float quotientValue29 = fragmentScalarConstants1.packedValues[30u] / sampledTextureValue11;
                    precise float productValue19 = quotientValue28 * fragmentVectorConstants1.packedValues[1u].x;
                    precise float productValue20 = quotientValue28 * fragmentVectorConstants1.packedValues[1u].y;
                    precise float productValue21 = quotientValue28 * fragmentVectorConstants1.packedValues[1u].z;
                    precise float multiplyAddValue43 = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue29, fma(fragmentVectorConstants1.packedValues[0u].x, quotientValue27, productValue19)) + fragmentVectorConstants1.packedValues[3u].x;
                    precise float multiplyAddValue44 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue29, fma(fragmentVectorConstants1.packedValues[0u].y, quotientValue27, productValue20)) + fragmentVectorConstants1.packedValues[3u].y;
                    precise float multiplyAddValue45 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue29, fma(fragmentVectorConstants1.packedValues[0u].z, quotientValue27, productValue21)) + fragmentVectorConstants1.packedValues[3u].z;
                    precise float productValue22 = multiplyAddValue44 * fragmentVectorConstants1.packedValues[9u].x;
                    precise float productValue23 = multiplyAddValue44 * fragmentVectorConstants1.packedValues[9u].y;
                    precise float productValue24 = multiplyAddValue44 * fragmentScalarConstants1.packedValues[39u];
                    precise float multiplyAddValue46 = fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue45, fma(fragmentVectorConstants1.packedValues[8u].x, multiplyAddValue43, productValue22)) + fragmentVectorConstants1.packedValues[11u].x;
                    precise float multiplyAddValue47 = fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue45, fma(fragmentVectorConstants1.packedValues[8u].y, multiplyAddValue43, productValue23)) + fragmentVectorConstants1.packedValues[11u].y;
                    precise float multiplyAddValue48 = fma(fragmentScalarConstants1.packedValues[43u], multiplyAddValue45, fma(fragmentScalarConstants1.packedValues[35u], multiplyAddValue43, productValue24)) + fragmentScalarConstants1.packedValues[47u];
                    precise float quotientValue30 = multiplyAddValue46 / multiplyAddValue48;
                    precise float quotientValue31 = multiplyAddValue47 / multiplyAddValue48;
                    precise float sumValue21 = quotientValue30 + 1.0;
                    precise float sumValue22 = quotientValue31 + 1.0;
                    precise float productValue25 = sumValue21 * 0.5;
                    vec4 sampledTextureValue12 = texture(sampler2D(materialTexture6, textureSampler6), vec2(productValue25, fma(-sumValue22, 0.5, 1.0)));
                    intermediateValue53 = scalarValue28;
                    intermediateValue54 = sampledTextureValue12.z;
                    intermediateValue55 = sampledTextureValue12.y;
                    intermediateValue56 = sampledTextureValue12.x;
                }
                else
                {
                    intermediateValue53 = 0.0;
                    intermediateValue54 = 0.0;
                    intermediateValue55 = 0.0;
                    intermediateValue56 = 0.0;
                }
                sumValue10 = intermediateValue25 + 1.0;
                precise float sumValue23 = intermediateValue56 - intermediateValue41;
                precise float sumValue24 = intermediateValue55 - intermediateValue39;
                precise float sumValue25 = intermediateValue54 - intermediateValue37;
                precise float sumValue26 = intermediateValue53 - intermediateValue35;
                precise float quotientValue32 = sumValue23 / sumValue10;
                precise float quotientValue33 = sumValue24 / sumValue10;
                precise float quotientValue34 = sumValue25 / sumValue10;
                precise float quotientValue35 = sumValue26 / sumValue10;
                sumValue14 = intermediateValue41 + quotientValue32;
                sumValue13 = intermediateValue39 + quotientValue33;
                sumValue12 = intermediateValue37 + quotientValue34;
                sumValue11 = intermediateValue35 + quotientValue35;
                precise float sumValue27 = intermediateValue56 - sumValue14;
                precise float sumValue28 = intermediateValue55 - sumValue13;
                precise float sumValue29 = intermediateValue54 - sumValue12;
                precise float sumValue30 = intermediateValue53 - sumValue11;
                multiplyAddValue25 = fma(sumValue23, sumValue27, intermediateValue33);
                multiplyAddValue24 = fma(sumValue24, sumValue28, intermediateValue31);
                multiplyAddValue23 = fma(sumValue25, sumValue29, intermediateValue29);
                multiplyAddValue22 = fma(sumValue26, sumValue30, intermediateValue27);
                sumValue15 = scalarValue25 + 1u;
                intermediateValue25 = sumValue10;
                intermediateValue27 = multiplyAddValue22;
                intermediateValue29 = multiplyAddValue23;
                intermediateValue31 = multiplyAddValue24;
                intermediateValue33 = multiplyAddValue25;
                intermediateValue35 = sumValue11;
                intermediateValue37 = sumValue12;
                intermediateValue39 = sumValue13;
                intermediateValue41 = sumValue14;
                scalarValue25 = sumValue15;
                continue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                vec4 sampledTextureValue10 = texture(sampler2D(materialTexture4, textureSampler4), vec2(fma(scalarValue24, fragmentVectorConstants1.packedValues[13u].z, varyingTexCoord0.x), fma(rdSignedBitsToFloat(scalarValue25), fragmentVectorConstants1.packedValues[13u].w, varyingTexCoord0.y)));
                float scalarValue26 = sampledTextureValue10.x;
                float scalarValue27 = sampledTextureValue10.y;
                float scalarValue28 = sampledTextureValue10.w;
                float scalarValue32 = dFdxCoarse(scalarValue27);
                float scalarValue30 = dFdyCoarse(scalarValue26);
                float scalarValue29 = dFdxCoarse(scalarValue26);
                float scalarValue31 = dFdyCoarse(scalarValue27);
                float intermediateValue53;
                float intermediateValue54;
                float intermediateValue55;
                float intermediateValue56;
                if (scalarValue28 >= 0.0)
                {
                    float sampledTextureValue11 = fma(textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(scalarValue26, scalarValue27), vec2(scalarValue29, scalarValue32), vec2(scalarValue30, scalarValue31)).x, fragmentScalarConstants1.packedValues[27u], fragmentScalarConstants1.packedValues[31u]);
                    float multiplyAddValue62 = (fma(scalarValue26, 2.0, -1.0) * fragmentScalarConstants1.packedValues[16u]) / sampledTextureValue11;
                    float multiplyAddValue63 = (fma(1.0 - scalarValue27, 2.0, -1.0) * fragmentScalarConstants1.packedValues[21u]) / sampledTextureValue11;
                    float quotientValue42 = fragmentScalarConstants1.packedValues[30u] / sampledTextureValue11;
                    float multiplyAddValue64 = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue42, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue62, multiplyAddValue63 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x;
                    float multiplyAddValue65 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue42, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue62, multiplyAddValue63 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y;
                    float multiplyAddValue66 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue42, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue62, multiplyAddValue63 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z;
                    float multiplyAddValue67 = fma(fragmentScalarConstants1.packedValues[43u], multiplyAddValue66, fma(fragmentScalarConstants1.packedValues[35u], multiplyAddValue64, multiplyAddValue65 * fragmentScalarConstants1.packedValues[39u])) + fragmentScalarConstants1.packedValues[47u];
                    vec4 sampledTextureValue15 = texture(sampler2D(materialTexture6, textureSampler6), vec2((((fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue66, fma(fragmentVectorConstants1.packedValues[8u].x, multiplyAddValue64, multiplyAddValue65 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue67) + 1.0) * 0.5, fma(-(((fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue66, fma(fragmentVectorConstants1.packedValues[8u].y, multiplyAddValue64, multiplyAddValue65 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue67) + 1.0), 0.5, 1.0)));
                    intermediateValue53 = scalarValue28;
                    intermediateValue54 = sampledTextureValue15.z;
                    intermediateValue55 = sampledTextureValue15.y;
                    intermediateValue56 = sampledTextureValue15.x;
                }
                else
                {
                    intermediateValue53 = 0.0;
                    intermediateValue54 = 0.0;
                    intermediateValue55 = 0.0;
                    intermediateValue56 = 0.0;
                }
                sumValue2 = intermediateValue25 + 1.0;
                float sumValue36 = intermediateValue56 - intermediateValue41;
                float sumValue37 = intermediateValue55 - intermediateValue39;
                float sumValue38 = intermediateValue54 - intermediateValue37;
                float sumValue39 = intermediateValue53 - intermediateValue35;
                quotientValue5 = intermediateValue41 + (sumValue36 / sumValue2);
                quotientValue4 = intermediateValue39 + (sumValue37 / sumValue2);
                quotientValue3 = intermediateValue37 + (sumValue38 / sumValue2);
                quotientValue2 = intermediateValue35 + (sumValue39 / sumValue2);
                multiplyAddValue20 = fma(sumValue36, intermediateValue56 - quotientValue5, intermediateValue33);
                multiplyAddValue19 = fma(sumValue37, intermediateValue55 - quotientValue4, intermediateValue31);
                multiplyAddValue18 = fma(sumValue38, intermediateValue54 - quotientValue3, intermediateValue29);
                multiplyAddValue17 = fma(sumValue39, intermediateValue53 - quotientValue2, intermediateValue27);
                sumValue3 = scalarValue25 + 1u;
                intermediateValue25 = sumValue2;
                intermediateValue27 = multiplyAddValue17;
                intermediateValue29 = multiplyAddValue18;
                intermediateValue31 = multiplyAddValue19;
                intermediateValue33 = multiplyAddValue20;
                intermediateValue35 = quotientValue2;
                intermediateValue37 = quotientValue3;
                intermediateValue39 = quotientValue4;
                intermediateValue41 = quotientValue5;
                scalarValue25 = sumValue3;
                continue;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM40
            sumValue8 = scalarValue23 + 1u;
            intermediateValue24 = intermediateValue25;
            intermediateValue26 = intermediateValue27;
            intermediateValue28 = intermediateValue29;
            intermediateValue30 = intermediateValue31;
            intermediateValue32 = intermediateValue33;
            intermediateValue34 = intermediateValue35;
            intermediateValue36 = intermediateValue37;
            intermediateValue38 = intermediateValue39;
            intermediateValue40 = intermediateValue41;
            scalarValue23 = sumValue8;
            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            sumValue = scalarValue23 + 1u;
            intermediateValue24 = intermediateValue25;
            intermediateValue26 = intermediateValue27;
            intermediateValue28 = intermediateValue29;
            intermediateValue30 = intermediateValue31;
            intermediateValue32 = intermediateValue33;
            intermediateValue34 = intermediateValue35;
            intermediateValue36 = intermediateValue37;
            intermediateValue38 = intermediateValue39;
            intermediateValue40 = intermediateValue41;
            scalarValue23 = sumValue;
            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            precise float sumValue16 = sumValue5 + (-1.0);
            intermediateValue8 = sumValue16;
            intermediateValue9 = quotientValue6;
            intermediateValue10 = quotientValue7;
            intermediateValue11 = quotientValue8;
            intermediateValue12 = quotientValue9;
            intermediateValue13 = productValue1;
            intermediateValue14 = productValue2;
            intermediateValue15 = productValue3;
            intermediateValue16 = productValue4;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float sumValue31 = intermediateValue24 - 1.0;
        precise float quotientValue36 = intermediateValue32 / sumValue31;
        precise float quotientValue37 = intermediateValue30 / sumValue31;
        precise float quotientValue38 = intermediateValue28 / sumValue31;
        precise float quotientValue39 = intermediateValue26 / sumValue31;
        precise float productValue26 = productValue18 * 0.5;
        precise float multiplyAddValue49 = fma(-sumValue20, 0.5, 1.0) * fragmentScalarConstants1.packedValues[59u];
        vec4 sampledTextureValue13 = texture(sampler2D(materialTexture5, textureSampler5), vec2(productValue26, multiplyAddValue49));
        float nonlinearValue4 = sqrt(spvNMax(quotientValue36, 0.0));
        float nonlinearValue5 = sqrt(spvNMax(quotientValue37, 0.0));
        float nonlinearValue6 = sqrt(spvNMax(quotientValue38, 0.0));
        float nonlinearValue7 = sqrt(spvNMax(quotientValue39, 0.0));
        float scalarValue33 = -fragmentScalarConstants1.packedValues[49u];
        multiplyAddValue17 = spvNMin(fma(fragmentScalarConstants1.packedValues[49u], nonlinearValue7, intermediateValue34), spvNMax(sampledTextureValue13.w, fma(scalarValue33, nonlinearValue7, intermediateValue34)));
        multiplyAddValue18 = spvNMin(fma(fragmentScalarConstants1.packedValues[49u], nonlinearValue6, intermediateValue36), spvNMax(sampledTextureValue13.z, fma(scalarValue33, nonlinearValue6, intermediateValue36)));
        multiplyAddValue19 = spvNMin(fma(fragmentScalarConstants1.packedValues[49u], nonlinearValue5, intermediateValue38), spvNMax(sampledTextureValue13.y, fma(scalarValue33, nonlinearValue5, intermediateValue38)));
        multiplyAddValue20 = spvNMin(fma(fragmentScalarConstants1.packedValues[49u], nonlinearValue4, intermediateValue40), spvNMax(sampledTextureValue13.x, fma(scalarValue33, nonlinearValue4, intermediateValue40)));
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float sumValue40 = intermediateValue24 - 1.0;
        vec4 sampledTextureValue16 = texture(sampler2D(materialTexture5, textureSampler5), vec2(((((fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[8u].x, multiplyAddValue58, multiplyAddValue59 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue61) + 1.0) * fragmentScalarConstants1.packedValues[58u]) * 0.5, fma(-(((fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[8u].y, multiplyAddValue58, multiplyAddValue59 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue61) + 1.0), 0.5, 1.0) * fragmentScalarConstants1.packedValues[59u]));
        float nonlinearValue8 = sqrt(spvNMax(intermediateValue32 / sumValue40, 0.0));
        float nonlinearValue9 = sqrt(spvNMax(intermediateValue30 / sumValue40, 0.0));
        float nonlinearValue10 = sqrt(spvNMax(intermediateValue28 / sumValue40, 0.0));
        float nonlinearValue11 = sqrt(spvNMax(intermediateValue26 / sumValue40, 0.0));
        float scalarValue33 = -fragmentScalarConstants1.packedValues[49u];
        multiplyAddValue13 = spvNMin(fma(fragmentScalarConstants1.packedValues[49u], nonlinearValue11, intermediateValue34), spvNMax(sampledTextureValue16.w, fma(scalarValue33, nonlinearValue11, intermediateValue34)));
        multiplyAddValue14 = spvNMin(fma(fragmentScalarConstants1.packedValues[49u], nonlinearValue10, intermediateValue36), spvNMax(sampledTextureValue16.z, fma(scalarValue33, nonlinearValue10, intermediateValue36)));
        multiplyAddValue15 = spvNMin(fma(fragmentScalarConstants1.packedValues[49u], nonlinearValue9, intermediateValue38), spvNMax(sampledTextureValue16.y, fma(scalarValue33, nonlinearValue9, intermediateValue38)));
        multiplyAddValue16 = spvNMin(fma(fragmentScalarConstants1.packedValues[49u], nonlinearValue8, intermediateValue40), spvNMax(sampledTextureValue16.x, fma(scalarValue33, nonlinearValue8, intermediateValue40)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue6 = texture(sampler2D(previousReflectionBufferTexture, previousReflectionBufferSampler), vec2(((((fma(fragmentVectorConstants1.packedValues[10u].x, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[9u].x, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue7) + 1.0) * 0.5) * fragmentVectorConstants1.packedValues[14u].z, fragmentVectorConstants1.packedValues[14u].w * (1.0 - ((((fma(fragmentVectorConstants1.packedValues[10u].y, multiplyAddValue6, fma(fragmentVectorConstants1.packedValues[9u].y, multiplyAddValue5, multiplyAddValue4 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue7) + 1.0) * 0.5))));
        float nonlinearValue = sqrt(spvNMax(0.0, intermediateValue13 / intermediateValue8)) * fragmentVectorConstants1.packedValues[12u].y;
        float nonlinearValue1 = sqrt(spvNMax(0.0, intermediateValue14 / intermediateValue8)) * fragmentVectorConstants1.packedValues[12u].y;
        float nonlinearValue2 = sqrt(spvNMax(0.0, intermediateValue15 / intermediateValue8)) * fragmentVectorConstants1.packedValues[12u].y;
        float nonlinearValue3 = sqrt(spvNMax(0.0, intermediateValue16 / intermediateValue8)) * fragmentVectorConstants1.packedValues[12u].y;
        sumValue = spvNMin(spvNMax(sampledTextureValue6.x, intermediateValue9 - nonlinearValue), nonlinearValue + intermediateValue9);
        sumValue1 = spvNMin(spvNMax(sampledTextureValue6.y, intermediateValue10 - nonlinearValue1), nonlinearValue1 + intermediateValue10);
        sumValue2 = spvNMin(spvNMax(sampledTextureValue6.z, intermediateValue11 - nonlinearValue2), nonlinearValue2 + intermediateValue11);
        sumValue3 = spvNMin(spvNMax(sampledTextureValue6.w, intermediateValue12 - nonlinearValue3), nonlinearValue3 + intermediateValue12);
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        multiplyAddValue17 = intermediateValue18;
        multiplyAddValue18 = intermediateValue19;
        multiplyAddValue19 = intermediateValue20;
        multiplyAddValue20 = intermediateValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue13 = intermediateValue18;
        multiplyAddValue14 = intermediateValue19;
        multiplyAddValue15 = intermediateValue20;
        multiplyAddValue16 = intermediateValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sumValue = intermediateValue2;
        sumValue1 = intermediateValue3;
        sumValue2 = intermediateValue4;
        sumValue3 = intermediateValue5;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue32 = intermediateValue21 - multiplyAddValue20;
    precise float sumValue33 = intermediateValue20 - multiplyAddValue19;
    precise float sumValue34 = intermediateValue19 - multiplyAddValue18;
    precise float sumValue35 = intermediateValue18 - multiplyAddValue17;
    fragmentColor0.x = fma(fragmentScalarConstants1.packedValues[51u], sumValue32, multiplyAddValue20);
    fragmentColor0.y = fma(fragmentScalarConstants1.packedValues[51u], sumValue33, multiplyAddValue19);
    fragmentColor0.z = fma(fragmentScalarConstants1.packedValues[51u], sumValue34, multiplyAddValue18);
    fragmentColor0.w = fma(fragmentScalarConstants1.packedValues[51u], sumValue35, multiplyAddValue17);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = fma(fragmentScalarConstants1.packedValues[51u], intermediateValue21 - multiplyAddValue16, multiplyAddValue16);
    fragmentColor0.y = fma(fragmentScalarConstants1.packedValues[51u], intermediateValue20 - multiplyAddValue15, multiplyAddValue15);
    fragmentColor0.z = fma(fragmentScalarConstants1.packedValues[51u], intermediateValue19 - multiplyAddValue14, multiplyAddValue14);
    fragmentColor0.w = fma(fragmentScalarConstants1.packedValues[51u], intermediateValue18 - multiplyAddValue13, multiplyAddValue13);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = ((intermediateValue2 - sumValue) * fragmentVectorConstants1.packedValues[12u].w) + sumValue;
    fragmentColor0.y = ((intermediateValue3 - sumValue1) * fragmentVectorConstants1.packedValues[12u].w) + sumValue1;
    fragmentColor0.z = ((intermediateValue4 - sumValue2) * fragmentVectorConstants1.packedValues[12u].w) + sumValue2;
    fragmentColor0.w = ((intermediateValue5 - sumValue3) * fragmentVectorConstants1.packedValues[12u].w) + sumValue3;
#endif
}
