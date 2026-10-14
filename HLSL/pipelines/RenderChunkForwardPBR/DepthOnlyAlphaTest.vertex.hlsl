// RenderChunkForwardPBR / DepthOnlyAlphaTest / vertex forward pipeline.
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

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT2_7 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT3_8 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT4_9 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT_6 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT2_16 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT3_17 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT4_18 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT_15 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT2_12 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT3_13 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT4_14 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT_11 1
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
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/RenderChunkForwardPBR/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
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
    precise float productValue11 = inverseLengthValue * sumValue3;
    precise float productValue12 = inverseLengthValue * sumValue4;
    precise float productValue13 = inverseLengthValue * sumValue5;
    precise float productValue14 = productValue13 * 0.0f;
    precise float productValue15 = productValue11 * 0.0f;
    precise float productValue16 = productValue12 * 1.0f;
    float multiplyAddValue15 = mad(productValue11, 1.0f, -productValue14);
    float multiplyAddValue16 = mad(productValue13, 0.0f, -productValue16);
    float2 vectorValue1 = float2(multiplyAddValue15, multiplyAddValue16);
    float inverseLengthValue1 = rsqrt(rdDot2Precise(vectorValue1, vectorValue1));
    precise float productValue17 = inverseLengthValue1 * multiplyAddValue15;
    precise float multiplyAddValue17 = inverseLengthValue1 * mad(productValue12, 0.0f, -productValue15);
    precise float productValue18 = inverseLengthValue1 * multiplyAddValue16;
    precise float productValue19 = productValue11 * multiplyAddValue17;
    precise float productValue20 = productValue12 * productValue18;
    precise float productValue21 = productValue13 * productValue17;
    precise float sumValue6 = vertexColor0.z - 0.5f;
    precise float sumValue7 = vertexColor0.x - 0.5f;
    precise float productValue22 = productValue17 * sumValue7;
    precise float productValue23 = multiplyAddValue17 * sumValue7;
    precise float productValue24 = productValue18 * sumValue7;
    precise float multiplyAddValue18 = sumValue - mad(mad(productValue13, productValue18, -productValue19), sumValue6, productValue22);
    precise float multiplyAddValue19 = sumValue1 - mad(mad(productValue11, productValue17, -productValue20), sumValue6, productValue23);
    precise float multiplyAddValue20 = sumValue2 - mad(mad(productValue12, multiplyAddValue17, -productValue21), sumValue6, productValue24);
    precise float productValue25 = multiplyAddValue19 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x;
    precise float productValue26 = multiplyAddValue19 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y;
    precise float productValue27 = multiplyAddValue19 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z;
    precise float productValue28 = multiplyAddValue19 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w;
    precise float multiplyAddValue21 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue18, productValue25)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    precise float multiplyAddValue22 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue18, productValue26)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    precise float multiplyAddValue23 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue18, productValue27)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    precise float multiplyAddValue24 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue18, productValue28)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    clipSpacePosition.x = multiplyAddValue21;
    clipSpacePosition.y = multiplyAddValue22;
    clipSpacePosition.z = multiplyAddValue23;
    clipSpacePosition.w = multiplyAddValue24;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    float4 vectorValue4 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue3 = rdDot4Precise(vectorValue4, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue34 = scalarValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x;
    precise float productValue35 = scalarValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y;
    precise float productValue36 = scalarValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z;
    precise float productValue37 = scalarValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w;
    float scalarValue4 = rdDot4Precise(vectorValue4, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue5 = rdDot4Precise(vectorValue4, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    precise float multiplyAddValue31 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, scalarValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, scalarValue4, productValue34)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    precise float multiplyAddValue32 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, scalarValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, scalarValue4, productValue35)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    precise float multiplyAddValue33 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, scalarValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, scalarValue4, productValue36)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    precise float multiplyAddValue34 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, scalarValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, scalarValue4, productValue37)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    clipSpacePosition.x = multiplyAddValue31;
    clipSpacePosition.y = multiplyAddValue32;
    clipSpacePosition.z = multiplyAddValue33;
    clipSpacePosition.w = multiplyAddValue34;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    float4 vectorValue4 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue4 = rdDot4Precise(vectorValue4, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue4, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue16 = scalarValue4 + 0.5f;
    precise float sumValue17 = scalarValue3 + 0.5f;
    precise float sumValue18 = scalarValue5 + 0.5f;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    precise float sumValue19 = sumValue18 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    precise float sumValue20 = sumValue16 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    precise float sumValue21 = sumValue17 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue5 = float3(sumValue19, sumValue20, sumValue21);
    float inverseLengthValue4 = rsqrt(rdDot3Precise(vectorValue5, vectorValue5));
    precise float productValue38 = inverseLengthValue4 * sumValue19;
    precise float productValue39 = inverseLengthValue4 * sumValue20;
    precise float productValue40 = inverseLengthValue4 * sumValue21;
    precise float productValue41 = productValue40 * 0.0f;
    precise float productValue42 = productValue38 * 0.0f;
    precise float productValue43 = productValue39 * 1.0f;
    float multiplyAddValue35 = mad(productValue38, 1.0f, -productValue41);
    float multiplyAddValue36 = mad(productValue40, 0.0f, -productValue43);
    float2 vectorValue6 = float2(multiplyAddValue35, multiplyAddValue36);
    float inverseLengthValue5 = rsqrt(rdDot2Precise(vectorValue6, vectorValue6));
    precise float productValue44 = inverseLengthValue5 * multiplyAddValue35;
    precise float multiplyAddValue37 = inverseLengthValue5 * mad(productValue39, 0.0f, -productValue42);
    precise float productValue45 = inverseLengthValue5 * multiplyAddValue36;
    precise float productValue46 = productValue38 * multiplyAddValue37;
    precise float productValue47 = productValue39 * productValue45;
    precise float productValue48 = productValue40 * productValue44;
    precise float sumValue6 = vertexColor0.z - 0.5f;
    precise float sumValue7 = vertexColor0.x - 0.5f;
    precise float productValue49 = productValue44 * sumValue7;
    precise float productValue50 = multiplyAddValue37 * sumValue7;
    precise float productValue51 = productValue45 * sumValue7;
    precise float multiplyAddValue38 = sumValue16 - mad(mad(productValue40, productValue45, -productValue46), sumValue6, productValue49);
    precise float multiplyAddValue39 = sumValue17 - mad(mad(productValue38, productValue44, -productValue47), sumValue6, productValue50);
    precise float multiplyAddValue40 = sumValue18 - mad(mad(productValue39, multiplyAddValue37, -productValue48), sumValue6, productValue51);
    precise float productValue52 = multiplyAddValue39 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x;
    precise float productValue53 = multiplyAddValue39 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y;
    precise float productValue54 = multiplyAddValue39 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z;
    precise float productValue55 = multiplyAddValue39 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w;
    precise float multiplyAddValue41 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue40, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue38, productValue52)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    precise float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue40, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue38, productValue53)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    precise float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue40, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue38, productValue54)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    precise float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue40, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue38, productValue55)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    clipSpacePosition.x = multiplyAddValue41;
    clipSpacePosition.y = multiplyAddValue42;
    clipSpacePosition.z = multiplyAddValue43;
    clipSpacePosition.w = multiplyAddValue44;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue10 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue11 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue11, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue9, multiplyAddValue10 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue11, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue9, multiplyAddValue10 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue11, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue9, multiplyAddValue10 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue11, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue9, multiplyAddValue10 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue10 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue11 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue8 = multiplyAddValue9 + 0.5f;
    float sumValue9 = multiplyAddValue10 + 0.5f;
    float sumValue10 = multiplyAddValue11 + 0.5f;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    float sumValue11 = sumValue10 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float sumValue12 = sumValue8 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue13 = sumValue9 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue2 = float3(sumValue11, sumValue12, sumValue13);
    float inverseLengthValue2 = rsqrt(rdDot3Precise(vectorValue2, vectorValue2));
    float productValue29 = inverseLengthValue2 * sumValue11;
    float productValue30 = inverseLengthValue2 * sumValue12;
    float productValue31 = inverseLengthValue2 * sumValue13;
    float scalarValue2 = -productValue30;
    float2 vectorValue3 = float2(productValue29, scalarValue2);
    float inverseLengthValue3 = rsqrt(rdDot2Precise(vectorValue3, vectorValue3));
    float productValue32 = inverseLengthValue3 * productValue29;
    float productValue33 = inverseLengthValue3 * scalarValue2;
    float sumValue14 = vertexColor0.z - 0.5f;
    float sumValue15 = vertexColor0.x - 0.5f;
    float multiplyAddValue25 = sumValue8 - mad(productValue31 * productValue33, sumValue14, productValue32 * sumValue15);
    float multiplyAddValue26 = sumValue9 - (mad(productValue29, productValue32, -(productValue30 * productValue33)) * sumValue14);
    float multiplyAddValue27 = sumValue10 - mad(-(productValue31 * productValue32), sumValue14, productValue33 * sumValue15);
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue27, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue25, multiplyAddValue26 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue27, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue25, multiplyAddValue26 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue27, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue25, multiplyAddValue26 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue27, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue25, multiplyAddValue26 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue4 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue3 = rdDot4Precise(vectorValue4, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue4 = rdDot4Precise(vectorValue4, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue5 = rdDot4Precise(vectorValue4, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, scalarValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, scalarValue4, scalarValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, scalarValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, scalarValue4, scalarValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, scalarValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, scalarValue4, scalarValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, scalarValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, scalarValue4, scalarValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue4 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue4 = rdDot4Precise(vectorValue4, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue4, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float sumValue31 = scalarValue4 + 0.5f;
    float sumValue32 = scalarValue3 + 0.5f;
    float sumValue33 = scalarValue5 + 0.5f;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    float sumValue34 = sumValue33 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float sumValue35 = sumValue31 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue36 = sumValue32 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue7 = float3(sumValue34, sumValue35, sumValue36);
    float inverseLengthValue8 = rsqrt(rdDot3Precise(vectorValue7, vectorValue7));
    float productValue64 = inverseLengthValue8 * sumValue34;
    float productValue65 = inverseLengthValue8 * sumValue35;
    float productValue66 = inverseLengthValue8 * sumValue36;
    float scalarValue6 = -productValue65;
    float2 vectorValue8 = float2(productValue64, scalarValue6);
    float inverseLengthValue9 = rsqrt(rdDot2Precise(vectorValue8, vectorValue8));
    float productValue67 = inverseLengthValue9 * productValue64;
    float productValue68 = inverseLengthValue9 * scalarValue6;
    float sumValue14 = vertexColor0.z - 0.5f;
    float sumValue15 = vertexColor0.x - 0.5f;
    float multiplyAddValue45 = sumValue31 - mad(productValue66 * productValue68, sumValue14, productValue67 * sumValue15);
    float multiplyAddValue46 = sumValue32 - (mad(productValue64, productValue67, -(productValue65 * productValue68)) * sumValue14);
    float multiplyAddValue47 = sumValue33 - mad(-(productValue66 * productValue67), sumValue14, productValue68 * sumValue15);
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue47, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue45, multiplyAddValue46 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue47, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue45, multiplyAddValue46 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue47, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue45, multiplyAddValue46 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue47, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue45, multiplyAddValue46 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue12 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue13 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue14 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    uint productValue9 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue10 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue14, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue14, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue14, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue14, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue12 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue13 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue14 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue22 = multiplyAddValue12 + 0.5f;
    float sumValue23 = multiplyAddValue13 + 0.5f;
    float sumValue24 = multiplyAddValue14 + 0.5f;
    float sumValue25 = sumValue22 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue26 = sumValue23 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue27 = sumValue24 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue6 = rsqrt(dot(float3(sumValue25, sumValue26, sumValue27), float3(sumValue25, sumValue26, sumValue27)));
    float productValue56 = sumValue25 * inverseLengthValue6;
    float productValue57 = sumValue27 * inverseLengthValue6;
    float sumValue28 = (-0.0f) - productValue56;
    float inverseLengthValue7 = rsqrt(dot(float3(productValue57, 0.0f, sumValue28), float3(productValue57, 0.0f, sumValue28)));
    float productValue58 = inverseLengthValue7 * productValue57;
    float productValue59 = inverseLengthValue7 * sumValue28;
    float sumValue29 = vertexColor0.z + (-0.5f);
    float productValue60 = (inverseLengthValue6 * sumValue29) * sumValue26;
    float sumValue30 = vertexColor0.x + (-0.5f);
    float productValue61 = (sumValue22 - (productValue58 * sumValue30)) - (productValue59 * productValue60);
    float productValue62 = sumValue23 - (((productValue58 * productValue57) - (productValue59 * productValue56)) * sumValue29);
    float productValue63 = sumValue24 - ((productValue59 * sumValue30) - (productValue58 * productValue60));
    uint productValue9 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue10 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, productValue63, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue62, productValue61 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, productValue63, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue62, productValue61 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, productValue63, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue62, productValue61 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, productValue63, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue62, productValue61 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue28 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue29 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue30 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    uint productValue9 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue10 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue30, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue29, multiplyAddValue28 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue30, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue29, multiplyAddValue28 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue30, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue29, multiplyAddValue28 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue30, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue29, multiplyAddValue28 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue28 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue29 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue30 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue37 = multiplyAddValue28 + 0.5f;
    float sumValue38 = multiplyAddValue29 + 0.5f;
    float sumValue39 = multiplyAddValue30 + 0.5f;
    float sumValue40 = sumValue37 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue41 = sumValue38 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue42 = sumValue39 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue10 = rsqrt(dot(float3(sumValue40, sumValue41, sumValue42), float3(sumValue40, sumValue41, sumValue42)));
    float productValue69 = sumValue40 * inverseLengthValue10;
    float productValue70 = sumValue42 * inverseLengthValue10;
    float sumValue43 = (-0.0f) - productValue69;
    float inverseLengthValue11 = rsqrt(dot(float3(productValue70, 0.0f, sumValue43), float3(productValue70, 0.0f, sumValue43)));
    float productValue71 = inverseLengthValue11 * productValue70;
    float productValue72 = inverseLengthValue11 * sumValue43;
    float sumValue29 = vertexColor0.z + (-0.5f);
    float productValue73 = (inverseLengthValue10 * sumValue29) * sumValue41;
    float sumValue30 = vertexColor0.x + (-0.5f);
    float productValue74 = (sumValue37 - (productValue71 * sumValue30)) - (productValue72 * productValue73);
    float productValue75 = sumValue38 - (((productValue71 * productValue70) - (productValue72 * productValue69)) * sumValue29);
    float productValue76 = sumValue39 - ((productValue72 * sumValue30) - (productValue71 * productValue73));
    uint productValue9 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue10 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, productValue76, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue75, productValue74 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, productValue76, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue75, productValue74 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, productValue76, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue75, productValue74 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, productValue76, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue75, productValue74 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
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
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue7 = vertexTexCoord0.x * 65535.0f;
    precise float productValue8 = vertexTexCoord0.y * 65535.0f;
    uint scalarValue = uint(round(productValue7));
    uint scalarValue1 = uint(round(productValue8));
    precise float multiplyAddValue7 = mad(rdUnsignedToFloat((scalarValue >> 15u) & 1u), 2.0f, -1.0f) * 3.0517578125e-05f;
    precise float multiplyAddValue8 = mad(rdUnsignedToFloat((scalarValue1 >> 15u) & 1u), 2.0f, -1.0f) * 3.0517578125e-05f;
    varyingTexCoord0.x = mad(rdUnsignedToFloat((scalarValue << 1u) & 65534u), 1.525902189314365386962890625e-05f, multiplyAddValue7);
    varyingTexCoord0.y = mad(rdUnsignedToFloat((scalarValue1 << 1u) & 65534u), 1.525902189314365386962890625e-05f, multiplyAddValue8);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue9 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue10 = uint(round(vertexTexCoord0.y * 65535.0f));
    varyingTexCoord0.x = mad(rdUnsignedToFloat(rdBitfieldInsert(0u, productValue9, 1u, 15u)), 1.525902189314365386962890625e-05f, mad(rdUnsignedToFloat(rdBitfieldUExtract(productValue9, 15u, 1u)), 2.0f, -1.0f) * 3.0517578125e-05f);
    varyingTexCoord0.y = mad(rdUnsignedToFloat(rdBitfieldInsert(0u, productValue10, 1u, 15u)), 1.525902189314365386962890625e-05f, mad(rdUnsignedToFloat(rdBitfieldUExtract(productValue10, 15u, 1u)), 2.0f, -1.0f) * 3.0517578125e-05f);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue12;
    varyingTexCoord3.y = multiplyAddValue13;
    varyingTexCoord3.z = multiplyAddValue14;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue28;
    varyingTexCoord3.y = multiplyAddValue29;
    varyingTexCoord3.z = multiplyAddValue30;
#endif
}
VertexStageOutput main(VertexStageInput stage_input)
{
#if RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vertexColor0 = stage_input.vertexColor0;
#endif
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
#if RD_FEATURE_INSTANCING == RD_ON
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
