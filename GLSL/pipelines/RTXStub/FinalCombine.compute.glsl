#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / FinalCombine / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 25
#endif

#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    float scalarValue = float(gl_GlobalInvocationID.y);
    if ((float(gl_GlobalInvocationID.x) >= ViewCB.packedValues[78u].x) || (scalarValue >= ViewCB.packedValues[78u].y))
    {
        imageStore(outputBufferFinal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
    }
    else
    {
        uvec4 reinterpretedBits = floatBitsToUint(ViewCB.packedValues[91u]);
        uint scalarValue1 = reinterpretedBits.y;
        bool comparisonValue = scalarValue1 == 2u;
        uint intermediateValue2;
        if (comparisonValue)
        {
            intermediateValue2 = gl_GlobalInvocationID.x;
        }
        else
        {
            uint productValue = uint(ViewCB.packedValues[78u].x * 0.5);
            uint reinterpretedBits1 = (((scalarValue1 == 0u) ? floatBitsToUint(ViewCB.packedValues[84u]).z : 0u) + gl_GlobalInvocationID.y) & 1u;
            uint branchMergedValue;
            if (gl_GlobalInvocationID.x < productValue)
            {
                branchMergedValue = ((gl_GlobalInvocationID.x << 1u) | 1u) - reinterpretedBits1;
            }
            else
            {
                branchMergedValue = reinterpretedBits1 | ((gl_GlobalInvocationID.x - productValue) << 1u);
            }
            intermediateValue2 = branchMergedValue;
        }
        uint comparisonValue1 = comparisonValue ? intermediateValue2 : gl_GlobalInvocationID.x;
        vec4 sampledTextureValue = texelFetch(inputPrimaryPosLowPrecision, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        vec4 sampledTextureValue1 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue2 = sampledTextureValue1.x;
        float scalarValue3 = abs(sampledTextureValue.w);
        bool comparisonValue2 = scalarValue2 == 65504.0;
        vec4 sampledTextureValue2 = texelFetch(inputEmissiveAndLinearRoughness, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue4 = sampledTextureValue2.x;
        float scalarValue5 = sampledTextureValue2.y;
        float scalarValue6 = sampledTextureValue2.z;
        float scalarValue7 = sampledTextureValue2.w;
        bool reinterpretedBits2 = ((floatBitsToUint(scalarValue6) & 2147483647u) > 2139095040u) || (((floatBitsToUint(scalarValue4) & 2147483647u) > 2139095040u) || ((floatBitsToUint(scalarValue5) & 2147483647u) > 2139095040u));
        float comparisonValue3 = reinterpretedBits2 ? 0.0 : scalarValue4;
        float comparisonValue4 = reinterpretedBits2 ? 0.0 : scalarValue5;
        float comparisonValue5 = reinterpretedBits2 ? 0.0 : scalarValue6;
        imageStore(outputBufferPreviousLinearRoughness, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(scalarValue7));
        float productValue1 = ViewCB.packedValues[78u].z * (float(intermediateValue2) + 0.5);
        float productValue2 = ViewCB.packedValues[78u].w * (scalarValue + 0.5);
        float productValue3;
        float productValue4;
        float productValue5;
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        if (floatBitsToUint(ViewCB.packedValues[96u]).y == 0u)
        {
            float nonlinearValue = log2((scalarValue3 * 0.20000000298023223876953125) + 1.0) * 0.289064824581146240234375;
            vec4 sampledTextureValue3 = textureLod(sampler3D(volumetricResolvedInscatter, linearSampler), vec3(productValue1, productValue2, nonlinearValue), 0.0);
            float scalarValue8 = sampledTextureValue3.x;
            float scalarValue9 = sampledTextureValue3.y;
            float scalarValue10 = sampledTextureValue3.z;
            vec4 sampledTextureValue4 = textureLod(sampler3D(volumetricGIResolvedInscatter, linearSampler), vec3(productValue1, productValue2, nonlinearValue), 0.0);
            float scalarValue11 = sampledTextureValue4.x;
            float scalarValue12 = sampledTextureValue4.y;
            float scalarValue13 = sampledTextureValue4.z;
            vec4 sampledTextureValue5 = textureLod(sampler3D(volumetricResolvedTransmission, linearSampler), vec3(productValue1, productValue2, nonlinearValue), 0.0);
            productValue3 = (scalarValue11 * scalarValue11) + (scalarValue8 * scalarValue8);
            productValue4 = (scalarValue12 * scalarValue12) + (scalarValue9 * scalarValue9);
            productValue5 = (scalarValue13 * scalarValue13) + (scalarValue10 * scalarValue10);
            intermediateValue15 = sampledTextureValue5.x;
            intermediateValue16 = sampledTextureValue5.y;
            intermediateValue17 = sampledTextureValue5.z;
        }
        else
        {
            productValue3 = 0.0;
            productValue4 = 0.0;
            productValue5 = 0.0;
            intermediateValue15 = 1.0;
            intermediateValue16 = 1.0;
            intermediateValue17 = 1.0;
        }
        float sampledTextureValue6 = uintBitsToFloat(texelFetch(inputIncidentLight, int(0u)).x);
        float productValue6 = sampledTextureValue6 * productValue3;
        float productValue7 = sampledTextureValue6 * productValue4;
        float productValue8 = sampledTextureValue6 * productValue5;
        bool reinterpretedBits3 = ((floatBitsToUint(productValue8) & 2147483647u) > 2139095040u) || (((floatBitsToUint(productValue6) & 2147483647u) > 2139095040u) || ((floatBitsToUint(productValue7) & 2147483647u) > 2139095040u));
        bool reinterpretedBits4 = (((floatBitsToUint(intermediateValue15) & 2147483647u) > 2139095040u) || ((floatBitsToUint(intermediateValue16) & 2147483647u) > 2139095040u)) || ((floatBitsToUint(intermediateValue17) & 2147483647u) > 2139095040u);
        vec4 sampledTextureValue7 = texelFetch(inputBufferNormal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue14 = sampledTextureValue7.x;
        float scalarValue15 = sampledTextureValue7.y;
        float sumValue = 1.0 - abs(scalarValue14);
        float scalarValue16 = abs(scalarValue15);
        float sumValue1 = sumValue - scalarValue16;
        bool conditionValue = sumValue1 < 0.0;
        float comparisonValue6 = conditionValue ? ((1.0 - scalarValue16) * ((scalarValue14 >= 0.0) ? 1.0 : (-1.0))) : scalarValue14;
        float comparisonValue7 = conditionValue ? (((scalarValue15 >= 0.0) ? 1.0 : (-1.0)) * sumValue) : scalarValue15;
        float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, sumValue1), vec3(comparisonValue6, comparisonValue7, sumValue1)));
        float productValue9 = comparisonValue6 * inverseLengthValue;
        float productValue10 = comparisonValue7 * inverseLengthValue;
        float productValue11 = inverseLengthValue * sumValue1;
        vec4 sampledTextureValue8 = texelFetch(inputPrimaryViewDirection, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue17 = sampledTextureValue8.x;
        float scalarValue18 = sampledTextureValue8.y;
        float scalarValue19 = sampledTextureValue8.z;
        vec4 sampledTextureValue9 = texelFetch(inputPrimaryThroughput, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue20 = sampledTextureValue9.w;
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
        if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
        {
            intermediateValue26 = comparisonValue3;
            intermediateValue27 = comparisonValue4;
            intermediateValue28 = comparisonValue5;
        }
        else
        {
            float intermediateValue35;
            float intermediateValue36;
            float intermediateValue37;
            if (comparisonValue2)
            {
                intermediateValue35 = 0.0;
                intermediateValue36 = 0.0;
                intermediateValue37 = 0.0;
            }
            else
            {
                vec4 loadedBufferValue = imageLoad(denoisingOutputs[(floatBitsToUint(RootConstants.packedValues[0u]).x & 255u) + 0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
                float scalarValue21 = loadedBufferValue.x;
                float intermediateValue43;
                float intermediateValue44;
                float intermediateValue45;
                if (floatBitsToUint(ViewCB.packedValues[96u]).x == 0u)
                {
                    intermediateValue43 = scalarValue21;
                    intermediateValue44 = loadedBufferValue.y;
                    intermediateValue45 = loadedBufferValue.z;
                }
                else
                {
                    uint reinterpretedBits5 = floatBitsToUint(RootConstants.packedValues[0u]).x & 255u;
                    float scalarValue22 = loadedBufferValue.w;
                    vec4 loadedBufferValue1 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits5], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
                    float dotProductValue = (dot(vec3(scalarValue21, loadedBufferValue.yz), vec3(productValue9, productValue10, productValue11)) * 1.02332603931427001953125) + (scalarValue22 * 0.886225998401641845703125);
                    float quotientValue = dotProductValue * (0.564189970493316650390625 / (scalarValue22 + 9.9999999747524270787835121154785e-07));
                    float productValue12 = quotientValue * loadedBufferValue1.x;
                    float productValue13 = quotientValue * loadedBufferValue1.y;
                    float productValue14 = (dotProductValue * 2.0) - (productValue13 * 0.5);
                    float productValue15 = productValue14 - (productValue12 * 0.5);
                    intermediateValue43 = spvNMax(productValue15 + productValue12, 0.0);
                    intermediateValue44 = spvNMax(productValue14 + productValue13, 0.0);
                    intermediateValue45 = spvNMax(productValue15, 0.0);
                }
                vec4 loadedBufferValue2 = imageLoad(denoisingOutputs[((floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u) + 0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
                float scalarValue23 = loadedBufferValue2.x;
                float scalarValue24 = loadedBufferValue2.y;
                float scalarValue25 = loadedBufferValue2.z;
                bool reinterpretedBits6 = (((floatBitsToUint(intermediateValue43) & 2147483647u) > 2139095040u) || ((floatBitsToUint(intermediateValue44) & 2147483647u) > 2139095040u)) || ((floatBitsToUint(intermediateValue45) & 2147483647u) > 2139095040u);
                bool reinterpretedBits7 = ((floatBitsToUint(scalarValue25) & 2147483647u) > 2139095040u) || (((floatBitsToUint(scalarValue23) & 2147483647u) > 2139095040u) || ((floatBitsToUint(scalarValue24) & 2147483647u) > 2139095040u));
                vec4 sampledTextureValue10 = texelFetch(inputBufferColourAndMetallic, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
                float scalarValue26 = sampledTextureValue10.x;
                float scalarValue27 = sampledTextureValue10.y;
                float scalarValue28 = sampledTextureValue10.z;
                float scalarValue29 = sampledTextureValue10.w;
                float productValue16 = scalarValue26 * scalarValue26;
                float productValue17 = scalarValue27 * scalarValue27;
                float productValue18 = scalarValue28 * scalarValue28;
                vec4 sampledTextureValue11 = texelFetch(inputBufferSurfaceOpacityAndObjectCategory, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
                float sumValue2 = (-0.0) - scalarValue17;
                float sumValue3 = (-0.0) - scalarValue18;
                float sumValue4 = (-0.0) - scalarValue19;
                float productValue19 = scalarValue7 * scalarValue7;
                float productValue20 = productValue9 - (scalarValue17 * productValue19);
                float productValue21 = productValue10 - (scalarValue18 * productValue19);
                float productValue22 = productValue11 - (scalarValue19 * productValue19);
                float inverseLengthValue1 = inversesqrt(dot(vec3(productValue20, productValue21, productValue22), vec3(productValue20, productValue21, productValue22)));
                float productValue23 = ((productValue16 + (-0.039999999105930328369140625)) * scalarValue29) + 0.039999999105930328369140625;
                float productValue24 = ((productValue17 + (-0.039999999105930328369140625)) * scalarValue29) + 0.039999999105930328369140625;
                float productValue25 = ((productValue18 + (-0.039999999105930328369140625)) * scalarValue29) + 0.039999999105930328369140625;
                float dotProductValue1 = dot(vec3(sumValue2, sumValue3, sumValue4), vec3(inverseLengthValue1 * productValue20, inverseLengthValue1 * productValue21, inverseLengthValue1 * productValue22));
                float multiplyAddValue8;
                if (((uint(sampledTextureValue11.y * 255.0) & 127u) == 3u) && (floatBitsToUint(ViewCB.packedValues[54u]).w != 0u))
                {
                    multiplyAddValue8 = spvNClamp(fma(dotProductValue1, 2.9359951019287109375, -1.93599522113800048828125), 0.0, 1.0);
                }
                else
                {
                    multiplyAddValue8 = dotProductValue1;
                }
                float dotProductValue2 = spvNClamp(dot(vec3(productValue23, productValue24, productValue25), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
                float sumValue5 = dotProductValue2 - productValue23;
                float sumValue6 = dotProductValue2 - productValue24;
                float sumValue7 = dotProductValue2 - productValue25;
                float exponentialValue = exp2(log2(spvNClamp(1.0 - multiplyAddValue8, 0.0, 1.0)) * 5.0);
                float productValue26 = (exponentialValue * sumValue5) + productValue23;
                float productValue27 = (exponentialValue * sumValue6) + productValue24;
                float productValue28 = (exponentialValue * sumValue7) + productValue25;
                float inverseLengthValue2 = inversesqrt(dot(vec3(productValue9, productValue10, productValue11), vec3(productValue9, productValue10, productValue11)));
                float productValue29 = inverseLengthValue2 * productValue9;
                float productValue30 = inverseLengthValue2 * productValue10;
                float productValue31 = inverseLengthValue2 * productValue11;
                vec4 sampledTextureValue12 = texelFetch(shadowDenoisingInputs[((floatBitsToUint(RootConstants.packedValues[0u]).x >> 16u) & 255u) + 0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
                float scalarValue30 = sampledTextureValue12.x;
                float productValue69;
                float productValue70;
                float productValue71;
                float productValue72;
                float productValue73;
                float productValue74;
                if (dot(vec3(scalarValue30, sampledTextureValue12.yz), vec3(1.0)) > 0.0)
                {
                    float scalarValue31 = spvNMax(scalarValue7, 0.00999999977648258209228515625);
                    float sumValue8 = ViewCB.packedValues[52u].x - scalarValue17;
                    float sumValue9 = ViewCB.packedValues[52u].y - scalarValue18;
                    float sumValue10 = ViewCB.packedValues[52u].z - scalarValue19;
                    float inverseLengthValue3 = inversesqrt(dot(vec3(sumValue8, sumValue9, sumValue10), vec3(sumValue8, sumValue9, sumValue10)));
                    float productValue35 = inverseLengthValue3 * sumValue8;
                    float productValue36 = inverseLengthValue3 * sumValue9;
                    float productValue37 = inverseLengthValue3 * sumValue10;
                    float dotProductValue3 = spvNClamp(dot(vec3(productValue29, productValue30, productValue31), vec3(ViewCB.packedValues[52u].xyz)), 0.0, 1.0);
                    float dotProductValue4 = spvNClamp(dot(vec3(productValue29, productValue30, productValue31), vec3(sumValue2, sumValue3, sumValue4)), 0.0, 1.0);
                    float dotProductValue5 = spvNClamp(dot(vec3(productValue29, productValue30, productValue31), vec3(productValue35, productValue36, productValue37)), 0.0, 1.0);
                    float dotProductValue6 = spvNClamp(dot(vec3(sumValue2, sumValue3, sumValue4), vec3(productValue35, productValue36, productValue37)), 0.0, 1.0);
                    float productValue38 = scalarValue31 * scalarValue31;
                    float productValue39 = productValue38 * productValue38;
                    float productValue43 = (((dotProductValue5 * productValue39) - dotProductValue5) * dotProductValue5) + 1.0;
                    float productValue44 = productValue38 * 0.5;
                    float sumValue11 = 1.0 - productValue44;
                    float exponentialValue1 = exp2(log2(spvNClamp(1.0 - dotProductValue6, 0.0, 1.0)) * 5.0);
                    float productValue45 = (exponentialValue1 * sumValue5) + productValue23;
                    float productValue46 = (exponentialValue1 * sumValue6) + productValue24;
                    float productValue47 = (exponentialValue1 * sumValue7) + productValue25;
                    float productValue48 = ((dotProductValue6 * dotProductValue6) * (scalarValue31 * 2.0)) + (-0.5);
                    float exponentialValue2 = (((exp2(log2(spvNClamp(1.0 - dotProductValue4, 0.0, 1.0)) * 5.0) * productValue48) + 1.0) * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - dotProductValue3, 0.0, 1.0)) * 5.0) * productValue48) + 1.0);
                    float sampledTextureValue13 = dotProductValue3 * uintBitsToFloat(texelFetch(inputIncidentLight, int(0u)).x);
                    float productValue49 = (ViewCB.packedValues[50u].x * scalarValue30) * sampledTextureValue13;
                    float quotientValue1 = (0.25 / ((((dotProductValue4 * sumValue11) + productValue44) * ((dotProductValue3 * sumValue11) + productValue44)) + 1.0000000133514319600180897396058e-10)) * ((productValue39 / ((productValue43 * productValue43) + 1.0000000133514319600180897396058e-10)) * 0.3183098733425140380859375);
                    float productValue50 = (ViewCB.packedValues[50u].y * sampledTextureValue12.y) * sampledTextureValue13;
                    float productValue51 = (ViewCB.packedValues[50u].z * sampledTextureValue12.z) * sampledTextureValue13;
                    productValue69 = (quotientValue1 * productValue49) * productValue45;
                    productValue70 = (quotientValue1 * productValue50) * productValue46;
                    productValue71 = (quotientValue1 * productValue51) * productValue47;
                    productValue72 = ((1.0 - productValue45) * productValue49) * exponentialValue2;
                    productValue73 = ((1.0 - productValue46) * productValue50) * exponentialValue2;
                    productValue74 = ((1.0 - productValue47) * productValue51) * exponentialValue2;
                }
                else
                {
                    productValue69 = 0.0;
                    productValue70 = 0.0;
                    productValue71 = 0.0;
                    productValue72 = 0.0;
                    productValue73 = 0.0;
                    productValue74 = 0.0;
                }
                uint sumValue12 = 8u + 2u;
                float sampledTextureValue14 = spvNClamp(fma(uintBitsToFloat(uvec3(intermediateValue63, intermediateValue64, texelFetch(inputIncidentLight, int(sumValue12)).x)).z, 0.25, -2.5), 0.0, 1.0) * 0.0500000007450580596923828125;
                float dotProductValue7 = (((ViewCB.packedValues[59u].w * (1.0 - sampledTextureValue14)) + sampledTextureValue14) * 5.0) * ((exp2(log2(spvNMax((-0.0) - dot(vec3(scalarValue17, scalarValue18, scalarValue19), vec3(productValue29, productValue30, productValue31)), 0.0)) * 1.10000002384185791015625) * 0.800000011920928955078125) + 0.20000000298023223876953125);
                float productValue55 = sampledTextureValue11.x * (1.0 - scalarValue29);
                intermediateValue35 = (productValue69 + (productValue26 * (reinterpretedBits7 ? 0.0 : scalarValue23))) + ((productValue55 * productValue16) * ((productValue72 + ((1.0 - productValue26) * (reinterpretedBits6 ? 0.0 : intermediateValue43))) + dotProductValue7));
                intermediateValue36 = (productValue70 + (productValue27 * (reinterpretedBits7 ? 0.0 : scalarValue24))) + ((productValue55 * productValue17) * ((productValue73 + ((1.0 - productValue27) * (reinterpretedBits6 ? 0.0 : intermediateValue44))) + dotProductValue7));
                intermediateValue37 = (productValue71 + (productValue28 * (reinterpretedBits7 ? 0.0 : scalarValue25))) + ((productValue55 * productValue18) * ((productValue74 + ((1.0 - productValue28) * (reinterpretedBits6 ? 0.0 : intermediateValue45))) + dotProductValue7));
            }
            float comparisonValue8 = comparisonValue2 ? sampledTextureValue.x : 0.0;
            float comparisonValue9 = comparisonValue2 ? sampledTextureValue.y : 0.0;
            float comparisonValue10 = comparisonValue2 ? sampledTextureValue.z : 0.0;
            float sumValue13 = intermediateValue35 + comparisonValue3;
            float sumValue14 = intermediateValue36 + comparisonValue4;
            float sumValue15 = intermediateValue37 + comparisonValue5;
            bool comparisonValue11 = (uint(scalarValue20) & 240u) == 0u;
            float intermediateValue39;
            float intermediateValue40;
            float intermediateValue41;
            if (comparisonValue11)
            {
                intermediateValue39 = sumValue13;
                intermediateValue40 = sumValue14;
                intermediateValue41 = sumValue15;
            }
            else
            {
                uvec4 reinterpretedBits8 = floatBitsToUint(ViewCB.packedValues[76u]);
                uint scalarValue32 = reinterpretedBits8.w;
                float intermediateValue57;
                float intermediateValue58;
                float intermediateValue59;
                if (scalarValue32 == 1u)
                {
                    intermediateValue57 = ViewCB.packedValues[58u].x;
                    intermediateValue58 = ViewCB.packedValues[58u].y;
                    intermediateValue59 = ViewCB.packedValues[58u].z;
                }
                else
                {
                    float branchMergedValue1;
                    float branchMergedValue5;
                    float branchMergedValue6;
                    if (scalarValue32 == 2u)
                    {
                        uvec4 vectorValue = floatBitsToUint(ViewCB.packedValues[74u]);
                        uint scalarValue33 = vectorValue.z;
                        uint reinterpretedBits11;
                        if (scalarValue33 > 4095u)
                        {
                            reinterpretedBits11 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits11 = scalarValue33;
                        }
                        float scalarValue34 = abs(scalarValue17);
                        float scalarValue35 = abs(scalarValue18);
                        float scalarValue36 = abs(scalarValue19);
                        float intermediateValue100;
                        float comparisonValue18;
                        float sumValue19;
                        if ((scalarValue34 >= scalarValue35) && (scalarValue34 >= scalarValue36))
                        {
                            intermediateValue100 = scalarValue34;
                            comparisonValue18 = (scalarValue17 < 0.0) ? ((-0.0) - scalarValue19) : scalarValue19;
                            sumValue19 = (-0.0) - scalarValue18;
                        }
                        else
                        {
                            float sumValue16 = (-0.0) - scalarValue17;
                            float branchMergedValue3;
                            float branchMergedValue9;
                            float branchMergedValue10;
                            if (!(scalarValue35 >= scalarValue36))
                            {
                                branchMergedValue3 = scalarValue36;
                                branchMergedValue9 = (-0.0) - scalarValue18;
                                branchMergedValue10 = (scalarValue19 < 0.0) ? scalarValue17 : sumValue16;
                            }
                            else
                            {
                                branchMergedValue3 = scalarValue35;
                                branchMergedValue9 = (scalarValue18 < 0.0) ? ((-0.0) - scalarValue19) : scalarValue19;
                                branchMergedValue10 = sumValue16;
                            }
                            intermediateValue100 = branchMergedValue3;
                            comparisonValue18 = branchMergedValue10;
                            sumValue19 = branchMergedValue9;
                        }
                        precise float quotientValue2 = 0.5 / intermediateValue100;
                        vec4 sampledTextureValue15 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits11 + 0u], linearSampler)), vec2(fract(fma(comparisonValue18, quotientValue2, 0.5) * ViewCB.packedValues[74u].x), fract(fma(sumValue19, quotientValue2, 0.5) * ViewCB.packedValues[74u].y)), 0.0);
                        branchMergedValue1 = (ViewCB.packedValues[58u].z * sampledTextureValue15.z) * ViewCB.packedValues[97u].w;
                        branchMergedValue5 = (ViewCB.packedValues[58u].x * sampledTextureValue15.x) * ViewCB.packedValues[97u].w;
                        branchMergedValue6 = (ViewCB.packedValues[58u].y * sampledTextureValue15.y) * ViewCB.packedValues[97u].w;
                    }
                    else
                    {
                        float branchMergedValue13;
                        float branchMergedValue15;
                        float branchMergedValue16;
                        if (scalarValue32 == 4u)
                        {
                            float scalarValue37 = (dot(vec3(scalarValue17, scalarValue18, scalarValue19), vec3(ViewCB.packedValues[52u].xyz)) * 0.5) + 0.5;
                            branchMergedValue13 = ((ViewCB.packedValues[75u].z - ViewCB.packedValues[76u].z) * scalarValue37) + ViewCB.packedValues[76u].z;
                            branchMergedValue15 = ((ViewCB.packedValues[75u].x - ViewCB.packedValues[76u].x) * scalarValue37) + ViewCB.packedValues[76u].x;
                            branchMergedValue16 = ((ViewCB.packedValues[75u].y - ViewCB.packedValues[76u].y) * scalarValue37) + ViewCB.packedValues[76u].y;
                        }
                        else
                        {
                            float comparisonValue14;
                            if (abs(scalarValue18) < 1.0)
                            {
                                float quotientValue3 = atan(scalarValue19 / scalarValue17);
                                bool conditionValue1 = scalarValue17 < 0.0;
                                bool comparisonValue12 = scalarValue17 == 0.0;
                                bool comparisonValue13 = scalarValue19 >= 0.0;
                                bool conditionValue2 = scalarValue19 < 0.0;
                                comparisonValue14 = (comparisonValue12 && comparisonValue13) ? 1.57079637050628662109375 : ((comparisonValue12 && conditionValue2) ? (-1.57079637050628662109375) : ((conditionValue1 && conditionValue2) ? (quotientValue3 + (-3.1415927410125732421875)) : ((conditionValue1 && comparisonValue13) ? (quotientValue3 + 3.1415927410125732421875) : quotientValue3)));
                            }
                            else
                            {
                                comparisonValue14 = 0.0;
                            }
                            float multiplyAddValue = fma(abs((fract((comparisonValue14 - ViewCB.packedValues[50u].w) * 0.15915493667125701904296875) * 2.0) + (-1.0)), 0.984375, 0.0078125);
                            float multiplyAddValue1 = fma(0.5 - (asin(scalarValue18) * 0.3183098733425140380859375), 0.96875, 0.015625);
                            float productValue56 = ViewCB.packedValues[51u].w * 7.0;
                            float scalarValue38 = fract(productValue56);
                            uint scalarValue39 = uint(int(floor(productValue56)));
                            float productValue57 = float(int(scalarValue39 + 1u)) * 0.125;
                            float scalarValue40 = fract(abs(productValue57));
                            vec4 sampledTextureValue16 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue, multiplyAddValue1, float(int(scalarValue39))), 0.0);
                            float scalarValue41 = sampledTextureValue16.x;
                            float scalarValue42 = sampledTextureValue16.y;
                            float scalarValue43 = sampledTextureValue16.z;
                            float productValue58 = scalarValue41 * scalarValue41;
                            float productValue59 = scalarValue42 * scalarValue42;
                            float productValue60 = scalarValue43 * scalarValue43;
                            vec4 sampledTextureValue17 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue, multiplyAddValue1, float(int(uint(int(((productValue57 >= ((-0.0) - productValue57)) ? scalarValue40 : ((-0.0) - scalarValue40)) * 8.0))))), 0.0);
                            float scalarValue44 = sampledTextureValue17.x;
                            float scalarValue45 = sampledTextureValue17.y;
                            float scalarValue46 = sampledTextureValue17.z;
                            float dotProductValue8 = exp2(log2(spvNMax(dot(vec3(scalarValue17, scalarValue18, scalarValue19), vec3(ViewCB.packedValues[52u].xyz)), 0.0)) * 7.0);
                            float productValue61 = dotProductValue8 * 0.0500000007450580596923828125;
                            float productValue62 = ((((scalarValue44 * scalarValue44) - productValue58) * scalarValue38) + productValue58) + (productValue61 * ViewCB.packedValues[50u].x);
                            float productValue63 = ((((scalarValue45 * scalarValue45) - productValue59) * scalarValue38) + productValue59) + (productValue61 * ViewCB.packedValues[50u].y);
                            float productValue64 = ((((scalarValue46 * scalarValue46) - productValue60) * scalarValue38) + productValue60) + (productValue61 * ViewCB.packedValues[50u].z);
                            float productValue65 = (dotProductValue8 * 0.64999997615814208984375) + 0.3499999940395355224609375;
                            branchMergedValue13 = ((((ViewCB.packedValues[58u].z * productValue65) - productValue64) * ViewCB.packedValues[58u].w) + productValue64) * ViewCB.packedValues[97u].w;
                            branchMergedValue15 = ((((ViewCB.packedValues[58u].x * productValue65) - productValue62) * ViewCB.packedValues[58u].w) + productValue62) * ViewCB.packedValues[97u].w;
                            branchMergedValue16 = ((((ViewCB.packedValues[58u].y * productValue65) - productValue63) * ViewCB.packedValues[58u].w) + productValue63) * ViewCB.packedValues[97u].w;
                        }
                        branchMergedValue1 = branchMergedValue13;
                        branchMergedValue5 = branchMergedValue15;
                        branchMergedValue6 = branchMergedValue16;
                    }
                    intermediateValue57 = branchMergedValue5;
                    intermediateValue58 = branchMergedValue6;
                    intermediateValue59 = branchMergedValue1;
                }
                float sampledTextureValue18 = uintBitsToFloat(texelFetch(inputIncidentLight, int(0u)).x);
                float multiplyAddValue2 = spvNClamp(fma(scalarValue2, ViewCB.packedValues[51u].x, ViewCB.packedValues[51u].y), 0.0, 1.0);
                intermediateValue39 = (sumValue13 + comparisonValue8) + (multiplyAddValue2 * ((sampledTextureValue18 * intermediateValue57) - sumValue13));
                intermediateValue40 = (sumValue14 + comparisonValue9) + (multiplyAddValue2 * ((sampledTextureValue18 * intermediateValue58) - sumValue14));
                intermediateValue41 = (sumValue15 + comparisonValue10) + (multiplyAddValue2 * ((sampledTextureValue18 * intermediateValue59) - sumValue15));
            }
            float productValue66 = intermediateValue39 * sampledTextureValue9.x;
            float productValue67 = intermediateValue40 * sampledTextureValue9.y;
            float productValue68 = intermediateValue41 * sampledTextureValue9.z;
            float multiplyAddValue3 = spvNClamp(fma(scalarValue3, ViewCB.packedValues[51u].x, ViewCB.packedValues[51u].y), 0.0, 1.0);
            float productValue40;
            float productValue41;
            float productValue42;
            if (multiplyAddValue3 > 0.0)
            {
                float productValue75 = (((ViewCB.packedValues[78u].z * ViewCB.packedValues[81u].z) + productValue1) * 2.0) + (-1.0);
                float productValue76 = (1.0 - (productValue2 * 2.0)) - ((ViewCB.packedValues[81u].w * 2.0) * ViewCB.packedValues[78u].w);
                float multiplyAddValue4 = fma(0.5, ViewCB.packedValues[22u].w, fma(productValue76, ViewCB.packedValues[21u].w, productValue75 * ViewCB.packedValues[20u].w)) + ViewCB.packedValues[23u].w;
                float multiplyAddValue5 = ((fma(0.5, ViewCB.packedValues[22u].x, fma(productValue76, ViewCB.packedValues[21u].x, productValue75 * ViewCB.packedValues[20u].x)) + ViewCB.packedValues[23u].x) / multiplyAddValue4) - ViewCB.packedValues[72u].x;
                float multiplyAddValue6 = ((fma(0.5, ViewCB.packedValues[22u].y, fma(productValue76, ViewCB.packedValues[21u].y, productValue75 * ViewCB.packedValues[20u].y)) + ViewCB.packedValues[23u].y) / multiplyAddValue4) - ViewCB.packedValues[72u].y;
                float multiplyAddValue7 = ((fma(0.5, ViewCB.packedValues[22u].z, fma(productValue76, ViewCB.packedValues[21u].z, productValue75 * ViewCB.packedValues[20u].z)) + ViewCB.packedValues[23u].z) / multiplyAddValue4) - ViewCB.packedValues[72u].z;
                float inverseLengthValue4 = inversesqrt(dot(vec3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), vec3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
                float productValue77 = multiplyAddValue5 * inverseLengthValue4;
                float productValue78 = multiplyAddValue6 * inverseLengthValue4;
                float productValue79 = multiplyAddValue7 * inverseLengthValue4;
                uvec4 reinterpretedBits9 = floatBitsToUint(ViewCB.packedValues[76u]);
                uint scalarValue47 = reinterpretedBits9.w;
                float intermediateValue65;
                float intermediateValue66;
                float intermediateValue67;
                if (scalarValue47 == 1u)
                {
                    intermediateValue65 = ViewCB.packedValues[58u].x;
                    intermediateValue66 = ViewCB.packedValues[58u].y;
                    intermediateValue67 = ViewCB.packedValues[58u].z;
                }
                else
                {
                    float branchMergedValue2;
                    float branchMergedValue7;
                    float branchMergedValue8;
                    if (scalarValue47 == 2u)
                    {
                        uvec4 vectorValue1 = floatBitsToUint(ViewCB.packedValues[74u]);
                        uint scalarValue48 = vectorValue1.z;
                        uint reinterpretedBits12;
                        if (scalarValue48 > 4095u)
                        {
                            reinterpretedBits12 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits12 = scalarValue48;
                        }
                        float scalarValue49 = abs(productValue77);
                        float scalarValue50 = abs(productValue78);
                        float scalarValue51 = abs(productValue79);
                        float comparisonValue19;
                        float sumValue20;
                        float intermediateValue101;
                        if ((scalarValue49 >= scalarValue50) && (scalarValue49 >= scalarValue51))
                        {
                            comparisonValue19 = (productValue77 < 0.0) ? ((-0.0) - productValue79) : productValue79;
                            sumValue20 = (-0.0) - productValue78;
                            intermediateValue101 = scalarValue49;
                        }
                        else
                        {
                            float sumValue17 = (-0.0) - productValue77;
                            float branchMergedValue4;
                            float branchMergedValue11;
                            float branchMergedValue12;
                            if (!(scalarValue50 >= scalarValue51))
                            {
                                branchMergedValue4 = scalarValue51;
                                branchMergedValue11 = (-0.0) - productValue78;
                                branchMergedValue12 = (productValue79 < 0.0) ? productValue77 : sumValue17;
                            }
                            else
                            {
                                branchMergedValue4 = scalarValue50;
                                branchMergedValue11 = (productValue78 < 0.0) ? ((-0.0) - productValue79) : productValue79;
                                branchMergedValue12 = sumValue17;
                            }
                            comparisonValue19 = branchMergedValue12;
                            sumValue20 = branchMergedValue11;
                            intermediateValue101 = branchMergedValue4;
                        }
                        precise float quotientValue4 = 0.5 / intermediateValue101;
                        vec4 sampledTextureValue19 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits12 + 0u], linearSampler)), vec2(fract(fma(comparisonValue19, quotientValue4, 0.5) * ViewCB.packedValues[74u].x), fract(fma(sumValue20, quotientValue4, 0.5) * ViewCB.packedValues[74u].y)), 0.0);
                        branchMergedValue2 = (ViewCB.packedValues[58u].z * sampledTextureValue19.z) * ViewCB.packedValues[97u].w;
                        branchMergedValue7 = (ViewCB.packedValues[58u].y * sampledTextureValue19.y) * ViewCB.packedValues[97u].w;
                        branchMergedValue8 = (ViewCB.packedValues[58u].x * sampledTextureValue19.x) * ViewCB.packedValues[97u].w;
                    }
                    else
                    {
                        float branchMergedValue14;
                        float branchMergedValue17;
                        float branchMergedValue18;
                        if (scalarValue47 == 4u)
                        {
                            float scalarValue52 = (dot(vec3(productValue77, productValue78, productValue79), vec3(ViewCB.packedValues[52u].xyz)) * 0.5) + 0.5;
                            branchMergedValue14 = ((ViewCB.packedValues[75u].z - ViewCB.packedValues[76u].z) * scalarValue52) + ViewCB.packedValues[76u].z;
                            branchMergedValue17 = ((ViewCB.packedValues[75u].y - ViewCB.packedValues[76u].y) * scalarValue52) + ViewCB.packedValues[76u].y;
                            branchMergedValue18 = ((ViewCB.packedValues[75u].x - ViewCB.packedValues[76u].x) * scalarValue52) + ViewCB.packedValues[76u].x;
                        }
                        else
                        {
                            float comparisonValue17;
                            if (abs(productValue78) < 1.0)
                            {
                                float quotientValue5 = atan(productValue79 / productValue77);
                                bool conditionValue3 = productValue77 < 0.0;
                                bool comparisonValue15 = productValue77 == 0.0;
                                bool comparisonValue16 = productValue79 >= 0.0;
                                bool conditionValue4 = productValue79 < 0.0;
                                comparisonValue17 = (comparisonValue15 && comparisonValue16) ? 1.57079637050628662109375 : ((comparisonValue15 && conditionValue4) ? (-1.57079637050628662109375) : ((conditionValue3 && conditionValue4) ? (quotientValue5 + (-3.1415927410125732421875)) : ((conditionValue3 && comparisonValue16) ? (quotientValue5 + 3.1415927410125732421875) : quotientValue5)));
                            }
                            else
                            {
                                comparisonValue17 = 0.0;
                            }
                            float multiplyAddValue9 = fma(abs((fract((comparisonValue17 - ViewCB.packedValues[50u].w) * 0.15915493667125701904296875) * 2.0) + (-1.0)), 0.984375, 0.0078125);
                            float multiplyAddValue10 = fma(0.5 - (asin(productValue78) * 0.3183098733425140380859375), 0.96875, 0.015625);
                            float productValue80 = ViewCB.packedValues[51u].w * 7.0;
                            float scalarValue53 = fract(productValue80);
                            uint scalarValue54 = uint(int(floor(productValue80)));
                            float productValue81 = float(int(scalarValue54 + 1u)) * 0.125;
                            float scalarValue55 = fract(abs(productValue81));
                            vec4 sampledTextureValue20 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue9, multiplyAddValue10, float(int(scalarValue54))), 0.0);
                            float scalarValue56 = sampledTextureValue20.x;
                            float scalarValue57 = sampledTextureValue20.y;
                            float scalarValue58 = sampledTextureValue20.z;
                            float productValue82 = scalarValue56 * scalarValue56;
                            float productValue83 = scalarValue57 * scalarValue57;
                            float productValue84 = scalarValue58 * scalarValue58;
                            vec4 sampledTextureValue21 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue9, multiplyAddValue10, float(int(uint(int(((productValue81 >= ((-0.0) - productValue81)) ? scalarValue55 : ((-0.0) - scalarValue55)) * 8.0))))), 0.0);
                            float scalarValue59 = sampledTextureValue21.x;
                            float scalarValue60 = sampledTextureValue21.y;
                            float scalarValue61 = sampledTextureValue21.z;
                            float dotProductValue9 = exp2(log2(spvNMax(dot(vec3(productValue77, productValue78, productValue79), vec3(ViewCB.packedValues[52u].xyz)), 0.0)) * 7.0);
                            float productValue85 = dotProductValue9 * 0.0500000007450580596923828125;
                            float productValue86 = ((((scalarValue59 * scalarValue59) - productValue82) * scalarValue53) + productValue82) + (productValue85 * ViewCB.packedValues[50u].x);
                            float productValue87 = ((((scalarValue60 * scalarValue60) - productValue83) * scalarValue53) + productValue83) + (productValue85 * ViewCB.packedValues[50u].y);
                            float productValue88 = ((((scalarValue61 * scalarValue61) - productValue84) * scalarValue53) + productValue84) + (productValue85 * ViewCB.packedValues[50u].z);
                            float productValue89 = (dotProductValue9 * 0.64999997615814208984375) + 0.3499999940395355224609375;
                            branchMergedValue14 = ((((ViewCB.packedValues[58u].z * productValue89) - productValue88) * ViewCB.packedValues[58u].w) + productValue88) * ViewCB.packedValues[97u].w;
                            branchMergedValue17 = ((((ViewCB.packedValues[58u].y * productValue89) - productValue87) * ViewCB.packedValues[58u].w) + productValue87) * ViewCB.packedValues[97u].w;
                            branchMergedValue18 = ((((ViewCB.packedValues[58u].x * productValue89) - productValue86) * ViewCB.packedValues[58u].w) + productValue86) * ViewCB.packedValues[97u].w;
                        }
                        branchMergedValue2 = branchMergedValue14;
                        branchMergedValue7 = branchMergedValue17;
                        branchMergedValue8 = branchMergedValue18;
                    }
                    intermediateValue65 = branchMergedValue8;
                    intermediateValue66 = branchMergedValue7;
                    intermediateValue67 = branchMergedValue2;
                }
                float sampledTextureValue22 = uintBitsToFloat(texelFetch(inputIncidentLight, int(0u)).x);
                vec4 sampledTextureValue23 = textureLod(sampler3D(volumetricResolvedTransmission, linearSampler), vec3(productValue1, productValue2, 1.0), 0.0);
                float productValue90 = (sampledTextureValue22 * intermediateValue65) * sampledTextureValue23.x;
                float productValue91 = (sampledTextureValue22 * intermediateValue66) * sampledTextureValue23.y;
                float productValue92 = (sampledTextureValue22 * intermediateValue67) * sampledTextureValue23.z;
                productValue40 = (((productValue90 - productValue66) + ((ViewCB.packedValues[77u].x - productValue90) * ViewCB.packedValues[77u].w)) * multiplyAddValue3) + productValue66;
                productValue41 = (((productValue91 - productValue67) + ((ViewCB.packedValues[77u].y - productValue91) * ViewCB.packedValues[77u].w)) * multiplyAddValue3) + productValue67;
                productValue42 = (((productValue92 - productValue68) + ((ViewCB.packedValues[77u].z - productValue92) * ViewCB.packedValues[77u].w)) * multiplyAddValue3) + productValue68;
            }
            else
            {
                productValue40 = productValue66;
                productValue41 = productValue67;
                productValue42 = productValue68;
            }
            intermediateValue26 = comparisonValue11 ? (productValue40 + comparisonValue8) : productValue40;
            intermediateValue27 = comparisonValue11 ? (productValue41 + comparisonValue9) : productValue41;
            intermediateValue28 = comparisonValue11 ? (productValue42 + comparisonValue10) : productValue42;
        }
        uvec4 reinterpretedBits10 = floatBitsToUint(ViewCB.packedValues[91u]);
        float intermediateValue29;
        float intermediateValue30;
        float intermediateValue31;
        if (reinterpretedBits10.y == 0u)
        {
            intermediateValue29 = intermediateValue26;
            intermediateValue30 = intermediateValue27;
            intermediateValue31 = intermediateValue28;
        }
        else
        {
            vec4 loadedBufferValue3 = imageLoad(outputBufferReferencePathTracer, ivec2(uvec2(comparisonValue1, gl_GlobalInvocationID.y)));
            float scalarValue62 = loadedBufferValue3.x;
            float scalarValue63 = loadedBufferValue3.y;
            float scalarValue64 = loadedBufferValue3.z;
            float quotientValue6 = 1.0 / float(reinterpretedBits10.x);
            float productValue93 = ((intermediateValue26 - scalarValue62) * quotientValue6) + scalarValue62;
            float productValue94 = ((intermediateValue27 - scalarValue63) * quotientValue6) + scalarValue63;
            float productValue95 = ((intermediateValue28 - scalarValue64) * quotientValue6) + scalarValue64;
            imageStore(outputBufferReferencePathTracer, ivec2(uvec2(comparisonValue1, gl_GlobalInvocationID.y)), vec4(productValue93, productValue94, productValue95, 0.0));
            intermediateValue29 = productValue93;
            intermediateValue30 = productValue94;
            intermediateValue31 = productValue95;
        }
        float multiplyAddValue11 = fma(intermediateValue29, reinterpretedBits4 ? 0.0 : intermediateValue15, reinterpretedBits3 ? 0.0 : productValue6);
        float multiplyAddValue12 = fma(intermediateValue30, reinterpretedBits4 ? 0.0 : intermediateValue16, reinterpretedBits3 ? 0.0 : productValue7);
        float multiplyAddValue13 = fma(intermediateValue31, reinterpretedBits4 ? 0.0 : intermediateValue17, reinterpretedBits3 ? 0.0 : productValue8);
        float productValue32;
        float productValue33;
        float productValue34;
        if ((floatBitsToUint(ViewCB.packedValues[95u]).w == 0u) && (ViewCB.packedValues[78u].x < ViewCB.packedValues[79u].x))
        {
            productValue32 = spvNMax(multiplyAddValue11 * 0.25, 0.0);
            productValue33 = spvNMax(multiplyAddValue12 * 0.25, 0.0);
            productValue34 = spvNMax(multiplyAddValue13 * 0.25, 0.0);
        }
        else
        {
            uint sumValue18 = 0u + 1u;
            vec2 sampledTextureValue24 = uintBitsToFloat(uvec2(texelFetch(inputIncidentLight, int(0u)).x, texelFetch(inputIncidentLight, int(sumValue18)).x));
            float quotientValue7 = sampledTextureValue24.y / sampledTextureValue24.x;
            productValue32 = quotientValue7 * multiplyAddValue11;
            productValue33 = quotientValue7 * multiplyAddValue12;
            productValue34 = quotientValue7 * multiplyAddValue13;
        }
        float productValue52;
        float productValue53;
        float productValue54;
        if (imageLoad(outputBufferDebug, ivec2(uvec2(0u))).w != 0.0)
        {
            float productValue96 = spvNClamp(productValue32, 0.0, 1.0) * 0.00999999977648258209228515625;
            float productValue97 = spvNClamp(productValue33, 0.0, 1.0) * 0.00999999977648258209228515625;
            float productValue98 = spvNClamp(productValue34, 0.0, 1.0) * 0.00999999977648258209228515625;
            vec4 loadedBufferValue4 = imageLoad(outputBufferDebug, ivec2(uvec2(comparisonValue1, gl_GlobalInvocationID.y)));
            float scalarValue65 = loadedBufferValue4.w;
            productValue52 = ((loadedBufferValue4.x - productValue96) * scalarValue65) + productValue96;
            productValue53 = ((loadedBufferValue4.y - productValue97) * scalarValue65) + productValue97;
            productValue54 = ((loadedBufferValue4.z - productValue98) * scalarValue65) + productValue98;
        }
        else
        {
            productValue52 = productValue32;
            productValue53 = productValue33;
            productValue54 = productValue34;
        }
        if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
        {
            imageStore(outputBufferFinal, ivec2(uvec2(comparisonValue1, gl_GlobalInvocationID.y)), vec4(productValue52, productValue53, productValue54, 0.0));
        }
        else
        {
            imageStore(outputBufferPreInterleave, ivec2(uvec2(comparisonValue1, gl_GlobalInvocationID.y)), vec4(productValue52, productValue53, productValue54, scalarValue20));
            imageStore(outputBufferReflectionMotionVectors, ivec2(uvec2(comparisonValue1, gl_GlobalInvocationID.y)), vec4(texelFetch(inputBufferMotionVectors, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).xyxx));
        }
    }
}
