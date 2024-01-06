import QtQuick
import QtQuick.Window
import DebugTools

Window {
    id: window
    visible: true
    opacity: 0

    NumberAnimation on opacity {
        from: 0
        to: 1
        duration: 300
        running: true
    }

    MouseArea {
      anchors.fill: parent
      onClicked: forceActiveFocus()
    }

    Column {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            color: "red"
            width: window.width;
            height: window.height / 3

            Column {
                anchors.centerIn: parent
                spacing: 0

                TextEdit {
                    width: screen.width
                    text: "Open keyboard"
                    font.pointSize: 16
                    color: "white"
                    horizontalAlignment: TextEdit.AlignHCenter
                }

                Text {
                    id: orientation
                    text: "Orientation"
                    font.pointSize: 16
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    width: window.width;

                    Screen.onOrientationChanged: {
                        switch(Screen.orientation) {
                            case Qt.PrimaryOrientation:
                                orientation.text = "Primary";
                                break;
                            case Qt.LandscapeOrientation:
                                orientation.text = "Landscape";
                                break;
                            case Qt.PortraitOrientation:
                                orientation.text = "Portrait";
                                break;
                            case Qt.InvertedLandscapeOrientation:
                                orientation.text = "InvertedLandscape";
                                break;
                            case Qt.InvertedPortraitOrientation:
                                orientation.text = "InvertedPortrait";
                                break;
                            default:
                                orientation.text = "Unknown";
                        }
                    }
                }
            }
        }

        Rectangle {
            color: "darkorange"
            width: window.width
            height: window.height / 3

            Flickable {
                contentHeight: content.contentHeight
                anchors.fill: parent
                clip: true

                Text {
                    id: content
                    width: parent.width
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                    color: "black"
                    wrapMode: Text.WordWrap
                    font.pointSize: 14
                    renderType: Text.NativeRendering
                }
            }
        }

        Rectangle {
            color: "green"
            width: window.width
            height: window.height / 3
        }
    }

    Rectangle {
        id: fps
        width: 100
        height: 100
        color: "white"
        border.color: "gray"
        border.width: 2
        opacity: 0.6

        FPSMeter {
            id: fpsMeter
        }

        Text {
            text: `FPS: ${fpsMeter.fps}`
            font.pointSize: 16
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            renderType: Text.NativeRendering
            color: "gray"
            anchors.centerIn: fps
        }

        MouseArea {
            anchors.fill: fps
            drag.target: fps
            drag.axis: Drag.XAndYAxis
            drag.minimumX: 0
            drag.maximumX: window.width - fps.width
            drag.minimumY: 0
            drag.maximumY: window.height - fps.height
        }
    }
}
