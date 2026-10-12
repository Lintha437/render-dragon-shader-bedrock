// ItemInHandForwardPBRTextured / DepthOnlyOpaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_5 1
#endif

#include "../../include/materials/ItemInHandForwardPBRTextured/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeVertexStage()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    float4 multiplyAddValue3 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    float sumValue = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue3);
    float sumValue1 = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue3);
    float scalarValue = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue3);
    float scalarValue1 = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue3);
    clipSpacePosition.x = sumValue;
    clipSpacePosition.y = sumValue1;
    clipSpacePosition.z = scalarValue;
    clipSpacePosition.w = scalarValue1;
    varyingColor1.x = sumValue;
    varyingColor1.y = sumValue1;
    varyingColor1.z = scalarValue;
    varyingColor1.w = scalarValue1;
    float multiplyAddValue4 = mad(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = mad(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = mad(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, multiplyAddValue6, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, multiplyAddValue4, multiplyAddValue5 * RD_UNIFORM_MODEL_MATRICES_ROW_1.x));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, multiplyAddValue6, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, multiplyAddValue4, multiplyAddValue5 * RD_UNIFORM_MODEL_MATRICES_ROW_1.y));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, multiplyAddValue6, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, multiplyAddValue4, multiplyAddValue5 * RD_UNIFORM_MODEL_MATRICES_ROW_1.z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue2 = rdDot4Precise(vectorValue, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue4 = rdDot4Precise(vectorValue, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue3;
    varyingTexCoord3.y = scalarValue2;
    varyingTexCoord3.z = scalarValue4;
    float4 multiplyAddValue18 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, scalarValue3, scalarValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, scalarValue3, scalarValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, scalarValue3, scalarValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, scalarValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, scalarValue3, scalarValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    float sumValue2 = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue18);
    float sumValue3 = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue18);
    float scalarValue5 = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue18);
    float scalarValue6 = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue18);
    clipSpacePosition.x = sumValue2;
    clipSpacePosition.y = sumValue3;
    clipSpacePosition.z = scalarValue5;
    clipSpacePosition.w = scalarValue6;
    varyingColor1.x = sumValue2;
    varyingColor1.y = sumValue3;
    varyingColor1.z = scalarValue5;
    varyingColor1.w = scalarValue6;
    float multiplyAddValue4 = mad(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = mad(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = mad(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, multiplyAddValue6, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, multiplyAddValue4, multiplyAddValue5 * RD_UNIFORM_MODEL_MATRICES_ROW_1.x));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, multiplyAddValue6, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, multiplyAddValue4, multiplyAddValue5 * RD_UNIFORM_MODEL_MATRICES_ROW_1.y));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, multiplyAddValue6, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, multiplyAddValue4, multiplyAddValue5 * RD_UNIFORM_MODEL_MATRICES_ROW_1.z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue14 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue13, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue15 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue16 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue17 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float productValue = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue1 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue2 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = multiplyAddValue14;
    clipSpacePosition.y = multiplyAddValue15;
    clipSpacePosition.z = multiplyAddValue16;
    clipSpacePosition.w = multiplyAddValue17;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue));
    varyingColor1.x = multiplyAddValue14;
    varyingColor1.y = multiplyAddValue15;
    varyingColor1.z = multiplyAddValue16;
    varyingColor1.w = multiplyAddValue17;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue19 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue20 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue21 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue22 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue21, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue20, multiplyAddValue19 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue23 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue21, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue20, multiplyAddValue19 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue24 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue21, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue20, multiplyAddValue19 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue25 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue21, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue20, multiplyAddValue19 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue26 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue25, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue23, multiplyAddValue22 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue27 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue25, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue23, multiplyAddValue22 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue28 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue25, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue23, multiplyAddValue22 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue29 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue25, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue23, multiplyAddValue22 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float productValue = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue1 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue2 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = multiplyAddValue26;
    clipSpacePosition.y = multiplyAddValue27;
    clipSpacePosition.z = multiplyAddValue28;
    clipSpacePosition.w = multiplyAddValue29;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue));
    varyingColor1.x = multiplyAddValue26;
    varyingColor1.y = multiplyAddValue27;
    varyingColor1.z = multiplyAddValue28;
    varyingColor1.w = multiplyAddValue29;
#endif
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
    varyingFrontFacing0 = int(0u);
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord4 = int(0u);
#endif
    varyingTexCoord8.x = vertexTexCoord8.x;
    varyingTexCoord8.y = vertexTexCoord8.y;
    varyingTexCoord8.z = vertexTexCoord8.z;
    varyingTexCoord8.w = vertexTexCoord8.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexNormal0.x, vertexNormal0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexNormal0.x, vertexNormal0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexNormal0.x, vertexNormal0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    varyingTexCoord5.x = mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_PREV_WORLD_ROW_1.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.x;
    varyingTexCoord5.y = mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_PREV_WORLD_ROW_1.y)) + RD_UNIFORM_PREV_WORLD_ROW_3.y;
    varyingTexCoord5.z = mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_PREV_WORLD_ROW_1.z)) + RD_UNIFORM_PREV_WORLD_ROW_3.z;
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexTangent0.x, vertexTangent0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexTangent0.x, vertexTangent0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexTangent0.x, vertexTangent0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    varyingTexCoord4 = int(0u);
    varyingTexCoord5.x = mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.x;
    varyingTexCoord5.y = mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.y;
    varyingTexCoord5.z = mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.z;
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
#endif
    varyingTexCoord0.x = -3.0517578125e-05f;
    varyingTexCoord0.y = -3.0517578125e-05f;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue19;
    varyingTexCoord3.y = multiplyAddValue20;
    varyingTexCoord3.z = multiplyAddValue21;
#endif
}
VertexStageOutput main(VertexStageInput stage_input)
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vertexColor0 = stage_input.vertexColor0;
#endif
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
#endif
    vertexTexCoord8 = stage_input.vertexTexCoord8;
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
#if RD_PLATFORM == RD_PLATFORM_SM50
    stage_output.varyingTexCoord4 = varyingTexCoord4;
#endif
    stage_output.varyingTexCoord8 = varyingTexCoord8;
    stage_output.varyingNormal0 = varyingNormal0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    stage_output.varyingTexCoord4 = varyingTexCoord4;
#endif
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
}
