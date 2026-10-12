// SingleBlockForwardPBR / DepthOnlyOpaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
#endif

#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT2_PRECISE_FLOAT_3 1
#endif
#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE_FLOAT_5 1
#endif

#include "../../include/materials/SingleBlockForwardPBR/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.hlsli"
#endif
void executeVertexStage()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x;
    precise float productValue1 = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y;
    precise float productValue2 = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z;
    precise float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, productValue)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    precise float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, productValue1)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    precise float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, productValue2)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    precise float productValue3 = multiplyAddValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x;
    precise float productValue4 = multiplyAddValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y;
    precise float productValue5 = multiplyAddValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z;
    precise float productValue6 = multiplyAddValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue, productValue3)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    precise float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue, productValue4)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    precise float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue, productValue5)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    precise float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue, productValue6)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    clipSpacePosition.x = multiplyAddValue3;
    clipSpacePosition.y = multiplyAddValue4;
    clipSpacePosition.z = multiplyAddValue5;
    clipSpacePosition.w = multiplyAddValue6;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x;
    precise float productValue1 = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y;
    precise float productValue2 = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z;
    precise float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, productValue)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    precise float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, productValue1)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    precise float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, productValue2)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    precise float sumValue = multiplyAddValue + 0.5f;
    precise float sumValue1 = multiplyAddValue1 + 0.5f;
    precise float sumValue2 = multiplyAddValue2 + 0.5f;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float sumValue3 = sumValue2 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    precise float sumValue4 = sumValue - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    precise float sumValue5 = sumValue1 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue = float3(sumValue3, sumValue4, sumValue5);
    float inverseLengthValue = rsqrt(rdDot3Precise(vectorValue, vectorValue));
    precise float productValue7 = inverseLengthValue * sumValue3;
    precise float productValue8 = inverseLengthValue * sumValue4;
    precise float productValue9 = inverseLengthValue * sumValue5;
    precise float productValue10 = productValue9 * 0.0f;
    precise float productValue11 = productValue7 * 0.0f;
    precise float productValue12 = productValue8 * 1.0f;
    float multiplyAddValue13 = mad(productValue7, 1.0f, -productValue10);
    float multiplyAddValue14 = mad(productValue9, 0.0f, -productValue12);
    float2 vectorValue1 = float2(multiplyAddValue13, multiplyAddValue14);
    float inverseLengthValue1 = rsqrt(rdDot2Precise(vectorValue1, vectorValue1));
    precise float productValue13 = inverseLengthValue1 * multiplyAddValue13;
    precise float multiplyAddValue15 = inverseLengthValue1 * mad(productValue8, 0.0f, -productValue11);
    precise float productValue14 = inverseLengthValue1 * multiplyAddValue14;
    precise float productValue15 = productValue7 * multiplyAddValue15;
    precise float productValue16 = productValue8 * productValue14;
    precise float productValue17 = productValue9 * productValue13;
    precise float sumValue6 = vertexColor0.z - 0.5f;
    precise float sumValue7 = vertexColor0.x - 0.5f;
    precise float productValue18 = productValue13 * sumValue7;
    precise float productValue19 = multiplyAddValue15 * sumValue7;
    precise float productValue20 = productValue14 * sumValue7;
    precise float multiplyAddValue16 = sumValue - mad(mad(productValue9, productValue14, -productValue15), sumValue6, productValue18);
    precise float multiplyAddValue17 = sumValue1 - mad(mad(productValue7, productValue13, -productValue16), sumValue6, productValue19);
    precise float multiplyAddValue18 = sumValue2 - mad(mad(productValue8, multiplyAddValue15, -productValue17), sumValue6, productValue20);
    precise float productValue21 = multiplyAddValue17 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x;
    precise float productValue22 = multiplyAddValue17 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y;
    precise float productValue23 = multiplyAddValue17 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z;
    precise float productValue24 = multiplyAddValue17 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w;
    precise float multiplyAddValue19 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue18, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue16, productValue21)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    precise float multiplyAddValue20 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue18, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue16, productValue22)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    precise float multiplyAddValue21 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue18, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue16, productValue23)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    precise float multiplyAddValue22 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue18, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue16, productValue24)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    clipSpacePosition.x = multiplyAddValue19;
    clipSpacePosition.y = multiplyAddValue20;
    clipSpacePosition.z = multiplyAddValue21;
    clipSpacePosition.w = multiplyAddValue22;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    float4 vectorValue4 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue1 = rdDot4Precise(vectorValue4, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue38 = scalarValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x;
    precise float productValue39 = scalarValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y;
    precise float productValue40 = scalarValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z;
    precise float productValue41 = scalarValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w;
    float scalarValue2 = rdDot4Precise(vectorValue4, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    precise float multiplyAddValue26 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, scalarValue3, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, scalarValue2, productValue38)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    precise float multiplyAddValue27 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, scalarValue3, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, scalarValue2, productValue39)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    precise float multiplyAddValue28 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, scalarValue3, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, scalarValue2, productValue40)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    precise float multiplyAddValue29 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, scalarValue3, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, scalarValue2, productValue41)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    clipSpacePosition.x = multiplyAddValue26;
    clipSpacePosition.y = multiplyAddValue27;
    clipSpacePosition.z = multiplyAddValue28;
    clipSpacePosition.w = multiplyAddValue29;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    float4 vectorValue4 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue2 = rdDot4Precise(vectorValue4, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue1 = rdDot4Precise(vectorValue4, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue25 = scalarValue2 + 0.5f;
    precise float sumValue26 = scalarValue1 + 0.5f;
    precise float sumValue27 = scalarValue3 + 0.5f;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    precise float sumValue28 = sumValue27 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    precise float sumValue29 = sumValue25 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    precise float sumValue30 = sumValue26 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue5 = float3(sumValue28, sumValue29, sumValue30);
    float inverseLengthValue6 = rsqrt(rdDot3Precise(vectorValue5, vectorValue5));
    precise float productValue42 = inverseLengthValue6 * sumValue28;
    precise float productValue43 = inverseLengthValue6 * sumValue29;
    precise float productValue44 = inverseLengthValue6 * sumValue30;
    precise float productValue45 = productValue44 * 0.0f;
    precise float productValue46 = productValue42 * 0.0f;
    precise float productValue47 = productValue43 * 1.0f;
    float multiplyAddValue33 = mad(productValue42, 1.0f, -productValue45);
    float multiplyAddValue34 = mad(productValue44, 0.0f, -productValue47);
    float2 vectorValue6 = float2(multiplyAddValue33, multiplyAddValue34);
    float inverseLengthValue7 = rsqrt(rdDot2Precise(vectorValue6, vectorValue6));
    precise float productValue48 = inverseLengthValue7 * multiplyAddValue33;
    precise float multiplyAddValue35 = inverseLengthValue7 * mad(productValue43, 0.0f, -productValue46);
    precise float productValue49 = inverseLengthValue7 * multiplyAddValue34;
    precise float productValue50 = productValue42 * multiplyAddValue35;
    precise float productValue51 = productValue43 * productValue49;
    precise float productValue52 = productValue44 * productValue48;
    precise float sumValue6 = vertexColor0.z - 0.5f;
    precise float sumValue7 = vertexColor0.x - 0.5f;
    precise float productValue53 = productValue48 * sumValue7;
    precise float productValue54 = multiplyAddValue35 * sumValue7;
    precise float productValue55 = productValue49 * sumValue7;
    precise float multiplyAddValue36 = sumValue25 - mad(mad(productValue44, productValue49, -productValue50), sumValue6, productValue53);
    precise float multiplyAddValue37 = sumValue26 - mad(mad(productValue42, productValue48, -productValue51), sumValue6, productValue54);
    precise float multiplyAddValue38 = sumValue27 - mad(mad(productValue43, multiplyAddValue35, -productValue52), sumValue6, productValue55);
    precise float productValue56 = multiplyAddValue37 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x;
    precise float productValue57 = multiplyAddValue37 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y;
    precise float productValue58 = multiplyAddValue37 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z;
    precise float productValue59 = multiplyAddValue37 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w;
    precise float multiplyAddValue39 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue38, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue36, productValue56)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    precise float multiplyAddValue40 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue38, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue36, productValue57)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    precise float multiplyAddValue41 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue38, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue36, productValue58)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    precise float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue38, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue36, productValue59)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    clipSpacePosition.x = multiplyAddValue39;
    clipSpacePosition.y = multiplyAddValue40;
    clipSpacePosition.z = multiplyAddValue41;
    clipSpacePosition.w = multiplyAddValue42;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue8 = multiplyAddValue7 + 0.5f;
    float sumValue9 = multiplyAddValue8 + 0.5f;
    float sumValue10 = multiplyAddValue9 + 0.5f;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    float sumValue11 = sumValue10 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float sumValue12 = sumValue8 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue13 = sumValue9 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue2 = float3(sumValue11, sumValue12, sumValue13);
    float inverseLengthValue2 = rsqrt(rdDot3Precise(vectorValue2, vectorValue2));
    float productValue25 = inverseLengthValue2 * sumValue11;
    float productValue26 = inverseLengthValue2 * sumValue12;
    float productValue27 = inverseLengthValue2 * sumValue13;
    float scalarValue = -productValue26;
    float2 vectorValue3 = float2(productValue25, scalarValue);
    float inverseLengthValue3 = rsqrt(rdDot2Precise(vectorValue3, vectorValue3));
    float productValue28 = inverseLengthValue3 * productValue25;
    float productValue29 = inverseLengthValue3 * scalarValue;
    float sumValue14 = vertexColor0.z - 0.5f;
    float sumValue15 = vertexColor0.x - 0.5f;
    float multiplyAddValue23 = sumValue8 - mad(productValue27 * productValue29, sumValue14, productValue28 * sumValue15);
    float multiplyAddValue24 = sumValue9 - (mad(productValue25, productValue28, -(productValue26 * productValue29)) * sumValue14);
    float multiplyAddValue25 = sumValue10 - mad(-(productValue27 * productValue28), sumValue14, productValue29 * sumValue15);
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue25, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue23, multiplyAddValue24 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue25, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue23, multiplyAddValue24 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue25, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue23, multiplyAddValue24 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue25, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue23, multiplyAddValue24 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue4 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue1 = rdDot4Precise(vectorValue4, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue2 = rdDot4Precise(vectorValue4, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, scalarValue3, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, scalarValue2, scalarValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, scalarValue3, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, scalarValue2, scalarValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, scalarValue3, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, scalarValue2, scalarValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, scalarValue3, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, scalarValue2, scalarValue1 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue4 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue2 = rdDot4Precise(vectorValue4, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue1 = rdDot4Precise(vectorValue4, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float sumValue31 = scalarValue2 + 0.5f;
    float sumValue32 = scalarValue1 + 0.5f;
    float sumValue33 = scalarValue3 + 0.5f;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float sumValue34 = sumValue33 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float sumValue35 = sumValue31 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue36 = sumValue32 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue7 = float3(sumValue34, sumValue35, sumValue36);
    float inverseLengthValue8 = rsqrt(rdDot3Precise(vectorValue7, vectorValue7));
    float productValue60 = inverseLengthValue8 * sumValue34;
    float productValue61 = inverseLengthValue8 * sumValue35;
    float productValue62 = inverseLengthValue8 * sumValue36;
    float scalarValue4 = -productValue61;
    float2 vectorValue8 = float2(productValue60, scalarValue4);
    float inverseLengthValue9 = rsqrt(rdDot2Precise(vectorValue8, vectorValue8));
    float productValue63 = inverseLengthValue9 * productValue60;
    float productValue64 = inverseLengthValue9 * scalarValue4;
    float sumValue14 = vertexColor0.z - 0.5f;
    float sumValue15 = vertexColor0.x - 0.5f;
    float multiplyAddValue43 = sumValue31 - mad(productValue62 * productValue64, sumValue14, productValue63 * sumValue15);
    float multiplyAddValue44 = sumValue32 - (mad(productValue60, productValue63, -(productValue61 * productValue64)) * sumValue14);
    float multiplyAddValue45 = sumValue33 - mad(-(productValue62 * productValue63), sumValue14, productValue64 * sumValue15);
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue45, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue43, multiplyAddValue44 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue45, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue43, multiplyAddValue44 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue45, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue43, multiplyAddValue44 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue45, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue43, multiplyAddValue44 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue10 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue11 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue12 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue12, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue12, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue12, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue12, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue10 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue11 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue12 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue16 = multiplyAddValue10 + 0.5f;
    float sumValue17 = multiplyAddValue11 + 0.5f;
    float sumValue18 = multiplyAddValue12 + 0.5f;
    float sumValue19 = sumValue16 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue20 = sumValue17 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue21 = sumValue18 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue4 = rsqrt(dot(float3(sumValue19, sumValue20, sumValue21), float3(sumValue19, sumValue20, sumValue21)));
    float productValue30 = sumValue19 * inverseLengthValue4;
    float productValue31 = sumValue21 * inverseLengthValue4;
    float sumValue22 = (-0.0f) - productValue30;
    float inverseLengthValue5 = rsqrt(dot(float3(productValue31, 0.0f, sumValue22), float3(productValue31, 0.0f, sumValue22)));
    float productValue32 = inverseLengthValue5 * productValue31;
    float productValue33 = inverseLengthValue5 * sumValue22;
    float sumValue23 = vertexColor0.z + (-0.5f);
    float productValue34 = (inverseLengthValue4 * sumValue23) * sumValue20;
    float sumValue24 = vertexColor0.x + (-0.5f);
    float productValue35 = (sumValue16 - (productValue32 * sumValue24)) - (productValue33 * productValue34);
    float productValue36 = sumValue17 - (((productValue32 * productValue31) - (productValue33 * productValue30)) * sumValue23);
    float productValue37 = sumValue18 - ((productValue33 * sumValue24) - (productValue32 * productValue34));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, productValue37, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue36, productValue35 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, productValue37, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue36, productValue35 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, productValue37, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue36, productValue35 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, productValue37, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue36, productValue35 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue30 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue31 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue32 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue32, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue32, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue32, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue32, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue30 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue31 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue32 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue37 = multiplyAddValue30 + 0.5f;
    float sumValue38 = multiplyAddValue31 + 0.5f;
    float sumValue39 = multiplyAddValue32 + 0.5f;
    float sumValue40 = sumValue37 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue41 = sumValue38 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue42 = sumValue39 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue10 = rsqrt(dot(float3(sumValue40, sumValue41, sumValue42), float3(sumValue40, sumValue41, sumValue42)));
    float productValue65 = sumValue40 * inverseLengthValue10;
    float productValue66 = sumValue42 * inverseLengthValue10;
    float sumValue43 = (-0.0f) - productValue65;
    float inverseLengthValue11 = rsqrt(dot(float3(productValue66, 0.0f, sumValue43), float3(productValue66, 0.0f, sumValue43)));
    float productValue67 = inverseLengthValue11 * productValue66;
    float productValue68 = inverseLengthValue11 * sumValue43;
    float sumValue23 = vertexColor0.z + (-0.5f);
    float productValue69 = (inverseLengthValue10 * sumValue23) * sumValue41;
    float sumValue24 = vertexColor0.x + (-0.5f);
    float productValue70 = (sumValue37 - (productValue67 * sumValue24)) - (productValue68 * productValue69);
    float productValue71 = sumValue38 - (((productValue67 * productValue66) - (productValue68 * productValue65)) * sumValue23);
    float productValue72 = sumValue39 - ((productValue68 * sumValue24) - (productValue67 * productValue69));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, productValue72, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue71, productValue70 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, productValue72, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue71, productValue70 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, productValue72, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue71, productValue70 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, productValue72, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue71, productValue70 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#endif
    varyingBitangent0.x = 0.0f;
    varyingBitangent0.y = 0.0f;
    varyingBitangent0.z = 0.0f;
#if RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#endif
    varyingTexCoord2.x = 0.0f;
    varyingTexCoord2.y = 0.0f;
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingNormal0.x = 0.0f;
    varyingNormal0.y = 0.0f;
    varyingNormal0.z = 0.0f;
    varyingTangent0.x = 0.0f;
    varyingTangent0.y = 0.0f;
    varyingTangent0.z = 0.0f;
    varyingTexCoord0.x = -3.0517578125e-05f;
    varyingTexCoord0.y = -3.0517578125e-05f;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue10;
    varyingTexCoord3.y = multiplyAddValue11;
    varyingTexCoord3.z = multiplyAddValue12;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue30;
    varyingTexCoord3.y = multiplyAddValue31;
    varyingTexCoord3.z = multiplyAddValue32;
#endif
}
VertexStageOutput main(VertexStageInput stage_input)
{
#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vertexColor0 = stage_input.vertexColor0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
#endif
    vertexPosition0 = stage_input.vertexPosition0;
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
#endif
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
}
