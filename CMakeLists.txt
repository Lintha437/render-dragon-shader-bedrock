cmake_minimum_required(VERSION 3.20)
project(RenderDragonShaderProject LANGUAGES NONE)
if(NOT DEFINED Python3_EXECUTABLE AND EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/.venv/Scripts/python.exe")
    set(Python3_EXECUTABLE "${CMAKE_CURRENT_SOURCE_DIR}/.venv/Scripts/python.exe")
endif()
find_package(Python3 REQUIRED COMPONENTS Interpreter)
add_custom_target(shaders
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/build.py"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    COMMENT "Compile all unique HLSL and GLSL material programs"
    USES_TERMINAL)
add_custom_target(verify
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/verify.py"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    COMMENT "Verify all material permutations, source names and build outputs"
    USES_TERMINAL)
add_custom_target(materials
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/audit_native_interfaces.py"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/audit_runtime_contracts.py"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/audit_native_pipelines.py"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/pack_materials.py"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    COMMENT "Package rebuilt native shaders into the original material.bin containers"
    USES_TERMINAL)
add_dependencies(materials shaders)
add_dependencies(verify shaders)
add_dependencies(materials verify)
