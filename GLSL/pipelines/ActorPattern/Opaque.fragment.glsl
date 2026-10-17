#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPattern / Opaque / fragment forward pipeline.
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
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_FEATURE_UIENTITY
#define RD_FEATURE_UIENTITY RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 6
#endif

#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
#extension GL_EXT_spirv_intrinsics : require
#endif
#if (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/ActorPattern/FragmentBindings.glsli"

#if (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    intermediateValue7 = sampledTextureValue2.z;
    intermediateValue8 = sampledTextureValue2.y;
    intermediateValue9 = sampledTextureValue2.x;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
    {
        if (int(scalarValue3) <= int(scalarValue4))
        {
            break;
        }
        uint sumValue4 = scalarValue4 + 9u;
        vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue5 = scalarValue4 + 2u;
        precise float bitwiseValue1 = sampledTextureValue3.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 32u) + 12u) >> 2u];
        multiplyAddValue2 = fma(bitwiseValue1, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[sumValue5].x, -intermediateValue9), intermediateValue9);
        multiplyAddValue1 = fma(bitwiseValue1, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[sumValue5].y, -intermediateValue8), intermediateValue8);
        multiplyAddValue = fma(bitwiseValue1, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[sumValue5].z, -intermediateValue7), intermediateValue7);
        sumValue = scalarValue4 + 1u;
        intermediateValue7 = multiplyAddValue;
        intermediateValue8 = multiplyAddValue1;
        intermediateValue9 = multiplyAddValue2;
        scalarValue4 = sumValue;
        continue;
    }
    precise float sumValue6 = varyingColor2.x - intermediateValue9;
    precise float sumValue7 = varyingColor2.y - intermediateValue8;
    precise float sumValue8 = varyingColor2.z - intermediateValue7;
    fragmentColor0.x = fma(varyingColor2.w, sumValue6, intermediateValue9);
    fragmentColor0.y = fma(varyingColor2.w, sumValue7, intermediateValue8);
    fragmentColor0.z = fma(varyingColor2.w, sumValue8, intermediateValue7);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[4u];
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    intermediateValue7 = sampledTextureValue2.z;
    intermediateValue8 = sampledTextureValue2.y;
    intermediateValue9 = sampledTextureValue2.x;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
    {
        if (int(scalarValue3) <= int(scalarValue4))
        {
            break;
        }
        uint sumValue4 = scalarValue4 + 9u;
        vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue5 = scalarValue4 + 2u;
        precise float bitwiseValue1 = sampledTextureValue3.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 32u) + 12u) >> 2u];
        multiplyAddValue2 = fma(bitwiseValue1, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[sumValue5].x, -intermediateValue9), intermediateValue9);
        multiplyAddValue1 = fma(bitwiseValue1, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[sumValue5].y, -intermediateValue8), intermediateValue8);
        multiplyAddValue = fma(bitwiseValue1, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[sumValue5].z, -intermediateValue7), intermediateValue7);
        sumValue = scalarValue4 + 1u;
        intermediateValue7 = multiplyAddValue;
        intermediateValue8 = multiplyAddValue1;
        intermediateValue9 = multiplyAddValue2;
        scalarValue4 = sumValue;
        continue;
    }
    precise float productValue9 = intermediateValue9 * varyingColor3.x;
    precise float productValue10 = intermediateValue8 * varyingColor3.y;
    precise float productValue11 = intermediateValue7 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-intermediateValue9, varyingColor3.x, varyingColor2.x), productValue9);
    fragmentColor0.y = fma(varyingColor2.w, fma(-intermediateValue8, varyingColor3.y, varyingColor2.y), productValue10);
    fragmentColor0.z = fma(varyingColor2.w, fma(-intermediateValue7, varyingColor3.z, varyingColor2.z), productValue11);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[4u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue3 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue4 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    precise float quotientValue4 = multiplyAddValue3 / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue4 / reinterpretedBits1;
    precise float productValue12 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue13 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue14 = productValue12 * 0.25;
    precise float productValue15 = productValue13 * 0.25;
    precise float productValue16 = productValue12 * 0.5;
    precise float productValue17 = productValue13 * 0.5;
    float scalarValue7 = floor(productValue13);
    float scalarValue8 = floor(productValue15);
    float scalarValue9 = floor(productValue17);
    precise float productValue18 = scalarValue8 * scalarValue8;
    precise float productValue19 = scalarValue9 * scalarValue9;
    precise float productValue20 = productValue18 * 0.75;
    precise float productValue21 = productValue19 * 0.75;
    precise float productValue22 = scalarValue7 * scalarValue7;
    precise float productValue23 = productValue22 * 0.75;
    precise float multiplyAddValue5 = fma(fma(fma(fract(fma(floor(productValue14), 0.5, productValue20)), 0.25, fract(fma(floor(productValue16), 0.5, productValue21))), 0.25, fract(fma(floor(productValue12), 0.5, productValue23))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue24 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue25 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue26 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits6 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits7 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits8 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    precise float sumValue9 = rdDot3Precise2(vec3(-productValue24, -productValue25, -productValue26), vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8)) - reinterpretedBits9;
    precise float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits9;
    precise float quotientValue6 = 1.0 / reinterpretedBits10;
    precise float productValue27 = quotientValue6 * sumValue9;
    float scalarValue10 = spvNClamp(productValue27, 0.0, 1.0);
    precise float productValue28 = scalarValue10 * scalarValue10;
    precise float multiplyAddValue6 = productValue28 * fma(scalarValue10, -2.0, 3.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue2.x;
    float scalarValue12 = sampledTextureValue2.y;
    float scalarValue13 = sampledTextureValue2.z;
    precise float reinterpretedBits11 = sampledTextureValue2.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
    fragmentColor0.w = ((multiplyAddValue5 >= multiplyAddValue6) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : reinterpretedBits11;
    precise float sumValue10 = varyingColor2.x - scalarValue11;
    precise float sumValue11 = varyingColor2.y - scalarValue12;
    precise float sumValue12 = varyingColor2.z - scalarValue13;
    fragmentColor0.x = fma(varyingColor2.w, sumValue10, scalarValue11);
    fragmentColor0.y = fma(varyingColor2.w, sumValue11, scalarValue12);
    fragmentColor0.z = fma(varyingColor2.w, sumValue12, scalarValue13);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue3 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue4 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    precise float quotientValue4 = multiplyAddValue3 / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue4 / reinterpretedBits1;
    precise float productValue12 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue13 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue14 = productValue12 * 0.25;
    precise float productValue15 = productValue13 * 0.25;
    precise float productValue16 = productValue12 * 0.5;
    precise float productValue17 = productValue13 * 0.5;
    float scalarValue7 = floor(productValue13);
    float scalarValue8 = floor(productValue15);
    float scalarValue9 = floor(productValue17);
    precise float productValue18 = scalarValue8 * scalarValue8;
    precise float productValue19 = scalarValue9 * scalarValue9;
    precise float productValue20 = productValue18 * 0.75;
    precise float productValue21 = productValue19 * 0.75;
    precise float productValue22 = scalarValue7 * scalarValue7;
    precise float productValue23 = productValue22 * 0.75;
    precise float multiplyAddValue5 = fma(fma(fma(fract(fma(floor(productValue14), 0.5, productValue20)), 0.25, fract(fma(floor(productValue16), 0.5, productValue21))), 0.25, fract(fma(floor(productValue12), 0.5, productValue23))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue24 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue25 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue26 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits6 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits7 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits8 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    precise float sumValue9 = rdDot3Precise2(vec3(-productValue24, -productValue25, -productValue26), vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8)) - reinterpretedBits9;
    precise float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits9;
    precise float quotientValue6 = 1.0 / reinterpretedBits10;
    precise float productValue27 = quotientValue6 * sumValue9;
    float scalarValue10 = spvNClamp(productValue27, 0.0, 1.0);
    precise float productValue28 = scalarValue10 * scalarValue10;
    precise float multiplyAddValue6 = productValue28 * fma(scalarValue10, -2.0, 3.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue2.x;
    float scalarValue12 = sampledTextureValue2.y;
    float scalarValue13 = sampledTextureValue2.z;
    precise float reinterpretedBits11 = sampledTextureValue2.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
    fragmentColor0.w = ((multiplyAddValue5 >= multiplyAddValue6) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : reinterpretedBits11;
    precise float productValue34 = scalarValue11 * varyingColor3.x;
    precise float productValue35 = scalarValue12 * varyingColor3.y;
    precise float productValue36 = scalarValue13 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue11, varyingColor3.x, varyingColor2.x), productValue34);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue12, varyingColor3.y, varyingColor2.y), productValue35);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue13, varyingColor3.z, varyingColor2.z), productValue36);
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    intermediateValue7 = sampledTextureValue2.z;
    intermediateValue8 = sampledTextureValue2.y;
    intermediateValue9 = sampledTextureValue2.x;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
    {
        if (int(scalarValue3) <= int(scalarValue4))
        {
            break;
        }
        uint sumValue4 = scalarValue4 + 9u;
        vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue5 = scalarValue4 + 2u;
        float bitwiseValue = sampledTextureValue3.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 32u) + 12u) >> 2u];
        multiplyAddValue2 = fma(bitwiseValue, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[sumValue5].x, -intermediateValue9), intermediateValue9);
        multiplyAddValue1 = fma(bitwiseValue, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[sumValue5].y, -intermediateValue8), intermediateValue8);
        multiplyAddValue = fma(bitwiseValue, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[sumValue5].z, -intermediateValue7), intermediateValue7);
        sumValue = scalarValue4 + 1u;
        intermediateValue7 = multiplyAddValue;
        intermediateValue8 = multiplyAddValue1;
        intermediateValue9 = multiplyAddValue2;
        scalarValue4 = sumValue;
        continue;
    }
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - intermediateValue9, intermediateValue9);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - intermediateValue8, intermediateValue8);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - intermediateValue7, intermediateValue7);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[4u];
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    intermediateValue7 = sampledTextureValue2.z;
    intermediateValue8 = sampledTextureValue2.y;
    intermediateValue9 = sampledTextureValue2.x;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
    {
        if (int(scalarValue3) <= int(scalarValue4))
        {
            break;
        }
        uint sumValue4 = scalarValue4 + 9u;
        vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue5 = scalarValue4 + 2u;
        float bitwiseValue = sampledTextureValue3.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 32u) + 12u) >> 2u];
        multiplyAddValue2 = fma(bitwiseValue, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[sumValue5].x, -intermediateValue9), intermediateValue9);
        multiplyAddValue1 = fma(bitwiseValue, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[sumValue5].y, -intermediateValue8), intermediateValue8);
        multiplyAddValue = fma(bitwiseValue, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[sumValue5].z, -intermediateValue7), intermediateValue7);
        sumValue = scalarValue4 + 1u;
        intermediateValue7 = multiplyAddValue;
        intermediateValue8 = multiplyAddValue1;
        intermediateValue9 = multiplyAddValue2;
        scalarValue4 = sumValue;
        continue;
    }
    fragmentColor0.x = fma(varyingColor2.w, fma(-intermediateValue9, varyingColor3.x, varyingColor2.x), intermediateValue9 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-intermediateValue8, varyingColor3.y, varyingColor2.y), intermediateValue8 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-intermediateValue7, varyingColor3.z, varyingColor2.z), intermediateValue7 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[4u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    float multiplyAddValue7 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue8 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue14 = floor(multiplyAddValue8);
    float productValue29 = floor(multiplyAddValue8 * 0.25);
    float productValue30 = floor(multiplyAddValue8 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    float reinterpretedBits12 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits9)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits9), 0.0, 1.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue2.x;
    float scalarValue12 = sampledTextureValue2.y;
    float scalarValue13 = sampledTextureValue2.z;
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue7 * 0.25), 0.5, (productValue29 * productValue29) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue7 * 0.5), 0.5, (productValue30 * productValue30) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue7), 0.5, (scalarValue14 * scalarValue14) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits12 * reinterpretedBits12) * fma(reinterpretedBits12, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : (sampledTextureValue2.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - scalarValue11, scalarValue11);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - scalarValue12, scalarValue12);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - scalarValue13, scalarValue13);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    float multiplyAddValue7 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue8 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue14 = floor(multiplyAddValue8);
    float productValue29 = floor(multiplyAddValue8 * 0.25);
    float productValue30 = floor(multiplyAddValue8 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    float reinterpretedBits12 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits9)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits9), 0.0, 1.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue2.x;
    float scalarValue12 = sampledTextureValue2.y;
    float scalarValue13 = sampledTextureValue2.z;
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue7 * 0.25), 0.5, (productValue29 * productValue29) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue7 * 0.5), 0.5, (productValue30 * productValue30) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue7), 0.5, (scalarValue14 * scalarValue14) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits12 * reinterpretedBits12) * fma(reinterpretedBits12, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : (sampledTextureValue2.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])));
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue11, varyingColor3.x, varyingColor2.x), scalarValue11 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue12, varyingColor3.y, varyingColor2.y), scalarValue12 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue13, varyingColor3.z, varyingColor2.z), scalarValue13 * varyingColor3.z);
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (int(uint(int(fragmentVectorConstants1.packedValues[0u].x))) > int(0u))
    {
        uint intermediateValue6;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        intermediateValue6 = 0u;
        intermediateValue7 = scalarValue;
        intermediateValue8 = scalarValue1;
        intermediateValue9 = scalarValue2;
        float productValue;
        float productValue1;
        float productValue2;
        for (;;)
        {
            uint sumValue1 = intermediateValue6 + 9u;
            uint sumValue2 = intermediateValue6 + 2u;
            vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue1].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue1].x, (fragmentVectorConstants1.packedValues[sumValue1].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue1].y));
            float productValue3 = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[sumValue2].w;
            productValue = (((sampledTextureValue1.x * fragmentVectorConstants1.packedValues[sumValue2].x) - intermediateValue7) * productValue3) + intermediateValue7;
            productValue1 = (((sampledTextureValue1.y * fragmentVectorConstants1.packedValues[sumValue2].y) - intermediateValue8) * productValue3) + intermediateValue8;
            productValue2 = (((sampledTextureValue1.z * fragmentVectorConstants1.packedValues[sumValue2].z) - intermediateValue9) * productValue3) + intermediateValue9;
            uint sumValue3 = intermediateValue6 + 1u;
            if (int(sumValue3) < int(uint(int(fragmentVectorConstants1.packedValues[0u].x))))
            {
                intermediateValue6 = sumValue3;
                intermediateValue7 = productValue;
                intermediateValue8 = productValue1;
                intermediateValue9 = productValue2;
            }
            else
            {
                break;
            }
        }
        intermediateValue3 = productValue;
        intermediateValue4 = productValue1;
        intermediateValue5 = productValue2;
    }
    else
    {
        intermediateValue3 = scalarValue;
        intermediateValue4 = scalarValue1;
        intermediateValue5 = scalarValue2;
    }
    fragmentColor0.x = ((varyingColor2.x - intermediateValue3) * varyingColor2.w) + intermediateValue3;
    fragmentColor0.y = ((varyingColor2.y - intermediateValue4) * varyingColor2.w) + intermediateValue4;
    fragmentColor0.z = ((varyingColor2.z - intermediateValue5) * varyingColor2.w) + intermediateValue5;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].x;
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (int(uint(int(fragmentVectorConstants1.packedValues[0u].x))) > int(0u))
    {
        uint intermediateValue6;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        intermediateValue6 = 0u;
        intermediateValue7 = scalarValue;
        intermediateValue8 = scalarValue1;
        intermediateValue9 = scalarValue2;
        float productValue;
        float productValue1;
        float productValue2;
        for (;;)
        {
            uint sumValue1 = intermediateValue6 + 9u;
            uint sumValue2 = intermediateValue6 + 2u;
            vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue1].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue1].x, (fragmentVectorConstants1.packedValues[sumValue1].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue1].y));
            float productValue3 = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[sumValue2].w;
            productValue = (((sampledTextureValue1.x * fragmentVectorConstants1.packedValues[sumValue2].x) - intermediateValue7) * productValue3) + intermediateValue7;
            productValue1 = (((sampledTextureValue1.y * fragmentVectorConstants1.packedValues[sumValue2].y) - intermediateValue8) * productValue3) + intermediateValue8;
            productValue2 = (((sampledTextureValue1.z * fragmentVectorConstants1.packedValues[sumValue2].z) - intermediateValue9) * productValue3) + intermediateValue9;
            uint sumValue3 = intermediateValue6 + 1u;
            if (int(sumValue3) < int(uint(int(fragmentVectorConstants1.packedValues[0u].x))))
            {
                intermediateValue6 = sumValue3;
                intermediateValue7 = productValue;
                intermediateValue8 = productValue1;
                intermediateValue9 = productValue2;
            }
            else
            {
                break;
            }
        }
        intermediateValue3 = productValue;
        intermediateValue4 = productValue1;
        intermediateValue5 = productValue2;
    }
    else
    {
        intermediateValue3 = scalarValue;
        intermediateValue4 = scalarValue1;
        intermediateValue5 = scalarValue2;
    }
    float productValue4 = intermediateValue3 * varyingColor3.x;
    float productValue5 = intermediateValue4 * varyingColor3.y;
    float productValue6 = intermediateValue5 * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.y = ((varyingColor2.y - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.z = ((varyingColor2.z - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].x;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue5 = sampledTextureValue.w;
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[12u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[8u].x) / (fragmentVectorConstants1.packedValues[8u].y - fragmentVectorConstants1.packedValues[8u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[11u].x) / fragmentVectorConstants1.packedValues[8u].z) * fragmentVectorConstants1.packedValues[8u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[11u].y) / fragmentVectorConstants1.packedValues[8u].z) * fragmentVectorConstants1.packedValues[8u].z;
        float productValue7 = floor(quotientValue1 * 0.25);
        float productValue8 = floor(quotientValue1 * 0.5);
        float scalarValue6 = floor(quotientValue1);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue8 * productValue8) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue7 * productValue7) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue6 * scalarValue6) * 0.75) + (floor(quotientValue) * 0.5)))) ? 0.0 : scalarValue5;
    }
    else
    {
        comparisonValue = scalarValue5;
    }
    fragmentColor0.x = ((varyingColor2.x - scalarValue) * varyingColor2.w) + scalarValue;
    fragmentColor0.y = ((varyingColor2.y - scalarValue1) * varyingColor2.w) + scalarValue1;
    fragmentColor0.z = ((varyingColor2.z - scalarValue2) * varyingColor2.w) + scalarValue2;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[13u].x * comparisonValue;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue.w;
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[12u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[8u].x) / (fragmentVectorConstants1.packedValues[8u].y - fragmentVectorConstants1.packedValues[8u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[11u].x) / fragmentVectorConstants1.packedValues[8u].z) * fragmentVectorConstants1.packedValues[8u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[11u].y) / fragmentVectorConstants1.packedValues[8u].z) * fragmentVectorConstants1.packedValues[8u].z;
        float productValue7 = floor(quotientValue1 * 0.25);
        float productValue8 = floor(quotientValue1 * 0.5);
        float scalarValue6 = floor(quotientValue1);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue8 * productValue8) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue7 * productValue7) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue6 * scalarValue6) * 0.75) + (floor(quotientValue) * 0.5)))) ? 0.0 : scalarValue5;
    }
    else
    {
        comparisonValue = scalarValue5;
    }
    float productValue31 = sampledTextureValue.x * varyingColor3.x;
    float productValue32 = sampledTextureValue.y * varyingColor3.y;
    float productValue33 = sampledTextureValue.z * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue31) * varyingColor2.w) + productValue31;
    fragmentColor0.y = ((varyingColor2.y - productValue32) * varyingColor2.w) + productValue32;
    fragmentColor0.z = ((varyingColor2.z - productValue33) * varyingColor2.w) + productValue33;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[13u].x * comparisonValue;
#endif
}
