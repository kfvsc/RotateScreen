set(APP_TARGET ${PROJECT_NAME})

qt_add_resources(RESOURCES
    ../native/res/res.qrc
)

add_executable(${APP_TARGET}
    main.m
    ViewController.h
    ViewController.mm
    ${RESOURCES}
)

target_link_libraries(${APP_TARGET} PRIVATE
    ${PROJECT_NAME}EntryPoint
    "-framework UIKit"
)

SET_TARGET_PROPERTIES(${APP_TARGET} PROPERTIES
    qt_no_entrypoint ON
)

SET_TARGET_PROPERTIES(${APP_TARGET} PROPERTIES
    MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_LIST_DIR}/Info.plist"
    MACOSX_BUNDLE TRUE
    XCODE_ATTRIBUTE_INSTALL_PATH "$(LOCAL_APPS_DIR)"
    XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME "AppIcon"
)

target_sources(${APP_TARGET} PRIVATE "${CMAKE_CURRENT_LIST_DIR}/LaunchScreen.storyboard")
set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/LaunchScreen.storyboard" PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

target_sources(${APP_TARGET} PRIVATE "${CMAKE_CURRENT_LIST_DIR}/Images.xcassets")
set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/Images.xcassets" PROPERTIES
    MACOSX_PACKAGE_LOCATION Resources
)

list(APPEND app_icon_set "${CMAKE_CURRENT_LIST_DIR}/Images.xcassets/AppIcon.appiconset")
list(APPEND app_icon_set "${CMAKE_CURRENT_LIST_DIR}/Images.xcassets/Contents.json")
set_source_files_properties(${app_icon_set} PROPERTIES
    MACOSX_PACKAGE_LOCATION Resources/Images.xcassets
)

file(GLOB app_icon_files CONFIGURE_DEPENDS "${CMAKE_CURRENT_LIST_DIR}/Images.xcassets/AppIcon.appiconset/*.png")
list(APPEND app_icon_files "${CMAKE_CURRENT_LIST_DIR}/Images.xcassets/AppIcon.appiconset/Contents.json")
set_source_files_properties(${app_icon_set} PROPERTIES
    MACOSX_PACKAGE_LOCATION Resources/Images.xcassets/AppIcon.appiconset
)
