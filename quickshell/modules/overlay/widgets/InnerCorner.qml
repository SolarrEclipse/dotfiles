import QtQuick
import QtQuick.Shapes

Item {
    id: root

    enum Corner {
        TopLeft,
        TopRight,
        BottomRight,
        BottomLeft
    }

    property int corner: InnerCorner.TopLeft
    property real size: 12
    property color color: "white"
    readonly property real curveControl: size * 0.5522847498

    width: size
    height: size

    Shape {
        anchors.fill: parent
        preferredRendererType: Shape.CurveRenderer

        transform: Scale {
            origin.x: root.size / 2
            origin.y: root.size / 2
            xScale: root.corner === InnerCorner.TopRight || root.corner === InnerCorner.BottomRight ? -1 : 1
            yScale: root.corner === InnerCorner.BottomLeft || root.corner === InnerCorner.BottomRight ? -1 : 1
        }

        ShapePath {
            fillColor: root.color
            strokeColor: "transparent"
            strokeWidth: 0
            startX: 0
            startY: 0

            PathLine {
                x: root.size
                y: 0
            }

            PathCubic {
                control1X: root.size - root.curveControl
                control1Y: 0
                control2X: 0
                control2Y: root.size - root.curveControl
                x: 0
                y: root.size
            }

            PathLine {
                x: 0
                y: 0
            }
        }
    }
}
