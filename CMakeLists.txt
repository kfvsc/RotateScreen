cmake_minimum_required(VERSION 3.19)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/config.json CONFIG)

string(JSON APP_NAME GET ${CONFIG} name)
string(JSON APP_VERSION GET ${CONFIG} version)

project(${APP_NAME}
    VERSION ${APP_VERSION}
    LANGUAGES CXX OBJC OBJCXX
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
qt_standard_project_setup()

if(IOS)
    string(JSON IOS_BUNDLE GET ${CONFIG} ios bundleIdentifier)
    string(JSON IOS_DEPLOYMENT_TARGET GET ${CONFIG} ios deploymentTarget)
    string(JSON IOS_DEVICE_FAMILY GET ${CONFIG} ios deviceFamily)

    set(CMAKE_XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER ${IOS_BUNDLE})
    set(CMAKE_XCODE_ATTRIBUTE_MARKETING_VERSION ${PROJECT_VERSION})
    set(CMAKE_XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET ${IOS_DEPLOYMENT_TARGET})
    set(CMAKE_XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${IOS_DEVICE_FAMILY}) # 1,2 - iPhone + iPad

    add_subdirectory(ios)
endif()

add_subdirectory(native)
