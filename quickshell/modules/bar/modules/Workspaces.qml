pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Hyprland
import qs.resources

Rectangle {
    id: root

    property int workspaceCount: 10
    property int startWorkspace: 1
    property int workspaceWidth: 24
    property int workspaceHeight: 24
    property int workspaceSpacing: 0
    property color textColor: Theme.foreground
    property color backgroundColor: Theme.workspace_surface
    property color occupiedColor: Theme.workspace_occupied
    property color hoverColor: activeColor
    property color activeColor: Theme.rose_dim
    property int animationDuration: 280

    anchors.verticalCenter: parent.verticalCenter
    implicitWidth: row.implicitWidth
    implicitHeight: workspaceHeight
    width: implicitWidth
    color: backgroundColor
    radius: width / 2

    Row {
        id: row
        anchors.centerIn: parent
        spacing: root.workspaceSpacing

        function workspaceAt(workspaceId) {
            for (let i = 0; i < Hyprland.workspaces.values.length; i++) {
                const workspace = Hyprland.workspaces.values[i];

                if (workspace.id === workspaceId) {
                    return workspace;
                }
            }

            return null;
        }

        function workspaceOccupied(workspace) {
            return workspace !== null && workspace.toplevels && workspace.toplevels.values.length > 0;
        }

        function switchToWorkspace(workspaceId) {
            Hyprland.dispatch("hl.dsp.focus({ workspace = " + workspaceId + " })");
        }

        Repeater {
            model: root.workspaceCount

            delegate: Item {
                id: workspaceButton

                required property int index
                readonly property int workspaceId: root.startWorkspace + index
                readonly property int firstWorkspaceId: root.startWorkspace
                readonly property int lastWorkspaceId: root.startWorkspace + root.workspaceCount - 1
                readonly property var workspace: row.workspaceAt(workspaceId)
                readonly property bool active: Hyprland.focusedWorkspace && Hyprland.focusedWorkspace.id === workspaceId
                readonly property bool occupied: row.workspaceOccupied(workspace)
                readonly property bool leftOccupied: workspaceId > firstWorkspaceId && row.workspaceOccupied(row.workspaceAt(workspaceId - 1))
                readonly property bool rightOccupied: workspaceId < lastWorkspaceId && row.workspaceOccupied(row.workspaceAt(workspaceId + 1))
                readonly property bool mergeLeft: occupied && leftOccupied
                readonly property bool mergeRight: occupied && rightOccupied
                readonly property bool urgent: workspace ? workspace.urgent : false
                readonly property bool hasFullscreen: workspace ? workspace.hasFullscreen : false

                width: root.workspaceWidth
                height: root.height

                Rectangle {
                    id: leftConnector
                    x: parent.width / 2 - width
                    anchors.verticalCenter: parent.verticalCenter
                    width: workspaceButton.mergeLeft ? parent.width / 2 + root.workspaceSpacing : 0
                    height: 24
                    color: root.occupiedColor
                    opacity: occupiedBase.opacity
                    radius: 0
                    antialiasing: true

                    Behavior on width {
                        NumberAnimation {
                            duration: root.animationDuration
                            easing.type: Easing.OutCubic
                        }
                    }

                    Behavior on opacity {
                        NumberAnimation {
                            duration: root.animationDuration
                            easing.type: Easing.OutCubic
                        }
                    }
                }

                Rectangle {
                    id: rightConnector
                    x: parent.width / 2
                    anchors.verticalCenter: parent.verticalCenter
                    width: workspaceButton.mergeRight ? parent.width / 2 + root.workspaceSpacing : 0
                    height: 24
                    color: root.occupiedColor
                    opacity: occupiedBase.opacity
                    radius: 0
                    antialiasing: true

                    Behavior on width {
                        NumberAnimation {
                            duration: root.animationDuration
                            easing.type: Easing.OutCubic
                        }
                    }

                    Behavior on opacity {
                        NumberAnimation {
                            duration: root.animationDuration
                            easing.type: Easing.OutCubic
                        }
                    }
                }

                Rectangle {
                    id: occupiedBase
                    anchors.centerIn: parent
                    width: workspaceButton.occupied ? 24 : 13
                    height: width
                    radius: width / 2
                    color: workspaceButton.occupied ? root.occupiedColor : root.backgroundColor
                    opacity: workspaceButton.occupied ? 1 : 0.45
                    antialiasing: true

                    Behavior on opacity {
                        NumberAnimation {
                            duration: root.animationDuration
                            easing.type: Easing.OutCubic
                        }
                    }

                    Behavior on width {
                        NumberAnimation {
                            duration: root.animationDuration
                            easing.type: Easing.OutCubic
                        }
                    }

                    Behavior on color {
                        ColorAnimation {
                            duration: root.animationDuration
                        }
                    }
                }

                Rectangle {
                    id: activeOverlay
                    anchors.centerIn: parent
                    width: 24
                    height: 24
                    radius: width / 2
                    color: root.hoverColor
                    opacity: workspaceButton.active || mouseArea.containsMouse ? 1 : 0
                    antialiasing: true

                    Behavior on opacity {
                        NumberAnimation {
                            duration: root.animationDuration
                            easing.type: Easing.OutCubic
                        }
                    }
                }

                Text {
                    anchors.fill: activeOverlay

                    visible: workspaceButton.active
                    color: workspaceButton.active ? root.backgroundColor : root.textColor
                    text: workspaceButton.workspaceId
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pixelSize: 14
                }

                Rectangle {
                    anchors.centerIn: parent
                    visible: !workspaceButton.active

                    width: workspaceButton.occupied ? 7 : 5
                    height: width
                    radius: 4
                    color: mouseArea.containsMouse ? root.backgroundColor : root.textColor
                    opacity: workspaceButton.occupied ? 0.85 : 0.55
                    antialiasing: true

                    Behavior on width {
                        NumberAnimation {
                            duration: root.animationDuration
                            easing.type: Easing.OutCubic
                        }
                    }

                    Behavior on opacity {
                        NumberAnimation {
                            duration: root.animationDuration
                            easing.type: Easing.OutCubic
                        }
                    }
                }

                MouseArea {
                    id: mouseArea
                    hoverEnabled: true
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: row.switchToWorkspace(workspaceButton.workspaceId)
                }
            }
        }
    }
}
