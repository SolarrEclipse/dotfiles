import Quickshell
import QtQuick
import qs.resources

Rectangle {
    color: hoverArea.containsMouse ? Theme.background_hover : Theme.element_alt
    width: 30
    radius: 15

    Behavior on color {
        ColorAnimation { duration: 150 }
    }

    Text {
        anchors.fill: parent
        anchors.rightMargin: 3
        color: hoverArea.containsMouse ? Theme.active_widget_text : Theme.foreground
        text: "󰣇"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 20

        Behavior on color {
            ColorAnimation { duration: 150 }
        }
    }

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: Quickshell.execDetached(["rofi", "-show", "drun"])
    }
}
