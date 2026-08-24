pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.resources

Variants {
    id: root
    property bool showWidget: false

    model: Quickshell.screens

    delegate: PanelWindow {
        id: popout
        WlrLayershell.layer: WlrLayer.Top
        WlrLayershell.exclusiveZone: -1

        property var modelData
        property bool isExtended: false

        screen: modelData
        color: Theme.surface
        implicitWidth: isExtended ? 25 : Options.disabledHeight
        implicitHeight: 300 + Options.rounding * 2
        anchors {
            right: true
        }

        MouseArea {
            id: anchorArea
            anchors.fill: parent
            hoverEnabled: true
            onContainsMouseChanged: {
                popout.isExtended = !popout.isExtended
            }

            onClicked: {
                root.showWidget = !root.showWidget
            }
        }
    }
}
