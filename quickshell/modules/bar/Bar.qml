import Quickshell
import QtQuick
import qs.resources
import "modules"

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            anchors {
                left: true
                right: true
                top: Options.barPosition === BarEdge.Top
                bottom: Options.barPosition === BarEdge.Bottom
            }

            color: Theme.surface
            implicitHeight: Options.barHeight

            BarSection {
                section: BarItemPosition.Left
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 8
                }
            }

            BarSection {
                section: BarItemPosition.Center
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }

            BarSection {
                section: BarItemPosition.Right
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 8
                }
            }
        }
    }
}
