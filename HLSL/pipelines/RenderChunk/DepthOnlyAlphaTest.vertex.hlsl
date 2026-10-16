// RenderChunk / DepthOnlyAlphaTest / vertex forward pipeline.
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
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
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
    precise float productValue11 = inverseLengthValue * sumValue15;
    precise float productValue12 = inverseLengthValue * sumValue16;
    precise float productValue13 = inverseLengthValue * sumValue17;
    precise float productValue14 = productValue13 * 0.0f;
    precise float productValue15 = productValue11 * 0.0f;
    precise float productValue16 = productValue12 * 1.0f;
    float multiplyAddValue20 = mad(productValue11, 1.0f, -productValue14);
    float multiplyAddValue21 = mad(productValue13, 0.0f, -productValue16);
    float2 vectorValue3 = float2(multiplyAddValue20, multiplyAddValue21);
    float inverseLengthValue1 = rsqrt(rdDot2Precise(vectorValue3, vectorValue3));
    precise float productValue17 = inverseLengthValue1 * multiplyAddValue20;
    precise float multiplyAddValue22 = inverseLengthValue1 * mad(productValue12, 0.0f, -productValue15);
    precise float productValue18 = inverseLengthValue1 * multiplyAddValue21;
    precise float productValue19 = productValue11 * multiplyAddValue22;
    precise float productValue20 = productValue12 * productValue18;
    precise float productValue21 = productValue13 * productValue17;
    precise float sumValue18 = vertexColor0.z - 0.5f;
    precise float sumValue19 = vertexColor0.x - 0.5f;
    precise float productValue22 = productValue17 * sumValue19;
    precise float productValue23 = multiplyAddValue22 * sumValue19;
    precise float productValue24 = productValue18 * sumValue19;
    precise float multiplyAddValue23 = sumValue12 - mad(mad(productValue13, productValue18, -productValue19), sumValue18, productValue22);
    precise float multiplyAddValue24 = sumValue13 - mad(mad(productValue11, productValue17, -productValue20), sumValue18, productValue23);
    precise float multiplyAddValue25 = sumValue14 - mad(mad(productValue12, multiplyAddValue22, -productValue21), sumValue18, productValue24);
    precise float productValue25 = multiplyAddValue24 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x;
    precise float productValue26 = multiplyAddValue24 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y;
    precise float productValue27 = multiplyAddValue24 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    precise float productValue28 = multiplyAddValue24 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w;
    precise float sumValue20 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue23;
    precise float sumValue21 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue24;
    precise float sumValue22 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue25;
    float3 vectorValue4 = float3(sumValue20, sumValue21, sumValue22);
    precise float multiplyAddValue26 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue25, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, multiplyAddValue23, productValue25)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    precise float multiplyAddValue27 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue25, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, multiplyAddValue23, productValue26)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    precise float multiplyAddValue28 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue25, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, multiplyAddValue23, productValue27)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    precise float multiplyAddValue29 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue25, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, multiplyAddValue23, productValue28)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    precise float sumValue = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x;
    float4 vectorValue5 = float4(multiplyAddValue26, multiplyAddValue27, multiplyAddValue28, multiplyAddValue29);
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
    float scalarValue3 = rdDot4Precise(vectorValue8, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue42 = scalarValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x;
    precise float productValue43 = scalarValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y;
    precise float productValue44 = scalarValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    precise float productValue45 = scalarValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w;
    float scalarValue4 = rdDot4Precise(vectorValue8, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue5 = rdDot4Precise(vectorValue8, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float multiplyAddValue45 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, scalarValue4, productValue42)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    precise float multiplyAddValue46 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, scalarValue4, productValue43)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    precise float multiplyAddValue47 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, scalarValue4, productValue44)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    precise float multiplyAddValue48 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, scalarValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, scalarValue4, productValue45)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float4 vectorValue9 = float4(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47, multiplyAddValue48);
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
    float scalarValue4 = rdDot4Precise(vectorValue8, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue8, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue66 = scalarValue4 + 0.5f;
    precise float sumValue67 = scalarValue3 + 0.5f;
    precise float sumValue68 = scalarValue5 + 0.5f;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    precise float sumValue69 = sumValue68 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    precise float sumValue70 = sumValue66 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    precise float sumValue71 = sumValue67 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue13 = float3(sumValue69, sumValue70, sumValue71);
    float inverseLengthValue8 = rsqrt(rdDot3Precise(vectorValue13, vectorValue13));
    precise float productValue51 = inverseLengthValue8 * sumValue69;
    precise float productValue52 = inverseLengthValue8 * sumValue70;
    precise float productValue53 = inverseLengthValue8 * sumValue71;
    precise float productValue54 = productValue53 * 0.0f;
    precise float productValue55 = productValue51 * 0.0f;
    precise float productValue56 = productValue52 * 1.0f;
    float multiplyAddValue54 = mad(productValue51, 1.0f, -productValue54);
    float multiplyAddValue55 = mad(productValue53, 0.0f, -productValue56);
    float2 vectorValue14 = float2(multiplyAddValue54, multiplyAddValue55);
    float inverseLengthValue9 = rsqrt(rdDot2Precise(vectorValue14, vectorValue14));
    precise float productValue57 = inverseLengthValue9 * multiplyAddValue54;
    precise float multiplyAddValue56 = inverseLengthValue9 * mad(productValue52, 0.0f, -productValue55);
    precise float productValue58 = inverseLengthValue9 * multiplyAddValue55;
    precise float productValue59 = productValue51 * multiplyAddValue56;
    precise float productValue60 = productValue52 * productValue58;
    precise float productValue61 = productValue53 * productValue57;
    precise float sumValue18 = vertexColor0.z - 0.5f;
    precise float sumValue19 = vertexColor0.x - 0.5f;
    precise float productValue62 = productValue57 * sumValue19;
    precise float productValue63 = multiplyAddValue56 * sumValue19;
    precise float productValue64 = productValue58 * sumValue19;
    precise float multiplyAddValue57 = sumValue66 - mad(mad(productValue53, productValue58, -productValue59), sumValue18, productValue62);
    precise float multiplyAddValue58 = sumValue67 - mad(mad(productValue51, productValue57, -productValue60), sumValue18, productValue63);
    precise float multiplyAddValue59 = sumValue68 - mad(mad(productValue52, multiplyAddValue56, -productValue61), sumValue18, productValue64);
    precise float productValue65 = multiplyAddValue58 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x;
    precise float productValue66 = multiplyAddValue58 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y;
    precise float productValue67 = multiplyAddValue58 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    precise float productValue68 = multiplyAddValue58 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w;
    precise float sumValue72 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue57;
    precise float sumValue73 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue58;
    precise float sumValue74 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue59;
    float3 vectorValue15 = float3(sumValue72, sumValue73, sumValue74);
    precise float multiplyAddValue60 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue59, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, multiplyAddValue57, productValue65)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    precise float multiplyAddValue61 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue59, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, multiplyAddValue57, productValue66)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    precise float multiplyAddValue62 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue59, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, multiplyAddValue57, productValue67)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    precise float multiplyAddValue63 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue59, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, multiplyAddValue57, productValue68)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    precise float sumValue = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x;
    float4 vectorValue16 = float4(multiplyAddValue60, multiplyAddValue61, multiplyAddValue62, multiplyAddValue63);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, sumValue, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), vectorValue16);
    precise float sumValue1 = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y;
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, sumValue1, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), vectorValue16);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), vectorValue16);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), vectorValue16);
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue10 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue11 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float4 multiplyAddValue12 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, multiplyAddValue9, multiplyAddValue10 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, multiplyAddValue9, multiplyAddValue10 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, multiplyAddValue9, multiplyAddValue10 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, multiplyAddValue9, multiplyAddValue10 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue12);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue12);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue12);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue12);
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue10 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue11 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue24 = multiplyAddValue9 + 0.5f;
    float sumValue25 = multiplyAddValue10 + 0.5f;
    float sumValue26 = multiplyAddValue11 + 0.5f;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    float sumValue27 = sumValue26 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float sumValue28 = sumValue24 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue29 = sumValue25 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue6 = float3(sumValue27, sumValue28, sumValue29);
    float inverseLengthValue2 = rsqrt(rdDot3Precise(vectorValue6, vectorValue6));
    float productValue29 = inverseLengthValue2 * sumValue27;
    float productValue30 = inverseLengthValue2 * sumValue28;
    float productValue31 = inverseLengthValue2 * sumValue29;
    float scalarValue2 = -productValue30;
    float2 vectorValue7 = float2(productValue29, scalarValue2);
    float inverseLengthValue3 = rsqrt(rdDot2Precise(vectorValue7, vectorValue7));
    float productValue32 = inverseLengthValue3 * productValue29;
    float productValue33 = inverseLengthValue3 * scalarValue2;
    float sumValue30 = vertexColor0.z - 0.5f;
    float sumValue31 = vertexColor0.x - 0.5f;
    float multiplyAddValue30 = mad(productValue31 * productValue33, sumValue30, productValue32 * sumValue31);
    float multiplyAddValue31 = mad(productValue29, productValue32, -(productValue30 * productValue33)) * sumValue30;
    float multiplyAddValue32 = mad(-(productValue31 * productValue32), sumValue30, productValue33 * sumValue31);
    float sumValue32 = sumValue24 - multiplyAddValue30;
    float sumValue33 = sumValue25 - multiplyAddValue31;
    float sumValue34 = sumValue26 - multiplyAddValue32;
    float3 sumValue35 = float3((multiplyAddValue30 - sumValue24) + RD_UNIFORM_VIEW_POSITION_AND_TIME.x, (multiplyAddValue31 - sumValue25) + RD_UNIFORM_VIEW_POSITION_AND_TIME.y, (multiplyAddValue32 - sumValue26) + RD_UNIFORM_VIEW_POSITION_AND_TIME.z);
    float4 multiplyAddValue33 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, sumValue34, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, sumValue32, sumValue33 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, sumValue34, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, sumValue32, sumValue33 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, sumValue34, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, sumValue32, sumValue33 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, sumValue34, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, sumValue32, sumValue33 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue33);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue33);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue33);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue33);
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue8 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue3 = rdDot4Precise(vectorValue8, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue4 = rdDot4Precise(vectorValue8, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue5 = rdDot4Precise(vectorValue8, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float4 multiplyAddValue49 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, scalarValue4, scalarValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, scalarValue4, scalarValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, scalarValue4, scalarValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, scalarValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, scalarValue4, scalarValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue49);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue49);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue49);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue49);
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue8 = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue4 = rdDot4Precise(vectorValue8, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue8, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float sumValue56 = scalarValue4 + 0.5f;
    float sumValue57 = scalarValue3 + 0.5f;
    float sumValue58 = scalarValue5 + 0.5f;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    float sumValue59 = sumValue58 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float sumValue60 = sumValue56 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue61 = sumValue57 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float3 vectorValue11 = float3(sumValue59, sumValue60, sumValue61);
    float inverseLengthValue6 = rsqrt(rdDot3Precise(vectorValue11, vectorValue11));
    float productValue46 = inverseLengthValue6 * sumValue59;
    float productValue47 = inverseLengthValue6 * sumValue60;
    float productValue48 = inverseLengthValue6 * sumValue61;
    float scalarValue6 = -productValue47;
    float2 vectorValue12 = float2(productValue46, scalarValue6);
    float inverseLengthValue7 = rsqrt(rdDot2Precise(vectorValue12, vectorValue12));
    float productValue49 = inverseLengthValue7 * productValue46;
    float productValue50 = inverseLengthValue7 * scalarValue6;
    float sumValue30 = vertexColor0.z - 0.5f;
    float sumValue31 = vertexColor0.x - 0.5f;
    float multiplyAddValue50 = mad(productValue48 * productValue50, sumValue30, productValue49 * sumValue31);
    float multiplyAddValue51 = mad(productValue46, productValue49, -(productValue47 * productValue50)) * sumValue30;
    float multiplyAddValue52 = mad(-(productValue48 * productValue49), sumValue30, productValue50 * sumValue31);
    float sumValue62 = sumValue56 - multiplyAddValue50;
    float sumValue63 = sumValue57 - multiplyAddValue51;
    float sumValue64 = sumValue58 - multiplyAddValue52;
    float3 sumValue65 = float3((multiplyAddValue50 - sumValue56) + RD_UNIFORM_VIEW_POSITION_AND_TIME.x, (multiplyAddValue51 - sumValue57) + RD_UNIFORM_VIEW_POSITION_AND_TIME.y, (multiplyAddValue52 - sumValue58) + RD_UNIFORM_VIEW_POSITION_AND_TIME.z);
    float4 multiplyAddValue53 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, sumValue64, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, sumValue62, sumValue63 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, sumValue64, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, sumValue62, sumValue63 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, sumValue64, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, sumValue62, sumValue63 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, sumValue64, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, sumValue62, sumValue63 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue53);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue53);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue53);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue53);
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue13 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue14 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue15 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue9 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue13;
    float sumValue10 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue14;
    float sumValue11 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue15;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    float comparisonValue2 = conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue14, multiplyAddValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue17 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue14, multiplyAddValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue18 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue14, multiplyAddValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue14, multiplyAddValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint productValue9 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue10 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue19, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue18, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue19, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue18, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue19, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue18, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue19, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue18, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue13 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue14 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue15 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue36 = multiplyAddValue13 + 0.5f;
    float sumValue37 = multiplyAddValue14 + 0.5f;
    float sumValue38 = multiplyAddValue15 + 0.5f;
    float sumValue39 = sumValue36 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue40 = sumValue37 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue41 = sumValue38 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue4 = rsqrt(dot(float3(sumValue39, sumValue40, sumValue41), float3(sumValue39, sumValue40, sumValue41)));
    float productValue34 = sumValue39 * inverseLengthValue4;
    float productValue35 = sumValue41 * inverseLengthValue4;
    float sumValue42 = (-0.0f) - productValue34;
    float inverseLengthValue5 = rsqrt(dot(float3(productValue35, 0.0f, sumValue42), float3(productValue35, 0.0f, sumValue42)));
    float productValue36 = inverseLengthValue5 * productValue35;
    float productValue37 = inverseLengthValue5 * sumValue42;
    float sumValue43 = vertexColor0.z + (-0.5f);
    float productValue38 = (inverseLengthValue4 * sumValue43) * sumValue40;
    float sumValue44 = vertexColor0.x + (-0.5f);
    float productValue39 = (sumValue36 - (productValue36 * sumValue44)) - (productValue37 * productValue38);
    float productValue40 = sumValue37 - (((productValue36 * productValue35) - (productValue37 * productValue34)) * sumValue43);
    float productValue41 = sumValue38 - ((productValue37 * sumValue44) - (productValue36 * productValue38));
    float sumValue45 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - productValue39;
    float sumValue46 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - productValue40;
    float sumValue47 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - productValue41;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    float comparisonValue2 = conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    float multiplyAddValue34 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue41, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue40, productValue39 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue35 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue41, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue40, productValue39 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue36 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue41, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue40, productValue39 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue37 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue41, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue40, productValue39 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint productValue9 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue10 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue37, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue36, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue35, multiplyAddValue34 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue37, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue36, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue35, multiplyAddValue34 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue37, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue36, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue35, multiplyAddValue34 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue37, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue36, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue35, multiplyAddValue34 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue38 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue39 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue40 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue48 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue38;
    float sumValue49 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue39;
    float sumValue50 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue40;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    float comparisonValue2 = conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    float multiplyAddValue41 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue39, multiplyAddValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue39, multiplyAddValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue39, multiplyAddValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue39, multiplyAddValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint productValue9 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue10 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue44, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue43, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue42, multiplyAddValue41 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue44, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue43, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue42, multiplyAddValue41 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue44, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue43, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue42, multiplyAddValue41 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue44, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue43, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue42, multiplyAddValue41 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue38 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue39 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue40 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue76 = multiplyAddValue38 + 0.5f;
    float sumValue77 = multiplyAddValue39 + 0.5f;
    float sumValue78 = multiplyAddValue40 + 0.5f;
    float sumValue79 = sumValue76 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue80 = sumValue77 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue81 = sumValue78 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue10 = rsqrt(dot(float3(sumValue79, sumValue80, sumValue81), float3(sumValue79, sumValue80, sumValue81)));
    float productValue69 = sumValue79 * inverseLengthValue10;
    float productValue70 = sumValue81 * inverseLengthValue10;
    float sumValue82 = (-0.0f) - productValue69;
    float inverseLengthValue11 = rsqrt(dot(float3(productValue70, 0.0f, sumValue82), float3(productValue70, 0.0f, sumValue82)));
    float productValue71 = inverseLengthValue11 * productValue70;
    float productValue72 = inverseLengthValue11 * sumValue82;
    float sumValue43 = vertexColor0.z + (-0.5f);
    float productValue73 = (inverseLengthValue10 * sumValue43) * sumValue80;
    float sumValue44 = vertexColor0.x + (-0.5f);
    float productValue74 = (sumValue76 - (productValue71 * sumValue44)) - (productValue72 * productValue73);
    float productValue75 = sumValue77 - (((productValue71 * productValue70) - (productValue72 * productValue69)) * sumValue43);
    float productValue76 = sumValue78 - ((productValue72 * sumValue44) - (productValue71 * productValue73));
    float sumValue83 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - productValue74;
    float sumValue84 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - productValue75;
    float sumValue85 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - productValue76;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    float comparisonValue2 = conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    float multiplyAddValue64 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue76, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue75, productValue74 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue65 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue76, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue75, productValue74 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue66 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue76, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue75, productValue74 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue67 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue76, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue75, productValue74 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint productValue9 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue10 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue67, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue66, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue65, multiplyAddValue64 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue67, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue66, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue65, multiplyAddValue64 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue67, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue66, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue65, multiplyAddValue64 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue67, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue66, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue65, multiplyAddValue64 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
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
    precise float sumValue51 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - scalarValue4;
    precise float sumValue52 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - scalarValue3;
    precise float sumValue53 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - scalarValue5;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
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
    precise float nonlinearValue3 = sqrt(rdDot3Precise(vectorValue15, vectorValue15)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
    precise float sumValue75 = nonlinearValue3 + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x;
    precise float comparisonValue7 = sumValue75 - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x);
    precise float sumValue6 = 1.0f - 0.9900000095367431640625f;
    precise float sumValue7 = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    precise float comparisonValue8 = comparisonValue7 / (conditionValue ? sumValue6 : sumValue7);
    varyingColor2.w = clamp(comparisonValue8, 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    float3 sumValue8 = float3(RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue9, RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue10, RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue11);
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    varyingColor2.w = clamp((((sqrt(rdDot3Precise(sumValue8, sumValue8)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)) / (conditionValue ? (1.0f - 0.9900000095367431640625f) : (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    varyingColor2.w = clamp((((sqrt(rdDot3Precise(sumValue35, sumValue35)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)) / (conditionValue ? (1.0f - 0.9900000095367431640625f) : (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    float3 sumValue55 = float3(RD_UNIFORM_VIEW_POSITION_AND_TIME.x - scalarValue4, RD_UNIFORM_VIEW_POSITION_AND_TIME.y - scalarValue3, RD_UNIFORM_VIEW_POSITION_AND_TIME.z - scalarValue5);
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    varyingColor2.w = clamp((((sqrt(rdDot3Precise(sumValue55, sumValue55)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)) / (conditionValue ? (1.0f - 0.9900000095367431640625f) : (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    varyingColor2.w = clamp((((sqrt(rdDot3Precise(sumValue65, sumValue65)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - (conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)) / (conditionValue ? (1.0f - 0.9900000095367431640625f) : (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#endif
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
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
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.w = clamp((((sqrt(((sumValue9 * sumValue9) + (sumValue10 * sumValue10)) + (sumValue11 * sumValue11)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - comparisonValue2) / ((conditionValue ? 1.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) - comparisonValue2), 0.0f, 1.0f);
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue13;
    varyingTexCoord3.y = multiplyAddValue14;
    varyingTexCoord3.z = multiplyAddValue15;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.w = clamp((((sqrt(((sumValue47 * sumValue47) + (sumValue45 * sumValue45)) + (sumValue46 * sumValue46)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - comparisonValue2) / ((conditionValue ? 1.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) - comparisonValue2), 0.0f, 1.0f);
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue13;
    varyingTexCoord3.y = multiplyAddValue14;
    varyingTexCoord3.z = multiplyAddValue15;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.w = clamp((((sqrt(((sumValue48 * sumValue48) + (sumValue49 * sumValue49)) + (sumValue50 * sumValue50)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - comparisonValue2) / ((conditionValue ? 1.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) - comparisonValue2), 0.0f, 1.0f);
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue38;
    varyingTexCoord3.y = multiplyAddValue39;
    varyingTexCoord3.z = multiplyAddValue40;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.w = clamp((((sqrt(((sumValue85 * sumValue85) + (sumValue83 * sumValue83)) + (sumValue84 * sumValue84)) / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - comparisonValue2) / ((conditionValue ? 1.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) - comparisonValue2), 0.0f, 1.0f);
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue38;
    varyingTexCoord3.y = multiplyAddValue39;
    varyingTexCoord3.z = multiplyAddValue40;
#endif
}
VertexStageOutput main(VertexStageInput stage_input)
{
#if RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vertexColor0 = stage_input.vertexColor0;
#endif
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vertexTexCoord1 = stage_input.vertexTexCoord1;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
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
