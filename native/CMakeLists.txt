set(APP_TARGET ${PROJECT_NAME})

set(PROJECT_SOURCES
    main.cpp
    main.h
    FPSMeter/fpsmeter.cpp
    FPSMeter/fpsmeter.h
)

if(IOS)
    set(APP_TARGET ${PROJECT_NAME}EntryPoint)

    list(APPEND PROJECT_SOURCES ../ios/setUIView.mm)

    qt_add_library(${APP_TARGET} STATIC
        ${PROJECT_SOURCES}
    )

    target_include_directories(${APP_TARGET} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
else()
    set(APP_TARGET ${PROJECT_NAME})

    qt_add_resources(RESOURCES
        res/res.qrc
    )

    qt_add_executable(${APP_TARGET}
        ${PROJECT_SOURCES}
        ${RESOURCES}
    )
endif()

qt_import_qml_plugins(${APP_TARGET})

target_link_libraries(${APP_TARGET} PRIVATE
    Qt6::Quick
)
