// RenderChunkForwardPBR / DepthOnlyOpaque / vertex forward pipeline.
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

#include "../../include/materials/RenderChunkForwardPBR/VertexBindings.hlsli"

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
    precise float sumValue17 = multiplyAddValue + 0.5f;
    precise float sumValue18 = multiplyAddValue1 + 0.5f;
    precise float sumValue19 = multiplyAddValue2 + 0.5f;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float sumValue20 = sumValue19 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    precise float sumValue21 = sumValue17 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    precise float sumValue22 = sumValue18 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue2 = float3(sumValue20, sumValue21, sumValue22);
    float inverseLengthValue4 = rsqrt(rdDot3Precise(vectorValue2, vectorValue2));
    precise float productValue20 = inverseLengthValue4 * sumValue20;
    precise float productValue21 = inverseLengthValue4 * sumValue21;
    precise float productValue22 = inverseLengthValue4 * sumValue22;
    precise float productValue23 = productValue22 * 0.0f;
    precise float productValue24 = productValue20 * 0.0f;
    precise float productValue25 = productValue21 * 1.0f;
    float multiplyAddValue16 = mad(productValue20, 1.0f, -productValue23);
    float multiplyAddValue17 = mad(productValue22, 0.0f, -productValue25);
    float2 vectorValue3 = float2(multiplyAddValue16, multiplyAddValue17);
    float inverseLengthValue5 = rsqrt(rdDot2Precise(vectorValue3, vectorValue3));
    precise float productValue26 = inverseLengthValue5 * multiplyAddValue16;
    precise float multiplyAddValue18 = inverseLengthValue5 * mad(productValue21, 0.0f, -productValue24);
    precise float productValue27 = inverseLengthValue5 * multiplyAddValue17;
    precise float productValue28 = productValue20 * multiplyAddValue18;
    precise float productValue29 = productValue21 * productValue27;
    precise float productValue30 = productValue22 * productValue26;
    precise float sumValue23 = vertexColor0.z - 0.5f;
    precise float sumValue24 = vertexColor0.x - 0.5f;
    precise float productValue31 = productValue26 * sumValue24;
    precise float productValue32 = multiplyAddValue18 * sumValue24;
    precise float productValue33 = productValue27 * sumValue24;
    precise float multiplyAddValue19 = sumValue17 - mad(mad(productValue22, productValue27, -productValue28), sumValue23, productValue31);
    precise float multiplyAddValue20 = sumValue18 - mad(mad(productValue20, productValue26, -productValue29), sumValue23, productValue32);
    precise float multiplyAddValue21 = sumValue19 - mad(mad(productValue21, multiplyAddValue18, -productValue30), sumValue23, productValue33);
    precise float productValue34 = multiplyAddValue20 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x;
    precise float productValue35 = multiplyAddValue20 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y;
    precise float productValue36 = multiplyAddValue20 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z;
    precise float productValue37 = multiplyAddValue20 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w;
    precise float multiplyAddValue22 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue21, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue19, productValue34)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    precise float multiplyAddValue23 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue21, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue19, productValue35)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    precise float multiplyAddValue24 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue21, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue19, productValue36)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    precise float multiplyAddValue25 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue21, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue19, productValue37)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    clipSpacePosition.x = multiplyAddValue22;
    clipSpacePosition.y = multiplyAddValue23;
    clipSpacePosition.z = multiplyAddValue24;
    clipSpacePosition.w = multiplyAddValue25;
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
    precise float sumValue32 = scalarValue2 + 0.5f;
    precise float sumValue33 = scalarValue1 + 0.5f;
    precise float sumValue34 = scalarValue3 + 0.5f;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    precise float sumValue35 = sumValue34 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    precise float sumValue36 = sumValue32 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    precise float sumValue37 = sumValue33 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue5 = float3(sumValue35, sumValue36, sumValue37);
    float inverseLengthValue8 = rsqrt(rdDot3Precise(vectorValue5, vectorValue5));
    precise float productValue50 = inverseLengthValue8 * sumValue35;
    precise float productValue51 = inverseLengthValue8 * sumValue36;
    precise float productValue52 = inverseLengthValue8 * sumValue37;
    precise float productValue53 = productValue52 * 0.0f;
    precise float productValue54 = productValue50 * 0.0f;
    precise float productValue55 = productValue51 * 1.0f;
    float multiplyAddValue33 = mad(productValue50, 1.0f, -productValue53);
    float multiplyAddValue34 = mad(productValue52, 0.0f, -productValue55);
    float2 vectorValue6 = float2(multiplyAddValue33, multiplyAddValue34);
    float inverseLengthValue9 = rsqrt(rdDot2Precise(vectorValue6, vectorValue6));
    precise float productValue56 = inverseLengthValue9 * multiplyAddValue33;
    precise float multiplyAddValue35 = inverseLengthValue9 * mad(productValue51, 0.0f, -productValue54);
    precise float productValue57 = inverseLengthValue9 * multiplyAddValue34;
    precise float productValue58 = productValue50 * multiplyAddValue35;
    precise float productValue59 = productValue51 * productValue57;
    precise float productValue60 = productValue52 * productValue56;
    precise float sumValue23 = vertexColor0.z - 0.5f;
    precise float sumValue24 = vertexColor0.x - 0.5f;
    precise float productValue61 = productValue56 * sumValue24;
    precise float productValue62 = multiplyAddValue35 * sumValue24;
    precise float productValue63 = productValue57 * sumValue24;
    precise float multiplyAddValue36 = sumValue32 - mad(mad(productValue52, productValue57, -productValue58), sumValue23, productValue61);
    precise float multiplyAddValue37 = sumValue33 - mad(mad(productValue50, productValue56, -productValue59), sumValue23, productValue62);
    precise float multiplyAddValue38 = sumValue34 - mad(mad(productValue51, multiplyAddValue35, -productValue60), sumValue23, productValue63);
    precise float productValue64 = multiplyAddValue37 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x;
    precise float productValue65 = multiplyAddValue37 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y;
    precise float productValue66 = multiplyAddValue37 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z;
    precise float productValue67 = multiplyAddValue37 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w;
    precise float multiplyAddValue39 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue38, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue36, productValue64)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    precise float multiplyAddValue40 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue38, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue36, productValue65)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    precise float multiplyAddValue41 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue38, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue36, productValue66)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    precise float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue38, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue36, productValue67)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
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
    float sumValue9 = multiplyAddValue7 + 0.5f;
    float sumValue10 = multiplyAddValue8 + 0.5f;
    float sumValue11 = multiplyAddValue9 + 0.5f;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    float sumValue12 = sumValue11 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float sumValue13 = sumValue9 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue14 = sumValue10 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue = float3(sumValue12, sumValue13, sumValue14);
    float inverseLengthValue2 = rsqrt(rdDot3Precise(vectorValue, vectorValue));
    float productValue15 = inverseLengthValue2 * sumValue12;
    float productValue16 = inverseLengthValue2 * sumValue13;
    float productValue17 = inverseLengthValue2 * sumValue14;
    float scalarValue = -productValue16;
    float2 vectorValue1 = float2(productValue15, scalarValue);
    float inverseLengthValue3 = rsqrt(rdDot2Precise(vectorValue1, vectorValue1));
    float productValue18 = inverseLengthValue3 * productValue15;
    float productValue19 = inverseLengthValue3 * scalarValue;
    float sumValue15 = vertexColor0.z - 0.5f;
    float sumValue16 = vertexColor0.x - 0.5f;
    float multiplyAddValue13 = sumValue9 - mad(productValue17 * productValue19, sumValue15, productValue18 * sumValue16);
    float multiplyAddValue14 = sumValue10 - (mad(productValue15, productValue18, -(productValue16 * productValue19)) * sumValue15);
    float multiplyAddValue15 = sumValue11 - mad(-(productValue17 * productValue18), sumValue15, productValue19 * sumValue16);
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue15, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue13, multiplyAddValue14 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue15, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue13, multiplyAddValue14 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue15, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue13, multiplyAddValue14 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue15, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue13, multiplyAddValue14 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
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
    float sumValue38 = scalarValue2 + 0.5f;
    float sumValue39 = scalarValue1 + 0.5f;
    float sumValue40 = scalarValue3 + 0.5f;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float sumValue41 = sumValue40 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float sumValue42 = sumValue38 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue43 = sumValue39 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue7 = float3(sumValue41, sumValue42, sumValue43);
    float inverseLengthValue10 = rsqrt(rdDot3Precise(vectorValue7, vectorValue7));
    float productValue68 = inverseLengthValue10 * sumValue41;
    float productValue69 = inverseLengthValue10 * sumValue42;
    float productValue70 = inverseLengthValue10 * sumValue43;
    float scalarValue4 = -productValue69;
    float2 vectorValue8 = float2(productValue68, scalarValue4);
    float inverseLengthValue11 = rsqrt(rdDot2Precise(vectorValue8, vectorValue8));
    float productValue71 = inverseLengthValue11 * productValue68;
    float productValue72 = inverseLengthValue11 * scalarValue4;
    float sumValue15 = vertexColor0.z - 0.5f;
    float sumValue16 = vertexColor0.x - 0.5f;
    float multiplyAddValue43 = sumValue38 - mad(productValue70 * productValue72, sumValue15, productValue71 * sumValue16);
    float multiplyAddValue44 = sumValue39 - (mad(productValue68, productValue71, -(productValue69 * productValue72)) * sumValue15);
    float multiplyAddValue45 = sumValue40 - mad(-(productValue70 * productValue71), sumValue15, productValue72 * sumValue16);
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
    float sumValue = multiplyAddValue10 + 0.5f;
    float sumValue1 = multiplyAddValue11 + 0.5f;
    float sumValue2 = multiplyAddValue12 + 0.5f;
    float sumValue3 = sumValue - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue4 = sumValue1 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue5 = sumValue2 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue = rsqrt(dot(float3(sumValue3, sumValue4, sumValue5), float3(sumValue3, sumValue4, sumValue5)));
    float productValue7 = sumValue3 * inverseLengthValue;
    float productValue8 = sumValue5 * inverseLengthValue;
    float sumValue6 = (-0.0f) - productValue7;
    float inverseLengthValue1 = rsqrt(dot(float3(productValue8, 0.0f, sumValue6), float3(productValue8, 0.0f, sumValue6)));
    float productValue9 = inverseLengthValue1 * productValue8;
    float productValue10 = inverseLengthValue1 * sumValue6;
    float sumValue7 = vertexColor0.z + (-0.5f);
    float productValue11 = (inverseLengthValue * sumValue7) * sumValue4;
    float sumValue8 = vertexColor0.x + (-0.5f);
    float productValue12 = (sumValue - (productValue9 * sumValue8)) - (productValue10 * productValue11);
    float productValue13 = sumValue1 - (((productValue9 * productValue8) - (productValue10 * productValue7)) * sumValue7);
    float productValue14 = sumValue2 - ((productValue10 * sumValue8) - (productValue9 * productValue11));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, productValue14, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue13, productValue12 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, productValue14, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue13, productValue12 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, productValue14, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue13, productValue12 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, productValue14, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue13, productValue12 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
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
    float sumValue25 = multiplyAddValue30 + 0.5f;
    float sumValue26 = multiplyAddValue31 + 0.5f;
    float sumValue27 = multiplyAddValue32 + 0.5f;
    float sumValue28 = sumValue25 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue29 = sumValue26 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue30 = sumValue27 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue6 = rsqrt(dot(float3(sumValue28, sumValue29, sumValue30), float3(sumValue28, sumValue29, sumValue30)));
    float productValue42 = sumValue28 * inverseLengthValue6;
    float productValue43 = sumValue30 * inverseLengthValue6;
    float sumValue31 = (-0.0f) - productValue42;
    float inverseLengthValue7 = rsqrt(dot(float3(productValue43, 0.0f, sumValue31), float3(productValue43, 0.0f, sumValue31)));
    float productValue44 = inverseLengthValue7 * productValue43;
    float productValue45 = inverseLengthValue7 * sumValue31;
    float sumValue7 = vertexColor0.z + (-0.5f);
    float productValue46 = (inverseLengthValue6 * sumValue7) * sumValue29;
    float sumValue8 = vertexColor0.x + (-0.5f);
    float productValue47 = (sumValue25 - (productValue44 * sumValue8)) - (productValue45 * productValue46);
    float productValue48 = sumValue26 - (((productValue44 * productValue43) - (productValue45 * productValue42)) * sumValue7);
    float productValue49 = sumValue27 - ((productValue45 * sumValue8) - (productValue44 * productValue46));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, productValue49, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue48, productValue47 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, productValue49, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue48, productValue47 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, productValue49, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue48, productValue47 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, productValue49, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue48, productValue47 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#endif
    varyingBitangent0.x = 0.0f;
    varyingBitangent0.y = 0.0f;
    varyingBitangent0.z = 0.0f;
    varyingColor1.x = 0.0f;
    varyingColor1.y = 0.0f;
    varyingColor1.z = 0.0f;
    varyingColor1.w = 0.0f;
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
    varyingFrontFacing0 = int(0u);
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord4 = int(0u);
#endif
    varyingNormal0.x = 0.0f;
    varyingNormal0.y = 0.0f;
    varyingNormal0.z = 0.0f;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord4 = int(0u);
#endif
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
#if RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vertexColor0 = stage_input.vertexColor0;
#endif
    vertexPosition0 = stage_input.vertexPosition0;
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vertexTexCoord0 = stage_input.vertexTexCoord0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
#endif
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    stage_output.varyingNormal0 = varyingNormal0;
#endif
    stage_output.varyingTexCoord4 = varyingTexCoord4;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    stage_output.varyingNormal0 = varyingNormal0;
#endif
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
}
