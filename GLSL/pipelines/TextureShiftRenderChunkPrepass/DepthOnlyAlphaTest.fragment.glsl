#version 460
#extension GL_GOOGLE_include_directive : require
// TextureShiftRenderChunkPrepass / DepthOnlyAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
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
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_samplerless_texture_functions : require
#endif
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/TextureShiftRenderChunkPrepass/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
    uint productValue = uint(int(varyingTexCoord6.y * 65535.0));
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec4 reinterpretedBits = uintBitsToFloat(intermediateValue2.packedValues[productValue * 2u]);
    uint productValue1 = (productValue * 8u) + 5u;
    vec3 reinterpretedBits1 = uintBitsToFloat(uvec3(intermediateValue1.packedValues[productValue1], intermediateValue1.packedValues[productValue1 + 1u], intermediateValue1.packedValues[productValue1 + 2u]));
    float scalarValue = reinterpretedBits1.x;
    float scalarValue1 = reinterpretedBits1.y;
    float multiplyAddValue = fma(-varyingTexCoord6.x, reinterpretedBits1.z, 1.0);
    if (((((scalarValue1 == 0.0) ? float(scalarValue >= multiplyAddValue) : (1.0 - spvNClamp((multiplyAddValue - scalarValue) / scalarValue1, 0.0, 1.0))) > 0.5) ? texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits.z + varyingTexCoord0.x, reinterpretedBits.w + varyingTexCoord0.y)).w : texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits.x + varyingTexCoord0.x, reinterpretedBits.y + varyingTexCoord0.y)).w) < 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sampledTextureValue = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 5u)).x);
    float sampledTextureValue1 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 6u)).x);
    float sampledTextureValue2 = 1.0 - (uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 7u)).x) * varyingTexCoord6.x);
    float quotientValue;
    if (sampledTextureValue1 == 0.0)
    {
        quotientValue = (sampledTextureValue < sampledTextureValue2) ? 0.0 : 1.0;
    }
    else
    {
        quotientValue = 1.0 - spvNMin(spvNMax((sampledTextureValue2 - sampledTextureValue) / sampledTextureValue1, 0.0), 1.0);
    }
    if (((quotientValue > 0.5) ? texture(sampler2D(matTextureTexture, matTextureSampler), vec2(uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 2u)).x) + varyingTexCoord0.x, uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 3u)).x) + varyingTexCoord0.y)).w : texture(sampler2D(matTextureTexture, matTextureSampler), vec2(uintBitsToFloat(texelFetch(textureShiftBufferData, int(productValue * 8u)).x) + varyingTexCoord0.x, uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 1u)).x) + varyingTexCoord0.y)).w) < 0.5)
#endif
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = 0.0;
    fragmentColor0.y = 0.0;
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
    discardIfRequested();
}
