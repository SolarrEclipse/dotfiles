import QtQuick
import qs.resources
import "modules"

Row {
    id: root

    property int section: BarItemPosition.Left
    height: parent ? parent.height : Options.barHeight
    spacing: Options.widget_spacing

    AppLauncher {
        visible: Options.appLauncherPosition === root.section
        height: parent.height - 10
        anchors.verticalCenter: parent.verticalCenter
    }

    Workspaces {
        visible: Options.workspacesPosition === root.section
        textColor: Theme.foreground
        backgroundColor: Theme.workspace_surface
        hoverColor: Theme.rose
        activeColor: Theme.rose
    }

    ClockWidget {
        visible: Options.clockPosition === root.section
        color: Theme.foreground
    }
}
