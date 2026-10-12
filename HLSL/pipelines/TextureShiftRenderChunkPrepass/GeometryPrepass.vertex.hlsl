// TextureShiftRenderChunkPrepass / GeometryPrepass / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#define RD_BINDING_LAYOUT 4
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
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/TextureShiftRenderChunkPrepass/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeVertexStage()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    float4 multiplyAddValue10 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, multiplyAddValue7, multiplyAddValue8 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue10);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue10);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue10);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue10);
    float multiplyAddValue11 = mad(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue12 = mad(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue13 = mad(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, multiplyAddValue13, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, multiplyAddValue11, multiplyAddValue12 * RD_UNIFORM_MODEL_MATRICES_ROW_1.x));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, multiplyAddValue13, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, multiplyAddValue11, multiplyAddValue12 * RD_UNIFORM_MODEL_MATRICES_ROW_1.y));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, multiplyAddValue13, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, multiplyAddValue11, multiplyAddValue12 * RD_UNIFORM_MODEL_MATRICES_ROW_1.z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue = rdDot4Precise(vectorValue, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    float4 multiplyAddValue22 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, scalarValue1, scalarValue * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, scalarValue1, scalarValue * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, scalarValue1, scalarValue * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, scalarValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, scalarValue1, scalarValue * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue22);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue22);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue22);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue22);
    float multiplyAddValue11 = mad(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue12 = mad(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue13 = mad(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, multiplyAddValue13, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, multiplyAddValue11, multiplyAddValue12 * RD_UNIFORM_MODEL_MATRICES_ROW_1.x));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, multiplyAddValue13, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, multiplyAddValue11, multiplyAddValue12 * RD_UNIFORM_MODEL_MATRICES_ROW_1.y));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, multiplyAddValue13, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, multiplyAddValue11, multiplyAddValue12 * RD_UNIFORM_MODEL_MATRICES_ROW_1.z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(round(vertexTexCoord1.x * 65535.0f));
    uint productValue6 = uint(round(vertexTexCoord1.y * 65535.0f));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125f) + 0.01176470704376697540283203125f;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue6, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue15 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue16 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue17 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue18 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue17, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue16, multiplyAddValue15 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue17, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue16, multiplyAddValue15 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue20 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue17, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue16, multiplyAddValue15 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue21 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue17, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue16, multiplyAddValue15 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(round(vertexTexCoord1.x * 65535.0f));
    uint productValue6 = uint(round(vertexTexCoord1.y * 65535.0f));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125f) + 0.01176470704376697540283203125f;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue21, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue20, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue20, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue20, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue20, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue5 = uint(round(vertexTexCoord1.x * 65535.0f));
    uint productValue6 = uint(round(vertexTexCoord1.y * 65535.0f));
    varyingTexCoord1.x = rdUnsignedToFloat((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = rdUnsignedToFloat(productValue6 & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord2.x = float(rdBitfieldUExtract(productValue5, 8u, 1u) != 0u);
    varyingTexCoord2.y = float(rdBitfieldUExtract(productValue6, 8u, 1u) != 0u);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue5 & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = float(productValue6 & 15u) * 0.066666670143604278564453125f;
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
#endif
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingFrontFacing0 = int(0u);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
#endif
    varyingTexCoord6.x = vertexTexCoord2.x;
    varyingTexCoord6.y = vertexTexCoord2.y;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue14 = mad(vertexNormal0.w, 0.5f, 0.5f);
    varyingTexCoord5.x = (multiplyAddValue14 * (rdUnsignedToFloat((productValue5 >> 8u) & 254u) * 0.0039215688593685626983642578125f)) * 6.0f;
    varyingTexCoord5.y = (multiplyAddValue14 * (rdUnsignedToFloat(productValue5 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f;
    varyingTexCoord5.z = (multiplyAddValue14 * (rdUnsignedToFloat((productValue6 >> 8u) & 254u) * 0.0039215688593685626983642578125f)) * 6.0f;
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexNormal0.x, vertexNormal0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x));
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexNormal0.x, vertexNormal0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y));
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexNormal0.x, vertexNormal0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z));
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexTangent0.x, vertexTangent0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexTangent0.x, vertexTangent0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexTangent0.x, vertexTangent0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z));
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    varyingTexCoord0.x = mad(rdUnsignedToFloat(rdBitfieldInsert(0u, productValue, 1u, 15u)), 1.525902189314365386962890625e-05f, mad(rdUnsignedToFloat(rdBitfieldUExtract(productValue, 15u, 1u)), 2.0f, -1.0f) * 3.0517578125e-05f);
    varyingTexCoord0.y = mad(rdUnsignedToFloat(rdBitfieldInsert(0u, productValue1, 1u, 15u)), 1.525902189314365386962890625e-05f, mad(rdUnsignedToFloat(rdBitfieldUExtract(productValue1, 15u, 1u)), 2.0f, -1.0f) * 3.0517578125e-05f);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue15;
    varyingTexCoord3.y = multiplyAddValue16;
    varyingTexCoord3.z = multiplyAddValue17;
#endif
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord2 = stage_input.vertexTexCoord2;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
#if RD_FEATURE_INSTANCING == RD_ON
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
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
#endif
    stage_output.varyingTexCoord1 = varyingTexCoord1;
#if RD_PLATFORM == RD_PLATFORM_SM50
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    stage_output.varyingNormal0 = varyingNormal0;
#endif
    stage_output.varyingTexCoord4 = varyingTexCoord4;
#if RD_PLATFORM == RD_PLATFORM_SM50
    stage_output.varyingTexCoord6 = varyingTexCoord6;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingNormal0 = varyingNormal0;
#endif
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    stage_output.varyingTexCoord6 = varyingTexCoord6;
#endif
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
}
