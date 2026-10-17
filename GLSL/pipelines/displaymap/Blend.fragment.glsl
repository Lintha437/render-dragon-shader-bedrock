#version 460
#extension GL_GOOGLE_include_directive : require
// displaymap / Blend / fragment forward pipeline.
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
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/displaymap/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec3 vectorValue = vec3(sampledTextureValue.xyz);
    fragmentColor0.w = sampledTextureValue.w;
    precise float productValue = rdDot3Precise2(vectorValue, vec3(0.6274039745330810546875, 0.329281985759735107421875, 0.043313600122928619384765625)) * fragmentScalarConstants1.packedValues[0u];
    precise float productValue1 = rdDot3Precise2(vectorValue, vec3(0.06909699738025665283203125, 0.919539988040924072265625, 0.0113612003624439239501953125)) * fragmentScalarConstants1.packedValues[0u];
    precise float productValue2 = rdDot3Precise2(vectorValue, vec3(0.01639159955084323883056640625, 0.0880132019519805908203125, 0.895595014095306396484375)) * fragmentScalarConstants1.packedValues[0u];
    precise float productValue3 = productValue * 9.9999997473787516355514526367188e-05;
    precise float productValue4 = productValue1 * 9.9999997473787516355514526367188e-05;
    precise float productValue5 = productValue2 * 9.9999997473787516355514526367188e-05;
    precise float nonlinearValue = log2(abs(productValue3)) * 0.1593017578125;
    precise float nonlinearValue1 = log2(abs(productValue4)) * 0.1593017578125;
    precise float nonlinearValue2 = log2(abs(productValue5)) * 0.1593017578125;
    float exponentialValue3 = exp2(nonlinearValue);
    float exponentialValue4 = exp2(nonlinearValue1);
    float exponentialValue5 = exp2(nonlinearValue2);
    precise float multiplyAddValue = fma(exponentialValue3, 18.8515625, 0.8359375) / fma(exponentialValue3, 18.6875, 1.0);
    precise float multiplyAddValue1 = fma(exponentialValue4, 18.8515625, 0.8359375) / fma(exponentialValue4, 18.6875, 1.0);
    precise float multiplyAddValue2 = fma(exponentialValue5, 18.8515625, 0.8359375) / fma(exponentialValue5, 18.6875, 1.0);
    precise float nonlinearValue3 = log2(multiplyAddValue) * 78.84375;
    precise float nonlinearValue4 = log2(multiplyAddValue1) * 78.84375;
    precise float nonlinearValue5 = log2(multiplyAddValue2) * 78.84375;
    fragmentColor0.x = exp2(nonlinearValue3);
    fragmentColor0.y = exp2(nonlinearValue4);
    fragmentColor0.z = exp2(nonlinearValue5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec3 vectorValue = vec3(sampledTextureValue.xyz);
    fragmentColor0.w = sampledTextureValue.w;
    float exponentialValue = exp2(log2(abs((rdDot3Precise2(vectorValue, vec3(0.6274039745330810546875, 0.329281985759735107421875, 0.043313600122928619384765625)) * fragmentScalarConstants1.packedValues[0u]) * 9.9999997473787516355514526367188e-05)) * 0.1593017578125);
    float exponentialValue1 = exp2(log2(abs((rdDot3Precise2(vectorValue, vec3(0.06909699738025665283203125, 0.919539988040924072265625, 0.0113612003624439239501953125)) * fragmentScalarConstants1.packedValues[0u]) * 9.9999997473787516355514526367188e-05)) * 0.1593017578125);
    float exponentialValue2 = exp2(log2(abs((rdDot3Precise2(vectorValue, vec3(0.01639159955084323883056640625, 0.0880132019519805908203125, 0.895595014095306396484375)) * fragmentScalarConstants1.packedValues[0u]) * 9.9999997473787516355514526367188e-05)) * 0.1593017578125);
    fragmentColor0.x = exp2(log2(fma(exponentialValue, 18.8515625, 0.8359375) / fma(exponentialValue, 18.6875, 1.0)) * 78.84375);
    fragmentColor0.y = exp2(log2(fma(exponentialValue1, 18.8515625, 0.8359375) / fma(exponentialValue1, 18.6875, 1.0)) * 78.84375);
    fragmentColor0.z = exp2(log2(fma(exponentialValue2, 18.8515625, 0.8359375) / fma(exponentialValue2, 18.6875, 1.0)) * 78.84375);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue1 = texture(sampler2D(texColorTexture, texColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    float productValue6 = fragmentVectorConstants1.packedValues[0u].x * 9.9999997473787516355514526367188e-05;
    float multiplyAddValue3 = exp2(log2(abs(productValue6 * fma(0.043313600122928619384765625, scalarValue2, fma(0.329281985759735107421875, scalarValue1, scalarValue * 0.6274039745330810546875)))) * 0.1593017578125);
    float multiplyAddValue4 = exp2(log2(abs(fma(0.0113612003624439239501953125, scalarValue2, fma(0.919539988040924072265625, scalarValue1, scalarValue * 0.06909699738025665283203125)) * productValue6)) * 0.1593017578125);
    float multiplyAddValue5 = exp2(log2(abs(fma(0.895595014095306396484375, scalarValue2, fma(0.0880132019519805908203125, scalarValue1, scalarValue * 0.01639159955084323883056640625)) * productValue6)) * 0.1593017578125);
    fragmentColor0.x = exp2(log2(((multiplyAddValue3 * 18.8515625) + 0.8359375) / ((multiplyAddValue3 * 18.6875) + 1.0)) * 78.84375);
    fragmentColor0.y = exp2(log2(((multiplyAddValue4 * 18.8515625) + 0.8359375) / ((multiplyAddValue4 * 18.6875) + 1.0)) * 78.84375);
    fragmentColor0.z = exp2(log2(((multiplyAddValue5 * 18.8515625) + 0.8359375) / ((multiplyAddValue5 * 18.6875) + 1.0)) * 78.84375);
    fragmentColor0.w = sampledTextureValue1.w;
#endif
}
