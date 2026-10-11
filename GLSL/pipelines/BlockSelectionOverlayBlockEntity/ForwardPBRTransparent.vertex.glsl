#version 460
#extension GL_GOOGLE_include_directive : require
// BlockSelectionOverlayBlockEntity / ForwardPBRTransparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/BlockSelectionOverlayBlockEntity/VertexBindings.glsli"

void main()
{
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint bitwiseValue1 = (((16u * bitwiseValue) + 336u) + 4u) >> 2u;
    precise float productValue = vertexVectorConstants0.packedValues[5u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue1 = vertexVectorConstants0.packedValues[5u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue2 = vertexVectorConstants0.packedValues[5u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 336u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 336u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 336u) + 12u) >> 2u;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[7u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[6u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[4u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue))) * vertexPosition0.y;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[7u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[6u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[4u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue1))) * vertexPosition0.y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[7u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[6u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[4u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue2))) * vertexPosition0.y;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 320u) + 4u) >> 2u;
    precise float productValue3 = vertexVectorConstants0.packedValues[5u].x * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue4 = vertexVectorConstants0.packedValues[5u].y * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue5 = vertexVectorConstants0.packedValues[5u].z * vertexScalarConstants0.packedValues[bitwiseValue5];
    uint bitwiseValue6 = (((16u * bitwiseValue) + 320u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 320u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 320u) + 12u) >> 2u;
    uint bitwiseValue9 = (((16u * bitwiseValue) + 352u) + 4u) >> 2u;
    precise float productValue6 = vertexVectorConstants0.packedValues[5u].x * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue7 = vertexVectorConstants0.packedValues[5u].y * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue8 = vertexVectorConstants0.packedValues[5u].z * vertexScalarConstants0.packedValues[bitwiseValue9];
    uint bitwiseValue10 = (((16u * bitwiseValue) + 352u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 352u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 352u) + 12u) >> 2u;
    uint bitwiseValue13 = (((16u * bitwiseValue) + 368u) + 4u) >> 2u;
    precise float productValue9 = vertexVectorConstants0.packedValues[5u].x * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue10 = vertexVectorConstants0.packedValues[5u].y * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue11 = vertexVectorConstants0.packedValues[5u].z * vertexScalarConstants0.packedValues[bitwiseValue13];
    uint bitwiseValue14 = (((16u * bitwiseValue) + 368u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 368u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 368u) + 12u) >> 2u;
    precise float multiplyAddValue6 = fma(fma(vertexVectorConstants0.packedValues[7u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[6u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[4u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue6))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[7u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[6u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[4u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue3))), vertexPosition0.x, multiplyAddValue3)) + fma(vertexVectorConstants0.packedValues[7u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[6u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[4u].x, vertexScalarConstants0.packedValues[bitwiseValue14], productValue9)));
    precise float multiplyAddValue7 = fma(fma(vertexVectorConstants0.packedValues[7u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[6u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[4u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue7))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[7u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[6u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[4u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue4))), vertexPosition0.x, multiplyAddValue4)) + fma(vertexVectorConstants0.packedValues[7u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[6u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[4u].y, vertexScalarConstants0.packedValues[bitwiseValue14], productValue10)));
    precise float multiplyAddValue8 = fma(fma(vertexVectorConstants0.packedValues[7u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[6u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[4u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue8))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[7u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[6u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[4u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue5))), vertexPosition0.x, multiplyAddValue5)) + fma(vertexVectorConstants0.packedValues[7u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[6u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[4u].z, vertexScalarConstants0.packedValues[bitwiseValue14], productValue11)));
    precise float productValue12 = multiplyAddValue7 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue13 = multiplyAddValue7 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue14 = multiplyAddValue7 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue15 = multiplyAddValue7 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue6, productValue12)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue6, productValue13)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue6, productValue14)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue6, productValue15)) + vertexVectorConstants0.packedValues[3u].w;
    precise float sumValue4 = multiplyAddValue9 + 0.0;
    precise float sumValue5 = multiplyAddValue10 + 0.0;
    precise float sumValue6 = multiplyAddValue11 - 0.0001220703125;
    precise float sumValue7 = multiplyAddValue12 + 0.0;
    gl_Position.x = sumValue4;
    gl_Position.y = sumValue5;
    gl_Position.z = sumValue6;
    gl_Position.w = sumValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint bitwiseValue1 = (((16u * bitwiseValue) + 336u) + 4u) >> 2u;
    uint bitwiseValue2 = (((16u * bitwiseValue) + 336u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 336u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 336u) + 12u) >> 2u;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 320u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 320u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 320u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 320u) + 12u) >> 2u;
    uint bitwiseValue9 = (((16u * bitwiseValue) + 352u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 352u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 352u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 352u) + 12u) >> 2u;
    uint bitwiseValue13 = (((16u * bitwiseValue) + 368u) + 4u) >> 2u;
    uint bitwiseValue14 = (((16u * bitwiseValue) + 368u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 368u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 368u) + 12u) >> 2u;
    float multiplyAddValue13 = fma(fma(vertexVectorConstants0.packedValues[7u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[6u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[4u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[5u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[7u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[6u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[4u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[5u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[7u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[6u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[4u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[5u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[7u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[6u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[4u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[5u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue14 = fma(fma(vertexVectorConstants0.packedValues[7u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[6u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[4u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[5u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[7u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[6u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[4u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[5u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[7u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[6u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[4u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[5u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[7u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[6u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[4u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[5u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue15 = fma(fma(vertexVectorConstants0.packedValues[7u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[6u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[4u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[5u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[7u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[6u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[4u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[5u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[7u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[6u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[4u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[5u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[7u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[6u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[4u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[5u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue13, multiplyAddValue14 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue13, multiplyAddValue14 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = (fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue13, multiplyAddValue14 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z) - 0.0001220703125;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue13, multiplyAddValue14 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint sumValue = bitwiseValue + 20u;
    uint sumValue1 = bitwiseValue + 21u;
    uint sumValue2 = bitwiseValue + 22u;
    uint sumValue3 = bitwiseValue + 23u;
    float multiplyAddValue = fma(fma(vertexVectorConstants0.packedValues[7u].x, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[6u].x, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[5u].x, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[4u].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[7u].x, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[6u].x, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[5u].x, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[4u].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[7u].x, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[6u].x, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[5u].x, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[4u].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[7u].x, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[6u].x, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[5u].x, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[4u].x)));
    float multiplyAddValue1 = fma(fma(vertexVectorConstants0.packedValues[7u].y, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[6u].y, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[5u].y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[4u].y))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[7u].y, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[6u].y, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[5u].y, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[4u].y))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[7u].y, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[6u].y, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[5u].y, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[4u].y))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[7u].y, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[6u].y, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[5u].y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[4u].y)));
    float multiplyAddValue2 = fma(fma(vertexVectorConstants0.packedValues[7u].z, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[6u].z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[5u].z, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[4u].z))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[7u].z, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[6u].z, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[5u].z, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[4u].z))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[7u].z, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[6u].z, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[5u].z, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[4u].z))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[7u].z, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[6u].z, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[5u].z, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[4u].z)));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = (vertexVectorConstants0.packedValues[3u].z + (-0.0001220703125)) + fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
}
