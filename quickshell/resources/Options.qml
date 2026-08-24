pragma Singleton

import QtQuick

QtObject {
    property int barHeight: 35
    property int disabledHeight: 8
    property int rounding: 16
    property int widget_spacing: 8
    property int configPanelWidth: 250

    property int colorMode: ColorPref.Dark

    property int barPosition: BarEdge.Top

    property int appLauncherPosition: BarItemPosition.Left
    property int workspacesPosition: BarItemPosition.Left
    property int clockPosition: BarItemPosition.Center
}
