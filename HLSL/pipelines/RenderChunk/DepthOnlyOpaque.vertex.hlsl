// RenderChunk / DepthOnlyOpaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
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

#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT2_PRECISE_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_5 1
#endif

#include "../../include/materials/RenderChunk/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeVertexStage()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x;
    precise float productValue = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x;
    precise float productValue1 = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y;
    precise float productValue2 = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z;
    precise float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, productValue)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    precise float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, productValue1)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    precise float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, productValue2)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    precise float productValue3 = multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x;
    precise float productValue4 = multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y;
    precise float productValue5 = multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    precise float productValue6 = multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w;
    precise float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, multiplyAddValue, productValue3)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    precise float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, multiplyAddValue, productValue4)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    precise float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, multiplyAddValue, productValue5)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    precise float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, multiplyAddValue, productValue6)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float4 vectorValue = float4(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5, multiplyAddValue6);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, sumValue, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), vectorValue);
    precise float sumValue1 = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y;
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, sumValue1, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), vectorValue);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), vectorValue);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), vectorValue);
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x;
    precise float productValue1 = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y;
    precise float productValue2 = vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z;
    precise float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, productValue)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    precise float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, productValue1)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    precise float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, productValue2)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    precise float sumValue12 = multiplyAddValue + 0.5f;
    precise float sumValue13 = multiplyAddValue1 + 0.5f;
    precise float sumValue14 = multiplyAddValue2 + 0.5f;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float sumValue15 = sumValue14 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    precise float sumValue16 = sumValue12 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    precise float sumValue17 = sumValue13 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue2 = float3(sumValue15, sumValue16, sumValue17);
    float inverseLengthValue = rsqrt(rdDot3Precise(vectorValue2, vectorValue2));
    precise float productValue7 = inverseLengthValue * sumValue15;
    precise float productValue8 = inverseLengthValue * sumValue16;
    precise float productValue9 = inverseLengthValue * sumValue17;
    precise float productValue10 = productValue9 * 0.0f;
    precise float productValue11 = productValue7 * 0.0f;
    precise float productValue12 = productValue8 * 1.0f;
    float multiplyAddValue18 = mad(productValue7, 1.0f, -productValue10);
    float multiplyAddValue19 = mad(productValue9, 0.0f, -productValue12);
    float2 vectorValue3 = float2(multiplyAddValue18, multiplyAddValue19);
    float inverseLengthValue1 = rsqrt(rdDot2Precise(vectorValue3, vectorValue3));
    precise float productValue13 = inverseLengthValue1 * multiplyAddValue18;
    precise float multiplyAddValue20 = inverseLengthValue1 * mad(productValue8, 0.0f, -productValue11);
    precise float productValue14 = inverseLengthValue1 * multiplyAddValue19;
    precise float productValue15 = productValue7 * multiplyAddValue20;
    precise float productValue16 = productValue8 * productValue14;
    precise float productValue17 = productValue9 * productValue13;
    precise float sumValue18 = vertexColor0.z - 0.5f;
    precise float sumValue19 = vertexColor0.x - 0.5f;
    precise float productValue18 = productValue13 * sumValue19;
    precise float productValue19 = multiplyAddValue20 * sumValue19;
    precise float productValue20 = productValue14 * sumValue19;
    precise float multiplyAddValue21 = sumValue12 - mad(mad(productValue9, productValue14, -productValue15), sumValue18, productValue18);
    precise float multiplyAddValue22 = sumValue13 - mad(mad(productValue7, productValue13, -productValue16), sumValue18, productValue19);
    precise float multiplyAddValue23 = sumValue14 - mad(mad(productValue8, multiplyAddValue20, -productValue17), sumValue18, productValue20);
    precise float productValue21 = multiplyAddValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x;
    precise float productValue22 = multiplyAddValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y;
    precise float productValue23 = multiplyAddValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    precise float productValue24 = multiplyAddValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w;
    precise float sumValue20 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue21;
    precise float sumValue21 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue22;
    precise float sumValue22 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue23;
    float3 vectorValue4 = float3(sumValue20, sumValue21, sumValue22);
    precise float multiplyAddValue24 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue23, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, multiplyAddValue21, productValue21)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    precise float multiplyAddValue25 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue23, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, multiplyAddValue21, productValue22)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    precise float multiplyAddValue26 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue23, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, multiplyAddValue21, productValue23)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    precise float multiplyAddValue27 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue23, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, multiplyAddValue21, productValue24)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    precise float sumValue = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x;
    float4 vectorValue5 = float4(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26, multiplyAddValue27);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, sumValue, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), vectorValue5);
    precise float sumValue1 = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y;
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, sumValue1, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), vectorValue5);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), vectorValue5);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), vectorValue5);
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x;
    float4 vectorValue8 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue1 = rdDot4Precise(vectorValue8, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue38 = scalarValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x;
    precise float productValue39 = scalarValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y;
    precise float productValue40 = scalarValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    precise float productValue41 = scalarValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w;
    float scalarValue2 = rdDot4Precise(vectorValue8, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, scalarValue2, productValue38)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    precise float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, scalarValue2, productValue39)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    precise float multiplyAddValue45 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, scalarValue2, productValue40)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    precise float multiplyAddValue46 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, scalarValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, scalarValue2, productValue41)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float4 vectorValue9 = float4(multiplyAddValue43, multiplyAddValue44, multiplyAddValue45, multiplyAddValue46);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, sumValue, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), vectorValue9);
    precise float sumValue1 = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y;
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, sumValue1, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), vectorValue9);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), vectorValue9);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), vectorValue9);
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    float4 vectorValue8 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue2 = rdDot4Precise(vectorValue8, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue1 = rdDot4Precise(vectorValue8, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue56 = scalarValue2 + 0.5f;
    precise float sumValue57 = scalarValue1 + 0.5f;
    precise float sumValue58 = scalarValue3 + 0.5f;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    precise float sumValue59 = sumValue58 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    precise float sumValue60 = sumValue56 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    precise float sumValue61 = sumValue57 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue11 = float3(sumValue59, sumValue60, sumValue61);
    float inverseLengthValue6 = rsqrt(rdDot3Precise(vectorValue11, vectorValue11));
    precise float productValue42 = inverseLengthValue6 * sumValue59;
    precise float productValue43 = inverseLengthValue6 * sumValue60;
    precise float productValue44 = inverseLengthValue6 * sumValue61;
    precise float productValue45 = productValue44 * 0.0f;
    precise float productValue46 = productValue42 * 0.0f;
    precise float productValue47 = productValue43 * 1.0f;
    float multiplyAddValue48 = mad(productValue42, 1.0f, -productValue45);
    float multiplyAddValue49 = mad(productValue44, 0.0f, -productValue47);
    float2 vectorValue12 = float2(multiplyAddValue48, multiplyAddValue49);
    float inverseLengthValue7 = rsqrt(rdDot2Precise(vectorValue12, vectorValue12));
    precise float productValue48 = inverseLengthValue7 * multiplyAddValue48;
    precise float multiplyAddValue50 = inverseLengthValue7 * mad(productValue43, 0.0f, -productValue46);
    precise float productValue49 = inverseLengthValue7 * multiplyAddValue49;
    precise float productValue50 = productValue42 * multiplyAddValue50;
    precise float productValue51 = productValue43 * productValue49;
    precise float productValue52 = productValue44 * productValue48;
    precise float sumValue18 = vertexColor0.z - 0.5f;
    precise float sumValue19 = vertexColor0.x - 0.5f;
    precise float productValue53 = productValue48 * sumValue19;
    precise float productValue54 = multiplyAddValue50 * sumValue19;
    precise float productValue55 = productValue49 * sumValue19;
    precise float multiplyAddValue51 = sumValue56 - mad(mad(productValue44, productValue49, -productValue50), sumValue18, productValue53);
    precise float multiplyAddValue52 = sumValue57 - mad(mad(productValue42, productValue48, -productValue51), sumValue18, productValue54);
    precise float multiplyAddValue53 = sumValue58 - mad(mad(productValue43, multiplyAddValue50, -productValue52), sumValue18, productValue55);
    precise float productValue56 = multiplyAddValue52 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x;
    precise float productValue57 = multiplyAddValue52 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y;
    precise float productValue58 = multiplyAddValue52 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    precise float productValue59 = multiplyAddValue52 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w;
    precise float sumValue62 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue51;
    precise float sumValue63 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue52;
    precise float sumValue64 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue53;
    float3 vectorValue13 = float3(sumValue62, sumValue63, sumValue64);
    precise float multiplyAddValue54 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue53, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, multiplyAddValue51, productValue56)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    precise float multiplyAddValue55 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue53, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, multiplyAddValue51, productValue57)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    precise float multiplyAddValue56 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue53, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, multiplyAddValue51, productValue58)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    precise float multiplyAddValue57 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue53, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, multiplyAddValue51, productValue59)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    precise float sumValue = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x;
    float4 vectorValue14 = float4(multiplyAddValue54, multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, sumValue, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), vectorValue14);
    precise float sumValue1 = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y;
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, sumValue1, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), vectorValue14);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), vectorValue14);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), vectorValue14);
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float4 multiplyAddValue10 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue10);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue10);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue10);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue10);
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue36 = multiplyAddValue7 + 0.5f;
    float sumValue37 = multiplyAddValue8 + 0.5f;
    float sumValue38 = multiplyAddValue9 + 0.5f;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    float sumValue39 = sumValue38 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float sumValue40 = sumValue36 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue41 = sumValue37 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue6 = float3(sumValue39, sumValue40, sumValue41);
    float inverseLengthValue4 = rsqrt(rdDot3Precise(vectorValue6, vectorValue6));
    float productValue33 = inverseLengthValue4 * sumValue39;
    float productValue34 = inverseLengthValue4 * sumValue40;
    float productValue35 = inverseLengthValue4 * sumValue41;
    float scalarValue = -productValue34;
    float2 vectorValue7 = float2(productValue33, scalarValue);
    float inverseLengthValue5 = rsqrt(rdDot2Precise(vectorValue7, vectorValue7));
    float productValue36 = inverseLengthValue5 * productValue33;
    float productValue37 = inverseLengthValue5 * scalarValue;
    float sumValue42 = vertexColor0.z - 0.5f;
    float sumValue43 = vertexColor0.x - 0.5f;
    float multiplyAddValue32 = mad(productValue35 * productValue37, sumValue42, productValue36 * sumValue43);
    float multiplyAddValue33 = mad(productValue33, productValue36, -(productValue34 * productValue37)) * sumValue42;
    float multiplyAddValue34 = mad(-(productValue35 * productValue36), sumValue42, productValue37 * sumValue43);
    float sumValue44 = sumValue36 - multiplyAddValue32;
    float sumValue45 = sumValue37 - multiplyAddValue33;
    float sumValue46 = sumValue38 - multiplyAddValue34;
    float3 sumValue47 = float3((multiplyAddValue32 - sumValue36) + RD_UNIFORM_VIEW_POSITION_AND_TIME.x, (multiplyAddValue33 - sumValue37) + RD_UNIFORM_VIEW_POSITION_AND_TIME.y, (multiplyAddValue34 - sumValue38) + RD_UNIFORM_VIEW_POSITION_AND_TIME.z);
    float4 multiplyAddValue35 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, sumValue46, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, sumValue44, sumValue45 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, sumValue46, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, sumValue44, sumValue45 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, sumValue46, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, sumValue44, sumValue45 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, sumValue46, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, sumValue44, sumValue45 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue35);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue35);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue35);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue35);
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue8 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue1 = rdDot4Precise(vectorValue8, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue2 = rdDot4Precise(vectorValue8, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float4 multiplyAddValue47 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, scalarValue2, scalarValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, scalarValue2, scalarValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, scalarValue2, scalarValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, scalarValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, scalarValue2, scalarValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue47);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue47);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue47);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue47);
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue8 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue2 = rdDot4Precise(vectorValue8, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue1 = rdDot4Precise(vectorValue8, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float sumValue66 = scalarValue2 + 0.5f;
    float sumValue67 = scalarValue1 + 0.5f;
    float sumValue68 = scalarValue3 + 0.5f;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float sumValue69 = sumValue68 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float sumValue70 = sumValue66 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue71 = sumValue67 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue15 = float3(sumValue69, sumValue70, sumValue71);
    float inverseLengthValue8 = rsqrt(rdDot3Precise(vectorValue15, vectorValue15));
    float productValue60 = inverseLengthValue8 * sumValue69;
    float productValue61 = inverseLengthValue8 * sumValue70;
    float productValue62 = inverseLengthValue8 * sumValue71;
    float scalarValue4 = -productValue61;
    float2 vectorValue16 = float2(productValue60, scalarValue4);
    float inverseLengthValue9 = rsqrt(rdDot2Precise(vectorValue16, vectorValue16));
    float productValue63 = inverseLengthValue9 * productValue60;
    float productValue64 = inverseLengthValue9 * scalarValue4;
    float sumValue42 = vertexColor0.z - 0.5f;
    float sumValue43 = vertexColor0.x - 0.5f;
    float multiplyAddValue58 = mad(productValue62 * productValue64, sumValue42, productValue63 * sumValue43);
    float multiplyAddValue59 = mad(productValue60, productValue63, -(productValue61 * productValue64)) * sumValue42;
    float multiplyAddValue60 = mad(-(productValue62 * productValue63), sumValue42, productValue64 * sumValue43);
    float sumValue72 = sumValue66 - multiplyAddValue58;
    float sumValue73 = sumValue67 - multiplyAddValue59;
    float sumValue74 = sumValue68 - multiplyAddValue60;
    float3 sumValue75 = float3((multiplyAddValue58 - sumValue66) + RD_UNIFORM_VIEW_POSITION_AND_TIME.x, (multiplyAddValue59 - sumValue67) + RD_UNIFORM_VIEW_POSITION_AND_TIME.y, (multiplyAddValue60 - sumValue68) + RD_UNIFORM_VIEW_POSITION_AND_TIME.z);
    float4 multiplyAddValue61 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, sumValue74, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, sumValue72, sumValue73 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, sumValue74, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, sumValue72, sumValue73 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, sumValue74, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, sumValue72, sumValue73 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, sumValue74, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, sumValue72, sumValue73 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue61);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue61);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue61);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue61);
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue11 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue12 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue13 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue9 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue11;
    float sumValue10 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue12;
    float sumValue11 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue13;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    float comparisonValue2 = conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue17 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue17, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue11 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue12 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue13 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue24 = multiplyAddValue11 + 0.5f;
    float sumValue25 = multiplyAddValue12 + 0.5f;
    float sumValue26 = multiplyAddValue13 + 0.5f;
    float sumValue27 = sumValue24 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue28 = sumValue25 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue29 = sumValue26 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue2 = rsqrt(dot(float3(sumValue27, sumValue28, sumValue29), float3(sumValue27, sumValue28, sumValue29)));
    float productValue25 = sumValue27 * inverseLengthValue2;
    float productValue26 = sumValue29 * inverseLengthValue2;
    float sumValue30 = (-0.0f) - productValue25;
    float inverseLengthValue3 = rsqrt(dot(float3(productValue26, 0.0f, sumValue30), float3(productValue26, 0.0f, sumValue30)));
    float productValue27 = inverseLengthValue3 * productValue26;
    float productValue28 = inverseLengthValue3 * sumValue30;
    float sumValue31 = vertexColor0.z + (-0.5f);
    float productValue29 = (inverseLengthValue2 * sumValue31) * sumValue28;
    float sumValue32 = vertexColor0.x + (-0.5f);
    float productValue30 = (sumValue24 - (productValue27 * sumValue32)) - (productValue28 * productValue29);
    float productValue31 = sumValue25 - (((productValue27 * productValue26) - (productValue28 * productValue25)) * sumValue31);
    float productValue32 = sumValue26 - ((productValue28 * sumValue32) - (productValue27 * productValue29));
    float sumValue33 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - productValue30;
    float sumValue34 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - productValue31;
    float sumValue35 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - productValue32;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    float comparisonValue2 = conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    float multiplyAddValue28 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue32, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue31, productValue30 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue29 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue32, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue31, productValue30 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue30 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue32, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue31, productValue30 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue31 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue32, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue31, productValue30 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue31, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue30, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue29, multiplyAddValue28 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue31, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue30, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue29, multiplyAddValue28 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue31, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue30, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue29, multiplyAddValue28 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue31, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue30, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue29, multiplyAddValue28 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue36 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue37 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue38 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue48 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue36;
    float sumValue49 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue37;
    float sumValue50 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue38;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    float comparisonValue2 = conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    float multiplyAddValue39 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue38, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue37, multiplyAddValue36 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue40 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue38, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue37, multiplyAddValue36 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue41 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue38, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue37, multiplyAddValue36 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue38, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue37, multiplyAddValue36 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue42, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue41, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue40, multiplyAddValue39 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue42, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue41, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue40, multiplyAddValue39 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue42, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue41, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue40, multiplyAddValue39 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue42, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue41, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue40, multiplyAddValue39 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue36 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue37 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue38 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue76 = multiplyAddValue36 + 0.5f;
    float sumValue77 = multiplyAddValue37 + 0.5f;
    float sumValue78 = multiplyAddValue38 + 0.5f;
    float sumValue79 = sumValue76 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue80 = sumValue77 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue81 = sumValue78 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue10 = rsqrt(dot(float3(sumValue79, sumValue80, sumValue81), float3(sumValue79, sumValue80, sumValue81)));
    float productValue65 = sumValue79 * inverseLengthValue10;
    float productValue66 = sumValue81 * inverseLengthValue10;
    float sumValue82 = (-0.0f) - productValue65;
    float inverseLengthValue11 = rsqrt(dot(float3(productValue66, 0.0f, sumValue82), float3(productValue66, 0.0f, sumValue82)));
    float productValue67 = inverseLengthValue11 * productValue66;
    float productValue68 = inverseLengthValue11 * sumValue82;
    float sumValue31 = vertexColor0.z + (-0.5f);
    float productValue69 = (inverseLengthValue10 * sumValue31) * sumValue80;
    float sumValue32 = vertexColor0.x + (-0.5f);
    float productValue70 = (sumValue76 - (productValue67 * sumValue32)) - (productValue68 * productValue69);
    float productValue71 = sumValue77 - (((productValue67 * productValue66) - (productValue68 * productValue65)) * sumValue31);
    float productValue72 = sumValue78 - ((productValue68 * sumValue32) - (productValue67 * productValue69));
    float sumValue83 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - productValue70;
    float sumValue84 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - productValue71;
    float sumValue85 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - productValue72;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    float comparisonValue2 = conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    float multiplyAddValue62 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue72, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue71, productValue70 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue63 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue72, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue71, productValue70 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue64 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue72, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue71, productValue70 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue65 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue72, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue71, productValue70 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue65, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue64, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue63, multiplyAddValue62 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue65, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue64, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue63, multiplyAddValue62 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue65, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue64, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue63, multiplyAddValue62 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue65, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue64, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue63, multiplyAddValue62 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#endif
    varyingTexCoord2.x = 0.0f;
    varyingTexCoord2.y = 0.0f;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    precise float sumValue2 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue;
    precise float sumValue3 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue1;
    precise float sumValue4 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue2;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    float3 vectorValue1 = float3(sumValue2, sumValue3, sumValue4);
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    precise float nonlinearValue = sqrt(rdDot3Precise(vectorValue1, vectorValue1)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
    precise float sumValue5 = nonlinearValue + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x;
    precise float comparisonValue = sumValue5 - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x);
    precise float sumValue6 = 1.0f - 0.9900000095367431640625f;
    precise float sumValue7 = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    precise float comparisonValue1 = comparisonValue / (conditionValue ? sumValue6 : sumValue7);
    varyingColor2.w = clamp(comparisonValue1, 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    precise float nonlinearValue1 = sqrt(rdDot3Precise(vectorValue4, vectorValue4)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
    precise float sumValue23 = nonlinearValue1 + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x;
    precise float comparisonValue3 = sumValue23 - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x);
    precise float sumValue6 = 1.0f - 0.9900000095367431640625f;
    precise float sumValue7 = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    precise float comparisonValue4 = comparisonValue3 / (conditionValue ? sumValue6 : sumValue7);
    varyingColor2.w = clamp(comparisonValue4, 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    precise float sumValue51 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - scalarValue2;
    precise float sumValue52 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - scalarValue1;
    precise float sumValue53 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - scalarValue3;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float3 vectorValue10 = float3(sumValue51, sumValue52, sumValue53);
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    precise float nonlinearValue2 = sqrt(rdDot3Precise(vectorValue10, vectorValue10)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
    precise float sumValue54 = nonlinearValue2 + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x;
    precise float comparisonValue5 = sumValue54 - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x);
    precise float sumValue6 = 1.0f - 0.9900000095367431640625f;
    precise float sumValue7 = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    precise float comparisonValue6 = comparisonValue5 / (conditionValue ? sumValue6 : sumValue7);
    varyingColor2.w = clamp(comparisonValue6, 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    precise float nonlinearValue3 = sqrt(rdDot3Precise(vectorValue13, vectorValue13)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
    precise float sumValue65 = nonlinearValue3 + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x;
    precise float comparisonValue7 = sumValue65 - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x);
    precise float sumValue6 = 1.0f - 0.9900000095367431640625f;
    precise float sumValue7 = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    precise float comparisonValue8 = comparisonValue7 / (conditionValue ? sumValue6 : sumValue7);
    varyingColor2.w = clamp(comparisonValue8, 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    float3 sumValue8 = float3(RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue7, RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue8, RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue9);
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    varyingColor2.w = clamp((((sqrt(rdDot3Precise(sumValue8, sumValue8)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)) / (conditionValue ? (1.0f - 0.9900000095367431640625f) : (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    varyingColor2.w = clamp((((sqrt(rdDot3Precise(sumValue47, sumValue47)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)) / (conditionValue ? (1.0f - 0.9900000095367431640625f) : (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float3 sumValue55 = float3(RD_UNIFORM_VIEW_POSITION_AND_TIME.x - scalarValue2, RD_UNIFORM_VIEW_POSITION_AND_TIME.y - scalarValue1, RD_UNIFORM_VIEW_POSITION_AND_TIME.z - scalarValue3);
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    varyingColor2.w = clamp((((sqrt(rdDot3Precise(sumValue55, sumValue55)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)) / (conditionValue ? (1.0f - 0.9900000095367431640625f) : (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    varyingColor2.w = clamp((((sqrt(rdDot3Precise(sumValue75, sumValue75)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)) / (conditionValue ? (1.0f - 0.9900000095367431640625f) : (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#endif
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.w = clamp((((sqrt(((sumValue9 * sumValue9) + (sumValue10 * sumValue10)) + (sumValue11 * sumValue11)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - comparisonValue2) / ((conditionValue ? 1.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) - comparisonValue2), 0.0f, 1.0f);
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.w = clamp((((sqrt(((sumValue35 * sumValue35) + (sumValue33 * sumValue33)) + (sumValue34 * sumValue34)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - comparisonValue2) / ((conditionValue ? 1.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) - comparisonValue2), 0.0f, 1.0f);
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.w = clamp((((sqrt(((sumValue48 * sumValue48) + (sumValue49 * sumValue49)) + (sumValue50 * sumValue50)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - comparisonValue2) / ((conditionValue ? 1.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) - comparisonValue2), 0.0f, 1.0f);
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.w = clamp((((sqrt(((sumValue85 * sumValue85) + (sumValue83 * sumValue83)) + (sumValue84 * sumValue84)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - comparisonValue2) / ((conditionValue ? 1.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) - comparisonValue2), 0.0f, 1.0f);
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
#endif
    varyingTexCoord0.x = -3.0517578125e-05f;
    varyingTexCoord0.y = -3.0517578125e-05f;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue36;
    varyingTexCoord3.y = multiplyAddValue37;
    varyingTexCoord3.z = multiplyAddValue38;
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
    vertexTexCoord1 = stage_input.vertexTexCoord1;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
#endif
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    stage_output.varyingColor2 = varyingColor2;
#endif
    stage_output.varyingTexCoord1 = varyingTexCoord1;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    stage_output.varyingColor2 = varyingColor2;
#endif
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
}
