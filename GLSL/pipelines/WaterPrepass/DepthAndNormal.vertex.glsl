#version 460
#extension GL_GOOGLE_include_directive : require
// WaterPrepass / DepthAndNormal / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/WaterPrepass/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[7u].z;
    precise float productValue3 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue4 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue5 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue6 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].w;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue, productValue3)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue, productValue4)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue, productValue5)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue, productValue6)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue3;
    gl_Position.y = multiplyAddValue4;
    gl_Position.z = multiplyAddValue5;
    gl_Position.w = multiplyAddValue6;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue24 = scalarValue2 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue25 = scalarValue2 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue26 = scalarValue2 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue27 = scalarValue2 * vertexVectorConstants0.packedValues[1u].w;
    float scalarValue3 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue4 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue3;
    varyingTexCoord3.y = scalarValue2;
    varyingTexCoord3.z = scalarValue4;
    precise float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue4, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue3, productValue24)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue4, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue3, productValue25)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue4, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue3, productValue26)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue4, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue3, productValue27)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue23;
    gl_Position.y = multiplyAddValue24;
    gl_Position.z = multiplyAddValue25;
    gl_Position.w = multiplyAddValue26;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue4 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue3;
    varyingTexCoord3.y = scalarValue2;
    varyingTexCoord3.z = scalarValue4;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue4, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue4, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue4, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue4, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].x * vertexNormal0.x));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].y * vertexNormal0.x));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].z * vertexNormal0.x));
    float inverseLengthValue2 = inversesqrt(dot(vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22), vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22)));
    uint productValue21 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue22 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue7 = productValue21 >> 8u;
    uint bitwiseValue8 = productValue22 >> 8u;
    float productValue23 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue27 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue28 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue29 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].x * vertexNormal0.x));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].y * vertexNormal0.x));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].z * vertexNormal0.x));
    float inverseLengthValue2 = inversesqrt(dot(vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22), vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22)));
    uint productValue21 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue22 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue7 = productValue21 >> 8u;
    uint bitwiseValue8 = productValue22 >> 8u;
    float productValue23 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#endif
    varyingBitangent0.x = 0.0;
    varyingBitangent0.y = 0.0;
    varyingBitangent0.z = 0.0;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue7 = vertexTexCoord1.x * 65535.0;
    precise float productValue8 = vertexTexCoord1.y * 65535.0;
    uint scalarValue = uint(roundEven(productValue7));
    uint scalarValue1 = uint(roundEven(productValue8));
    precise float bitwiseValue = rdEvaluateFloatExpression((scalarValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    precise float bitwiseValue1 = rdEvaluateFloatExpression(scalarValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.x = bitwiseValue;
    varyingTexCoord1.y = bitwiseValue1;
    uint bitwiseValue2 = scalarValue >> 8u;
    uint bitwiseValue3 = scalarValue1 >> 8u;
    varyingTexCoord2.x = float((bitwiseValue2 & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue3 & 1u) != 0u);
    precise float bitwiseValue4 = rdEvaluateFloatExpression(bitwiseValue2 & 254u) * 0.0039215688593685626983642578125;
    precise float bitwiseValue5 = rdEvaluateFloatExpression(scalarValue & 255u) * 0.0039215688593685626983642578125;
    precise float bitwiseValue6 = rdEvaluateFloatExpression(bitwiseValue3 & 254u) * 0.0039215688593685626983642578125;
    float multiplyAddValue7 = fma(vertexNormal0.w, 0.5, 0.5);
    precise float productValue9 = multiplyAddValue7 * bitwiseValue4;
    precise float productValue10 = multiplyAddValue7 * bitwiseValue5;
    precise float productValue11 = multiplyAddValue7 * bitwiseValue6;
    precise float productValue12 = productValue9 * 6.0;
    precise float productValue13 = productValue10 * 6.0;
    precise float productValue14 = productValue11 * 6.0;
    varyingTexCoord5.x = productValue12;
    varyingTexCoord5.y = productValue13;
    varyingTexCoord5.z = productValue14;
    precise float productValue15 = vertexNormal0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue16 = vertexNormal0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue17 = vertexNormal0.y * vertexVectorConstants0.packedValues[5u].z;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexNormal0.x, productValue15));
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexNormal0.x, productValue16));
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexNormal0.x, productValue17));
    vec3 vectorValue = vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue18 = inverseLengthValue * multiplyAddValue8;
    precise float productValue19 = inverseLengthValue * multiplyAddValue9;
    precise float productValue20 = inverseLengthValue * multiplyAddValue10;
    varyingNormal0.x = productValue18;
    varyingNormal0.y = productValue19;
    varyingNormal0.z = productValue20;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue21 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue22 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue22 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue22 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = float(bitfieldExtract(productValue21, int(8u), int(1u)) != 0u);
    varyingTexCoord2.y = float(bitfieldExtract(productValue22, int(8u), int(1u)) != 0u);
    float multiplyAddValue7 = fma(vertexNormal0.w, 0.5, 0.5);
    varyingTexCoord5.x = (multiplyAddValue7 * (rdEvaluateFloatExpression((productValue21 >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.y = (multiplyAddValue7 * (rdEvaluateFloatExpression(productValue21 & 255u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.z = (multiplyAddValue7 * (rdEvaluateFloatExpression((productValue22 >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].x));
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].y));
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].z));
    vec3 vectorValue1 = vec3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    varyingNormal0.x = inverseLengthValue1 * multiplyAddValue14;
    varyingNormal0.y = inverseLengthValue1 * multiplyAddValue15;
    varyingNormal0.z = inverseLengthValue1 * multiplyAddValue16;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord2.x = float((bitwiseValue7 & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue8 & 1u) != 0u);
    varyingTexCoord5.x = float(bitwiseValue7 & 254u) * productValue23;
    varyingTexCoord5.y = float(productValue21 & 255u) * productValue23;
    varyingTexCoord5.z = float(bitwiseValue8 & 254u) * productValue23;
    varyingTexCoord1.x = float((productValue22 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue22 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = inverseLengthValue2 * multiplyAddValue20;
    varyingNormal0.y = inverseLengthValue2 * multiplyAddValue21;
    varyingNormal0.z = inverseLengthValue2 * multiplyAddValue22;
#endif
    varyingTangent0.x = 0.0;
    varyingTangent0.y = 0.0;
    varyingTangent0.z = 0.0;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue17;
    varyingTexCoord3.y = multiplyAddValue18;
    varyingTexCoord3.z = multiplyAddValue19;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue27;
    varyingTexCoord3.y = multiplyAddValue28;
    varyingTexCoord3.z = multiplyAddValue29;
#endif
}
