pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.resources

Variants {
    id: root
    property bool opened: false
    signal closeRequested()

    model: Quickshell.screens

    delegate: PanelWindow {
        visible: root.opened
        required property var modelData

        screen: modelData

        color: "transparent"
        WlrLayershell.layer: WlrLayer.Top
        WlrLayershell.exclusiveZone: -1
        WlrLayershell.namespace: "march-shell-config-menu"
        implicitWidth: Options.configPanelWidth + Options.disabledHeight
        implicitHeight: 300 + Options.rounding * 2

        anchors {
            right: true
        }

        Rectangle {
            id: panel
            anchors {
                top: parent.top
                bottom: parent.bottom
                right: parent.right
                rightMargin: Options.disabledHeight
                topMargin: Options.rounding
                bottomMargin: Options.rounding
            }

            topLeftRadius: Options.rounding
            bottomLeftRadius: Options.rounding
            width: Options.configPanelWidth
            color: Theme.surface

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onExited: {
                    root.closeRequested()
                }
            }
        }

        InnerCorner {
            corner: InnerCorner.BottomRight
            x: panel.x + panel.width - width
            y: panel.y - height
            size: Options.rounding
            color: Theme.surface
        }

        InnerCorner {
            corner: InnerCorner.TopRight
            x: panel.x + panel.width - width
            y: panel.y + panel.height
            size: Options.rounding
            color: Theme.surface
        }
    }
}
