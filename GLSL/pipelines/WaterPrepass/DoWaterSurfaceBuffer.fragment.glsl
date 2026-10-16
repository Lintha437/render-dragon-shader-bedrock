#version 460
#extension GL_GOOGLE_include_directive : require
// WaterPrepass / DoWaterSurfaceBuffer / fragment forward pipeline.
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
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
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
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/WaterPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool comparisonValue1 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
#endif
    uint scalarValue = uint(varyingTexCoord4);
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue23;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
    float intermediateValue29;
    float intermediateValue31;
    float intermediateValue33;
    float intermediateValue35;
    float intermediateValue37;
    float intermediateValue38;
#endif
    float multiplyAddValue;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue1;
    float multiplyAddValue2;
    float intermediateValue40;
    float intermediateValue42;
    if (scalarValue != 65535u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if (scalarValue == 65535u)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        vec4 reinterpretedBits = uintBitsToFloat(intermediateValue4.packedValues[(scalarValue * 4u) + 1u]);
        float scalarValue60 = reinterpretedBits.x;
        float scalarValue61 = reinterpretedBits.y;
        float scalarValue62 = reinterpretedBits.z;
        float scalarValue63 = reinterpretedBits.w;
        vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue4.packedValues[(scalarValue * 4u) + 2u]);
        vec2 reinterpretedBits2 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue * 8u) + 6u]);
        float scalarValue64 = reinterpretedBits2.x;
        float scalarValue65 = reinterpretedBits2.y;
        uint reinterpretedBits3 = floatBitsToUint(reinterpretedBits1.x);
        float intermediateValue30;
        float intermediateValue32;
        float intermediateValue34;
        float intermediateValue36;
        float intermediateValue81;
        float intermediateValue83;
        if ((reinterpretedBits3 & 4u) == 4u)
        {
            float multiplyAddValue13 = fma(varyingTexCoord0.x, scalarValue60, scalarValue62);
            float multiplyAddValue23 = fma(varyingTexCoord0.y, scalarValue61, scalarValue63);
            bool sampledTextureValue40 = uint(textureQueryLevels(materialTexture3)) > 0u;
            uvec2 sampledTextureValue41 = uvec2(textureSize(materialTexture3, int(0u)));
            uint scalarValue66 = sampledTextureValue41.x;
            float comparisonValue17 = multiplyAddValue13 * rdEvaluateFloatExpression(sampledTextureValue40 ? scalarValue66 : 0u);
            float comparisonValue18 = multiplyAddValue23 * rdEvaluateFloatExpression(sampledTextureValue40 ? sampledTextureValue41.y : 0u);
            vec2 vectorValue1 = vec2(dFdxCoarse(comparisonValue17), dFdxCoarse(comparisonValue18));
            vec2 vectorValue2 = vec2(dFdyCoarse(-comparisonValue17), dFdyCoarse(-comparisonValue18));
            float nonlinearValue = spvNMax(log2(spvNMax(rdDot2Precise(vectorValue1, vectorValue1), rdDot2Precise(vectorValue2, vectorValue2))) * 0.5, 0.0);
            float productValue9;
            float productValue10;
            float intermediateValue71;
            if (nonlinearValue <= 1.0)
            {
                vec4 sampledTextureValue42 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(multiplyAddValue13, multiplyAddValue23), nonlinearValue);
                float multiplyAddValue24 = 1.0 / fma(sampledTextureValue42.z, 2.0, -1.0);
                float productValue73 = 1.0 - spvNMin(nonlinearValue * nonlinearValue, 1.0);
                float multiplyAddValue25 = productValue73 * (multiplyAddValue24 * fma(sampledTextureValue42.x, 2.0, -1.0));
                float multiplyAddValue26 = productValue73 * (multiplyAddValue24 * fma(sampledTextureValue42.y, 2.0, -1.0));
                vec3 vectorValue3 = vec3(multiplyAddValue25, multiplyAddValue26, 1.0);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
                productValue9 = inverseLengthValue10 * multiplyAddValue26;
                productValue10 = inverseLengthValue10 * multiplyAddValue25;
                intermediateValue71 = inverseLengthValue10;
            }
            else
            {
                productValue9 = 0.0;
                productValue10 = 0.0;
                intermediateValue71 = 1.0;
            }
            intermediateValue81 = productValue9;
            intermediateValue83 = productValue10;
            intermediateValue30 = intermediateValue71;
            intermediateValue32 = intermediateValue24;
            intermediateValue34 = intermediateValue24;
            intermediateValue36 = intermediateValue24;
        }
        else
        {
            float reinterpretedBits4 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue * 16u) + 15u]);
            float intermediateValue82;
            float intermediateValue84;
            float intermediateValue85;
            float intermediateValue86;
            float intermediateValue87;
            float intermediateValue88;
            if ((reinterpretedBits3 & 8u) == 8u)
            {
                float sumValue22 = spvNClamp(2.0 - spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue65), 0.0, 1.0);
                float productValue16;
                float productValue17;
                float productValue18;
                float intermediateValue97;
                float intermediateValue98;
                float intermediateValue99;
                if (sumValue22 > 0.0)
                {
                    float multiplyAddValue27 = fma(varyingTexCoord0.x, scalarValue60, scalarValue62);
                    float multiplyAddValue28 = fma(varyingTexCoord0.y, scalarValue61, scalarValue63);
                    bool sampledTextureValue43 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue44 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue67 = sampledTextureValue44.x;
                    float comparisonValue19 = rdEvaluateFloatExpression(sampledTextureValue43 ? scalarValue67 : 0u);
                    float comparisonValue20 = rdEvaluateFloatExpression(sampledTextureValue43 ? sampledTextureValue44.y : 0u);
                    float productValue74 = fract(multiplyAddValue27 * comparisonValue19);
                    float productValue75 = fract(multiplyAddValue28 * comparisonValue20);
                    vec4 sampledTextureValue45 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue74 - 0.5) < 0.0625) ? (multiplyAddValue27 + ((productValue74 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue27, (abs(productValue75 - 0.5) < 0.0625) ? (multiplyAddValue28 + ((productValue75 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue28));
                    float scalarValue68 = sampledTextureValue45.x;
                    float scalarValue69 = sampledTextureValue45.y;
                    float scalarValue70 = sampledTextureValue45.z;
                    float scalarValue71 = sampledTextureValue45.w;
                    float multiplyAddValue29 = fract(fma(multiplyAddValue27, comparisonValue19, 0.5));
                    float multiplyAddValue30 = fract(fma(multiplyAddValue28, comparisonValue20, 0.5));
                    bool conditionValue6 = multiplyAddValue30 > 0.5;
                    bool conditionValue7 = multiplyAddValue29 > 0.5;
                    float comparisonValue21 = conditionValue6 ? scalarValue68 : scalarValue71;
                    float comparisonValue22 = conditionValue6 ? scalarValue69 : scalarValue70;
                    float comparisonValue23 = conditionValue7 ? scalarValue70 : scalarValue71;
                    float comparisonValue24 = conditionValue7 ? scalarValue69 : scalarValue68;
                    float sumValue23 = multiplyAddValue29 - 0.083333335816860198974609375;
                    float sumValue24 = multiplyAddValue29 + 0.083333335816860198974609375;
                    float sumValue25 = multiplyAddValue30 - 0.083333335816860198974609375;
                    float sumValue26 = multiplyAddValue30 + 0.083333335816860198974609375;
                    uint sumValue27 = uint(int(spvNClamp(sumValue23 + sumValue23, 0.0, 1.0)));
                    uint sumValue31 = uint(int(spvNClamp(sumValue24 + sumValue24, 0.0, 1.0)));
                    uint sumValue32 = uint(int(spvNClamp(sumValue25 + sumValue25, 0.0, 1.0)));
                    uint sumValue33 = uint(int(spvNClamp(sumValue26 + sumValue26, 0.0, 1.0)));
                    float comparisonValue25 = ((sumValue27 == 1u) ? comparisonValue22 : ((sumValue27 == 0u) ? comparisonValue21 : 0.0)) - ((sumValue31 == 1u) ? comparisonValue22 : ((sumValue31 == 0u) ? comparisonValue21 : 0.0));
                    float comparisonValue26 = ((sumValue32 == 1u) ? comparisonValue24 : ((sumValue32 == 0u) ? comparisonValue23 : 0.0)) - ((sumValue33 == 1u) ? comparisonValue24 : ((sumValue33 == 0u) ? comparisonValue23 : 0.0));
                    vec3 vectorValue4 = vec3(comparisonValue25, comparisonValue26, 0.25);
                    float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
                    productValue16 = sumValue22 * (inverseLengthValue11 * comparisonValue26);
                    productValue17 = sumValue22 * (inverseLengthValue11 * comparisonValue25);
                    productValue18 = inverseLengthValue11 * 0.25;
                    intermediateValue97 = comparisonValue21;
                    intermediateValue98 = comparisonValue22;
                    intermediateValue99 = comparisonValue24;
                }
                else
                {
                    productValue16 = 0.0;
                    productValue17 = 0.0;
                    productValue18 = 1.0;
                    intermediateValue97 = intermediateValue24;
                    intermediateValue98 = intermediateValue24;
                    intermediateValue99 = intermediateValue24;
                }
                intermediateValue82 = productValue16;
                intermediateValue84 = productValue17;
                intermediateValue85 = productValue18;
                intermediateValue86 = intermediateValue97;
                intermediateValue87 = intermediateValue98;
                intermediateValue88 = intermediateValue99;
            }
            else
            {
                float intermediateValue103;
                float intermediateValue105;
                float intermediateValue107;
                float intermediateValue109;
                float intermediateValue111;
                float intermediateValue113;
                if ((reinterpretedBits3 & 16u) == 16u)
                {
                    float multiplyAddValue36 = fma(varyingTexCoord0.x, scalarValue60, scalarValue62);
                    float multiplyAddValue37 = fma(varyingTexCoord0.y, scalarValue61, scalarValue63);
                    float sumValue34 = spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue65);
                    vec4 sampledTextureValue46 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(multiplyAddValue36, multiplyAddValue37), 0.0);
                    float scalarValue72 = sampledTextureValue46.x;
                    float scalarValue73 = sampledTextureValue46.y;
                    float scalarValue74 = sampledTextureValue46.z;
                    float intermediateValue104;
                    float intermediateValue106;
                    float intermediateValue108;
                    float intermediateValue110;
                    float intermediateValue112;
                    float intermediateValue114;
                    if ((scalarValue73 == scalarValue72) && (scalarValue74 == scalarValue73))
                    {
                        float scalarValue75 = spvNClamp(2.0 - sumValue34, 0.0, 1.0);
                        float productValue50;
                        float productValue51;
                        float productValue52;
                        float intermediateValue144;
                        float intermediateValue145;
                        float intermediateValue146;
                        if (scalarValue75 > 0.0)
                        {
                            bool sampledTextureValue47 = uint(textureQueryLevels(materialTexture3)) > 0u;
                            uvec2 sampledTextureValue48 = uvec2(textureSize(materialTexture3, int(0u)));
                            uint scalarValue76 = sampledTextureValue48.x;
                            float comparisonValue27 = rdEvaluateFloatExpression(sampledTextureValue47 ? scalarValue76 : 0u);
                            float comparisonValue28 = rdEvaluateFloatExpression(sampledTextureValue47 ? sampledTextureValue48.y : 0u);
                            float productValue76 = fract(multiplyAddValue36 * comparisonValue27);
                            float productValue77 = fract(multiplyAddValue37 * comparisonValue28);
                            vec4 sampledTextureValue49 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue76 - 0.5) < 0.0625) ? (multiplyAddValue36 + ((productValue76 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue36, (abs(productValue77 - 0.5) < 0.0625) ? (multiplyAddValue37 + ((productValue77 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue37));
                            float scalarValue77 = sampledTextureValue49.x;
                            float scalarValue78 = sampledTextureValue49.y;
                            float scalarValue79 = sampledTextureValue49.z;
                            float scalarValue80 = sampledTextureValue49.w;
                            float multiplyAddValue38 = fract(fma(multiplyAddValue36, comparisonValue27, 0.5));
                            float multiplyAddValue39 = fract(fma(multiplyAddValue37, comparisonValue28, 0.5));
                            bool conditionValue8 = multiplyAddValue39 > 0.5;
                            bool conditionValue9 = multiplyAddValue38 > 0.5;
                            float comparisonValue29 = conditionValue8 ? scalarValue77 : scalarValue80;
                            float comparisonValue30 = conditionValue8 ? scalarValue78 : scalarValue79;
                            float comparisonValue31 = conditionValue9 ? scalarValue79 : scalarValue80;
                            float comparisonValue32 = conditionValue9 ? scalarValue78 : scalarValue77;
                            float sumValue35 = multiplyAddValue38 - 0.083333335816860198974609375;
                            float sumValue36 = multiplyAddValue38 + 0.083333335816860198974609375;
                            float sumValue37 = multiplyAddValue39 - 0.083333335816860198974609375;
                            float sumValue38 = multiplyAddValue39 + 0.083333335816860198974609375;
                            uint sumValue39 = uint(int(spvNClamp(sumValue35 + sumValue35, 0.0, 1.0)));
                            uint sumValue40 = uint(int(spvNClamp(sumValue36 + sumValue36, 0.0, 1.0)));
                            uint sumValue41 = uint(int(spvNClamp(sumValue37 + sumValue37, 0.0, 1.0)));
                            uint sumValue42 = uint(int(spvNClamp(sumValue38 + sumValue38, 0.0, 1.0)));
                            float comparisonValue33 = ((sumValue39 == 1u) ? comparisonValue30 : ((sumValue39 == 0u) ? comparisonValue29 : 0.0)) - ((sumValue40 == 1u) ? comparisonValue30 : ((sumValue40 == 0u) ? comparisonValue29 : 0.0));
                            float comparisonValue34 = ((sumValue41 == 1u) ? comparisonValue32 : ((sumValue41 == 0u) ? comparisonValue31 : 0.0)) - ((sumValue42 == 1u) ? comparisonValue32 : ((sumValue42 == 0u) ? comparisonValue31 : 0.0));
                            vec3 vectorValue5 = vec3(comparisonValue33, comparisonValue34, 0.25);
                            float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
                            productValue50 = scalarValue75 * (inverseLengthValue12 * comparisonValue34);
                            productValue51 = scalarValue75 * (inverseLengthValue12 * comparisonValue33);
                            productValue52 = inverseLengthValue12 * 0.25;
                            intermediateValue144 = comparisonValue29;
                            intermediateValue145 = comparisonValue30;
                            intermediateValue146 = comparisonValue32;
                        }
                        else
                        {
                            productValue50 = 0.0;
                            productValue51 = 0.0;
                            productValue52 = 1.0;
                            intermediateValue144 = intermediateValue24;
                            intermediateValue145 = intermediateValue24;
                            intermediateValue146 = intermediateValue24;
                        }
                        intermediateValue104 = productValue50;
                        intermediateValue106 = productValue51;
                        intermediateValue108 = productValue52;
                        intermediateValue110 = intermediateValue144;
                        intermediateValue112 = intermediateValue145;
                        intermediateValue114 = intermediateValue146;
                    }
                    else
                    {
                        bool sampledTextureValue50 = uint(textureQueryLevels(materialTexture3)) > 0u;
                        uvec2 sampledTextureValue51 = uvec2(textureSize(materialTexture3, int(0u)));
                        uint scalarValue81 = sampledTextureValue51.x;
                        float sumValue43 = spvNClamp(2.0 - sumValue34, 0.0, 1.0);
                        bool conditionValue10 = sumValue43 > 0.0;
                        float comparisonValue35 = fract(multiplyAddValue36 * rdEvaluateFloatExpression(sampledTextureValue50 ? scalarValue81 : 0u));
                        float comparisonValue36 = fract(multiplyAddValue37 * rdEvaluateFloatExpression(sampledTextureValue50 ? sampledTextureValue51.y : 0u));
                        float multiplyAddValue40 = (comparisonValue35 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue46.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue41 = (comparisonValue36 <= 0.083333335816860198974609375) ? (-fma(scalarValue72, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue42 = (comparisonValue35 >= 0.916666686534881591796875) ? (fma(scalarValue73, 2.0, -1.0) + multiplyAddValue40) : multiplyAddValue40;
                        float multiplyAddValue43 = (comparisonValue36 >= 0.916666686534881591796875) ? (fma(scalarValue74, 2.0, -1.0) + multiplyAddValue41) : multiplyAddValue41;
                        bool comparisonValue37 = abs(multiplyAddValue42) >= 0.004999999888241291046142578125;
                        bool comparisonValue38 = abs(multiplyAddValue43) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue39 = vec3(comparisonValue37 ? multiplyAddValue42 : 0.0, comparisonValue38 ? multiplyAddValue43 : 0.0, 0.25);
                        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(comparisonValue39, comparisonValue39));
                        intermediateValue104 = (conditionValue10 && comparisonValue38) ? (sumValue43 * (inverseLengthValue13 * multiplyAddValue43)) : 0.0;
                        intermediateValue106 = (conditionValue10 && comparisonValue37) ? (sumValue43 * (inverseLengthValue13 * multiplyAddValue42)) : 0.0;
                        intermediateValue108 = conditionValue10 ? (inverseLengthValue13 * 0.25) : 1.0;
                        intermediateValue110 = intermediateValue24;
                        intermediateValue112 = intermediateValue24;
                        intermediateValue114 = intermediateValue24;
                    }
                    intermediateValue103 = intermediateValue104;
                    intermediateValue105 = intermediateValue106;
                    intermediateValue107 = intermediateValue108;
                    intermediateValue109 = intermediateValue110;
                    intermediateValue111 = intermediateValue112;
                    intermediateValue113 = intermediateValue114;
                }
                else
                {
                    intermediateValue103 = 0.0;
                    intermediateValue105 = 0.0;
                    intermediateValue107 = 1.0;
                    intermediateValue109 = intermediateValue24;
                    intermediateValue111 = intermediateValue24;
                    intermediateValue113 = intermediateValue24;
                }
                intermediateValue82 = intermediateValue103;
                intermediateValue84 = intermediateValue105;
                intermediateValue85 = intermediateValue107;
                intermediateValue86 = intermediateValue109;
                intermediateValue87 = intermediateValue111;
                intermediateValue88 = intermediateValue113;
            }
            intermediateValue81 = intermediateValue82;
            intermediateValue83 = intermediateValue84;
            intermediateValue30 = intermediateValue85;
            intermediateValue32 = intermediateValue86;
            intermediateValue34 = intermediateValue87;
            intermediateValue36 = intermediateValue88;
        }
        float comparisonValue;
        float intermediateValue39;
        float intermediateValue41;
        float intermediateValue43;
        if ((reinterpretedBits3 & 1u) == 1u)
        {
            vec4 reinterpretedBits5 = uintBitsToFloat(intermediateValue4.packedValues[scalarValue * 4u]);
            vec4 sampledTextureValue52 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(varyingTexCoord0.x, reinterpretedBits5.x, reinterpretedBits5.z), fma(varyingTexCoord0.y, reinterpretedBits5.y, reinterpretedBits5.w)));
            comparisonValue = ((reinterpretedBits3 & 2u) == 2u) ? sampledTextureValue52.w : scalarValue64;
            intermediateValue39 = sampledTextureValue52.x;
            intermediateValue41 = sampledTextureValue52.z;
            intermediateValue43 = sampledTextureValue52.y;
        }
        else
        {
            comparisonValue = scalarValue64;
            intermediateValue39 = reinterpretedBits1.w;
            intermediateValue41 = reinterpretedBits1.y;
            intermediateValue43 = reinterpretedBits1.z;
        }
        float comparisonValue40 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue41 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue42 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue6 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
        float productValue78 = inverseLengthValue14 * varyingTangent0.x;
        float productValue79 = inverseLengthValue14 * varyingTangent0.y;
        float productValue80 = inverseLengthValue14 * varyingTangent0.z;
        vec3 vectorValue7 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
        vec3 vectorValue8 = vec3(comparisonValue40, comparisonValue41, comparisonValue42);
        float inverseLengthValue16 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
        float productValue81 = intermediateValue81 * (inverseLengthValue15 * varyingBitangent0.x);
        float productValue82 = intermediateValue81 * (inverseLengthValue15 * varyingBitangent0.y);
        intermediateValue23 = productValue79;
        intermediateValue25 = productValue78;
        intermediateValue26 = productValue81;
        intermediateValue27 = productValue82;
        intermediateValue28 = productValue80;
        intermediateValue29 = intermediateValue30;
        intermediateValue31 = intermediateValue32;
        intermediateValue33 = intermediateValue34;
        intermediateValue35 = intermediateValue36;
        intermediateValue37 = comparisonValue;
        intermediateValue38 = intermediateValue39;
        multiplyAddValue = fma(inverseLengthValue16 * comparisonValue40, intermediateValue30, fma(productValue78, intermediateValue83, productValue81));
        multiplyAddValue1 = fma(inverseLengthValue16 * comparisonValue41, intermediateValue30, fma(productValue79, intermediateValue83, productValue82));
        multiplyAddValue2 = fma(inverseLengthValue16 * comparisonValue42, intermediateValue30, fma(productValue80, intermediateValue83, intermediateValue81 * (inverseLengthValue15 * varyingBitangent0.z)));
        intermediateValue40 = intermediateValue41;
        intermediateValue42 = intermediateValue43;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        multiplyAddValue = 0.0;
        intermediateValue3 = 1.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
        intermediateValue7 = 0.0;
        intermediateValue8 = 1.0;
        intermediateValue9 = 0.0;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue23 = intermediateValue24;
        intermediateValue25 = intermediateValue24;
        intermediateValue26 = intermediateValue24;
        intermediateValue27 = intermediateValue24;
        intermediateValue28 = intermediateValue24;
        intermediateValue29 = intermediateValue24;
        intermediateValue31 = intermediateValue24;
        intermediateValue33 = intermediateValue24;
        intermediateValue35 = intermediateValue24;
        intermediateValue37 = 0.0;
        intermediateValue38 = 0.0;
        multiplyAddValue = 0.0;
        multiplyAddValue1 = 1.0;
        multiplyAddValue2 = 0.0;
        intermediateValue40 = 1.0;
        intermediateValue42 = 0.0;
    }
    bool conditionValue11 = fragmentScalarConstants1.packedValues[40u] > 0.0;
    float intermediateValue52;
    float intermediateValue54;
    float intermediateValue56;
    float intermediateValue58;
    float intermediateValue60;
    float intermediateValue62;
    float intermediateValue64;
    float intermediateValue66;
    float intermediateValue68;
    if (conditionValue11)
    {
        uint productValue83 = uint(int(fragmentScalarConstants1.packedValues[42u] * 0.5));
        float quotientValue7 = (varyingTexCoord3.x - fragmentScalarConstants1.packedValues[0u]) / fragmentScalarConstants1.packedValues[3u];
        float quotientValue8 = (varyingTexCoord3.z - fragmentScalarConstants1.packedValues[2u]) / fragmentScalarConstants1.packedValues[3u];
        uint scalarValue19 = uint(int(fragmentVectorConstants1.packedValues[10u].w));
        uint sumValue44 = uint(int(fragmentVectorConstants1.packedValues[10u].z)) - 1u;
        uint sumValue45 = uint(min(int(uint(max(int(productValue83 + uint(int(floor(quotientValue7)))), int(0u)))), int(sumValue44)));
        uint sumValue46 = uint(min(int(uint(max(int(productValue83 + uint(int(floor(quotientValue8)))), int(0u)))), int(sumValue44)));
        uint sampledTextureValue53 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue45, sumValue46)), int(0u)).x * 255.0)));
        bool comparisonValue43 = int(sampledTextureValue53) >= int(scalarValue19);
        bool conditionValue12 = !comparisonValue43;
        uint comparisonValue44 = comparisonValue43 ? 0u : sampledTextureValue53;
        uint sumValue47 = sumValue46 + 1u;
        uint sumValue48 = sumValue45 + 1u;
        float reinterpretedBits6 = uintBitsToFloat(sumValue48);
        float reinterpretedBits16 = uintBitsToFloat(sumValue47);
        uint sampledTextureValue54 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue48, sumValue46)), int(0u)).x * 255.0)));
        bool comparisonValue45 = int(sampledTextureValue54) >= int(scalarValue19);
        bool conditionValue13 = !comparisonValue45;
        uint comparisonValue46 = comparisonValue45 ? 0u : sampledTextureValue54;
        uint sampledTextureValue55 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue45, sumValue47)), int(0u)).x * 255.0)));
        bool comparisonValue47 = int(sampledTextureValue55) >= int(scalarValue19);
        bool conditionValue14 = !comparisonValue47;
        uint comparisonValue48 = comparisonValue47 ? 0u : sampledTextureValue55;
        uint sampledTextureValue56 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue48, sumValue47)), int(0u)).x * 255.0)));
        bool comparisonValue49 = int(sampledTextureValue56) >= int(scalarValue19);
        uint comparisonValue50 = comparisonValue49 ? 0u : sampledTextureValue56;
        bool comparisonValue51 = sampledTextureValue54 == 0u;
        bool comparisonValue52 = sampledTextureValue55 == 0u;
        bool comparisonValue53 = (comparisonValue49 && (comparisonValue47 || (conditionValue14 && comparisonValue52))) || ((!comparisonValue49) && ((comparisonValue47 && (sampledTextureValue56 == 0u)) || ((sampledTextureValue55 == sampledTextureValue56) && conditionValue14)));
        bool comparisonValue54 = comparisonValue53 && (((((comparisonValue43 && comparisonValue51) || (conditionValue12 && (sampledTextureValue53 == sampledTextureValue54))) && conditionValue13) || (comparisonValue45 && ((conditionValue12 && (sampledTextureValue53 == 0u)) || comparisonValue43))) && ((comparisonValue47 && (comparisonValue45 || (comparisonValue51 && conditionValue13))) || (conditionValue14 && ((conditionValue13 && (sampledTextureValue54 == sampledTextureValue55)) || (comparisonValue45 && comparisonValue52)))));
        float reinterpretedBits7;
        float reinterpretedBits8;
        float reinterpretedBits9;
        float reinterpretedBits10;
        float reinterpretedBits11;
        float reinterpretedBits12;
        float reinterpretedBits13;
        float reinterpretedBits14;
        float reinterpretedBits15;
        if (comparisonValue54)
        {
            uint productValue84 = (comparisonValue44 * 20u) + 8u;
            uvec3 sumValue49 = uvec3(intermediateValue5.packedValues[productValue84], intermediateValue5.packedValues[productValue84 + 1u], intermediateValue5.packedValues[productValue84 + 2u]);
            uint productValue85 = (comparisonValue44 * 10u) + 6u;
            uint productValue86 = (comparisonValue44 * 5u) + 4u;
            reinterpretedBits7 = uintBitsToFloat(sumValue49.y);
            reinterpretedBits8 = uintBitsToFloat(sumValue49.x);
            reinterpretedBits9 = uintBitsToFloat(intermediateValue6.packedValues[productValue85].x);
            reinterpretedBits10 = uintBitsToFloat(intermediateValue6.packedValues[productValue85].y);
            reinterpretedBits11 = uintBitsToFloat(sumValue49.z);
            reinterpretedBits12 = uintBitsToFloat(intermediateValue7.packedValues[productValue86].x);
            reinterpretedBits13 = uintBitsToFloat(intermediateValue7.packedValues[productValue86].y);
            reinterpretedBits14 = uintBitsToFloat(intermediateValue7.packedValues[productValue86].z);
            reinterpretedBits15 = uintBitsToFloat(intermediateValue7.packedValues[productValue86].w);
        }
        else
        {
            reinterpretedBits7 = reinterpretedBits16;
            reinterpretedBits8 = reinterpretedBits6;
            reinterpretedBits9 = uintBitsToFloat(sumValue45);
            reinterpretedBits10 = reinterpretedBits16;
            reinterpretedBits11 = 0.0;
            reinterpretedBits12 = comparisonValue53 ? uintBitsToFloat(0xffffffffu ) : 0.0;
            reinterpretedBits13 = reinterpretedBits6;
            reinterpretedBits14 = uintBitsToFloat(sumValue46);
            reinterpretedBits15 = 0.0;
        }
        float intermediateValue53;
        float intermediateValue55;
        float intermediateValue57;
        float intermediateValue59;
        float intermediateValue61;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 4u)).x);
        float sampledTextureValue4 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 5u)).x);
        float sampledTextureValue5 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 6u)).x);
        float sampledTextureValue6 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 7u)).x);
        uvec4 sampledTextureValue7 = texelFetch(pbrData, int((scalarValue * 16u) + 8u));
        uint scalarValue1 = sampledTextureValue7.x;
        float sampledTextureValue8 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 12u)).x);
        float sampledTextureValue9 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 13u)).x);
        float sampledTextureValue10 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 15u)).x);
        float intermediateValue62;
