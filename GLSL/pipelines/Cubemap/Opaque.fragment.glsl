#version 460
#extension GL_GOOGLE_include_directive : require
// Cubemap / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/Cubemap/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec3 vectorValue = vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue = inverseLengthValue * varyingTexCoord0.x;
    precise float productValue1 = inverseLengthValue * varyingTexCoord0.y;
    precise float productValue2 = inverseLengthValue * varyingTexCoord0.z;
    vec4 sampledTextureValue2 = texture(samplerCube(materialTexture0, textureSampler0), vec3(-productValue, productValue1, productValue2));
    fragmentColor0.x = sampledTextureValue2.x;
    fragmentColor0.y = sampledTextureValue2.y;
    fragmentColor0.z = sampledTextureValue2.z;
    fragmentColor0.w = sampledTextureValue2.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec3 vectorValue = vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    vec4 sampledTextureValue = texture(samplerCube(materialTexture0, textureSampler0), vec3(-(inverseLengthValue * varyingTexCoord0.x), inverseLengthValue * varyingTexCoord0.y, inverseLengthValue * varyingTexCoord0.z));
    fragmentColor0.x = sampledTextureValue.x;
    fragmentColor0.y = sampledTextureValue.y;
    fragmentColor0.z = sampledTextureValue.z;
    fragmentColor0.w = sampledTextureValue.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z), vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z)));
    vec4 sampledTextureValue1 = texture(samplerCube(matTextureTexture, matTextureSampler), vec3((-0.0) - (varyingTexCoord0.x * inverseLengthValue1), inverseLengthValue1 * varyingTexCoord0.y, inverseLengthValue1 * varyingTexCoord0.z));
    fragmentColor0.x = sampledTextureValue1.x;
    fragmentColor0.y = sampledTextureValue1.y;
    fragmentColor0.z = sampledTextureValue1.z;
    fragmentColor0.w = sampledTextureValue1.w;
#endif
}
