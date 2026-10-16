#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPatternGlint / Opaque / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 8
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

#include "../../include/materials/ActorPatternGlint/FragmentBindings.glsli"

#if (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    intermediateValue9 = sampledTextureValue4.z;
    intermediateValue10 = sampledTextureValue4.y;
    intermediateValue11 = sampledTextureValue4.x;
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
        uint sumValue4 = scalarValue4 + 10u;
        vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue5 = scalarValue4 + 3u;
        precise float bitwiseValue1 = sampledTextureValue5.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 48u) + 12u) >> 2u];
        multiplyAddValue2 = fma(bitwiseValue1, fma(sampledTextureValue5.x, fragmentVectorConstants1.packedValues[sumValue5].x, -intermediateValue11), intermediateValue11);
        multiplyAddValue1 = fma(bitwiseValue1, fma(sampledTextureValue5.y, fragmentVectorConstants1.packedValues[sumValue5].y, -intermediateValue10), intermediateValue10);
        multiplyAddValue = fma(bitwiseValue1, fma(sampledTextureValue5.z, fragmentVectorConstants1.packedValues[sumValue5].z, -intermediateValue9), intermediateValue9);
        sumValue = scalarValue4 + 1u;
        intermediateValue9 = multiplyAddValue;
        intermediateValue10 = multiplyAddValue1;
        intermediateValue11 = multiplyAddValue2;
        scalarValue4 = sumValue;
        continue;
    }
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    precise float productValue13 = sampledTextureValue7.x * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue14 = sampledTextureValue7.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue15 = sampledTextureValue7.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float multiplyAddValue9 = fma(sampledTextureValue6.x, fragmentVectorConstants1.packedValues[1u].x, productValue13) * fragmentVectorConstants1.packedValues[17u].x;
    precise float multiplyAddValue10 = fma(sampledTextureValue6.y, fragmentVectorConstants1.packedValues[1u].y, productValue14) * fragmentVectorConstants1.packedValues[17u].y;
    precise float multiplyAddValue11 = fma(sampledTextureValue6.z, fragmentVectorConstants1.packedValues[1u].z, productValue15) * fragmentVectorConstants1.packedValues[17u].z;
    float multiplyAddValue12 = fma(multiplyAddValue9, multiplyAddValue9, intermediateValue11);
    float multiplyAddValue13 = fma(multiplyAddValue10, multiplyAddValue10, intermediateValue10);
    float multiplyAddValue14 = fma(multiplyAddValue11, multiplyAddValue11, intermediateValue9);
    precise float sumValue6 = varyingColor2.x - multiplyAddValue12;
    precise float sumValue7 = varyingColor2.y - multiplyAddValue13;
    precise float sumValue8 = varyingColor2.z - multiplyAddValue14;
    fragmentColor0.x = fma(varyingColor2.w, sumValue6, multiplyAddValue12);
    fragmentColor0.y = fma(varyingColor2.w, sumValue7, multiplyAddValue13);
    fragmentColor0.z = fma(varyingColor2.w, sumValue8, multiplyAddValue14);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[8u];
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    intermediateValue9 = sampledTextureValue4.z;
    intermediateValue10 = sampledTextureValue4.y;
    intermediateValue11 = sampledTextureValue4.x;
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
        uint sumValue4 = scalarValue4 + 10u;
        vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue5 = scalarValue4 + 3u;
        precise float bitwiseValue1 = sampledTextureValue5.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 48u) + 12u) >> 2u];
        multiplyAddValue2 = fma(bitwiseValue1, fma(sampledTextureValue5.x, fragmentVectorConstants1.packedValues[sumValue5].x, -intermediateValue11), intermediateValue11);
        multiplyAddValue1 = fma(bitwiseValue1, fma(sampledTextureValue5.y, fragmentVectorConstants1.packedValues[sumValue5].y, -intermediateValue10), intermediateValue10);
        multiplyAddValue = fma(bitwiseValue1, fma(sampledTextureValue5.z, fragmentVectorConstants1.packedValues[sumValue5].z, -intermediateValue9), intermediateValue9);
        sumValue = scalarValue4 + 1u;
        intermediateValue9 = multiplyAddValue;
        intermediateValue10 = multiplyAddValue1;
        intermediateValue11 = multiplyAddValue2;
        scalarValue4 = sumValue;
        continue;
    }
    precise float productValue16 = intermediateValue11 * varyingColor3.x;
    precise float productValue17 = intermediateValue10 * varyingColor3.y;
    precise float productValue18 = intermediateValue9 * varyingColor3.z;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    precise float productValue13 = sampledTextureValue7.x * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue14 = sampledTextureValue7.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue15 = sampledTextureValue7.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float multiplyAddValue9 = fma(sampledTextureValue6.x, fragmentVectorConstants1.packedValues[1u].x, productValue13) * fragmentVectorConstants1.packedValues[17u].x;
    precise float multiplyAddValue10 = fma(sampledTextureValue6.y, fragmentVectorConstants1.packedValues[1u].y, productValue14) * fragmentVectorConstants1.packedValues[17u].y;
    precise float multiplyAddValue11 = fma(sampledTextureValue6.z, fragmentVectorConstants1.packedValues[1u].z, productValue15) * fragmentVectorConstants1.packedValues[17u].z;
    float multiplyAddValue18 = fma(multiplyAddValue9, multiplyAddValue9, productValue16);
    float multiplyAddValue19 = fma(multiplyAddValue10, multiplyAddValue10, productValue17);
    float multiplyAddValue20 = fma(multiplyAddValue11, multiplyAddValue11, productValue18);
    precise float sumValue9 = varyingColor2.x - multiplyAddValue18;
    precise float sumValue10 = varyingColor2.y - multiplyAddValue19;
    precise float sumValue11 = varyingColor2.z - multiplyAddValue20;
    fragmentColor0.x = fma(varyingColor2.w, sumValue9, multiplyAddValue18);
    fragmentColor0.y = fma(varyingColor2.w, sumValue10, multiplyAddValue19);
    fragmentColor0.z = fma(varyingColor2.w, sumValue11, multiplyAddValue20);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[8u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue29 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue30 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    precise float quotientValue4 = multiplyAddValue29 / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue30 / reinterpretedBits1;
    precise float productValue29 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue30 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue31 = productValue29 * 0.25;
    precise float productValue32 = productValue30 * 0.25;
    precise float productValue33 = productValue29 * 0.5;
    precise float productValue34 = productValue30 * 0.5;
    float scalarValue8 = floor(productValue30);
    float scalarValue9 = floor(productValue32);
    float scalarValue10 = floor(productValue34);
    precise float productValue35 = scalarValue9 * scalarValue9;
    precise float productValue36 = scalarValue10 * scalarValue10;
    precise float productValue37 = productValue35 * 0.75;
    precise float productValue38 = productValue36 * 0.75;
    precise float productValue39 = scalarValue8 * scalarValue8;
    precise float productValue40 = productValue39 * 0.75;
    precise float multiplyAddValue31 = fma(fma(fma(fract(fma(floor(productValue31), 0.5, productValue37)), 0.25, fract(fma(floor(productValue33), 0.5, productValue38))), 0.25, fract(fma(floor(productValue29), 0.5, productValue40))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue41 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue42 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue43 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits13 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits14 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits15 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    precise float sumValue12 = rdDot3Precise2(vec3(-productValue41, -productValue42, -productValue43), vec3(reinterpretedBits13, reinterpretedBits14, reinterpretedBits15)) - reinterpretedBits6;
    precise float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits6;
    precise float quotientValue6 = 1.0 / reinterpretedBits16;
    precise float productValue44 = quotientValue6 * sumValue12;
    float scalarValue11 = spvNClamp(productValue44, 0.0, 1.0);
    precise float productValue45 = scalarValue11 * scalarValue11;
    precise float multiplyAddValue32 = productValue45 * fma(scalarValue11, -2.0, 3.0);
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float reinterpretedBits17 = sampledTextureValue4.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    fragmentColor0.w = ((multiplyAddValue31 >= multiplyAddValue32) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : reinterpretedBits17;
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits9 = uintBitsToFloat(reinterpretedBits8.x);
    float reinterpretedBits10 = uintBitsToFloat(reinterpretedBits8.y);
    float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits8.z);
    precise float productValue46 = sampledTextureValue7.x * reinterpretedBits9;
    precise float productValue47 = sampledTextureValue7.y * reinterpretedBits10;
    precise float productValue48 = sampledTextureValue7.z * reinterpretedBits11;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue33 = fma(sampledTextureValue6.x, reinterpretedBits9, productValue46) * uintBitsToFloat(reinterpretedBits12.x);
    precise float multiplyAddValue34 = fma(sampledTextureValue6.y, reinterpretedBits10, productValue47) * uintBitsToFloat(reinterpretedBits12.y);
    precise float multiplyAddValue35 = fma(sampledTextureValue6.z, reinterpretedBits11, productValue48) * uintBitsToFloat(reinterpretedBits12.z);
    float multiplyAddValue36 = fma(multiplyAddValue33, multiplyAddValue33, sampledTextureValue4.x);
    float multiplyAddValue37 = fma(multiplyAddValue34, multiplyAddValue34, sampledTextureValue4.y);
    float multiplyAddValue38 = fma(multiplyAddValue35, multiplyAddValue35, sampledTextureValue4.z);
    precise float sumValue13 = varyingColor2.x - multiplyAddValue36;
    precise float sumValue14 = varyingColor2.y - multiplyAddValue37;
    precise float sumValue15 = varyingColor2.z - multiplyAddValue38;
    fragmentColor0.x = fma(varyingColor2.w, sumValue13, multiplyAddValue36);
    fragmentColor0.y = fma(varyingColor2.w, sumValue14, multiplyAddValue37);
    fragmentColor0.z = fma(varyingColor2.w, sumValue15, multiplyAddValue38);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue29 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue30 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    precise float quotientValue4 = multiplyAddValue29 / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue30 / reinterpretedBits1;
    precise float productValue29 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue30 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue31 = productValue29 * 0.25;
    precise float productValue32 = productValue30 * 0.25;
    precise float productValue33 = productValue29 * 0.5;
    precise float productValue34 = productValue30 * 0.5;
    float scalarValue8 = floor(productValue30);
    float scalarValue9 = floor(productValue32);
    float scalarValue10 = floor(productValue34);
    precise float productValue35 = scalarValue9 * scalarValue9;
    precise float productValue36 = scalarValue10 * scalarValue10;
    precise float productValue37 = productValue35 * 0.75;
    precise float productValue38 = productValue36 * 0.75;
    precise float productValue39 = scalarValue8 * scalarValue8;
    precise float productValue40 = productValue39 * 0.75;
    precise float multiplyAddValue31 = fma(fma(fma(fract(fma(floor(productValue31), 0.5, productValue37)), 0.25, fract(fma(floor(productValue33), 0.5, productValue38))), 0.25, fract(fma(floor(productValue29), 0.5, productValue40))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue41 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue42 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue43 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits13 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits14 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits15 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    precise float sumValue12 = rdDot3Precise2(vec3(-productValue41, -productValue42, -productValue43), vec3(reinterpretedBits13, reinterpretedBits14, reinterpretedBits15)) - reinterpretedBits6;
    precise float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits6;
    precise float quotientValue6 = 1.0 / reinterpretedBits16;
    precise float productValue44 = quotientValue6 * sumValue12;
    float scalarValue11 = spvNClamp(productValue44, 0.0, 1.0);
    precise float productValue45 = scalarValue11 * scalarValue11;
    precise float multiplyAddValue32 = productValue45 * fma(scalarValue11, -2.0, 3.0);
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float reinterpretedBits17 = sampledTextureValue4.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    precise float productValue52 = sampledTextureValue4.x * varyingColor3.x;
    precise float productValue53 = sampledTextureValue4.y * varyingColor3.y;
    precise float productValue54 = sampledTextureValue4.z * varyingColor3.z;
    fragmentColor0.w = ((multiplyAddValue31 >= multiplyAddValue32) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : reinterpretedBits17;
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits9 = uintBitsToFloat(reinterpretedBits8.x);
    float reinterpretedBits10 = uintBitsToFloat(reinterpretedBits8.y);
    float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits8.z);
    precise float productValue46 = sampledTextureValue7.x * reinterpretedBits9;
    precise float productValue47 = sampledTextureValue7.y * reinterpretedBits10;
    precise float productValue48 = sampledTextureValue7.z * reinterpretedBits11;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue33 = fma(sampledTextureValue6.x, reinterpretedBits9, productValue46) * uintBitsToFloat(reinterpretedBits12.x);
    precise float multiplyAddValue34 = fma(sampledTextureValue6.y, reinterpretedBits10, productValue47) * uintBitsToFloat(reinterpretedBits12.y);
    precise float multiplyAddValue35 = fma(sampledTextureValue6.z, reinterpretedBits11, productValue48) * uintBitsToFloat(reinterpretedBits12.z);
    float multiplyAddValue42 = fma(multiplyAddValue33, multiplyAddValue33, productValue52);
    float multiplyAddValue43 = fma(multiplyAddValue34, multiplyAddValue34, productValue53);
    float multiplyAddValue44 = fma(multiplyAddValue35, multiplyAddValue35, productValue54);
    precise float sumValue16 = varyingColor2.x - multiplyAddValue42;
    precise float sumValue17 = varyingColor2.y - multiplyAddValue43;
    precise float sumValue18 = varyingColor2.z - multiplyAddValue44;
    fragmentColor0.x = fma(varyingColor2.w, sumValue16, multiplyAddValue42);
    fragmentColor0.y = fma(varyingColor2.w, sumValue17, multiplyAddValue43);
    fragmentColor0.z = fma(varyingColor2.w, sumValue18, multiplyAddValue44);
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    intermediateValue9 = sampledTextureValue4.z;
    intermediateValue10 = sampledTextureValue4.y;
    intermediateValue11 = sampledTextureValue4.x;
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
        uint sumValue4 = scalarValue4 + 10u;
        vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue5 = scalarValue4 + 3u;
        float bitwiseValue = sampledTextureValue5.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 48u) + 12u) >> 2u];
        multiplyAddValue2 = fma(bitwiseValue, fma(sampledTextureValue5.x, fragmentVectorConstants1.packedValues[sumValue5].x, -intermediateValue11), intermediateValue11);
        multiplyAddValue1 = fma(bitwiseValue, fma(sampledTextureValue5.y, fragmentVectorConstants1.packedValues[sumValue5].y, -intermediateValue10), intermediateValue10);
        multiplyAddValue = fma(bitwiseValue, fma(sampledTextureValue5.z, fragmentVectorConstants1.packedValues[sumValue5].z, -intermediateValue9), intermediateValue9);
        sumValue = scalarValue4 + 1u;
        intermediateValue9 = multiplyAddValue;
        intermediateValue10 = multiplyAddValue1;
        intermediateValue11 = multiplyAddValue2;
        scalarValue4 = sumValue;
        continue;
    }
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float multiplyAddValue3 = fma(sampledTextureValue6.x, fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue7.x * fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[17u].x;
    float multiplyAddValue4 = fma(sampledTextureValue6.y, fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue7.y * fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[17u].y;
    float multiplyAddValue5 = fma(sampledTextureValue6.z, fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue7.z * fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[17u].z;
    float multiplyAddValue6 = fma(multiplyAddValue3, multiplyAddValue3, intermediateValue11);
    float multiplyAddValue7 = fma(multiplyAddValue4, multiplyAddValue4, intermediateValue10);
    float multiplyAddValue8 = fma(multiplyAddValue5, multiplyAddValue5, intermediateValue9);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue6, multiplyAddValue6);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue7, multiplyAddValue7);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue8, multiplyAddValue8);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[8u];
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue3 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    intermediateValue9 = sampledTextureValue4.z;
    intermediateValue10 = sampledTextureValue4.y;
    intermediateValue11 = sampledTextureValue4.x;
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
        uint sumValue4 = scalarValue4 + 10u;
        vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue5 = scalarValue4 + 3u;
        float bitwiseValue = sampledTextureValue5.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue4) + 48u) + 12u) >> 2u];
        multiplyAddValue2 = fma(bitwiseValue, fma(sampledTextureValue5.x, fragmentVectorConstants1.packedValues[sumValue5].x, -intermediateValue11), intermediateValue11);
        multiplyAddValue1 = fma(bitwiseValue, fma(sampledTextureValue5.y, fragmentVectorConstants1.packedValues[sumValue5].y, -intermediateValue10), intermediateValue10);
        multiplyAddValue = fma(bitwiseValue, fma(sampledTextureValue5.z, fragmentVectorConstants1.packedValues[sumValue5].z, -intermediateValue9), intermediateValue9);
        sumValue = scalarValue4 + 1u;
        intermediateValue9 = multiplyAddValue;
        intermediateValue10 = multiplyAddValue1;
        intermediateValue11 = multiplyAddValue2;
        scalarValue4 = sumValue;
        continue;
    }
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float multiplyAddValue3 = fma(sampledTextureValue6.x, fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue7.x * fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[17u].x;
    float multiplyAddValue4 = fma(sampledTextureValue6.y, fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue7.y * fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[17u].y;
    float multiplyAddValue5 = fma(sampledTextureValue6.z, fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue7.z * fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[17u].z;
    float multiplyAddValue15 = fma(multiplyAddValue3, multiplyAddValue3, intermediateValue11 * varyingColor3.x);
    float multiplyAddValue16 = fma(multiplyAddValue4, multiplyAddValue4, intermediateValue10 * varyingColor3.y);
    float multiplyAddValue17 = fma(multiplyAddValue5, multiplyAddValue5, intermediateValue9 * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue15, multiplyAddValue15);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue16, multiplyAddValue16);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue17, multiplyAddValue17);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[8u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    float multiplyAddValue21 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue22 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue7 = floor(multiplyAddValue22);
    float productValue27 = floor(multiplyAddValue22 * 0.25);
    float productValue28 = floor(multiplyAddValue22 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits6)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits6), 0.0, 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue21 * 0.25), 0.5, (productValue27 * productValue27) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue21 * 0.5), 0.5, (productValue28 * productValue28) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue21), 0.5, (scalarValue7 * scalarValue7) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : (sampledTextureValue4.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u])));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits9 = uintBitsToFloat(reinterpretedBits8.x);
    float reinterpretedBits10 = uintBitsToFloat(reinterpretedBits8.y);
    float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits8.z);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float multiplyAddValue23 = fma(sampledTextureValue6.x, reinterpretedBits9, sampledTextureValue7.x * reinterpretedBits9) * uintBitsToFloat(reinterpretedBits12.x);
    float multiplyAddValue24 = fma(sampledTextureValue6.y, reinterpretedBits10, sampledTextureValue7.y * reinterpretedBits10) * uintBitsToFloat(reinterpretedBits12.y);
    float multiplyAddValue25 = fma(sampledTextureValue6.z, reinterpretedBits11, sampledTextureValue7.z * reinterpretedBits11) * uintBitsToFloat(reinterpretedBits12.z);
    float multiplyAddValue26 = fma(multiplyAddValue23, multiplyAddValue23, sampledTextureValue4.x);
    float multiplyAddValue27 = fma(multiplyAddValue24, multiplyAddValue24, sampledTextureValue4.y);
    float multiplyAddValue28 = fma(multiplyAddValue25, multiplyAddValue25, sampledTextureValue4.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue26, multiplyAddValue26);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue27, multiplyAddValue27);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue28, multiplyAddValue28);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    float multiplyAddValue21 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue22 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue7 = floor(multiplyAddValue22);
    float productValue27 = floor(multiplyAddValue22 * 0.25);
    float productValue28 = floor(multiplyAddValue22 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits6)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits6), 0.0, 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue21 * 0.25), 0.5, (productValue27 * productValue27) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue21 * 0.5), 0.5, (productValue28 * productValue28) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue21), 0.5, (scalarValue7 * scalarValue7) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : (sampledTextureValue4.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u])));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits9 = uintBitsToFloat(reinterpretedBits8.x);
    float reinterpretedBits10 = uintBitsToFloat(reinterpretedBits8.y);
    float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits8.z);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float multiplyAddValue23 = fma(sampledTextureValue6.x, reinterpretedBits9, sampledTextureValue7.x * reinterpretedBits9) * uintBitsToFloat(reinterpretedBits12.x);
    float multiplyAddValue24 = fma(sampledTextureValue6.y, reinterpretedBits10, sampledTextureValue7.y * reinterpretedBits10) * uintBitsToFloat(reinterpretedBits12.y);
    float multiplyAddValue25 = fma(sampledTextureValue6.z, reinterpretedBits11, sampledTextureValue7.z * reinterpretedBits11) * uintBitsToFloat(reinterpretedBits12.z);
    float multiplyAddValue39 = fma(multiplyAddValue23, multiplyAddValue23, sampledTextureValue4.x * varyingColor3.x);
    float multiplyAddValue40 = fma(multiplyAddValue24, multiplyAddValue24, sampledTextureValue4.y * varyingColor3.y);
    float multiplyAddValue41 = fma(multiplyAddValue25, multiplyAddValue25, sampledTextureValue4.z * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue39, multiplyAddValue39);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue40, multiplyAddValue40);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue41, multiplyAddValue41);
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
            uint sumValue1 = intermediateValue6 + 10u;
            uint sumValue2 = intermediateValue6 + 3u;
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
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float productValue4 = (fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[17u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue5 = (fragmentVectorConstants1.packedValues[1u].y * fragmentVectorConstants1.packedValues[17u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue6 = (fragmentVectorConstants1.packedValues[1u].z * fragmentVectorConstants1.packedValues[17u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float productValue7 = (productValue4 * productValue4) + intermediateValue3;
    float productValue8 = (productValue5 * productValue5) + intermediateValue4;
    float productValue9 = (productValue6 * productValue6) + intermediateValue5;
    fragmentColor0.x = ((varyingColor2.x - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.y = ((varyingColor2.y - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.z = ((varyingColor2.z - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].x;
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
            uint sumValue1 = intermediateValue6 + 10u;
            uint sumValue2 = intermediateValue6 + 3u;
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
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float productValue4 = (fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[17u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue5 = (fragmentVectorConstants1.packedValues[1u].y * fragmentVectorConstants1.packedValues[17u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue6 = (fragmentVectorConstants1.packedValues[1u].z * fragmentVectorConstants1.packedValues[17u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float productValue10 = (productValue4 * productValue4) + (intermediateValue3 * varyingColor3.x);
    float productValue11 = (productValue5 * productValue5) + (intermediateValue4 * varyingColor3.y);
    float productValue12 = (productValue6 * productValue6) + (intermediateValue5 * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.y = ((varyingColor2.y - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.z = ((varyingColor2.z - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].x;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue.w;
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[12u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[8u].x) / (fragmentVectorConstants1.packedValues[8u].y - fragmentVectorConstants1.packedValues[8u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[11u].x) / fragmentVectorConstants1.packedValues[8u].z) * fragmentVectorConstants1.packedValues[8u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[11u].y) / fragmentVectorConstants1.packedValues[8u].z) * fragmentVectorConstants1.packedValues[8u].z;
        float productValue19 = floor(quotientValue1 * 0.25);
        float productValue20 = floor(quotientValue1 * 0.5);
        float scalarValue6 = floor(quotientValue1);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue20 * productValue20) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue19 * productValue19) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue6 * scalarValue6) * 0.75) + (floor(quotientValue) * 0.5)))) ? 0.0 : scalarValue5;
    }
    else
    {
        comparisonValue = scalarValue5;
    }
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float productValue21 = (fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[15u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue22 = (fragmentVectorConstants1.packedValues[13u].y * fragmentVectorConstants1.packedValues[15u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue23 = (fragmentVectorConstants1.packedValues[13u].z * fragmentVectorConstants1.packedValues[15u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float productValue24 = (productValue21 * productValue21) + sampledTextureValue.x;
    float productValue25 = (productValue22 * productValue22) + sampledTextureValue.y;
    float productValue26 = (productValue23 * productValue23) + sampledTextureValue.z;
    fragmentColor0.x = ((varyingColor2.x - productValue24) * varyingColor2.w) + productValue24;
    fragmentColor0.y = ((varyingColor2.y - productValue25) * varyingColor2.w) + productValue25;
    fragmentColor0.z = ((varyingColor2.z - productValue26) * varyingColor2.w) + productValue26;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[14u].x * comparisonValue;
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
        float productValue19 = floor(quotientValue1 * 0.25);
        float productValue20 = floor(quotientValue1 * 0.5);
        float scalarValue6 = floor(quotientValue1);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue20 * productValue20) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue19 * productValue19) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue6 * scalarValue6) * 0.75) + (floor(quotientValue) * 0.5)))) ? 0.0 : scalarValue5;
    }
    else
    {
        comparisonValue = scalarValue5;
    }
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float productValue21 = (fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[15u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue22 = (fragmentVectorConstants1.packedValues[13u].y * fragmentVectorConstants1.packedValues[15u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue23 = (fragmentVectorConstants1.packedValues[13u].z * fragmentVectorConstants1.packedValues[15u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float productValue49 = (productValue21 * productValue21) + (sampledTextureValue.x * varyingColor3.x);
    float productValue50 = (productValue22 * productValue22) + (sampledTextureValue.y * varyingColor3.y);
    float productValue51 = (productValue23 * productValue23) + (sampledTextureValue.z * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue49) * varyingColor2.w) + productValue49;
    fragmentColor0.y = ((varyingColor2.y - productValue50) * varyingColor2.w) + productValue50;
    fragmentColor0.z = ((varyingColor2.z - productValue51) * varyingColor2.w) + productValue51;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[14u].x * comparisonValue;
#endif
}
