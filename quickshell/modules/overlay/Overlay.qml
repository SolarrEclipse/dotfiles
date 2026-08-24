import QtQuick
import Quickshell
import "widgets"

Scope {
    Frame {}

    ConfigMenu {
        opened: widgetAnchor.showWidget
        onCloseRequested: widgetAnchor.showWidget = false
    }

    WidgetAnchor {
        id: widgetAnchor
    }
}