#endif
        float intermediateValue63;
#if RD_PLATFORM == RD_PLATFORM_SM50
        float intermediateValue65;
        float intermediateValue67;
        float intermediateValue69;
        if (!comparisonValue54)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float intermediateValue64;
        if ((scalarValue1 & 4u) == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            uint productValue87 = (comparisonValue44 * 20u) + 8u;
            uvec3 sumValue50 = uvec3(intermediateValue5.packedValues[productValue87], intermediateValue5.packedValues[productValue87 + 1u], intermediateValue5.packedValues[productValue87 + 2u]);
            float reinterpretedBits17 = uintBitsToFloat(sumValue50.x);
            float reinterpretedBits18 = uintBitsToFloat(sumValue50.y);
            float reinterpretedBits19 = uintBitsToFloat(sumValue50.z);
            uint productValue88 = (comparisonValue44 * 10u) + 6u;
            float reinterpretedBits20 = uintBitsToFloat(intermediateValue6.packedValues[productValue88].x);
            float reinterpretedBits21 = uintBitsToFloat(intermediateValue6.packedValues[productValue88].y);
            uint productValue89 = (comparisonValue44 * 5u) + 4u;
            float reinterpretedBits22 = uintBitsToFloat(intermediateValue7.packedValues[productValue89].x);
            float reinterpretedBits23 = uintBitsToFloat(intermediateValue7.packedValues[productValue89].y);
            float reinterpretedBits24 = uintBitsToFloat(intermediateValue7.packedValues[productValue89].z);
            float reinterpretedBits25 = uintBitsToFloat(intermediateValue7.packedValues[productValue89].w);
            uint productValue90 = (comparisonValue46 * 20u) + 8u;
            uvec3 sumValue51 = uvec3(intermediateValue5.packedValues[productValue90], intermediateValue5.packedValues[productValue90 + 1u], intermediateValue5.packedValues[productValue90 + 2u]);
            uint productValue91 = (comparisonValue46 * 10u) + 6u;
            uint productValue92 = (comparisonValue46 * 5u) + 4u;
            uint productValue93 = (comparisonValue48 * 20u) + 8u;
            uvec3 sumValue52 = uvec3(intermediateValue5.packedValues[productValue93], intermediateValue5.packedValues[productValue93 + 1u], intermediateValue5.packedValues[productValue93 + 2u]);
            uint productValue94 = (comparisonValue48 * 10u) + 6u;
            uint productValue95 = (comparisonValue48 * 5u) + 4u;
            uint productValue96 = (comparisonValue50 * 20u) + 8u;
            uvec3 sumValue53 = uvec3(intermediateValue5.packedValues[productValue96], intermediateValue5.packedValues[productValue96 + 1u], intermediateValue5.packedValues[productValue96 + 2u]);
            uint productValue97 = (comparisonValue50 * 10u) + 6u;
            uint productValue98 = (comparisonValue50 * 5u) + 4u;
            float reinterpretedBits26 = uintBitsToFloat(sumValue51.x);
            float reinterpretedBits27 = uintBitsToFloat(sumValue51.y);
            float reinterpretedBits28 = uintBitsToFloat(sumValue51.z);
            float reinterpretedBits29 = uintBitsToFloat(intermediateValue6.packedValues[productValue91].x);
            float reinterpretedBits30 = uintBitsToFloat(intermediateValue6.packedValues[productValue91].y);
            float reinterpretedBits31 = uintBitsToFloat(intermediateValue7.packedValues[productValue92].x);
            float reinterpretedBits32 = uintBitsToFloat(intermediateValue7.packedValues[productValue92].y);
            float reinterpretedBits33 = uintBitsToFloat(intermediateValue7.packedValues[productValue92].z);
            float reinterpretedBits34 = uintBitsToFloat(intermediateValue7.packedValues[productValue92].w);
            float reinterpretedBits35 = uintBitsToFloat(sumValue52.x);
            float reinterpretedBits36 = uintBitsToFloat(sumValue52.y);
            float reinterpretedBits37 = uintBitsToFloat(sumValue52.z);
            float reinterpretedBits38 = uintBitsToFloat(intermediateValue6.packedValues[productValue94].x);
            float reinterpretedBits39 = uintBitsToFloat(intermediateValue6.packedValues[productValue94].y);
            float reinterpretedBits40 = uintBitsToFloat(intermediateValue7.packedValues[productValue95].x);
            float reinterpretedBits41 = uintBitsToFloat(intermediateValue7.packedValues[productValue95].y);
            float reinterpretedBits42 = uintBitsToFloat(intermediateValue7.packedValues[productValue95].z);
            float reinterpretedBits43 = uintBitsToFloat(intermediateValue7.packedValues[productValue95].w);
            float reinterpretedBits44 = uintBitsToFloat(sumValue53.x);
            float reinterpretedBits45 = uintBitsToFloat(sumValue53.y);
            float reinterpretedBits46 = uintBitsToFloat(sumValue53.z);
            float reinterpretedBits47 = uintBitsToFloat(intermediateValue6.packedValues[productValue97].x);
            float reinterpretedBits48 = uintBitsToFloat(intermediateValue6.packedValues[productValue97].y);
            float reinterpretedBits49 = uintBitsToFloat(intermediateValue7.packedValues[productValue98].x);
            float reinterpretedBits50 = uintBitsToFloat(intermediateValue7.packedValues[productValue98].y);
            float reinterpretedBits51 = uintBitsToFloat(intermediateValue7.packedValues[productValue98].z);
            float reinterpretedBits52 = uintBitsToFloat(intermediateValue7.packedValues[productValue98].w);
            bool comparisonValue55 = !(((reinterpretedBits43 == reinterpretedBits52) && (((reinterpretedBits41 == reinterpretedBits50) && (((reinterpretedBits39 == reinterpretedBits48) && ((((reinterpretedBits35 == reinterpretedBits44) && (reinterpretedBits36 == reinterpretedBits45)) && (reinterpretedBits37 == reinterpretedBits46)) && (reinterpretedBits38 == reinterpretedBits47))) && (reinterpretedBits40 == reinterpretedBits49))) && (reinterpretedBits42 == reinterpretedBits51))) && ((((((((((reinterpretedBits26 == reinterpretedBits35) && (reinterpretedBits27 == reinterpretedBits36)) && (reinterpretedBits28 == reinterpretedBits37)) && (reinterpretedBits38 == reinterpretedBits29)) && (reinterpretedBits39 == reinterpretedBits30)) && (reinterpretedBits31 == reinterpretedBits40)) && (reinterpretedBits32 == reinterpretedBits41)) && (reinterpretedBits33 == reinterpretedBits42)) && (reinterpretedBits34 == reinterpretedBits43)) && (((((((((reinterpretedBits17 == reinterpretedBits26) && (reinterpretedBits18 == reinterpretedBits27)) && (reinterpretedBits19 == reinterpretedBits28)) && (reinterpretedBits29 == reinterpretedBits20)) && (reinterpretedBits30 == reinterpretedBits21)) && (reinterpretedBits22 == reinterpretedBits31)) && (reinterpretedBits23 == reinterpretedBits32)) && (reinterpretedBits24 == reinterpretedBits33)) && (reinterpretedBits25 == reinterpretedBits34))));
            float multiplyAddValue14;
            float multiplyAddValue15;
            float multiplyAddValue16;
            float multiplyAddValue17;
            float multiplyAddValue18;
            float multiplyAddValue19;
            float multiplyAddValue20;
            float multiplyAddValue21;
            float multiplyAddValue22;
            if (comparisonValue55)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue1;
            float branchMergedValue11;
            float branchMergedValue12;
            if ((scalarValue1 & 8u) == 0u)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue82 = fract(quotientValue7);
                float scalarValue83 = fract(quotientValue8);
                float sumValue54 = 1.0 - scalarValue83;
                float sumValue55 = 1.0 - scalarValue82;
                float productValue99 = sumValue54 * sumValue55;
                float productValue100 = scalarValue82 * sumValue54;
                float productValue101 = scalarValue83 * sumValue55;
                float productValue102 = scalarValue83 * scalarValue82;
                multiplyAddValue14 = fma(reinterpretedBits45, productValue102, fma(reinterpretedBits36, productValue101, fma(reinterpretedBits18, productValue99, reinterpretedBits27 * productValue100)));
                multiplyAddValue15 = fma(reinterpretedBits44, productValue102, fma(reinterpretedBits35, productValue101, fma(reinterpretedBits17, productValue99, reinterpretedBits26 * productValue100)));
                multiplyAddValue16 = fma(reinterpretedBits47, productValue102, fma(reinterpretedBits38, productValue101, fma(reinterpretedBits20, productValue99, reinterpretedBits29 * productValue100)));
                multiplyAddValue17 = fma(reinterpretedBits48, productValue102, fma(reinterpretedBits39, productValue101, fma(reinterpretedBits21, productValue99, reinterpretedBits30 * productValue100)));
                multiplyAddValue18 = fma(reinterpretedBits46, productValue102, fma(reinterpretedBits37, productValue101, fma(reinterpretedBits19, productValue99, reinterpretedBits28 * productValue100)));
                multiplyAddValue19 = fma(reinterpretedBits49, productValue102, fma(reinterpretedBits40, productValue101, fma(reinterpretedBits22, productValue99, reinterpretedBits31 * productValue100)));
                multiplyAddValue20 = fma(reinterpretedBits50, productValue102, fma(reinterpretedBits41, productValue101, fma(reinterpretedBits23, productValue99, reinterpretedBits32 * productValue100)));
                multiplyAddValue21 = fma(reinterpretedBits51, productValue102, fma(reinterpretedBits42, productValue101, fma(reinterpretedBits24, productValue99, reinterpretedBits33 * productValue100)));
                multiplyAddValue22 = fma(reinterpretedBits52, productValue102, fma(reinterpretedBits43, productValue101, fma(reinterpretedBits25, productValue99, reinterpretedBits34 * productValue100)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float branchMergedValue16;
                float branchMergedValue26;
                float branchMergedValue27;
                if ((scalarValue1 & 16u) == 0u)
                {
                    branchMergedValue16 = 0.0;
                    branchMergedValue26 = 1.0;
                    branchMergedValue27 = 0.0;
                }
                else
                {
                    float multiplyAddValue3 = fma(varyingTexCoord0.x, sampledTextureValue3, sampledTextureValue5);
                    float multiplyAddValue4 = fma(varyingTexCoord0.y, sampledTextureValue4, sampledTextureValue6);
                    vec4 sampledTextureValue11 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue3, multiplyAddValue4), 0.0);
                    float scalarValue2 = sampledTextureValue11.x;
                    float scalarValue3 = sampledTextureValue11.y;
                    float scalarValue4 = sampledTextureValue11.z;
                    float multiplyAddValue5 = spvNClamp(fma(spvNMin(sampledTextureValue10 - sampledTextureValue9, sampledTextureValue10), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue = multiplyAddValue5 > 0.0;
                    float branchMergedValue30;
                    float branchMergedValue31;
                    float branchMergedValue32;
                    if ((scalarValue2 == scalarValue3) && (scalarValue3 == scalarValue4))
                    {
                        float branchMergedValue33;
                        float branchMergedValue35;
                        float branchMergedValue36;
                        if (conditionValue)
                        {
                            uvec2 sampledTextureValue12 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue = float(int(uint(int(float(int(sampledTextureValue12.x)))))) * multiplyAddValue3;
                            float productValue1 = float(int(uint(int(float(int(sampledTextureValue12.y)))))) * multiplyAddValue4;
                            float scalarValue5 = fract(productValue);
                            float scalarValue6 = fract(productValue1);
                            float comparisonValue14;
                            if (abs(scalarValue5 + (-0.5)) < 0.0625)
                            {
                                comparisonValue14 = ((scalarValue5 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue3;
                            }
                            else
                            {
                                comparisonValue14 = multiplyAddValue3;
                            }
                            float comparisonValue15;
                            if (abs(scalarValue6 + (-0.5)) < 0.0625)
                            {
                                comparisonValue15 = ((scalarValue6 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue4;
                            }
                            else
                            {
                                comparisonValue15 = multiplyAddValue4;
                            }
                            vec4 sampledTextureValue13 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue14, comparisonValue15));
                            float scalarValue7 = sampledTextureValue13.x;
                            float scalarValue8 = sampledTextureValue13.y;
                            float scalarValue9 = sampledTextureValue13.z;
                            float scalarValue10 = sampledTextureValue13.w;
                            float sumValue = fract(productValue + 0.5);
                            float sumValue1 = fract(productValue1 + 0.5);
                            bool conditionValue1 = sumValue1 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue1 ? scalarValue7 : scalarValue10;
                            intermediateValue1[1u] = conditionValue1 ? scalarValue8 : scalarValue9;
                            float productValue2 = intermediateValue1[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue3 = intermediateValue1[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue2 = productValue2 - productValue3;
                            bool conditionValue2 = sumValue > 0.5;
                            intermediateValue1[0u] = conditionValue2 ? scalarValue9 : scalarValue10;
                            intermediateValue1[1u] = conditionValue2 ? scalarValue8 : scalarValue7;
                            float productValue4 = intermediateValue1[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue = inversesqrt(dot(vec3(sumValue2, productValue4, 0.25), vec3(sumValue2, productValue4, 0.25)));
                            float productValue5 = inverseLengthValue * multiplyAddValue5;
                            branchMergedValue33 = productValue5 * productValue4;
                            branchMergedValue35 = inverseLengthValue * 0.25;
                            branchMergedValue36 = productValue5 * sumValue2;
                        }
                        else
                        {
                            branchMergedValue33 = 0.0;
                            branchMergedValue35 = 1.0;
                            branchMergedValue36 = 0.0;
                        }
                        branchMergedValue30 = branchMergedValue33;
                        branchMergedValue31 = branchMergedValue35;
                        branchMergedValue32 = branchMergedValue36;
                    }
                    else
                    {
                        uvec2 sampledTextureValue14 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue34;
                        float branchMergedValue37;
                        float branchMergedValue38;
                        if (conditionValue)
                        {
                            float productValue6 = fract(float(int(uint(int(float(int(sampledTextureValue14.x)))))) * multiplyAddValue3);
                            float productValue7 = fract(float(int(uint(int(float(int(sampledTextureValue14.y)))))) * multiplyAddValue4);
                            float comparisonValue2 = (((productValue6 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue3 * 2.0) + (-1.0))) - (((productValue6 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue11.w * 2.0) + (-1.0)));
                            float comparisonValue3 = (((productValue7 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue4 * 2.0) + (-1.0))) - (((productValue7 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue2 * 2.0) + (-1.0)));
                            float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue2;
                            float comparisonValue5 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue4, comparisonValue5, 0.25), vec3(comparisonValue4, comparisonValue5, 0.25)));
                            float productValue8 = inverseLengthValue1 * multiplyAddValue5;
                            branchMergedValue34 = productValue8 * comparisonValue5;
                            branchMergedValue37 = inverseLengthValue1 * 0.25;
                            branchMergedValue38 = productValue8 * comparisonValue4;
                        }
                        else
                        {
                            branchMergedValue34 = 0.0;
                            branchMergedValue37 = 1.0;
                            branchMergedValue38 = 0.0;
                        }
                        branchMergedValue30 = branchMergedValue34;
                        branchMergedValue31 = branchMergedValue37;
                        branchMergedValue32 = branchMergedValue38;
                    }
                    branchMergedValue16 = branchMergedValue30;
                    branchMergedValue26 = branchMergedValue31;
                    branchMergedValue27 = branchMergedValue32;
                }
                branchMergedValue1 = branchMergedValue16;
                branchMergedValue11 = branchMergedValue26;
                branchMergedValue12 = branchMergedValue27;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                multiplyAddValue14 = reinterpretedBits18;
                multiplyAddValue15 = reinterpretedBits17;
                multiplyAddValue16 = reinterpretedBits20;
                multiplyAddValue17 = reinterpretedBits21;
                multiplyAddValue18 = reinterpretedBits19;
                multiplyAddValue19 = reinterpretedBits22;
                multiplyAddValue20 = reinterpretedBits23;
                multiplyAddValue21 = reinterpretedBits24;
                multiplyAddValue22 = reinterpretedBits25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float multiplyAddValue6 = fma(varyingTexCoord0.x, sampledTextureValue3, sampledTextureValue5);
                float multiplyAddValue7 = fma(varyingTexCoord0.y, sampledTextureValue4, sampledTextureValue6);
                float multiplyAddValue8 = spvNClamp(fma(spvNMin(sampledTextureValue10 - sampledTextureValue9, sampledTextureValue10), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue17;
                float branchMergedValue28;
                float branchMergedValue29;
                if (multiplyAddValue8 > 0.0)
                {
                    uvec2 sampledTextureValue15 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue11 = float(int(uint(int(float(int(sampledTextureValue15.x)))))) * multiplyAddValue6;
                    float productValue12 = float(int(uint(int(float(int(sampledTextureValue15.y)))))) * multiplyAddValue7;
                    float scalarValue11 = fract(productValue11);
                    float scalarValue12 = fract(productValue12);
                    float comparisonValue8;
                    if (abs(scalarValue11 + (-0.5)) < 0.0625)
                    {
                        comparisonValue8 = ((scalarValue11 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue6;
                    }
                    else
                    {
                        comparisonValue8 = multiplyAddValue6;
                    }
                    float comparisonValue13;
                    if (abs(scalarValue12 + (-0.5)) < 0.0625)
                    {
                        comparisonValue13 = ((scalarValue12 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue7;
                    }
                    else
                    {
                        comparisonValue13 = multiplyAddValue7;
                    }
                    vec4 sampledTextureValue16 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue8, comparisonValue13));
                    float scalarValue13 = sampledTextureValue16.x;
                    float scalarValue14 = sampledTextureValue16.y;
                    float scalarValue15 = sampledTextureValue16.z;
                    float scalarValue16 = sampledTextureValue16.w;
                    float sumValue3 = fract(productValue11 + 0.5);
                    float sumValue4 = fract(productValue12 + 0.5);
                    bool conditionValue3 = sumValue4 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue3 ? scalarValue13 : scalarValue16;
                    intermediateValue2[1u] = conditionValue3 ? scalarValue14 : scalarValue15;
                    float productValue13 = intermediateValue2[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue14 = intermediateValue2[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue5 = productValue13 - productValue14;
                    bool conditionValue4 = sumValue3 > 0.5;
                    intermediateValue2[0u] = conditionValue4 ? scalarValue15 : scalarValue16;
                    intermediateValue2[1u] = conditionValue4 ? scalarValue14 : scalarValue13;
                    float productValue15 = intermediateValue2[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue5, productValue15, 0.25), vec3(sumValue5, productValue15, 0.25)));
                    float productValue19 = inverseLengthValue2 * multiplyAddValue8;
                    branchMergedValue17 = productValue19 * productValue15;
                    branchMergedValue28 = inverseLengthValue2 * 0.25;
                    branchMergedValue29 = productValue19 * sumValue5;
                }
                else
                {
                    branchMergedValue17 = 0.0;
                    branchMergedValue28 = 1.0;
                    branchMergedValue29 = 0.0;
                }
                branchMergedValue1 = branchMergedValue17;
                branchMergedValue11 = branchMergedValue28;
                branchMergedValue12 = branchMergedValue29;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue53 = multiplyAddValue14;
            intermediateValue55 = multiplyAddValue15;
            intermediateValue57 = multiplyAddValue16;
            intermediateValue59 = multiplyAddValue17;
            intermediateValue61 = multiplyAddValue18;
            intermediateValue63 = multiplyAddValue19;
            intermediateValue65 = multiplyAddValue20;
            intermediateValue67 = multiplyAddValue21;
            intermediateValue69 = multiplyAddValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue62 = branchMergedValue12;
            intermediateValue63 = branchMergedValue1;
            intermediateValue64 = branchMergedValue11;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue53 = reinterpretedBits7;
            intermediateValue55 = reinterpretedBits8;
            intermediateValue57 = reinterpretedBits9;
            intermediateValue59 = reinterpretedBits10;
            intermediateValue61 = reinterpretedBits11;
            intermediateValue63 = reinterpretedBits12;
            intermediateValue65 = reinterpretedBits13;
            intermediateValue67 = reinterpretedBits14;
            intermediateValue69 = reinterpretedBits15;
        }
        intermediateValue52 = intermediateValue53;
        intermediateValue54 = intermediateValue55;
        intermediateValue56 = intermediateValue57;
        intermediateValue58 = intermediateValue59;
        intermediateValue60 = intermediateValue61;
        intermediateValue62 = intermediateValue63;
        intermediateValue64 = intermediateValue65;
        intermediateValue66 = intermediateValue67;
        intermediateValue68 = intermediateValue69;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float multiplyAddValue9 = fma(varyingTexCoord0.x, sampledTextureValue3, sampledTextureValue5);
            float multiplyAddValue10 = fma(varyingTexCoord0.y, sampledTextureValue4, sampledTextureValue6);
            uvec2 sampledTextureValue17 = uvec2(textureSize(matTextureTexture, int(0u)));
            float productValue20 = float(int(uint(int(float(int(sampledTextureValue17.x)))))) * multiplyAddValue9;
            float productValue21 = float(int(uint(int(float(int(sampledTextureValue17.y)))))) * multiplyAddValue10;
            float scalarValue17 = dFdxCoarse(productValue20);
            float scalarValue18 = dFdxCoarse(productValue21);
            float sumValue6 = dFdyCoarse((-0.0) - productValue20);
            float sumValue7 = dFdyCoarse((-0.0) - productValue21);
            float dotProductValue = spvNMax(0.0, log2(spvNMax(dot(vec2(scalarValue17, scalarValue18), vec2(scalarValue17, scalarValue18)), dot(vec2(sumValue6, sumValue7), vec2(sumValue6, sumValue7)))) * 0.5);
            float branchMergedValue2;
            float branchMergedValue13;
            float branchMergedValue14;
            if (!(dotProductValue <= 1.0))
            {
                branchMergedValue2 = 0.0;
                branchMergedValue13 = 1.0;
                branchMergedValue14 = 0.0;
            }
            else
            {
                vec4 sampledTextureValue18 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue9, multiplyAddValue10), dotProductValue);
                float quotientValue = (1.0 - spvNClamp(dotProductValue * dotProductValue, 0.0, 1.0)) * (1.0 / ((sampledTextureValue18.z * 2.0) + (-1.0)));
                float productValue22 = quotientValue * ((sampledTextureValue18.x * 2.0) + (-1.0));
                float productValue23 = quotientValue * ((sampledTextureValue18.y * 2.0) + (-1.0));
                float inverseLengthValue3 = inversesqrt(dot(vec3(productValue22, productValue23, 1.0), vec3(productValue22, productValue23, 1.0)));
                branchMergedValue2 = productValue23 * inverseLengthValue3;
                branchMergedValue13 = inverseLengthValue3;
                branchMergedValue14 = productValue22 * inverseLengthValue3;
            }
            intermediateValue62 = branchMergedValue14;
            intermediateValue63 = branchMergedValue2;
            intermediateValue64 = branchMergedValue13;
        }
        float intermediateValue6;
        float sampledTextureValue;
        float sampledTextureValue1;
        float sampledTextureValue2;
        if ((scalarValue1 & 1u) == 0u)
        {
            sampledTextureValue = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 10u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 11u)).x);
            sampledTextureValue1 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 9u)).x);
            intermediateValue6 = sampledTextureValue8;
        }
        else
        {
            vec4 sampledTextureValue19 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 3u)).x))));
            sampledTextureValue = sampledTextureValue19.y;
            sampledTextureValue2 = sampledTextureValue19.x;
            sampledTextureValue1 = sampledTextureValue19.z;
            intermediateValue6 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue19.w : sampledTextureValue8;
        }
        float comparisonValue6 = comparisonValue1 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue7 = comparisonValue1 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue9 = comparisonValue1 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue4 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, comparisonValue9), vec3(comparisonValue6, comparisonValue7, comparisonValue9)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue6 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue62;
        multiplyAddValue = fma(inverseLengthValue4 * comparisonValue6, intermediateValue64, fma(inverseLengthValue5 * varyingBitangent0.x, intermediateValue63, inverseLengthValue6 * varyingTangent0.x));
        intermediateValue3 = fma(inverseLengthValue4 * comparisonValue7, intermediateValue64, fma(inverseLengthValue5 * varyingBitangent0.y, intermediateValue63, inverseLengthValue6 * varyingTangent0.y));
        intermediateValue4 = fma(inverseLengthValue4 * comparisonValue9, intermediateValue64, fma(inverseLengthValue5 * varyingBitangent0.z, intermediateValue63, inverseLengthValue6 * varyingTangent0.z));
        intermediateValue5 = intermediateValue6;
        intermediateValue7 = sampledTextureValue;
        intermediateValue8 = sampledTextureValue1;
        intermediateValue9 = sampledTextureValue2;
    }
    float intermediateValue53;
    float intermediateValue54;
    float intermediateValue55;
    float intermediateValue56;
    float intermediateValue57;
    float intermediateValue58;
    float intermediateValue59;
    float intermediateValue60;
    float intermediateValue61;
    if (fragmentVectorConstants1.packedValues[10u].x > 0.0)
    {
        uint productValue27 = uint(int(fragmentVectorConstants1.packedValues[10u].z * 0.5));
        float quotientValue1 = (varyingTexCoord3.x - fragmentVectorConstants1.packedValues[0u].x) / fragmentVectorConstants1.packedValues[0u].w;
        float quotientValue2 = (varyingTexCoord3.z - fragmentVectorConstants1.packedValues[0u].z) / fragmentVectorConstants1.packedValues[0u].w;
        uint sumValue8 = uint(int(fragmentVectorConstants1.packedValues[10u].z)) + 4294967295u;
        uint sumValue9 = uint(min(int(uint(max(int(uint(int(floor(quotientValue1))) + productValue27), int(0u)))), int(sumValue8)));
        uint sumValue10 = uint(min(int(uint(max(int(uint(int(floor(quotientValue2))) + productValue27), int(0u)))), int(sumValue8)));
        uint sampledTextureValue20 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue9, sumValue10)), int(0u)).x * 255.0)));
        uint scalarValue19 = uint(int(fragmentVectorConstants1.packedValues[10u].w));
        uint comparisonValue10 = (int(sampledTextureValue20) >= int(scalarValue19)) ? 0u : sampledTextureValue20;
        uint sumValue11 = sumValue9 + 1u;
        uint sampledTextureValue21 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue11, sumValue10)), int(0u)).x * 255.0)));
        uint comparisonValue11 = (int(sampledTextureValue21) >= int(scalarValue19)) ? 0u : sampledTextureValue21;
        uint sumValue15 = sumValue10 + 1u;
        uint sampledTextureValue22 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue9, sumValue15)), int(0u)).x * 255.0)));
        uint comparisonValue12 = (int(sampledTextureValue22) >= int(scalarValue19)) ? 0u : sampledTextureValue22;
        uint sampledTextureValue23 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue11, sumValue15)), int(0u)).x * 255.0)));
        uint comparisonValue16 = (int(sampledTextureValue23) >= int(scalarValue19)) ? 0u : sampledTextureValue23;
        float branchMergedValue;
        float branchMergedValue3;
        float branchMergedValue4;
        float branchMergedValue5;
        float branchMergedValue6;
        float branchMergedValue7;
        float branchMergedValue8;
        float branchMergedValue9;
        float branchMergedValue10;
        if (((comparisonValue10 == comparisonValue11) && (comparisonValue11 == comparisonValue12)) && (comparisonValue12 == comparisonValue16))
        {
            uint scalarValue20 = (comparisonValue10 * 20u) + 8u;
            vec3 sampledTextureValue24 = uintBitsToFloat(uvec3(texelFetch(zBiomeInfoBuffer, int(scalarValue20)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue20 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue20 + 2u)).x));
            uint productValue28 = (comparisonValue10 * 20u) + 12u;
            vec2 sampledTextureValue25 = uintBitsToFloat(uvec2(texelFetch(zBiomeInfoBuffer, int(productValue28)).x, texelFetch(zBiomeInfoBuffer, int(productValue28 + 1u)).x));
            uint productValue29 = (comparisonValue10 * 20u) + 16u;
            vec4 sampledTextureValue26 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue29)).x, texelFetch(zBiomeInfoBuffer, int(productValue29 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue29 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue29 + 3u)).x));
            branchMergedValue = sampledTextureValue26.z;
            branchMergedValue3 = sampledTextureValue26.w;
            branchMergedValue4 = sampledTextureValue24.x;
            branchMergedValue5 = sampledTextureValue24.y;
            branchMergedValue6 = sampledTextureValue24.z;
            branchMergedValue7 = sampledTextureValue25.x;
            branchMergedValue8 = sampledTextureValue25.y;
            branchMergedValue9 = sampledTextureValue26.x;
            branchMergedValue10 = sampledTextureValue26.y;
        }
        else
        {
            uint productValue30 = (comparisonValue10 * 20u) + 8u;
            vec3 sampledTextureValue27 = uintBitsToFloat(uvec3(texelFetch(zBiomeInfoBuffer, int(productValue30)).x, texelFetch(zBiomeInfoBuffer, int(productValue30 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue30 + 2u)).x));
            float scalarValue21 = sampledTextureValue27.x;
            float scalarValue22 = sampledTextureValue27.y;
            float scalarValue23 = sampledTextureValue27.z;
            uint productValue31 = (comparisonValue10 * 20u) + 12u;
            vec2 sampledTextureValue28 = uintBitsToFloat(uvec2(texelFetch(zBiomeInfoBuffer, int(productValue31)).x, texelFetch(zBiomeInfoBuffer, int(productValue31 + 1u)).x));
            float scalarValue24 = sampledTextureValue28.x;
            float scalarValue25 = sampledTextureValue28.y;
            uint productValue36 = (comparisonValue10 * 20u) + 16u;
            vec4 sampledTextureValue29 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue36)).x, texelFetch(zBiomeInfoBuffer, int(productValue36 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue36 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue36 + 3u)).x));
            float scalarValue26 = sampledTextureValue29.x;
            float scalarValue27 = sampledTextureValue29.y;
            float scalarValue28 = sampledTextureValue29.z;
            float scalarValue29 = sampledTextureValue29.w;
            uint productValue37 = (comparisonValue11 * 20u) + 8u;
            vec3 sampledTextureValue30 = uintBitsToFloat(uvec3(texelFetch(zBiomeInfoBuffer, int(productValue37)).x, texelFetch(zBiomeInfoBuffer, int(productValue37 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue37 + 2u)).x));
            float scalarValue30 = sampledTextureValue30.x;
            float scalarValue31 = sampledTextureValue30.y;
            float scalarValue32 = sampledTextureValue30.z;
            uint productValue38 = (comparisonValue11 * 20u) + 12u;
            vec2 sampledTextureValue31 = uintBitsToFloat(uvec2(texelFetch(zBiomeInfoBuffer, int(productValue38)).x, texelFetch(zBiomeInfoBuffer, int(productValue38 + 1u)).x));
            float scalarValue33 = sampledTextureValue31.x;
            float scalarValue34 = sampledTextureValue31.y;
            uint productValue39 = (comparisonValue11 * 20u) + 16u;
            vec4 sampledTextureValue32 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue39)).x, texelFetch(zBiomeInfoBuffer, int(productValue39 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue39 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue39 + 3u)).x));
            float scalarValue35 = sampledTextureValue32.x;
            float scalarValue36 = sampledTextureValue32.y;
            float scalarValue37 = sampledTextureValue32.z;
            float scalarValue38 = sampledTextureValue32.w;
            uint productValue42 = (comparisonValue12 * 20u) + 8u;
            vec3 sampledTextureValue33 = uintBitsToFloat(uvec3(texelFetch(zBiomeInfoBuffer, int(productValue42)).x, texelFetch(zBiomeInfoBuffer, int(productValue42 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue42 + 2u)).x));
            float scalarValue39 = sampledTextureValue33.x;
            float scalarValue40 = sampledTextureValue33.y;
            float scalarValue41 = sampledTextureValue33.z;
            uint productValue43 = (comparisonValue12 * 20u) + 12u;
            vec2 sampledTextureValue34 = uintBitsToFloat(uvec2(texelFetch(zBiomeInfoBuffer, int(productValue43)).x, texelFetch(zBiomeInfoBuffer, int(productValue43 + 1u)).x));
            float scalarValue42 = sampledTextureValue34.x;
            float scalarValue43 = sampledTextureValue34.y;
            uint productValue44 = (comparisonValue12 * 20u) + 16u;
            vec4 sampledTextureValue35 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue44)).x, texelFetch(zBiomeInfoBuffer, int(productValue44 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue44 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue44 + 3u)).x));
            float scalarValue44 = sampledTextureValue35.x;
            float scalarValue45 = sampledTextureValue35.y;
            float scalarValue46 = sampledTextureValue35.z;
            float scalarValue47 = sampledTextureValue35.w;
            uint productValue45 = (comparisonValue16 * 20u) + 8u;
            vec3 sampledTextureValue36 = uintBitsToFloat(uvec3(texelFetch(zBiomeInfoBuffer, int(productValue45)).x, texelFetch(zBiomeInfoBuffer, int(productValue45 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue45 + 2u)).x));
            float scalarValue48 = sampledTextureValue36.x;
            float scalarValue49 = sampledTextureValue36.y;
            float scalarValue50 = sampledTextureValue36.z;
            uint productValue48 = (comparisonValue16 * 20u) + 12u;
            vec2 sampledTextureValue37 = uintBitsToFloat(uvec2(texelFetch(zBiomeInfoBuffer, int(productValue48)).x, texelFetch(zBiomeInfoBuffer, int(productValue48 + 1u)).x));
            float scalarValue51 = sampledTextureValue37.x;
            float scalarValue52 = sampledTextureValue37.y;
            uint productValue49 = (comparisonValue16 * 20u) + 16u;
            vec4 sampledTextureValue38 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue49)).x, texelFetch(zBiomeInfoBuffer, int(productValue49 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue49 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue49 + 3u)).x));
            float scalarValue53 = sampledTextureValue38.x;
            float scalarValue54 = sampledTextureValue38.y;
            float scalarValue55 = sampledTextureValue38.z;
            float scalarValue56 = sampledTextureValue38.w;
            float scalarValue57 = fract(quotientValue1);
            float scalarValue58 = fract(quotientValue2);
            float sumValue16 = 1.0 - scalarValue57;
            float sumValue17 = 1.0 - scalarValue58;
            float productValue53 = sumValue17 * sumValue16;
            float productValue54 = sumValue17 * scalarValue57;
            float productValue55 = sumValue16 * scalarValue58;
            float productValue56 = scalarValue58 * scalarValue57;
            float branchMergedValue15;
            float branchMergedValue18;
            float branchMergedValue19;
            float branchMergedValue20;
            float branchMergedValue21;
            float branchMergedValue22;
            float branchMergedValue23;
            float branchMergedValue24;
            float branchMergedValue25;
            if ((((scalarValue29 == scalarValue38) && ((scalarValue28 == scalarValue37) && ((scalarValue27 == scalarValue36) && ((scalarValue26 == scalarValue35) && ((scalarValue25 == scalarValue34) && ((scalarValue24 == scalarValue33) && ((scalarValue23 == scalarValue32) && ((scalarValue21 == scalarValue30) && (scalarValue22 == scalarValue31))))))))) && ((scalarValue38 == scalarValue47) && ((scalarValue37 == scalarValue46) && ((scalarValue36 == scalarValue45) && ((scalarValue35 == scalarValue44) && ((scalarValue34 == scalarValue43) && ((scalarValue33 == scalarValue42) && ((scalarValue32 == scalarValue41) && ((scalarValue30 == scalarValue39) && (scalarValue31 == scalarValue40)))))))))) && ((scalarValue47 == scalarValue56) && ((scalarValue46 == scalarValue55) && ((scalarValue45 == scalarValue54) && ((scalarValue44 == scalarValue53) && ((scalarValue43 == scalarValue52) && ((scalarValue42 == scalarValue51) && ((scalarValue41 == scalarValue50) && ((scalarValue39 == scalarValue48) && (scalarValue40 == scalarValue49))))))))))
            {
                branchMergedValue15 = scalarValue28;
                branchMergedValue18 = scalarValue29;
                branchMergedValue19 = scalarValue21;
                branchMergedValue20 = scalarValue22;
                branchMergedValue21 = scalarValue23;
                branchMergedValue22 = scalarValue24;
                branchMergedValue23 = scalarValue25;
                branchMergedValue24 = scalarValue26;
                branchMergedValue25 = scalarValue27;
            }
            else
            {
                branchMergedValue15 = (((productValue56 * scalarValue55) + (productValue55 * scalarValue46)) + (productValue54 * scalarValue37)) + (productValue53 * scalarValue28);
                branchMergedValue18 = (((productValue56 * scalarValue56) + (productValue55 * scalarValue47)) + (productValue54 * scalarValue38)) + (productValue53 * scalarValue29);
                branchMergedValue19 = (((productValue56 * scalarValue48) + (productValue55 * scalarValue39)) + (productValue54 * scalarValue30)) + (productValue53 * scalarValue21);
                branchMergedValue20 = (((productValue56 * scalarValue49) + (productValue55 * scalarValue40)) + (productValue54 * scalarValue31)) + (productValue53 * scalarValue22);
                branchMergedValue21 = (((productValue56 * scalarValue50) + (productValue55 * scalarValue41)) + (productValue54 * scalarValue32)) + (productValue53 * scalarValue23);
                branchMergedValue22 = (((productValue56 * scalarValue51) + (productValue55 * scalarValue42)) + (productValue54 * scalarValue33)) + (productValue53 * scalarValue24);
                branchMergedValue23 = (((productValue56 * scalarValue52) + (productValue55 * scalarValue43)) + (productValue54 * scalarValue34)) + (productValue53 * scalarValue25);
                branchMergedValue24 = (((productValue56 * scalarValue53) + (productValue55 * scalarValue44)) + (productValue54 * scalarValue35)) + (productValue53 * scalarValue26);
                branchMergedValue25 = (((productValue56 * scalarValue54) + (productValue55 * scalarValue45)) + (productValue54 * scalarValue36)) + (productValue53 * scalarValue27);
            }
            branchMergedValue = branchMergedValue15;
            branchMergedValue3 = branchMergedValue18;
            branchMergedValue4 = branchMergedValue19;
            branchMergedValue5 = branchMergedValue20;
            branchMergedValue6 = branchMergedValue21;
            branchMergedValue7 = branchMergedValue22;
            branchMergedValue8 = branchMergedValue23;
            branchMergedValue9 = branchMergedValue24;
            branchMergedValue10 = branchMergedValue25;
        }
        intermediateValue53 = branchMergedValue3;
        intermediateValue54 = branchMergedValue4;
        intermediateValue55 = branchMergedValue5;
        intermediateValue56 = branchMergedValue6;
        intermediateValue57 = branchMergedValue7;
        intermediateValue58 = branchMergedValue8;
        intermediateValue59 = branchMergedValue9;
        intermediateValue60 = branchMergedValue10;
        intermediateValue61 = branchMergedValue;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue52 = intermediateValue23;
        intermediateValue54 = intermediateValue25;
        intermediateValue56 = intermediateValue26;
        intermediateValue58 = intermediateValue27;
        intermediateValue60 = intermediateValue28;
        intermediateValue62 = intermediateValue29;
        intermediateValue64 = intermediateValue31;
        intermediateValue66 = intermediateValue33;
        intermediateValue68 = intermediateValue35;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue53 = fragmentVectorConstants1.packedValues[15u].w;
        intermediateValue54 = fragmentVectorConstants1.packedValues[11u].x;
        intermediateValue55 = fragmentVectorConstants1.packedValues[11u].y;
        intermediateValue56 = fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue57 = fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue58 = fragmentVectorConstants1.packedValues[16u].y;
        intermediateValue59 = fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue60 = fragmentVectorConstants1.packedValues[15u].y;
        intermediateValue61 = fragmentVectorConstants1.packedValues[15u].z;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue72;
    float intermediateValue73;
    float intermediateValue74;
    float intermediateValue75;
    float intermediateValue76;
    float intermediateValue77;
    float intermediateValue78;
    float intermediateValue79;
    float intermediateValue80;
    if (!conditionValue11)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue24;
    float productValue25;
    float productValue26;
    if (fragmentVectorConstants1.packedValues[14u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue72 = fragmentVectorConstants1.packedValues[16u].y;
        intermediateValue73 = fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue74 = fragmentScalarConstants1.packedValues[60u];
        intermediateValue75 = fragmentVectorConstants1.packedValues[15u].y;
        intermediateValue76 = fragmentVectorConstants1.packedValues[15u].z;
        intermediateValue77 = fragmentVectorConstants1.packedValues[15u].w;
        intermediateValue78 = fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue79 = fragmentVectorConstants1.packedValues[11u].x;
        intermediateValue80 = fragmentVectorConstants1.packedValues[11u].y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue57 = fragmentVectorConstants1.packedValues[12u].w * 0.5;
        uint scalarValue59 = uint(intermediateValue55);
        float intermediateValue73;
        float intermediateValue74;
        float intermediateValue75;
        if (scalarValue59 == 0u)
        {
            intermediateValue73 = 0.0;
            intermediateValue74 = 0.0;
            intermediateValue75 = 0.0;
        }
        else
        {
            float intermediateValue77;
            float sumValue13;
            float sumValue14;
            float intermediateValue78;
            float intermediateValue79;
            float intermediateValue80;
            float intermediateValue81;
            float intermediateValue82;
            float intermediateValue83;
            uint intermediateValue84;
            intermediateValue77 = intermediateValue54;
            sumValue13 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[13u].x;
            sumValue14 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[13u].z;
            intermediateValue78 = intermediateValue57;
            intermediateValue79 = 0.0;
            intermediateValue80 = 1.0;
            intermediateValue81 = 0.0;
            intermediateValue82 = 0.0;
            intermediateValue83 = 0.0;
            intermediateValue84 = 0u;
            float sumValue12;
            float productValue34;
            float productValue35;
            for (;;)
            {
                float wavePhaseValue = sin(intermediateValue79);
                float wavePhaseValue1 = cos(intermediateValue79);
                vec2 vectorValue = vec2(sumValue13, sumValue14);
                float dotProductValue1 = dot(vec2(wavePhaseValue, wavePhaseValue1), vectorValue) * intermediateValue77;
                float productValue58 = dotProductValue1 + (productValue57 * intermediateValue78);
                float wavePhaseValue2 = sin(productValue58);
                float exponentialValue = exp2(log2((wavePhaseValue2 + 1.0) * 0.5) * intermediateValue58);
                float wavePhaseValue3 = cos(productValue58) * intermediateValue80;
                float quotientValue3 = (1.0 / (wavePhaseValue2 + 1.00010001659393310546875)) * (((intermediateValue58 * intermediateValue56) * intermediateValue77) * wavePhaseValue3);
                float productValue59 = (-0.0) - (wavePhaseValue3 * exponentialValue);
                productValue34 = intermediateValue82 - ((quotientValue3 * wavePhaseValue) * exponentialValue);
                productValue35 = intermediateValue83 - ((quotientValue3 * wavePhaseValue1) * exponentialValue);
                sumValue12 = intermediateValue81 + intermediateValue80;
                uint sumValue18 = intermediateValue84 + 1u;
                if (sumValue18 < scalarValue59)
                {
                    intermediateValue77 *= intermediateValue61;
                    sumValue13 = ((wavePhaseValue * intermediateValue59) * productValue59) + sumValue13;
                    sumValue14 = ((wavePhaseValue1 * intermediateValue59) * productValue59) + sumValue14;
                    intermediateValue78 *= intermediateValue53;
                    intermediateValue79 += 1.39900004863739013671875;
                    intermediateValue80 -= (intermediateValue80 * intermediateValue60);
                    intermediateValue81 = sumValue12;
                    intermediateValue82 = productValue34;
                    intermediateValue83 = productValue35;
                    intermediateValue84 = sumValue18;
                }
                else
                {
                    break;
                }
            }
            intermediateValue73 = sumValue12;
            intermediateValue74 = productValue34;
            intermediateValue75 = productValue35;
        }
        float quotientValue4 = intermediateValue74 / intermediateValue73;
        float quotientValue5 = intermediateValue75 / intermediateValue73;
        float inverseLengthValue7 = inversesqrt(dot(vec3(quotientValue4, 1.0, quotientValue5), vec3(quotientValue4, 1.0, quotientValue5)));
        float dotProductValue2 = dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(0.0, 1.0, 0.0));
        float productValue60 = (((inverseLengthValue7 * quotientValue4) - varyingNormal0.x) * dotProductValue2) + varyingNormal0.x;
        float productValue61 = (dotProductValue2 * (inverseLengthValue7 - varyingNormal0.y)) + varyingNormal0.y;
        float productValue62 = (((inverseLengthValue7 * quotientValue5) - varyingNormal0.z) * dotProductValue2) + varyingNormal0.z;
        float inverseLengthValue8 = inversesqrt(dot(vec3(productValue60, productValue61, productValue62), vec3(productValue60, productValue61, productValue62)));
        productValue24 = productValue60 * inverseLengthValue8;
        productValue25 = productValue61 * inverseLengthValue8;
        productValue26 = productValue62 * inverseLengthValue8;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue72 = intermediateValue58;
        intermediateValue73 = intermediateValue60;
        intermediateValue74 = intermediateValue62;
        intermediateValue75 = intermediateValue64;
        intermediateValue76 = intermediateValue66;
        intermediateValue77 = intermediateValue68;
        intermediateValue78 = intermediateValue56;
        intermediateValue79 = intermediateValue54;
        intermediateValue80 = intermediateValue52;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue24 = multiplyAddValue;
        productValue25 = intermediateValue3;
        productValue26 = intermediateValue4;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float productValue32;
    float productValue33;
    float productValue34;
    if (fragmentScalarConstants1.packedValues[56u] > 0.0)
    {
        float sumValue56 = varyingTexCoord3.x - fragmentScalarConstants1.packedValues[52u];
        float sumValue57 = varyingTexCoord3.z - fragmentScalarConstants1.packedValues[54u];
        float productValue103 = fragmentScalarConstants1.packedValues[51u] * 0.5;
        uint scalarValue84 = uint(intermediateValue80);
        float intermediateValue126;
        float intermediateValue127;
        float intermediateValue128;
        intermediateValue126 = 0.0;
        intermediateValue127 = 0.0;
        intermediateValue128 = 0.0;
        float sumValue28;
        float multiplyAddValue31;
        float multiplyAddValue32;
        float multiplyAddValue33;
        float productValue46;
        float multiplyAddValue34;
        float multiplyAddValue35;
        float productValue47;
        float sumValue29;
        uint sumValue30;
        float scalarValue85 = 1.0;
        float scalarValue86 = intermediateValue79;
        float scalarValue87 = sumValue57;
        float scalarValue88 = sumValue56;
        float scalarValue89 = intermediateValue78;
        float scalarValue90 = 0.0;
        uint scalarValue91 = 0u;
        for (;;)
        {
            if (scalarValue84 <= scalarValue91)
            {
                break;
            }
            float wavePhaseValue4 = sin(scalarValue90);
            float wavePhaseValue5 = cos(scalarValue90);
            float multiplyAddValue44 = fma(rdDot2Precise(vec2(wavePhaseValue4, wavePhaseValue5), vec2(scalarValue88, scalarValue87)), scalarValue86, productValue103 * scalarValue89);
            float wavePhaseValue6 = sin(multiplyAddValue44);
            float wavePhaseValue7 = cos(multiplyAddValue44);
            float exponentialValue1 = exp2(intermediateValue72 * log2((wavePhaseValue6 + 1.0) * 0.5));
            float quotientValue9 = 1.0 / (wavePhaseValue6 + 1.00010001659393310546875);
            multiplyAddValue32 = fma(-(exponentialValue1 * (wavePhaseValue7 * (intermediateValue72 * (scalarValue86 * (scalarValue85 * (intermediateValue73 * wavePhaseValue4)))))), quotientValue9, intermediateValue128);
            multiplyAddValue31 = fma(-(exponentialValue1 * (wavePhaseValue7 * (intermediateValue72 * (scalarValue86 * (scalarValue85 * (intermediateValue73 * wavePhaseValue5)))))), quotientValue9, intermediateValue127);
            sumValue28 = scalarValue85 + intermediateValue126;
            float productValue104 = -(wavePhaseValue7 * (scalarValue85 * exponentialValue1));
            multiplyAddValue35 = fma(productValue104 * wavePhaseValue4, intermediateValue74, scalarValue88);
            multiplyAddValue34 = fma(productValue104 * wavePhaseValue5, intermediateValue74, scalarValue87);
            multiplyAddValue33 = fma(intermediateValue75, -scalarValue85, scalarValue85);
            productValue46 = intermediateValue76 * scalarValue86;
            productValue47 = intermediateValue77 * scalarValue89;
            sumValue29 = scalarValue90 + 1.39900004863739013671875;
            sumValue30 = scalarValue91 + 1u;
            intermediateValue126 = sumValue28;
            intermediateValue127 = multiplyAddValue31;
            intermediateValue128 = multiplyAddValue32;
            scalarValue85 = multiplyAddValue33;
            scalarValue86 = productValue46;
            scalarValue87 = multiplyAddValue34;
            scalarValue88 = multiplyAddValue35;
            scalarValue89 = productValue47;
            scalarValue90 = sumValue29;
            scalarValue91 = sumValue30;
            continue;
        }
        float quotientValue10 = intermediateValue128 / intermediateValue126;
        float quotientValue11 = intermediateValue127 / intermediateValue126;
        vec3 vectorValue9 = vec3(quotientValue10, 1.0, quotientValue11);
        float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
        float multiplyAddValue45 = fma(varyingNormal0.y, fma(quotientValue10, inverseLengthValue17, -varyingNormal0.x), varyingNormal0.x);
        float multiplyAddValue46 = fma(varyingNormal0.y, inverseLengthValue17 - varyingNormal0.y, varyingNormal0.y);
        float multiplyAddValue47 = fma(varyingNormal0.y, fma(quotientValue11, inverseLengthValue17, -varyingNormal0.z), varyingNormal0.z);
        vec3 vectorValue10 = vec3(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47);
        float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
        productValue32 = inverseLengthValue18 * multiplyAddValue47;
        productValue33 = inverseLengthValue18 * multiplyAddValue46;
        productValue34 = inverseLengthValue18 * multiplyAddValue45;
    }
    else
    {
        productValue32 = multiplyAddValue2;
        productValue33 = multiplyAddValue1;
        productValue34 = multiplyAddValue;
    }
    vec4 sampledTextureValue57 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue39 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
#endif
    float sumValue19 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    float sumValue20 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    float sumValue21 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor1.w = (intermediateValue37 < intermediateValue38) ? fma(intermediateValue38, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue37, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue11 = vec3(productValue34, productValue33, productValue32);
    float inverseLengthValue19 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    float productValue105 = inverseLengthValue19 * productValue34;
    float productValue106 = inverseLengthValue19 * productValue33;
    float productValue107 = inverseLengthValue19 * productValue32;
    float quotientValue12 = 1.0 / (abs(productValue107) + (abs(productValue106) + abs(productValue105)));
    float productValue108 = quotientValue12 * productValue105;
    float productValue109 = quotientValue12 * productValue106;
    bool conditionValue15 = productValue107 < 0.0;
    fragmentColor2.x = conditionValue15 ? ((1.0 - abs(productValue109)) * ((productValue108 >= 0.0) ? 1.0 : (-1.0))) : productValue108;
    fragmentColor2.y = conditionValue15 ? ((1.0 - abs(productValue108)) * ((productValue109 >= 0.0) ? 1.0 : (-1.0))) : productValue109;
    float multiplyAddValue48 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[31u], sumValue21, fma(fragmentScalarConstants1.packedValues[23u], sumValue19, sumValue20 * fragmentScalarConstants1.packedValues[27u])) + fragmentScalarConstants1.packedValues[35u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue48, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[7u].x, sumValue21, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue19, sumValue20 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[8u].x) / multiplyAddValue49, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue48, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[7u].y, sumValue21, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue19, sumValue20 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[8u].y) / multiplyAddValue49, 0.5, 0.5);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05);
    float productValue68 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue56 = (bitwiseValue ? spvNMin(productValue68, 1.0) : varyingTexCoord5.x) * 0.16666667163372039794921875;
    float multiplyAddValue50 = (bitwiseValue ? spvNMin(fma(fma(productValue68, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue68, 1.0) : varyingTexCoord5.y) * 0.16666667163372039794921875;
    float multiplyAddValue51 = (bitwiseValue ? spvNMin(fma(productValue68 * productValue68, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue68, 1.0) : varyingTexCoord5.z) * 0.16666667163372039794921875;
    float productValue110 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue50, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue51, comparisonValue56)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue50 / productValue110, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue56 / productValue110, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue51 / productValue110, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue110, 0.0, 1.0) * 255.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float inverseLengthValue9 = inversesqrt(dot(vec3(productValue24, productValue25, productValue26), vec3(productValue24, productValue25, productValue26)));
    float productValue63 = inverseLengthValue9 * productValue24;
    float productValue64 = inverseLengthValue9 * productValue25;
    float productValue65 = inverseLengthValue9 * productValue26;
    float quotientValue6 = 1.0 / ((abs(productValue64) + abs(productValue63)) + abs(productValue65));
    float productValue66 = quotientValue6 * productValue63;
    float productValue67 = quotientValue6 * productValue64;
    bool conditionValue5 = productValue65 < 0.0;
    float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[7u].w, sumValue21, fma(fragmentVectorConstants1.packedValues[6u].w, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[8u].w;
    float intermediateValue76;
    float productValue40;
    float productValue41;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue68 = varyingTexCoord1.x * varyingTexCoord1.x;
        intermediateValue76 = spvNClamp(productValue68, 0.0, 1.0);
        productValue40 = spvNClamp(((productValue68 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue68, 0.0, 1.0);
        productValue41 = spvNClamp((((productValue68 * productValue68) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue68, 0.0, 1.0);
    }
    else
    {
        intermediateValue76 = varyingTexCoord5.x;
        productValue40 = varyingTexCoord5.y;
        productValue41 = varyingTexCoord5.z;
    }
    float productValue69 = intermediateValue76 * 0.16666667163372039794921875;
    float productValue70 = productValue40 * 0.16666667163372039794921875;
    float productValue71 = productValue41 * 0.16666667163372039794921875;
    float productValue72 = ceil(spvNClamp(spvNMax(spvNMax(productValue69, productValue71), spvNMax(productValue70, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue69 / productValue72, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue70 / productValue72, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue71 / productValue72, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue72, 0.0, 1.0) * 255.0) & 255u);
#endif
    fragmentColor0.w = uint(spvNClamp(varyingTexCoord1.y, 0.0, 1.0) * 255.0);
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = uint(spvNClamp(intermediateValue42, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue40, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor1.x = sampledTextureValue57.x;
    fragmentColor1.y = sampledTextureValue57.y;
    fragmentColor1.z = sampledTextureValue57.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor1.x = sampledTextureValue39.x;
    fragmentColor1.y = sampledTextureValue39.y;
    fragmentColor1.z = sampledTextureValue39.z;
    fragmentColor1.w = (intermediateValue9 > intermediateValue5) ? ((intermediateValue9 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue5 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue5 ? (((productValue66 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue67))) : productValue66;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue66)) * ((productValue67 < 0.0) ? (-1.0) : 1.0)) : productValue67;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue11) - ((fma(fragmentVectorConstants1.packedValues[7u].x, sumValue21, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[8u].x) / multiplyAddValue12)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue11) - ((fma(fragmentVectorConstants1.packedValues[7u].y, sumValue21, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[8u].y) / multiplyAddValue12)) * 0.5;
#endif
}
