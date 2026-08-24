pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.resources
import "widgets"

Variants {
    id: root
    model: Quickshell.screens

    delegate: PanelWindow {
        id: cornerWindow
        required property var modelData
        screen: modelData

        WlrLayershell.layer: WlrLayer.Top
        WlrLayershell.exclusiveZone: -1
        WlrLayershell.namespace: "march-shell-frame"

        color: "transparent"
        visible: true

        readonly property real frameLeft: Options.disabledHeight
        readonly property real frameTop: Options.barPosition === BarEdge.Top ? Options.barHeight : Options.disabledHeight
        readonly property real frameRight: width - Options.disabledHeight
        readonly property real frameBottom: height - (Options.barPosition === BarEdge.Bottom ? Options.barHeight : Options.disabledHeight)
        readonly property real frameRadius: Options.rounding

        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        PanelWindow {
            screen: modelData
            color: "transparent"
            visible: true

            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.namespace: "quickshell-horizontal-bezel-spacer"
            WlrLayershell.exclusiveZone: Options.disabledHeight

            anchors {
                left: true
                right: true
                top: Options.barPosition === BarEdge.Bottom
                bottom: Options.barPosition === BarEdge.Top
            }

            implicitHeight: Options.disabledHeight
        }

        PanelWindow {
            screen: modelData
            color: "transparent"
            visible: true

            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.namespace: "quickshell-frame-spacer"
            WlrLayershell.exclusiveZone: Options.disabledHeight

            anchors {
                left: true
                top: true
                bottom: true
            }

            implicitWidth: Options.disabledHeight
        }

        PanelWindow {
            screen: modelData
            color: "transparent"
            visible: true

            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.namespace: "quickshell-bezel-spacer"
            WlrLayershell.exclusiveZone: Options.disabledHeight

            anchors {
                right: true
                top: true
                bottom: true
            }

            implicitWidth: Options.disabledHeight
        }

        mask: Region {
            item: frameMask
            intersection: Intersection.Xor
        }

        Item {
            id: frameMask
            anchors.fill: parent

            Item {
                id: frameLayer
                anchors.fill: parent

                Rectangle {
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: parent.top
                    }
                    height: cornerWindow.frameTop
                    color: Theme.surface
                }

                Rectangle {
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    height: parent.height - cornerWindow.frameBottom
                    color: Theme.surface
                }

                Rectangle {
                    x: 0
                    y: cornerWindow.frameTop
                    width: cornerWindow.frameLeft
                    height: cornerWindow.frameBottom - cornerWindow.frameTop
                    color: Theme.surface
                }

                Rectangle {
                    x: cornerWindow.frameRight
                    y: cornerWindow.frameTop
                    width: parent.width - cornerWindow.frameRight
                    height: cornerWindow.frameBottom - cornerWindow.frameTop
                    color: Theme.surface
                }

                InnerCorner {
                    corner: InnerCorner.TopLeft
                    x: cornerWindow.frameLeft
                    y: cornerWindow.frameTop
                    size: cornerWindow.frameRadius
                    color: Theme.surface
                }

                InnerCorner {
                    corner: InnerCorner.TopRight
                    x: cornerWindow.frameRight - cornerWindow.frameRadius
                    y: cornerWindow.frameTop
                    size: cornerWindow.frameRadius
                    color: Theme.surface
                }

                InnerCorner {
                    corner: InnerCorner.BottomRight
                    x: cornerWindow.frameRight - cornerWindow.frameRadius
                    y: cornerWindow.frameBottom - cornerWindow.frameRadius
                    size: cornerWindow.frameRadius
                    color: Theme.surface
                }

                InnerCorner {
                    corner: InnerCorner.BottomLeft
                    x: cornerWindow.frameLeft
                    y: cornerWindow.frameBottom - cornerWindow.frameRadius
                    size: cornerWindow.frameRadius
                    color: Theme.surface
                }
            }
        }
    }
}
